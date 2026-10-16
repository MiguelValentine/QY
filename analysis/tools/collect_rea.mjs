import { Client } from "/Users/miguel/.local/lib/node_modules/rea-agents/node_modules/@modelcontextprotocol/client/dist/index.mjs";
import { StdioClientTransport } from "/Users/miguel/.local/lib/node_modules/rea-agents/node_modules/@modelcontextprotocol/client/dist/stdio.mjs";
import { mkdir, readFile, writeFile } from "node:fs/promises";
import path from "node:path";
import { execFile } from "node:child_process";
import { promisify } from "node:util";

const root = "/Users/miguel/Desktop/QY";
const out = path.join(root, "analysis/evidence");
const node = "/Users/miguel/.cache/codex-runtimes/codex-primary-runtime/dependencies/node/bin/node";
const client = new Client({ name: "qy-static-investigation", version: "1.0.0" });
const transport = new StdioClientTransport({
  command: node,
  args: ["/Users/miguel/.local/lib/node_modules/rea-agents/scripts/rea.mjs", "mcp"],
  env: { ...process.env, REA_OBJDUMP_COMMAND: "/opt/homebrew/opt/binutils/bin/gobjdump" },
  stderr: "pipe",
});
transport.stderr?.on("data", (data) => process.stderr.write(data));
await mkdir(out, { recursive: true });
await mkdir(path.join(root, "analysis/disassembly"), { recursive: true });
const index = [];
try {
  await client.connect(transport);
  const catalog = await client.listTools();
  const selected = ["binary_session", "inspect_with_objdump", "inspect_pe_resources", "inspect_managed_artifact"];
  await writeFile(path.join(out, "rea-tool-schemas.json"), JSON.stringify(catalog.tools.filter(t => selected.includes(t.name)), null, 2));
  if (process.argv.includes("--schemas-only")) process.exitCode = 0;
  else {
    const targets = [
      ["fcruner", "CLIENT/fcruner.exe"],
      ["fbase", "CLIENT/fbase.dll"],
      ["objsys", "CLIENT/objsys.dll"],
      ["showdown", "CLIENT/service/templeflower/bin/showdown.dll"],
      ["pacmandll", "CLIENT/service/onepusonenew/game/pacman/bin/pacmandll.dll"],
      ["launcher", "CLIENT/帅哥奇域.EXE"],
    ];
    for (const [label, relative] of targets) {
      for (const [tool, extra, suffix] of [
        ["inspect_with_objdump", { operation: "file_headers" }, "headers"],
        ["inspect_with_objdump", { operation: "disassemble" }, "disassembly"],
        ["inspect_pe_resources", {}, "resources"],
      ]) {
        const filename = `${label}-${suffix}.json`;
        let result;
        try {
          result = JSON.parse(await readFile(path.join(out, filename), "utf8"));
        } catch {
          result = await client.callTool({ name: tool, arguments: { path: path.join(root, relative), ...extra } }, undefined, { timeout: 120000 });
          await writeFile(path.join(out, filename), JSON.stringify(result, null, 2));
        }
        if (result.isError && suffix === "disassembly") {
          // CLI 流式输出完整证据，不受 MCP 的 10 MiB 单帧限制。
          const { stdout } = await promisify(execFile)(
            node,
            ["/Users/miguel/.local/lib/node_modules/rea-agents/scripts/rea.mjs", "inspect-with-objdump", path.join(root, relative), "disassemble", "--json"],
            { env: { ...process.env, REA_OBJDUMP_COMMAND: "/opt/homebrew/opt/binutils/bin/gobjdump" }, maxBuffer: 128 * 1024 * 1024, timeout: 120000 },
          );
          const evidence = JSON.parse(stdout);
          result = { content: [], structuredContent: evidence };
          await writeFile(path.join(out, filename), JSON.stringify(result, null, 2));
        }
        const texts = result.content?.filter(c => c.type === "text").map(c => c.text) ?? [];
        let parsed = result.structuredContent;
        if (!parsed && texts.length === 1) {
          try { parsed = JSON.parse(texts[0]); } catch {}
        }
        if (suffix === "disassembly" && parsed) {
          const findStdout = (value) => {
            if (!value || typeof value !== "object") return null;
            if (typeof value.stdout === "string") return value.stdout;
            for (const child of Object.values(value)) {
              const found = findStdout(child);
              if (found !== null) return found;
            }
            return null;
          };
          const stdout = findStdout(parsed);
          if (stdout !== null) await writeFile(path.join(root, `analysis/disassembly/${label}.asm`), stdout);
        }
        index.push({ label, path: relative, tool, operation: extra.operation ?? null, file: filename, error: result.isError ?? false });
        console.log(`${label}: ${suffix}: ${result.isError ? "ERROR" : "saved"}`);
      }
    }
    await writeFile(path.join(out, "rea-index.json"), JSON.stringify(index, null, 2));
  }
} finally {
  await client.close();
}
