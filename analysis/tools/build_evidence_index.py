#!/usr/bin/env python3
"""验证留存的 REA 证据并解析本地 PE 导入依赖。"""
import hashlib
import json
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / "analysis/evidence"
inventory = json.loads((OUT / "pe-inventory.json").read_text())
modules = {Path(m["path"]).name.lower(): m for m in inventory["files"]}
manifest = []
for item in json.loads((OUT / "rea-index.json").read_text()):
    record = json.loads((OUT / item["file"]).read_text())["structuredContent"]
    result = record.get("normalized_result", {})
    subject = record["subject"]
    actual = hashlib.sha256(Path(subject["local_path"]).read_bytes()).hexdigest()
    assert actual == subject["digest"]["sha256"], item["file"]
    assert not result.get("output_truncated", False), item["file"]
    assert not result.get("artifact_changed", False), item["file"]
    if "exit_code" in result:
        assert result["exit_code"] == 0, item["file"]
    manifest.append({
        **item,
        "evidence_id": record["evidence_id"],
        "sha256": actual,
        "provider": record["provider"],
        "completion_status": result.get("completion_status"),
        "output_truncated": result.get("output_truncated"),
        "limitations": record.get("limitations", []),
    })

graph = []
for module in inventory["files"]:
    actual = hashlib.sha256((ROOT / "CLIENT" / module["path"]).read_bytes()).hexdigest()
    assert actual == module["sha256"], module["path"]
    grouped = {}
    for entry in module["imports"]:
        library = entry["library"].lower()
        grouped.setdefault(library, []).append(entry)
    for library, imports in grouped.items():
        target = modules.get(library)
        resolved = []
        if target:
            by_ord = {e["ordinal"]: e for e in target["exports"]}
            by_name = {e["name"]: e for e in target["exports"] if e["name"]}
            for entry in imports:
                export = by_name.get(entry["name"]) if entry["name"] else by_ord.get(entry["ordinal"])
                assert export, (module["path"], entry)
                resolved.append({**entry, "target_va": export["va"], "target_rva": export["rva"]})
        graph.append({
            "from": module["path"], "to": target["path"] if target else library,
            "kind": "static_import", "local": target is not None,
            "import_count": len(imports), "resolved_imports": resolved,
        })
graph.extend([
    {"from": "fcruner.exe", "to": "objsys.dll", "kind": "dynamic_load",
     "callsite_va": "0x40296c", "exports": ["StdInitFancyBox", "StdCmdFancyBox"]},
    {"from": "objsys.dll", "to": "caller_selected_user_dll", "kind": "dynamic_load",
     "callsite_va": "0x1006084a", "exports": ["GetUserClassInfo"],
     "limitation": "Does not establish which supplied plugin a particular FCC loads."},
])
summary = {
    "validated_pe_count": len(modules), "validated_rea_record_count": len(manifest),
    "static_local_edges": [e for e in graph if e["kind"] == "static_import" and e["local"]],
    "all_artifact_hashes_match": True, "all_objdump_outputs_complete": True,
    "fcc_count": len(list((ROOT / "CLIENT").rglob("*.fcc"))),
    "imports_by_module": {
        m["path"]: dict(Counter(i["library"] for i in m["imports"]))
        for m in inventory["files"]
    },
}
for filename, document in [
    ("evidence-manifest.json", manifest),
    ("dependency-graph.json", graph),
    ("verification.json", summary),
]:
    (OUT / filename).write_text(json.dumps(document, ensure_ascii=False, indent=2) + "\n")
print(f"Validated {len(modules)} PE files and {len(manifest)} REA records.")
print("All supplied local static imports resolve; artifact hashes match.")
