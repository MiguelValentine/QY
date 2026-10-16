
/Users/miguel/Desktop/QY/CLIENT/fcruner.exe:     file format pei-i386


Disassembly of section .text:

00401000 <.text>:
  401000:	83 79 04 01          	cmpl   $0x1,0x4(%ecx)
  401004:	7c 06                	jl     0x40100c
  401006:	8b 01                	mov    (%ecx),%eax
  401008:	85 c0                	test   %eax,%eax
  40100a:	75 05                	jne    0x401011
  40100c:	a1 40 04 41 00       	mov    0x410440,%eax
  401011:	c3                   	ret
  401012:	cc                   	int3
  401013:	cc                   	int3
  401014:	cc                   	int3
  401015:	cc                   	int3
  401016:	cc                   	int3
  401017:	cc                   	int3
  401018:	cc                   	int3
  401019:	cc                   	int3
  40101a:	cc                   	int3
  40101b:	cc                   	int3
  40101c:	cc                   	int3
  40101d:	cc                   	int3
  40101e:	cc                   	int3
  40101f:	cc                   	int3
  401020:	81 ec 00 02 00 00    	sub    $0x200,%esp
  401026:	53                   	push   %ebx
  401027:	56                   	push   %esi
  401028:	57                   	push   %edi
  401029:	ff 15 14 d0 40 00    	call   *0x40d014  ; 0x40d014=COMCTL32.dll!#17
  40102f:	8b bc 24 10 02 00 00 	mov    0x210(%esp),%edi
  401036:	8b 1d d8 d1 40 00    	mov    0x40d1d8,%ebx  ; 0x40d1d8=USER32.dll!GetSystemMetrics
  40103c:	6a 00                	push   $0x0
  40103e:	89 3d 6c 0c 41 00    	mov    %edi,0x410c6c
  401044:	ff d3                	call   *%ebx
  401046:	2d 20 03 00 00       	sub    $0x320,%eax
  40104b:	99                   	cltd
  40104c:	2b c2                	sub    %edx,%eax
  40104e:	8b f0                	mov    %eax,%esi
  401050:	6a 01                	push   $0x1
  401052:	d1 fe                	sar    $1,%esi
  401054:	ff d3                	call   *%ebx
  401056:	6a 00                	push   $0x0
  401058:	57                   	push   %edi
  401059:	6a 00                	push   $0x0
  40105b:	6a 00                	push   $0x0
  40105d:	2d 58 02 00 00       	sub    $0x258,%eax
  401062:	68 58 02 00 00       	push   $0x258
  401067:	99                   	cltd
  401068:	68 20 03 00 00       	push   $0x320
  40106d:	2b c2                	sub    %edx,%eax
  40106f:	d1 f8                	sar    $1,%eax
  401071:	50                   	push   %eax
  401072:	56                   	push   %esi
  401073:	68 00 00 cf 00       	push   $0xcf0000
  401078:	68 0c d2 40 00       	push   $0x40d20c  ; 0x40d20c='FcBox II'
  40107d:	68 08 0c 41 00       	push   $0x410c08
  401082:	6a 00                	push   $0x0
  401084:	ff 15 dc d1 40 00    	call   *0x40d1dc  ; 0x40d1dc=USER32.dll!CreateWindowExA
  40108a:	8b f0                	mov    %eax,%esi
  40108c:	85 f6                	test   %esi,%esi
  40108e:	75 0a                	jne    0x40109a
  401090:	5f                   	pop    %edi
  401091:	5e                   	pop    %esi
  401092:	5b                   	pop    %ebx
  401093:	81 c4 00 02 00 00    	add    $0x200,%esp
  401099:	c3                   	ret
  40109a:	68 00 02 00 00       	push   $0x200
  40109f:	8d 44 24 10          	lea    0x10(%esp),%eax
  4010a3:	50                   	push   %eax
  4010a4:	57                   	push   %edi
  4010a5:	c7 05 e4 0c 41 00 03 	movl   $0x3,0x410ce4
  4010ac:	00 00 00 
  4010af:	ff 15 24 d1 40 00    	call   *0x40d124  ; 0x40d124=KERNEL32.dll!GetModuleFileNameA
  4010b5:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
  4010b9:	51                   	push   %ecx
  4010ba:	68 00 d2 40 00       	push   $0x40d200  ; 0x40d200='runerpath'
  4010bf:	68 f8 d1 40 00       	push   $0x40d1f8  ; 0x40d1f8='fcbox2'
  4010c4:	e8 57 07 00 00       	call   0x401820
  4010c9:	83 c4 0c             	add    $0xc,%esp
  4010cc:	56                   	push   %esi
  4010cd:	57                   	push   %edi
  4010ce:	b9 70 0c 41 00       	mov    $0x410c70,%ecx
  4010d3:	e8 08 17 00 00       	call   0x4027e0
  4010d8:	8b 94 24 14 02 00 00 	mov    0x214(%esp),%edx
  4010df:	6a 00                	push   $0x0
  4010e1:	56                   	push   %esi
  4010e2:	89 15 00 0c 41 00    	mov    %edx,0x410c00
  4010e8:	ff 15 e0 d1 40 00    	call   *0x40d1e0  ; 0x40d1e0=USER32.dll!ShowWindow
  4010ee:	6a 00                	push   $0x0
  4010f0:	6a 64                	push   $0x64
  4010f2:	68 e8 03 00 00       	push   $0x3e8
  4010f7:	56                   	push   %esi
  4010f8:	ff 15 e4 d1 40 00    	call   *0x40d1e4  ; 0x40d1e4=USER32.dll!SetTimer
  4010fe:	56                   	push   %esi
  4010ff:	ff 15 74 d1 40 00    	call   *0x40d174  ; 0x40d174=USER32.dll!UpdateWindow
  401105:	5f                   	pop    %edi
  401106:	5e                   	pop    %esi
  401107:	b8 01 00 00 00       	mov    $0x1,%eax
  40110c:	5b                   	pop    %ebx
  40110d:	81 c4 00 02 00 00    	add    $0x200,%esp
  401113:	c3                   	ret
  401114:	cc                   	int3
  401115:	cc                   	int3
  401116:	cc                   	int3
  401117:	cc                   	int3
  401118:	cc                   	int3
  401119:	cc                   	int3
  40111a:	cc                   	int3
  40111b:	cc                   	int3
  40111c:	cc                   	int3
  40111d:	cc                   	int3
  40111e:	cc                   	int3
  40111f:	cc                   	int3
  401120:	53                   	push   %ebx
  401121:	56                   	push   %esi
  401122:	6a f0                	push   $0xfffffff0
  401124:	57                   	push   %edi
  401125:	8b d8                	mov    %eax,%ebx
  401127:	8b f1                	mov    %ecx,%esi
  401129:	ff 15 cc d1 40 00    	call   *0x40d1cc  ; 0x40d1cc=USER32.dll!GetWindowLongA
  40112f:	8b 54 24 0c          	mov    0xc(%esp),%edx
  401133:	f7 d6                	not    %esi
  401135:	23 f0                	and    %eax,%esi
  401137:	0b f2                	or     %edx,%esi
  401139:	3b c6                	cmp    %esi,%eax
  40113b:	75 05                	jne    0x401142
  40113d:	5e                   	pop    %esi
  40113e:	33 c0                	xor    %eax,%eax
  401140:	5b                   	pop    %ebx
  401141:	c3                   	ret
  401142:	56                   	push   %esi
  401143:	6a f0                	push   $0xfffffff0
  401145:	57                   	push   %edi
  401146:	ff 15 d0 d1 40 00    	call   *0x40d1d0  ; 0x40d1d0=USER32.dll!SetWindowLongA
  40114c:	85 db                	test   %ebx,%ebx
  40114e:	74 15                	je     0x401165
  401150:	83 cb 17             	or     $0x17,%ebx
  401153:	53                   	push   %ebx
  401154:	6a 00                	push   $0x0
  401156:	6a 00                	push   $0x0
  401158:	6a 00                	push   $0x0
  40115a:	6a 00                	push   $0x0
  40115c:	6a 00                	push   $0x0
  40115e:	57                   	push   %edi
  40115f:	ff 15 d4 d1 40 00    	call   *0x40d1d4  ; 0x40d1d4=USER32.dll!SetWindowPos
  401165:	5e                   	pop    %esi
  401166:	b8 01 00 00 00       	mov    $0x1,%eax
  40116b:	5b                   	pop    %ebx
  40116c:	c3                   	ret
  40116d:	cc                   	int3
  40116e:	cc                   	int3
  40116f:	cc                   	int3
  401170:	85 c0                	test   %eax,%eax
  401172:	53                   	push   %ebx
  401173:	57                   	push   %edi
  401174:	8b 3d cc d1 40 00    	mov    0x40d1cc,%edi  ; 0x40d1cc=USER32.dll!GetWindowLongA
  40117a:	6a f0                	push   $0xfffffff0
  40117c:	56                   	push   %esi
  40117d:	74 50                	je     0x4011cf
  40117f:	ff d7                	call   *%edi
  401181:	8b 1d d0 d1 40 00    	mov    0x40d1d0,%ebx  ; 0x40d1d0=USER32.dll!SetWindowLongA
  401187:	8b c8                	mov    %eax,%ecx
  401189:	81 e1 ff ff 3f ff    	and    $0xff3fffff,%ecx
  40118f:	3b c1                	cmp    %ecx,%eax
  401191:	74 06                	je     0x401199
  401193:	51                   	push   %ecx
  401194:	6a f0                	push   $0xfffffff0
  401196:	56                   	push   %esi
  401197:	ff d3                	call   *%ebx
  401199:	6a f0                	push   $0xfffffff0
  40119b:	56                   	push   %esi
  40119c:	ff d7                	call   *%edi
  40119e:	8b c8                	mov    %eax,%ecx
  4011a0:	81 e1 ff ff fb ff    	and    $0xfffbffff,%ecx
  4011a6:	3b c1                	cmp    %ecx,%eax
  4011a8:	74 19                	je     0x4011c3
  4011aa:	51                   	push   %ecx
  4011ab:	6a f0                	push   $0xfffffff0
  4011ad:	56                   	push   %esi
  4011ae:	ff d3                	call   *%ebx
  4011b0:	6a 17                	push   $0x17
  4011b2:	6a 00                	push   $0x0
  4011b4:	6a 00                	push   $0x0
  4011b6:	6a 00                	push   $0x0
  4011b8:	6a 00                	push   $0x0
  4011ba:	6a 00                	push   $0x0
  4011bc:	56                   	push   %esi
  4011bd:	ff 15 d4 d1 40 00    	call   *0x40d1d4  ; 0x40d1d4=USER32.dll!SetWindowPos
  4011c3:	6a 03                	push   $0x3
  4011c5:	56                   	push   %esi
  4011c6:	ff 15 e0 d1 40 00    	call   *0x40d1e0  ; 0x40d1e0=USER32.dll!ShowWindow
  4011cc:	5f                   	pop    %edi
  4011cd:	5b                   	pop    %ebx
  4011ce:	c3                   	ret
  4011cf:	ff d7                	call   *%edi
  4011d1:	8b 1d d0 d1 40 00    	mov    0x40d1d0,%ebx  ; 0x40d1d0=USER32.dll!SetWindowLongA
  4011d7:	8b c8                	mov    %eax,%ecx
  4011d9:	81 c9 00 00 c0 00    	or     $0xc00000,%ecx
  4011df:	3b c1                	cmp    %ecx,%eax
  4011e1:	74 06                	je     0x4011e9
  4011e3:	51                   	push   %ecx
  4011e4:	6a f0                	push   $0xfffffff0
  4011e6:	56                   	push   %esi
  4011e7:	ff d3                	call   *%ebx
  4011e9:	6a f0                	push   $0xfffffff0
  4011eb:	56                   	push   %esi
  4011ec:	ff d7                	call   *%edi
  4011ee:	8b c8                	mov    %eax,%ecx
  4011f0:	81 c9 00 00 04 00    	or     $0x40000,%ecx
  4011f6:	3b c1                	cmp    %ecx,%eax
  4011f8:	74 06                	je     0x401200
  4011fa:	51                   	push   %ecx
  4011fb:	6a f0                	push   $0xfffffff0
  4011fd:	56                   	push   %esi
  4011fe:	ff d3                	call   *%ebx
  401200:	6a 09                	push   $0x9
  401202:	56                   	push   %esi
  401203:	ff 15 e0 d1 40 00    	call   *0x40d1e0  ; 0x40d1e0=USER32.dll!ShowWindow
  401209:	5f                   	pop    %edi
  40120a:	5b                   	pop    %ebx
  40120b:	c3                   	ret
  40120c:	cc                   	int3
  40120d:	cc                   	int3
  40120e:	cc                   	int3
  40120f:	cc                   	int3
  401210:	8b 0d 6c 0c 41 00    	mov    0x410c6c,%ecx
  401216:	83 ec 64             	sub    $0x64,%esp
  401219:	56                   	push   %esi
  40121a:	57                   	push   %edi
  40121b:	6a 64                	push   $0x64
  40121d:	8d 44 24 0c          	lea    0xc(%esp),%eax
  401221:	50                   	push   %eax
  401222:	6a 6a                	push   $0x6a
  401224:	51                   	push   %ecx
  401225:	ff 15 b8 d1 40 00    	call   *0x40d1b8  ; 0x40d1b8=USER32.dll!LoadStringA
  40122b:	8b 4c 24 74          	mov    0x74(%esp),%ecx
  40122f:	83 f9 14             	cmp    $0x14,%ecx
  401232:	0f 87 87 00 00 00    	ja     0x4012bf
  401238:	74 59                	je     0x401293
  40123a:	8b c1                	mov    %ecx,%eax
  40123c:	83 e8 02             	sub    $0x2,%eax
  40123f:	74 40                	je     0x401281
  401241:	83 e8 03             	sub    $0x3,%eax
  401244:	74 27                	je     0x40126d
  401246:	48                   	dec    %eax
  401247:	0f 85 8f 00 00 00    	jne    0x4012dc
  40124d:	8b 44 24 78          	mov    0x78(%esp),%eax
  401251:	85 c0                	test   %eax,%eax
  401253:	0f 84 bf 01 00 00    	je     0x401418
  401259:	b9 70 0c 41 00       	mov    $0x410c70,%ecx
  40125e:	e8 bd 04 00 00       	call   0x401720
  401263:	5f                   	pop    %edi
  401264:	33 c0                	xor    %eax,%eax
  401266:	5e                   	pop    %esi
  401267:	83 c4 64             	add    $0x64,%esp
  40126a:	c2 10 00             	ret    $0x10
  40126d:	b9 70 0c 41 00       	mov    $0x410c70,%ecx
  401272:	e8 c9 04 00 00       	call   0x401740
  401277:	5f                   	pop    %edi
  401278:	33 c0                	xor    %eax,%eax
  40127a:	5e                   	pop    %esi
  40127b:	83 c4 64             	add    $0x64,%esp
  40127e:	c2 10 00             	ret    $0x10
  401281:	6a 00                	push   $0x0
  401283:	ff 15 bc d1 40 00    	call   *0x40d1bc  ; 0x40d1bc=USER32.dll!PostQuitMessage
  401289:	5f                   	pop    %edi
  40128a:	33 c0                	xor    %eax,%eax
  40128c:	5e                   	pop    %esi
  40128d:	83 c4 64             	add    $0x64,%esp
  401290:	c2 10 00             	ret    $0x10
  401293:	a1 dc 0c 41 00       	mov    0x410cdc,%eax
  401298:	85 c0                	test   %eax,%eax
  40129a:	0f 85 78 01 00 00    	jne    0x401418
  4012a0:	8b 54 24 7c          	mov    0x7c(%esp),%edx
  4012a4:	8b 44 24 78          	mov    0x78(%esp),%eax
  4012a8:	8b 4c 24 70          	mov    0x70(%esp),%ecx
  4012ac:	52                   	push   %edx
  4012ad:	50                   	push   %eax
  4012ae:	6a 14                	push   $0x14
  4012b0:	51                   	push   %ecx
  4012b1:	ff 15 c0 d1 40 00    	call   *0x40d1c0  ; 0x40d1c0=USER32.dll!DefWindowProcA
  4012b7:	5f                   	pop    %edi
  4012b8:	5e                   	pop    %esi
  4012b9:	83 c4 64             	add    $0x64,%esp
  4012bc:	c2 10 00             	ret    $0x10
  4012bf:	8b c1                	mov    %ecx,%eax
  4012c1:	2d 11 01 00 00       	sub    $0x111,%eax
  4012c6:	0f 84 19 01 00 00    	je     0x4013e5
  4012cc:	83 e8 02             	sub    $0x2,%eax
  4012cf:	0f 84 e8 00 00 00    	je     0x4013bd
  4012d5:	2d bd 0a 00 00       	sub    $0xabd,%eax
  4012da:	74 1e                	je     0x4012fa
  4012dc:	8b 54 24 7c          	mov    0x7c(%esp),%edx
  4012e0:	8b 44 24 78          	mov    0x78(%esp),%eax
  4012e4:	52                   	push   %edx
  4012e5:	50                   	push   %eax
  4012e6:	51                   	push   %ecx
  4012e7:	8b 4c 24 7c          	mov    0x7c(%esp),%ecx
  4012eb:	51                   	push   %ecx
  4012ec:	ff 15 c0 d1 40 00    	call   *0x40d1c0  ; 0x40d1c0=USER32.dll!DefWindowProcA
  4012f2:	5f                   	pop    %edi
  4012f3:	5e                   	pop    %esi
  4012f4:	83 c4 64             	add    $0x64,%esp
  4012f7:	c2 10 00             	ret    $0x10
  4012fa:	8b 44 24 78          	mov    0x78(%esp),%eax
  4012fe:	83 f8 03             	cmp    $0x3,%eax
  401301:	0f 87 11 01 00 00    	ja     0x401418
  401307:	ff 24 85 24 14 40 00 	jmp    *0x401424(,%eax,4)
  40130e:	8b 74 24 70          	mov    0x70(%esp),%esi
  401312:	b8 01 00 00 00       	mov    $0x1,%eax
  401317:	e8 54 fe ff ff       	call   0x401170
  40131c:	5f                   	pop    %edi
  40131d:	33 c0                	xor    %eax,%eax
  40131f:	5e                   	pop    %esi
  401320:	83 c4 64             	add    $0x64,%esp
  401323:	c2 10 00             	ret    $0x10
  401326:	8b 74 24 70          	mov    0x70(%esp),%esi
  40132a:	33 c0                	xor    %eax,%eax
  40132c:	e8 3f fe ff ff       	call   0x401170
  401331:	5f                   	pop    %edi
  401332:	33 c0                	xor    %eax,%eax
  401334:	5e                   	pop    %esi
  401335:	83 c4 64             	add    $0x64,%esp
  401338:	c2 10 00             	ret    $0x10
  40133b:	8b 7c 24 70          	mov    0x70(%esp),%edi
  40133f:	6a f0                	push   $0xfffffff0
  401341:	57                   	push   %edi
  401342:	ff 15 cc d1 40 00    	call   *0x40d1cc  ; 0x40d1cc=USER32.dll!GetWindowLongA
  401348:	8b c8                	mov    %eax,%ecx
  40134a:	81 e1 ff ff fb ff    	and    $0xfffbffff,%ecx
  401350:	3b c1                	cmp    %ecx,%eax
  401352:	74 0a                	je     0x40135e
  401354:	51                   	push   %ecx
  401355:	6a f0                	push   $0xfffffff0
  401357:	57                   	push   %edi
  401358:	ff 15 d0 d1 40 00    	call   *0x40d1d0  ; 0x40d1d0=USER32.dll!SetWindowLongA
  40135e:	6a 00                	push   $0x0
  401360:	b8 20 00 00 00       	mov    $0x20,%eax
  401365:	b9 00 00 c0 00       	mov    $0xc00000,%ecx
  40136a:	e8 b1 fd ff ff       	call   0x401120
  40136f:	83 c4 04             	add    $0x4,%esp
  401372:	5f                   	pop    %edi
  401373:	33 c0                	xor    %eax,%eax
  401375:	5e                   	pop    %esi
  401376:	83 c4 64             	add    $0x64,%esp
  401379:	c2 10 00             	ret    $0x10
  40137c:	8b 7c 24 70          	mov    0x70(%esp),%edi
  401380:	6a f0                	push   $0xfffffff0
  401382:	57                   	push   %edi
  401383:	ff 15 cc d1 40 00    	call   *0x40d1cc  ; 0x40d1cc=USER32.dll!GetWindowLongA
  401389:	8b c8                	mov    %eax,%ecx
  40138b:	81 c9 00 00 04 00    	or     $0x40000,%ecx
  401391:	3b c1                	cmp    %ecx,%eax
  401393:	74 0a                	je     0x40139f
  401395:	51                   	push   %ecx
  401396:	6a f0                	push   $0xfffffff0
  401398:	57                   	push   %edi
  401399:	ff 15 d0 d1 40 00    	call   *0x40d1d0  ; 0x40d1d0=USER32.dll!SetWindowLongA
  40139f:	68 00 00 c0 00       	push   $0xc00000
  4013a4:	b8 20 00 00 00       	mov    $0x20,%eax
  4013a9:	33 c9                	xor    %ecx,%ecx
  4013ab:	e8 70 fd ff ff       	call   0x401120
  4013b0:	83 c4 04             	add    $0x4,%esp
  4013b3:	5f                   	pop    %edi
  4013b4:	33 c0                	xor    %eax,%eax
  4013b6:	5e                   	pop    %esi
  4013b7:	83 c4 64             	add    $0x64,%esp
  4013ba:	c2 10 00             	ret    $0x10
  4013bd:	8b 15 00 0c 41 00    	mov    0x410c00,%edx
  4013c3:	8b 74 24 70          	mov    0x70(%esp),%esi
  4013c7:	52                   	push   %edx
  4013c8:	56                   	push   %esi
  4013c9:	ff 15 e0 d1 40 00    	call   *0x40d1e0  ; 0x40d1e0=USER32.dll!ShowWindow
  4013cf:	68 e8 03 00 00       	push   $0x3e8
  4013d4:	56                   	push   %esi
  4013d5:	ff 15 c4 d1 40 00    	call   *0x40d1c4  ; 0x40d1c4=USER32.dll!KillTimer
  4013db:	5f                   	pop    %edi
  4013dc:	33 c0                	xor    %eax,%eax
  4013de:	5e                   	pop    %esi
  4013df:	83 c4 64             	add    $0x64,%esp
  4013e2:	c2 10 00             	ret    $0x10
  4013e5:	8b 44 24 78          	mov    0x78(%esp),%eax
  4013e9:	66 3d 69 00          	cmp    $0x69,%ax
  4013ed:	74 1e                	je     0x40140d
  4013ef:	8b 4c 24 7c          	mov    0x7c(%esp),%ecx
  4013f3:	8b 54 24 70          	mov    0x70(%esp),%edx
  4013f7:	51                   	push   %ecx
  4013f8:	50                   	push   %eax
  4013f9:	68 11 01 00 00       	push   $0x111
  4013fe:	52                   	push   %edx
  4013ff:	ff 15 c0 d1 40 00    	call   *0x40d1c0  ; 0x40d1c0=USER32.dll!DefWindowProcA
  401405:	5f                   	pop    %edi
  401406:	5e                   	pop    %esi
  401407:	83 c4 64             	add    $0x64,%esp
  40140a:	c2 10 00             	ret    $0x10
  40140d:	8b 44 24 70          	mov    0x70(%esp),%eax
  401411:	50                   	push   %eax
  401412:	ff 15 c8 d1 40 00    	call   *0x40d1c8  ; 0x40d1c8=USER32.dll!DestroyWindow
  401418:	5f                   	pop    %edi
  401419:	33 c0                	xor    %eax,%eax
  40141b:	5e                   	pop    %esi
  40141c:	83 c4 64             	add    $0x64,%esp
  40141f:	c2 10 00             	ret    $0x10
  401422:	8b ff                	mov    %edi,%edi
  401424:	0e                   	push   %cs
  401425:	13 40 00             	adc    0x0(%eax),%eax
  401428:	26 13 40 00          	adc    %es:0x0(%eax),%eax
  40142c:	3b 13                	cmp    (%ebx),%edx
  40142e:	40                   	inc    %eax
  40142f:	00 7c 13 40          	add    %bh,0x40(%ebx,%edx,1)
  401433:	00 cc                	add    %cl,%ah
  401435:	cc                   	int3
  401436:	cc                   	int3
  401437:	cc                   	int3
  401438:	cc                   	int3
  401439:	cc                   	int3
  40143a:	cc                   	int3
  40143b:	cc                   	int3
  40143c:	cc                   	int3
  40143d:	cc                   	int3
  40143e:	cc                   	int3
  40143f:	cc                   	int3
  401440:	83 ec 30             	sub    $0x30,%esp
  401443:	a1 ec 0c 41 00       	mov    0x410cec,%eax
  401448:	85 c0                	test   %eax,%eax
  40144a:	56                   	push   %esi
  40144b:	57                   	push   %edi
  40144c:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
  401450:	c7 44 24 08 30 00 00 	movl   $0x30,0x8(%esp)
  401457:	00 
  401458:	c7 44 24 0c 03 00 00 	movl   $0x3,0xc(%esp)
  40145f:	00 
  401460:	c7 44 24 10 10 12 40 	movl   $0x401210,0x10(%esp)
  401467:	00 
  401468:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  40146f:	00 
  401470:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  401477:	00 
  401478:	89 7c 24 1c          	mov    %edi,0x1c(%esp)
  40147c:	7e 27                	jle    0x4014a5
  40147e:	83 f8 01             	cmp    $0x1,%eax
  401481:	7c 09                	jl     0x40148c
  401483:	a1 e8 0c 41 00       	mov    0x410ce8,%eax
  401488:	85 c0                	test   %eax,%eax
  40148a:	75 05                	jne    0x401491
  40148c:	a1 40 04 41 00       	mov    0x410440,%eax
  401491:	8b 35 ac d1 40 00    	mov    0x40d1ac,%esi  ; 0x40d1ac=USER32.dll!LoadIconA
  401497:	50                   	push   %eax
  401498:	57                   	push   %edi
  401499:	ff d6                	call   *%esi
  40149b:	85 c0                	test   %eax,%eax
  40149d:	89 44 24 20          	mov    %eax,0x20(%esp)
  4014a1:	75 11                	jne    0x4014b4
  4014a3:	eb 06                	jmp    0x4014ab
  4014a5:	8b 35 ac d1 40 00    	mov    0x40d1ac,%esi  ; 0x40d1ac=USER32.dll!LoadIconA
  4014ab:	6a 6b                	push   $0x6b
  4014ad:	57                   	push   %edi
  4014ae:	ff d6                	call   *%esi
  4014b0:	89 44 24 20          	mov    %eax,0x20(%esp)
  4014b4:	68 00 7f 00 00       	push   $0x7f00
  4014b9:	6a 00                	push   $0x0
  4014bb:	ff 15 b0 d1 40 00    	call   *0x40d1b0  ; 0x40d1b0=USER32.dll!LoadCursorA
  4014c1:	89 44 24 24          	mov    %eax,0x24(%esp)
  4014c5:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  4014c9:	6a 6c                	push   $0x6c
  4014cb:	50                   	push   %eax
  4014cc:	c7 44 24 30 06 00 00 	movl   $0x6,0x30(%esp)
  4014d3:	00 
  4014d4:	c7 44 24 34 00 00 00 	movl   $0x0,0x34(%esp)
  4014db:	00 
  4014dc:	c7 44 24 38 08 0c 41 	movl   $0x410c08,0x38(%esp)
  4014e3:	00 
  4014e4:	ff d6                	call   *%esi
  4014e6:	8d 4c 24 08          	lea    0x8(%esp),%ecx
  4014ea:	51                   	push   %ecx
  4014eb:	89 44 24 38          	mov    %eax,0x38(%esp)
  4014ef:	ff 15 b4 d1 40 00    	call   *0x40d1b4  ; 0x40d1b4=USER32.dll!RegisterClassExA
  4014f5:	5f                   	pop    %edi
  4014f6:	5e                   	pop    %esi
  4014f7:	83 c4 30             	add    $0x30,%esp
  4014fa:	c3                   	ret
  4014fb:	cc                   	int3
  4014fc:	cc                   	int3
  4014fd:	cc                   	int3
  4014fe:	cc                   	int3
  4014ff:	cc                   	int3
  401500:	8b 44 24 0c          	mov    0xc(%esp),%eax
  401504:	c6 05 f4 0c 41 00 01 	movb   $0x1,0x410cf4
  40150b:	8a 08                	mov    (%eax),%cl
  40150d:	83 ec 1c             	sub    $0x1c,%esp
  401510:	84 c9                	test   %cl,%cl
  401512:	74 0b                	je     0x40151f
  401514:	50                   	push   %eax
  401515:	b9 70 0c 41 00       	mov    $0x410c70,%ecx
  40151a:	e8 c1 15 00 00       	call   0x402ae0
  40151f:	56                   	push   %esi
  401520:	8b 74 24 24          	mov    0x24(%esp),%esi
  401524:	6a 64                	push   $0x64
  401526:	68 08 0c 41 00       	push   $0x410c08
  40152b:	6a 6d                	push   $0x6d
  40152d:	56                   	push   %esi
  40152e:	ff 15 b8 d1 40 00    	call   *0x40d1b8  ; 0x40d1b8=USER32.dll!LoadStringA
  401534:	56                   	push   %esi
  401535:	e8 06 ff ff ff       	call   0x401440
  40153a:	8b 44 24 34          	mov    0x34(%esp),%eax
  40153e:	50                   	push   %eax
  40153f:	56                   	push   %esi
  401540:	e8 db fa ff ff       	call   0x401020
  401545:	83 c4 0c             	add    $0xc,%esp
  401548:	85 c0                	test   %eax,%eax
  40154a:	75 07                	jne    0x401553
  40154c:	5e                   	pop    %esi
  40154d:	83 c4 1c             	add    $0x1c,%esp
  401550:	c2 10 00             	ret    $0x10
  401553:	8b 35 a4 d1 40 00    	mov    0x40d1a4,%esi  ; 0x40d1a4=USER32.dll!GetMessageA
  401559:	6a 00                	push   $0x0
  40155b:	6a 00                	push   $0x0
  40155d:	6a 00                	push   $0x0
  40155f:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  401563:	51                   	push   %ecx
  401564:	ff d6                	call   *%esi
  401566:	85 c0                	test   %eax,%eax
  401568:	74 2f                	je     0x401599
  40156a:	53                   	push   %ebx
  40156b:	8b 1d a8 d1 40 00    	mov    0x40d1a8,%ebx  ; 0x40d1a8=USER32.dll!DispatchMessageA
  401571:	57                   	push   %edi
  401572:	8b 3d 78 d1 40 00    	mov    0x40d178,%edi  ; 0x40d178=USER32.dll!TranslateMessage
  401578:	8d 54 24 0c          	lea    0xc(%esp),%edx
  40157c:	52                   	push   %edx
  40157d:	ff d7                	call   *%edi
  40157f:	8d 44 24 0c          	lea    0xc(%esp),%eax
  401583:	50                   	push   %eax
  401584:	ff d3                	call   *%ebx
  401586:	6a 00                	push   $0x0
  401588:	6a 00                	push   $0x0
  40158a:	6a 00                	push   $0x0
  40158c:	8d 4c 24 18          	lea    0x18(%esp),%ecx
  401590:	51                   	push   %ecx
  401591:	ff d6                	call   *%esi
  401593:	85 c0                	test   %eax,%eax
  401595:	75 e1                	jne    0x401578
  401597:	5f                   	pop    %edi
  401598:	5b                   	pop    %ebx
  401599:	b9 70 0c 41 00       	mov    $0x410c70,%ecx
  40159e:	e8 3d 01 00 00       	call   0x4016e0
  4015a3:	8b 44 24 0c          	mov    0xc(%esp),%eax
  4015a7:	5e                   	pop    %esi
  4015a8:	83 c4 1c             	add    $0x1c,%esp
  4015ab:	c2 10 00             	ret    $0x10
  4015ae:	cc                   	int3
  4015af:	cc                   	int3
  4015b0:	56                   	push   %esi
  4015b1:	8b f1                	mov    %ecx,%esi
  4015b3:	8b 06                	mov    (%esi),%eax
  4015b5:	85 c0                	test   %eax,%eax
  4015b7:	74 09                	je     0x4015c2
  4015b9:	50                   	push   %eax
  4015ba:	e8 a1 42 00 00       	call   0x405860
  4015bf:	83 c4 04             	add    $0x4,%esp
  4015c2:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  4015c8:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
  4015cf:	c7 46 08 00 00 00 00 	movl   $0x0,0x8(%esi)
  4015d6:	5e                   	pop    %esi
  4015d7:	c3                   	ret
  4015d8:	cc                   	int3
  4015d9:	cc                   	int3
  4015da:	cc                   	int3
  4015db:	cc                   	int3
  4015dc:	cc                   	int3
  4015dd:	cc                   	int3
  4015de:	cc                   	int3
  4015df:	cc                   	int3
  4015e0:	6a ff                	push   $0xffffffff
  4015e2:	68 5d c1 40 00       	push   $0x40c15d
  4015e7:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
  4015ed:	50                   	push   %eax
  4015ee:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
  4015f5:	51                   	push   %ecx
  4015f6:	56                   	push   %esi
  4015f7:	8b f1                	mov    %ecx,%esi
  4015f9:	89 74 24 04          	mov    %esi,0x4(%esp)
  4015fd:	8d 4e 78             	lea    0x78(%esi),%ecx
  401600:	c7 44 24 10 06 00 00 	movl   $0x6,0x10(%esp)
  401607:	00 
  401608:	e8 a3 ff ff ff       	call   0x4015b0
  40160d:	8d 4e 5c             	lea    0x5c(%esi),%ecx
  401610:	c6 44 24 10 05       	movb   $0x5,0x10(%esp)
  401615:	e8 96 ff ff ff       	call   0x4015b0
  40161a:	8d 4e 50             	lea    0x50(%esi),%ecx
  40161d:	c6 44 24 10 04       	movb   $0x4,0x10(%esp)
  401622:	e8 89 ff ff ff       	call   0x4015b0
  401627:	8d 4e 44             	lea    0x44(%esi),%ecx
  40162a:	c6 44 24 10 03       	movb   $0x3,0x10(%esp)
  40162f:	e8 7c ff ff ff       	call   0x4015b0
  401634:	8d 4e 38             	lea    0x38(%esi),%ecx
  401637:	c6 44 24 10 02       	movb   $0x2,0x10(%esp)
  40163c:	e8 6f ff ff ff       	call   0x4015b0
  401641:	8d 4e 2c             	lea    0x2c(%esi),%ecx
  401644:	c6 44 24 10 01       	movb   $0x1,0x10(%esp)
  401649:	e8 62 ff ff ff       	call   0x4015b0
  40164e:	8d 4e 20             	lea    0x20(%esi),%ecx
  401651:	c6 44 24 10 00       	movb   $0x0,0x10(%esp)
  401656:	e8 55 ff ff ff       	call   0x4015b0
  40165b:	8d 4e 14             	lea    0x14(%esi),%ecx
  40165e:	c7 44 24 10 ff ff ff 	movl   $0xffffffff,0x10(%esp)
  401665:	ff 
  401666:	e8 45 ff ff ff       	call   0x4015b0
  40166b:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  40166f:	5e                   	pop    %esi
  401670:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  401677:	83 c4 10             	add    $0x10,%esp
  40167a:	c3                   	ret
  40167b:	cc                   	int3
  40167c:	cc                   	int3
  40167d:	cc                   	int3
  40167e:	cc                   	int3
  40167f:	cc                   	int3
  401680:	51                   	push   %ecx
  401681:	6a 00                	push   $0x0
  401683:	6a 00                	push   $0x0
  401685:	8d 44 24 08          	lea    0x8(%esp),%eax
  401689:	50                   	push   %eax
  40168a:	68 00 04 00 00       	push   $0x400
  40168f:	ff 15 0c d1 40 00    	call   *0x40d10c  ; 0x40d10c=KERNEL32.dll!GetLastError
  401695:	50                   	push   %eax
  401696:	6a 00                	push   $0x0
  401698:	68 00 13 00 00       	push   $0x1300
  40169d:	ff 15 10 d1 40 00    	call   *0x40d110  ; 0x40d110=KERNEL32.dll!FormatMessageA
  4016a3:	85 c0                	test   %eax,%eax
  4016a5:	76 27                	jbe    0x4016ce
  4016a7:	56                   	push   %esi
  4016a8:	8b 74 24 04          	mov    0x4(%esp),%esi
  4016ac:	ba 00 0d 41 00       	mov    $0x410d00,%edx
  4016b1:	8b c6                	mov    %esi,%eax
  4016b3:	2b d6                	sub    %esi,%edx
  4016b5:	8a 08                	mov    (%eax),%cl
  4016b7:	88 0c 02             	mov    %cl,(%edx,%eax,1)
  4016ba:	40                   	inc    %eax
  4016bb:	84 c9                	test   %cl,%cl
  4016bd:	75 f6                	jne    0x4016b5
  4016bf:	56                   	push   %esi
  4016c0:	ff 15 14 d1 40 00    	call   *0x40d114  ; 0x40d114=KERNEL32.dll!LocalFree
  4016c6:	5e                   	pop    %esi
  4016c7:	b8 00 0d 41 00       	mov    $0x410d00,%eax
  4016cc:	59                   	pop    %ecx
  4016cd:	c3                   	ret
  4016ce:	c6 05 00 0d 41 00 00 	movb   $0x0,0x410d00
  4016d5:	b8 00 0d 41 00       	mov    $0x410d00,%eax
  4016da:	59                   	pop    %ecx
  4016db:	c3                   	ret
  4016dc:	cc                   	int3
  4016dd:	cc                   	int3
  4016de:	cc                   	int3
  4016df:	cc                   	int3
  4016e0:	56                   	push   %esi
  4016e1:	8b f1                	mov    %ecx,%esi
  4016e3:	8b 46 08             	mov    0x8(%esi),%eax
  4016e6:	85 c0                	test   %eax,%eax
  4016e8:	74 09                	je     0x4016f3
  4016ea:	6a 00                	push   $0x0
  4016ec:	6a 03                	push   $0x3
  4016ee:	ff d0                	call   *%eax
  4016f0:	83 c4 08             	add    $0x8,%esp
  4016f3:	8b 06                	mov    (%esi),%eax
  4016f5:	85 c0                	test   %eax,%eax
  4016f7:	74 07                	je     0x401700
  4016f9:	50                   	push   %eax
  4016fa:	ff 15 08 d1 40 00    	call   *0x40d108  ; 0x40d108=KERNEL32.dll!FreeLibrary
  401700:	c7 46 08 00 00 00 00 	movl   $0x0,0x8(%esi)
  401707:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  40170d:	c7 46 6c 00 00 00 00 	movl   $0x0,0x6c(%esi)
  401714:	5e                   	pop    %esi
  401715:	c3                   	ret
  401716:	cc                   	int3
  401717:	cc                   	int3
  401718:	cc                   	int3
  401719:	cc                   	int3
  40171a:	cc                   	int3
  40171b:	cc                   	int3
  40171c:	cc                   	int3
  40171d:	cc                   	int3
  40171e:	cc                   	int3
  40171f:	cc                   	int3
  401720:	8b 41 08             	mov    0x8(%ecx),%eax
  401723:	85 c0                	test   %eax,%eax
  401725:	74 09                	je     0x401730
  401727:	6a 00                	push   $0x0
  401729:	6a 0a                	push   $0xa
  40172b:	ff d0                	call   *%eax
  40172d:	83 c4 08             	add    $0x8,%esp
  401730:	c3                   	ret
  401731:	cc                   	int3
  401732:	cc                   	int3
  401733:	cc                   	int3
  401734:	cc                   	int3
  401735:	cc                   	int3
  401736:	cc                   	int3
  401737:	cc                   	int3
  401738:	cc                   	int3
  401739:	cc                   	int3
  40173a:	cc                   	int3
  40173b:	cc                   	int3
  40173c:	cc                   	int3
  40173d:	cc                   	int3
  40173e:	cc                   	int3
  40173f:	cc                   	int3
  401740:	c3                   	ret
  401741:	cc                   	int3
  401742:	cc                   	int3
  401743:	cc                   	int3
  401744:	cc                   	int3
  401745:	cc                   	int3
  401746:	cc                   	int3
  401747:	cc                   	int3
  401748:	cc                   	int3
  401749:	cc                   	int3
  40174a:	cc                   	int3
  40174b:	cc                   	int3
  40174c:	cc                   	int3
  40174d:	cc                   	int3
  40174e:	cc                   	int3
  40174f:	cc                   	int3
  401750:	b8 a0 1f 00 00       	mov    $0x1fa0,%eax
  401755:	e8 b6 45 00 00       	call   0x405d10
  40175a:	8b 8c 24 a8 1f 00 00 	mov    0x1fa8(%esp),%ecx
  401761:	8d 84 24 ac 1f 00 00 	lea    0x1fac(%esp),%eax
  401768:	50                   	push   %eax
  401769:	51                   	push   %ecx
  40176a:	8d 54 24 08          	lea    0x8(%esp),%edx
  40176e:	52                   	push   %edx
  40176f:	ff 15 9c d1 40 00    	call   *0x40d19c  ; 0x40d19c=USER32.dll!wvsprintfA
  401775:	8b 8c 24 a4 1f 00 00 	mov    0x1fa4(%esp),%ecx
  40177c:	8b 51 10             	mov    0x10(%ecx),%edx
  40177f:	6a 10                	push   $0x10
  401781:	68 18 d2 40 00       	push   $0x40d218  ; 0x40d218='FancyBox Err'
  401786:	8d 44 24 08          	lea    0x8(%esp),%eax
  40178a:	50                   	push   %eax
  40178b:	52                   	push   %edx
  40178c:	ff 15 a0 d1 40 00    	call   *0x40d1a0  ; 0x40d1a0=USER32.dll!MessageBoxA
  401792:	81 c4 a0 1f 00 00    	add    $0x1fa0,%esp
  401798:	c3                   	ret
  401799:	cc                   	int3
  40179a:	cc                   	int3
  40179b:	cc                   	int3
  40179c:	cc                   	int3
  40179d:	cc                   	int3
  40179e:	cc                   	int3
  40179f:	cc                   	int3
  4017a0:	83 ec 0c             	sub    $0xc,%esp
  4017a3:	68 28 d2 40 00       	push   $0x40d228  ; 0x40d228='SOFTWARE\\XXT\\'
  4017a8:	68 00 11 41 00       	push   $0x411100
  4017ad:	ff 15 90 d0 40 00    	call   *0x40d090  ; 0x40d090=KERNEL32.dll!lstrcpyA
  4017b3:	8b 44 24 10          	mov    0x10(%esp),%eax
  4017b7:	50                   	push   %eax
  4017b8:	68 00 11 41 00       	push   $0x411100
  4017bd:	ff 15 04 d1 40 00    	call   *0x40d104  ; 0x40d104=KERNEL32.dll!lstrcatA
  4017c3:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  4017c7:	51                   	push   %ecx
  4017c8:	68 00 11 41 00       	push   $0x411100
  4017cd:	68 02 00 00 80       	push   $0x80000002
  4017d2:	ff 15 08 d0 40 00    	call   *0x40d008  ; 0x40d008=ADVAPI32.dll!RegOpenKeyA
  4017d8:	85 c0                	test   %eax,%eax
  4017da:	74 08                	je     0x4017e4
  4017dc:	8b 44 24 18          	mov    0x18(%esp),%eax
  4017e0:	83 c4 0c             	add    $0xc,%esp
  4017e3:	c3                   	ret
  4017e4:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  4017e8:	8d 14 24             	lea    (%esp),%edx
  4017eb:	52                   	push   %edx
  4017ec:	8b 54 24 08          	mov    0x8(%esp),%edx
  4017f0:	68 00 11 41 00       	push   $0x411100
  4017f5:	8d 44 24 10          	lea    0x10(%esp),%eax
  4017f9:	50                   	push   %eax
  4017fa:	6a 00                	push   $0x0
  4017fc:	51                   	push   %ecx
  4017fd:	52                   	push   %edx
  4017fe:	c7 44 24 18 00 04 00 	movl   $0x400,0x18(%esp)
  401805:	00 
  401806:	ff 15 0c d0 40 00    	call   *0x40d00c  ; 0x40d00c=ADVAPI32.dll!RegQueryValueExA
  40180c:	85 c0                	test   %eax,%eax
  40180e:	8b 44 24 18          	mov    0x18(%esp),%eax
  401812:	75 05                	jne    0x401819
  401814:	b8 00 11 41 00       	mov    $0x411100,%eax
  401819:	83 c4 0c             	add    $0xc,%esp
  40181c:	c3                   	ret
  40181d:	cc                   	int3
  40181e:	cc                   	int3
  40181f:	cc                   	int3
  401820:	81 ec 08 04 00 00    	sub    $0x408,%esp
  401826:	56                   	push   %esi
  401827:	8b 35 90 d0 40 00    	mov    0x40d090,%esi  ; 0x40d090=KERNEL32.dll!lstrcpyA
  40182d:	68 28 d2 40 00       	push   $0x40d228  ; 0x40d228='SOFTWARE\\XXT\\'
  401832:	8d 44 24 10          	lea    0x10(%esp),%eax
  401836:	50                   	push   %eax
  401837:	ff d6                	call   *%esi
  401839:	8b 8c 24 10 04 00 00 	mov    0x410(%esp),%ecx
  401840:	51                   	push   %ecx
  401841:	8d 54 24 10          	lea    0x10(%esp),%edx
  401845:	52                   	push   %edx
  401846:	ff 15 04 d1 40 00    	call   *0x40d104  ; 0x40d104=KERNEL32.dll!lstrcatA
  40184c:	8d 44 24 08          	lea    0x8(%esp),%eax
  401850:	50                   	push   %eax
  401851:	8d 4c 24 08          	lea    0x8(%esp),%ecx
  401855:	51                   	push   %ecx
  401856:	6a 00                	push   $0x0
  401858:	68 06 00 02 00       	push   $0x20006
  40185d:	6a 00                	push   $0x0
  40185f:	6a 00                	push   $0x0
  401861:	6a 00                	push   $0x0
  401863:	8d 54 24 28          	lea    0x28(%esp),%edx
  401867:	52                   	push   %edx
  401868:	68 02 00 00 80       	push   $0x80000002
  40186d:	ff 15 00 d0 40 00    	call   *0x40d000  ; 0x40d000=ADVAPI32.dll!RegCreateKeyExA
  401873:	8b 84 24 18 04 00 00 	mov    0x418(%esp),%eax
  40187a:	50                   	push   %eax
  40187b:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  40187f:	51                   	push   %ecx
  401880:	ff d6                	call   *%esi
  401882:	8d 44 24 0c          	lea    0xc(%esp),%eax
  401886:	8d 50 01             	lea    0x1(%eax),%edx
  401889:	5e                   	pop    %esi
  40188a:	8d 9b 00 00 00 00    	lea    0x0(%ebx),%ebx
  401890:	8a 08                	mov    (%eax),%cl
  401892:	40                   	inc    %eax
  401893:	84 c9                	test   %cl,%cl
  401895:	75 f9                	jne    0x401890
  401897:	8b 0c 24             	mov    (%esp),%ecx
  40189a:	2b c2                	sub    %edx,%eax
  40189c:	50                   	push   %eax
  40189d:	8b 84 24 14 04 00 00 	mov    0x414(%esp),%eax
  4018a4:	8d 54 24 0c          	lea    0xc(%esp),%edx
  4018a8:	52                   	push   %edx
  4018a9:	6a 01                	push   $0x1
  4018ab:	6a 00                	push   $0x0
  4018ad:	50                   	push   %eax
  4018ae:	51                   	push   %ecx
  4018af:	ff 15 04 d0 40 00    	call   *0x40d004  ; 0x40d004=ADVAPI32.dll!RegSetValueExA
  4018b5:	f7 d8                	neg    %eax
  4018b7:	1b c0                	sbb    %eax,%eax
  4018b9:	40                   	inc    %eax
  4018ba:	81 c4 08 04 00 00    	add    $0x408,%esp
  4018c0:	c3                   	ret
  4018c1:	cc                   	int3
  4018c2:	cc                   	int3
  4018c3:	cc                   	int3
  4018c4:	cc                   	int3
  4018c5:	cc                   	int3
  4018c6:	cc                   	int3
  4018c7:	cc                   	int3
  4018c8:	cc                   	int3
  4018c9:	cc                   	int3
  4018ca:	cc                   	int3
  4018cb:	cc                   	int3
  4018cc:	cc                   	int3
  4018cd:	cc                   	int3
  4018ce:	cc                   	int3
  4018cf:	cc                   	int3
  4018d0:	6a ff                	push   $0xffffffff
  4018d2:	68 9c c1 40 00       	push   $0x40c19c
  4018d7:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
  4018dd:	50                   	push   %eax
  4018de:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
  4018e5:	81 ec 5c 03 00 00    	sub    $0x35c,%esp
  4018eb:	53                   	push   %ebx
  4018ec:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  4018f0:	e8 6b 23 00 00       	call   0x403c60
  4018f5:	33 db                	xor    %ebx,%ebx
  4018f7:	8d 4c 24 18          	lea    0x18(%esp),%ecx
  4018fb:	89 9c 24 68 03 00 00 	mov    %ebx,0x368(%esp)
  401902:	e8 49 29 00 00       	call   0x404250
  401907:	8d 4c 24 2c          	lea    0x2c(%esp),%ecx
  40190b:	c6 84 24 68 03 00 00 	movb   $0x1,0x368(%esp)
  401912:	01 
  401913:	e8 38 29 00 00       	call   0x404250
  401918:	8b 84 24 70 03 00 00 	mov    0x370(%esp),%eax
  40191f:	53                   	push   %ebx
  401920:	50                   	push   %eax
  401921:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
  401925:	c6 84 24 70 03 00 00 	movb   $0x2,0x370(%esp)
  40192c:	02 
  40192d:	e8 ce 2c 00 00       	call   0x404600
  401932:	85 c0                	test   %eax,%eax
  401934:	0f 84 de 01 00 00    	je     0x401b18
  40193a:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  40193e:	51                   	push   %ecx
  40193f:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
  401943:	e8 78 29 00 00       	call   0x4042c0
  401948:	85 c0                	test   %eax,%eax
  40194a:	0f 84 c8 01 00 00    	je     0x401b18
  401950:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  401954:	e8 47 25 00 00       	call   0x403ea0
  401959:	8d 4c 24 40          	lea    0x40(%esp),%ecx
  40195d:	89 5c 24 24          	mov    %ebx,0x24(%esp)
  401961:	e8 7a 18 00 00       	call   0x4031e0
  401966:	8d 54 24 2c          	lea    0x2c(%esp),%edx
  40196a:	52                   	push   %edx
  40196b:	8d 44 24 1c          	lea    0x1c(%esp),%eax
  40196f:	50                   	push   %eax
  401970:	8d 4c 24 48          	lea    0x48(%esp),%ecx
  401974:	c6 84 24 70 03 00 00 	movb   $0x3,0x370(%esp)
  40197b:	03 
  40197c:	e8 ff 1b 00 00       	call   0x403580
  401981:	85 c0                	test   %eax,%eax
  401983:	75 6a                	jne    0x4019ef
  401985:	68 7c d2 40 00       	push   $0x40d27c  ; 0x40d27c="Can't open file"
  40198a:	8b ce                	mov    %esi,%ecx
  40198c:	e8 3f 34 00 00       	call   0x404dd0
  401991:	8d 4c 24 40          	lea    0x40(%esp),%ecx
  401995:	c6 84 24 68 03 00 00 	movb   $0x2,0x368(%esp)
  40199c:	02 
  40199d:	e8 6e 1a 00 00       	call   0x403410
  4019a2:	8d 4c 24 2c          	lea    0x2c(%esp),%ecx
  4019a6:	c6 84 24 68 03 00 00 	movb   $0x1,0x368(%esp)
  4019ad:	01 
  4019ae:	e8 2d 2d 00 00       	call   0x4046e0
  4019b3:	8d 4c 24 18          	lea    0x18(%esp),%ecx
  4019b7:	88 9c 24 68 03 00 00 	mov    %bl,0x368(%esp)
  4019be:	e8 1d 2d 00 00       	call   0x4046e0
  4019c3:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  4019c7:	c7 84 24 68 03 00 00 	movl   $0xffffffff,0x368(%esp)
  4019ce:	ff ff ff ff 
  4019d2:	e8 f9 2b 00 00       	call   0x4045d0
  4019d7:	33 c0                	xor    %eax,%eax
  4019d9:	5b                   	pop    %ebx
  4019da:	8b 8c 24 5c 03 00 00 	mov    0x35c(%esp),%ecx
  4019e1:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  4019e8:	81 c4 68 03 00 00    	add    $0x368,%esp
  4019ee:	c3                   	ret
  4019ef:	53                   	push   %ebx
  4019f0:	8d 4c 24 44          	lea    0x44(%esp),%ecx
  4019f4:	e8 37 1a 00 00       	call   0x403430
  4019f9:	85 c0                	test   %eax,%eax
  4019fb:	75 6a                	jne    0x401a67
  4019fd:	68 68 d2 40 00       	push   $0x40d268  ; 0x40d268="Can't extract file"
  401a02:	8b ce                	mov    %esi,%ecx
  401a04:	e8 c7 33 00 00       	call   0x404dd0
  401a09:	8d 4c 24 40          	lea    0x40(%esp),%ecx
  401a0d:	c6 84 24 68 03 00 00 	movb   $0x2,0x368(%esp)
  401a14:	02 
  401a15:	e8 f6 19 00 00       	call   0x403410
  401a1a:	8d 4c 24 2c          	lea    0x2c(%esp),%ecx
  401a1e:	c6 84 24 68 03 00 00 	movb   $0x1,0x368(%esp)
  401a25:	01 
  401a26:	e8 b5 2c 00 00       	call   0x4046e0
  401a2b:	8d 4c 24 18          	lea    0x18(%esp),%ecx
  401a2f:	88 9c 24 68 03 00 00 	mov    %bl,0x368(%esp)
  401a36:	e8 a5 2c 00 00       	call   0x4046e0
  401a3b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  401a3f:	c7 84 24 68 03 00 00 	movl   $0xffffffff,0x368(%esp)
  401a46:	ff ff ff ff 
  401a4a:	e8 81 2b 00 00       	call   0x4045d0
  401a4f:	33 c0                	xor    %eax,%eax
  401a51:	5b                   	pop    %ebx
  401a52:	8b 8c 24 5c 03 00 00 	mov    0x35c(%esp),%ecx
  401a59:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  401a60:	81 c4 68 03 00 00    	add    $0x368,%esp
  401a66:	c3                   	ret
  401a67:	53                   	push   %ebx
  401a68:	53                   	push   %ebx
  401a69:	57                   	push   %edi
  401a6a:	e8 51 26 00 00       	call   0x4040c0
  401a6f:	83 c4 0c             	add    $0xc,%esp
  401a72:	85 c0                	test   %eax,%eax
  401a74:	74 75                	je     0x401aeb
  401a76:	57                   	push   %edi
  401a77:	ff 15 1c d0 40 00    	call   *0x40d01c  ; 0x40d01c=KERNEL32.dll!DeleteFileA
  401a7d:	85 c0                	test   %eax,%eax
  401a7f:	75 6a                	jne    0x401aeb
  401a81:	68 50 d2 40 00       	push   $0x40d250  ; 0x40d250="Can't over write file"
  401a86:	8b ce                	mov    %esi,%ecx
  401a88:	e8 43 33 00 00       	call   0x404dd0
  401a8d:	8d 4c 24 40          	lea    0x40(%esp),%ecx
  401a91:	c6 84 24 68 03 00 00 	movb   $0x2,0x368(%esp)
  401a98:	02 
  401a99:	e8 72 19 00 00       	call   0x403410
  401a9e:	8d 4c 24 2c          	lea    0x2c(%esp),%ecx
  401aa2:	c6 84 24 68 03 00 00 	movb   $0x1,0x368(%esp)
  401aa9:	01 
  401aaa:	e8 31 2c 00 00       	call   0x4046e0
  401aaf:	8d 4c 24 18          	lea    0x18(%esp),%ecx
  401ab3:	88 9c 24 68 03 00 00 	mov    %bl,0x368(%esp)
  401aba:	e8 21 2c 00 00       	call   0x4046e0
  401abf:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  401ac3:	c7 84 24 68 03 00 00 	movl   $0xffffffff,0x368(%esp)
  401aca:	ff ff ff ff 
  401ace:	e8 fd 2a 00 00       	call   0x4045d0
  401ad3:	33 c0                	xor    %eax,%eax
  401ad5:	5b                   	pop    %ebx
  401ad6:	8b 8c 24 5c 03 00 00 	mov    0x35c(%esp),%ecx
  401add:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  401ae4:	81 c4 68 03 00 00    	add    $0x368,%esp
  401aea:	c3                   	ret
  401aeb:	6a 01                	push   $0x1
  401aed:	57                   	push   %edi
  401aee:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
  401af2:	e8 09 2b 00 00       	call   0x404600
  401af7:	85 c0                	test   %eax,%eax
  401af9:	75 6a                	jne    0x401b65
  401afb:	68 3c d2 40 00       	push   $0x40d23c  ; 0x40d23c="Can't create file"
  401b00:	8b ce                	mov    %esi,%ecx
  401b02:	e8 c9 32 00 00       	call   0x404dd0
  401b07:	8d 4c 24 40          	lea    0x40(%esp),%ecx
  401b0b:	c6 84 24 68 03 00 00 	movb   $0x2,0x368(%esp)
  401b12:	02 
  401b13:	e8 f8 18 00 00       	call   0x403410
  401b18:	8d 4c 24 2c          	lea    0x2c(%esp),%ecx
  401b1c:	c6 84 24 68 03 00 00 	movb   $0x1,0x368(%esp)
  401b23:	01 
  401b24:	e8 b7 2b 00 00       	call   0x4046e0
  401b29:	8d 4c 24 18          	lea    0x18(%esp),%ecx
  401b2d:	88 9c 24 68 03 00 00 	mov    %bl,0x368(%esp)
  401b34:	e8 a7 2b 00 00       	call   0x4046e0
  401b39:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  401b3d:	c7 84 24 68 03 00 00 	movl   $0xffffffff,0x368(%esp)
  401b44:	ff ff ff ff 
  401b48:	e8 83 2a 00 00       	call   0x4045d0
  401b4d:	33 c0                	xor    %eax,%eax
  401b4f:	5b                   	pop    %ebx
  401b50:	8b 8c 24 5c 03 00 00 	mov    0x35c(%esp),%ecx
  401b57:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  401b5e:	81 c4 68 03 00 00    	add    $0x368,%esp
  401b64:	c3                   	ret
  401b65:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  401b69:	51                   	push   %ecx
  401b6a:	8d 4c 24 30          	lea    0x30(%esp),%ecx
  401b6e:	e8 2d 29 00 00       	call   0x4044a0
  401b73:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  401b77:	e8 24 23 00 00       	call   0x403ea0
  401b7c:	8d 4c 24 40          	lea    0x40(%esp),%ecx
  401b80:	c6 84 24 68 03 00 00 	movb   $0x2,0x368(%esp)
  401b87:	02 
  401b88:	e8 83 18 00 00       	call   0x403410
  401b8d:	8d 4c 24 2c          	lea    0x2c(%esp),%ecx
  401b91:	c6 84 24 68 03 00 00 	movb   $0x1,0x368(%esp)
  401b98:	01 
  401b99:	e8 42 2b 00 00       	call   0x4046e0
  401b9e:	8d 4c 24 18          	lea    0x18(%esp),%ecx
  401ba2:	88 9c 24 68 03 00 00 	mov    %bl,0x368(%esp)
  401ba9:	e8 32 2b 00 00       	call   0x4046e0
  401bae:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  401bb2:	c7 84 24 68 03 00 00 	movl   $0xffffffff,0x368(%esp)
  401bb9:	ff ff ff ff 
  401bbd:	e8 0e 2a 00 00       	call   0x4045d0
  401bc2:	8b 8c 24 60 03 00 00 	mov    0x360(%esp),%ecx
  401bc9:	b8 01 00 00 00       	mov    $0x1,%eax
  401bce:	5b                   	pop    %ebx
  401bcf:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  401bd6:	81 c4 68 03 00 00    	add    $0x368,%esp
  401bdc:	c3                   	ret
  401bdd:	cc                   	int3
  401bde:	cc                   	int3
  401bdf:	cc                   	int3
  401be0:	b8 a0 1f 00 00       	mov    $0x1fa0,%eax
  401be5:	e8 26 41 00 00       	call   0x405d10
  401bea:	8b 8c 24 ac 1f 00 00 	mov    0x1fac(%esp),%ecx
  401bf1:	8d 84 24 b0 1f 00 00 	lea    0x1fb0(%esp),%eax
  401bf8:	50                   	push   %eax
  401bf9:	51                   	push   %ecx
  401bfa:	8d 54 24 08          	lea    0x8(%esp),%edx
  401bfe:	52                   	push   %edx
  401bff:	ff 15 9c d1 40 00    	call   *0x40d19c  ; 0x40d19c=USER32.dll!wvsprintfA
  401c05:	8b 8c 24 a4 1f 00 00 	mov    0x1fa4(%esp),%ecx
  401c0c:	e8 cf 1f 00 00       	call   0x403be0
  401c11:	8b 8c 24 a8 1f 00 00 	mov    0x1fa8(%esp),%ecx
  401c18:	6a 10                	push   $0x10
  401c1a:	68 18 d2 40 00       	push   $0x40d218  ; 0x40d218='FancyBox Err'
  401c1f:	8d 44 24 08          	lea    0x8(%esp),%eax
  401c23:	50                   	push   %eax
  401c24:	51                   	push   %ecx
  401c25:	ff 15 a0 d1 40 00    	call   *0x40d1a0  ; 0x40d1a0=USER32.dll!MessageBoxA
  401c2b:	81 c4 a0 1f 00 00    	add    $0x1fa0,%esp
  401c31:	c3                   	ret
  401c32:	cc                   	int3
  401c33:	cc                   	int3
  401c34:	cc                   	int3
  401c35:	cc                   	int3
  401c36:	cc                   	int3
  401c37:	cc                   	int3
  401c38:	cc                   	int3
  401c39:	cc                   	int3
  401c3a:	cc                   	int3
  401c3b:	cc                   	int3
  401c3c:	cc                   	int3
  401c3d:	cc                   	int3
  401c3e:	cc                   	int3
  401c3f:	cc                   	int3
  401c40:	6a ff                	push   $0xffffffff
  401c42:	68 22 c2 40 00       	push   $0x40c222
  401c47:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
  401c4d:	50                   	push   %eax
  401c4e:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
  401c55:	81 ec c0 00 00 00    	sub    $0xc0,%esp
  401c5b:	53                   	push   %ebx
  401c5c:	55                   	push   %ebp
  401c5d:	57                   	push   %edi
  401c5e:	8b f9                	mov    %ecx,%edi
  401c60:	8d 4c 24 58          	lea    0x58(%esp),%ecx
  401c64:	89 bc 24 c8 00 00 00 	mov    %edi,0xc8(%esp)
  401c6b:	e8 00 2b 00 00       	call   0x404770
  401c70:	33 db                	xor    %ebx,%ebx
  401c72:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
  401c76:	89 9c 24 d4 00 00 00 	mov    %ebx,0xd4(%esp)
  401c7d:	e8 ee 2a 00 00       	call   0x404770
  401c82:	8d 4c 24 24          	lea    0x24(%esp),%ecx
  401c86:	bd 01 00 00 00       	mov    $0x1,%ebp
  401c8b:	c6 84 24 d4 00 00 00 	movb   $0x1,0xd4(%esp)
  401c92:	01 
  401c93:	e8 d8 2a 00 00       	call   0x404770
  401c98:	8d 4c 24 48          	lea    0x48(%esp),%ecx
  401c9c:	c6 84 24 d4 00 00 00 	movb   $0x2,0xd4(%esp)
  401ca3:	02 
  401ca4:	e8 c7 2a 00 00       	call   0x404770
  401ca9:	8d 8c 24 90 00 00 00 	lea    0x90(%esp),%ecx
  401cb0:	c6 84 24 d4 00 00 00 	movb   $0x3,0xd4(%esp)
  401cb7:	03 
  401cb8:	e8 83 1d 00 00       	call   0x403a40
  401cbd:	8d 47 2c             	lea    0x2c(%edi),%eax
  401cc0:	50                   	push   %eax
  401cc1:	8d 4c 24 5c          	lea    0x5c(%esp),%ecx
  401cc5:	c6 84 24 d8 00 00 00 	movb   $0x4,0xd8(%esp)
  401ccc:	04 
  401ccd:	e8 ae 30 00 00       	call   0x404d80
  401cd2:	68 ec d3 40 00       	push   $0x40d3ec  ; 0x40d3ec='system\\'
  401cd7:	8d 4c 24 5c          	lea    0x5c(%esp),%ecx
  401cdb:	e8 10 2d 00 00       	call   0x4049f0
  401ce0:	8d 4c 24 58          	lea    0x58(%esp),%ecx
  401ce4:	51                   	push   %ecx
  401ce5:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  401ce9:	e8 92 30 00 00       	call   0x404d80
  401cee:	68 40 02 41 00       	push   $0x410240  ; 0x410240='fc2info.dat'
  401cf3:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  401cf7:	e8 f4 2c 00 00       	call   0x4049f0
  401cfc:	39 6c 24 10          	cmp    %ebp,0x10(%esp)
  401d00:	7c 08                	jl     0x401d0a
  401d02:	8b 44 24 0c          	mov    0xc(%esp),%eax
  401d06:	3b c3                	cmp    %ebx,%eax
  401d08:	75 05                	jne    0x401d0f
  401d0a:	a1 40 04 41 00       	mov    0x410440,%eax
  401d0f:	8b 57 70             	mov    0x70(%edi),%edx
  401d12:	53                   	push   %ebx
  401d13:	53                   	push   %ebx
  401d14:	52                   	push   %edx
  401d15:	50                   	push   %eax
  401d16:	e8 25 24 00 00       	call   0x404140
  401d1b:	83 c4 10             	add    $0x10,%esp
  401d1e:	85 c0                	test   %eax,%eax
  401d20:	74 62                	je     0x401d84
  401d22:	8d 8c 24 90 00 00 00 	lea    0x90(%esp),%ecx
  401d29:	c6 84 24 d4 00 00 00 	movb   $0x3,0xd4(%esp)
  401d30:	03 
  401d31:	e8 4a 1d 00 00       	call   0x403a80
  401d36:	8d 4c 24 48          	lea    0x48(%esp),%ecx
  401d3a:	c6 84 24 d4 00 00 00 	movb   $0x2,0xd4(%esp)
  401d41:	02 
  401d42:	e8 69 f8 ff ff       	call   0x4015b0
  401d47:	8d 4c 24 24          	lea    0x24(%esp),%ecx
  401d4b:	c6 84 24 d4 00 00 00 	movb   $0x1,0xd4(%esp)
  401d52:	01 
  401d53:	e8 58 f8 ff ff       	call   0x4015b0
  401d58:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
  401d5c:	c6 84 24 d4 00 00 00 	movb   $0x0,0xd4(%esp)
  401d63:	00 
  401d64:	e8 47 f8 ff ff       	call   0x4015b0
  401d69:	8d 4c 24 58          	lea    0x58(%esp),%ecx
  401d6d:	c7 84 24 d4 00 00 00 	movl   $0xffffffff,0xd4(%esp)
  401d74:	ff ff ff ff 
  401d78:	e8 33 f8 ff ff       	call   0x4015b0
  401d7d:	8b c5                	mov    %ebp,%eax
  401d7f:	e9 a4 06 00 00       	jmp    0x402428
  401d84:	56                   	push   %esi
  401d85:	8d 47 5c             	lea    0x5c(%edi),%eax
  401d88:	50                   	push   %eax
  401d89:	8d 4c 24 2c          	lea    0x2c(%esp),%ecx
  401d8d:	e8 ee 2f 00 00       	call   0x404d80
  401d92:	68 40 02 41 00       	push   $0x410240  ; 0x410240='fc2info.dat'
  401d97:	8d 4c 24 2c          	lea    0x2c(%esp),%ecx
  401d9b:	e8 50 2c 00 00       	call   0x4049f0
  401da0:	8b b4 24 e0 00 00 00 	mov    0xe0(%esp),%esi
  401da7:	8b 47 0c             	mov    0xc(%edi),%eax
  401daa:	56                   	push   %esi
  401dab:	50                   	push   %eax
  401dac:	8d 8c 24 9c 00 00 00 	lea    0x9c(%esp),%ecx
  401db3:	e8 18 1e 00 00       	call   0x403bd0
  401db8:	68 cc d3 40 00       	push   $0x40d3cc  ; 0x40d3cc='Check system info'
  401dbd:	8d 8c 24 98 00 00 00 	lea    0x98(%esp),%ecx
  401dc4:	e8 27 1e 00 00       	call   0x403bf0
  401dc9:	39 6c 24 14          	cmp    %ebp,0x14(%esp)
  401dcd:	7c 08                	jl     0x401dd7
  401dcf:	8b 44 24 10          	mov    0x10(%esp),%eax
  401dd3:	3b c3                	cmp    %ebx,%eax
  401dd5:	75 05                	jne    0x401ddc
  401dd7:	a1 40 04 41 00       	mov    0x410440,%eax
  401ddc:	50                   	push   %eax
  401ddd:	e8 9e 1e 00 00       	call   0x403c80
  401de2:	8b 44 24 18          	mov    0x18(%esp),%eax
  401de6:	8b 15 40 04 41 00    	mov    0x410440,%edx
  401dec:	83 c4 04             	add    $0x4,%esp
  401def:	3b c5                	cmp    %ebp,%eax
  401df1:	7c 0a                	jl     0x401dfd
  401df3:	8b 44 24 10          	mov    0x10(%esp),%eax
  401df7:	3b c3                	cmp    %ebx,%eax
  401df9:	8b c8                	mov    %eax,%ecx
  401dfb:	75 02                	jne    0x401dff
  401dfd:	8b ca                	mov    %edx,%ecx
  401dff:	39 6c 24 2c          	cmp    %ebp,0x2c(%esp)
  401e03:	7c 08                	jl     0x401e0d
  401e05:	8b 44 24 28          	mov    0x28(%esp),%eax
  401e09:	3b c3                	cmp    %ebx,%eax
  401e0b:	75 02                	jne    0x401e0f
  401e0d:	8b c2                	mov    %edx,%eax
  401e0f:	51                   	push   %ecx
  401e10:	50                   	push   %eax
  401e11:	8d 8c 24 9c 00 00 00 	lea    0x9c(%esp),%ecx
  401e18:	51                   	push   %ecx
  401e19:	e8 92 11 00 00       	call   0x402fb0
  401e1e:	83 c4 0c             	add    $0xc,%esp
  401e21:	85 c0                	test   %eax,%eax
  401e23:	0f 85 95 00 00 00    	jne    0x401ebe
  401e29:	39 9c 24 b4 00 00 00 	cmp    %ebx,0xb4(%esp)
  401e30:	75 2a                	jne    0x401e5c
  401e32:	39 6c 24 2c          	cmp    %ebp,0x2c(%esp)
  401e36:	7c 08                	jl     0x401e40
  401e38:	8b 44 24 28          	mov    0x28(%esp),%eax
  401e3c:	3b c3                	cmp    %ebx,%eax
  401e3e:	75 05                	jne    0x401e45
  401e40:	a1 40 04 41 00       	mov    0x410440,%eax
  401e45:	50                   	push   %eax
  401e46:	68 ac d3 40 00       	push   $0x40d3ac  ; 0x40d3ac='Download system info failed'
  401e4b:	8d 94 24 9c 00 00 00 	lea    0x9c(%esp),%edx
  401e52:	56                   	push   %esi
  401e53:	52                   	push   %edx
  401e54:	e8 87 fd ff ff       	call   0x401be0
  401e59:	83 c4 10             	add    $0x10,%esp
  401e5c:	8d 8c 24 94 00 00 00 	lea    0x94(%esp),%ecx
  401e63:	c6 84 24 d8 00 00 00 	movb   $0x3,0xd8(%esp)
  401e6a:	03 
  401e6b:	e8 10 1c 00 00       	call   0x403a80
  401e70:	8d 4c 24 4c          	lea    0x4c(%esp),%ecx
  401e74:	c6 84 24 d8 00 00 00 	movb   $0x2,0xd8(%esp)
  401e7b:	02 
  401e7c:	e8 2f f7 ff ff       	call   0x4015b0
  401e81:	8d 4c 24 28          	lea    0x28(%esp),%ecx
  401e85:	c6 84 24 d8 00 00 00 	movb   $0x1,0xd8(%esp)
  401e8c:	01 
  401e8d:	e8 1e f7 ff ff       	call   0x4015b0
  401e92:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  401e96:	c6 84 24 d8 00 00 00 	movb   $0x0,0xd8(%esp)
  401e9d:	00 
  401e9e:	e8 0d f7 ff ff       	call   0x4015b0
  401ea3:	8d 4c 24 5c          	lea    0x5c(%esp),%ecx
  401ea7:	c7 84 24 d8 00 00 00 	movl   $0xffffffff,0xd8(%esp)
  401eae:	ff ff ff ff 
  401eb2:	e8 f9 f6 ff ff       	call   0x4015b0
  401eb7:	33 c0                	xor    %eax,%eax
  401eb9:	e9 69 05 00 00       	jmp    0x402427
  401ebe:	8d 4c 24 74          	lea    0x74(%esp),%ecx
  401ec2:	e8 89 34 00 00       	call   0x405350
  401ec7:	39 6c 24 14          	cmp    %ebp,0x14(%esp)
  401ecb:	c6 84 24 d8 00 00 00 	movb   $0x5,0xd8(%esp)
  401ed2:	05 
  401ed3:	7c 08                	jl     0x401edd
  401ed5:	8b 44 24 10          	mov    0x10(%esp),%eax
  401ed9:	3b c3                	cmp    %ebx,%eax
  401edb:	75 05                	jne    0x401ee2
  401edd:	a1 40 04 41 00       	mov    0x410440,%eax
  401ee2:	50                   	push   %eax
  401ee3:	8d 4c 24 78          	lea    0x78(%esp),%ecx
  401ee7:	e8 e4 37 00 00       	call   0x4056d0
  401eec:	85 c0                	test   %eax,%eax
  401eee:	75 2c                	jne    0x401f1c
  401ef0:	68 94 d3 40 00       	push   $0x40d394  ; 0x40d394="Can't read system info!"
  401ef5:	8d 84 24 98 00 00 00 	lea    0x98(%esp),%eax
  401efc:	56                   	push   %esi
  401efd:	50                   	push   %eax
  401efe:	e8 dd fc ff ff       	call   0x401be0
  401f03:	83 c4 0c             	add    $0xc,%esp
  401f06:	8d 4c 24 74          	lea    0x74(%esp),%ecx
  401f0a:	c6 84 24 d8 00 00 00 	movb   $0x4,0xd8(%esp)
  401f11:	04 
  401f12:	e8 f9 36 00 00       	call   0x405610
  401f17:	e9 40 ff ff ff       	jmp    0x401e5c
  401f1c:	8d 4c 24 40          	lea    0x40(%esp),%ecx
  401f20:	e8 4b 28 00 00       	call   0x404770
  401f25:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
  401f29:	c6 84 24 d8 00 00 00 	movb   $0x6,0xd8(%esp)
  401f30:	06 
  401f31:	e8 3a 28 00 00       	call   0x404770
  401f36:	8d 4c 24 34          	lea    0x34(%esp),%ecx
  401f3a:	c6 84 24 d8 00 00 00 	movb   $0x7,0xd8(%esp)
  401f41:	07 
  401f42:	e8 29 28 00 00       	call   0x404770
  401f47:	8d 4c 24 68          	lea    0x68(%esp),%ecx
  401f4b:	c6 84 24 d8 00 00 00 	movb   $0x8,0xd8(%esp)
  401f52:	08 
  401f53:	e8 18 28 00 00       	call   0x404770
  401f58:	8d 8c 24 84 00 00 00 	lea    0x84(%esp),%ecx
  401f5f:	c6 84 24 d8 00 00 00 	movb   $0x9,0xd8(%esp)
  401f66:	09 
  401f67:	e8 04 28 00 00       	call   0x404770
  401f6c:	33 f6                	xor    %esi,%esi
  401f6e:	8d 4c 24 74          	lea    0x74(%esp),%ecx
  401f72:	c6 84 24 d8 00 00 00 	movb   $0xa,0xd8(%esp)
  401f79:	0a 
  401f7a:	89 5c 24 58          	mov    %ebx,0x58(%esp)
  401f7e:	89 b4 24 90 00 00 00 	mov    %esi,0x90(%esp)
  401f85:	e8 26 35 00 00       	call   0x4054b0
  401f8a:	85 c0                	test   %eax,%eax
  401f8c:	0f 8e ab 03 00 00    	jle    0x40233d
  401f92:	eb 0c                	jmp    0x401fa0
  401f94:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
  401f9b:	eb 03                	jmp    0x401fa0
  401f9d:	8d 49 00             	lea    0x0(%ecx),%ecx
  401fa0:	8b 84 24 b4 00 00 00 	mov    0xb4(%esp),%eax
  401fa7:	85 c0                	test   %eax,%eax
  401fa9:	0f 85 8b 06 00 00    	jne    0x40263a
  401faf:	56                   	push   %esi
  401fb0:	8d 4c 24 78          	lea    0x78(%esp),%ecx
  401fb4:	e8 d7 34 00 00       	call   0x405490
  401fb9:	50                   	push   %eax
  401fba:	8d 4c 24 44          	lea    0x44(%esp),%ecx
  401fbe:	e8 0d 2e 00 00       	call   0x404dd0
  401fc3:	83 7c 24 44 03       	cmpl   $0x3,0x44(%esp)
  401fc8:	0f 8c 4a 03 00 00    	jl     0x402318
  401fce:	8d 4c 24 40          	lea    0x40(%esp),%ecx
  401fd2:	51                   	push   %ecx
  401fd3:	8d 8c 24 88 00 00 00 	lea    0x88(%esp),%ecx
  401fda:	e8 a1 2d 00 00       	call   0x404d80
  401fdf:	6a 00                	push   $0x0
  401fe1:	6a 00                	push   $0x0
  401fe3:	6a 2c                	push   $0x2c
  401fe5:	8d 54 24 28          	lea    0x28(%esp),%edx
  401fe9:	52                   	push   %edx
  401fea:	8d 4c 24 50          	lea    0x50(%esp),%ecx
  401fee:	e8 2d 2e 00 00       	call   0x404e20
  401ff3:	8a 87 84 00 00 00    	mov    0x84(%edi),%al
  401ff9:	84 c0                	test   %al,%al
  401ffb:	74 2b                	je     0x402028
  401ffd:	39 6c 24 20          	cmp    %ebp,0x20(%esp)
  402001:	7c 08                	jl     0x40200b
  402003:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  402007:	85 c0                	test   %eax,%eax
  402009:	75 05                	jne    0x402010
  40200b:	a1 40 04 41 00       	mov    0x410440,%eax
  402010:	6a 07                	push   $0x7
  402012:	68 8c d3 40 00       	push   $0x40d38c  ; 0x40d38c='fcruner'
  402017:	50                   	push   %eax
  402018:	e8 4d 9f 00 00       	call   0x40bf6a
  40201d:	83 c4 0c             	add    $0xc,%esp
  402020:	85 c0                	test   %eax,%eax
  402022:	0f 84 f0 02 00 00    	je     0x402318
  402028:	6a 2c                	push   $0x2c
  40202a:	6a 00                	push   $0x0
  40202c:	8d 4c 24 48          	lea    0x48(%esp),%ecx
  402030:	e8 bb 30 00 00       	call   0x4050f0
  402035:	6a 3b                	push   $0x3b
  402037:	6a 00                	push   $0x0
  402039:	8d 4c 24 48          	lea    0x48(%esp),%ecx
  40203d:	8b d8                	mov    %eax,%ebx
  40203f:	e8 ac 30 00 00       	call   0x4050f0
  402044:	8b f0                	mov    %eax,%esi
  402046:	8d 44 24 5c          	lea    0x5c(%esp),%eax
  40204a:	50                   	push   %eax
  40204b:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  40204f:	e8 2c 2d 00 00       	call   0x404d80
  402054:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
  402058:	51                   	push   %ecx
  402059:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  40205d:	e8 6e 29 00 00       	call   0x4049d0
  402062:	8d 54 24 10          	lea    0x10(%esp),%edx
  402066:	52                   	push   %edx
  402067:	8d 4c 24 6c          	lea    0x6c(%esp),%ecx
  40206b:	e8 10 2d 00 00       	call   0x404d80
  402070:	39 6c 24 14          	cmp    %ebp,0x14(%esp)
  402074:	7c 08                	jl     0x40207e
  402076:	8b 44 24 10          	mov    0x10(%esp),%eax
  40207a:	85 c0                	test   %eax,%eax
  40207c:	75 05                	jne    0x402083
  40207e:	a1 40 04 41 00       	mov    0x410440,%eax
  402083:	53                   	push   %ebx
  402084:	56                   	push   %esi
  402085:	50                   	push   %eax
  402086:	e8 35 20 00 00       	call   0x4040c0
  40208b:	83 c4 0c             	add    $0xc,%esp
  40208e:	85 c0                	test   %eax,%eax
  402090:	0f 85 f4 00 00 00    	jne    0x40218a
  402096:	39 6c 24 20          	cmp    %ebp,0x20(%esp)
  40209a:	7c 08                	jl     0x4020a4
  40209c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  4020a0:	85 c0                	test   %eax,%eax
  4020a2:	75 05                	jne    0x4020a9
  4020a4:	a1 40 04 41 00       	mov    0x410440,%eax
  4020a9:	50                   	push   %eax
  4020aa:	8d 44 24 50          	lea    0x50(%esp),%eax
  4020ae:	68 78 d3 40 00       	push   $0x40d378  ; 0x40d378='Downloading %s...'
  4020b3:	50                   	push   %eax
  4020b4:	e8 47 2c 00 00       	call   0x404d00
  4020b9:	8b 44 24 5c          	mov    0x5c(%esp),%eax
  4020bd:	83 c4 0c             	add    $0xc,%esp
  4020c0:	3b c5                	cmp    %ebp,%eax
  4020c2:	7c 08                	jl     0x4020cc
  4020c4:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  4020c8:	85 c0                	test   %eax,%eax
  4020ca:	75 05                	jne    0x4020d1
  4020cc:	a1 40 04 41 00       	mov    0x410440,%eax
  4020d1:	50                   	push   %eax
  4020d2:	8d 8c 24 98 00 00 00 	lea    0x98(%esp),%ecx
  4020d9:	e8 12 1b 00 00       	call   0x403bf0
  4020de:	8d 47 5c             	lea    0x5c(%edi),%eax
  4020e1:	50                   	push   %eax
  4020e2:	8d 4c 24 2c          	lea    0x2c(%esp),%ecx
  4020e6:	e8 95 2c 00 00       	call   0x404d80
  4020eb:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
  4020ef:	51                   	push   %ecx
  4020f0:	8d 4c 24 2c          	lea    0x2c(%esp),%ecx
  4020f4:	e8 d7 28 00 00       	call   0x4049d0
  4020f9:	39 6c 24 14          	cmp    %ebp,0x14(%esp)
  4020fd:	8b 15 40 04 41 00    	mov    0x410440,%edx
  402103:	7c 0a                	jl     0x40210f
  402105:	8b 44 24 10          	mov    0x10(%esp),%eax
  402109:	85 c0                	test   %eax,%eax
  40210b:	8b c8                	mov    %eax,%ecx
  40210d:	75 02                	jne    0x402111
  40210f:	8b ca                	mov    %edx,%ecx
  402111:	39 6c 24 2c          	cmp    %ebp,0x2c(%esp)
  402115:	7c 08                	jl     0x40211f
  402117:	8b 44 24 28          	mov    0x28(%esp),%eax
  40211b:	85 c0                	test   %eax,%eax
  40211d:	75 02                	jne    0x402121
  40211f:	8b c2                	mov    %edx,%eax
  402121:	51                   	push   %ecx
  402122:	50                   	push   %eax
  402123:	8d 94 24 9c 00 00 00 	lea    0x9c(%esp),%edx
  40212a:	52                   	push   %edx
  40212b:	e8 80 0e 00 00       	call   0x402fb0
  402130:	83 c4 0c             	add    $0xc,%esp
  402133:	85 c0                	test   %eax,%eax
  402135:	0f 84 07 03 00 00    	je     0x402442
  40213b:	39 6c 24 14          	cmp    %ebp,0x14(%esp)
  40213f:	7c 08                	jl     0x402149
  402141:	8b 44 24 10          	mov    0x10(%esp),%eax
  402145:	85 c0                	test   %eax,%eax
  402147:	75 05                	jne    0x40214e
  402149:	a1 40 04 41 00       	mov    0x410440,%eax
  40214e:	56                   	push   %esi
  40214f:	50                   	push   %eax
  402150:	e8 fb 1e 00 00       	call   0x404050
  402155:	83 c4 08             	add    $0x8,%esp
  402158:	85 c0                	test   %eax,%eax
  40215a:	0f 84 27 03 00 00    	je     0x402487
  402160:	39 6c 24 14          	cmp    %ebp,0x14(%esp)
  402164:	7c 08                	jl     0x40216e
  402166:	8b 44 24 10          	mov    0x10(%esp),%eax
  40216a:	85 c0                	test   %eax,%eax
  40216c:	75 05                	jne    0x402173
  40216e:	a1 40 04 41 00       	mov    0x410440,%eax
  402173:	53                   	push   %ebx
  402174:	56                   	push   %esi
  402175:	50                   	push   %eax
  402176:	e8 45 1f 00 00       	call   0x4040c0
  40217b:	83 c4 0c             	add    $0xc,%esp
  40217e:	85 c0                	test   %eax,%eax
  402180:	0f 84 37 03 00 00    	je     0x4024bd
  402186:	ff 44 24 58          	incl   0x58(%esp)
  40218a:	6a 00                	push   $0x0
  40218c:	6a 00                	push   $0x0
  40218e:	6a 2c                	push   $0x2c
  402190:	8d 44 24 40          	lea    0x40(%esp),%eax
  402194:	50                   	push   %eax
  402195:	8d 4c 24 50          	lea    0x50(%esp),%ecx
  402199:	e8 82 2c 00 00       	call   0x404e20
  40219e:	6a 2c                	push   $0x2c
  4021a0:	6a 00                	push   $0x0
  4021a2:	8d 4c 24 48          	lea    0x48(%esp),%ecx
  4021a6:	e8 45 2f 00 00       	call   0x4050f0
  4021ab:	6a 2c                	push   $0x2c
  4021ad:	6a 00                	push   $0x0
  4021af:	8d 4c 24 48          	lea    0x48(%esp),%ecx
  4021b3:	8b d8                	mov    %eax,%ebx
  4021b5:	e8 36 2f 00 00       	call   0x4050f0
  4021ba:	8d 4f 38             	lea    0x38(%edi),%ecx
  4021bd:	51                   	push   %ecx
  4021be:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  4021c2:	8b e8                	mov    %eax,%ebp
  4021c4:	e8 b7 2b 00 00       	call   0x404d80
  4021c9:	8d 54 24 34          	lea    0x34(%esp),%edx
  4021cd:	52                   	push   %edx
  4021ce:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  4021d2:	e8 f9 27 00 00       	call   0x4049d0
  4021d7:	83 7c 24 14 01       	cmpl   $0x1,0x14(%esp)
  4021dc:	7c 08                	jl     0x4021e6
  4021de:	8b 44 24 10          	mov    0x10(%esp),%eax
  4021e2:	85 c0                	test   %eax,%eax
  4021e4:	75 05                	jne    0x4021eb
  4021e6:	a1 40 04 41 00       	mov    0x410440,%eax
  4021eb:	53                   	push   %ebx
  4021ec:	55                   	push   %ebp
  4021ed:	50                   	push   %eax
  4021ee:	e8 cd 1e 00 00       	call   0x4040c0
  4021f3:	83 c4 0c             	add    $0xc,%esp
  4021f6:	85 c0                	test   %eax,%eax
  4021f8:	0f 85 1a 01 00 00    	jne    0x402318
  4021fe:	8d 8c 24 c0 00 00 00 	lea    0xc0(%esp),%ecx
  402205:	e8 66 25 00 00       	call   0x404770
  40220a:	8b 44 24 38          	mov    0x38(%esp),%eax
  40220e:	be 01 00 00 00       	mov    $0x1,%esi
  402213:	3b c6                	cmp    %esi,%eax
  402215:	c6 84 24 d8 00 00 00 	movb   $0xb,0xd8(%esp)
  40221c:	0b 
  40221d:	7c 08                	jl     0x402227
  40221f:	8b 44 24 34          	mov    0x34(%esp),%eax
  402223:	85 c0                	test   %eax,%eax
  402225:	75 05                	jne    0x40222c
  402227:	a1 40 04 41 00       	mov    0x410440,%eax
  40222c:	50                   	push   %eax
  40222d:	8d 44 24 50          	lea    0x50(%esp),%eax
  402231:	68 64 d3 40 00       	push   $0x40d364  ; 0x40d364='Uncab file %s...'
  402236:	50                   	push   %eax
  402237:	e8 c4 2a 00 00       	call   0x404d00
  40223c:	8b 44 24 5c          	mov    0x5c(%esp),%eax
  402240:	83 c4 0c             	add    $0xc,%esp
  402243:	3b c6                	cmp    %esi,%eax
  402245:	7c 08                	jl     0x40224f
  402247:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  40224b:	85 c0                	test   %eax,%eax
  40224d:	75 05                	jne    0x402254
  40224f:	a1 40 04 41 00       	mov    0x410440,%eax
  402254:	50                   	push   %eax
  402255:	8d 8c 24 98 00 00 00 	lea    0x98(%esp),%ecx
  40225c:	e8 8f 19 00 00       	call   0x403bf0
  402261:	39 74 24 14          	cmp    %esi,0x14(%esp)
  402265:	8b 0d 40 04 41 00    	mov    0x410440,%ecx
  40226b:	7c 0a                	jl     0x402277
  40226d:	8b 44 24 10          	mov    0x10(%esp),%eax
  402271:	85 c0                	test   %eax,%eax
  402273:	8b f8                	mov    %eax,%edi
  402275:	75 02                	jne    0x402279
  402277:	8b f9                	mov    %ecx,%edi
  402279:	83 7c 24 6c 01       	cmpl   $0x1,0x6c(%esp)
  40227e:	7c 08                	jl     0x402288
  402280:	8b 44 24 68          	mov    0x68(%esp),%eax
  402284:	85 c0                	test   %eax,%eax
  402286:	75 02                	jne    0x40228a
  402288:	8b c1                	mov    %ecx,%eax
  40228a:	50                   	push   %eax
  40228b:	8d b4 24 c4 00 00 00 	lea    0xc4(%esp),%esi
  402292:	e8 39 f6 ff ff       	call   0x4018d0
  402297:	83 c4 04             	add    $0x4,%esp
  40229a:	85 c0                	test   %eax,%eax
  40229c:	0f 84 92 02 00 00    	je     0x402534
  4022a2:	8b 44 24 14          	mov    0x14(%esp),%eax
  4022a6:	bf 01 00 00 00       	mov    $0x1,%edi
  4022ab:	3b c7                	cmp    %edi,%eax
  4022ad:	7c 08                	jl     0x4022b7
  4022af:	8b 44 24 10          	mov    0x10(%esp),%eax
  4022b3:	85 c0                	test   %eax,%eax
  4022b5:	75 05                	jne    0x4022bc
  4022b7:	a1 40 04 41 00       	mov    0x410440,%eax
  4022bc:	55                   	push   %ebp
  4022bd:	50                   	push   %eax
  4022be:	e8 8d 1d 00 00       	call   0x404050
  4022c3:	83 c4 08             	add    $0x8,%esp
  4022c6:	85 c0                	test   %eax,%eax
  4022c8:	0f 84 85 02 00 00    	je     0x402553
  4022ce:	39 7c 24 14          	cmp    %edi,0x14(%esp)
  4022d2:	7c 08                	jl     0x4022dc
  4022d4:	8b 44 24 10          	mov    0x10(%esp),%eax
  4022d8:	85 c0                	test   %eax,%eax
  4022da:	75 05                	jne    0x4022e1
  4022dc:	a1 40 04 41 00       	mov    0x410440,%eax
  4022e1:	53                   	push   %ebx
  4022e2:	55                   	push   %ebp
  4022e3:	50                   	push   %eax
  4022e4:	e8 d7 1d 00 00       	call   0x4040c0
  4022e9:	83 c4 0c             	add    $0xc,%esp
  4022ec:	85 c0                	test   %eax,%eax
  4022ee:	0f 84 8d 02 00 00    	je     0x402581
  4022f4:	8b 44 24 58          	mov    0x58(%esp),%eax
  4022f8:	40                   	inc    %eax
  4022f9:	8d 8c 24 c0 00 00 00 	lea    0xc0(%esp),%ecx
  402300:	89 44 24 58          	mov    %eax,0x58(%esp)
  402304:	c6 84 24 d8 00 00 00 	movb   $0xa,0xd8(%esp)
  40230b:	0a 
  40230c:	e8 9f f2 ff ff       	call   0x4015b0
  402311:	8b bc 24 cc 00 00 00 	mov    0xcc(%esp),%edi
  402318:	8b b4 24 90 00 00 00 	mov    0x90(%esp),%esi
  40231f:	46                   	inc    %esi
  402320:	8d 4c 24 74          	lea    0x74(%esp),%ecx
  402324:	89 b4 24 90 00 00 00 	mov    %esi,0x90(%esp)
  40232b:	e8 80 31 00 00       	call   0x4054b0
  402330:	3b f0                	cmp    %eax,%esi
  402332:	bd 01 00 00 00       	mov    $0x1,%ebp
  402337:	0f 8c 63 fc ff ff    	jl     0x401fa0
  40233d:	68 58 d3 40 00       	push   $0x40d358  ; 0x40d358='Update ok!'
  402342:	8d 8c 24 98 00 00 00 	lea    0x98(%esp),%ecx
  402349:	e8 a2 18 00 00       	call   0x403bf0
  40234e:	8b 44 24 58          	mov    0x58(%esp),%eax
  402352:	85 c0                	test   %eax,%eax
  402354:	7e 0b                	jle    0x402361
  402356:	68 2c 01 00 00       	push   $0x12c
  40235b:	ff 15 20 d0 40 00    	call   *0x40d020  ; 0x40d020=KERNEL32.dll!Sleep
  402361:	8d 8c 24 84 00 00 00 	lea    0x84(%esp),%ecx
  402368:	c6 84 24 d8 00 00 00 	movb   $0x9,0xd8(%esp)
  40236f:	09 
  402370:	e8 3b f2 ff ff       	call   0x4015b0
  402375:	8d 4c 24 68          	lea    0x68(%esp),%ecx
  402379:	c6 84 24 d8 00 00 00 	movb   $0x8,0xd8(%esp)
  402380:	08 
  402381:	e8 2a f2 ff ff       	call   0x4015b0
  402386:	8d 4c 24 34          	lea    0x34(%esp),%ecx
  40238a:	c6 84 24 d8 00 00 00 	movb   $0x7,0xd8(%esp)
  402391:	07 
  402392:	e8 19 f2 ff ff       	call   0x4015b0
  402397:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
  40239b:	c6 84 24 d8 00 00 00 	movb   $0x6,0xd8(%esp)
  4023a2:	06 
  4023a3:	e8 08 f2 ff ff       	call   0x4015b0
  4023a8:	8d 4c 24 40          	lea    0x40(%esp),%ecx
  4023ac:	c6 84 24 d8 00 00 00 	movb   $0x5,0xd8(%esp)
  4023b3:	05 
  4023b4:	e8 f7 f1 ff ff       	call   0x4015b0
  4023b9:	8d 4c 24 74          	lea    0x74(%esp),%ecx
  4023bd:	c6 84 24 d8 00 00 00 	movb   $0x4,0xd8(%esp)
  4023c4:	04 
  4023c5:	e8 46 32 00 00       	call   0x405610
  4023ca:	8d 8c 24 94 00 00 00 	lea    0x94(%esp),%ecx
  4023d1:	c6 84 24 d8 00 00 00 	movb   $0x3,0xd8(%esp)
  4023d8:	03 
  4023d9:	e8 a2 16 00 00       	call   0x403a80
  4023de:	8d 4c 24 4c          	lea    0x4c(%esp),%ecx
  4023e2:	c6 84 24 d8 00 00 00 	movb   $0x2,0xd8(%esp)
  4023e9:	02 
  4023ea:	e8 c1 f1 ff ff       	call   0x4015b0
  4023ef:	8d 4c 24 28          	lea    0x28(%esp),%ecx
  4023f3:	c6 84 24 d8 00 00 00 	movb   $0x1,0xd8(%esp)
  4023fa:	01 
  4023fb:	e8 b0 f1 ff ff       	call   0x4015b0
  402400:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  402404:	c6 84 24 d8 00 00 00 	movb   $0x0,0xd8(%esp)
  40240b:	00 
  40240c:	e8 9f f1 ff ff       	call   0x4015b0
  402411:	8d 4c 24 5c          	lea    0x5c(%esp),%ecx
  402415:	c7 84 24 d8 00 00 00 	movl   $0xffffffff,0xd8(%esp)
  40241c:	ff ff ff ff 
  402420:	e8 8b f1 ff ff       	call   0x4015b0
  402425:	8b c5                	mov    %ebp,%eax
  402427:	5e                   	pop    %esi
  402428:	8b 8c 24 cc 00 00 00 	mov    0xcc(%esp),%ecx
  40242f:	5f                   	pop    %edi
  402430:	5d                   	pop    %ebp
  402431:	5b                   	pop    %ebx
  402432:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  402439:	81 c4 cc 00 00 00    	add    $0xcc,%esp
  40243f:	c2 04 00             	ret    $0x4
  402442:	8b 84 24 b4 00 00 00 	mov    0xb4(%esp),%eax
  402449:	85 c0                	test   %eax,%eax
  40244b:	0f 85 e9 01 00 00    	jne    0x40263a
  402451:	39 6c 24 20          	cmp    %ebp,0x20(%esp)
  402455:	7c 08                	jl     0x40245f
  402457:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  40245b:	85 c0                	test   %eax,%eax
  40245d:	75 05                	jne    0x402464
  40245f:	a1 40 04 41 00       	mov    0x410440,%eax
  402464:	50                   	push   %eax
  402465:	68 44 d3 40 00       	push   $0x40d344  ; 0x40d344="Can't download %"
  40246a:	8b 8c 24 e8 00 00 00 	mov    0xe8(%esp),%ecx
  402471:	51                   	push   %ecx
  402472:	8d 94 24 a0 00 00 00 	lea    0xa0(%esp),%edx
  402479:	52                   	push   %edx
  40247a:	e8 61 f7 ff ff       	call   0x401be0
  40247f:	83 c4 10             	add    $0x10,%esp
  402482:	e9 b3 01 00 00       	jmp    0x40263a
  402487:	39 6c 24 20          	cmp    %ebp,0x20(%esp)
  40248b:	7c 08                	jl     0x402495
  40248d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  402491:	85 c0                	test   %eax,%eax
  402493:	75 05                	jne    0x40249a
  402495:	a1 40 04 41 00       	mov    0x410440,%eax
  40249a:	50                   	push   %eax
  40249b:	8b 84 24 e4 00 00 00 	mov    0xe4(%esp),%eax
  4024a2:	68 2c d3 40 00       	push   $0x40d32c  ; 0x40d32c="Can't set file %s date"
  4024a7:	50                   	push   %eax
  4024a8:	8d 8c 24 a0 00 00 00 	lea    0xa0(%esp),%ecx
  4024af:	51                   	push   %ecx
  4024b0:	e8 2b f7 ff ff       	call   0x401be0
  4024b5:	83 c4 10             	add    $0x10,%esp
  4024b8:	e9 7d 01 00 00       	jmp    0x40263a
  4024bd:	39 6c 24 14          	cmp    %ebp,0x14(%esp)
  4024c1:	7c 08                	jl     0x4024cb
  4024c3:	8b 44 24 10          	mov    0x10(%esp),%eax
  4024c7:	85 c0                	test   %eax,%eax
  4024c9:	75 05                	jne    0x4024d0
  4024cb:	a1 40 04 41 00       	mov    0x410440,%eax
  4024d0:	6a 00                	push   $0x0
  4024d2:	56                   	push   %esi
  4024d3:	50                   	push   %eax
  4024d4:	e8 e7 1b 00 00       	call   0x4040c0
  4024d9:	83 c4 0c             	add    $0xc,%esp
  4024dc:	85 c0                	test   %eax,%eax
  4024de:	8b 44 24 20          	mov    0x20(%esp),%eax
  4024e2:	75 34                	jne    0x402518
  4024e4:	3b c5                	cmp    %ebp,%eax
  4024e6:	7c 08                	jl     0x4024f0
  4024e8:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  4024ec:	85 c0                	test   %eax,%eax
  4024ee:	75 05                	jne    0x4024f5
  4024f0:	a1 40 04 41 00       	mov    0x410440,%eax
  4024f5:	8b 94 24 e0 00 00 00 	mov    0xe0(%esp),%edx
  4024fc:	50                   	push   %eax
  4024fd:	68 14 d3 40 00       	push   $0x40d314  ; 0x40d314='Check file %s date err'
  402502:	52                   	push   %edx
  402503:	8d 84 24 a0 00 00 00 	lea    0xa0(%esp),%eax
  40250a:	50                   	push   %eax
  40250b:	e8 d0 f6 ff ff       	call   0x401be0
  402510:	83 c4 10             	add    $0x10,%esp
  402513:	e9 22 01 00 00       	jmp    0x40263a
  402518:	3b c5                	cmp    %ebp,%eax
  40251a:	7c 08                	jl     0x402524
  40251c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  402520:	85 c0                	test   %eax,%eax
  402522:	75 05                	jne    0x402529
  402524:	a1 40 04 41 00       	mov    0x410440,%eax
  402529:	50                   	push   %eax
  40252a:	68 f8 d2 40 00       	push   $0x40d2f8  ; 0x40d2f8='Check file %s length err'
  40252f:	e9 36 ff ff ff       	jmp    0x40246a
  402534:	83 7c 24 38 01       	cmpl   $0x1,0x38(%esp)
  402539:	7c 08                	jl     0x402543
  40253b:	8b 44 24 34          	mov    0x34(%esp),%eax
  40253f:	85 c0                	test   %eax,%eax
  402541:	75 05                	jne    0x402548
  402543:	a1 40 04 41 00       	mov    0x410440,%eax
  402548:	50                   	push   %eax
  402549:	68 e4 d2 40 00       	push   $0x40d2e4  ; 0x40d2e4='Uncab %s failed!'
  40254e:	e9 bb 00 00 00       	jmp    0x40260e
  402553:	39 7c 24 38          	cmp    %edi,0x38(%esp)
  402557:	7c 08                	jl     0x402561
  402559:	8b 44 24 34          	mov    0x34(%esp),%eax
  40255d:	85 c0                	test   %eax,%eax
  40255f:	75 05                	jne    0x402566
  402561:	a1 40 04 41 00       	mov    0x410440,%eax
  402566:	8b 94 24 e0 00 00 00 	mov    0xe0(%esp),%edx
  40256d:	50                   	push   %eax
  40256e:	68 d0 d2 40 00       	push   $0x40d2d0  ; 0x40d2d0="Can't set %s date"
  402573:	52                   	push   %edx
  402574:	8d 84 24 a0 00 00 00 	lea    0xa0(%esp),%eax
  40257b:	50                   	push   %eax
  40257c:	e9 9d 00 00 00       	jmp    0x40261e
  402581:	39 7c 24 14          	cmp    %edi,0x14(%esp)
  402585:	7c 08                	jl     0x40258f
  402587:	8b 44 24 10          	mov    0x10(%esp),%eax
  40258b:	85 c0                	test   %eax,%eax
  40258d:	75 05                	jne    0x402594
  40258f:	a1 40 04 41 00       	mov    0x410440,%eax
  402594:	6a 00                	push   $0x0
  402596:	55                   	push   %ebp
  402597:	50                   	push   %eax
  402598:	e8 23 1b 00 00       	call   0x4040c0
  40259d:	83 c4 0c             	add    $0xc,%esp
  4025a0:	85 c0                	test   %eax,%eax
  4025a2:	75 51                	jne    0x4025f5
  4025a4:	39 7c 24 14          	cmp    %edi,0x14(%esp)
  4025a8:	8b 35 40 04 41 00    	mov    0x410440,%esi
  4025ae:	7c 08                	jl     0x4025b8
  4025b0:	8b 44 24 10          	mov    0x10(%esp),%eax
  4025b4:	85 c0                	test   %eax,%eax
  4025b6:	75 02                	jne    0x4025ba
  4025b8:	8b c6                	mov    %esi,%eax
  4025ba:	39 7c 24 38          	cmp    %edi,0x38(%esp)
  4025be:	7c 0a                	jl     0x4025ca
  4025c0:	8b 4c 24 34          	mov    0x34(%esp),%ecx
  4025c4:	85 c9                	test   %ecx,%ecx
  4025c6:	74 02                	je     0x4025ca
  4025c8:	8b f1                	mov    %ecx,%esi
  4025ca:	55                   	push   %ebp
  4025cb:	50                   	push   %eax
  4025cc:	e8 3f 1c 00 00       	call   0x404210
  4025d1:	8b 8c 24 e8 00 00 00 	mov    0xe8(%esp),%ecx
  4025d8:	83 c4 04             	add    $0x4,%esp
  4025db:	50                   	push   %eax
  4025dc:	56                   	push   %esi
  4025dd:	68 a8 d2 40 00       	push   $0x40d2a8  ; 0x40d2a8='Check uncab %s date err,%X must be %X'
  4025e2:	51                   	push   %ecx
  4025e3:	8d 94 24 a8 00 00 00 	lea    0xa8(%esp),%edx
  4025ea:	52                   	push   %edx
  4025eb:	e8 f0 f5 ff ff       	call   0x401be0
  4025f0:	83 c4 18             	add    $0x18,%esp
  4025f3:	eb 31                	jmp    0x402626
  4025f5:	39 7c 24 38          	cmp    %edi,0x38(%esp)
  4025f9:	7c 08                	jl     0x402603
  4025fb:	8b 44 24 34          	mov    0x34(%esp),%eax
  4025ff:	85 c0                	test   %eax,%eax
  402601:	75 05                	jne    0x402608
  402603:	a1 40 04 41 00       	mov    0x410440,%eax
  402608:	50                   	push   %eax
  402609:	68 8c d2 40 00       	push   $0x40d28c  ; 0x40d28c='Check uncab %s length err'
  40260e:	8b 84 24 e8 00 00 00 	mov    0xe8(%esp),%eax
  402615:	50                   	push   %eax
  402616:	8d 8c 24 a0 00 00 00 	lea    0xa0(%esp),%ecx
  40261d:	51                   	push   %ecx
  40261e:	e8 bd f5 ff ff       	call   0x401be0
  402623:	83 c4 10             	add    $0x10,%esp
  402626:	8d 8c 24 c0 00 00 00 	lea    0xc0(%esp),%ecx
  40262d:	c6 84 24 d8 00 00 00 	movb   $0xa,0xd8(%esp)
  402634:	0a 
  402635:	e8 76 ef ff ff       	call   0x4015b0
  40263a:	8d 8c 24 84 00 00 00 	lea    0x84(%esp),%ecx
  402641:	c6 84 24 d8 00 00 00 	movb   $0x9,0xd8(%esp)
  402648:	09 
  402649:	e8 62 ef ff ff       	call   0x4015b0
  40264e:	8d 4c 24 68          	lea    0x68(%esp),%ecx
  402652:	c6 84 24 d8 00 00 00 	movb   $0x8,0xd8(%esp)
  402659:	08 
  40265a:	e8 51 ef ff ff       	call   0x4015b0
  40265f:	8d 4c 24 34          	lea    0x34(%esp),%ecx
  402663:	c6 84 24 d8 00 00 00 	movb   $0x7,0xd8(%esp)
  40266a:	07 
  40266b:	e8 40 ef ff ff       	call   0x4015b0
  402670:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
  402674:	c6 84 24 d8 00 00 00 	movb   $0x6,0xd8(%esp)
  40267b:	06 
  40267c:	e8 2f ef ff ff       	call   0x4015b0
  402681:	8d 4c 24 40          	lea    0x40(%esp),%ecx
  402685:	c6 84 24 d8 00 00 00 	movb   $0x5,0xd8(%esp)
  40268c:	05 
  40268d:	e8 1e ef ff ff       	call   0x4015b0
  402692:	8d 4c 24 74          	lea    0x74(%esp),%ecx
  402696:	c6 84 24 d8 00 00 00 	movb   $0x4,0xd8(%esp)
  40269d:	04 
  40269e:	e8 6d 2f 00 00       	call   0x405610
  4026a3:	e9 b4 f7 ff ff       	jmp    0x401e5c
  4026a8:	cc                   	int3
  4026a9:	cc                   	int3
  4026aa:	cc                   	int3
  4026ab:	cc                   	int3
  4026ac:	cc                   	int3
  4026ad:	cc                   	int3
  4026ae:	cc                   	int3
  4026af:	cc                   	int3
  4026b0:	81 ec 04 05 00 00    	sub    $0x504,%esp
  4026b6:	53                   	push   %ebx
  4026b7:	56                   	push   %esi
  4026b8:	57                   	push   %edi
  4026b9:	68 4e d4 40 00       	push   $0x40d44e
  4026be:	8b f1                	mov    %ecx,%esi
  4026c0:	68 44 d4 40 00       	push   $0x40d444  ; 0x40d444='cachepath'
  4026c5:	68 3c d4 40 00       	push   $0x40d43c  ; 0x40d43c='fcbox3'
  4026ca:	8d 7e 2c             	lea    0x2c(%esi),%edi
  4026cd:	e8 ce f0 ff ff       	call   0x4017a0
  4026d2:	83 c4 0c             	add    $0xc,%esp
  4026d5:	50                   	push   %eax
  4026d6:	8b cf                	mov    %edi,%ecx
  4026d8:	e8 f3 26 00 00       	call   0x404dd0
  4026dd:	83 7e 30 03          	cmpl   $0x3,0x30(%esi)
  4026e1:	7d 3b                	jge    0x40271e
  4026e3:	68 04 01 00 00       	push   $0x104
  4026e8:	8d 44 24 10          	lea    0x10(%esp),%eax
  4026ec:	50                   	push   %eax
  4026ed:	ff 15 28 d0 40 00    	call   *0x40d028  ; 0x40d028=KERNEL32.dll!GetWindowsDirectoryA
  4026f3:	83 f8 01             	cmp    $0x1,%eax
  4026f6:	73 0e                	jae    0x402706
  4026f8:	68 30 d4 40 00       	push   $0x40d430  ; 0x40d430='C:\\fcbox3\\'
  4026fd:	8b cf                	mov    %edi,%ecx
  4026ff:	e8 cc 26 00 00       	call   0x404dd0
  402704:	eb 18                	jmp    0x40271e
  402706:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
  40270a:	51                   	push   %ecx
  40270b:	8b cf                	mov    %edi,%ecx
  40270d:	e8 be 26 00 00       	call   0x404dd0
  402712:	68 24 d4 40 00       	push   $0x40d424  ; 0x40d424='\\fcbox3\\'
  402717:	8b cf                	mov    %edi,%ecx
  402719:	e8 d2 22 00 00       	call   0x4049f0
  40271e:	6a 5c                	push   $0x5c
  402720:	8b cf                	mov    %edi,%ecx
  402722:	e8 19 25 00 00       	call   0x404c40
  402727:	68 20 d4 40 00       	push   $0x40d420
  40272c:	8b cf                	mov    %edi,%ecx
  40272e:	e8 bd 22 00 00       	call   0x4049f0
  402733:	68 00 04 00 00       	push   $0x400
  402738:	8d 94 24 14 01 00 00 	lea    0x114(%esp),%edx
  40273f:	52                   	push   %edx
  402740:	ff 15 24 d0 40 00    	call   *0x40d024  ; 0x40d024=KERNEL32.dll!GetSystemDirectoryA
  402746:	8d 84 24 10 01 00 00 	lea    0x110(%esp),%eax
  40274d:	8d 7e 38             	lea    0x38(%esi),%edi
  402750:	50                   	push   %eax
  402751:	8b cf                	mov    %edi,%ecx
  402753:	e8 78 26 00 00       	call   0x404dd0
  402758:	68 20 d4 40 00       	push   $0x40d420
  40275d:	8b cf                	mov    %edi,%ecx
  40275f:	e8 8c 22 00 00       	call   0x4049f0
  402764:	8d 5e 44             	lea    0x44(%esi),%ebx
  402767:	57                   	push   %edi
  402768:	8b cb                	mov    %ebx,%ecx
  40276a:	e8 11 26 00 00       	call   0x404d80
  40276f:	8d 4e 14             	lea    0x14(%esi),%ecx
  402772:	51                   	push   %ecx
  402773:	8b cb                	mov    %ebx,%ecx
  402775:	e8 56 22 00 00       	call   0x4049d0
  40277a:	8d 5e 50             	lea    0x50(%esi),%ebx
  40277d:	57                   	push   %edi
  40277e:	8b cb                	mov    %ebx,%ecx
  402780:	e8 fb 25 00 00       	call   0x404d80
  402785:	68 40 03 41 00       	push   $0x410340  ; 0x410340='fcruner.exe'
  40278a:	8b cb                	mov    %ebx,%ecx
  40278c:	e8 5f 22 00 00       	call   0x4049f0
  402791:	68 00 d4 40 00       	push   $0x40d400  ; 0x40d400='http://fcbox/download/system'
  402796:	68 f4 d3 40 00       	push   $0x40d3f4  ; 0x40d3f4='syshomeadd'
  40279b:	68 3c d4 40 00       	push   $0x40d43c  ; 0x40d43c='fcbox3'
  4027a0:	83 c6 5c             	add    $0x5c,%esi
  4027a3:	e8 f8 ef ff ff       	call   0x4017a0
  4027a8:	83 c4 0c             	add    $0xc,%esp
  4027ab:	50                   	push   %eax
  4027ac:	8b ce                	mov    %esi,%ecx
  4027ae:	e8 1d 26 00 00       	call   0x404dd0
  4027b3:	6a 2f                	push   $0x2f
  4027b5:	8b ce                	mov    %esi,%ecx
  4027b7:	e8 84 24 00 00       	call   0x404c40
  4027bc:	68 38 d2 40 00       	push   $0x40d238
  4027c1:	8b ce                	mov    %esi,%ecx
  4027c3:	e8 28 22 00 00       	call   0x4049f0
  4027c8:	5f                   	pop    %edi
  4027c9:	5e                   	pop    %esi
  4027ca:	5b                   	pop    %ebx
  4027cb:	81 c4 04 05 00 00    	add    $0x504,%esp
  4027d1:	c3                   	ret
  4027d2:	cc                   	int3
  4027d3:	cc                   	int3
  4027d4:	cc                   	int3
  4027d5:	cc                   	int3
  4027d6:	cc                   	int3
  4027d7:	cc                   	int3
  4027d8:	cc                   	int3
  4027d9:	cc                   	int3
  4027da:	cc                   	int3
  4027db:	cc                   	int3
  4027dc:	cc                   	int3
  4027dd:	cc                   	int3
  4027de:	cc                   	int3
  4027df:	cc                   	int3
  4027e0:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
  4027e6:	6a ff                	push   $0xffffffff
  4027e8:	68 3b c2 40 00       	push   $0x40c23b
  4027ed:	50                   	push   %eax
  4027ee:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
  4027f5:	81 ec 10 01 00 00    	sub    $0x110,%esp
  4027fb:	53                   	push   %ebx
  4027fc:	56                   	push   %esi
  4027fd:	8b f1                	mov    %ecx,%esi
  4027ff:	8b 46 6c             	mov    0x6c(%esi),%eax
  402802:	33 db                	xor    %ebx,%ebx
  402804:	3b c3                	cmp    %ebx,%eax
  402806:	74 07                	je     0x40280f
  402808:	33 c0                	xor    %eax,%eax
  40280a:	e9 a9 02 00 00       	jmp    0x402ab8
  40280f:	8b 84 24 28 01 00 00 	mov    0x128(%esp),%eax
  402816:	3b c3                	cmp    %ebx,%eax
  402818:	57                   	push   %edi
  402819:	bf 01 00 00 00       	mov    $0x1,%edi
  40281e:	89 7e 6c             	mov    %edi,0x6c(%esi)
  402821:	74 03                	je     0x402826
  402823:	89 46 0c             	mov    %eax,0xc(%esi)
  402826:	55                   	push   %ebp
  402827:	8b ac 24 34 01 00 00 	mov    0x134(%esp),%ebp
  40282e:	3b eb                	cmp    %ebx,%ebp
  402830:	75 05                	jne    0x402837
  402832:	8b 6e 10             	mov    0x10(%esi),%ebp
  402835:	eb 03                	jmp    0x40283a
  402837:	89 6e 10             	mov    %ebp,0x10(%esi)
  40283a:	68 04 01 00 00       	push   $0x104
  40283f:	8d 44 24 20          	lea    0x20(%esp),%eax
  402843:	50                   	push   %eax
  402844:	53                   	push   %ebx
  402845:	ff 15 24 d1 40 00    	call   *0x40d124  ; 0x40d124=KERNEL32.dll!GetModuleFileNameA
  40284b:	8d 44 24 1c          	lea    0x1c(%esp),%eax
  40284f:	8d 50 01             	lea    0x1(%eax),%edx
  402852:	8a 08                	mov    (%eax),%cl
  402854:	40                   	inc    %eax
  402855:	3a cb                	cmp    %bl,%cl
  402857:	75 f9                	jne    0x402852
  402859:	2b c2                	sub    %edx,%eax
  40285b:	8a 54 04 1c          	mov    0x1c(%esp,%eax,1),%dl
  40285f:	b1 5c                	mov    $0x5c,%cl
  402861:	3a d1                	cmp    %cl,%dl
  402863:	74 0d                	je     0x402872
  402865:	3b c3                	cmp    %ebx,%eax
  402867:	7e 09                	jle    0x402872
  402869:	8a 54 04 1b          	mov    0x1b(%esp,%eax,1),%dl
  40286d:	48                   	dec    %eax
  40286e:	3a d1                	cmp    %cl,%dl
  402870:	75 f3                	jne    0x402865
  402872:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  402876:	88 5c 04 1c          	mov    %bl,0x1c(%esp,%eax,1)
  40287a:	e8 f1 1e 00 00       	call   0x404770
  40287f:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
  402883:	51                   	push   %ecx
  402884:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  402888:	89 9c 24 2c 01 00 00 	mov    %ebx,0x12c(%esp)
  40288f:	e8 3c 25 00 00       	call   0x404dd0
  402894:	68 20 d4 40 00       	push   $0x40d420
  402899:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  40289d:	e8 4e 21 00 00       	call   0x4049f0
  4028a2:	8d 54 24 1c          	lea    0x1c(%esp),%edx
  4028a6:	52                   	push   %edx
  4028a7:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  4028ab:	e8 20 25 00 00       	call   0x404dd0
  4028b0:	68 20 d4 40 00       	push   $0x40d420
  4028b5:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  4028b9:	e8 32 21 00 00       	call   0x4049f0
  4028be:	8d 46 14             	lea    0x14(%esi),%eax
  4028c1:	50                   	push   %eax
  4028c2:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  4028c6:	e8 05 21 00 00       	call   0x4049d0
  4028cb:	39 7c 24 14          	cmp    %edi,0x14(%esp)
  4028cf:	7c 08                	jl     0x4028d9
  4028d1:	8b 44 24 10          	mov    0x10(%esp),%eax
  4028d5:	3b c3                	cmp    %ebx,%eax
  4028d7:	75 05                	jne    0x4028de
  4028d9:	a1 40 04 41 00       	mov    0x410440,%eax
  4028de:	53                   	push   %ebx
  4028df:	53                   	push   %ebx
  4028e0:	50                   	push   %eax
  4028e1:	e8 da 17 00 00       	call   0x4040c0
  4028e6:	83 c4 0c             	add    $0xc,%esp
  4028e9:	85 c0                	test   %eax,%eax
  4028eb:	74 0d                	je     0x4028fa
  4028ed:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  4028f1:	51                   	push   %ecx
  4028f2:	8d 4e 44             	lea    0x44(%esi),%ecx
  4028f5:	e8 86 24 00 00       	call   0x404d80
  4028fa:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  4028fe:	c7 84 24 28 01 00 00 	movl   $0xffffffff,0x128(%esp)
  402905:	ff ff ff ff 
  402909:	e8 a2 ec ff ff       	call   0x4015b0
  40290e:	39 5e 68             	cmp    %ebx,0x68(%esi)
  402911:	75 20                	jne    0x402933
  402913:	39 7e 48             	cmp    %edi,0x48(%esi)
  402916:	7c 07                	jl     0x40291f
  402918:	8b 46 44             	mov    0x44(%esi),%eax
  40291b:	3b c3                	cmp    %ebx,%eax
  40291d:	75 05                	jne    0x402924
  40291f:	a1 40 04 41 00       	mov    0x410440,%eax
  402924:	53                   	push   %ebx
  402925:	53                   	push   %ebx
  402926:	50                   	push   %eax
  402927:	e8 94 17 00 00       	call   0x4040c0
  40292c:	83 c4 0c             	add    $0xc,%esp
  40292f:	85 c0                	test   %eax,%eax
  402931:	75 21                	jne    0x402954
  402933:	55                   	push   %ebp
  402934:	8b ce                	mov    %esi,%ecx
  402936:	e8 05 f3 ff ff       	call   0x401c40
  40293b:	85 c0                	test   %eax,%eax
  40293d:	75 15                	jne    0x402954
  40293f:	68 d8 d4 40 00       	push   $0x40d4d8  ; 0x40d4d8='Update System err'
  402944:	56                   	push   %esi
  402945:	e8 06 ee ff ff       	call   0x401750
  40294a:	83 c4 08             	add    $0x8,%esp
  40294d:	33 c0                	xor    %eax,%eax
  40294f:	e9 62 01 00 00       	jmp    0x402ab6
  402954:	39 7e 48             	cmp    %edi,0x48(%esi)
  402957:	7c 07                	jl     0x402960
  402959:	8b 46 44             	mov    0x44(%esi),%eax
  40295c:	3b c3                	cmp    %ebx,%eax
  40295e:	75 05                	jne    0x402965
  402960:	a1 40 04 41 00       	mov    0x410440,%eax
  402965:	8b 3d 30 d0 40 00    	mov    0x40d030,%edi  ; 0x40d030=KERNEL32.dll!LoadLibraryA
  40296b:	50                   	push   %eax
  40296c:	ff d7                	call   *%edi
  40296e:	3b c3                	cmp    %ebx,%eax
  402970:	89 06                	mov    %eax,(%esi)
  402972:	75 73                	jne    0x4029e7
  402974:	55                   	push   %ebp
  402975:	8b ce                	mov    %esi,%ecx
  402977:	e8 c4 f2 ff ff       	call   0x401c40
  40297c:	85 c0                	test   %eax,%eax
  40297e:	75 18                	jne    0x402998
  402980:	68 d8 d4 40 00       	push   $0x40d4d8  ; 0x40d4d8='Update System err'
  402985:	56                   	push   %esi
  402986:	e8 c5 ed ff ff       	call   0x401750
  40298b:	83 c4 08             	add    $0x8,%esp
  40298e:	89 5e 6c             	mov    %ebx,0x6c(%esi)
  402991:	33 c0                	xor    %eax,%eax
  402993:	e9 1e 01 00 00       	jmp    0x402ab6
  402998:	83 7e 48 01          	cmpl   $0x1,0x48(%esi)
  40299c:	7c 07                	jl     0x4029a5
  40299e:	8b 46 44             	mov    0x44(%esi),%eax
  4029a1:	3b c3                	cmp    %ebx,%eax
  4029a3:	75 05                	jne    0x4029aa
  4029a5:	a1 40 04 41 00       	mov    0x410440,%eax
  4029aa:	50                   	push   %eax
  4029ab:	ff d7                	call   *%edi
  4029ad:	3b c3                	cmp    %ebx,%eax
  4029af:	89 06                	mov    %eax,(%esi)
  4029b1:	75 34                	jne    0x4029e7
  4029b3:	83 7e 48 01          	cmpl   $0x1,0x48(%esi)
  4029b7:	7c 09                	jl     0x4029c2
  4029b9:	8b 46 44             	mov    0x44(%esi),%eax
  4029bc:	3b c3                	cmp    %ebx,%eax
  4029be:	8b f8                	mov    %eax,%edi
  4029c0:	75 06                	jne    0x4029c8
  4029c2:	8b 3d 40 04 41 00    	mov    0x410440,%edi
  4029c8:	e8 b3 ec ff ff       	call   0x401680
  4029cd:	50                   	push   %eax
  4029ce:	57                   	push   %edi
  4029cf:	68 c8 d4 40 00       	push   $0x40d4c8  ; 0x40d4c8='Load %s.'
  4029d4:	56                   	push   %esi
  4029d5:	e8 76 ed ff ff       	call   0x401750
  4029da:	83 c4 10             	add    $0x10,%esp
  4029dd:	89 5e 6c             	mov    %ebx,0x6c(%esi)
  4029e0:	33 c0                	xor    %eax,%eax
  4029e2:	e9 cf 00 00 00       	jmp    0x402ab6
  4029e7:	8b 16                	mov    (%esi),%edx
  4029e9:	8b 3d 2c d0 40 00    	mov    0x40d02c,%edi  ; 0x40d02c=KERNEL32.dll!GetProcAddress
  4029ef:	68 b8 d4 40 00       	push   $0x40d4b8  ; 0x40d4b8='StdInitFancyBox'
  4029f4:	52                   	push   %edx
  4029f5:	ff d7                	call   *%edi
  4029f7:	3b c3                	cmp    %ebx,%eax
  4029f9:	89 46 04             	mov    %eax,0x4(%esi)
  4029fc:	75 2b                	jne    0x402a29
  4029fe:	83 7e 48 01          	cmpl   $0x1,0x48(%esi)
  402a02:	7c 07                	jl     0x402a0b
  402a04:	8b 46 44             	mov    0x44(%esi),%eax
  402a07:	3b c3                	cmp    %ebx,%eax
  402a09:	75 05                	jne    0x402a10
  402a0b:	a1 40 04 41 00       	mov    0x410440,%eax
  402a10:	50                   	push   %eax
  402a11:	68 98 d4 40 00       	push   $0x40d498  ; 0x40d498='Seek StdInitFancyBox Err %s!'
  402a16:	56                   	push   %esi
  402a17:	e8 34 ed ff ff       	call   0x401750
  402a1c:	83 c4 0c             	add    $0xc,%esp
  402a1f:	89 5e 6c             	mov    %ebx,0x6c(%esi)
  402a22:	33 c0                	xor    %eax,%eax
  402a24:	e9 8d 00 00 00       	jmp    0x402ab6
  402a29:	8b 06                	mov    (%esi),%eax
  402a2b:	68 88 d4 40 00       	push   $0x40d488  ; 0x40d488='StdCmdFancyBox'
  402a30:	50                   	push   %eax
  402a31:	ff d7                	call   *%edi
  402a33:	3b c3                	cmp    %ebx,%eax
  402a35:	89 46 08             	mov    %eax,0x8(%esi)
  402a38:	75 28                	jne    0x402a62
  402a3a:	83 7e 48 01          	cmpl   $0x1,0x48(%esi)
  402a3e:	7c 07                	jl     0x402a47
  402a40:	8b 46 44             	mov    0x44(%esi),%eax
  402a43:	3b c3                	cmp    %ebx,%eax
  402a45:	75 05                	jne    0x402a4c
  402a47:	a1 40 04 41 00       	mov    0x410440,%eax
  402a4c:	50                   	push   %eax
  402a4d:	68 6c d4 40 00       	push   $0x40d46c  ; 0x40d46c='Seek StdCmdFancyBox Err %s!'
  402a52:	56                   	push   %esi
  402a53:	e8 f8 ec ff ff       	call   0x401750
  402a58:	83 c4 0c             	add    $0xc,%esp
  402a5b:	89 5e 6c             	mov    %ebx,0x6c(%esi)
  402a5e:	33 c0                	xor    %eax,%eax
  402a60:	eb 54                	jmp    0x402ab6
  402a62:	8b 4e 74             	mov    0x74(%esi),%ecx
  402a65:	8b 56 0c             	mov    0xc(%esi),%edx
  402a68:	6a 64                	push   $0x64
  402a6a:	51                   	push   %ecx
  402a6b:	55                   	push   %ebp
  402a6c:	52                   	push   %edx
  402a6d:	ff 56 04             	call   *0x4(%esi)
  402a70:	83 c4 10             	add    $0x10,%esp
  402a73:	83 f8 01             	cmp    $0x1,%eax
  402a76:	7d 23                	jge    0x402a9b
  402a78:	68 50 d4 40 00       	push   $0x40d450  ; 0x40d450='Init FacnyBox return err'
  402a7d:	56                   	push   %esi
  402a7e:	e8 cd ec ff ff       	call   0x401750
  402a83:	8b 06                	mov    (%esi),%eax
  402a85:	83 c4 08             	add    $0x8,%esp
  402a88:	50                   	push   %eax
  402a89:	ff 15 08 d1 40 00    	call   *0x40d108  ; 0x40d108=KERNEL32.dll!FreeLibrary
  402a8f:	89 5e 08             	mov    %ebx,0x8(%esi)
  402a92:	89 1e                	mov    %ebx,(%esi)
  402a94:	89 5e 6c             	mov    %ebx,0x6c(%esi)
  402a97:	33 c0                	xor    %eax,%eax
  402a99:	eb 1b                	jmp    0x402ab6
  402a9b:	83 7e 24 03          	cmpl   $0x3,0x24(%esi)
  402a9f:	7e 10                	jle    0x402ab1
  402aa1:	8d 4e 20             	lea    0x20(%esi),%ecx
  402aa4:	e8 57 e5 ff ff       	call   0x401000
  402aa9:	50                   	push   %eax
  402aaa:	53                   	push   %ebx
  402aab:	ff 56 08             	call   *0x8(%esi)
  402aae:	83 c4 08             	add    $0x8,%esp
  402ab1:	b8 01 00 00 00       	mov    $0x1,%eax
  402ab6:	5d                   	pop    %ebp
  402ab7:	5f                   	pop    %edi
  402ab8:	8b 8c 24 18 01 00 00 	mov    0x118(%esp),%ecx
  402abf:	5e                   	pop    %esi
  402ac0:	5b                   	pop    %ebx
  402ac1:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  402ac8:	81 c4 1c 01 00 00    	add    $0x11c,%esp
  402ace:	c2 08 00             	ret    $0x8
  402ad1:	cc                   	int3
  402ad2:	cc                   	int3
  402ad3:	cc                   	int3
  402ad4:	cc                   	int3
  402ad5:	cc                   	int3
  402ad6:	cc                   	int3
  402ad7:	cc                   	int3
  402ad8:	cc                   	int3
  402ad9:	cc                   	int3
  402ada:	cc                   	int3
  402adb:	cc                   	int3
  402adc:	cc                   	int3
  402add:	cc                   	int3
  402ade:	cc                   	int3
  402adf:	cc                   	int3
  402ae0:	6a ff                	push   $0xffffffff
  402ae2:	68 60 c2 40 00       	push   $0x40c260
  402ae7:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
  402aed:	50                   	push   %eax
  402aee:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
  402af5:	83 ec 18             	sub    $0x18,%esp
  402af8:	53                   	push   %ebx
  402af9:	55                   	push   %ebp
  402afa:	56                   	push   %esi
  402afb:	57                   	push   %edi
  402afc:	8b f9                	mov    %ecx,%edi
  402afe:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
  402b02:	e8 69 1c 00 00       	call   0x404770
  402b07:	33 db                	xor    %ebx,%ebx
  402b09:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  402b0d:	89 5c 24 30          	mov    %ebx,0x30(%esp)
  402b11:	e8 5a 1c 00 00       	call   0x404770
  402b16:	8b 74 24 38          	mov    0x38(%esp),%esi
  402b1a:	56                   	push   %esi
  402b1b:	8d 4c 24 20          	lea    0x20(%esp),%ecx
  402b1f:	c6 44 24 34 01       	movb   $0x1,0x34(%esp)
  402b24:	e8 a7 22 00 00       	call   0x404dd0
  402b29:	8b 47 20             	mov    0x20(%edi),%eax
  402b2c:	3b c3                	cmp    %ebx,%eax
  402b2e:	8d 6f 20             	lea    0x20(%edi),%ebp
  402b31:	74 09                	je     0x402b3c
  402b33:	50                   	push   %eax
  402b34:	e8 27 2d 00 00       	call   0x405860
  402b39:	83 c4 04             	add    $0x4,%esp
  402b3c:	53                   	push   %ebx
  402b3d:	53                   	push   %ebx
  402b3e:	6a 20                	push   $0x20
  402b40:	8d 44 24 1c          	lea    0x1c(%esp),%eax
  402b44:	50                   	push   %eax
  402b45:	8d 4c 24 2c          	lea    0x2c(%esp),%ecx
  402b49:	89 5d 00             	mov    %ebx,0x0(%ebp)
  402b4c:	89 5d 04             	mov    %ebx,0x4(%ebp)
  402b4f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  402b52:	e8 c9 22 00 00       	call   0x404e20
  402b57:	85 c0                	test   %eax,%eax
  402b59:	0f 84 09 01 00 00    	je     0x402c68
  402b5f:	90                   	nop
  402b60:	83 7c 24 14 03       	cmpl   $0x3,0x14(%esp)
  402b65:	0f 8e df 00 00 00    	jle    0x402c4a
  402b6b:	53                   	push   %ebx
  402b6c:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  402b70:	e8 9b 1e 00 00       	call   0x404a10
  402b75:	3c 2d                	cmp    $0x2d,%al
  402b77:	0f 85 b0 00 00 00    	jne    0x402c2d
  402b7d:	be 01 00 00 00       	mov    $0x1,%esi
  402b82:	56                   	push   %esi
  402b83:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  402b87:	e8 84 1e 00 00       	call   0x404a10
  402b8c:	0f be c0             	movsbl %al,%eax
  402b8f:	83 c0 bc             	add    $0xffffffbc,%eax
  402b92:	83 f8 2f             	cmp    $0x2f,%eax
  402b95:	0f 87 af 00 00 00    	ja     0x402c4a
  402b9b:	0f b6 88 d4 2c 40 00 	movzbl 0x402cd4(%eax),%ecx
  402ba2:	ff 24 8d c4 2c 40 00 	jmp    *0x402cc4(,%ecx,4)
  402ba9:	39 74 24 14          	cmp    %esi,0x14(%esp)
  402bad:	7c 08                	jl     0x402bb7
  402baf:	8b 44 24 10          	mov    0x10(%esp),%eax
  402bb3:	3b c3                	cmp    %ebx,%eax
  402bb5:	75 05                	jne    0x402bbc
  402bb7:	a1 40 04 41 00       	mov    0x410440,%eax
  402bbc:	83 c0 03             	add    $0x3,%eax
  402bbf:	50                   	push   %eax
  402bc0:	8d 4f 14             	lea    0x14(%edi),%ecx
  402bc3:	e8 08 22 00 00       	call   0x404dd0
  402bc8:	8b cf                	mov    %edi,%ecx
  402bca:	e8 e1 fa ff ff       	call   0x4026b0
  402bcf:	eb 79                	jmp    0x402c4a
  402bd1:	39 74 24 14          	cmp    %esi,0x14(%esp)
  402bd5:	89 77 68             	mov    %esi,0x68(%edi)
  402bd8:	7c 08                	jl     0x402be2
  402bda:	8b 44 24 10          	mov    0x10(%esp),%eax
  402bde:	3b c3                	cmp    %ebx,%eax
  402be0:	75 05                	jne    0x402be7
  402be2:	a1 40 04 41 00       	mov    0x410440,%eax
  402be7:	83 c0 03             	add    $0x3,%eax
  402bea:	8d 77 5c             	lea    0x5c(%edi),%esi
  402bed:	50                   	push   %eax
  402bee:	8b ce                	mov    %esi,%ecx
  402bf0:	e8 db 21 00 00       	call   0x404dd0
  402bf5:	6a 2f                	push   $0x2f
  402bf7:	8b ce                	mov    %esi,%ecx
  402bf9:	e8 42 20 00 00       	call   0x404c40
  402bfe:	68 38 d2 40 00       	push   $0x40d238
  402c03:	8b ce                	mov    %esi,%ecx
  402c05:	e8 e6 1d 00 00       	call   0x4049f0
  402c0a:	eb 3e                	jmp    0x402c4a
  402c0c:	39 74 24 14          	cmp    %esi,0x14(%esp)
  402c10:	7c 08                	jl     0x402c1a
  402c12:	8b 44 24 10          	mov    0x10(%esp),%eax
  402c16:	3b c3                	cmp    %ebx,%eax
  402c18:	75 05                	jne    0x402c1f
  402c1a:	a1 40 04 41 00       	mov    0x410440,%eax
  402c1f:	83 c0 03             	add    $0x3,%eax
  402c22:	50                   	push   %eax
  402c23:	8d 4f 78             	lea    0x78(%edi),%ecx
  402c26:	e8 a5 21 00 00       	call   0x404dd0
  402c2b:	eb 1d                	jmp    0x402c4a
  402c2d:	39 5f 24             	cmp    %ebx,0x24(%edi)
  402c30:	7e 0c                	jle    0x402c3e
  402c32:	68 ec d4 40 00       	push   $0x40d4ec
  402c37:	8b cd                	mov    %ebp,%ecx
  402c39:	e8 b2 1d 00 00       	call   0x4049f0
  402c3e:	8d 54 24 10          	lea    0x10(%esp),%edx
  402c42:	52                   	push   %edx
  402c43:	8b cd                	mov    %ebp,%ecx
  402c45:	e8 86 1d 00 00       	call   0x4049d0
  402c4a:	53                   	push   %ebx
  402c4b:	53                   	push   %ebx
  402c4c:	6a 20                	push   $0x20
  402c4e:	8d 44 24 1c          	lea    0x1c(%esp),%eax
  402c52:	50                   	push   %eax
  402c53:	8d 4c 24 2c          	lea    0x2c(%esp),%ecx
  402c57:	e8 c4 21 00 00       	call   0x404e20
  402c5c:	85 c0                	test   %eax,%eax
  402c5e:	0f 85 fc fe ff ff    	jne    0x402b60
  402c64:	8b 74 24 38          	mov    0x38(%esp),%esi
  402c68:	8b 7f 08             	mov    0x8(%edi),%edi
  402c6b:	3b fb                	cmp    %ebx,%edi
  402c6d:	74 21                	je     0x402c90
  402c6f:	3b f3                	cmp    %ebx,%esi
  402c71:	74 1d                	je     0x402c90
  402c73:	38 1e                	cmp    %bl,(%esi)
  402c75:	74 19                	je     0x402c90
  402c77:	83 7d 04 01          	cmpl   $0x1,0x4(%ebp)
  402c7b:	7c 07                	jl     0x402c84
  402c7d:	8b 45 00             	mov    0x0(%ebp),%eax
  402c80:	3b c3                	cmp    %ebx,%eax
  402c82:	75 05                	jne    0x402c89
  402c84:	a1 40 04 41 00       	mov    0x410440,%eax
  402c89:	50                   	push   %eax
  402c8a:	53                   	push   %ebx
  402c8b:	ff d7                	call   *%edi
  402c8d:	83 c4 08             	add    $0x8,%esp
  402c90:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  402c94:	88 5c 24 30          	mov    %bl,0x30(%esp)
  402c98:	e8 13 e9 ff ff       	call   0x4015b0
  402c9d:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
  402ca1:	c7 44 24 30 ff ff ff 	movl   $0xffffffff,0x30(%esp)
  402ca8:	ff 
  402ca9:	e8 02 e9 ff ff       	call   0x4015b0
  402cae:	8b 4c 24 28          	mov    0x28(%esp),%ecx
  402cb2:	5f                   	pop    %edi
  402cb3:	5e                   	pop    %esi
  402cb4:	5d                   	pop    %ebp
  402cb5:	5b                   	pop    %ebx
  402cb6:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  402cbd:	83 c4 24             	add    $0x24,%esp
  402cc0:	c2 04 00             	ret    $0x4
  402cc3:	90                   	nop
  402cc4:	a9 2b 40 00 0c       	test   $0xc00402b,%eax
  402cc9:	2c 40                	sub    $0x40,%al
  402ccb:	00 d1                	add    %dl,%cl
  402ccd:	2b 40 00             	sub    0x0(%eax),%eax
  402cd0:	4a                   	dec    %edx
  402cd1:	2c 40                	sub    $0x40,%al
  402cd3:	00 00                	add    %al,(%eax)
  402cd5:	03 03                	add    (%ebx),%eax
  402cd7:	03 03                	add    (%ebx),%eax
  402cd9:	01 03                	add    %eax,(%ebx)
  402cdb:	03 03                	add    (%ebx),%eax
  402cdd:	03 03                	add    (%ebx),%eax
  402cdf:	03 03                	add    (%ebx),%eax
  402ce1:	03 03                	add    (%ebx),%eax
  402ce3:	02 03                	add    (%ebx),%al
  402ce5:	03 03                	add    (%ebx),%eax
  402ce7:	03 03                	add    (%ebx),%eax
  402ce9:	03 03                	add    (%ebx),%eax
  402ceb:	03 03                	add    (%ebx),%eax
  402ced:	03 03                	add    (%ebx),%eax
  402cef:	03 03                	add    (%ebx),%eax
  402cf1:	03 03                	add    (%ebx),%eax
  402cf3:	03 00                	add    (%eax),%eax
  402cf5:	03 03                	add    (%ebx),%eax
  402cf7:	03 03                	add    (%ebx),%eax
  402cf9:	01 03                	add    %eax,(%ebx)
  402cfb:	03 03                	add    (%ebx),%eax
  402cfd:	03 03                	add    (%ebx),%eax
  402cff:	03 03                	add    (%ebx),%eax
  402d01:	03 03                	add    (%ebx),%eax
  402d03:	02 cc                	add    %ah,%cl
  402d05:	cc                   	int3
  402d06:	cc                   	int3
  402d07:	cc                   	int3
  402d08:	cc                   	int3
  402d09:	cc                   	int3
  402d0a:	cc                   	int3
  402d0b:	cc                   	int3
  402d0c:	cc                   	int3
  402d0d:	cc                   	int3
  402d0e:	cc                   	int3
  402d0f:	cc                   	int3
  402d10:	6a ff                	push   $0xffffffff
  402d12:	68 c8 c2 40 00       	push   $0x40c2c8
  402d17:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
  402d1d:	50                   	push   %eax
  402d1e:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
  402d25:	51                   	push   %ecx
  402d26:	53                   	push   %ebx
  402d27:	56                   	push   %esi
  402d28:	8b f1                	mov    %ecx,%esi
  402d2a:	57                   	push   %edi
  402d2b:	8d 7e 14             	lea    0x14(%esi),%edi
  402d2e:	8b cf                	mov    %edi,%ecx
  402d30:	89 74 24 0c          	mov    %esi,0xc(%esp)
  402d34:	e8 37 1a 00 00       	call   0x404770
  402d39:	33 db                	xor    %ebx,%ebx
  402d3b:	8d 4e 20             	lea    0x20(%esi),%ecx
  402d3e:	89 5c 24 18          	mov    %ebx,0x18(%esp)
  402d42:	e8 29 1a 00 00       	call   0x404770
  402d47:	8d 4e 2c             	lea    0x2c(%esi),%ecx
  402d4a:	c6 44 24 18 01       	movb   $0x1,0x18(%esp)
  402d4f:	e8 1c 1a 00 00       	call   0x404770
  402d54:	8d 4e 38             	lea    0x38(%esi),%ecx
  402d57:	c6 44 24 18 02       	movb   $0x2,0x18(%esp)
  402d5c:	e8 0f 1a 00 00       	call   0x404770
  402d61:	8d 4e 44             	lea    0x44(%esi),%ecx
  402d64:	c6 44 24 18 03       	movb   $0x3,0x18(%esp)
  402d69:	e8 02 1a 00 00       	call   0x404770
  402d6e:	8d 4e 50             	lea    0x50(%esi),%ecx
  402d71:	c6 44 24 18 04       	movb   $0x4,0x18(%esp)
  402d76:	e8 f5 19 00 00       	call   0x404770
  402d7b:	8d 4e 5c             	lea    0x5c(%esi),%ecx
  402d7e:	c6 44 24 18 05       	movb   $0x5,0x18(%esp)
  402d83:	e8 e8 19 00 00       	call   0x404770
  402d88:	8d 4e 78             	lea    0x78(%esi),%ecx
  402d8b:	c6 44 24 18 06       	movb   $0x6,0x18(%esp)
  402d90:	e8 db 19 00 00       	call   0x404770
  402d95:	c6 44 24 18 07       	movb   $0x7,0x18(%esp)
  402d9a:	89 1e                	mov    %ebx,(%esi)
  402d9c:	89 5e 04             	mov    %ebx,0x4(%esi)
  402d9f:	89 5e 08             	mov    %ebx,0x8(%esi)
  402da2:	89 5e 10             	mov    %ebx,0x10(%esi)
  402da5:	89 5e 6c             	mov    %ebx,0x6c(%esi)
  402da8:	e8 73 19 00 00       	call   0x404720
  402dad:	68 40 01 41 00       	push   $0x410140  ; 0x410140='objsys.dll'
  402db2:	8b cf                	mov    %edi,%ecx
  402db4:	e8 17 20 00 00       	call   0x404dd0
  402db9:	8b ce                	mov    %esi,%ecx
  402dbb:	e8 f0 f8 ff ff       	call   0x4026b0
  402dc0:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  402dc4:	89 5e 74             	mov    %ebx,0x74(%esi)
  402dc7:	88 9e 84 00 00 00    	mov    %bl,0x84(%esi)
  402dcd:	89 5e 68             	mov    %ebx,0x68(%esi)
  402dd0:	5f                   	pop    %edi
  402dd1:	c7 46 70 05 00 00 00 	movl   $0x5,0x70(%esi)
  402dd8:	8b c6                	mov    %esi,%eax
  402dda:	5e                   	pop    %esi
  402ddb:	5b                   	pop    %ebx
  402ddc:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  402de3:	83 c4 10             	add    $0x10,%esp
  402de6:	c3                   	ret
  402de7:	cc                   	int3
  402de8:	cc                   	int3
  402de9:	cc                   	int3
  402dea:	cc                   	int3
  402deb:	cc                   	int3
  402dec:	cc                   	int3
  402ded:	cc                   	int3
  402dee:	cc                   	int3
  402def:	cc                   	int3
  402df0:	8b 44 24 08          	mov    0x8(%esp),%eax
  402df4:	8b 54 24 0c          	mov    0xc(%esp),%edx
  402df8:	53                   	push   %ebx
  402df9:	56                   	push   %esi
  402dfa:	57                   	push   %edi
  402dfb:	b9 04 00 00 00       	mov    $0x4,%ecx
  402e00:	bf 00 d5 40 00       	mov    $0x40d500,%edi
  402e05:	8b f0                	mov    %eax,%esi
  402e07:	33 db                	xor    %ebx,%ebx
  402e09:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  402e0f:	f3 a7                	repz cmpsl %es:(%edi),%ds:(%esi)
  402e11:	74 12                	je     0x402e25
  402e13:	8b f0                	mov    %eax,%esi
  402e15:	b9 04 00 00 00       	mov    $0x4,%ecx
  402e1a:	bf f0 d4 40 00       	mov    $0x40d4f0,%edi
  402e1f:	33 c0                	xor    %eax,%eax
  402e21:	f3 a7                	repz cmpsl %es:(%edi),%ds:(%esi)
  402e23:	75 14                	jne    0x402e39
  402e25:	8b 44 24 10          	mov    0x10(%esp),%eax
  402e29:	89 02                	mov    %eax,(%edx)
  402e2b:	8b 08                	mov    (%eax),%ecx
  402e2d:	50                   	push   %eax
  402e2e:	ff 51 04             	call   *0x4(%ecx)
  402e31:	5f                   	pop    %edi
  402e32:	5e                   	pop    %esi
  402e33:	33 c0                	xor    %eax,%eax
  402e35:	5b                   	pop    %ebx
  402e36:	c2 0c 00             	ret    $0xc
  402e39:	5f                   	pop    %edi
  402e3a:	5e                   	pop    %esi
  402e3b:	b8 02 40 00 80       	mov    $0x80004002,%eax
  402e40:	5b                   	pop    %ebx
  402e41:	c2 0c 00             	ret    $0xc
  402e44:	cc                   	int3
  402e45:	cc                   	int3
  402e46:	cc                   	int3
  402e47:	cc                   	int3
  402e48:	cc                   	int3
  402e49:	cc                   	int3
  402e4a:	cc                   	int3
  402e4b:	cc                   	int3
  402e4c:	cc                   	int3
  402e4d:	cc                   	int3
  402e4e:	cc                   	int3
  402e4f:	cc                   	int3
  402e50:	8b 44 24 04          	mov    0x4(%esp),%eax
  402e54:	8b 48 08             	mov    0x8(%eax),%ecx
  402e57:	83 ec 1c             	sub    $0x1c,%esp
  402e5a:	85 c9                	test   %ecx,%ecx
  402e5c:	0f 84 9d 00 00 00    	je     0x402eff
  402e62:	83 7c 24 28 0a       	cmpl   $0xa,0x28(%esp)
  402e67:	0f 82 92 00 00 00    	jb     0x402eff
  402e6d:	53                   	push   %ebx
  402e6e:	8b 1d a8 d1 40 00    	mov    0x40d1a8,%ebx  ; 0x40d1a8=USER32.dll!DispatchMessageA
  402e74:	55                   	push   %ebp
  402e75:	8b 2d 98 d1 40 00    	mov    0x40d198,%ebp  ; 0x40d198=USER32.dll!PeekMessageA
  402e7b:	56                   	push   %esi
  402e7c:	8b 35 20 d0 40 00    	mov    0x40d020,%esi  ; 0x40d020=KERNEL32.dll!Sleep
  402e82:	57                   	push   %edi
  402e83:	8b 3d 78 d1 40 00    	mov    0x40d178,%edi  ; 0x40d178=USER32.dll!TranslateMessage
  402e89:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
  402e90:	6a 00                	push   $0x0
  402e92:	6a 00                	push   $0x0
  402e94:	6a 00                	push   $0x0
  402e96:	6a 00                	push   $0x0
  402e98:	8d 4c 24 20          	lea    0x20(%esp),%ecx
  402e9c:	51                   	push   %ecx
  402e9d:	ff d5                	call   *%ebp
  402e9f:	85 c0                	test   %eax,%eax
  402ea1:	74 29                	je     0x402ecc
  402ea3:	6a 00                	push   $0x0
  402ea5:	6a 00                	push   $0x0
  402ea7:	6a 00                	push   $0x0
  402ea9:	8d 54 24 1c          	lea    0x1c(%esp),%edx
  402ead:	52                   	push   %edx
  402eae:	ff 15 a4 d1 40 00    	call   *0x40d1a4  ; 0x40d1a4=USER32.dll!GetMessageA
  402eb4:	85 c0                	test   %eax,%eax
  402eb6:	74 14                	je     0x402ecc
  402eb8:	8d 44 24 10          	lea    0x10(%esp),%eax
  402ebc:	50                   	push   %eax
  402ebd:	ff d7                	call   *%edi
  402ebf:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  402ec3:	51                   	push   %ecx
  402ec4:	ff d3                	call   *%ebx
  402ec6:	6a 01                	push   $0x1
  402ec8:	ff d6                	call   *%esi
  402eca:	eb c4                	jmp    0x402e90
  402ecc:	8b 44 24 34          	mov    0x34(%esp),%eax
  402ed0:	6b c0 64             	imul   $0x64,%eax,%eax
  402ed3:	33 d2                	xor    %edx,%edx
  402ed5:	f7 74 24 38          	divl   0x38(%esp)
  402ed9:	8b 74 24 30          	mov    0x30(%esp),%esi
  402edd:	8b 4e 08             	mov    0x8(%esi),%ecx
  402ee0:	50                   	push   %eax
  402ee1:	e8 3a 0d 00 00       	call   0x403c20
  402ee6:	8b 56 08             	mov    0x8(%esi),%edx
  402ee9:	8b 42 20             	mov    0x20(%edx),%eax
  402eec:	5f                   	pop    %edi
  402eed:	f7 d8                	neg    %eax
  402eef:	5e                   	pop    %esi
  402ef0:	1b c0                	sbb    %eax,%eax
  402ef2:	5d                   	pop    %ebp
  402ef3:	25 04 40 00 80       	and    $0x80004004,%eax
  402ef8:	5b                   	pop    %ebx
  402ef9:	83 c4 1c             	add    $0x1c,%esp
  402efc:	c2 14 00             	ret    $0x14
  402eff:	33 c0                	xor    %eax,%eax
  402f01:	83 c4 1c             	add    $0x1c,%esp
  402f04:	c2 14 00             	ret    $0x14
  402f07:	cc                   	int3
  402f08:	cc                   	int3
  402f09:	cc                   	int3
  402f0a:	cc                   	int3
  402f0b:	cc                   	int3
  402f0c:	cc                   	int3
  402f0d:	cc                   	int3
  402f0e:	cc                   	int3
  402f0f:	cc                   	int3
  402f10:	8b 44 24 08          	mov    0x8(%esp),%eax
  402f14:	c7 00 93 20 00 00    	movl   $0x2093,(%eax)
  402f1a:	8b 44 24 0c          	mov    0xc(%esp),%eax
  402f1e:	56                   	push   %esi
  402f1f:	33 c9                	xor    %ecx,%ecx
  402f21:	c7 00 54 00 00 00    	movl   $0x54,(%eax)
  402f27:	89 48 04             	mov    %ecx,0x4(%eax)
  402f2a:	8d 70 08             	lea    0x8(%eax),%esi
  402f2d:	33 d2                	xor    %edx,%edx
  402f2f:	89 16                	mov    %edx,(%esi)
  402f31:	89 56 04             	mov    %edx,0x4(%esi)
  402f34:	89 56 08             	mov    %edx,0x8(%esi)
  402f37:	89 48 14             	mov    %ecx,0x14(%eax)
  402f3a:	89 48 18             	mov    %ecx,0x18(%eax)
  402f3d:	89 48 1c             	mov    %ecx,0x1c(%eax)
  402f40:	33 c0                	xor    %eax,%eax
  402f42:	5e                   	pop    %esi
  402f43:	c2 0c 00             	ret    $0xc
  402f46:	cc                   	int3
  402f47:	cc                   	int3
  402f48:	cc                   	int3
  402f49:	cc                   	int3
  402f4a:	cc                   	int3
  402f4b:	cc                   	int3
  402f4c:	cc                   	int3
  402f4d:	cc                   	int3
  402f4e:	cc                   	int3
  402f4f:	cc                   	int3
  402f50:	8b 44 24 04          	mov    0x4(%esp),%eax
  402f54:	8b 48 04             	mov    0x4(%eax),%ecx
  402f57:	41                   	inc    %ecx
  402f58:	89 48 04             	mov    %ecx,0x4(%eax)
  402f5b:	8b c1                	mov    %ecx,%eax
  402f5d:	c2 04 00             	ret    $0x4
  402f60:	8b 44 24 04          	mov    0x4(%esp),%eax
  402f64:	8b 48 04             	mov    0x4(%eax),%ecx
  402f67:	49                   	dec    %ecx
  402f68:	89 48 04             	mov    %ecx,0x4(%eax)
  402f6b:	8b c1                	mov    %ecx,%eax
  402f6d:	c2 04 00             	ret    $0x4
  402f70:	b8 01 40 00 80       	mov    $0x80004001,%eax
  402f75:	c2 08 00             	ret    $0x8
  402f78:	cc                   	int3
  402f79:	cc                   	int3
  402f7a:	cc                   	int3
  402f7b:	cc                   	int3
  402f7c:	cc                   	int3
  402f7d:	cc                   	int3
  402f7e:	cc                   	int3
  402f7f:	cc                   	int3
  402f80:	33 c0                	xor    %eax,%eax
  402f82:	c2 08 00             	ret    $0x8
  402f85:	cc                   	int3
  402f86:	cc                   	int3
  402f87:	cc                   	int3
  402f88:	cc                   	int3
  402f89:	cc                   	int3
  402f8a:	cc                   	int3
  402f8b:	cc                   	int3
  402f8c:	cc                   	int3
  402f8d:	cc                   	int3
  402f8e:	cc                   	int3
  402f8f:	cc                   	int3
  402f90:	33 c0                	xor    %eax,%eax
  402f92:	c2 14 00             	ret    $0x14
  402f95:	cc                   	int3
  402f96:	cc                   	int3
  402f97:	cc                   	int3
  402f98:	cc                   	int3
  402f99:	cc                   	int3
  402f9a:	cc                   	int3
  402f9b:	cc                   	int3
  402f9c:	cc                   	int3
  402f9d:	cc                   	int3
  402f9e:	cc                   	int3
  402f9f:	cc                   	int3
  402fa0:	33 c0                	xor    %eax,%eax
  402fa2:	c2 0c 00             	ret    $0xc
  402fa5:	cc                   	int3
  402fa6:	cc                   	int3
  402fa7:	cc                   	int3
  402fa8:	cc                   	int3
  402fa9:	cc                   	int3
  402faa:	cc                   	int3
  402fab:	cc                   	int3
  402fac:	cc                   	int3
  402fad:	cc                   	int3
  402fae:	cc                   	int3
  402faf:	cc                   	int3
  402fb0:	56                   	push   %esi
  402fb1:	57                   	push   %edi
  402fb2:	6a 0c                	push   $0xc
  402fb4:	33 ff                	xor    %edi,%edi
  402fb6:	e8 92 2d 00 00       	call   0x405d4d
  402fbb:	83 c4 04             	add    $0x4,%esp
  402fbe:	3b c7                	cmp    %edi,%eax
  402fc0:	74 10                	je     0x402fd2
  402fc2:	c7 00 10 d5 40 00    	movl   $0x40d510,(%eax)
  402fc8:	89 78 04             	mov    %edi,0x4(%eax)
  402fcb:	89 78 08             	mov    %edi,0x8(%eax)
  402fce:	8b f0                	mov    %eax,%esi
  402fd0:	eb 02                	jmp    0x402fd4
  402fd2:	33 f6                	xor    %esi,%esi
  402fd4:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  402fd8:	8b 44 24 0c          	mov    0xc(%esp),%eax
  402fdc:	8b 54 24 10          	mov    0x10(%esp),%edx
  402fe0:	56                   	push   %esi
  402fe1:	57                   	push   %edi
  402fe2:	51                   	push   %ecx
  402fe3:	89 46 08             	mov    %eax,0x8(%esi)
  402fe6:	a1 f8 0c 41 00       	mov    0x410cf8,%eax
  402feb:	52                   	push   %edx
  402fec:	50                   	push   %eax
  402fed:	e8 6c 8f 00 00       	call   0x40bf5e
  402ff2:	85 c0                	test   %eax,%eax
  402ff4:	7c 05                	jl     0x402ffb
  402ff6:	bf 01 00 00 00       	mov    $0x1,%edi
  402ffb:	56                   	push   %esi
  402ffc:	e8 5f 28 00 00       	call   0x405860
  403001:	83 c4 04             	add    $0x4,%esp
  403004:	8b c7                	mov    %edi,%eax
  403006:	5f                   	pop    %edi
  403007:	5e                   	pop    %esi
  403008:	c3                   	ret
  403009:	cc                   	int3
  40300a:	cc                   	int3
  40300b:	cc                   	int3
  40300c:	cc                   	int3
  40300d:	cc                   	int3
  40300e:	cc                   	int3
  40300f:	cc                   	int3
  403010:	e9 38 2d 00 00       	jmp    0x405d4d
  403015:	cc                   	int3
  403016:	cc                   	int3
  403017:	cc                   	int3
  403018:	cc                   	int3
  403019:	cc                   	int3
  40301a:	cc                   	int3
  40301b:	cc                   	int3
  40301c:	cc                   	int3
  40301d:	cc                   	int3
  40301e:	cc                   	int3
  40301f:	cc                   	int3
  403020:	e9 3b 28 00 00       	jmp    0x405860
  403025:	cc                   	int3
  403026:	cc                   	int3
  403027:	cc                   	int3
  403028:	cc                   	int3
  403029:	cc                   	int3
  40302a:	cc                   	int3
  40302b:	cc                   	int3
  40302c:	cc                   	int3
  40302d:	cc                   	int3
  40302e:	cc                   	int3
  40302f:	cc                   	int3
  403030:	56                   	push   %esi
  403031:	8b 74 24 08          	mov    0x8(%esp),%esi
  403035:	57                   	push   %edi
  403036:	bf 3c d5 40 00       	mov    $0x40d53c,%edi
  40303b:	b9 04 00 00 00       	mov    $0x4,%ecx
  403040:	33 c0                	xor    %eax,%eax
  403042:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
  403044:	5f                   	pop    %edi
  403045:	5e                   	pop    %esi
  403046:	75 0d                	jne    0x403055
  403048:	a1 0c 15 41 00       	mov    0x41150c,%eax
  40304d:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  403054:	c3                   	ret
  403055:	33 c0                	xor    %eax,%eax
  403057:	c3                   	ret
  403058:	cc                   	int3
  403059:	cc                   	int3
  40305a:	cc                   	int3
  40305b:	cc                   	int3
  40305c:	cc                   	int3
  40305d:	cc                   	int3
  40305e:	cc                   	int3
  40305f:	cc                   	int3
  403060:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  403064:	85 c9                	test   %ecx,%ecx
  403066:	74 10                	je     0x403078
  403068:	8b 44 24 0c          	mov    0xc(%esp),%eax
  40306c:	8b 54 24 08          	mov    0x8(%esp),%edx
  403070:	50                   	push   %eax
  403071:	52                   	push   %edx
  403072:	e8 f9 11 00 00       	call   0x404270
  403077:	c3                   	ret
  403078:	33 c0                	xor    %eax,%eax
  40307a:	c3                   	ret
  40307b:	cc                   	int3
  40307c:	cc                   	int3
  40307d:	cc                   	int3
  40307e:	cc                   	int3
  40307f:	cc                   	int3
  403080:	8b 44 24 0c          	mov    0xc(%esp),%eax
  403084:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  403088:	50                   	push   %eax
  403089:	51                   	push   %ecx
  40308a:	8b 0d 10 15 41 00    	mov    0x411510,%ecx
  403090:	e8 0b 13 00 00       	call   0x4043a0
  403095:	c3                   	ret
  403096:	cc                   	int3
  403097:	cc                   	int3
  403098:	cc                   	int3
  403099:	cc                   	int3
  40309a:	cc                   	int3
  40309b:	cc                   	int3
  40309c:	cc                   	int3
  40309d:	cc                   	int3
  40309e:	cc                   	int3
  40309f:	cc                   	int3
  4030a0:	33 c0                	xor    %eax,%eax
  4030a2:	c3                   	ret
  4030a3:	cc                   	int3
  4030a4:	cc                   	int3
  4030a5:	cc                   	int3
  4030a6:	cc                   	int3
  4030a7:	cc                   	int3
  4030a8:	cc                   	int3
  4030a9:	cc                   	int3
  4030aa:	cc                   	int3
  4030ab:	cc                   	int3
  4030ac:	cc                   	int3
  4030ad:	cc                   	int3
  4030ae:	cc                   	int3
  4030af:	cc                   	int3
  4030b0:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  4030b4:	85 c9                	test   %ecx,%ecx
  4030b6:	75 03                	jne    0x4030bb
  4030b8:	33 c0                	xor    %eax,%eax
  4030ba:	c3                   	ret
  4030bb:	8b 44 24 0c          	mov    0xc(%esp),%eax
  4030bf:	8b 54 24 08          	mov    0x8(%esp),%edx
  4030c3:	50                   	push   %eax
  4030c4:	52                   	push   %edx
  4030c5:	e8 36 14 00 00       	call   0x404500
  4030ca:	c3                   	ret
  4030cb:	cc                   	int3
  4030cc:	cc                   	int3
  4030cd:	cc                   	int3
  4030ce:	cc                   	int3
  4030cf:	cc                   	int3
  4030d0:	68 70 d5 40 00       	push   $0x40d570  ; 0x40d570='CABINET'
  4030d5:	ff 15 30 d0 40 00    	call   *0x40d030  ; 0x40d030=KERNEL32.dll!LoadLibraryA
  4030db:	85 c0                	test   %eax,%eax
  4030dd:	a3 24 15 41 00       	mov    %eax,0x411524
  4030e2:	75 01                	jne    0x4030e5
  4030e4:	c3                   	ret
  4030e5:	56                   	push   %esi
  4030e6:	8b 35 2c d0 40 00    	mov    0x40d02c,%esi  ; 0x40d02c=KERNEL32.dll!GetProcAddress
  4030ec:	68 64 d5 40 00       	push   $0x40d564  ; 0x40d564='FDICreate'
  4030f1:	50                   	push   %eax
  4030f2:	ff d6                	call   *%esi
  4030f4:	a3 14 15 41 00       	mov    %eax,0x411514
  4030f9:	a1 24 15 41 00       	mov    0x411524,%eax
  4030fe:	68 5c d5 40 00       	push   $0x40d55c  ; 0x40d55c='FDICopy'
  403103:	50                   	push   %eax
  403104:	ff d6                	call   *%esi
  403106:	8b 0d 24 15 41 00    	mov    0x411524,%ecx
  40310c:	68 4c d5 40 00       	push   $0x40d54c  ; 0x40d54c='FDIIsCabinet'
  403111:	51                   	push   %ecx
  403112:	a3 1c 15 41 00       	mov    %eax,0x41151c
  403117:	ff d6                	call   *%esi
  403119:	8b 15 24 15 41 00    	mov    0x411524,%edx
  40311f:	68 40 d5 40 00       	push   $0x40d540  ; 0x40d540='FDIDestroy'
  403124:	52                   	push   %edx
  403125:	a3 18 15 41 00       	mov    %eax,0x411518
  40312a:	ff d6                	call   *%esi
  40312c:	8b 0d 14 15 41 00    	mov    0x411514,%ecx
  403132:	85 c9                	test   %ecx,%ecx
  403134:	a3 20 15 41 00       	mov    %eax,0x411520
  403139:	74 61                	je     0x40319c
  40313b:	8b 15 1c 15 41 00    	mov    0x41151c,%edx
  403141:	85 d2                	test   %edx,%edx
  403143:	74 57                	je     0x40319c
  403145:	8b 15 18 15 41 00    	mov    0x411518,%edx
  40314b:	85 d2                	test   %edx,%edx
  40314d:	74 4d                	je     0x40319c
  40314f:	85 c0                	test   %eax,%eax
  403151:	74 49                	je     0x40319c
  403153:	8b 44 24 28          	mov    0x28(%esp),%eax
  403157:	8b 54 24 24          	mov    0x24(%esp),%edx
  40315b:	50                   	push   %eax
  40315c:	8b 44 24 24          	mov    0x24(%esp),%eax
  403160:	52                   	push   %edx
  403161:	8b 54 24 24          	mov    0x24(%esp),%edx
  403165:	50                   	push   %eax
  403166:	8b 44 24 24          	mov    0x24(%esp),%eax
  40316a:	52                   	push   %edx
  40316b:	8b 54 24 24          	mov    0x24(%esp),%edx
  40316f:	50                   	push   %eax
  403170:	8b 44 24 24          	mov    0x24(%esp),%eax
  403174:	52                   	push   %edx
  403175:	8b 54 24 24          	mov    0x24(%esp),%edx
  403179:	50                   	push   %eax
  40317a:	8b 44 24 24          	mov    0x24(%esp),%eax
  40317e:	52                   	push   %edx
  40317f:	50                   	push   %eax
  403180:	ff d1                	call   *%ecx
  403182:	8b f0                	mov    %eax,%esi
  403184:	83 c4 24             	add    $0x24,%esp
  403187:	85 f6                	test   %esi,%esi
  403189:	75 0d                	jne    0x403198
  40318b:	8b 0d 24 15 41 00    	mov    0x411524,%ecx
  403191:	51                   	push   %ecx
  403192:	ff 15 08 d1 40 00    	call   *0x40d108  ; 0x40d108=KERNEL32.dll!FreeLibrary
  403198:	8b c6                	mov    %esi,%eax
  40319a:	5e                   	pop    %esi
  40319b:	c3                   	ret
  40319c:	8b 15 24 15 41 00    	mov    0x411524,%edx
  4031a2:	52                   	push   %edx
  4031a3:	ff 15 08 d1 40 00    	call   *0x40d108  ; 0x40d108=KERNEL32.dll!FreeLibrary
  4031a9:	33 c0                	xor    %eax,%eax
  4031ab:	5e                   	pop    %esi
  4031ac:	c3                   	ret
  4031ad:	cc                   	int3
  4031ae:	cc                   	int3
  4031af:	cc                   	int3
  4031b0:	a1 20 15 41 00       	mov    0x411520,%eax
  4031b5:	85 c0                	test   %eax,%eax
  4031b7:	75 01                	jne    0x4031ba
  4031b9:	c3                   	ret
  4031ba:	56                   	push   %esi
  4031bb:	51                   	push   %ecx
  4031bc:	ff d0                	call   *%eax
  4031be:	8b f0                	mov    %eax,%esi
  4031c0:	83 c4 04             	add    $0x4,%esp
  4031c3:	83 fe 01             	cmp    $0x1,%esi
  4031c6:	75 0d                	jne    0x4031d5
  4031c8:	8b 15 24 15 41 00    	mov    0x411524,%edx
  4031ce:	52                   	push   %edx
  4031cf:	ff 15 08 d1 40 00    	call   *0x40d108  ; 0x40d108=KERNEL32.dll!FreeLibrary
  4031d5:	8b c6                	mov    %esi,%eax
  4031d7:	5e                   	pop    %esi
  4031d8:	c3                   	ret
  4031d9:	cc                   	int3
  4031da:	cc                   	int3
  4031db:	cc                   	int3
  4031dc:	cc                   	int3
  4031dd:	cc                   	int3
  4031de:	cc                   	int3
  4031df:	cc                   	int3
  4031e0:	8b d1                	mov    %ecx,%edx
  4031e2:	33 c0                	xor    %eax,%eax
  4031e4:	57                   	push   %edi
  4031e5:	c7 02 78 d5 40 00    	movl   $0x40d578,(%edx)
  4031eb:	b9 40 00 00 00       	mov    $0x40,%ecx
  4031f0:	8d 7a 0c             	lea    0xc(%edx),%edi
  4031f3:	f3 ab                	rep stos %eax,%es:(%edi)
  4031f5:	b9 40 00 00 00       	mov    $0x40,%ecx
  4031fa:	8d ba 0c 01 00 00    	lea    0x10c(%edx),%edi
  403200:	f3 ab                	rep stos %eax,%es:(%edi)
  403202:	b9 40 00 00 00       	mov    $0x40,%ecx
  403207:	8d ba 0c 02 00 00    	lea    0x20c(%edx),%edi
  40320d:	f3 ab                	rep stos %eax,%es:(%edi)
  40320f:	89 82 14 03 00 00    	mov    %eax,0x314(%edx)
  403215:	89 42 08             	mov    %eax,0x8(%edx)
  403218:	66 89 42 06          	mov    %ax,0x6(%edx)
  40321c:	66 89 42 04          	mov    %ax,0x4(%edx)
  403220:	89 82 18 03 00 00    	mov    %eax,0x318(%edx)
  403226:	89 82 1c 03 00 00    	mov    %eax,0x31c(%edx)
  40322c:	b8 01 00 00 00       	mov    $0x1,%eax
  403231:	89 82 0c 03 00 00    	mov    %eax,0x30c(%edx)
  403237:	89 82 10 03 00 00    	mov    %eax,0x310(%edx)
  40323d:	8b c2                	mov    %edx,%eax
  40323f:	5f                   	pop    %edi
  403240:	c3                   	ret
  403241:	cc                   	int3
  403242:	cc                   	int3
  403243:	cc                   	int3
  403244:	cc                   	int3
  403245:	cc                   	int3
  403246:	cc                   	int3
  403247:	cc                   	int3
  403248:	cc                   	int3
  403249:	cc                   	int3
  40324a:	cc                   	int3
  40324b:	cc                   	int3
  40324c:	cc                   	int3
  40324d:	cc                   	int3
  40324e:	cc                   	int3
  40324f:	cc                   	int3
  403250:	53                   	push   %ebx
  403251:	56                   	push   %esi
  403252:	8b f1                	mov    %ecx,%esi
  403254:	8b 86 18 03 00 00    	mov    0x318(%esi),%eax
  40325a:	33 db                	xor    %ebx,%ebx
  40325c:	3b c3                	cmp    %ebx,%eax
  40325e:	57                   	push   %edi
  40325f:	74 56                	je     0x4032b7
  403261:	33 ff                	xor    %edi,%edi
  403263:	66 39 5e 04          	cmp    %bx,0x4(%esi)
  403267:	76 2f                	jbe    0x403298
  403269:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
  403270:	8b 86 18 03 00 00    	mov    0x318(%esi),%eax
  403276:	8b 04 b8             	mov    (%eax,%edi,4),%eax
  403279:	3b c3                	cmp    %ebx,%eax
  40327b:	74 09                	je     0x403286
  40327d:	50                   	push   %eax
  40327e:	e8 dd 25 00 00       	call   0x405860
  403283:	83 c4 04             	add    $0x4,%esp
  403286:	8b 8e 18 03 00 00    	mov    0x318(%esi),%ecx
  40328c:	89 1c b9             	mov    %ebx,(%ecx,%edi,4)
  40328f:	0f b7 56 04          	movzwl 0x4(%esi),%edx
  403293:	47                   	inc    %edi
  403294:	3b fa                	cmp    %edx,%edi
  403296:	7c d8                	jl     0x403270
  403298:	8b 86 18 03 00 00    	mov    0x318(%esi),%eax
  40329e:	50                   	push   %eax
  40329f:	66 89 5e 04          	mov    %bx,0x4(%esi)
  4032a3:	e8 b8 25 00 00       	call   0x405860
  4032a8:	83 c4 04             	add    $0x4,%esp
  4032ab:	89 9e 18 03 00 00    	mov    %ebx,0x318(%esi)
  4032b1:	89 9e 1c 03 00 00    	mov    %ebx,0x31c(%esi)
  4032b7:	8b 86 14 03 00 00    	mov    0x314(%esi),%eax
  4032bd:	3b c3                	cmp    %ebx,%eax
  4032bf:	74 22                	je     0x4032e3
  4032c1:	8b 0d 20 15 41 00    	mov    0x411520,%ecx
  4032c7:	3b cb                	cmp    %ebx,%ecx
  4032c9:	74 48                	je     0x403313
  4032cb:	50                   	push   %eax
  4032cc:	ff d1                	call   *%ecx
  4032ce:	83 c4 04             	add    $0x4,%esp
  4032d1:	83 f8 01             	cmp    $0x1,%eax
  4032d4:	75 3d                	jne    0x403313
  4032d6:	8b 0d 24 15 41 00    	mov    0x411524,%ecx
  4032dc:	51                   	push   %ecx
  4032dd:	ff 15 08 d1 40 00    	call   *0x40d108  ; 0x40d108=KERNEL32.dll!FreeLibrary
  4032e3:	8d 7e 0c             	lea    0xc(%esi),%edi
  4032e6:	3b fb                	cmp    %ebx,%edi
  4032e8:	89 9e 14 03 00 00    	mov    %ebx,0x314(%esi)
  4032ee:	74 09                	je     0x4032f9
  4032f0:	b9 40 00 00 00       	mov    $0x40,%ecx
  4032f5:	33 c0                	xor    %eax,%eax
  4032f7:	f3 ab                	rep stos %eax,%es:(%edi)
  4032f9:	89 5e 08             	mov    %ebx,0x8(%esi)
  4032fc:	66 89 5e 06          	mov    %bx,0x6(%esi)
  403300:	66 89 5e 04          	mov    %bx,0x4(%esi)
  403304:	5f                   	pop    %edi
  403305:	5e                   	pop    %esi
  403306:	89 1d 28 15 41 00    	mov    %ebx,0x411528
  40330c:	b8 01 00 00 00       	mov    $0x1,%eax
  403311:	5b                   	pop    %ebx
  403312:	c3                   	ret
  403313:	5f                   	pop    %edi
  403314:	89 9e 14 03 00 00    	mov    %ebx,0x314(%esi)
  40331a:	5e                   	pop    %esi
  40331b:	33 c0                	xor    %eax,%eax
  40331d:	5b                   	pop    %ebx
  40331e:	c3                   	ret
  40331f:	cc                   	int3
  403320:	56                   	push   %esi
  403321:	57                   	push   %edi
  403322:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  403326:	85 ff                	test   %edi,%edi
  403328:	8b f1                	mov    %ecx,%esi
  40332a:	74 59                	je     0x403385
  40332c:	80 3f 00             	cmpb   $0x0,(%edi)
  40332f:	74 54                	je     0x403385
  403331:	66 8b 46 04          	mov    0x4(%esi),%ax
  403335:	66 3d 01 00          	cmp    $0x1,%ax
  403339:	72 4a                	jb     0x403385
  40333b:	8b 8e 1c 03 00 00    	mov    0x31c(%esi),%ecx
  403341:	0f b7 c0             	movzwl %ax,%eax
  403344:	3b c8                	cmp    %eax,%ecx
  403346:	7d 3d                	jge    0x403385
  403348:	68 00 01 00 00       	push   $0x100
  40334d:	e8 fb 29 00 00       	call   0x405d4d
  403352:	8b 8e 1c 03 00 00    	mov    0x31c(%esi),%ecx
  403358:	8b 96 18 03 00 00    	mov    0x318(%esi),%edx
  40335e:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
  403361:	8b 86 1c 03 00 00    	mov    0x31c(%esi),%eax
  403367:	8b 96 18 03 00 00    	mov    0x318(%esi),%edx
  40336d:	8b 14 82             	mov    (%edx,%eax,4),%edx
  403370:	83 c4 04             	add    $0x4,%esp
  403373:	8b cf                	mov    %edi,%ecx
  403375:	8a 01                	mov    (%ecx),%al
  403377:	41                   	inc    %ecx
  403378:	88 02                	mov    %al,(%edx)
  40337a:	42                   	inc    %edx
  40337b:	84 c0                	test   %al,%al
  40337d:	75 f6                	jne    0x403375
  40337f:	ff 86 1c 03 00 00    	incl   0x31c(%esi)
  403385:	5f                   	pop    %edi
  403386:	5e                   	pop    %esi
  403387:	c2 04 00             	ret    $0x4
  40338a:	cc                   	int3
  40338b:	cc                   	int3
  40338c:	cc                   	int3
  40338d:	cc                   	int3
  40338e:	cc                   	int3
  40338f:	cc                   	int3
  403390:	8b 0d 28 15 41 00    	mov    0x411528,%ecx
  403396:	85 c9                	test   %ecx,%ecx
  403398:	75 03                	jne    0x40339d
  40339a:	33 c0                	xor    %eax,%eax
  40339c:	c3                   	ret
  40339d:	8b 81 10 03 00 00    	mov    0x310(%ecx),%eax
  4033a3:	56                   	push   %esi
  4033a4:	33 f6                	xor    %esi,%esi
  4033a6:	85 c0                	test   %eax,%eax
  4033a8:	74 11                	je     0x4033bb
  4033aa:	8b 44 24 08          	mov    0x8(%esp),%eax
  4033ae:	8b 50 04             	mov    0x4(%eax),%edx
  4033b1:	52                   	push   %edx
  4033b2:	e8 69 ff ff ff       	call   0x403320
  4033b7:	8b c6                	mov    %esi,%eax
  4033b9:	5e                   	pop    %esi
  4033ba:	c3                   	ret
  4033bb:	8b 35 10 15 41 00    	mov    0x411510,%esi
  4033c1:	8b c6                	mov    %esi,%eax
  4033c3:	5e                   	pop    %esi
  4033c4:	c3                   	ret
  4033c5:	cc                   	int3
  4033c6:	cc                   	int3
  4033c7:	cc                   	int3
  4033c8:	cc                   	int3
  4033c9:	cc                   	int3
  4033ca:	cc                   	int3
  4033cb:	cc                   	int3
  4033cc:	cc                   	int3
  4033cd:	cc                   	int3
  4033ce:	cc                   	int3
  4033cf:	cc                   	int3
  4033d0:	8b 44 24 04          	mov    0x4(%esp),%eax
  4033d4:	83 f8 04             	cmp    $0x4,%eax
  4033d7:	77 1b                	ja     0x4033f4
  4033d9:	ff 24 85 f8 33 40 00 	jmp    *0x4033f8(,%eax,4)
  4033e0:	8b 44 24 08          	mov    0x8(%esp),%eax
  4033e4:	50                   	push   %eax
  4033e5:	e8 a6 ff ff ff       	call   0x403390
  4033ea:	83 c4 04             	add    $0x4,%esp
  4033ed:	c3                   	ret
  4033ee:	b8 01 00 00 00       	mov    $0x1,%eax
  4033f3:	c3                   	ret
  4033f4:	33 c0                	xor    %eax,%eax
  4033f6:	c3                   	ret
  4033f7:	90                   	nop
  4033f8:	f4                   	hlt
  4033f9:	33 40 00             	xor    0x0(%eax),%eax
  4033fc:	f4                   	hlt
  4033fd:	33 40 00             	xor    0x0(%eax),%eax
  403400:	e0 33                	loopne 0x403435
  403402:	40                   	inc    %eax
  403403:	00 ee                	add    %ch,%dh
  403405:	33 40 00             	xor    0x0(%eax),%eax
  403408:	f4                   	hlt
  403409:	33 40 00             	xor    0x0(%eax),%eax
  40340c:	cc                   	int3
  40340d:	cc                   	int3
  40340e:	cc                   	int3
  40340f:	cc                   	int3
  403410:	c7 01 78 d5 40 00    	movl   $0x40d578,(%ecx)
  403416:	e8 35 fe ff ff       	call   0x403250
  40341b:	c7 05 28 15 41 00 00 	movl   $0x0,0x411528
  403422:	00 00 00 
  403425:	c3                   	ret
  403426:	cc                   	int3
  403427:	cc                   	int3
  403428:	cc                   	int3
  403429:	cc                   	int3
  40342a:	cc                   	int3
  40342b:	cc                   	int3
  40342c:	cc                   	int3
  40342d:	cc                   	int3
  40342e:	cc                   	int3
  40342f:	cc                   	int3
  403430:	81 ec 04 02 00 00    	sub    $0x204,%esp
  403436:	53                   	push   %ebx
  403437:	55                   	push   %ebp
  403438:	8b e9                	mov    %ecx,%ebp
  40343a:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  40343d:	85 db                	test   %ebx,%ebx
  40343f:	0f 84 f7 00 00 00    	je     0x40353c
  403445:	80 3b 00             	cmpb   $0x0,(%ebx)
  403448:	0f 84 ee 00 00 00    	je     0x40353c
  40344e:	8d 85 0c 01 00 00    	lea    0x10c(%ebp),%eax
  403454:	85 c0                	test   %eax,%eax
  403456:	0f 84 e0 00 00 00    	je     0x40353c
  40345c:	80 38 00             	cmpb   $0x0,(%eax)
  40345f:	0f 84 d7 00 00 00    	je     0x40353c
  403465:	56                   	push   %esi
  403466:	8b b5 14 03 00 00    	mov    0x314(%ebp),%esi
  40346c:	85 f6                	test   %esi,%esi
  40346e:	89 74 24 0c          	mov    %esi,0xc(%esp)
  403472:	0f 84 a5 00 00 00    	je     0x40351d
  403478:	8b 84 24 14 02 00 00 	mov    0x214(%esp),%eax
  40347f:	6a 5c                	push   $0x5c
  403481:	53                   	push   %ebx
  403482:	89 85 10 03 00 00    	mov    %eax,0x310(%ebp)
  403488:	e8 03 2a 00 00       	call   0x405e90
  40348d:	83 c4 08             	add    $0x8,%esp
  403490:	85 c0                	test   %eax,%eax
  403492:	75 1c                	jne    0x4034b0
  403494:	8d 94 24 10 01 00 00 	lea    0x110(%esp),%edx
  40349b:	8b c3                	mov    %ebx,%eax
  40349d:	2b d3                	sub    %ebx,%edx
  40349f:	90                   	nop
  4034a0:	8a 08                	mov    (%eax),%cl
  4034a2:	88 0c 02             	mov    %cl,(%edx,%eax,1)
  4034a5:	40                   	inc    %eax
  4034a6:	84 c9                	test   %cl,%cl
  4034a8:	75 f6                	jne    0x4034a0
  4034aa:	88 4c 24 10          	mov    %cl,0x10(%esp)
  4034ae:	eb 3a                	jmp    0x4034ea
  4034b0:	57                   	push   %edi
  4034b1:	8d 48 01             	lea    0x1(%eax),%ecx
  4034b4:	8d bc 24 14 01 00 00 	lea    0x114(%esp),%edi
  4034bb:	2b f9                	sub    %ecx,%edi
  4034bd:	8d 49 00             	lea    0x0(%ecx),%ecx
  4034c0:	8a 11                	mov    (%ecx),%dl
  4034c2:	88 14 0f             	mov    %dl,(%edi,%ecx,1)
  4034c5:	41                   	inc    %ecx
  4034c6:	84 d2                	test   %dl,%dl
  4034c8:	75 f6                	jne    0x4034c0
  4034ca:	8b f0                	mov    %eax,%esi
  4034cc:	2b f5                	sub    %ebp,%esi
  4034ce:	8d 4e f5             	lea    -0xb(%esi),%ecx
  4034d1:	51                   	push   %ecx
  4034d2:	8d 54 24 18          	lea    0x18(%esp),%edx
  4034d6:	53                   	push   %ebx
  4034d7:	52                   	push   %edx
  4034d8:	e8 83 28 00 00       	call   0x405d60
  4034dd:	83 c4 0c             	add    $0xc,%esp
  4034e0:	c6 44 34 09 00       	movb   $0x0,0x9(%esp,%esi,1)
  4034e5:	8b 74 24 10          	mov    0x10(%esp),%esi
  4034e9:	5f                   	pop    %edi
  4034ea:	a1 1c 15 41 00       	mov    0x41151c,%eax
  4034ef:	85 c0                	test   %eax,%eax
  4034f1:	74 23                	je     0x403516
  4034f3:	6a 00                	push   $0x0
  4034f5:	6a 00                	push   $0x0
  4034f7:	68 d0 33 40 00       	push   $0x4033d0
  4034fc:	6a 00                	push   $0x0
  4034fe:	8d 4c 24 20          	lea    0x20(%esp),%ecx
  403502:	51                   	push   %ecx
  403503:	8d 94 24 24 01 00 00 	lea    0x124(%esp),%edx
  40350a:	52                   	push   %edx
  40350b:	56                   	push   %esi
  40350c:	ff d0                	call   *%eax
  40350e:	83 c4 1c             	add    $0x1c,%esp
  403511:	83 f8 01             	cmp    $0x1,%eax
  403514:	74 15                	je     0x40352b
  403516:	8b ce                	mov    %esi,%ecx
  403518:	e8 93 fc ff ff       	call   0x4031b0
  40351d:	5e                   	pop    %esi
  40351e:	5d                   	pop    %ebp
  40351f:	33 c0                	xor    %eax,%eax
  403521:	5b                   	pop    %ebx
  403522:	81 c4 04 02 00 00    	add    $0x204,%esp
  403528:	c2 04 00             	ret    $0x4
  40352b:	5e                   	pop    %esi
  40352c:	5d                   	pop    %ebp
  40352d:	b8 01 00 00 00       	mov    $0x1,%eax
  403532:	5b                   	pop    %ebx
  403533:	81 c4 04 02 00 00    	add    $0x204,%esp
  403539:	c2 04 00             	ret    $0x4
  40353c:	5d                   	pop    %ebp
  40353d:	33 c0                	xor    %eax,%eax
  40353f:	5b                   	pop    %ebx
  403540:	81 c4 04 02 00 00    	add    $0x204,%esp
  403546:	c2 04 00             	ret    $0x4
  403549:	cc                   	int3
  40354a:	cc                   	int3
  40354b:	cc                   	int3
  40354c:	cc                   	int3
  40354d:	cc                   	int3
  40354e:	cc                   	int3
  40354f:	cc                   	int3
  403550:	56                   	push   %esi
  403551:	8b f1                	mov    %ecx,%esi
  403553:	c7 06 78 d5 40 00    	movl   $0x40d578,(%esi)
  403559:	e8 f2 fc ff ff       	call   0x403250
  40355e:	f6 44 24 08 01       	testb  $0x1,0x8(%esp)
  403563:	c7 05 28 15 41 00 00 	movl   $0x0,0x411528
  40356a:	00 00 00 
  40356d:	74 09                	je     0x403578
  40356f:	56                   	push   %esi
  403570:	e8 eb 22 00 00       	call   0x405860
  403575:	83 c4 04             	add    $0x4,%esp
  403578:	8b c6                	mov    %esi,%eax
  40357a:	5e                   	pop    %esi
  40357b:	c2 04 00             	ret    $0x4
  40357e:	cc                   	int3
  40357f:	cc                   	int3
  403580:	8b 44 24 08          	mov    0x8(%esp),%eax
  403584:	83 ec 24             	sub    $0x24,%esp
  403587:	53                   	push   %ebx
  403588:	8b 5c 24 2c          	mov    0x2c(%esp),%ebx
  40358c:	85 db                	test   %ebx,%ebx
  40358e:	56                   	push   %esi
  40358f:	8b f1                	mov    %ecx,%esi
  403591:	89 1d 0c 15 41 00    	mov    %ebx,0x41150c
  403597:	a3 10 15 41 00       	mov    %eax,0x411510
  40359c:	0f 84 2e 01 00 00    	je     0x4036d0
  4035a2:	85 c0                	test   %eax,%eax
  4035a4:	0f 84 26 01 00 00    	je     0x4036d0
  4035aa:	8b 86 14 03 00 00    	mov    0x314(%esi),%eax
  4035b0:	85 c0                	test   %eax,%eax
  4035b2:	74 05                	je     0x4035b9
  4035b4:	e8 97 fc ff ff       	call   0x403250
  4035b9:	57                   	push   %edi
  4035ba:	8d 44 24 0c          	lea    0xc(%esp),%eax
  4035be:	50                   	push   %eax
  4035bf:	6a 01                	push   $0x1
  4035c1:	68 b0 30 40 00       	push   $0x4030b0
  4035c6:	68 a0 30 40 00       	push   $0x4030a0
  4035cb:	68 80 30 40 00       	push   $0x403080
  4035d0:	68 60 30 40 00       	push   $0x403060
  4035d5:	68 30 30 40 00       	push   $0x403030
  4035da:	68 20 30 40 00       	push   $0x403020
  4035df:	68 10 30 40 00       	push   $0x403010
  4035e4:	89 35 28 15 41 00    	mov    %esi,0x411528
  4035ea:	e8 e1 fa ff ff       	call   0x4030d0
  4035ef:	8b f8                	mov    %eax,%edi
  4035f1:	83 c4 24             	add    $0x24,%esp
  4035f4:	85 ff                	test   %edi,%edi
  4035f6:	74 20                	je     0x403618
  4035f8:	a1 18 15 41 00       	mov    0x411518,%eax
  4035fd:	85 c0                	test   %eax,%eax
  4035ff:	74 10                	je     0x403611
  403601:	8d 4c 24 18          	lea    0x18(%esp),%ecx
  403605:	51                   	push   %ecx
  403606:	53                   	push   %ebx
  403607:	57                   	push   %edi
  403608:	ff d0                	call   *%eax
  40360a:	83 c4 0c             	add    $0xc,%esp
  40360d:	85 c0                	test   %eax,%eax
  40360f:	75 12                	jne    0x403623
  403611:	8b cf                	mov    %edi,%ecx
  403613:	e8 98 fb ff ff       	call   0x4031b0
  403618:	5f                   	pop    %edi
  403619:	5e                   	pop    %esi
  40361a:	33 c0                	xor    %eax,%eax
  40361c:	5b                   	pop    %ebx
  40361d:	83 c4 24             	add    $0x24,%esp
  403620:	c2 08 00             	ret    $0x8
  403623:	8b 44 24 10          	mov    0x10(%esp),%eax
  403627:	8b 54 24 0c          	mov    0xc(%esp),%edx
  40362b:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  40362f:	a3 04 15 41 00       	mov    %eax,0x411504
  403634:	66 8b 44 24 1c       	mov    0x1c(%esp),%ax
  403639:	66 89 46 06          	mov    %ax,0x6(%esi)
  40363d:	66 8b 44 24 1e       	mov    0x1e(%esp),%ax
  403642:	66 85 c0             	test   %ax,%ax
  403645:	89 15 00 15 41 00    	mov    %edx,0x411500
  40364b:	8b 54 24 18          	mov    0x18(%esp),%edx
  40364f:	89 be 14 03 00 00    	mov    %edi,0x314(%esi)
  403655:	89 0d 08 15 41 00    	mov    %ecx,0x411508
  40365b:	c7 46 0c 63 61 62 00 	movl   $0x626163,0xc(%esi)
  403662:	89 56 08             	mov    %edx,0x8(%esi)
  403665:	66 89 46 04          	mov    %ax,0x4(%esi)
  403669:	76 2e                	jbe    0x403699
  40366b:	0f b7 c8             	movzwl %ax,%ecx
  40366e:	c1 e1 02             	shl    $0x2,%ecx
  403671:	51                   	push   %ecx
  403672:	e8 d6 26 00 00       	call   0x405d4d
  403677:	0f b7 4e 04          	movzwl 0x4(%esi),%ecx
  40367b:	c1 e1 02             	shl    $0x2,%ecx
  40367e:	8b d1                	mov    %ecx,%edx
  403680:	8b f8                	mov    %eax,%edi
  403682:	c1 e9 02             	shr    $0x2,%ecx
  403685:	33 c0                	xor    %eax,%eax
  403687:	89 be 18 03 00 00    	mov    %edi,0x318(%esi)
  40368d:	f3 ab                	rep stos %eax,%es:(%edi)
  40368f:	8b ca                	mov    %edx,%ecx
  403691:	83 c4 04             	add    $0x4,%esp
  403694:	83 e1 03             	and    $0x3,%ecx
  403697:	f3 aa                	rep stos %al,%es:(%edi)
  403699:	8b 0d 7c d5 40 00    	mov    0x40d57c,%ecx  ; 0x40d57c='c:\\temp\\'
  40369f:	8d 86 0c 01 00 00    	lea    0x10c(%esi),%eax
  4036a5:	89 08                	mov    %ecx,(%eax)
  4036a7:	8b 15 80 d5 40 00    	mov    0x40d580,%edx
  4036ad:	89 50 04             	mov    %edx,0x4(%eax)
  4036b0:	8a 0d 84 d5 40 00    	mov    0x40d584,%cl
  4036b6:	88 48 08             	mov    %cl,0x8(%eax)
  4036b9:	6a 01                	push   $0x1
  4036bb:	8b ce                	mov    %esi,%ecx
  4036bd:	e8 6e fd ff ff       	call   0x403430
  4036c2:	5f                   	pop    %edi
  4036c3:	5e                   	pop    %esi
  4036c4:	b8 01 00 00 00       	mov    $0x1,%eax
  4036c9:	5b                   	pop    %ebx
  4036ca:	83 c4 24             	add    $0x24,%esp
  4036cd:	c2 08 00             	ret    $0x8
  4036d0:	5e                   	pop    %esi
  4036d1:	33 c0                	xor    %eax,%eax
  4036d3:	5b                   	pop    %ebx
  4036d4:	83 c4 24             	add    $0x24,%esp
  4036d7:	c2 08 00             	ret    $0x8
  4036da:	cc                   	int3
  4036db:	cc                   	int3
  4036dc:	cc                   	int3
  4036dd:	cc                   	int3
  4036de:	cc                   	int3
  4036df:	cc                   	int3
  4036e0:	83 ec 18             	sub    $0x18,%esp
  4036e3:	53                   	push   %ebx
  4036e4:	55                   	push   %ebp
  4036e5:	56                   	push   %esi
  4036e6:	33 f6                	xor    %esi,%esi
  4036e8:	68 94 d5 40 00       	push   $0x40d594
  4036ed:	89 74 24 14          	mov    %esi,0x14(%esp)
  4036f1:	e8 c7 27 00 00       	call   0x405ebd
  4036f6:	68 88 d5 40 00       	push   $0x40d588
  4036fb:	8d 6c 00 02          	lea    0x2(%eax,%eax,1),%ebp
  4036ff:	e8 b9 27 00 00       	call   0x405ebd
  403704:	8d 44 00 02          	lea    0x2(%eax,%eax,1),%eax
  403708:	89 44 24 14          	mov    %eax,0x14(%esp)
  40370c:	8d 44 28 1b          	lea    0x1b(%eax,%ebp,1),%eax
  403710:	83 c4 08             	add    $0x8,%esp
  403713:	83 e0 fc             	and    $0xfffffffc,%eax
  403716:	50                   	push   %eax
  403717:	6a 42                	push   $0x42
  403719:	ff 15 3c d0 40 00    	call   *0x40d03c  ; 0x40d03c=KERNEL32.dll!LocalAlloc
  40371f:	8b d8                	mov    %eax,%ebx
  403721:	85 db                	test   %ebx,%ebx
  403723:	74 12                	je     0x403737
  403725:	53                   	push   %ebx
  403726:	ff 15 38 d0 40 00    	call   *0x40d038  ; 0x40d038=KERNEL32.dll!LocalLock
  40372c:	85 c0                	test   %eax,%eax
  40372e:	75 10                	jne    0x403740
  403730:	53                   	push   %ebx
  403731:	ff 15 14 d1 40 00    	call   *0x40d114  ; 0x40d114=KERNEL32.dll!LocalFree
  403737:	5e                   	pop    %esi
  403738:	5d                   	pop    %ebp
  403739:	33 c0                	xor    %eax,%eax
  40373b:	5b                   	pop    %ebx
  40373c:	83 c4 18             	add    $0x18,%esp
  40373f:	c3                   	ret
  403740:	8b 4c 24 28          	mov    0x28(%esp),%ecx
  403744:	8b d0                	mov    %eax,%edx
  403746:	89 0a                	mov    %ecx,(%edx)
  403748:	89 72 04             	mov    %esi,0x4(%edx)
  40374b:	8b ce                	mov    %esi,%ecx
  40374d:	89 4a 08             	mov    %ecx,0x8(%edx)
  403750:	89 4a 0c             	mov    %ecx,0xc(%edx)
  403753:	66 89 72 10          	mov    %si,0x10(%edx)
  403757:	66 c7 40 12 00 00    	movw   $0x0,0x12(%eax)
  40375d:	83 c0 12             	add    $0x12,%eax
  403760:	66 c7 40 01 00 00    	movw   $0x0,0x1(%eax)
  403766:	57                   	push   %edi
  403767:	83 c0 04             	add    $0x4,%eax
  40376a:	8b cd                	mov    %ebp,%ecx
  40376c:	8b d1                	mov    %ecx,%edx
  40376e:	c1 e9 02             	shr    $0x2,%ecx
  403771:	8b f8                	mov    %eax,%edi
  403773:	be 94 d5 40 00       	mov    $0x40d594,%esi
  403778:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  40377a:	8b ca                	mov    %edx,%ecx
  40377c:	83 e1 03             	and    $0x3,%ecx
  40377f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  403781:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  403785:	03 c5                	add    %ebp,%eax
  403787:	66 c7 00 0b 00       	movw   $0xb,(%eax)
  40378c:	8d 78 02             	lea    0x2(%eax),%edi
  40378f:	8b c1                	mov    %ecx,%eax
  403791:	c1 e9 02             	shr    $0x2,%ecx
  403794:	be 88 d5 40 00       	mov    $0x40d588,%esi
  403799:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  40379b:	8b c8                	mov    %eax,%ecx
  40379d:	83 e1 03             	and    $0x3,%ecx
  4037a0:	53                   	push   %ebx
  4037a1:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  4037a3:	ff 15 34 d0 40 00    	call   *0x40d034  ; 0x40d034=KERNEL32.dll!LocalUnlock
  4037a9:	5f                   	pop    %edi
  4037aa:	5e                   	pop    %esi
  4037ab:	5d                   	pop    %ebp
  4037ac:	8b c3                	mov    %ebx,%eax
  4037ae:	5b                   	pop    %ebx
  4037af:	83 c4 18             	add    $0x18,%esp
  4037b2:	c3                   	ret
  4037b3:	cc                   	int3
  4037b4:	cc                   	int3
  4037b5:	cc                   	int3
  4037b6:	cc                   	int3
  4037b7:	cc                   	int3
  4037b8:	cc                   	int3
  4037b9:	cc                   	int3
  4037ba:	cc                   	int3
  4037bb:	cc                   	int3
  4037bc:	cc                   	int3
  4037bd:	cc                   	int3
  4037be:	cc                   	int3
  4037bf:	cc                   	int3
  4037c0:	8b c1                	mov    %ecx,%eax
  4037c2:	33 c9                	xor    %ecx,%ecx
  4037c4:	c7 00 9c d5 40 00    	movl   $0x40d59c,(%eax)
  4037ca:	89 48 0c             	mov    %ecx,0xc(%eax)
  4037cd:	89 48 10             	mov    %ecx,0x10(%eax)
  4037d0:	89 48 08             	mov    %ecx,0x8(%eax)
  4037d3:	66 89 48 14          	mov    %cx,0x14(%eax)
  4037d7:	c7 40 04 00 00 cc 80 	movl   $0x80cc0000,0x4(%eax)
  4037de:	c3                   	ret
  4037df:	cc                   	int3
  4037e0:	c2 08 00             	ret    $0x8
  4037e3:	cc                   	int3
  4037e4:	cc                   	int3
  4037e5:	cc                   	int3
  4037e6:	cc                   	int3
  4037e7:	cc                   	int3
  4037e8:	cc                   	int3
  4037e9:	cc                   	int3
  4037ea:	cc                   	int3
  4037eb:	cc                   	int3
  4037ec:	cc                   	int3
  4037ed:	cc                   	int3
  4037ee:	cc                   	int3
  4037ef:	cc                   	int3
  4037f0:	33 c0                	xor    %eax,%eax
  4037f2:	c2 10 00             	ret    $0x10
  4037f5:	cc                   	int3
  4037f6:	cc                   	int3
  4037f7:	cc                   	int3
  4037f8:	cc                   	int3
  4037f9:	cc                   	int3
  4037fa:	cc                   	int3
  4037fb:	cc                   	int3
  4037fc:	cc                   	int3
  4037fd:	cc                   	int3
  4037fe:	cc                   	int3
  4037ff:	cc                   	int3
  403800:	56                   	push   %esi
  403801:	8b 74 24 08          	mov    0x8(%esp),%esi
  403805:	6a eb                	push   $0xffffffeb
  403807:	56                   	push   %esi
  403808:	ff 15 cc d1 40 00    	call   *0x40d1cc  ; 0x40d1cc=USER32.dll!GetWindowLongA
  40380e:	8b 54 24 0c          	mov    0xc(%esp),%edx
  403812:	8b c8                	mov    %eax,%ecx
  403814:	85 c9                	test   %ecx,%ecx
  403816:	75 16                	jne    0x40382e
  403818:	8b 44 24 14          	mov    0x14(%esp),%eax
  40381c:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  403820:	50                   	push   %eax
  403821:	51                   	push   %ecx
  403822:	52                   	push   %edx
  403823:	56                   	push   %esi
  403824:	ff 15 c0 d1 40 00    	call   *0x40d1c0  ; 0x40d1c0=USER32.dll!DefWindowProcA
  40382a:	5e                   	pop    %esi
  40382b:	c2 10 00             	ret    $0x10
  40382e:	8b c2                	mov    %edx,%eax
  403830:	83 e8 02             	sub    $0x2,%eax
  403833:	74 35                	je     0x40386a
  403835:	83 e8 03             	sub    $0x3,%eax
  403838:	74 17                	je     0x403851
  40383a:	8b 01                	mov    (%ecx),%eax
  40383c:	57                   	push   %edi
  40383d:	8b 7c 24 18          	mov    0x18(%esp),%edi
  403841:	57                   	push   %edi
  403842:	8b 7c 24 18          	mov    0x18(%esp),%edi
  403846:	57                   	push   %edi
  403847:	52                   	push   %edx
  403848:	56                   	push   %esi
  403849:	ff 50 10             	call   *0x10(%eax)
  40384c:	5f                   	pop    %edi
  40384d:	5e                   	pop    %esi
  40384e:	c2 10 00             	ret    $0x10
  403851:	8b 44 24 14          	mov    0x14(%esp),%eax
  403855:	8b 11                	mov    (%ecx),%edx
  403857:	8b f0                	mov    %eax,%esi
  403859:	0f b7 c0             	movzwl %ax,%eax
  40385c:	c1 ee 10             	shr    $0x10,%esi
  40385f:	56                   	push   %esi
  403860:	50                   	push   %eax
  403861:	ff 52 08             	call   *0x8(%edx)
  403864:	33 c0                	xor    %eax,%eax
  403866:	5e                   	pop    %esi
  403867:	c2 10 00             	ret    $0x10
  40386a:	8b 11                	mov    (%ecx),%edx
  40386c:	ff 52 04             	call   *0x4(%edx)
  40386f:	6a 00                	push   $0x0
  403871:	ff 15 bc d1 40 00    	call   *0x40d1bc  ; 0x40d1bc=USER32.dll!PostQuitMessage
  403877:	33 c0                	xor    %eax,%eax
  403879:	5e                   	pop    %esi
  40387a:	c2 10 00             	ret    $0x10
  40387d:	cc                   	int3
  40387e:	cc                   	int3
  40387f:	cc                   	int3
  403880:	51                   	push   %ecx
  403881:	6a 00                	push   $0x0
  403883:	6a 00                	push   $0x0
  403885:	8d 44 24 08          	lea    0x8(%esp),%eax
  403889:	50                   	push   %eax
  40388a:	68 00 04 00 00       	push   $0x400
  40388f:	ff 15 0c d1 40 00    	call   *0x40d10c  ; 0x40d10c=KERNEL32.dll!GetLastError
  403895:	50                   	push   %eax
  403896:	6a 00                	push   $0x0
  403898:	68 00 13 00 00       	push   $0x1300
  40389d:	ff 15 10 d1 40 00    	call   *0x40d110  ; 0x40d110=KERNEL32.dll!FormatMessageA
  4038a3:	85 c0                	test   %eax,%eax
  4038a5:	76 27                	jbe    0x4038ce
  4038a7:	56                   	push   %esi
  4038a8:	8b 74 24 04          	mov    0x4(%esp),%esi
  4038ac:	ba 30 15 41 00       	mov    $0x411530,%edx
  4038b1:	8b c6                	mov    %esi,%eax
  4038b3:	2b d6                	sub    %esi,%edx
  4038b5:	8a 08                	mov    (%eax),%cl
  4038b7:	88 0c 02             	mov    %cl,(%edx,%eax,1)
  4038ba:	40                   	inc    %eax
  4038bb:	84 c9                	test   %cl,%cl
  4038bd:	75 f6                	jne    0x4038b5
  4038bf:	56                   	push   %esi
  4038c0:	ff 15 14 d1 40 00    	call   *0x40d114  ; 0x40d114=KERNEL32.dll!LocalFree
  4038c6:	5e                   	pop    %esi
  4038c7:	b8 30 15 41 00       	mov    $0x411530,%eax
  4038cc:	59                   	pop    %ecx
  4038cd:	c3                   	ret
  4038ce:	c6 05 30 15 41 00 00 	movb   $0x0,0x411530
  4038d5:	b8 30 15 41 00       	mov    $0x411530,%eax
  4038da:	59                   	pop    %ecx
  4038db:	c3                   	ret
  4038dc:	cc                   	int3
  4038dd:	cc                   	int3
  4038de:	cc                   	int3
  4038df:	cc                   	int3
  4038e0:	56                   	push   %esi
  4038e1:	8b f1                	mov    %ecx,%esi
  4038e3:	66 8b 46 14          	mov    0x14(%esi),%ax
  4038e7:	66 85 c0             	test   %ax,%ax
  4038ea:	57                   	push   %edi
  4038eb:	8b 7c 24 10          	mov    0x10(%esp),%edi
  4038ef:	89 7e 10             	mov    %edi,0x10(%esi)
  4038f2:	74 19                	je     0x40390d
  4038f4:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  4038f8:	6a 00                	push   $0x0
  4038fa:	68 00 38 40 00       	push   $0x403800
  4038ff:	0f b7 c0             	movzwl %ax,%eax
  403902:	57                   	push   %edi
  403903:	50                   	push   %eax
  403904:	51                   	push   %ecx
  403905:	ff 15 90 d1 40 00    	call   *0x40d190  ; 0x40d190=USER32.dll!CreateDialogParamA
  40390b:	eb 2a                	jmp    0x403937
  40390d:	8b 56 04             	mov    0x4(%esi),%edx
  403910:	52                   	push   %edx
  403911:	e8 ca fd ff ff       	call   0x4036e0
  403916:	83 c4 04             	add    $0x4,%esp
  403919:	50                   	push   %eax
  40391a:	89 46 08             	mov    %eax,0x8(%esi)
  40391d:	ff 15 38 d0 40 00    	call   *0x40d038  ; 0x40d038=KERNEL32.dll!LocalLock
  403923:	6a 00                	push   $0x0
  403925:	68 00 38 40 00       	push   $0x403800
  40392a:	57                   	push   %edi
  40392b:	50                   	push   %eax
  40392c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  403930:	50                   	push   %eax
  403931:	ff 15 94 d1 40 00    	call   *0x40d194  ; 0x40d194=USER32.dll!CreateDialogIndirectParamA
  403937:	85 c0                	test   %eax,%eax
  403939:	89 46 0c             	mov    %eax,0xc(%esi)
  40393c:	75 1e                	jne    0x40395c
  40393e:	e8 3d ff ff ff       	call   0x403880
  403943:	8b 4e 10             	mov    0x10(%esi),%ecx
  403946:	6a 00                	push   $0x0
  403948:	68 b0 d5 40 00       	push   $0x40d5b0  ; 0x40d5b0='dlg create err!'
  40394d:	50                   	push   %eax
  40394e:	51                   	push   %ecx
  40394f:	ff 15 a0 d1 40 00    	call   *0x40d1a0  ; 0x40d1a0=USER32.dll!MessageBoxA
  403955:	5f                   	pop    %edi
  403956:	33 c0                	xor    %eax,%eax
  403958:	5e                   	pop    %esi
  403959:	c2 08 00             	ret    $0x8
  40395c:	56                   	push   %esi
  40395d:	6a eb                	push   $0xffffffeb
  40395f:	50                   	push   %eax
  403960:	ff 15 d0 d1 40 00    	call   *0x40d1d0  ; 0x40d1d0=USER32.dll!SetWindowLongA
  403966:	8b 16                	mov    (%esi),%edx
  403968:	8b ce                	mov    %esi,%ecx
  40396a:	ff 12                	call   *(%edx)
  40396c:	5f                   	pop    %edi
  40396d:	b8 01 00 00 00       	mov    $0x1,%eax
  403972:	5e                   	pop    %esi
  403973:	c2 08 00             	ret    $0x8
  403976:	cc                   	int3
  403977:	cc                   	int3
  403978:	cc                   	int3
  403979:	cc                   	int3
  40397a:	cc                   	int3
  40397b:	cc                   	int3
  40397c:	cc                   	int3
  40397d:	cc                   	int3
  40397e:	cc                   	int3
  40397f:	cc                   	int3
  403980:	33 c0                	xor    %eax,%eax
  403982:	89 41 0c             	mov    %eax,0xc(%ecx)
  403985:	89 41 10             	mov    %eax,0x10(%ecx)
  403988:	c3                   	ret
  403989:	cc                   	int3
  40398a:	cc                   	int3
  40398b:	cc                   	int3
  40398c:	cc                   	int3
  40398d:	cc                   	int3
  40398e:	cc                   	int3
  40398f:	cc                   	int3
  403990:	8b 44 24 04          	mov    0x4(%esp),%eax
  403994:	85 c0                	test   %eax,%eax
  403996:	74 0f                	je     0x4039a7
  403998:	8b 41 0c             	mov    0xc(%ecx),%eax
  40399b:	6a 04                	push   $0x4
  40399d:	50                   	push   %eax
  40399e:	ff 15 e0 d1 40 00    	call   *0x40d1e0  ; 0x40d1e0=USER32.dll!ShowWindow
  4039a4:	c2 04 00             	ret    $0x4
  4039a7:	8b 49 0c             	mov    0xc(%ecx),%ecx
  4039aa:	6a 00                	push   $0x0
  4039ac:	51                   	push   %ecx
  4039ad:	ff 15 e0 d1 40 00    	call   *0x40d1e0  ; 0x40d1e0=USER32.dll!ShowWindow
  4039b3:	c2 04 00             	ret    $0x4
  4039b6:	cc                   	int3
  4039b7:	cc                   	int3
  4039b8:	cc                   	int3
  4039b9:	cc                   	int3
  4039ba:	cc                   	int3
  4039bb:	cc                   	int3
  4039bc:	cc                   	int3
  4039bd:	cc                   	int3
  4039be:	cc                   	int3
  4039bf:	cc                   	int3
  4039c0:	56                   	push   %esi
  4039c1:	8b f1                	mov    %ecx,%esi
  4039c3:	8b 46 0c             	mov    0xc(%esi),%eax
  4039c6:	85 c0                	test   %eax,%eax
  4039c8:	c7 06 9c d5 40 00    	movl   $0x40d59c,(%esi)
  4039ce:	74 23                	je     0x4039f3
  4039d0:	6a 00                	push   $0x0
  4039d2:	6a eb                	push   $0xffffffeb
  4039d4:	50                   	push   %eax
  4039d5:	ff 15 d0 d1 40 00    	call   *0x40d1d0  ; 0x40d1d0=USER32.dll!SetWindowLongA
  4039db:	8b 46 0c             	mov    0xc(%esi),%eax
  4039de:	50                   	push   %eax
  4039df:	ff 15 c8 d1 40 00    	call   *0x40d1c8  ; 0x40d1c8=USER32.dll!DestroyWindow
  4039e5:	c7 46 0c 00 00 00 00 	movl   $0x0,0xc(%esi)
  4039ec:	c7 46 10 00 00 00 00 	movl   $0x0,0x10(%esi)
  4039f3:	8b 46 08             	mov    0x8(%esi),%eax
  4039f6:	85 c0                	test   %eax,%eax
  4039f8:	74 18                	je     0x403a12
  4039fa:	50                   	push   %eax
  4039fb:	ff 15 34 d0 40 00    	call   *0x40d034  ; 0x40d034=KERNEL32.dll!LocalUnlock
  403a01:	8b 4e 08             	mov    0x8(%esi),%ecx
  403a04:	51                   	push   %ecx
  403a05:	ff 15 14 d1 40 00    	call   *0x40d114  ; 0x40d114=KERNEL32.dll!LocalFree
  403a0b:	c7 46 08 00 00 00 00 	movl   $0x0,0x8(%esi)
  403a12:	5e                   	pop    %esi
  403a13:	c3                   	ret
  403a14:	cc                   	int3
  403a15:	cc                   	int3
  403a16:	cc                   	int3
  403a17:	cc                   	int3
  403a18:	cc                   	int3
  403a19:	cc                   	int3
  403a1a:	cc                   	int3
  403a1b:	cc                   	int3
  403a1c:	cc                   	int3
  403a1d:	cc                   	int3
  403a1e:	cc                   	int3
  403a1f:	cc                   	int3
  403a20:	56                   	push   %esi
  403a21:	8b f1                	mov    %ecx,%esi
  403a23:	e8 98 ff ff ff       	call   0x4039c0
  403a28:	f6 44 24 08 01       	testb  $0x1,0x8(%esp)
  403a2d:	74 09                	je     0x403a38
  403a2f:	56                   	push   %esi
  403a30:	e8 2b 1e 00 00       	call   0x405860
  403a35:	83 c4 04             	add    $0x4,%esp
  403a38:	8b c6                	mov    %esi,%eax
  403a3a:	5e                   	pop    %esi
  403a3b:	c2 04 00             	ret    $0x4
  403a3e:	cc                   	int3
  403a3f:	cc                   	int3
  403a40:	56                   	push   %esi
  403a41:	8b f1                	mov    %ecx,%esi
  403a43:	e8 78 fd ff ff       	call   0x4037c0
  403a48:	33 c0                	xor    %eax,%eax
  403a4a:	89 46 18             	mov    %eax,0x18(%esi)
  403a4d:	89 46 1c             	mov    %eax,0x1c(%esi)
  403a50:	89 46 20             	mov    %eax,0x20(%esi)
  403a53:	c7 06 c0 d5 40 00    	movl   $0x40d5c0,(%esi)
  403a59:	66 c7 46 14 87 00    	movw   $0x87,0x14(%esi)
  403a5f:	c7 46 24 b1 01 00 00 	movl   $0x1b1,0x24(%esi)
  403a66:	c7 46 28 73 00 00 00 	movl   $0x73,0x28(%esi)
  403a6d:	8b c6                	mov    %esi,%eax
  403a6f:	5e                   	pop    %esi
  403a70:	c3                   	ret
  403a71:	cc                   	int3
  403a72:	cc                   	int3
  403a73:	cc                   	int3
  403a74:	cc                   	int3
  403a75:	cc                   	int3
  403a76:	cc                   	int3
  403a77:	cc                   	int3
  403a78:	cc                   	int3
  403a79:	cc                   	int3
  403a7a:	cc                   	int3
  403a7b:	cc                   	int3
  403a7c:	cc                   	int3
  403a7d:	cc                   	int3
  403a7e:	cc                   	int3
  403a7f:	cc                   	int3
  403a80:	c7 01 c0 d5 40 00    	movl   $0x40d5c0,(%ecx)
  403a86:	e9 35 ff ff ff       	jmp    0x4039c0
  403a8b:	cc                   	int3
  403a8c:	cc                   	int3
  403a8d:	cc                   	int3
  403a8e:	cc                   	int3
  403a8f:	cc                   	int3
  403a90:	81 7c 24 08 11 01 00 	cmpl   $0x111,0x8(%esp)
  403a97:	00 
  403a98:	74 05                	je     0x403a9f
  403a9a:	33 c0                	xor    %eax,%eax
  403a9c:	c2 10 00             	ret    $0x10
  403a9f:	81 7c 24 0c f6 03 00 	cmpl   $0x3f6,0xc(%esp)
  403aa6:	00 
  403aa7:	b8 01 00 00 00       	mov    $0x1,%eax
  403aac:	75 03                	jne    0x403ab1
  403aae:	89 41 20             	mov    %eax,0x20(%ecx)
  403ab1:	c2 10 00             	ret    $0x10
  403ab4:	cc                   	int3
  403ab5:	cc                   	int3
  403ab6:	cc                   	int3
  403ab7:	cc                   	int3
  403ab8:	cc                   	int3
  403ab9:	cc                   	int3
  403aba:	cc                   	int3
  403abb:	cc                   	int3
  403abc:	cc                   	int3
  403abd:	cc                   	int3
  403abe:	cc                   	int3
  403abf:	cc                   	int3
  403ac0:	83 ec 10             	sub    $0x10,%esp
  403ac3:	53                   	push   %ebx
  403ac4:	56                   	push   %esi
  403ac5:	57                   	push   %edi
  403ac6:	8b 3d d8 d1 40 00    	mov    0x40d1d8,%edi  ; 0x40d1d8=USER32.dll!GetSystemMetrics
  403acc:	6a 10                	push   $0x10
  403ace:	8b f1                	mov    %ecx,%esi
  403ad0:	ff d7                	call   *%edi
  403ad2:	6a 11                	push   $0x11
  403ad4:	8b d8                	mov    %eax,%ebx
  403ad6:	ff d7                	call   *%edi
  403ad8:	8b 4e 28             	mov    0x28(%esi),%ecx
  403adb:	8b 7e 24             	mov    0x24(%esi),%edi
  403ade:	2b c1                	sub    %ecx,%eax
  403ae0:	99                   	cltd
  403ae1:	6a 01                	push   $0x1
  403ae3:	2b c2                	sub    %edx,%eax
  403ae5:	d1 f8                	sar    $1,%eax
  403ae7:	51                   	push   %ecx
  403ae8:	57                   	push   %edi
  403ae9:	50                   	push   %eax
  403aea:	8b c3                	mov    %ebx,%eax
  403aec:	2b c7                	sub    %edi,%eax
  403aee:	99                   	cltd
  403aef:	2b c2                	sub    %edx,%eax
  403af1:	d1 f8                	sar    $1,%eax
  403af3:	50                   	push   %eax
  403af4:	8b 46 0c             	mov    0xc(%esi),%eax
  403af7:	50                   	push   %eax
  403af8:	ff 15 7c d1 40 00    	call   *0x40d17c  ; 0x40d17c=USER32.dll!MoveWindow
  403afe:	8b 4e 0c             	mov    0xc(%esi),%ecx
  403b01:	6a 03                	push   $0x3
  403b03:	6a 01                	push   $0x1
  403b05:	6a 01                	push   $0x1
  403b07:	6a 02                	push   $0x2
  403b09:	6a 00                	push   $0x0
  403b0b:	6a 00                	push   $0x0
  403b0d:	51                   	push   %ecx
  403b0e:	ff 15 d4 d1 40 00    	call   *0x40d1d4  ; 0x40d1d4=USER32.dll!SetWindowPos
  403b14:	6a 01                	push   $0x1
  403b16:	8b ce                	mov    %esi,%ecx
  403b18:	e8 73 fe ff ff       	call   0x403990
  403b1d:	8b 56 0c             	mov    0xc(%esi),%edx
  403b20:	8b 3d 74 d1 40 00    	mov    0x40d174,%edi  ; 0x40d174=USER32.dll!UpdateWindow
  403b26:	52                   	push   %edx
  403b27:	ff d7                	call   *%edi
  403b29:	8b 46 18             	mov    0x18(%esi),%eax
  403b2c:	6a 01                	push   $0x1
  403b2e:	50                   	push   %eax
  403b2f:	ff 15 e0 d1 40 00    	call   *0x40d1e0  ; 0x40d1e0=USER32.dll!ShowWindow
  403b35:	8b 4e 0c             	mov    0xc(%esi),%ecx
  403b38:	51                   	push   %ecx
  403b39:	ff d7                	call   *%edi
  403b3b:	8b 46 0c             	mov    0xc(%esi),%eax
  403b3e:	8d 54 24 0c          	lea    0xc(%esp),%edx
  403b42:	52                   	push   %edx
  403b43:	50                   	push   %eax
  403b44:	ff 15 80 d1 40 00    	call   *0x40d180  ; 0x40d180=USER32.dll!GetClientRect
  403b4a:	8b 7c 24 10          	mov    0x10(%esp),%edi
  403b4e:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  403b52:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  403b56:	8b 54 24 18          	mov    0x18(%esp),%edx
  403b5a:	8b 46 0c             	mov    0xc(%esi),%eax
  403b5d:	2b d7                	sub    %edi,%edx
  403b5f:	8b 3d 84 d1 40 00    	mov    0x40d184,%edi  ; 0x40d184=USER32.dll!GetDlgItem
  403b65:	68 f5 03 00 00       	push   $0x3f5
  403b6a:	2b cb                	sub    %ebx,%ecx
  403b6c:	50                   	push   %eax
  403b6d:	89 4e 24             	mov    %ecx,0x24(%esi)
  403b70:	89 56 28             	mov    %edx,0x28(%esi)
  403b73:	ff d7                	call   *%edi
  403b75:	68 d4 d5 40 00       	push   $0x40d5d4  ; 0x40d5d4='Update...'
  403b7a:	50                   	push   %eax
  403b7b:	89 46 18             	mov    %eax,0x18(%esi)
  403b7e:	ff 15 88 d1 40 00    	call   *0x40d188  ; 0x40d188=USER32.dll!SetWindowTextA
  403b84:	8b 4e 0c             	mov    0xc(%esi),%ecx
  403b87:	68 f4 03 00 00       	push   $0x3f4
  403b8c:	51                   	push   %ecx
  403b8d:	ff d7                	call   *%edi
  403b8f:	89 46 1c             	mov    %eax,0x1c(%esi)
  403b92:	68 00 00 64 00       	push   $0x640000
  403b97:	8b 3d 8c d1 40 00    	mov    0x40d18c,%edi  ; 0x40d18c=USER32.dll!SendMessageA
  403b9d:	6a 00                	push   $0x0
  403b9f:	68 01 04 00 00       	push   $0x401
  403ba4:	50                   	push   %eax
  403ba5:	ff d7                	call   *%edi
  403ba7:	8b 56 1c             	mov    0x1c(%esi),%edx
  403baa:	6a 00                	push   $0x0
  403bac:	6a 32                	push   $0x32
  403bae:	68 02 04 00 00       	push   $0x402
  403bb3:	52                   	push   %edx
  403bb4:	ff d7                	call   *%edi
  403bb6:	5f                   	pop    %edi
  403bb7:	5e                   	pop    %esi
  403bb8:	5b                   	pop    %ebx
  403bb9:	83 c4 10             	add    $0x10,%esp
  403bbc:	c3                   	ret
  403bbd:	cc                   	int3
  403bbe:	cc                   	int3
  403bbf:	cc                   	int3
  403bc0:	e9 bb fd ff ff       	jmp    0x403980
  403bc5:	cc                   	int3
  403bc6:	cc                   	int3
  403bc7:	cc                   	int3
  403bc8:	cc                   	int3
  403bc9:	cc                   	int3
  403bca:	cc                   	int3
  403bcb:	cc                   	int3
  403bcc:	cc                   	int3
  403bcd:	cc                   	int3
  403bce:	cc                   	int3
  403bcf:	cc                   	int3
  403bd0:	e9 0b fd ff ff       	jmp    0x4038e0
  403bd5:	cc                   	int3
  403bd6:	cc                   	int3
  403bd7:	cc                   	int3
  403bd8:	cc                   	int3
  403bd9:	cc                   	int3
  403bda:	cc                   	int3
  403bdb:	cc                   	int3
  403bdc:	cc                   	int3
  403bdd:	cc                   	int3
  403bde:	cc                   	int3
  403bdf:	cc                   	int3
  403be0:	6a 00                	push   $0x0
  403be2:	e8 a9 fd ff ff       	call   0x403990
  403be7:	c3                   	ret
  403be8:	cc                   	int3
  403be9:	cc                   	int3
  403bea:	cc                   	int3
  403beb:	cc                   	int3
  403bec:	cc                   	int3
  403bed:	cc                   	int3
  403bee:	cc                   	int3
  403bef:	cc                   	int3
  403bf0:	8b 44 24 04          	mov    0x4(%esp),%eax
  403bf4:	56                   	push   %esi
  403bf5:	8b f1                	mov    %ecx,%esi
  403bf7:	8b 4e 18             	mov    0x18(%esi),%ecx
  403bfa:	50                   	push   %eax
  403bfb:	51                   	push   %ecx
  403bfc:	ff 15 88 d1 40 00    	call   *0x40d188  ; 0x40d188=USER32.dll!SetWindowTextA
  403c02:	8b 56 1c             	mov    0x1c(%esi),%edx
  403c05:	6a 00                	push   $0x0
  403c07:	6a 00                	push   $0x0
  403c09:	68 02 04 00 00       	push   $0x402
  403c0e:	52                   	push   %edx
  403c0f:	ff 15 8c d1 40 00    	call   *0x40d18c  ; 0x40d18c=USER32.dll!SendMessageA
  403c15:	5e                   	pop    %esi
  403c16:	c2 04 00             	ret    $0x4
  403c19:	cc                   	int3
  403c1a:	cc                   	int3
  403c1b:	cc                   	int3
  403c1c:	cc                   	int3
  403c1d:	cc                   	int3
  403c1e:	cc                   	int3
  403c1f:	cc                   	int3
  403c20:	8b 44 24 04          	mov    0x4(%esp),%eax
  403c24:	8b 49 1c             	mov    0x1c(%ecx),%ecx
  403c27:	6a 00                	push   $0x0
  403c29:	50                   	push   %eax
  403c2a:	68 02 04 00 00       	push   $0x402
  403c2f:	51                   	push   %ecx
  403c30:	ff 15 8c d1 40 00    	call   *0x40d18c  ; 0x40d18c=USER32.dll!SendMessageA
  403c36:	c2 04 00             	ret    $0x4
  403c39:	cc                   	int3
  403c3a:	cc                   	int3
  403c3b:	cc                   	int3
  403c3c:	cc                   	int3
  403c3d:	cc                   	int3
  403c3e:	cc                   	int3
  403c3f:	cc                   	int3
  403c40:	56                   	push   %esi
  403c41:	8b f1                	mov    %ecx,%esi
  403c43:	e8 38 fe ff ff       	call   0x403a80
  403c48:	f6 44 24 08 01       	testb  $0x1,0x8(%esp)
  403c4d:	74 09                	je     0x403c58
  403c4f:	56                   	push   %esi
  403c50:	e8 0b 1c 00 00       	call   0x405860
  403c55:	83 c4 04             	add    $0x4,%esp
  403c58:	8b c6                	mov    %esi,%eax
  403c5a:	5e                   	pop    %esi
  403c5b:	c2 04 00             	ret    $0x4
  403c5e:	cc                   	int3
  403c5f:	cc                   	int3
  403c60:	56                   	push   %esi
  403c61:	8b f1                	mov    %ecx,%esi
  403c63:	8d 4e 04             	lea    0x4(%esi),%ecx
  403c66:	e8 05 0b 00 00       	call   0x404770
  403c6b:	c7 46 10 00 00 00 00 	movl   $0x0,0x10(%esi)
  403c72:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  403c78:	8b c6                	mov    %esi,%eax
  403c7a:	5e                   	pop    %esi
  403c7b:	c3                   	ret
  403c7c:	cc                   	int3
  403c7d:	cc                   	int3
  403c7e:	cc                   	int3
  403c7f:	cc                   	int3
  403c80:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
  403c86:	6a ff                	push   $0xffffffff
  403c88:	68 01 c3 40 00       	push   $0x40c301
  403c8d:	50                   	push   %eax
  403c8e:	8b 44 24 10          	mov    0x10(%esp),%eax
  403c92:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
  403c99:	81 ec fc 02 00 00    	sub    $0x2fc,%esp
  403c9f:	53                   	push   %ebx
  403ca0:	50                   	push   %eax
  403ca1:	8d 4c 24 20          	lea    0x20(%esp),%ecx
  403ca5:	51                   	push   %ecx
  403ca6:	ff 15 90 d0 40 00    	call   *0x40d090  ; 0x40d090=KERNEL32.dll!lstrcpyA
  403cac:	8d 44 24 1c          	lea    0x1c(%esp),%eax
  403cb0:	8d 50 01             	lea    0x1(%eax),%edx
  403cb3:	33 db                	xor    %ebx,%ebx
  403cb5:	8a 08                	mov    (%eax),%cl
  403cb7:	40                   	inc    %eax
  403cb8:	3a cb                	cmp    %bl,%cl
  403cba:	75 f9                	jne    0x403cb5
  403cbc:	2b c2                	sub    %edx,%eax
  403cbe:	48                   	dec    %eax
  403cbf:	83 f8 02             	cmp    $0x2,%eax
  403cc2:	7e 0d                	jle    0x403cd1
  403cc4:	80 7c 04 1c 5c       	cmpb   $0x5c,0x1c(%esp,%eax,1)
  403cc9:	74 06                	je     0x403cd1
  403ccb:	48                   	dec    %eax
  403ccc:	83 f8 02             	cmp    $0x2,%eax
  403ccf:	7f f3                	jg     0x403cc4
  403cd1:	8a 4c 04 1c          	mov    0x1c(%esp,%eax,1),%cl
  403cd5:	80 f9 5c             	cmp    $0x5c,%cl
  403cd8:	8d 44 04 1c          	lea    0x1c(%esp,%eax,1),%eax
  403cdc:	0f 85 9b 01 00 00    	jne    0x403e7d
  403ce2:	8d 54 24 1c          	lea    0x1c(%esp),%edx
  403ce6:	52                   	push   %edx
  403ce7:	88 18                	mov    %bl,(%eax)
  403ce9:	ff 15 44 d0 40 00    	call   *0x40d044  ; 0x40d044=KERNEL32.dll!SetCurrentDirectoryA
  403cef:	85 c0                	test   %eax,%eax
  403cf1:	0f 85 86 01 00 00    	jne    0x403e7d
  403cf7:	55                   	push   %ebp
  403cf8:	56                   	push   %esi
  403cf9:	57                   	push   %edi
  403cfa:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  403cfe:	33 ed                	xor    %ebp,%ebp
  403d00:	e8 6b 0a 00 00       	call   0x404770
  403d05:	68 b0 15 40 00       	push   $0x4015b0
  403d0a:	68 70 47 40 00       	push   $0x404770
  403d0f:	6a 28                	push   $0x28
  403d11:	6a 0c                	push   $0xc
  403d13:	8d 84 24 3c 01 00 00 	lea    0x13c(%esp),%eax
  403d1a:	50                   	push   %eax
  403d1b:	89 9c 24 28 03 00 00 	mov    %ebx,0x328(%esp)
  403d22:	e8 6a 22 00 00       	call   0x405f91
  403d27:	8d 4c 24 28          	lea    0x28(%esp),%ecx
  403d2b:	51                   	push   %ecx
  403d2c:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  403d30:	c6 84 24 18 03 00 00 	movb   $0x1,0x318(%esp)
  403d37:	01 
  403d38:	e8 93 10 00 00       	call   0x404dd0
  403d3d:	83 7c 24 14 01       	cmpl   $0x1,0x14(%esp)
  403d42:	7c 74                	jl     0x403db8
  403d44:	8d bc 24 2c 01 00 00 	lea    0x12c(%esp),%edi
  403d4b:	eb 03                	jmp    0x403d50
  403d4d:	8d 49 00             	lea    0x0(%ecx),%ecx
  403d50:	53                   	push   %ebx
  403d51:	6a 5c                	push   $0x5c
  403d53:	8d 4c 24 18          	lea    0x18(%esp),%ecx
  403d57:	e8 c4 0a 00 00       	call   0x404820
  403d5c:	8b f0                	mov    %eax,%esi
  403d5e:	3b f3                	cmp    %ebx,%esi
  403d60:	8b cf                	mov    %edi,%ecx
  403d62:	7e 20                	jle    0x403d84
  403d64:	8d 54 24 10          	lea    0x10(%esp),%edx
  403d68:	52                   	push   %edx
  403d69:	e8 12 10 00 00       	call   0x404d80
  403d6e:	56                   	push   %esi
  403d6f:	8b cf                	mov    %edi,%ecx
  403d71:	e8 ea 0d 00 00       	call   0x404b60
  403d76:	46                   	inc    %esi
  403d77:	56                   	push   %esi
  403d78:	53                   	push   %ebx
  403d79:	8d 4c 24 18          	lea    0x18(%esp),%ecx
  403d7d:	e8 ae 0c 00 00       	call   0x404a30
  403d82:	eb 27                	jmp    0x403dab
  403d84:	8d 44 24 10          	lea    0x10(%esp),%eax
  403d88:	50                   	push   %eax
  403d89:	e8 f2 0f 00 00       	call   0x404d80
  403d8e:	8b 44 24 10          	mov    0x10(%esp),%eax
  403d92:	3b c3                	cmp    %ebx,%eax
  403d94:	74 09                	je     0x403d9f
  403d96:	50                   	push   %eax
  403d97:	e8 c4 1a 00 00       	call   0x405860
  403d9c:	83 c4 04             	add    $0x4,%esp
  403d9f:	89 5c 24 10          	mov    %ebx,0x10(%esp)
  403da3:	89 5c 24 14          	mov    %ebx,0x14(%esp)
  403da7:	89 5c 24 18          	mov    %ebx,0x18(%esp)
  403dab:	8b 44 24 14          	mov    0x14(%esp),%eax
  403daf:	45                   	inc    %ebp
  403db0:	83 c7 0c             	add    $0xc,%edi
  403db3:	83 f8 01             	cmp    $0x1,%eax
  403db6:	7d 98                	jge    0x403d50
  403db8:	8d 8c 24 2c 01 00 00 	lea    0x12c(%esp),%ecx
  403dbf:	51                   	push   %ecx
  403dc0:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  403dc4:	e8 b7 0f 00 00       	call   0x404d80
  403dc9:	83 fd 01             	cmp    $0x1,%ebp
  403dcc:	7e 7b                	jle    0x403e49
  403dce:	8d 7d ff             	lea    -0x1(%ebp),%edi
  403dd1:	8b 2d 40 d0 40 00    	mov    0x40d040,%ebp  ; 0x40d040=KERNEL32.dll!CreateDirectoryA
  403dd7:	8d b4 24 38 01 00 00 	lea    0x138(%esp),%esi
  403dde:	8b ff                	mov    %edi,%edi
  403de0:	68 20 d4 40 00       	push   $0x40d420
  403de5:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  403de9:	e8 02 0c 00 00       	call   0x4049f0
  403dee:	56                   	push   %esi
  403def:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  403df3:	e8 d8 0b 00 00       	call   0x4049d0
  403df8:	83 7c 24 14 01       	cmpl   $0x1,0x14(%esp)
  403dfd:	7c 08                	jl     0x403e07
  403dff:	8b 44 24 10          	mov    0x10(%esp),%eax
  403e03:	3b c3                	cmp    %ebx,%eax
  403e05:	75 05                	jne    0x403e0c
  403e07:	a1 40 04 41 00       	mov    0x410440,%eax
  403e0c:	50                   	push   %eax
  403e0d:	ff 15 44 d0 40 00    	call   *0x40d044  ; 0x40d044=KERNEL32.dll!SetCurrentDirectoryA
  403e13:	85 c0                	test   %eax,%eax
  403e15:	75 2c                	jne    0x403e43
  403e17:	83 7c 24 14 01       	cmpl   $0x1,0x14(%esp)
  403e1c:	c7 44 24 1c 0c 00 00 	movl   $0xc,0x1c(%esp)
  403e23:	00 
  403e24:	89 5c 24 20          	mov    %ebx,0x20(%esp)
  403e28:	89 5c 24 24          	mov    %ebx,0x24(%esp)
  403e2c:	7c 08                	jl     0x403e36
  403e2e:	8b 44 24 10          	mov    0x10(%esp),%eax
  403e32:	3b c3                	cmp    %ebx,%eax
  403e34:	75 05                	jne    0x403e3b
  403e36:	a1 40 04 41 00       	mov    0x410440,%eax
  403e3b:	8d 54 24 1c          	lea    0x1c(%esp),%edx
  403e3f:	52                   	push   %edx
  403e40:	50                   	push   %eax
  403e41:	ff d5                	call   *%ebp
  403e43:	83 c6 0c             	add    $0xc,%esi
  403e46:	4f                   	dec    %edi
  403e47:	75 97                	jne    0x403de0
  403e49:	68 b0 15 40 00       	push   $0x4015b0
  403e4e:	6a 28                	push   $0x28
  403e50:	6a 0c                	push   $0xc
  403e52:	8d 84 24 38 01 00 00 	lea    0x138(%esp),%eax
  403e59:	50                   	push   %eax
  403e5a:	88 9c 24 24 03 00 00 	mov    %bl,0x324(%esp)
  403e61:	e8 cb 20 00 00       	call   0x405f31
  403e66:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  403e6a:	c7 84 24 14 03 00 00 	movl   $0xffffffff,0x314(%esp)
  403e71:	ff ff ff ff 
  403e75:	e8 36 d7 ff ff       	call   0x4015b0
  403e7a:	5f                   	pop    %edi
  403e7b:	5e                   	pop    %esi
  403e7c:	5d                   	pop    %ebp
  403e7d:	8b 8c 24 00 03 00 00 	mov    0x300(%esp),%ecx
  403e84:	5b                   	pop    %ebx
  403e85:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  403e8c:	81 c4 08 03 00 00    	add    $0x308,%esp
  403e92:	c3                   	ret
  403e93:	cc                   	int3
  403e94:	cc                   	int3
  403e95:	cc                   	int3
  403e96:	cc                   	int3
  403e97:	cc                   	int3
  403e98:	cc                   	int3
  403e99:	cc                   	int3
  403e9a:	cc                   	int3
  403e9b:	cc                   	int3
  403e9c:	cc                   	int3
  403e9d:	cc                   	int3
  403e9e:	cc                   	int3
  403e9f:	cc                   	int3
  403ea0:	56                   	push   %esi
  403ea1:	8b f1                	mov    %ecx,%esi
  403ea3:	8b 46 10             	mov    0x10(%esi),%eax
  403ea6:	85 c0                	test   %eax,%eax
  403ea8:	74 0c                	je     0x403eb6
  403eaa:	83 3e 00             	cmpl   $0x0,(%esi)
  403ead:	74 07                	je     0x403eb6
  403eaf:	50                   	push   %eax
  403eb0:	ff 15 48 d0 40 00    	call   *0x40d048  ; 0x40d048=KERNEL32.dll!CloseHandle
  403eb6:	c7 46 10 00 00 00 00 	movl   $0x0,0x10(%esi)
  403ebd:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  403ec3:	5e                   	pop    %esi
  403ec4:	c3                   	ret
  403ec5:	cc                   	int3
  403ec6:	cc                   	int3
  403ec7:	cc                   	int3
  403ec8:	cc                   	int3
  403ec9:	cc                   	int3
  403eca:	cc                   	int3
  403ecb:	cc                   	int3
  403ecc:	cc                   	int3
  403ecd:	cc                   	int3
  403ece:	cc                   	int3
  403ecf:	cc                   	int3
  403ed0:	8b 41 10             	mov    0x10(%ecx),%eax
  403ed3:	85 c0                	test   %eax,%eax
  403ed5:	74 30                	je     0x403f07
  403ed7:	83 39 00             	cmpl   $0x0,(%ecx)
  403eda:	74 2b                	je     0x403f07
  403edc:	8b 54 24 04          	mov    0x4(%esp),%edx
  403ee0:	56                   	push   %esi
  403ee1:	8b 74 24 0c          	mov    0xc(%esp),%esi
  403ee5:	6a 00                	push   $0x0
  403ee7:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  403eeb:	51                   	push   %ecx
  403eec:	56                   	push   %esi
  403eed:	52                   	push   %edx
  403eee:	50                   	push   %eax
  403eef:	ff 15 4c d0 40 00    	call   *0x40d04c  ; 0x40d04c=KERNEL32.dll!ReadFile
  403ef5:	85 c0                	test   %eax,%eax
  403ef7:	8b 44 24 0c          	mov    0xc(%esp),%eax
  403efb:	75 06                	jne    0x403f03
  403efd:	3b c6                	cmp    %esi,%eax
  403eff:	74 02                	je     0x403f03
  403f01:	33 c0                	xor    %eax,%eax
  403f03:	5e                   	pop    %esi
  403f04:	c2 08 00             	ret    $0x8
  403f07:	33 c0                	xor    %eax,%eax
  403f09:	c2 08 00             	ret    $0x8
  403f0c:	cc                   	int3
  403f0d:	cc                   	int3
  403f0e:	cc                   	int3
  403f0f:	cc                   	int3
  403f10:	83 ec 3c             	sub    $0x3c,%esp
  403f13:	8d 04 24             	lea    (%esp),%eax
  403f16:	50                   	push   %eax
  403f17:	51                   	push   %ecx
  403f18:	ff 15 60 d0 40 00    	call   *0x40d060  ; 0x40d060=KERNEL32.dll!FileTimeToLocalFileTime
  403f1e:	85 c0                	test   %eax,%eax
  403f20:	74 14                	je     0x403f36
  403f22:	8d 54 24 08          	lea    0x8(%esp),%edx
  403f26:	52                   	push   %edx
  403f27:	8d 44 24 04          	lea    0x4(%esp),%eax
  403f2b:	50                   	push   %eax
  403f2c:	ff 15 5c d0 40 00    	call   *0x40d05c  ; 0x40d05c=KERNEL32.dll!FileTimeToSystemTime
  403f32:	85 c0                	test   %eax,%eax
  403f34:	75 06                	jne    0x403f3c
  403f36:	33 c0                	xor    %eax,%eax
  403f38:	83 c4 3c             	add    $0x3c,%esp
  403f3b:	c3                   	ret
  403f3c:	0f b7 54 24 14       	movzwl 0x14(%esp),%edx
  403f41:	0f b7 44 24 12       	movzwl 0x12(%esp),%eax
  403f46:	33 c9                	xor    %ecx,%ecx
  403f48:	89 4c 24 18          	mov    %ecx,0x18(%esp)
  403f4c:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
  403f50:	89 4c 24 20          	mov    %ecx,0x20(%esp)
  403f54:	89 4c 24 24          	mov    %ecx,0x24(%esp)
  403f58:	89 4c 24 28          	mov    %ecx,0x28(%esp)
  403f5c:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
  403f60:	89 4c 24 30          	mov    %ecx,0x30(%esp)
  403f64:	89 4c 24 34          	mov    %ecx,0x34(%esp)
  403f68:	89 4c 24 38          	mov    %ecx,0x38(%esp)
  403f6c:	0f b7 4c 24 10       	movzwl 0x10(%esp),%ecx
  403f71:	89 54 24 18          	mov    %edx,0x18(%esp)
  403f75:	0f b7 54 24 0e       	movzwl 0xe(%esp),%edx
  403f7a:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  403f7e:	0f b7 44 24 0a       	movzwl 0xa(%esp),%eax
  403f83:	89 4c 24 20          	mov    %ecx,0x20(%esp)
  403f87:	0f b7 4c 24 08       	movzwl 0x8(%esp),%ecx
  403f8c:	89 54 24 24          	mov    %edx,0x24(%esp)
  403f90:	8d 54 24 18          	lea    0x18(%esp),%edx
  403f94:	48                   	dec    %eax
  403f95:	81 e9 6c 07 00 00    	sub    $0x76c,%ecx
  403f9b:	52                   	push   %edx
  403f9c:	89 44 24 2c          	mov    %eax,0x2c(%esp)
  403fa0:	89 4c 24 30          	mov    %ecx,0x30(%esp)
  403fa4:	c7 44 24 3c ff ff ff 	movl   $0xffffffff,0x3c(%esp)
  403fab:	ff 
  403fac:	e8 02 22 00 00       	call   0x4061b3
  403fb1:	83 c4 04             	add    $0x4,%esp
  403fb4:	83 c4 3c             	add    $0x3c,%esp
  403fb7:	c3                   	ret
  403fb8:	cc                   	int3
  403fb9:	cc                   	int3
  403fba:	cc                   	int3
  403fbb:	cc                   	int3
  403fbc:	cc                   	int3
  403fbd:	cc                   	int3
  403fbe:	cc                   	int3
  403fbf:	cc                   	int3
  403fc0:	8d 44 24 04          	lea    0x4(%esp),%eax
  403fc4:	83 ec 18             	sub    $0x18,%esp
  403fc7:	50                   	push   %eax
  403fc8:	e8 f3 21 00 00       	call   0x4061c0
  403fcd:	83 c4 04             	add    $0x4,%esp
  403fd0:	85 c0                	test   %eax,%eax
  403fd2:	75 06                	jne    0x403fda
  403fd4:	33 c0                	xor    %eax,%eax
  403fd6:	83 c4 18             	add    $0x18,%esp
  403fd9:	c3                   	ret
  403fda:	66 8b 48 14          	mov    0x14(%eax),%cx
  403fde:	66 81 c1 6c 07       	add    $0x76c,%cx
  403fe3:	66 89 4c 24 08       	mov    %cx,0x8(%esp)
  403fe8:	66 8b 50 10          	mov    0x10(%eax),%dx
  403fec:	66 42                	inc    %dx
  403fee:	66 89 54 24 0a       	mov    %dx,0xa(%esp)
  403ff3:	66 8b 48 0c          	mov    0xc(%eax),%cx
  403ff7:	66 89 4c 24 0e       	mov    %cx,0xe(%esp)
  403ffc:	66 8b 50 08          	mov    0x8(%eax),%dx
  404000:	66 89 54 24 10       	mov    %dx,0x10(%esp)
  404005:	66 8b 48 04          	mov    0x4(%eax),%cx
  404009:	66 89 4c 24 12       	mov    %cx,0x12(%esp)
  40400e:	66 8b 10             	mov    (%eax),%dx
  404011:	8d 04 24             	lea    (%esp),%eax
  404014:	50                   	push   %eax
  404015:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
  404019:	51                   	push   %ecx
  40401a:	66 89 54 24 1c       	mov    %dx,0x1c(%esp)
  40401f:	66 c7 44 24 1e 00 00 	movw   $0x0,0x1e(%esp)
  404026:	ff 15 68 d0 40 00    	call   *0x40d068  ; 0x40d068=KERNEL32.dll!SystemTimeToFileTime
  40402c:	85 c0                	test   %eax,%eax
  40402e:	74 a4                	je     0x403fd4
  404030:	8b 54 24 20          	mov    0x20(%esp),%edx
  404034:	52                   	push   %edx
  404035:	8d 44 24 04          	lea    0x4(%esp),%eax
  404039:	50                   	push   %eax
  40403a:	ff 15 64 d0 40 00    	call   *0x40d064  ; 0x40d064=KERNEL32.dll!LocalFileTimeToFileTime
  404040:	f7 d8                	neg    %eax
  404042:	1b c0                	sbb    %eax,%eax
  404044:	f7 d8                	neg    %eax
  404046:	83 c4 18             	add    $0x18,%esp
  404049:	c3                   	ret
  40404a:	cc                   	int3
  40404b:	cc                   	int3
  40404c:	cc                   	int3
  40404d:	cc                   	int3
  40404e:	cc                   	int3
  40404f:	cc                   	int3
  404050:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  404054:	83 ec 08             	sub    $0x8,%esp
  404057:	8d 04 24             	lea    (%esp),%eax
  40405a:	50                   	push   %eax
  40405b:	51                   	push   %ecx
  40405c:	e8 5f ff ff ff       	call   0x403fc0
  404061:	83 c4 08             	add    $0x8,%esp
  404064:	85 c0                	test   %eax,%eax
  404066:	75 04                	jne    0x40406c
  404068:	83 c4 08             	add    $0x8,%esp
  40406b:	c3                   	ret
  40406c:	8b 54 24 0c          	mov    0xc(%esp),%edx
  404070:	56                   	push   %esi
  404071:	6a 00                	push   $0x0
  404073:	68 80 00 00 00       	push   $0x80
  404078:	6a 03                	push   $0x3
  40407a:	6a 00                	push   $0x0
  40407c:	6a 01                	push   $0x1
  40407e:	68 00 00 00 c0       	push   $0xc0000000
  404083:	52                   	push   %edx
  404084:	ff 15 70 d0 40 00    	call   *0x40d070  ; 0x40d070=KERNEL32.dll!CreateFileA
  40408a:	8b f0                	mov    %eax,%esi
  40408c:	83 fe ff             	cmp    $0xffffffff,%esi
  40408f:	75 07                	jne    0x404098
  404091:	33 c0                	xor    %eax,%eax
  404093:	5e                   	pop    %esi
  404094:	83 c4 08             	add    $0x8,%esp
  404097:	c3                   	ret
  404098:	8d 44 24 04          	lea    0x4(%esp),%eax
  40409c:	50                   	push   %eax
  40409d:	8b c8                	mov    %eax,%ecx
  40409f:	51                   	push   %ecx
  4040a0:	8b d0                	mov    %eax,%edx
  4040a2:	52                   	push   %edx
  4040a3:	56                   	push   %esi
  4040a4:	ff 15 6c d0 40 00    	call   *0x40d06c  ; 0x40d06c=KERNEL32.dll!SetFileTime
  4040aa:	85 c0                	test   %eax,%eax
  4040ac:	74 e3                	je     0x404091
  4040ae:	56                   	push   %esi
  4040af:	ff 15 48 d0 40 00    	call   *0x40d048  ; 0x40d048=KERNEL32.dll!CloseHandle
  4040b5:	f7 d8                	neg    %eax
  4040b7:	1b c0                	sbb    %eax,%eax
  4040b9:	f7 d8                	neg    %eax
  4040bb:	5e                   	pop    %esi
  4040bc:	83 c4 08             	add    $0x8,%esp
  4040bf:	c3                   	ret
  4040c0:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  4040c4:	81 ec 40 01 00 00    	sub    $0x140,%esp
  4040ca:	8d 04 24             	lea    (%esp),%eax
  4040cd:	50                   	push   %eax
  4040ce:	51                   	push   %ecx
  4040cf:	ff 15 78 d0 40 00    	call   *0x40d078  ; 0x40d078=KERNEL32.dll!FindFirstFileA
  4040d5:	83 f8 ff             	cmp    $0xffffffff,%eax
  4040d8:	75 09                	jne    0x4040e3
  4040da:	33 c0                	xor    %eax,%eax
  4040dc:	81 c4 40 01 00 00    	add    $0x140,%esp
  4040e2:	c3                   	ret
  4040e3:	56                   	push   %esi
  4040e4:	50                   	push   %eax
  4040e5:	ff 15 74 d0 40 00    	call   *0x40d074  ; 0x40d074=KERNEL32.dll!FindClose
  4040eb:	8b 84 24 50 01 00 00 	mov    0x150(%esp),%eax
  4040f2:	85 c0                	test   %eax,%eax
  4040f4:	7e 16                	jle    0x40410c
  4040f6:	8b 54 24 24          	mov    0x24(%esp),%edx
  4040fa:	2b 54 24 20          	sub    0x20(%esp),%edx
  4040fe:	3b c2                	cmp    %edx,%eax
  404100:	74 0a                	je     0x40410c
  404102:	33 c0                	xor    %eax,%eax
  404104:	5e                   	pop    %esi
  404105:	81 c4 40 01 00 00    	add    $0x140,%esp
  40410b:	c3                   	ret
  40410c:	8b b4 24 4c 01 00 00 	mov    0x14c(%esp),%esi
  404113:	85 f6                	test   %esi,%esi
  404115:	74 1a                	je     0x404131
  404117:	8d 4c 24 18          	lea    0x18(%esp),%ecx
  40411b:	e8 f0 fd ff ff       	call   0x403f10
  404120:	3b c6                	cmp    %esi,%eax
  404122:	76 04                	jbe    0x404128
  404124:	2b c6                	sub    %esi,%eax
  404126:	eb 04                	jmp    0x40412c
  404128:	2b f0                	sub    %eax,%esi
  40412a:	8b c6                	mov    %esi,%eax
  40412c:	83 f8 3c             	cmp    $0x3c,%eax
  40412f:	77 d1                	ja     0x404102
  404131:	b8 01 00 00 00       	mov    $0x1,%eax
  404136:	5e                   	pop    %esi
  404137:	81 c4 40 01 00 00    	add    $0x140,%esp
  40413d:	c3                   	ret
  40413e:	cc                   	int3
  40413f:	cc                   	int3
  404140:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  404144:	81 ec 48 01 00 00    	sub    $0x148,%esp
  40414a:	8d 44 24 08          	lea    0x8(%esp),%eax
  40414e:	50                   	push   %eax
  40414f:	51                   	push   %ecx
  404150:	ff 15 78 d0 40 00    	call   *0x40d078  ; 0x40d078=KERNEL32.dll!FindFirstFileA
  404156:	83 f8 ff             	cmp    $0xffffffff,%eax
  404159:	75 09                	jne    0x404164
  40415b:	33 c0                	xor    %eax,%eax
  40415d:	81 c4 48 01 00 00    	add    $0x148,%esp
  404163:	c3                   	ret
  404164:	56                   	push   %esi
  404165:	50                   	push   %eax
  404166:	ff 15 74 d0 40 00    	call   *0x40d074  ; 0x40d074=KERNEL32.dll!FindClose
  40416c:	8b 84 24 58 01 00 00 	mov    0x158(%esp),%eax
  404173:	85 c0                	test   %eax,%eax
  404175:	7e 16                	jle    0x40418d
  404177:	8b 54 24 2c          	mov    0x2c(%esp),%edx
  40417b:	2b 54 24 28          	sub    0x28(%esp),%edx
  40417f:	3b c2                	cmp    %edx,%eax
  404181:	74 0a                	je     0x40418d
  404183:	33 c0                	xor    %eax,%eax
  404185:	5e                   	pop    %esi
  404186:	81 c4 48 01 00 00    	add    $0x148,%esp
  40418c:	c3                   	ret
  40418d:	8b 84 24 5c 01 00 00 	mov    0x15c(%esp),%eax
  404194:	85 c0                	test   %eax,%eax
  404196:	75 0d                	jne    0x4041a5
  404198:	8d 44 24 04          	lea    0x4(%esp),%eax
  40419c:	50                   	push   %eax
  40419d:	ff 15 80 d0 40 00    	call   *0x40d080  ; 0x40d080=KERNEL32.dll!GetSystemTimeAsFileTime
  4041a3:	eb 0d                	jmp    0x4041b2
  4041a5:	8b 08                	mov    (%eax),%ecx
  4041a7:	8b 50 04             	mov    0x4(%eax),%edx
  4041aa:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  4041ae:	89 54 24 08          	mov    %edx,0x8(%esp)
  4041b2:	8b 35 7c d0 40 00    	mov    0x40d07c,%esi  ; 0x40d07c=KERNEL32.dll!CompareFileTime
  4041b8:	8d 44 24 04          	lea    0x4(%esp),%eax
  4041bc:	50                   	push   %eax
  4041bd:	8d 4c 24 24          	lea    0x24(%esp),%ecx
  4041c1:	51                   	push   %ecx
  4041c2:	ff d6                	call   *%esi
  4041c4:	85 c0                	test   %eax,%eax
  4041c6:	7f bb                	jg     0x404183
  4041c8:	8b 84 24 54 01 00 00 	mov    0x154(%esp),%eax
  4041cf:	6a ff                	push   $0xffffffff
  4041d1:	99                   	cltd
  4041d2:	68 80 69 67 ff       	push   $0xff676980
  4041d7:	52                   	push   %edx
  4041d8:	50                   	push   %eax
  4041d9:	e8 62 21 00 00       	call   0x406340
  4041de:	01 44 24 04          	add    %eax,0x4(%esp)
  4041e2:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  4041e6:	13 ca                	adc    %edx,%ecx
  4041e8:	8d 54 24 04          	lea    0x4(%esp),%edx
  4041ec:	52                   	push   %edx
  4041ed:	8d 44 24 24          	lea    0x24(%esp),%eax
  4041f1:	50                   	push   %eax
  4041f2:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  4041f6:	ff d6                	call   *%esi
  4041f8:	33 c9                	xor    %ecx,%ecx
  4041fa:	85 c0                	test   %eax,%eax
  4041fc:	0f 9d c1             	setge  %cl
  4041ff:	5e                   	pop    %esi
  404200:	8b c1                	mov    %ecx,%eax
  404202:	81 c4 48 01 00 00    	add    $0x148,%esp
  404208:	c3                   	ret
  404209:	cc                   	int3
  40420a:	cc                   	int3
  40420b:	cc                   	int3
  40420c:	cc                   	int3
  40420d:	cc                   	int3
  40420e:	cc                   	int3
  40420f:	cc                   	int3
  404210:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  404214:	81 ec 40 01 00 00    	sub    $0x140,%esp
  40421a:	8d 04 24             	lea    (%esp),%eax
  40421d:	50                   	push   %eax
  40421e:	51                   	push   %ecx
  40421f:	ff 15 78 d0 40 00    	call   *0x40d078  ; 0x40d078=KERNEL32.dll!FindFirstFileA
  404225:	83 f8 ff             	cmp    $0xffffffff,%eax
  404228:	75 09                	jne    0x404233
  40422a:	33 c0                	xor    %eax,%eax
  40422c:	81 c4 40 01 00 00    	add    $0x140,%esp
  404232:	c3                   	ret
  404233:	50                   	push   %eax
  404234:	ff 15 74 d0 40 00    	call   *0x40d074  ; 0x40d074=KERNEL32.dll!FindClose
  40423a:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  40423e:	e8 cd fc ff ff       	call   0x403f10
  404243:	81 c4 40 01 00 00    	add    $0x140,%esp
  404249:	c3                   	ret
  40424a:	cc                   	int3
  40424b:	cc                   	int3
  40424c:	cc                   	int3
  40424d:	cc                   	int3
  40424e:	cc                   	int3
  40424f:	cc                   	int3
  404250:	8b c1                	mov    %ecx,%eax
  404252:	33 c9                	xor    %ecx,%ecx
  404254:	89 08                	mov    %ecx,(%eax)
  404256:	89 48 08             	mov    %ecx,0x8(%eax)
  404259:	89 48 0c             	mov    %ecx,0xc(%eax)
  40425c:	89 48 04             	mov    %ecx,0x4(%eax)
  40425f:	c7 40 10 80 00 00 00 	movl   $0x80,0x10(%eax)
  404266:	c3                   	ret
  404267:	cc                   	int3
  404268:	cc                   	int3
  404269:	cc                   	int3
  40426a:	cc                   	int3
  40426b:	cc                   	int3
  40426c:	cc                   	int3
  40426d:	cc                   	int3
  40426e:	cc                   	int3
  40426f:	cc                   	int3
  404270:	8b 44 24 08          	mov    0x8(%esp),%eax
  404274:	56                   	push   %esi
  404275:	8b d1                	mov    %ecx,%edx
  404277:	8b 72 08             	mov    0x8(%edx),%esi
  40427a:	57                   	push   %edi
  40427b:	8b 7a 0c             	mov    0xc(%edx),%edi
  40427e:	8d 0c 07             	lea    (%edi,%eax,1),%ecx
  404281:	3b ce                	cmp    %esi,%ecx
  404283:	76 07                	jbe    0x40428c
  404285:	5f                   	pop    %edi
  404286:	33 c0                	xor    %eax,%eax
  404288:	5e                   	pop    %esi
  404289:	c2 08 00             	ret    $0x8
  40428c:	8b 32                	mov    (%edx),%esi
  40428e:	53                   	push   %ebx
  40428f:	03 f7                	add    %edi,%esi
  404291:	8b 7c 24 10          	mov    0x10(%esp),%edi
  404295:	8b c8                	mov    %eax,%ecx
  404297:	8b d9                	mov    %ecx,%ebx
  404299:	c1 e9 02             	shr    $0x2,%ecx
  40429c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  40429e:	8b cb                	mov    %ebx,%ecx
  4042a0:	83 e1 03             	and    $0x3,%ecx
  4042a3:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  4042a5:	8b 4a 0c             	mov    0xc(%edx),%ecx
  4042a8:	5b                   	pop    %ebx
  4042a9:	03 c8                	add    %eax,%ecx
  4042ab:	5f                   	pop    %edi
  4042ac:	89 4a 0c             	mov    %ecx,0xc(%edx)
  4042af:	5e                   	pop    %esi
  4042b0:	c2 08 00             	ret    $0x8
  4042b3:	cc                   	int3
  4042b4:	cc                   	int3
  4042b5:	cc                   	int3
  4042b6:	cc                   	int3
  4042b7:	cc                   	int3
  4042b8:	cc                   	int3
  4042b9:	cc                   	int3
  4042ba:	cc                   	int3
  4042bb:	cc                   	int3
  4042bc:	cc                   	int3
  4042bd:	cc                   	int3
  4042be:	cc                   	int3
  4042bf:	cc                   	int3
  4042c0:	53                   	push   %ebx
  4042c1:	56                   	push   %esi
  4042c2:	8b f1                	mov    %ecx,%esi
  4042c4:	8b 06                	mov    (%esi),%eax
  4042c6:	85 c0                	test   %eax,%eax
  4042c8:	57                   	push   %edi
  4042c9:	74 10                	je     0x4042db
  4042cb:	8b 4e 04             	mov    0x4(%esi),%ecx
  4042ce:	85 c9                	test   %ecx,%ecx
  4042d0:	76 09                	jbe    0x4042db
  4042d2:	50                   	push   %eax
  4042d3:	e8 88 15 00 00       	call   0x405860
  4042d8:	83 c4 04             	add    $0x4,%esp
  4042db:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  4042df:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  4042e5:	c7 46 08 00 00 00 00 	movl   $0x0,0x8(%esi)
  4042ec:	c7 46 0c 00 00 00 00 	movl   $0x0,0xc(%esi)
  4042f3:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
  4042fa:	8b 43 10             	mov    0x10(%ebx),%eax
  4042fd:	85 c0                	test   %eax,%eax
  4042ff:	0f 84 82 00 00 00    	je     0x404387
  404305:	83 3b 00             	cmpl   $0x0,(%ebx)
  404308:	74 7d                	je     0x404387
  40430a:	6a 00                	push   $0x0
  40430c:	50                   	push   %eax
  40430d:	ff 15 58 d0 40 00    	call   *0x40d058  ; 0x40d058=KERNEL32.dll!GetFileSize
  404313:	8b f8                	mov    %eax,%edi
  404315:	83 ff 01             	cmp    $0x1,%edi
  404318:	72 6d                	jb     0x404387
  40431a:	8b 46 10             	mov    0x10(%esi),%eax
  40431d:	03 c7                	add    %edi,%eax
  40431f:	50                   	push   %eax
  404320:	89 46 04             	mov    %eax,0x4(%esi)
  404323:	e8 25 1a 00 00       	call   0x405d4d
  404328:	89 06                	mov    %eax,(%esi)
  40432a:	8b 43 10             	mov    0x10(%ebx),%eax
  40432d:	83 c4 04             	add    $0x4,%esp
  404330:	85 c0                	test   %eax,%eax
  404332:	74 12                	je     0x404346
  404334:	83 3b 00             	cmpl   $0x0,(%ebx)
  404337:	74 0d                	je     0x404346
  404339:	6a 00                	push   $0x0
  40433b:	6a 00                	push   $0x0
  40433d:	6a 00                	push   $0x0
  40433f:	50                   	push   %eax
  404340:	ff 15 54 d0 40 00    	call   *0x40d054  ; 0x40d054=KERNEL32.dll!SetFilePointer
  404346:	8b 43 10             	mov    0x10(%ebx),%eax
  404349:	85 c0                	test   %eax,%eax
  40434b:	8b 0e                	mov    (%esi),%ecx
  40434d:	74 21                	je     0x404370
  40434f:	83 3b 00             	cmpl   $0x0,(%ebx)
  404352:	74 1c                	je     0x404370
  404354:	6a 00                	push   $0x0
  404356:	8d 54 24 14          	lea    0x14(%esp),%edx
  40435a:	52                   	push   %edx
  40435b:	57                   	push   %edi
  40435c:	51                   	push   %ecx
  40435d:	50                   	push   %eax
  40435e:	ff 15 4c d0 40 00    	call   *0x40d04c  ; 0x40d04c=KERNEL32.dll!ReadFile
  404364:	85 c0                	test   %eax,%eax
  404366:	8b 44 24 10          	mov    0x10(%esp),%eax
  40436a:	75 06                	jne    0x404372
  40436c:	3b c7                	cmp    %edi,%eax
  40436e:	74 1f                	je     0x40438f
  404370:	33 c0                	xor    %eax,%eax
  404372:	3b c7                	cmp    %edi,%eax
  404374:	74 19                	je     0x40438f
  404376:	8b 06                	mov    (%esi),%eax
  404378:	50                   	push   %eax
  404379:	e8 e2 14 00 00       	call   0x405860
  40437e:	83 c4 04             	add    $0x4,%esp
  404381:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  404387:	5f                   	pop    %edi
  404388:	5e                   	pop    %esi
  404389:	33 c0                	xor    %eax,%eax
  40438b:	5b                   	pop    %ebx
  40438c:	c2 04 00             	ret    $0x4
  40438f:	89 7e 08             	mov    %edi,0x8(%esi)
  404392:	89 7e 0c             	mov    %edi,0xc(%esi)
  404395:	5f                   	pop    %edi
  404396:	5e                   	pop    %esi
  404397:	b8 01 00 00 00       	mov    $0x1,%eax
  40439c:	5b                   	pop    %ebx
  40439d:	c2 04 00             	ret    $0x4
  4043a0:	53                   	push   %ebx
  4043a1:	55                   	push   %ebp
  4043a2:	8b 6c 24 10          	mov    0x10(%esp),%ebp
  4043a6:	8b d9                	mov    %ecx,%ebx
  4043a8:	8b 13                	mov    (%ebx),%edx
  4043aa:	85 d2                	test   %edx,%edx
  4043ac:	56                   	push   %esi
  4043ad:	57                   	push   %edi
  4043ae:	75 38                	jne    0x4043e8
  4043b0:	8b 43 10             	mov    0x10(%ebx),%eax
  4043b3:	03 c5                	add    %ebp,%eax
  4043b5:	50                   	push   %eax
  4043b6:	89 43 04             	mov    %eax,0x4(%ebx)
  4043b9:	e8 8f 19 00 00       	call   0x405d4d
  4043be:	8b 74 24 18          	mov    0x18(%esp),%esi
  4043c2:	8b cd                	mov    %ebp,%ecx
  4043c4:	8b d1                	mov    %ecx,%edx
  4043c6:	c1 e9 02             	shr    $0x2,%ecx
  4043c9:	89 03                	mov    %eax,(%ebx)
  4043cb:	8b f8                	mov    %eax,%edi
  4043cd:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  4043cf:	83 c4 04             	add    $0x4,%esp
  4043d2:	8b ca                	mov    %edx,%ecx
  4043d4:	83 e1 03             	and    $0x3,%ecx
  4043d7:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  4043d9:	5f                   	pop    %edi
  4043da:	5e                   	pop    %esi
  4043db:	89 6b 08             	mov    %ebp,0x8(%ebx)
  4043de:	89 6b 0c             	mov    %ebp,0xc(%ebx)
  4043e1:	8b c5                	mov    %ebp,%eax
  4043e3:	5d                   	pop    %ebp
  4043e4:	5b                   	pop    %ebx
  4043e5:	c2 08 00             	ret    $0x8
  4043e8:	8b 43 0c             	mov    0xc(%ebx),%eax
  4043eb:	8b 73 04             	mov    0x4(%ebx),%esi
  4043ee:	8d 0c 28             	lea    (%eax,%ebp,1),%ecx
  4043f1:	3b ce                	cmp    %esi,%ecx
  4043f3:	72 6d                	jb     0x404462
  4043f5:	8b 43 08             	mov    0x8(%ebx),%eax
  4043f8:	8b 53 10             	mov    0x10(%ebx),%edx
  4043fb:	03 d0                	add    %eax,%edx
  4043fd:	8d 04 2a             	lea    (%edx,%ebp,1),%eax
  404400:	50                   	push   %eax
  404401:	89 43 04             	mov    %eax,0x4(%ebx)
  404404:	e8 44 19 00 00       	call   0x405d4d
  404409:	8b 4b 08             	mov    0x8(%ebx),%ecx
  40440c:	8b 33                	mov    (%ebx),%esi
  40440e:	8b d1                	mov    %ecx,%edx
  404410:	c1 e9 02             	shr    $0x2,%ecx
  404413:	8b f8                	mov    %eax,%edi
  404415:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  404417:	8b ca                	mov    %edx,%ecx
  404419:	83 e1 03             	and    $0x3,%ecx
  40441c:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  40441e:	8b 7b 08             	mov    0x8(%ebx),%edi
  404421:	8b 74 24 18          	mov    0x18(%esp),%esi
  404425:	03 f8                	add    %eax,%edi
  404427:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  40442b:	8b cd                	mov    %ebp,%ecx
  40442d:	8b c1                	mov    %ecx,%eax
  40442f:	c1 e9 02             	shr    $0x2,%ecx
  404432:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  404434:	8b c8                	mov    %eax,%ecx
  404436:	83 e1 03             	and    $0x3,%ecx
  404439:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  40443b:	8b 73 0c             	mov    0xc(%ebx),%esi
  40443e:	8b 0b                	mov    (%ebx),%ecx
  404440:	03 f5                	add    %ebp,%esi
  404442:	8b c6                	mov    %esi,%eax
  404444:	51                   	push   %ecx
  404445:	89 73 0c             	mov    %esi,0xc(%ebx)
  404448:	89 43 08             	mov    %eax,0x8(%ebx)
  40444b:	e8 10 14 00 00       	call   0x405860
  404450:	8b 54 24 20          	mov    0x20(%esp),%edx
  404454:	83 c4 08             	add    $0x8,%esp
  404457:	5f                   	pop    %edi
  404458:	5e                   	pop    %esi
  404459:	8b c5                	mov    %ebp,%eax
  40445b:	5d                   	pop    %ebp
  40445c:	89 13                	mov    %edx,(%ebx)
  40445e:	5b                   	pop    %ebx
  40445f:	c2 08 00             	ret    $0x8
  404462:	8b 74 24 14          	mov    0x14(%esp),%esi
  404466:	8d 3c 10             	lea    (%eax,%edx,1),%edi
  404469:	8b cd                	mov    %ebp,%ecx
  40446b:	8b c1                	mov    %ecx,%eax
  40446d:	c1 e9 02             	shr    $0x2,%ecx
  404470:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  404472:	8b c8                	mov    %eax,%ecx
  404474:	83 e1 03             	and    $0x3,%ecx
  404477:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  404479:	8b 53 0c             	mov    0xc(%ebx),%edx
  40447c:	8b 4b 08             	mov    0x8(%ebx),%ecx
  40447f:	03 d5                	add    %ebp,%edx
  404481:	8b c2                	mov    %edx,%eax
  404483:	3b c1                	cmp    %ecx,%eax
  404485:	89 53 0c             	mov    %edx,0xc(%ebx)
  404488:	76 03                	jbe    0x40448d
  40448a:	89 43 08             	mov    %eax,0x8(%ebx)
  40448d:	5f                   	pop    %edi
  40448e:	5e                   	pop    %esi
  40448f:	8b c5                	mov    %ebp,%eax
  404491:	5d                   	pop    %ebp
  404492:	5b                   	pop    %ebx
  404493:	c2 08 00             	ret    $0x8
  404496:	cc                   	int3
  404497:	cc                   	int3
  404498:	cc                   	int3
  404499:	cc                   	int3
  40449a:	cc                   	int3
  40449b:	cc                   	int3
  40449c:	cc                   	int3
  40449d:	cc                   	int3
  40449e:	cc                   	int3
  40449f:	cc                   	int3
  4044a0:	56                   	push   %esi
  4044a1:	57                   	push   %edi
  4044a2:	8b f9                	mov    %ecx,%edi
  4044a4:	8b 77 08             	mov    0x8(%edi),%esi
  4044a7:	83 fe 01             	cmp    $0x1,%esi
  4044aa:	73 07                	jae    0x4044b3
  4044ac:	5f                   	pop    %edi
  4044ad:	33 c0                	xor    %eax,%eax
  4044af:	5e                   	pop    %esi
  4044b0:	c2 04 00             	ret    $0x4
  4044b3:	8b 54 24 0c          	mov    0xc(%esp),%edx
  4044b7:	8b 42 10             	mov    0x10(%edx),%eax
  4044ba:	85 c0                	test   %eax,%eax
  4044bc:	8b 0f                	mov    (%edi),%ecx
  4044be:	74 21                	je     0x4044e1
  4044c0:	83 3a 00             	cmpl   $0x0,(%edx)
  4044c3:	74 1c                	je     0x4044e1
  4044c5:	6a 00                	push   $0x0
  4044c7:	8d 54 24 10          	lea    0x10(%esp),%edx
  4044cb:	52                   	push   %edx
  4044cc:	56                   	push   %esi
  4044cd:	51                   	push   %ecx
  4044ce:	50                   	push   %eax
  4044cf:	ff 15 50 d0 40 00    	call   *0x40d050  ; 0x40d050=KERNEL32.dll!WriteFile
  4044d5:	85 c0                	test   %eax,%eax
  4044d7:	8b 44 24 0c          	mov    0xc(%esp),%eax
  4044db:	75 06                	jne    0x4044e3
  4044dd:	3b c6                	cmp    %esi,%eax
  4044df:	74 02                	je     0x4044e3
  4044e1:	33 c0                	xor    %eax,%eax
  4044e3:	8b 57 08             	mov    0x8(%edi),%edx
  4044e6:	33 c9                	xor    %ecx,%ecx
  4044e8:	3b c2                	cmp    %edx,%eax
  4044ea:	0f 94 c1             	sete   %cl
  4044ed:	5f                   	pop    %edi
  4044ee:	5e                   	pop    %esi
  4044ef:	8b c1                	mov    %ecx,%eax
  4044f1:	c2 04 00             	ret    $0x4
  4044f4:	cc                   	int3
  4044f5:	cc                   	int3
  4044f6:	cc                   	int3
  4044f7:	cc                   	int3
  4044f8:	cc                   	int3
  4044f9:	cc                   	int3
  4044fa:	cc                   	int3
  4044fb:	cc                   	int3
  4044fc:	cc                   	int3
  4044fd:	cc                   	int3
  4044fe:	cc                   	int3
  4044ff:	cc                   	int3
  404500:	8b 44 24 08          	mov    0x8(%esp),%eax
  404504:	83 e8 00             	sub    $0x0,%eax
  404507:	74 22                	je     0x40452b
  404509:	48                   	dec    %eax
  40450a:	74 10                	je     0x40451c
  40450c:	48                   	dec    %eax
  40450d:	75 23                	jne    0x404532
  40450f:	8b 41 08             	mov    0x8(%ecx),%eax
  404512:	03 44 24 04          	add    0x4(%esp),%eax
  404516:	89 41 0c             	mov    %eax,0xc(%ecx)
  404519:	c2 08 00             	ret    $0x8
  40451c:	8b 41 0c             	mov    0xc(%ecx),%eax
  40451f:	8b 54 24 04          	mov    0x4(%esp),%edx
  404523:	03 c2                	add    %edx,%eax
  404525:	89 41 0c             	mov    %eax,0xc(%ecx)
  404528:	c2 08 00             	ret    $0x8
  40452b:	8b 44 24 04          	mov    0x4(%esp),%eax
  40452f:	89 41 0c             	mov    %eax,0xc(%ecx)
  404532:	8b 41 0c             	mov    0xc(%ecx),%eax
  404535:	c2 08 00             	ret    $0x8
  404538:	cc                   	int3
  404539:	cc                   	int3
  40453a:	cc                   	int3
  40453b:	cc                   	int3
  40453c:	cc                   	int3
  40453d:	cc                   	int3
  40453e:	cc                   	int3
  40453f:	cc                   	int3
  404540:	57                   	push   %edi
  404541:	8b f9                	mov    %ecx,%edi
  404543:	8b 47 10             	mov    0x10(%edi),%eax
  404546:	85 c0                	test   %eax,%eax
  404548:	74 76                	je     0x4045c0
  40454a:	83 3f 00             	cmpl   $0x0,(%edi)
  40454d:	74 71                	je     0x4045c0
  40454f:	56                   	push   %esi
  404550:	6a 00                	push   $0x0
  404552:	6a 00                	push   $0x0
  404554:	6a 00                	push   $0x0
  404556:	50                   	push   %eax
  404557:	ff 15 54 d0 40 00    	call   *0x40d054  ; 0x40d054=KERNEL32.dll!SetFilePointer
  40455d:	8b 47 10             	mov    0x10(%edi),%eax
  404560:	85 c0                	test   %eax,%eax
  404562:	74 15                	je     0x404579
  404564:	83 3f 00             	cmpl   $0x0,(%edi)
  404567:	74 10                	je     0x404579
  404569:	6a 00                	push   $0x0
  40456b:	50                   	push   %eax
  40456c:	ff 15 58 d0 40 00    	call   *0x40d058  ; 0x40d058=KERNEL32.dll!GetFileSize
  404572:	8b f0                	mov    %eax,%esi
  404574:	83 fe 01             	cmp    $0x1,%esi
  404577:	73 07                	jae    0x404580
  404579:	5e                   	pop    %esi
  40457a:	33 c0                	xor    %eax,%eax
  40457c:	5f                   	pop    %edi
  40457d:	c2 04 00             	ret    $0x4
  404580:	53                   	push   %ebx
  404581:	55                   	push   %ebp
  404582:	8b 6c 24 14          	mov    0x14(%esp),%ebp
  404586:	8d 46 01             	lea    0x1(%esi),%eax
  404589:	50                   	push   %eax
  40458a:	8b cd                	mov    %ebp,%ecx
  40458c:	e8 3f 06 00 00       	call   0x404bd0
  404591:	8b d8                	mov    %eax,%ebx
  404593:	56                   	push   %esi
  404594:	53                   	push   %ebx
  404595:	8b cf                	mov    %edi,%ecx
  404597:	e8 34 f9 ff ff       	call   0x403ed0
  40459c:	3b c6                	cmp    %esi,%eax
  40459e:	74 09                	je     0x4045a9
  4045a0:	5d                   	pop    %ebp
  4045a1:	5b                   	pop    %ebx
  4045a2:	5e                   	pop    %esi
  4045a3:	33 c0                	xor    %eax,%eax
  4045a5:	5f                   	pop    %edi
  4045a6:	c2 04 00             	ret    $0x4
  4045a9:	8b cd                	mov    %ebp,%ecx
  4045ab:	c6 04 33 00          	movb   $0x0,(%ebx,%esi,1)
  4045af:	e8 6c 06 00 00       	call   0x404c20
  4045b4:	5d                   	pop    %ebp
  4045b5:	5b                   	pop    %ebx
  4045b6:	5e                   	pop    %esi
  4045b7:	b8 01 00 00 00       	mov    $0x1,%eax
  4045bc:	5f                   	pop    %edi
  4045bd:	c2 04 00             	ret    $0x4
  4045c0:	33 c0                	xor    %eax,%eax
  4045c2:	5f                   	pop    %edi
  4045c3:	c2 04 00             	ret    $0x4
  4045c6:	cc                   	int3
  4045c7:	cc                   	int3
  4045c8:	cc                   	int3
  4045c9:	cc                   	int3
  4045ca:	cc                   	int3
  4045cb:	cc                   	int3
  4045cc:	cc                   	int3
  4045cd:	cc                   	int3
  4045ce:	cc                   	int3
  4045cf:	cc                   	int3
  4045d0:	56                   	push   %esi
  4045d1:	8b f1                	mov    %ecx,%esi
  4045d3:	8b 46 10             	mov    0x10(%esi),%eax
  4045d6:	85 c0                	test   %eax,%eax
  4045d8:	74 19                	je     0x4045f3
  4045da:	83 3e 00             	cmpl   $0x0,(%esi)
  4045dd:	74 14                	je     0x4045f3
  4045df:	50                   	push   %eax
  4045e0:	ff 15 48 d0 40 00    	call   *0x40d048  ; 0x40d048=KERNEL32.dll!CloseHandle
  4045e6:	c7 46 10 00 00 00 00 	movl   $0x0,0x10(%esi)
  4045ed:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  4045f3:	8d 4e 04             	lea    0x4(%esi),%ecx
  4045f6:	5e                   	pop    %esi
  4045f7:	e9 b4 cf ff ff       	jmp    0x4015b0
  4045fc:	cc                   	int3
  4045fd:	cc                   	int3
  4045fe:	cc                   	int3
  4045ff:	cc                   	int3
  404600:	53                   	push   %ebx
  404601:	55                   	push   %ebp
  404602:	56                   	push   %esi
  404603:	57                   	push   %edi
  404604:	8b f9                	mov    %ecx,%edi
  404606:	8b 47 10             	mov    0x10(%edi),%eax
  404609:	85 c0                	test   %eax,%eax
  40460b:	74 0c                	je     0x404619
  40460d:	83 3f 00             	cmpl   $0x0,(%edi)
  404610:	74 07                	je     0x404619
  404612:	50                   	push   %eax
  404613:	ff 15 48 d0 40 00    	call   *0x40d048  ; 0x40d048=KERNEL32.dll!CloseHandle
  404619:	8b 44 24 14          	mov    0x14(%esp),%eax
  40461d:	8d 77 04             	lea    0x4(%edi),%esi
  404620:	50                   	push   %eax
  404621:	8b ce                	mov    %esi,%ecx
  404623:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  40462a:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
  404630:	e8 9b 07 00 00       	call   0x404dd0
  404635:	8b 44 24 18          	mov    0x18(%esp),%eax
  404639:	83 f8 02             	cmp    $0x2,%eax
  40463c:	77 1d                	ja     0x40465b
  40463e:	74 14                	je     0x404654
  404640:	83 e8 00             	sub    $0x0,%eax
  404643:	74 03                	je     0x404648
  404645:	48                   	dec    %eax
  404646:	eb 18                	jmp    0x404660
  404648:	bb 00 00 00 80       	mov    $0x80000000,%ebx
  40464d:	bd 03 00 00 00       	mov    $0x3,%ebp
  404652:	eb 32                	jmp    0x404686
  404654:	bb 00 00 00 c0       	mov    $0xc0000000,%ebx
  404659:	eb 0c                	jmp    0x404667
  40465b:	3d 00 10 00 00       	cmp    $0x1000,%eax
  404660:	75 67                	jne    0x4046c9
  404662:	bb 00 00 00 40       	mov    $0x40000000,%ebx
  404667:	83 7e 04 01          	cmpl   $0x1,0x4(%esi)
  40466b:	bd 02 00 00 00       	mov    $0x2,%ebp
  404670:	7c 06                	jl     0x404678
  404672:	8b 06                	mov    (%esi),%eax
  404674:	85 c0                	test   %eax,%eax
  404676:	75 05                	jne    0x40467d
  404678:	a1 40 04 41 00       	mov    0x410440,%eax
  40467d:	50                   	push   %eax
  40467e:	e8 fd f5 ff ff       	call   0x403c80
  404683:	83 c4 04             	add    $0x4,%esp
  404686:	83 7e 04 01          	cmpl   $0x1,0x4(%esi)
  40468a:	7c 06                	jl     0x404692
  40468c:	8b 06                	mov    (%esi),%eax
  40468e:	85 c0                	test   %eax,%eax
  404690:	75 05                	jne    0x404697
  404692:	a1 40 04 41 00       	mov    0x410440,%eax
  404697:	6a 00                	push   $0x0
  404699:	68 80 00 00 00       	push   $0x80
  40469e:	55                   	push   %ebp
  40469f:	6a 00                	push   $0x0
  4046a1:	6a 01                	push   $0x1
  4046a3:	53                   	push   %ebx
  4046a4:	50                   	push   %eax
  4046a5:	ff 15 70 d0 40 00    	call   *0x40d070  ; 0x40d070=KERNEL32.dll!CreateFileA
  4046ab:	85 c0                	test   %eax,%eax
  4046ad:	89 47 10             	mov    %eax,0x10(%edi)
  4046b0:	74 17                	je     0x4046c9
  4046b2:	83 f8 ff             	cmp    $0xffffffff,%eax
  4046b5:	74 12                	je     0x4046c9
  4046b7:	c7 07 01 00 00 00    	movl   $0x1,(%edi)
  4046bd:	5f                   	pop    %edi
  4046be:	5e                   	pop    %esi
  4046bf:	5d                   	pop    %ebp
  4046c0:	b8 01 00 00 00       	mov    $0x1,%eax
  4046c5:	5b                   	pop    %ebx
  4046c6:	c2 08 00             	ret    $0x8
  4046c9:	5f                   	pop    %edi
  4046ca:	5e                   	pop    %esi
  4046cb:	5d                   	pop    %ebp
  4046cc:	33 c0                	xor    %eax,%eax
  4046ce:	5b                   	pop    %ebx
  4046cf:	c2 08 00             	ret    $0x8
  4046d2:	cc                   	int3
  4046d3:	cc                   	int3
  4046d4:	cc                   	int3
  4046d5:	cc                   	int3
  4046d6:	cc                   	int3
  4046d7:	cc                   	int3
  4046d8:	cc                   	int3
  4046d9:	cc                   	int3
  4046da:	cc                   	int3
  4046db:	cc                   	int3
  4046dc:	cc                   	int3
  4046dd:	cc                   	int3
  4046de:	cc                   	int3
  4046df:	cc                   	int3
  4046e0:	56                   	push   %esi
  4046e1:	8b f1                	mov    %ecx,%esi
  4046e3:	8b 06                	mov    (%esi),%eax
  4046e5:	85 c0                	test   %eax,%eax
  4046e7:	74 10                	je     0x4046f9
  4046e9:	8b 4e 04             	mov    0x4(%esi),%ecx
  4046ec:	85 c9                	test   %ecx,%ecx
  4046ee:	76 09                	jbe    0x4046f9
  4046f0:	50                   	push   %eax
  4046f1:	e8 6a 11 00 00       	call   0x405860
  4046f6:	83 c4 04             	add    $0x4,%esp
  4046f9:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  4046ff:	c7 46 08 00 00 00 00 	movl   $0x0,0x8(%esi)
  404706:	c7 46 0c 00 00 00 00 	movl   $0x0,0xc(%esi)
  40470d:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
  404714:	5e                   	pop    %esi
  404715:	c3                   	ret
  404716:	cc                   	int3
  404717:	cc                   	int3
  404718:	cc                   	int3
  404719:	cc                   	int3
  40471a:	cc                   	int3
  40471b:	cc                   	int3
  40471c:	cc                   	int3
  40471d:	cc                   	int3
  40471e:	cc                   	int3
  40471f:	cc                   	int3
  404720:	57                   	push   %edi
  404721:	b9 00 01 00 00       	mov    $0x100,%ecx
  404726:	33 c0                	xor    %eax,%eax
  404728:	bf 30 19 41 00       	mov    $0x411930,%edi
  40472d:	f3 ab                	rep stos %eax,%es:(%edi)
  40472f:	5f                   	pop    %edi
  404730:	83 f8 0a             	cmp    $0xa,%eax
  404733:	8a c8                	mov    %al,%cl
  404735:	7d 05                	jge    0x40473c
  404737:	80 c1 30             	add    $0x30,%cl
  40473a:	eb 12                	jmp    0x40474e
  40473c:	80 c1 57             	add    $0x57,%cl
  40473f:	0f b6 d1             	movzbl %cl,%edx
  404742:	8a c8                	mov    %al,%cl
  404744:	89 04 95 30 19 41 00 	mov    %eax,0x411930(,%edx,4)
  40474b:	80 c1 37             	add    $0x37,%cl
  40474e:	0f b6 d1             	movzbl %cl,%edx
  404751:	89 04 95 30 19 41 00 	mov    %eax,0x411930(,%edx,4)
  404758:	88 88 30 1d 41 00    	mov    %cl,0x411d30(%eax)
  40475e:	40                   	inc    %eax
  40475f:	83 f8 10             	cmp    $0x10,%eax
  404762:	7c cc                	jl     0x404730
  404764:	c3                   	ret
  404765:	cc                   	int3
  404766:	cc                   	int3
  404767:	cc                   	int3
  404768:	cc                   	int3
  404769:	cc                   	int3
  40476a:	cc                   	int3
  40476b:	cc                   	int3
  40476c:	cc                   	int3
  40476d:	cc                   	int3
  40476e:	cc                   	int3
  40476f:	cc                   	int3
  404770:	8b c1                	mov    %ecx,%eax
  404772:	33 c9                	xor    %ecx,%ecx
  404774:	89 08                	mov    %ecx,(%eax)
  404776:	89 48 04             	mov    %ecx,0x4(%eax)
  404779:	89 48 08             	mov    %ecx,0x8(%eax)
  40477c:	c3                   	ret
  40477d:	cc                   	int3
  40477e:	cc                   	int3
  40477f:	cc                   	int3
  404780:	53                   	push   %ebx
  404781:	56                   	push   %esi
  404782:	57                   	push   %edi
  404783:	8b 7c 24 14          	mov    0x14(%esp),%edi
  404787:	85 ff                	test   %edi,%edi
  404789:	8b d9                	mov    %ecx,%ebx
  40478b:	7d 02                	jge    0x40478f
  40478d:	33 ff                	xor    %edi,%edi
  40478f:	8b 03                	mov    (%ebx),%eax
  404791:	85 c0                	test   %eax,%eax
  404793:	74 09                	je     0x40479e
  404795:	50                   	push   %eax
  404796:	e8 c5 10 00 00       	call   0x405860
  40479b:	83 c4 04             	add    $0x4,%esp
  40479e:	8d 47 08             	lea    0x8(%edi),%eax
  4047a1:	89 43 08             	mov    %eax,0x8(%ebx)
  4047a4:	83 c0 02             	add    $0x2,%eax
  4047a7:	50                   	push   %eax
  4047a8:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  4047ae:	c7 43 04 00 00 00 00 	movl   $0x0,0x4(%ebx)
  4047b5:	e8 93 15 00 00       	call   0x405d4d
  4047ba:	8b 74 24 14          	mov    0x14(%esp),%esi
  4047be:	83 c4 04             	add    $0x4,%esp
  4047c1:	85 f6                	test   %esi,%esi
  4047c3:	89 03                	mov    %eax,(%ebx)
  4047c5:	74 41                	je     0x404808
  4047c7:	85 ff                	test   %edi,%edi
  4047c9:	7e 3d                	jle    0x404808
  4047cb:	8b ce                	mov    %esi,%ecx
  4047cd:	55                   	push   %ebp
  4047ce:	8d 69 01             	lea    0x1(%ecx),%ebp
  4047d1:	8a 11                	mov    (%ecx),%dl
  4047d3:	41                   	inc    %ecx
  4047d4:	84 d2                	test   %dl,%dl
  4047d6:	75 f9                	jne    0x4047d1
  4047d8:	2b cd                	sub    %ebp,%ecx
  4047da:	8b d1                	mov    %ecx,%edx
  4047dc:	85 d2                	test   %edx,%edx
  4047de:	5d                   	pop    %ebp
  4047df:	7e 2a                	jle    0x40480b
  4047e1:	3b d7                	cmp    %edi,%edx
  4047e3:	7c 02                	jl     0x4047e7
  4047e5:	8b d7                	mov    %edi,%edx
  4047e7:	8b ca                	mov    %edx,%ecx
  4047e9:	8b f8                	mov    %eax,%edi
  4047eb:	8b c1                	mov    %ecx,%eax
  4047ed:	c1 e9 02             	shr    $0x2,%ecx
  4047f0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  4047f2:	8b c8                	mov    %eax,%ecx
  4047f4:	83 e1 03             	and    $0x3,%ecx
  4047f7:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  4047f9:	8b 0b                	mov    (%ebx),%ecx
  4047fb:	5f                   	pop    %edi
  4047fc:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
  404800:	5e                   	pop    %esi
  404801:	89 53 04             	mov    %edx,0x4(%ebx)
  404804:	5b                   	pop    %ebx
  404805:	c2 08 00             	ret    $0x8
  404808:	c6 00 00             	movb   $0x0,(%eax)
  40480b:	5f                   	pop    %edi
  40480c:	5e                   	pop    %esi
  40480d:	5b                   	pop    %ebx
  40480e:	c2 08 00             	ret    $0x8
  404811:	cc                   	int3
  404812:	cc                   	int3
  404813:	cc                   	int3
  404814:	cc                   	int3
  404815:	cc                   	int3
  404816:	cc                   	int3
  404817:	cc                   	int3
  404818:	cc                   	int3
  404819:	cc                   	int3
  40481a:	cc                   	int3
  40481b:	cc                   	int3
  40481c:	cc                   	int3
  40481d:	cc                   	int3
  40481e:	cc                   	int3
  40481f:	cc                   	int3
  404820:	8b 51 04             	mov    0x4(%ecx),%edx
  404823:	83 fa 01             	cmp    $0x1,%edx
  404826:	7c 34                	jl     0x40485c
  404828:	8b 44 24 08          	mov    0x8(%esp),%eax
  40482c:	3b c2                	cmp    %edx,%eax
  40482e:	7d 2c                	jge    0x40485c
  404830:	8b 11                	mov    (%ecx),%edx
  404832:	8a 0c 10             	mov    (%eax,%edx,1),%cl
  404835:	03 c2                	add    %edx,%eax
  404837:	84 c9                	test   %cl,%cl
  404839:	56                   	push   %esi
  40483a:	74 13                	je     0x40484f
  40483c:	8b 74 24 08          	mov    0x8(%esp),%esi
  404840:	0f be c9             	movsbl %cl,%ecx
  404843:	3b ce                	cmp    %esi,%ecx
  404845:	74 0f                	je     0x404856
  404847:	8a 48 01             	mov    0x1(%eax),%cl
  40484a:	40                   	inc    %eax
  40484b:	84 c9                	test   %cl,%cl
  40484d:	75 f1                	jne    0x404840
  40484f:	83 c8 ff             	or     $0xffffffff,%eax
  404852:	5e                   	pop    %esi
  404853:	c2 08 00             	ret    $0x8
  404856:	2b c2                	sub    %edx,%eax
  404858:	5e                   	pop    %esi
  404859:	c2 08 00             	ret    $0x8
  40485c:	83 c8 ff             	or     $0xffffffff,%eax
  40485f:	c2 08 00             	ret    $0x8
  404862:	cc                   	int3
  404863:	cc                   	int3
  404864:	cc                   	int3
  404865:	cc                   	int3
  404866:	cc                   	int3
  404867:	cc                   	int3
  404868:	cc                   	int3
  404869:	cc                   	int3
  40486a:	cc                   	int3
  40486b:	cc                   	int3
  40486c:	cc                   	int3
  40486d:	cc                   	int3
  40486e:	cc                   	int3
  40486f:	cc                   	int3
  404870:	80 3f 00             	cmpb   $0x0,(%edi)
  404873:	56                   	push   %esi
  404874:	8b f0                	mov    %eax,%esi
  404876:	75 02                	jne    0x40487a
  404878:	5e                   	pop    %esi
  404879:	c3                   	ret
  40487a:	8a 16                	mov    (%esi),%dl
  40487c:	84 d2                	test   %dl,%dl
  40487e:	53                   	push   %ebx
  40487f:	74 37                	je     0x4048b8
  404881:	2b f7                	sub    %edi,%esi
  404883:	84 d2                	test   %dl,%dl
  404885:	8b cf                	mov    %edi,%ecx
  404887:	74 21                	je     0x4048aa
  404889:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
  404890:	8a 11                	mov    (%ecx),%dl
  404892:	84 d2                	test   %dl,%dl
  404894:	74 24                	je     0x4048ba
  404896:	0f be 1c 0e          	movsbl (%esi,%ecx,1),%ebx
  40489a:	0f be d2             	movsbl %dl,%edx
  40489d:	2b da                	sub    %edx,%ebx
  40489f:	75 09                	jne    0x4048aa
  4048a1:	8a 54 0e 01          	mov    0x1(%esi,%ecx,1),%dl
  4048a5:	41                   	inc    %ecx
  4048a6:	84 d2                	test   %dl,%dl
  4048a8:	75 e6                	jne    0x404890
  4048aa:	80 39 00             	cmpb   $0x0,(%ecx)
  4048ad:	74 0b                	je     0x4048ba
  4048af:	8a 50 01             	mov    0x1(%eax),%dl
  4048b2:	40                   	inc    %eax
  4048b3:	46                   	inc    %esi
  4048b4:	84 d2                	test   %dl,%dl
  4048b6:	75 cb                	jne    0x404883
  4048b8:	33 c0                	xor    %eax,%eax
  4048ba:	5b                   	pop    %ebx
  4048bb:	5e                   	pop    %esi
  4048bc:	c3                   	ret
  4048bd:	cc                   	int3
  4048be:	cc                   	int3
  4048bf:	cc                   	int3
  4048c0:	8b 51 04             	mov    0x4(%ecx),%edx
  4048c3:	83 fa 01             	cmp    $0x1,%edx
  4048c6:	7d 06                	jge    0x4048ce
  4048c8:	83 c8 ff             	or     $0xffffffff,%eax
  4048cb:	c2 08 00             	ret    $0x8
  4048ce:	56                   	push   %esi
  4048cf:	8b 31                	mov    (%ecx),%esi
  4048d1:	85 f6                	test   %esi,%esi
  4048d3:	57                   	push   %edi
  4048d4:	74 28                	je     0x4048fe
  4048d6:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  4048da:	85 ff                	test   %edi,%edi
  4048dc:	74 20                	je     0x4048fe
  4048de:	8b 44 24 10          	mov    0x10(%esp),%eax
  4048e2:	85 c0                	test   %eax,%eax
  4048e4:	7d 02                	jge    0x4048e8
  4048e6:	33 c0                	xor    %eax,%eax
  4048e8:	3b c2                	cmp    %edx,%eax
  4048ea:	7d 12                	jge    0x4048fe
  4048ec:	03 c6                	add    %esi,%eax
  4048ee:	e8 7d ff ff ff       	call   0x404870
  4048f3:	85 c0                	test   %eax,%eax
  4048f5:	74 07                	je     0x4048fe
  4048f7:	5f                   	pop    %edi
  4048f8:	2b c6                	sub    %esi,%eax
  4048fa:	5e                   	pop    %esi
  4048fb:	c2 08 00             	ret    $0x8
  4048fe:	5f                   	pop    %edi
  4048ff:	83 c8 ff             	or     $0xffffffff,%eax
  404902:	5e                   	pop    %esi
  404903:	c2 08 00             	ret    $0x8
  404906:	cc                   	int3
  404907:	cc                   	int3
  404908:	cc                   	int3
  404909:	cc                   	int3
  40490a:	cc                   	int3
  40490b:	cc                   	int3
  40490c:	cc                   	int3
  40490d:	cc                   	int3
  40490e:	cc                   	int3
  40490f:	cc                   	int3
  404910:	53                   	push   %ebx
  404911:	57                   	push   %edi
  404912:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  404916:	85 ff                	test   %edi,%edi
  404918:	8b d9                	mov    %ecx,%ebx
  40491a:	0f 8c 9e 00 00 00    	jl     0x4049be
  404920:	8b 44 24 10          	mov    0x10(%esp),%eax
  404924:	85 c0                	test   %eax,%eax
  404926:	0f 84 92 00 00 00    	je     0x4049be
  40492c:	8d 50 01             	lea    0x1(%eax),%edx
  40492f:	90                   	nop
  404930:	8a 08                	mov    (%eax),%cl
  404932:	40                   	inc    %eax
  404933:	84 c9                	test   %cl,%cl
  404935:	75 f9                	jne    0x404930
  404937:	2b c2                	sub    %edx,%eax
  404939:	55                   	push   %ebp
  40493a:	8b e8                	mov    %eax,%ebp
  40493c:	83 fd 01             	cmp    $0x1,%ebp
  40493f:	7c 7c                	jl     0x4049bd
  404941:	8b 43 04             	mov    0x4(%ebx),%eax
  404944:	3b f8                	cmp    %eax,%edi
  404946:	7d 04                	jge    0x40494c
  404948:	03 c5                	add    %ebp,%eax
  40494a:	eb 03                	jmp    0x40494f
  40494c:	8d 04 2f             	lea    (%edi,%ebp,1),%eax
  40494f:	3b 43 08             	cmp    0x8(%ebx),%eax
  404952:	56                   	push   %esi
  404953:	7c 1f                	jl     0x404974
  404955:	8b 33                	mov    (%ebx),%esi
  404957:	40                   	inc    %eax
  404958:	50                   	push   %eax
  404959:	56                   	push   %esi
  40495a:	8b cb                	mov    %ebx,%ecx
  40495c:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  404962:	e8 19 fe ff ff       	call   0x404780
  404967:	85 f6                	test   %esi,%esi
  404969:	74 09                	je     0x404974
  40496b:	56                   	push   %esi
  40496c:	e8 ef 0e 00 00       	call   0x405860
  404971:	83 c4 04             	add    $0x4,%esp
  404974:	8b 43 04             	mov    0x4(%ebx),%eax
  404977:	3b f8                	cmp    %eax,%edi
  404979:	7d 17                	jge    0x404992
  40497b:	8b 0b                	mov    (%ebx),%ecx
  40497d:	2b c7                	sub    %edi,%eax
  40497f:	40                   	inc    %eax
  404980:	50                   	push   %eax
  404981:	8d 04 39             	lea    (%ecx,%edi,1),%eax
  404984:	03 cd                	add    %ebp,%ecx
  404986:	50                   	push   %eax
  404987:	03 cf                	add    %edi,%ecx
  404989:	51                   	push   %ecx
  40498a:	e8 f1 19 00 00       	call   0x406380
  40498f:	83 c4 0c             	add    $0xc,%esp
  404992:	8b 3b                	mov    (%ebx),%edi
  404994:	8b 54 24 14          	mov    0x14(%esp),%edx
  404998:	8b 74 24 18          	mov    0x18(%esp),%esi
  40499c:	03 fa                	add    %edx,%edi
  40499e:	8b cd                	mov    %ebp,%ecx
  4049a0:	8b d1                	mov    %ecx,%edx
  4049a2:	c1 e9 02             	shr    $0x2,%ecx
  4049a5:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  4049a7:	8b ca                	mov    %edx,%ecx
  4049a9:	83 e1 03             	and    $0x3,%ecx
  4049ac:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  4049ae:	8b 43 04             	mov    0x4(%ebx),%eax
  4049b1:	8b 0b                	mov    (%ebx),%ecx
  4049b3:	03 c5                	add    %ebp,%eax
  4049b5:	89 43 04             	mov    %eax,0x4(%ebx)
  4049b8:	c6 04 08 00          	movb   $0x0,(%eax,%ecx,1)
  4049bc:	5e                   	pop    %esi
  4049bd:	5d                   	pop    %ebp
  4049be:	5f                   	pop    %edi
  4049bf:	5b                   	pop    %ebx
  4049c0:	c2 08 00             	ret    $0x8
  4049c3:	cc                   	int3
  4049c4:	cc                   	int3
  4049c5:	cc                   	int3
  4049c6:	cc                   	int3
  4049c7:	cc                   	int3
  4049c8:	cc                   	int3
  4049c9:	cc                   	int3
  4049ca:	cc                   	int3
  4049cb:	cc                   	int3
  4049cc:	cc                   	int3
  4049cd:	cc                   	int3
  4049ce:	cc                   	int3
  4049cf:	cc                   	int3
  4049d0:	8b 44 24 04          	mov    0x4(%esp),%eax
  4049d4:	8b 10                	mov    (%eax),%edx
  4049d6:	8b 41 04             	mov    0x4(%ecx),%eax
  4049d9:	52                   	push   %edx
  4049da:	50                   	push   %eax
  4049db:	e8 30 ff ff ff       	call   0x404910
  4049e0:	c2 04 00             	ret    $0x4
  4049e3:	cc                   	int3
  4049e4:	cc                   	int3
  4049e5:	cc                   	int3
  4049e6:	cc                   	int3
  4049e7:	cc                   	int3
  4049e8:	cc                   	int3
  4049e9:	cc                   	int3
  4049ea:	cc                   	int3
  4049eb:	cc                   	int3
  4049ec:	cc                   	int3
  4049ed:	cc                   	int3
  4049ee:	cc                   	int3
  4049ef:	cc                   	int3
  4049f0:	8b 44 24 04          	mov    0x4(%esp),%eax
  4049f4:	8b 51 04             	mov    0x4(%ecx),%edx
  4049f7:	50                   	push   %eax
  4049f8:	52                   	push   %edx
  4049f9:	e8 12 ff ff ff       	call   0x404910
  4049fe:	c2 04 00             	ret    $0x4
  404a01:	cc                   	int3
  404a02:	cc                   	int3
  404a03:	cc                   	int3
  404a04:	cc                   	int3
  404a05:	cc                   	int3
  404a06:	cc                   	int3
  404a07:	cc                   	int3
  404a08:	cc                   	int3
  404a09:	cc                   	int3
  404a0a:	cc                   	int3
  404a0b:	cc                   	int3
  404a0c:	cc                   	int3
  404a0d:	cc                   	int3
  404a0e:	cc                   	int3
  404a0f:	cc                   	int3
  404a10:	8b 54 24 04          	mov    0x4(%esp),%edx
  404a14:	85 d2                	test   %edx,%edx
  404a16:	7c 11                	jl     0x404a29
  404a18:	3b 51 04             	cmp    0x4(%ecx),%edx
  404a1b:	7d 0c                	jge    0x404a29
  404a1d:	8b 01                	mov    (%ecx),%eax
  404a1f:	85 c0                	test   %eax,%eax
  404a21:	74 06                	je     0x404a29
  404a23:	8a 04 10             	mov    (%eax,%edx,1),%al
  404a26:	c2 04 00             	ret    $0x4
  404a29:	32 c0                	xor    %al,%al
  404a2b:	c2 04 00             	ret    $0x4
  404a2e:	cc                   	int3
  404a2f:	cc                   	int3
  404a30:	8b 44 24 04          	mov    0x4(%esp),%eax
  404a34:	85 c0                	test   %eax,%eax
  404a36:	53                   	push   %ebx
  404a37:	8b d9                	mov    %ecx,%ebx
  404a39:	7c 67                	jl     0x404aa2
  404a3b:	8b 4b 04             	mov    0x4(%ebx),%ecx
  404a3e:	3b c1                	cmp    %ecx,%eax
  404a40:	7d 60                	jge    0x404aa2
  404a42:	57                   	push   %edi
  404a43:	8b 3b                	mov    (%ebx),%edi
  404a45:	85 ff                	test   %edi,%edi
  404a47:	74 58                	je     0x404aa1
  404a49:	8b 54 24 10          	mov    0x10(%esp),%edx
  404a4d:	56                   	push   %esi
  404a4e:	8d 34 10             	lea    (%eax,%edx,1),%esi
  404a51:	3b f1                	cmp    %ecx,%esi
  404a53:	7c 1a                	jl     0x404a6f
  404a55:	83 f8 01             	cmp    $0x1,%eax
  404a58:	7d 0d                	jge    0x404a67
  404a5a:	8b cb                	mov    %ebx,%ecx
  404a5c:	e8 4f cb ff ff       	call   0x4015b0
  404a61:	5e                   	pop    %esi
  404a62:	5f                   	pop    %edi
  404a63:	5b                   	pop    %ebx
  404a64:	c2 08 00             	ret    $0x8
  404a67:	3b f1                	cmp    %ecx,%esi
  404a69:	7c 04                	jl     0x404a6f
  404a6b:	2b c8                	sub    %eax,%ecx
  404a6d:	8b d1                	mov    %ecx,%edx
  404a6f:	83 fa 01             	cmp    $0x1,%edx
  404a72:	7c 2c                	jl     0x404aa0
  404a74:	8b 4b 04             	mov    0x4(%ebx),%ecx
  404a77:	2b c8                	sub    %eax,%ecx
  404a79:	2b ca                	sub    %edx,%ecx
  404a7b:	85 c9                	test   %ecx,%ecx
  404a7d:	7e 13                	jle    0x404a92
  404a7f:	03 f8                	add    %eax,%edi
  404a81:	8b c1                	mov    %ecx,%eax
  404a83:	c1 e9 02             	shr    $0x2,%ecx
  404a86:	8d 34 17             	lea    (%edi,%edx,1),%esi
  404a89:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  404a8b:	8b c8                	mov    %eax,%ecx
  404a8d:	83 e1 03             	and    $0x3,%ecx
  404a90:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  404a92:	8b 43 04             	mov    0x4(%ebx),%eax
  404a95:	8b 0b                	mov    (%ebx),%ecx
  404a97:	2b c2                	sub    %edx,%eax
  404a99:	89 43 04             	mov    %eax,0x4(%ebx)
  404a9c:	c6 04 08 00          	movb   $0x0,(%eax,%ecx,1)
  404aa0:	5e                   	pop    %esi
  404aa1:	5f                   	pop    %edi
  404aa2:	5b                   	pop    %ebx
  404aa3:	c2 08 00             	ret    $0x8
  404aa6:	cc                   	int3
  404aa7:	cc                   	int3
  404aa8:	cc                   	int3
  404aa9:	cc                   	int3
  404aaa:	cc                   	int3
  404aab:	cc                   	int3
  404aac:	cc                   	int3
  404aad:	cc                   	int3
  404aae:	cc                   	int3
  404aaf:	cc                   	int3
  404ab0:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  404ab4:	8a 01                	mov    (%ecx),%al
  404ab6:	3c 2d                	cmp    $0x2d,%al
  404ab8:	75 3a                	jne    0x404af4
  404aba:	8a 41 01             	mov    0x1(%ecx),%al
  404abd:	41                   	inc    %ecx
  404abe:	3c 30                	cmp    $0x30,%al
  404ac0:	7c 2d                	jl     0x404aef
  404ac2:	3c 39                	cmp    $0x39,%al
  404ac4:	7f 29                	jg     0x404aef
  404ac6:	8a 51 01             	mov    0x1(%ecx),%dl
  404ac9:	0f be c0             	movsbl %al,%eax
  404acc:	83 e8 30             	sub    $0x30,%eax
  404acf:	41                   	inc    %ecx
  404ad0:	80 fa 30             	cmp    $0x30,%dl
  404ad3:	7c 1c                	jl     0x404af1
  404ad5:	80 fa 39             	cmp    $0x39,%dl
  404ad8:	7f 17                	jg     0x404af1
  404ada:	0f be d2             	movsbl %dl,%edx
  404add:	8d 04 80             	lea    (%eax,%eax,4),%eax
  404ae0:	41                   	inc    %ecx
  404ae1:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  404ae5:	8a 11                	mov    (%ecx),%dl
  404ae7:	80 fa 30             	cmp    $0x30,%dl
  404aea:	7d e9                	jge    0x404ad5
  404aec:	f7 d8                	neg    %eax
  404aee:	c3                   	ret
  404aef:	33 c0                	xor    %eax,%eax
  404af1:	f7 d8                	neg    %eax
  404af3:	c3                   	ret
  404af4:	3c 30                	cmp    $0x30,%al
  404af6:	7c 30                	jl     0x404b28
  404af8:	3c 39                	cmp    $0x39,%al
  404afa:	7f 2c                	jg     0x404b28
  404afc:	8a 51 01             	mov    0x1(%ecx),%dl
  404aff:	0f be c0             	movsbl %al,%eax
  404b02:	83 e8 30             	sub    $0x30,%eax
  404b05:	41                   	inc    %ecx
  404b06:	80 fa 30             	cmp    $0x30,%dl
  404b09:	7c 1f                	jl     0x404b2a
  404b0b:	eb 03                	jmp    0x404b10
  404b0d:	8d 49 00             	lea    0x0(%ecx),%ecx
  404b10:	80 fa 39             	cmp    $0x39,%dl
  404b13:	7f 15                	jg     0x404b2a
  404b15:	0f be d2             	movsbl %dl,%edx
  404b18:	8d 04 80             	lea    (%eax,%eax,4),%eax
  404b1b:	41                   	inc    %ecx
  404b1c:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  404b20:	8a 11                	mov    (%ecx),%dl
  404b22:	80 fa 30             	cmp    $0x30,%dl
  404b25:	7d e9                	jge    0x404b10
  404b27:	c3                   	ret
  404b28:	33 c0                	xor    %eax,%eax
  404b2a:	c3                   	ret
  404b2b:	cc                   	int3
  404b2c:	cc                   	int3
  404b2d:	cc                   	int3
  404b2e:	cc                   	int3
  404b2f:	cc                   	int3
  404b30:	8b 54 24 04          	mov    0x4(%esp),%edx
  404b34:	8a 0a                	mov    (%edx),%cl
  404b36:	33 c0                	xor    %eax,%eax
  404b38:	84 c9                	test   %cl,%cl
  404b3a:	74 1c                	je     0x404b58
  404b3c:	56                   	push   %esi
  404b3d:	8d 49 00             	lea    0x0(%ecx),%ecx
  404b40:	0f b6 c9             	movzbl %cl,%ecx
  404b43:	8b 34 8d 30 19 41 00 	mov    0x411930(,%ecx,4),%esi
  404b4a:	8a 4a 01             	mov    0x1(%edx),%cl
  404b4d:	c1 e0 04             	shl    $0x4,%eax
  404b50:	03 c6                	add    %esi,%eax
  404b52:	42                   	inc    %edx
  404b53:	84 c9                	test   %cl,%cl
  404b55:	75 e9                	jne    0x404b40
  404b57:	5e                   	pop    %esi
  404b58:	c3                   	ret
  404b59:	cc                   	int3
  404b5a:	cc                   	int3
  404b5b:	cc                   	int3
  404b5c:	cc                   	int3
  404b5d:	cc                   	int3
  404b5e:	cc                   	int3
  404b5f:	cc                   	int3
  404b60:	8b 44 24 04          	mov    0x4(%esp),%eax
  404b64:	56                   	push   %esi
  404b65:	8b f1                	mov    %ecx,%esi
  404b67:	39 46 04             	cmp    %eax,0x4(%esi)
  404b6a:	7e 1b                	jle    0x404b87
  404b6c:	8b 0e                	mov    (%esi),%ecx
  404b6e:	c6 04 08 00          	movb   $0x0,(%eax,%ecx,1)
  404b72:	8b 06                	mov    (%esi),%eax
  404b74:	8d 50 01             	lea    0x1(%eax),%edx
  404b77:	8a 08                	mov    (%eax),%cl
  404b79:	40                   	inc    %eax
  404b7a:	84 c9                	test   %cl,%cl
  404b7c:	75 f9                	jne    0x404b77
  404b7e:	2b c2                	sub    %edx,%eax
  404b80:	89 46 04             	mov    %eax,0x4(%esi)
  404b83:	5e                   	pop    %esi
  404b84:	c2 04 00             	ret    $0x4
  404b87:	85 c0                	test   %eax,%eax
  404b89:	57                   	push   %edi
  404b8a:	8b f8                	mov    %eax,%edi
  404b8c:	7d 02                	jge    0x404b90
  404b8e:	33 ff                	xor    %edi,%edi
  404b90:	8b 06                	mov    (%esi),%eax
  404b92:	85 c0                	test   %eax,%eax
  404b94:	74 09                	je     0x404b9f
  404b96:	50                   	push   %eax
  404b97:	e8 c4 0c 00 00       	call   0x405860
  404b9c:	83 c4 04             	add    $0x4,%esp
  404b9f:	8d 47 08             	lea    0x8(%edi),%eax
  404ba2:	89 46 08             	mov    %eax,0x8(%esi)
  404ba5:	83 c0 02             	add    $0x2,%eax
  404ba8:	50                   	push   %eax
  404ba9:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  404baf:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
  404bb6:	e8 92 11 00 00       	call   0x405d4d
  404bbb:	83 c4 04             	add    $0x4,%esp
  404bbe:	89 06                	mov    %eax,(%esi)
  404bc0:	5f                   	pop    %edi
  404bc1:	c6 00 00             	movb   $0x0,(%eax)
  404bc4:	5e                   	pop    %esi
  404bc5:	c2 04 00             	ret    $0x4
  404bc8:	cc                   	int3
  404bc9:	cc                   	int3
  404bca:	cc                   	int3
  404bcb:	cc                   	int3
  404bcc:	cc                   	int3
  404bcd:	cc                   	int3
  404bce:	cc                   	int3
  404bcf:	cc                   	int3
  404bd0:	56                   	push   %esi
  404bd1:	57                   	push   %edi
  404bd2:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  404bd6:	85 ff                	test   %edi,%edi
  404bd8:	8b f1                	mov    %ecx,%esi
  404bda:	7d 02                	jge    0x404bde
  404bdc:	33 ff                	xor    %edi,%edi
  404bde:	8b 06                	mov    (%esi),%eax
  404be0:	85 c0                	test   %eax,%eax
  404be2:	74 09                	je     0x404bed
  404be4:	50                   	push   %eax
  404be5:	e8 76 0c 00 00       	call   0x405860
  404bea:	83 c4 04             	add    $0x4,%esp
  404bed:	8d 47 08             	lea    0x8(%edi),%eax
  404bf0:	89 46 08             	mov    %eax,0x8(%esi)
  404bf3:	83 c0 02             	add    $0x2,%eax
  404bf6:	50                   	push   %eax
  404bf7:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  404bfd:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
  404c04:	e8 44 11 00 00       	call   0x405d4d
  404c09:	83 c4 04             	add    $0x4,%esp
  404c0c:	89 06                	mov    %eax,(%esi)
  404c0e:	c6 00 00             	movb   $0x0,(%eax)
  404c11:	8b 06                	mov    (%esi),%eax
  404c13:	5f                   	pop    %edi
  404c14:	5e                   	pop    %esi
  404c15:	c2 04 00             	ret    $0x4
  404c18:	cc                   	int3
  404c19:	cc                   	int3
  404c1a:	cc                   	int3
  404c1b:	cc                   	int3
  404c1c:	cc                   	int3
  404c1d:	cc                   	int3
  404c1e:	cc                   	int3
  404c1f:	cc                   	int3
  404c20:	8b 01                	mov    (%ecx),%eax
  404c22:	56                   	push   %esi
  404c23:	8d 70 01             	lea    0x1(%eax),%esi
  404c26:	8a 10                	mov    (%eax),%dl
  404c28:	40                   	inc    %eax
  404c29:	84 d2                	test   %dl,%dl
  404c2b:	75 f9                	jne    0x404c26
  404c2d:	2b c6                	sub    %esi,%eax
  404c2f:	89 41 04             	mov    %eax,0x4(%ecx)
  404c32:	5e                   	pop    %esi
  404c33:	c3                   	ret
  404c34:	cc                   	int3
  404c35:	cc                   	int3
  404c36:	cc                   	int3
  404c37:	cc                   	int3
  404c38:	cc                   	int3
  404c39:	cc                   	int3
  404c3a:	cc                   	int3
  404c3b:	cc                   	int3
  404c3c:	cc                   	int3
  404c3d:	cc                   	int3
  404c3e:	cc                   	int3
  404c3f:	cc                   	int3
  404c40:	56                   	push   %esi
  404c41:	8b 71 04             	mov    0x4(%ecx),%esi
  404c44:	83 fe 01             	cmp    $0x1,%esi
  404c47:	7c 23                	jl     0x404c6c
  404c49:	8b 11                	mov    (%ecx),%edx
  404c4b:	85 d2                	test   %edx,%edx
  404c4d:	74 1d                	je     0x404c6c
  404c4f:	8a 44 32 ff          	mov    -0x1(%edx,%esi,1),%al
  404c53:	3a 44 24 08          	cmp    0x8(%esp),%al
  404c57:	75 13                	jne    0x404c6c
  404c59:	8d 46 ff             	lea    -0x1(%esi),%eax
  404c5c:	89 41 04             	mov    %eax,0x4(%ecx)
  404c5f:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)
  404c63:	b8 01 00 00 00       	mov    $0x1,%eax
  404c68:	5e                   	pop    %esi
  404c69:	c2 04 00             	ret    $0x4
  404c6c:	33 c0                	xor    %eax,%eax
  404c6e:	5e                   	pop    %esi
  404c6f:	c2 04 00             	ret    $0x4
  404c72:	cc                   	int3
  404c73:	cc                   	int3
  404c74:	cc                   	int3
  404c75:	cc                   	int3
  404c76:	cc                   	int3
  404c77:	cc                   	int3
  404c78:	cc                   	int3
  404c79:	cc                   	int3
  404c7a:	cc                   	int3
  404c7b:	cc                   	int3
  404c7c:	cc                   	int3
  404c7d:	cc                   	int3
  404c7e:	cc                   	int3
  404c7f:	cc                   	int3
  404c80:	8b 44 24 04          	mov    0x4(%esp),%eax
  404c84:	53                   	push   %ebx
  404c85:	33 db                	xor    %ebx,%ebx
  404c87:	56                   	push   %esi
  404c88:	8b f1                	mov    %ecx,%esi
  404c8a:	89 1e                	mov    %ebx,(%esi)
  404c8c:	89 5e 04             	mov    %ebx,0x4(%esi)
  404c8f:	89 5e 08             	mov    %ebx,0x8(%esi)
  404c92:	8b 10                	mov    (%eax),%edx
  404c94:	3b d3                	cmp    %ebx,%edx
  404c96:	89 1e                	mov    %ebx,(%esi)
  404c98:	89 5e 04             	mov    %ebx,0x4(%esi)
  404c9b:	89 5e 08             	mov    %ebx,0x8(%esi)
  404c9e:	74 19                	je     0x404cb9
  404ca0:	8b c2                	mov    %edx,%eax
  404ca2:	57                   	push   %edi
  404ca3:	8d 78 01             	lea    0x1(%eax),%edi
  404ca6:	8a 08                	mov    (%eax),%cl
  404ca8:	40                   	inc    %eax
  404ca9:	3a cb                	cmp    %bl,%cl
  404cab:	75 f9                	jne    0x404ca6
  404cad:	2b c7                	sub    %edi,%eax
  404caf:	50                   	push   %eax
  404cb0:	52                   	push   %edx
  404cb1:	8b ce                	mov    %esi,%ecx
  404cb3:	e8 c8 fa ff ff       	call   0x404780
  404cb8:	5f                   	pop    %edi
  404cb9:	8b c6                	mov    %esi,%eax
  404cbb:	5e                   	pop    %esi
  404cbc:	5b                   	pop    %ebx
  404cbd:	c2 04 00             	ret    $0x4
  404cc0:	8b 54 24 04          	mov    0x4(%esp),%edx
  404cc4:	85 d2                	test   %edx,%edx
  404cc6:	56                   	push   %esi
  404cc7:	8b f1                	mov    %ecx,%esi
  404cc9:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  404ccf:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
  404cd6:	c7 46 08 00 00 00 00 	movl   $0x0,0x8(%esi)
  404cdd:	74 19                	je     0x404cf8
  404cdf:	8b c2                	mov    %edx,%eax
  404ce1:	57                   	push   %edi
  404ce2:	8d 78 01             	lea    0x1(%eax),%edi
  404ce5:	8a 08                	mov    (%eax),%cl
  404ce7:	40                   	inc    %eax
  404ce8:	84 c9                	test   %cl,%cl
  404cea:	75 f9                	jne    0x404ce5
  404cec:	2b c7                	sub    %edi,%eax
  404cee:	50                   	push   %eax
  404cef:	52                   	push   %edx
  404cf0:	8b ce                	mov    %esi,%ecx
  404cf2:	e8 89 fa ff ff       	call   0x404780
  404cf7:	5f                   	pop    %edi
  404cf8:	8b c6                	mov    %esi,%eax
  404cfa:	5e                   	pop    %esi
  404cfb:	c2 04 00             	ret    $0x4
  404cfe:	cc                   	int3
  404cff:	cc                   	int3
  404d00:	b8 a0 86 01 00       	mov    $0x186a0,%eax
  404d05:	e8 06 10 00 00       	call   0x405d10
  404d0a:	8b 8c 24 a8 86 01 00 	mov    0x186a8(%esp),%ecx
  404d11:	56                   	push   %esi
  404d12:	8d 84 24 b0 86 01 00 	lea    0x186b0(%esp),%eax
  404d19:	50                   	push   %eax
  404d1a:	51                   	push   %ecx
  404d1b:	8d 54 24 0c          	lea    0xc(%esp),%edx
  404d1f:	52                   	push   %edx
  404d20:	ff 15 9c d1 40 00    	call   *0x40d19c  ; 0x40d19c=USER32.dll!wvsprintfA
  404d26:	8b b4 24 a8 86 01 00 	mov    0x186a8(%esp),%esi
  404d2d:	8b 06                	mov    (%esi),%eax
  404d2f:	85 c0                	test   %eax,%eax
  404d31:	74 09                	je     0x404d3c
  404d33:	50                   	push   %eax
  404d34:	e8 27 0b 00 00       	call   0x405860
  404d39:	83 c4 04             	add    $0x4,%esp
  404d3c:	8d 44 24 04          	lea    0x4(%esp),%eax
  404d40:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  404d46:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
  404d4d:	c7 46 08 00 00 00 00 	movl   $0x0,0x8(%esi)
  404d54:	8d 50 01             	lea    0x1(%eax),%edx
  404d57:	8a 08                	mov    (%eax),%cl
  404d59:	40                   	inc    %eax
  404d5a:	84 c9                	test   %cl,%cl
  404d5c:	75 f9                	jne    0x404d57
  404d5e:	2b c2                	sub    %edx,%eax
  404d60:	50                   	push   %eax
  404d61:	8d 44 24 08          	lea    0x8(%esp),%eax
  404d65:	50                   	push   %eax
  404d66:	8b ce                	mov    %esi,%ecx
  404d68:	e8 13 fa ff ff       	call   0x404780
  404d6d:	5e                   	pop    %esi
  404d6e:	81 c4 a0 86 01 00    	add    $0x186a0,%esp
  404d74:	c3                   	ret
  404d75:	cc                   	int3
  404d76:	cc                   	int3
  404d77:	cc                   	int3
  404d78:	cc                   	int3
  404d79:	cc                   	int3
  404d7a:	cc                   	int3
  404d7b:	cc                   	int3
  404d7c:	cc                   	int3
  404d7d:	cc                   	int3
  404d7e:	cc                   	int3
  404d7f:	cc                   	int3
  404d80:	8b 44 24 04          	mov    0x4(%esp),%eax
  404d84:	56                   	push   %esi
  404d85:	57                   	push   %edi
  404d86:	8b 38                	mov    (%eax),%edi
  404d88:	8b f1                	mov    %ecx,%esi
  404d8a:	8b 06                	mov    (%esi),%eax
  404d8c:	85 c0                	test   %eax,%eax
  404d8e:	74 09                	je     0x404d99
  404d90:	50                   	push   %eax
  404d91:	e8 ca 0a 00 00       	call   0x405860
  404d96:	83 c4 04             	add    $0x4,%esp
  404d99:	85 ff                	test   %edi,%edi
  404d9b:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  404da1:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
  404da8:	c7 46 08 00 00 00 00 	movl   $0x0,0x8(%esi)
  404daf:	74 17                	je     0x404dc8
  404db1:	8b c7                	mov    %edi,%eax
  404db3:	8d 50 01             	lea    0x1(%eax),%edx
  404db6:	8a 08                	mov    (%eax),%cl
  404db8:	40                   	inc    %eax
  404db9:	84 c9                	test   %cl,%cl
  404dbb:	75 f9                	jne    0x404db6
  404dbd:	2b c2                	sub    %edx,%eax
  404dbf:	50                   	push   %eax
  404dc0:	57                   	push   %edi
  404dc1:	8b ce                	mov    %esi,%ecx
  404dc3:	e8 b8 f9 ff ff       	call   0x404780
  404dc8:	5f                   	pop    %edi
  404dc9:	5e                   	pop    %esi
  404dca:	c2 04 00             	ret    $0x4
  404dcd:	cc                   	int3
  404dce:	cc                   	int3
  404dcf:	cc                   	int3
  404dd0:	56                   	push   %esi
  404dd1:	8b f1                	mov    %ecx,%esi
  404dd3:	8b 06                	mov    (%esi),%eax
  404dd5:	85 c0                	test   %eax,%eax
  404dd7:	74 09                	je     0x404de2
  404dd9:	50                   	push   %eax
  404dda:	e8 81 0a 00 00       	call   0x405860
  404ddf:	83 c4 04             	add    $0x4,%esp
  404de2:	8b 54 24 08          	mov    0x8(%esp),%edx
  404de6:	85 d2                	test   %edx,%edx
  404de8:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  404dee:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
  404df5:	c7 46 08 00 00 00 00 	movl   $0x0,0x8(%esi)
  404dfc:	74 19                	je     0x404e17
  404dfe:	8b c2                	mov    %edx,%eax
  404e00:	57                   	push   %edi
  404e01:	8d 78 01             	lea    0x1(%eax),%edi
  404e04:	8a 08                	mov    (%eax),%cl
  404e06:	40                   	inc    %eax
  404e07:	84 c9                	test   %cl,%cl
  404e09:	75 f9                	jne    0x404e04
  404e0b:	2b c7                	sub    %edi,%eax
  404e0d:	50                   	push   %eax
  404e0e:	52                   	push   %edx
  404e0f:	8b ce                	mov    %esi,%ecx
  404e11:	e8 6a f9 ff ff       	call   0x404780
  404e16:	5f                   	pop    %edi
  404e17:	5e                   	pop    %esi
  404e18:	c2 04 00             	ret    $0x4
  404e1b:	cc                   	int3
  404e1c:	cc                   	int3
  404e1d:	cc                   	int3
  404e1e:	cc                   	int3
  404e1f:	cc                   	int3
  404e20:	51                   	push   %ecx
  404e21:	55                   	push   %ebp
  404e22:	8b e9                	mov    %ecx,%ebp
  404e24:	8b 55 04             	mov    0x4(%ebp),%edx
  404e27:	33 c0                	xor    %eax,%eax
  404e29:	83 fa 01             	cmp    $0x1,%edx
  404e2c:	0f 8c b1 02 00 00    	jl     0x4050e3
  404e32:	85 d2                	test   %edx,%edx
  404e34:	53                   	push   %ebx
  404e35:	56                   	push   %esi
  404e36:	57                   	push   %edi
  404e37:	89 44 24 10          	mov    %eax,0x10(%esp)
  404e3b:	7e 72                	jle    0x404eaf
  404e3d:	8b 7d 00             	mov    0x0(%ebp),%edi
  404e40:	8a 1c 07             	mov    (%edi,%eax,1),%bl
  404e43:	80 fb 20             	cmp    $0x20,%bl
  404e46:	7f 0c                	jg     0x404e54
  404e48:	84 db                	test   %bl,%bl
  404e4a:	7c 08                	jl     0x404e54
  404e4c:	8b 4d 04             	mov    0x4(%ebp),%ecx
  404e4f:	40                   	inc    %eax
  404e50:	3b c1                	cmp    %ecx,%eax
  404e52:	7c ec                	jl     0x404e40
  404e54:	85 c0                	test   %eax,%eax
  404e56:	74 5b                	je     0x404eb3
  404e58:	8b 4d 04             	mov    0x4(%ebp),%ecx
  404e5b:	85 c9                	test   %ecx,%ecx
  404e5d:	7e 3e                	jle    0x404e9d
  404e5f:	85 ff                	test   %edi,%edi
  404e61:	74 3a                	je     0x404e9d
  404e63:	3b c1                	cmp    %ecx,%eax
  404e65:	7c 09                	jl     0x404e70
  404e67:	8b cd                	mov    %ebp,%ecx
  404e69:	e8 42 c7 ff ff       	call   0x4015b0
  404e6e:	eb 2d                	jmp    0x404e9d
  404e70:	83 f8 01             	cmp    $0x1,%eax
  404e73:	7c 28                	jl     0x404e9d
  404e75:	2b c8                	sub    %eax,%ecx
  404e77:	85 c9                	test   %ecx,%ecx
  404e79:	7e 11                	jle    0x404e8c
  404e7b:	8b d1                	mov    %ecx,%edx
  404e7d:	c1 e9 02             	shr    $0x2,%ecx
  404e80:	8d 34 07             	lea    (%edi,%eax,1),%esi
  404e83:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  404e85:	8b ca                	mov    %edx,%ecx
  404e87:	83 e1 03             	and    $0x3,%ecx
  404e8a:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  404e8c:	8b 4d 04             	mov    0x4(%ebp),%ecx
  404e8f:	2b c8                	sub    %eax,%ecx
  404e91:	89 4d 04             	mov    %ecx,0x4(%ebp)
  404e94:	8b c1                	mov    %ecx,%eax
  404e96:	8b 4d 00             	mov    0x0(%ebp),%ecx
  404e99:	c6 04 08 00          	movb   $0x0,(%eax,%ecx,1)
  404e9d:	8b 55 04             	mov    0x4(%ebp),%edx
  404ea0:	83 fa 01             	cmp    $0x1,%edx
  404ea3:	7d 0e                	jge    0x404eb3
  404ea5:	5f                   	pop    %edi
  404ea6:	5e                   	pop    %esi
  404ea7:	5b                   	pop    %ebx
  404ea8:	33 c0                	xor    %eax,%eax
  404eaa:	5d                   	pop    %ebp
  404eab:	59                   	pop    %ecx
  404eac:	c2 10 00             	ret    $0x10
  404eaf:	8a 5c 24 1c          	mov    0x1c(%esp),%bl
  404eb3:	80 fb 27             	cmp    $0x27,%bl
  404eb6:	0f 84 3b 01 00 00    	je     0x404ff7
  404ebc:	80 fb 22             	cmp    $0x22,%bl
  404ebf:	0f 84 32 01 00 00    	je     0x404ff7
  404ec5:	33 db                	xor    %ebx,%ebx
  404ec7:	85 d2                	test   %edx,%edx
  404ec9:	7e 41                	jle    0x404f0c
  404ecb:	8b 7d 00             	mov    0x0(%ebp),%edi
  404ece:	8a 4c 24 1c          	mov    0x1c(%esp),%cl
  404ed2:	8b 74 24 10          	mov    0x10(%esp),%esi
  404ed6:	8a 04 1f             	mov    (%edi,%ebx,1),%al
  404ed9:	3c 7b                	cmp    $0x7b,%al
  404edb:	75 05                	jne    0x404ee2
  404edd:	3a c8                	cmp    %al,%cl
  404edf:	74 01                	je     0x404ee2
  404ee1:	46                   	inc    %esi
  404ee2:	3c 7d                	cmp    $0x7d,%al
  404ee4:	75 03                	jne    0x404ee9
  404ee6:	4e                   	dec    %esi
  404ee7:	79 1b                	jns    0x404f04
  404ee9:	83 fe 01             	cmp    $0x1,%esi
  404eec:	7d 16                	jge    0x404f04
  404eee:	3a c1                	cmp    %cl,%al
  404ef0:	74 1a                	je     0x404f0c
  404ef2:	84 c0                	test   %al,%al
  404ef4:	7e 04                	jle    0x404efa
  404ef6:	3c 20                	cmp    $0x20,%al
  404ef8:	7c 12                	jl     0x404f0c
  404efa:	3a 44 24 20          	cmp    0x20(%esp),%al
  404efe:	74 0c                	je     0x404f0c
  404f00:	8a 4c 24 1c          	mov    0x1c(%esp),%cl
  404f04:	8b 45 04             	mov    0x4(%ebp),%eax
  404f07:	43                   	inc    %ebx
  404f08:	3b d8                	cmp    %eax,%ebx
  404f0a:	7c ca                	jl     0x404ed6
  404f0c:	3b da                	cmp    %edx,%ebx
  404f0e:	7c 6b                	jl     0x404f7b
  404f10:	8b 44 24 24          	mov    0x24(%esp),%eax
  404f14:	85 c0                	test   %eax,%eax
  404f16:	75 8d                	jne    0x404ea5
  404f18:	8b 74 24 18          	mov    0x18(%esp),%esi
  404f1c:	8b 06                	mov    (%esi),%eax
  404f1e:	85 c0                	test   %eax,%eax
  404f20:	8b 7d 00             	mov    0x0(%ebp),%edi
  404f23:	74 09                	je     0x404f2e
  404f25:	50                   	push   %eax
  404f26:	e8 35 09 00 00       	call   0x405860
  404f2b:	83 c4 04             	add    $0x4,%esp
  404f2e:	33 c0                	xor    %eax,%eax
  404f30:	3b f8                	cmp    %eax,%edi
  404f32:	89 06                	mov    %eax,(%esi)
  404f34:	89 46 04             	mov    %eax,0x4(%esi)
  404f37:	89 46 08             	mov    %eax,0x8(%esi)
  404f3a:	74 17                	je     0x404f53
  404f3c:	8b c7                	mov    %edi,%eax
  404f3e:	8d 50 01             	lea    0x1(%eax),%edx
  404f41:	8a 08                	mov    (%eax),%cl
  404f43:	40                   	inc    %eax
  404f44:	84 c9                	test   %cl,%cl
  404f46:	75 f9                	jne    0x404f41
  404f48:	2b c2                	sub    %edx,%eax
  404f4a:	50                   	push   %eax
  404f4b:	57                   	push   %edi
  404f4c:	8b ce                	mov    %esi,%ecx
  404f4e:	e8 2d f8 ff ff       	call   0x404780
  404f53:	8b 45 00             	mov    0x0(%ebp),%eax
  404f56:	85 c0                	test   %eax,%eax
  404f58:	74 09                	je     0x404f63
  404f5a:	50                   	push   %eax
  404f5b:	e8 00 09 00 00       	call   0x405860
  404f60:	83 c4 04             	add    $0x4,%esp
  404f63:	5f                   	pop    %edi
  404f64:	33 c0                	xor    %eax,%eax
  404f66:	5e                   	pop    %esi
  404f67:	89 45 00             	mov    %eax,0x0(%ebp)
  404f6a:	89 45 04             	mov    %eax,0x4(%ebp)
  404f6d:	89 45 08             	mov    %eax,0x8(%ebp)
  404f70:	5b                   	pop    %ebx
  404f71:	b8 01 00 00 00       	mov    $0x1,%eax
  404f76:	5d                   	pop    %ebp
  404f77:	59                   	pop    %ecx
  404f78:	c2 10 00             	ret    $0x10
  404f7b:	8b 55 00             	mov    0x0(%ebp),%edx
  404f7e:	8b 74 24 18          	mov    0x18(%esp),%esi
  404f82:	c6 04 13 00          	movb   $0x0,(%ebx,%edx,1)
  404f86:	8b 06                	mov    (%esi),%eax
  404f88:	85 c0                	test   %eax,%eax
  404f8a:	8b 7d 00             	mov    0x0(%ebp),%edi
  404f8d:	74 09                	je     0x404f98
  404f8f:	50                   	push   %eax
  404f90:	e8 cb 08 00 00       	call   0x405860
  404f95:	83 c4 04             	add    $0x4,%esp
  404f98:	33 c0                	xor    %eax,%eax
  404f9a:	3b f8                	cmp    %eax,%edi
  404f9c:	89 06                	mov    %eax,(%esi)
  404f9e:	89 46 04             	mov    %eax,0x4(%esi)
  404fa1:	89 46 08             	mov    %eax,0x8(%esi)
  404fa4:	74 1c                	je     0x404fc2
  404fa6:	8b c7                	mov    %edi,%eax
  404fa8:	8d 50 01             	lea    0x1(%eax),%edx
  404fab:	eb 03                	jmp    0x404fb0
  404fad:	8d 49 00             	lea    0x0(%ecx),%ecx
  404fb0:	8a 08                	mov    (%eax),%cl
  404fb2:	40                   	inc    %eax
  404fb3:	84 c9                	test   %cl,%cl
  404fb5:	75 f9                	jne    0x404fb0
  404fb7:	2b c2                	sub    %edx,%eax
  404fb9:	50                   	push   %eax
  404fba:	57                   	push   %edi
  404fbb:	8b ce                	mov    %esi,%ecx
  404fbd:	e8 be f7 ff ff       	call   0x404780
  404fc2:	8b 4d 04             	mov    0x4(%ebp),%ecx
  404fc5:	85 c9                	test   %ecx,%ecx
  404fc7:	8d 43 01             	lea    0x1(%ebx),%eax
  404fca:	0f 8e 0b 01 00 00    	jle    0x4050db
  404fd0:	8b 7d 00             	mov    0x0(%ebp),%edi
  404fd3:	85 ff                	test   %edi,%edi
  404fd5:	0f 84 00 01 00 00    	je     0x4050db
  404fdb:	3b c1                	cmp    %ecx,%eax
  404fdd:	0f 8c cb 00 00 00    	jl     0x4050ae
  404fe3:	8b cd                	mov    %ebp,%ecx
  404fe5:	e8 c6 c5 ff ff       	call   0x4015b0
  404fea:	5f                   	pop    %edi
  404feb:	5e                   	pop    %esi
  404fec:	5b                   	pop    %ebx
  404fed:	b8 01 00 00 00       	mov    $0x1,%eax
  404ff2:	5d                   	pop    %ebp
  404ff3:	59                   	pop    %ecx
  404ff4:	c2 10 00             	ret    $0x10
  404ff7:	be 01 00 00 00       	mov    $0x1,%esi
  404ffc:	33 c9                	xor    %ecx,%ecx
  404ffe:	3b d6                	cmp    %esi,%edx
  405000:	7e 21                	jle    0x405023
  405002:	8b 7d 00             	mov    0x0(%ebp),%edi
  405005:	8a 04 37             	mov    (%edi,%esi,1),%al
  405008:	3c 5c                	cmp    $0x5c,%al
  40500a:	75 07                	jne    0x405013
  40500c:	3b ce                	cmp    %esi,%ecx
  40500e:	74 03                	je     0x405013
  405010:	8d 4e 01             	lea    0x1(%esi),%ecx
  405013:	3a c3                	cmp    %bl,%al
  405015:	75 04                	jne    0x40501b
  405017:	3b ce                	cmp    %esi,%ecx
  405019:	75 08                	jne    0x405023
  40501b:	8b 45 04             	mov    0x4(%ebp),%eax
  40501e:	46                   	inc    %esi
  40501f:	3b f0                	cmp    %eax,%esi
  405021:	7c e2                	jl     0x405005
  405023:	8b 55 00             	mov    0x0(%ebp),%edx
  405026:	8b 5c 24 18          	mov    0x18(%esp),%ebx
  40502a:	c6 04 16 00          	movb   $0x0,(%esi,%edx,1)
  40502e:	8b 7d 00             	mov    0x0(%ebp),%edi
  405031:	8b 03                	mov    (%ebx),%eax
  405033:	47                   	inc    %edi
  405034:	85 c0                	test   %eax,%eax
  405036:	74 09                	je     0x405041
  405038:	50                   	push   %eax
  405039:	e8 22 08 00 00       	call   0x405860
  40503e:	83 c4 04             	add    $0x4,%esp
  405041:	33 c0                	xor    %eax,%eax
  405043:	3b f8                	cmp    %eax,%edi
  405045:	89 03                	mov    %eax,(%ebx)
  405047:	89 43 04             	mov    %eax,0x4(%ebx)
  40504a:	89 43 08             	mov    %eax,0x8(%ebx)
  40504d:	74 17                	je     0x405066
  40504f:	8b c7                	mov    %edi,%eax
  405051:	8d 50 01             	lea    0x1(%eax),%edx
  405054:	8a 08                	mov    (%eax),%cl
  405056:	40                   	inc    %eax
  405057:	84 c9                	test   %cl,%cl
  405059:	75 f9                	jne    0x405054
  40505b:	2b c2                	sub    %edx,%eax
  40505d:	50                   	push   %eax
  40505e:	57                   	push   %edi
  40505f:	8b cb                	mov    %ebx,%ecx
  405061:	e8 1a f7 ff ff       	call   0x404780
  405066:	8b 45 04             	mov    0x4(%ebp),%eax
  405069:	46                   	inc    %esi
  40506a:	3b f0                	cmp    %eax,%esi
  40506c:	7d 25                	jge    0x405093
  40506e:	8b 4d 00             	mov    0x0(%ebp),%ecx
  405071:	8a 5c 24 20          	mov    0x20(%esp),%bl
  405075:	8a 54 24 1c          	mov    0x1c(%esp),%dl
  405079:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
  405080:	8a 04 31             	mov    (%ecx,%esi,1),%al
  405083:	3a c2                	cmp    %dl,%al
  405085:	74 0c                	je     0x405093
  405087:	3a c3                	cmp    %bl,%al
  405089:	74 08                	je     0x405093
  40508b:	8b 45 04             	mov    0x4(%ebp),%eax
  40508e:	46                   	inc    %esi
  40508f:	3b f0                	cmp    %eax,%esi
  405091:	7c ed                	jl     0x405080
  405093:	8b 4d 04             	mov    0x4(%ebp),%ecx
  405096:	85 c9                	test   %ecx,%ecx
  405098:	8d 46 01             	lea    0x1(%esi),%eax
  40509b:	7e 3e                	jle    0x4050db
  40509d:	8b 7d 00             	mov    0x0(%ebp),%edi
  4050a0:	85 ff                	test   %edi,%edi
  4050a2:	74 37                	je     0x4050db
  4050a4:	3b c1                	cmp    %ecx,%eax
  4050a6:	7c 06                	jl     0x4050ae
  4050a8:	57                   	push   %edi
  4050a9:	e9 ad fe ff ff       	jmp    0x404f5b
  4050ae:	83 f8 01             	cmp    $0x1,%eax
  4050b1:	7c 28                	jl     0x4050db
  4050b3:	2b c8                	sub    %eax,%ecx
  4050b5:	85 c9                	test   %ecx,%ecx
  4050b7:	7e 11                	jle    0x4050ca
  4050b9:	8b d1                	mov    %ecx,%edx
  4050bb:	c1 e9 02             	shr    $0x2,%ecx
  4050be:	8d 34 07             	lea    (%edi,%eax,1),%esi
  4050c1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  4050c3:	8b ca                	mov    %edx,%ecx
  4050c5:	83 e1 03             	and    $0x3,%ecx
  4050c8:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  4050ca:	8b 4d 04             	mov    0x4(%ebp),%ecx
  4050cd:	2b c8                	sub    %eax,%ecx
  4050cf:	89 4d 04             	mov    %ecx,0x4(%ebp)
  4050d2:	8b c1                	mov    %ecx,%eax
  4050d4:	8b 4d 00             	mov    0x0(%ebp),%ecx
  4050d7:	c6 04 08 00          	movb   $0x0,(%eax,%ecx,1)
  4050db:	5f                   	pop    %edi
  4050dc:	5e                   	pop    %esi
  4050dd:	b8 01 00 00 00       	mov    $0x1,%eax
  4050e2:	5b                   	pop    %ebx
  4050e3:	5d                   	pop    %ebp
  4050e4:	59                   	pop    %ecx
  4050e5:	c2 10 00             	ret    $0x10
  4050e8:	cc                   	int3
  4050e9:	cc                   	int3
  4050ea:	cc                   	int3
  4050eb:	cc                   	int3
  4050ec:	cc                   	int3
  4050ed:	cc                   	int3
  4050ee:	cc                   	int3
  4050ef:	cc                   	int3
  4050f0:	6a ff                	push   $0xffffffff
  4050f2:	68 18 c3 40 00       	push   $0x40c318
  4050f7:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
  4050fd:	50                   	push   %eax
  4050fe:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
  405105:	83 ec 0c             	sub    $0xc,%esp
  405108:	53                   	push   %ebx
  405109:	33 db                	xor    %ebx,%ebx
  40510b:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  40510f:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  405113:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  405117:	8b 44 24 24          	mov    0x24(%esp),%eax
  40511b:	53                   	push   %ebx
  40511c:	53                   	push   %ebx
  40511d:	50                   	push   %eax
  40511e:	8d 54 24 10          	lea    0x10(%esp),%edx
  405122:	52                   	push   %edx
  405123:	89 5c 24 28          	mov    %ebx,0x28(%esp)
  405127:	e8 f4 fc ff ff       	call   0x404e20
  40512c:	85 c0                	test   %eax,%eax
  40512e:	75 2f                	jne    0x40515f
  405130:	8b 44 24 04          	mov    0x4(%esp),%eax
  405134:	3b c3                	cmp    %ebx,%eax
  405136:	c7 44 24 18 ff ff ff 	movl   $0xffffffff,0x18(%esp)
  40513d:	ff 
  40513e:	74 09                	je     0x405149
  405140:	50                   	push   %eax
  405141:	e8 1a 07 00 00       	call   0x405860
  405146:	83 c4 04             	add    $0x4,%esp
  405149:	8b 44 24 20          	mov    0x20(%esp),%eax
  40514d:	5b                   	pop    %ebx
  40514e:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  405152:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  405159:	83 c4 18             	add    $0x18,%esp
  40515c:	c2 08 00             	ret    $0x8
  40515f:	8b 44 24 08          	mov    0x8(%esp),%eax
  405163:	83 f8 02             	cmp    $0x2,%eax
  405166:	56                   	push   %esi
  405167:	8b 74 24 08          	mov    0x8(%esp),%esi
  40516b:	57                   	push   %edi
  40516c:	0f 8e 94 00 00 00    	jle    0x405206
  405172:	3b c3                	cmp    %ebx,%eax
  405174:	0f 8e 8c 00 00 00    	jle    0x405206
  40517a:	3b f3                	cmp    %ebx,%esi
  40517c:	0f 84 84 00 00 00    	je     0x405206
  405182:	80 3e 23             	cmpb   $0x23,(%esi)
  405185:	75 2b                	jne    0x4051b2
  405187:	83 f8 01             	cmp    $0x1,%eax
  40518a:	8b c6                	mov    %esi,%eax
  40518c:	7d 05                	jge    0x405193
  40518e:	a1 40 04 41 00       	mov    0x410440,%eax
  405193:	40                   	inc    %eax
  405194:	50                   	push   %eax
  405195:	e8 96 f9 ff ff       	call   0x404b30
  40519a:	56                   	push   %esi
  40519b:	8b f8                	mov    %eax,%edi
  40519d:	c7 44 24 28 ff ff ff 	movl   $0xffffffff,0x28(%esp)
  4051a4:	ff 
  4051a5:	e8 b6 06 00 00       	call   0x405860
  4051aa:	83 c4 08             	add    $0x8,%esp
  4051ad:	e9 84 00 00 00       	jmp    0x405236
  4051b2:	3b f3                	cmp    %ebx,%esi
  4051b4:	74 50                	je     0x405206
  4051b6:	80 3e 30             	cmpb   $0x30,(%esi)
  4051b9:	75 4b                	jne    0x405206
  4051bb:	83 f8 01             	cmp    $0x1,%eax
  4051be:	7e 49                	jle    0x405209
  4051c0:	80 7e 01 78          	cmpb   $0x78,0x1(%esi)
  4051c4:	75 40                	jne    0x405206
  4051c6:	83 f8 01             	cmp    $0x1,%eax
  4051c9:	7d 06                	jge    0x4051d1
  4051cb:	8b 35 40 04 41 00    	mov    0x410440,%esi
  4051d1:	83 c6 02             	add    $0x2,%esi
  4051d4:	56                   	push   %esi
  4051d5:	e8 56 f9 ff ff       	call   0x404b30
  4051da:	83 c4 04             	add    $0x4,%esp
  4051dd:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
  4051e1:	8b f0                	mov    %eax,%esi
  4051e3:	c7 44 24 20 ff ff ff 	movl   $0xffffffff,0x20(%esp)
  4051ea:	ff 
  4051eb:	e8 c0 c3 ff ff       	call   0x4015b0
  4051f0:	5f                   	pop    %edi
  4051f1:	8b c6                	mov    %esi,%eax
  4051f3:	5e                   	pop    %esi
  4051f4:	5b                   	pop    %ebx
  4051f5:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  4051f9:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  405200:	83 c4 18             	add    $0x18,%esp
  405203:	c2 08 00             	ret    $0x8
  405206:	83 f8 01             	cmp    $0x1,%eax
  405209:	7c 06                	jl     0x405211
  40520b:	3b f3                	cmp    %ebx,%esi
  40520d:	8b c6                	mov    %esi,%eax
  40520f:	75 05                	jne    0x405216
  405211:	a1 40 04 41 00       	mov    0x410440,%eax
  405216:	50                   	push   %eax
  405217:	e8 94 f8 ff ff       	call   0x404ab0
  40521c:	83 c4 04             	add    $0x4,%esp
  40521f:	3b f3                	cmp    %ebx,%esi
  405221:	8b f8                	mov    %eax,%edi
  405223:	c7 44 24 20 ff ff ff 	movl   $0xffffffff,0x20(%esp)
  40522a:	ff 
  40522b:	74 09                	je     0x405236
  40522d:	56                   	push   %esi
  40522e:	e8 2d 06 00 00       	call   0x405860
  405233:	83 c4 04             	add    $0x4,%esp
  405236:	8b 4c 24 18          	mov    0x18(%esp),%ecx
  40523a:	8b c7                	mov    %edi,%eax
  40523c:	5f                   	pop    %edi
  40523d:	5e                   	pop    %esi
  40523e:	5b                   	pop    %ebx
  40523f:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  405246:	83 c4 18             	add    $0x18,%esp
  405249:	c2 08 00             	ret    $0x8
  40524c:	cc                   	int3
  40524d:	cc                   	int3
  40524e:	cc                   	int3
  40524f:	cc                   	int3
  405250:	6a ff                	push   $0xffffffff
  405252:	68 51 c3 40 00       	push   $0x40c351
  405257:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
  40525d:	50                   	push   %eax
  40525e:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
  405265:	83 ec 10             	sub    $0x10,%esp
  405268:	55                   	push   %ebp
  405269:	33 ed                	xor    %ebp,%ebp
  40526b:	89 6c 24 04          	mov    %ebp,0x4(%esp)
  40526f:	57                   	push   %edi
  405270:	8b f9                	mov    %ecx,%edi
  405272:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
  405276:	89 6c 24 10          	mov    %ebp,0x10(%esp)
  40527a:	89 6c 24 14          	mov    %ebp,0x14(%esp)
  40527e:	8b 57 04             	mov    0x4(%edi),%edx
  405281:	83 fa 01             	cmp    $0x1,%edx
  405284:	c7 44 24 20 01 00 00 	movl   $0x1,0x20(%esp)
  40528b:	00 
  40528c:	7d 1f                	jge    0x4052ad
  40528e:	8b 44 24 28          	mov    0x28(%esp),%eax
  405292:	89 28                	mov    %ebp,(%eax)
  405294:	89 68 04             	mov    %ebp,0x4(%eax)
  405297:	89 68 08             	mov    %ebp,0x8(%eax)
  40529a:	5f                   	pop    %edi
  40529b:	5d                   	pop    %ebp
  40529c:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  4052a0:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  4052a7:	83 c4 1c             	add    $0x1c,%esp
  4052aa:	c2 0c 00             	ret    $0xc
  4052ad:	8b 44 24 2c          	mov    0x2c(%esp),%eax
  4052b1:	3b c5                	cmp    %ebp,%eax
  4052b3:	7d 02                	jge    0x4052b7
  4052b5:	33 c0                	xor    %eax,%eax
  4052b7:	8b 4c 24 30          	mov    0x30(%esp),%ecx
  4052bb:	83 f9 ff             	cmp    $0xffffffff,%ecx
  4052be:	75 04                	jne    0x4052c4
  4052c0:	8b ca                	mov    %edx,%ecx
  4052c2:	2b c8                	sub    %eax,%ecx
  4052c4:	56                   	push   %esi
  4052c5:	8d 34 08             	lea    (%eax,%ecx,1),%esi
  4052c8:	3b f2                	cmp    %edx,%esi
  4052ca:	7e 04                	jle    0x4052d0
  4052cc:	2b d0                	sub    %eax,%edx
  4052ce:	8b ca                	mov    %edx,%ecx
  4052d0:	3b cd                	cmp    %ebp,%ecx
  4052d2:	7f 12                	jg     0x4052e6
  4052d4:	8b 74 24 2c          	mov    0x2c(%esp),%esi
  4052d8:	8d 44 24 10          	lea    0x10(%esp),%eax
  4052dc:	50                   	push   %eax
  4052dd:	8b ce                	mov    %esi,%ecx
  4052df:	e8 9c f9 ff ff       	call   0x404c80
  4052e4:	eb 4f                	jmp    0x405335
  4052e6:	8d 34 08             	lea    (%eax,%ecx,1),%esi
  4052e9:	8b 0f                	mov    (%edi),%ecx
  4052eb:	03 ce                	add    %esi,%ecx
  4052ed:	53                   	push   %ebx
  4052ee:	8a 19                	mov    (%ecx),%bl
  4052f0:	c6 01 00             	movb   $0x0,(%ecx)
  4052f3:	8b 17                	mov    (%edi),%edx
  4052f5:	03 d0                	add    %eax,%edx
  4052f7:	52                   	push   %edx
  4052f8:	8d 4c 24 18          	lea    0x18(%esp),%ecx
  4052fc:	e8 cf fa ff ff       	call   0x404dd0
  405301:	8b 07                	mov    (%edi),%eax
  405303:	88 1c 06             	mov    %bl,(%esi,%eax,1)
  405306:	8b 74 24 30          	mov    0x30(%esp),%esi
  40530a:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  40530e:	51                   	push   %ecx
  40530f:	8b ce                	mov    %esi,%ecx
  405311:	e8 6a f9 ff ff       	call   0x404c80
  405316:	8b 44 24 14          	mov    0x14(%esp),%eax
  40531a:	3b c5                	cmp    %ebp,%eax
  40531c:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
  405323:	00 
  405324:	c6 44 24 28 00       	movb   $0x0,0x28(%esp)
  405329:	5b                   	pop    %ebx
  40532a:	74 09                	je     0x405335
  40532c:	50                   	push   %eax
  40532d:	e8 2e 05 00 00       	call   0x405860
  405332:	83 c4 04             	add    $0x4,%esp
  405335:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
  405339:	8b c6                	mov    %esi,%eax
  40533b:	5e                   	pop    %esi
  40533c:	5f                   	pop    %edi
  40533d:	5d                   	pop    %ebp
  40533e:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  405345:	83 c4 1c             	add    $0x1c,%esp
  405348:	c2 0c 00             	ret    $0xc
  40534b:	cc                   	int3
  40534c:	cc                   	int3
  40534d:	cc                   	int3
  40534e:	cc                   	int3
  40534f:	cc                   	int3
  405350:	8b c1                	mov    %ecx,%eax
  405352:	33 c9                	xor    %ecx,%ecx
  405354:	c7 00 e4 d5 40 00    	movl   $0x40d5e4,(%eax)
  40535a:	89 48 04             	mov    %ecx,0x4(%eax)
  40535d:	89 48 08             	mov    %ecx,0x8(%eax)
  405360:	89 48 0c             	mov    %ecx,0xc(%eax)
  405363:	c3                   	ret
  405364:	cc                   	int3
  405365:	cc                   	int3
  405366:	cc                   	int3
  405367:	cc                   	int3
  405368:	cc                   	int3
  405369:	cc                   	int3
  40536a:	cc                   	int3
  40536b:	cc                   	int3
  40536c:	cc                   	int3
  40536d:	cc                   	int3
  40536e:	cc                   	int3
  40536f:	cc                   	int3
  405370:	53                   	push   %ebx
  405371:	56                   	push   %esi
  405372:	8b 74 24 0c          	mov    0xc(%esp),%esi
  405376:	85 f6                	test   %esi,%esi
  405378:	8b d9                	mov    %ecx,%ebx
  40537a:	75 07                	jne    0x405383
  40537c:	5e                   	pop    %esi
  40537d:	33 c0                	xor    %eax,%eax
  40537f:	5b                   	pop    %ebx
  405380:	c2 04 00             	ret    $0x4
  405383:	8b 43 0c             	mov    0xc(%ebx),%eax
  405386:	85 c0                	test   %eax,%eax
  405388:	75 17                	jne    0x4053a1
  40538a:	68 c8 00 00 00       	push   $0xc8
  40538f:	c7 43 08 32 00 00 00 	movl   $0x32,0x8(%ebx)
  405396:	e8 b2 09 00 00       	call   0x405d4d
  40539b:	83 c4 04             	add    $0x4,%esp
  40539e:	89 43 0c             	mov    %eax,0xc(%ebx)
  4053a1:	8b 43 08             	mov    0x8(%ebx),%eax
  4053a4:	8b 53 04             	mov    0x4(%ebx),%edx
  4053a7:	8d 48 ff             	lea    -0x1(%eax),%ecx
  4053aa:	3b d1                	cmp    %ecx,%edx
  4053ac:	7c 45                	jl     0x4053f3
  4053ae:	83 c0 32             	add    $0x32,%eax
  4053b1:	55                   	push   %ebp
  4053b2:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  4053b9:	57                   	push   %edi
  4053ba:	52                   	push   %edx
  4053bb:	89 43 08             	mov    %eax,0x8(%ebx)
  4053be:	e8 8a 09 00 00       	call   0x405d4d
  4053c3:	8b 4b 04             	mov    0x4(%ebx),%ecx
  4053c6:	8b 73 0c             	mov    0xc(%ebx),%esi
  4053c9:	c1 e1 02             	shl    $0x2,%ecx
  4053cc:	8b e8                	mov    %eax,%ebp
  4053ce:	8b c1                	mov    %ecx,%eax
  4053d0:	c1 e9 02             	shr    $0x2,%ecx
  4053d3:	8b fd                	mov    %ebp,%edi
  4053d5:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  4053d7:	8b c8                	mov    %eax,%ecx
  4053d9:	83 e1 03             	and    $0x3,%ecx
  4053dc:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  4053de:	8b 4b 0c             	mov    0xc(%ebx),%ecx
  4053e1:	51                   	push   %ecx
  4053e2:	e8 79 04 00 00       	call   0x405860
  4053e7:	8b 74 24 1c          	mov    0x1c(%esp),%esi
  4053eb:	83 c4 08             	add    $0x8,%esp
  4053ee:	5f                   	pop    %edi
  4053ef:	89 6b 0c             	mov    %ebp,0xc(%ebx)
  4053f2:	5d                   	pop    %ebp
  4053f3:	8b c6                	mov    %esi,%eax
  4053f5:	8d 50 01             	lea    0x1(%eax),%edx
  4053f8:	8a 08                	mov    (%eax),%cl
  4053fa:	40                   	inc    %eax
  4053fb:	84 c9                	test   %cl,%cl
  4053fd:	75 f9                	jne    0x4053f8
  4053ff:	2b c2                	sub    %edx,%eax
  405401:	83 c0 02             	add    $0x2,%eax
  405404:	50                   	push   %eax
  405405:	e8 43 09 00 00       	call   0x405d4d
  40540a:	8b 53 04             	mov    0x4(%ebx),%edx
  40540d:	8b 4b 0c             	mov    0xc(%ebx),%ecx
  405410:	89 04 91             	mov    %eax,(%ecx,%edx,4)
  405413:	8b 53 04             	mov    0x4(%ebx),%edx
  405416:	8b 43 0c             	mov    0xc(%ebx),%eax
  405419:	8b 14 90             	mov    (%eax,%edx,4),%edx
  40541c:	83 c4 04             	add    $0x4,%esp
  40541f:	8b ce                	mov    %esi,%ecx
  405421:	8a 01                	mov    (%ecx),%al
  405423:	41                   	inc    %ecx
  405424:	88 02                	mov    %al,(%edx)
  405426:	42                   	inc    %edx
  405427:	84 c0                	test   %al,%al
  405429:	75 f6                	jne    0x405421
  40542b:	ff 43 04             	incl   0x4(%ebx)
  40542e:	5e                   	pop    %esi
  40542f:	b8 01 00 00 00       	mov    $0x1,%eax
  405434:	5b                   	pop    %ebx
  405435:	c2 04 00             	ret    $0x4
  405438:	cc                   	int3
  405439:	cc                   	int3
  40543a:	cc                   	int3
  40543b:	cc                   	int3
  40543c:	cc                   	int3
  40543d:	cc                   	int3
  40543e:	cc                   	int3
  40543f:	cc                   	int3
  405440:	53                   	push   %ebx
  405441:	56                   	push   %esi
  405442:	8b f1                	mov    %ecx,%esi
  405444:	8b 46 0c             	mov    0xc(%esi),%eax
  405447:	33 db                	xor    %ebx,%ebx
  405449:	3b c3                	cmp    %ebx,%eax
  40544b:	74 31                	je     0x40547e
  40544d:	8b 46 04             	mov    0x4(%esi),%eax
  405450:	57                   	push   %edi
  405451:	33 ff                	xor    %edi,%edi
  405453:	3b c3                	cmp    %ebx,%eax
  405455:	7e 17                	jle    0x40546e
  405457:	8b 46 0c             	mov    0xc(%esi),%eax
  40545a:	8b 0c b8             	mov    (%eax,%edi,4),%ecx
  40545d:	51                   	push   %ecx
  40545e:	e8 fd 03 00 00       	call   0x405860
  405463:	8b 46 04             	mov    0x4(%esi),%eax
  405466:	83 c4 04             	add    $0x4,%esp
  405469:	47                   	inc    %edi
  40546a:	3b f8                	cmp    %eax,%edi
  40546c:	7c e9                	jl     0x405457
  40546e:	8b 56 0c             	mov    0xc(%esi),%edx
  405471:	52                   	push   %edx
  405472:	e8 e9 03 00 00       	call   0x405860
  405477:	83 c4 04             	add    $0x4,%esp
  40547a:	89 5e 0c             	mov    %ebx,0xc(%esi)
  40547d:	5f                   	pop    %edi
  40547e:	89 5e 08             	mov    %ebx,0x8(%esi)
  405481:	89 5e 04             	mov    %ebx,0x4(%esi)
  405484:	5e                   	pop    %esi
  405485:	5b                   	pop    %ebx
  405486:	c3                   	ret
  405487:	cc                   	int3
  405488:	cc                   	int3
  405489:	cc                   	int3
  40548a:	cc                   	int3
  40548b:	cc                   	int3
  40548c:	cc                   	int3
  40548d:	cc                   	int3
  40548e:	cc                   	int3
  40548f:	cc                   	int3
  405490:	8b 44 24 04          	mov    0x4(%esp),%eax
  405494:	85 c0                	test   %eax,%eax
  405496:	7c 0e                	jl     0x4054a6
  405498:	3b 41 04             	cmp    0x4(%ecx),%eax
  40549b:	7d 09                	jge    0x4054a6
  40549d:	8b 49 0c             	mov    0xc(%ecx),%ecx
  4054a0:	8b 04 81             	mov    (%ecx,%eax,4),%eax
  4054a3:	c2 04 00             	ret    $0x4
  4054a6:	33 c0                	xor    %eax,%eax
  4054a8:	c2 04 00             	ret    $0x4
  4054ab:	cc                   	int3
  4054ac:	cc                   	int3
  4054ad:	cc                   	int3
  4054ae:	cc                   	int3
  4054af:	cc                   	int3
  4054b0:	8b 41 04             	mov    0x4(%ecx),%eax
  4054b3:	c3                   	ret
  4054b4:	cc                   	int3
  4054b5:	cc                   	int3
  4054b6:	cc                   	int3
  4054b7:	cc                   	int3
  4054b8:	cc                   	int3
  4054b9:	cc                   	int3
  4054ba:	cc                   	int3
  4054bb:	cc                   	int3
  4054bc:	cc                   	int3
  4054bd:	cc                   	int3
  4054be:	cc                   	int3
  4054bf:	cc                   	int3
  4054c0:	6a ff                	push   $0xffffffff
  4054c2:	68 80 c3 40 00       	push   $0x40c380
  4054c7:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
  4054cd:	50                   	push   %eax
  4054ce:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
  4054d5:	83 ec 24             	sub    $0x24,%esp
  4054d8:	8b 44 24 34          	mov    0x34(%esp),%eax
  4054dc:	53                   	push   %ebx
  4054dd:	55                   	push   %ebp
  4054de:	56                   	push   %esi
  4054df:	57                   	push   %edi
  4054e0:	8b e9                	mov    %ecx,%ebp
  4054e2:	50                   	push   %eax
  4054e3:	8d 4c 24 20          	lea    0x20(%esp),%ecx
  4054e7:	e8 d4 f7 ff ff       	call   0x404cc0
  4054ec:	33 f6                	xor    %esi,%esi
  4054ee:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  4054f2:	89 74 24 3c          	mov    %esi,0x3c(%esp)
  4054f6:	e8 75 f2 ff ff       	call   0x404770
  4054fb:	bb 01 00 00 00       	mov    $0x1,%ebx
  405500:	8b cd                	mov    %ebp,%ecx
  405502:	88 5c 24 3c          	mov    %bl,0x3c(%esp)
  405506:	e8 35 ff ff ff       	call   0x405440
  40550b:	56                   	push   %esi
  40550c:	68 e0 d5 40 00       	push   $0x40d5e0
  405511:	8d 4c 24 24          	lea    0x24(%esp),%ecx
  405515:	e8 a6 f3 ff ff       	call   0x4048c0
  40551a:	8b f8                	mov    %eax,%edi
  40551c:	85 ff                	test   %edi,%edi
  40551e:	7c 63                	jl     0x405583
  405520:	8b cf                	mov    %edi,%ecx
  405522:	2b ce                	sub    %esi,%ecx
  405524:	51                   	push   %ecx
  405525:	56                   	push   %esi
  405526:	8d 54 24 30          	lea    0x30(%esp),%edx
  40552a:	52                   	push   %edx
  40552b:	8d 4c 24 28          	lea    0x28(%esp),%ecx
  40552f:	e8 1c fd ff ff       	call   0x405250
  405534:	50                   	push   %eax
  405535:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  405539:	c6 44 24 40 02       	movb   $0x2,0x40(%esp)
  40553e:	e8 3d f8 ff ff       	call   0x404d80
  405543:	8d 4c 24 28          	lea    0x28(%esp),%ecx
  405547:	88 5c 24 3c          	mov    %bl,0x3c(%esp)
  40554b:	e8 60 c0 ff ff       	call   0x4015b0
  405550:	39 5c 24 14          	cmp    %ebx,0x14(%esp)
  405554:	7c 08                	jl     0x40555e
  405556:	8b 44 24 10          	mov    0x10(%esp),%eax
  40555a:	85 c0                	test   %eax,%eax
  40555c:	75 05                	jne    0x405563
  40555e:	a1 40 04 41 00       	mov    0x410440,%eax
  405563:	50                   	push   %eax
  405564:	8b cd                	mov    %ebp,%ecx
  405566:	e8 05 fe ff ff       	call   0x405370
  40556b:	8d 77 02             	lea    0x2(%edi),%esi
  40556e:	56                   	push   %esi
  40556f:	68 e0 d5 40 00       	push   $0x40d5e0
  405574:	8d 4c 24 24          	lea    0x24(%esp),%ecx
  405578:	e8 43 f3 ff ff       	call   0x4048c0
  40557d:	8b f8                	mov    %eax,%edi
  40557f:	3b fe                	cmp    %esi,%edi
  405581:	7d 9d                	jge    0x405520
  405583:	8b 44 24 20          	mov    0x20(%esp),%eax
  405587:	2b c6                	sub    %esi,%eax
  405589:	50                   	push   %eax
  40558a:	56                   	push   %esi
  40558b:	8d 4c 24 30          	lea    0x30(%esp),%ecx
  40558f:	51                   	push   %ecx
  405590:	8d 4c 24 28          	lea    0x28(%esp),%ecx
  405594:	e8 b7 fc ff ff       	call   0x405250
  405599:	50                   	push   %eax
  40559a:	8d 4c 24 14          	lea    0x14(%esp),%ecx
  40559e:	c6 44 24 40 03       	movb   $0x3,0x40(%esp)
  4055a3:	e8 d8 f7 ff ff       	call   0x404d80
  4055a8:	8d 4c 24 28          	lea    0x28(%esp),%ecx
  4055ac:	88 5c 24 3c          	mov    %bl,0x3c(%esp)
  4055b0:	e8 fb bf ff ff       	call   0x4015b0
  4055b5:	39 5c 24 14          	cmp    %ebx,0x14(%esp)
  4055b9:	7c 08                	jl     0x4055c3
  4055bb:	8b 44 24 10          	mov    0x10(%esp),%eax
  4055bf:	85 c0                	test   %eax,%eax
  4055c1:	75 05                	jne    0x4055c8
  4055c3:	a1 40 04 41 00       	mov    0x410440,%eax
  4055c8:	50                   	push   %eax
  4055c9:	8b cd                	mov    %ebp,%ecx
  4055cb:	e8 a0 fd ff ff       	call   0x405370
  4055d0:	8d 4c 24 10          	lea    0x10(%esp),%ecx
  4055d4:	c6 44 24 3c 00       	movb   $0x0,0x3c(%esp)
  4055d9:	e8 d2 bf ff ff       	call   0x4015b0
  4055de:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
  4055e2:	c7 44 24 3c ff ff ff 	movl   $0xffffffff,0x3c(%esp)
  4055e9:	ff 
  4055ea:	e8 c1 bf ff ff       	call   0x4015b0
  4055ef:	8b 4c 24 34          	mov    0x34(%esp),%ecx
  4055f3:	5f                   	pop    %edi
  4055f4:	5e                   	pop    %esi
  4055f5:	5d                   	pop    %ebp
  4055f6:	5b                   	pop    %ebx
  4055f7:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  4055fe:	83 c4 30             	add    $0x30,%esp
  405601:	c2 04 00             	ret    $0x4
  405604:	cc                   	int3
  405605:	cc                   	int3
  405606:	cc                   	int3
  405607:	cc                   	int3
  405608:	cc                   	int3
  405609:	cc                   	int3
  40560a:	cc                   	int3
  40560b:	cc                   	int3
  40560c:	cc                   	int3
  40560d:	cc                   	int3
  40560e:	cc                   	int3
  40560f:	cc                   	int3
  405610:	c7 01 e4 d5 40 00    	movl   $0x40d5e4,(%ecx)
  405616:	e9 25 fe ff ff       	jmp    0x405440
  40561b:	cc                   	int3
  40561c:	cc                   	int3
  40561d:	cc                   	int3
  40561e:	cc                   	int3
  40561f:	cc                   	int3
  405620:	6a ff                	push   $0xffffffff
  405622:	68 98 c3 40 00       	push   $0x40c398
  405627:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
  40562d:	50                   	push   %eax
  40562e:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
  405635:	83 ec 0c             	sub    $0xc,%esp
  405638:	56                   	push   %esi
  405639:	8b f1                	mov    %ecx,%esi
  40563b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  40563f:	e8 2c f1 ff ff       	call   0x404770
  405644:	8b 4c 24 20          	mov    0x20(%esp),%ecx
  405648:	8d 44 24 04          	lea    0x4(%esp),%eax
  40564c:	50                   	push   %eax
  40564d:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  405654:	00 
  405655:	e8 e6 ee ff ff       	call   0x404540
  40565a:	85 c0                	test   %eax,%eax
  40565c:	75 25                	jne    0x405683
  40565e:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  405662:	c7 44 24 18 ff ff ff 	movl   $0xffffffff,0x18(%esp)
  405669:	ff 
  40566a:	e8 41 bf ff ff       	call   0x4015b0
  40566f:	33 c0                	xor    %eax,%eax
  405671:	5e                   	pop    %esi
  405672:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  405676:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  40567d:	83 c4 18             	add    $0x18,%esp
  405680:	c2 04 00             	ret    $0x4
  405683:	83 7c 24 08 01       	cmpl   $0x1,0x8(%esp)
  405688:	7c 08                	jl     0x405692
  40568a:	8b 44 24 04          	mov    0x4(%esp),%eax
  40568e:	85 c0                	test   %eax,%eax
  405690:	75 05                	jne    0x405697
  405692:	a1 40 04 41 00       	mov    0x410440,%eax
  405697:	50                   	push   %eax
  405698:	8b ce                	mov    %esi,%ecx
  40569a:	e8 21 fe ff ff       	call   0x4054c0
  40569f:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  4056a3:	c7 44 24 18 ff ff ff 	movl   $0xffffffff,0x18(%esp)
  4056aa:	ff 
  4056ab:	e8 00 bf ff ff       	call   0x4015b0
  4056b0:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  4056b4:	b8 01 00 00 00       	mov    $0x1,%eax
  4056b9:	5e                   	pop    %esi
  4056ba:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  4056c1:	83 c4 18             	add    $0x18,%esp
  4056c4:	c2 04 00             	ret    $0x4
  4056c7:	cc                   	int3
  4056c8:	cc                   	int3
  4056c9:	cc                   	int3
  4056ca:	cc                   	int3
  4056cb:	cc                   	int3
  4056cc:	cc                   	int3
  4056cd:	cc                   	int3
  4056ce:	cc                   	int3
  4056cf:	cc                   	int3
  4056d0:	6a ff                	push   $0xffffffff
  4056d2:	68 b8 c3 40 00       	push   $0x40c3b8
  4056d7:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
  4056dd:	50                   	push   %eax
  4056de:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
  4056e5:	83 ec 14             	sub    $0x14,%esp
  4056e8:	56                   	push   %esi
  4056e9:	8b f1                	mov    %ecx,%esi
  4056eb:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  4056ef:	e8 6c e5 ff ff       	call   0x403c60
  4056f4:	8b 44 24 28          	mov    0x28(%esp),%eax
  4056f8:	6a 00                	push   $0x0
  4056fa:	50                   	push   %eax
  4056fb:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
  4056ff:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  405706:	00 
  405707:	e8 f4 ee ff ff       	call   0x404600
  40570c:	85 c0                	test   %eax,%eax
  40570e:	75 25                	jne    0x405735
  405710:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  405714:	c7 44 24 20 ff ff ff 	movl   $0xffffffff,0x20(%esp)
  40571b:	ff 
  40571c:	e8 af ee ff ff       	call   0x4045d0
  405721:	33 c0                	xor    %eax,%eax
  405723:	5e                   	pop    %esi
  405724:	8b 4c 24 14          	mov    0x14(%esp),%ecx
  405728:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  40572f:	83 c4 20             	add    $0x20,%esp
  405732:	c2 04 00             	ret    $0x4
  405735:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  405739:	51                   	push   %ecx
  40573a:	8b ce                	mov    %esi,%ecx
  40573c:	e8 df fe ff ff       	call   0x405620
  405741:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  405745:	e8 56 e7 ff ff       	call   0x403ea0
  40574a:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  40574e:	c7 44 24 20 ff ff ff 	movl   $0xffffffff,0x20(%esp)
  405755:	ff 
  405756:	e8 75 ee ff ff       	call   0x4045d0
  40575b:	8b 4c 24 18          	mov    0x18(%esp),%ecx
  40575f:	b8 01 00 00 00       	mov    $0x1,%eax
  405764:	5e                   	pop    %esi
  405765:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  40576c:	83 c4 20             	add    $0x20,%esp
  40576f:	c2 04 00             	ret    $0x4
  405772:	cc                   	int3
  405773:	cc                   	int3
  405774:	cc                   	int3
  405775:	cc                   	int3
  405776:	cc                   	int3
  405777:	cc                   	int3
  405778:	cc                   	int3
  405779:	cc                   	int3
  40577a:	cc                   	int3
  40577b:	cc                   	int3
  40577c:	cc                   	int3
  40577d:	cc                   	int3
  40577e:	cc                   	int3
  40577f:	cc                   	int3
  405780:	56                   	push   %esi
  405781:	8b f1                	mov    %ecx,%esi
  405783:	c7 06 e4 d5 40 00    	movl   $0x40d5e4,(%esi)
  405789:	e8 b2 fc ff ff       	call   0x405440
  40578e:	f6 44 24 08 01       	testb  $0x1,0x8(%esp)
  405793:	74 09                	je     0x40579e
  405795:	56                   	push   %esi
  405796:	e8 c5 00 00 00       	call   0x405860
  40579b:	83 c4 04             	add    $0x4,%esp
  40579e:	8b c6                	mov    %esi,%eax
  4057a0:	5e                   	pop    %esi
  4057a1:	c2 04 00             	ret    $0x4
  4057a4:	56                   	push   %esi
  4057a5:	ff 35 08 34 41 00    	push   0x413408
  4057ab:	e8 0b 14 00 00       	call   0x406bbb
  4057b0:	59                   	pop    %ecx
  4057b1:	8b 0d 04 34 41 00    	mov    0x413404,%ecx
  4057b7:	8b f0                	mov    %eax,%esi
  4057b9:	a1 08 34 41 00       	mov    0x413408,%eax
  4057be:	8b d1                	mov    %ecx,%edx
  4057c0:	2b d0                	sub    %eax,%edx
  4057c2:	83 c2 04             	add    $0x4,%edx
  4057c5:	3b f2                	cmp    %edx,%esi
  4057c7:	73 4e                	jae    0x405817
  4057c9:	b9 00 08 00 00       	mov    $0x800,%ecx
  4057ce:	3b f1                	cmp    %ecx,%esi
  4057d0:	73 02                	jae    0x4057d4
  4057d2:	8b ce                	mov    %esi,%ecx
  4057d4:	03 ce                	add    %esi,%ecx
  4057d6:	51                   	push   %ecx
  4057d7:	50                   	push   %eax
  4057d8:	e8 e1 10 00 00       	call   0x4068be
  4057dd:	85 c0                	test   %eax,%eax
  4057df:	59                   	pop    %ecx
  4057e0:	59                   	pop    %ecx
  4057e1:	75 17                	jne    0x4057fa
  4057e3:	83 c6 10             	add    $0x10,%esi
  4057e6:	56                   	push   %esi
  4057e7:	ff 35 08 34 41 00    	push   0x413408
  4057ed:	e8 cc 10 00 00       	call   0x4068be
  4057f2:	85 c0                	test   %eax,%eax
  4057f4:	59                   	pop    %ecx
  4057f5:	59                   	pop    %ecx
  4057f6:	75 02                	jne    0x4057fa
  4057f8:	5e                   	pop    %esi
  4057f9:	c3                   	ret
  4057fa:	8b 0d 04 34 41 00    	mov    0x413404,%ecx
  405800:	2b 0d 08 34 41 00    	sub    0x413408,%ecx
  405806:	a3 08 34 41 00       	mov    %eax,0x413408
  40580b:	c1 f9 02             	sar    $0x2,%ecx
  40580e:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  405811:	89 0d 04 34 41 00    	mov    %ecx,0x413404
  405817:	8b 44 24 08          	mov    0x8(%esp),%eax
  40581b:	89 01                	mov    %eax,(%ecx)
  40581d:	83 05 04 34 41 00 04 	addl   $0x4,0x413404
  405824:	5e                   	pop    %esi
  405825:	c3                   	ret
  405826:	ff 74 24 04          	push   0x4(%esp)
  40582a:	e8 75 ff ff ff       	call   0x4057a4
  40582f:	f7 d8                	neg    %eax
  405831:	1b c0                	sbb    %eax,%eax
  405833:	f7 d8                	neg    %eax
  405835:	59                   	pop    %ecx
  405836:	48                   	dec    %eax
  405837:	c3                   	ret
  405838:	68 80 00 00 00       	push   $0x80
  40583d:	e8 23 14 00 00       	call   0x406c65
  405842:	85 c0                	test   %eax,%eax
  405844:	59                   	pop    %ecx
  405845:	a3 08 34 41 00       	mov    %eax,0x413408
  40584a:	75 04                	jne    0x405850
  40584c:	6a 18                	push   $0x18
  40584e:	58                   	pop    %eax
  40584f:	c3                   	ret
  405850:	83 20 00             	andl   $0x0,(%eax)
  405853:	a1 08 34 41 00       	mov    0x413408,%eax
  405858:	a3 04 34 41 00       	mov    %eax,0x413404
  40585d:	33 c0                	xor    %eax,%eax
  40585f:	c3                   	ret
  405860:	e9 12 14 00 00       	jmp    0x406c77
  405865:	55                   	push   %ebp
  405866:	8b ec                	mov    %esp,%ebp
  405868:	51                   	push   %ecx
  405869:	53                   	push   %ebx
  40586a:	8b 45 0c             	mov    0xc(%ebp),%eax
  40586d:	83 c0 0c             	add    $0xc,%eax
  405870:	89 45 fc             	mov    %eax,-0x4(%ebp)
  405873:	64 8b 1d 00 00 00 00 	mov    %fs:0x0,%ebx
  40587a:	8b 03                	mov    (%ebx),%eax
  40587c:	64 a3 00 00 00 00    	mov    %eax,%fs:0x0
  405882:	8b 45 08             	mov    0x8(%ebp),%eax
  405885:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  405888:	8b 63 fc             	mov    -0x4(%ebx),%esp
  40588b:	8b 6d fc             	mov    -0x4(%ebp),%ebp
  40588e:	ff e0                	jmp    *%eax
  405890:	5b                   	pop    %ebx
  405891:	c9                   	leave
  405892:	c2 08 00             	ret    $0x8
  405895:	58                   	pop    %eax
  405896:	59                   	pop    %ecx
  405897:	87 04 24             	xchg   %eax,(%esp)
  40589a:	ff e0                	jmp    *%eax
  40589c:	55                   	push   %ebp
  40589d:	8b ec                	mov    %esp,%ebp
  40589f:	51                   	push   %ecx
  4058a0:	51                   	push   %ecx
  4058a1:	53                   	push   %ebx
  4058a2:	56                   	push   %esi
  4058a3:	57                   	push   %edi
  4058a4:	64 8b 35 00 00 00 00 	mov    %fs:0x0,%esi
  4058ab:	89 75 fc             	mov    %esi,-0x4(%ebp)
  4058ae:	c7 45 f8 c5 58 40 00 	movl   $0x4058c5,-0x8(%ebp)
  4058b5:	6a 00                	push   $0x0
  4058b7:	ff 75 0c             	push   0xc(%ebp)
  4058ba:	ff 75 f8             	push   -0x8(%ebp)
  4058bd:	ff 75 08             	push   0x8(%ebp)
  4058c0:	e8 9f 66 00 00       	call   0x40bf64
  4058c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  4058c8:	8b 40 04             	mov    0x4(%eax),%eax
  4058cb:	83 e0 fd             	and    $0xfffffffd,%eax
  4058ce:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  4058d1:	89 41 04             	mov    %eax,0x4(%ecx)
  4058d4:	64 8b 3d 00 00 00 00 	mov    %fs:0x0,%edi
  4058db:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  4058de:	89 3b                	mov    %edi,(%ebx)
  4058e0:	64 89 1d 00 00 00 00 	mov    %ebx,%fs:0x0
  4058e7:	5f                   	pop    %edi
  4058e8:	5e                   	pop    %esi
  4058e9:	5b                   	pop    %ebx
  4058ea:	c9                   	leave
  4058eb:	c2 08 00             	ret    $0x8
  4058ee:	55                   	push   %ebp
  4058ef:	8b ec                	mov    %esp,%ebp
  4058f1:	83 ec 04             	sub    $0x4,%esp
  4058f4:	53                   	push   %ebx
  4058f5:	56                   	push   %esi
  4058f6:	57                   	push   %edi
  4058f7:	fc                   	cld
  4058f8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  4058fb:	33 c0                	xor    %eax,%eax
  4058fd:	50                   	push   %eax
  4058fe:	50                   	push   %eax
  4058ff:	50                   	push   %eax
  405900:	ff 75 fc             	push   -0x4(%ebp)
  405903:	ff 75 14             	push   0x14(%ebp)
  405906:	ff 75 10             	push   0x10(%ebp)
  405909:	ff 75 0c             	push   0xc(%ebp)
  40590c:	ff 75 08             	push   0x8(%ebp)
  40590f:	e8 5f 1b 00 00       	call   0x407473
  405914:	83 c4 20             	add    $0x20,%esp
  405917:	89 45 fc             	mov    %eax,-0x4(%ebp)
  40591a:	5f                   	pop    %edi
  40591b:	5e                   	pop    %esi
  40591c:	5b                   	pop    %ebx
  40591d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  405920:	8b e5                	mov    %ebp,%esp
  405922:	5d                   	pop    %ebp
  405923:	c3                   	ret
  405924:	fc                   	cld
  405925:	8b 44 24 08          	mov    0x8(%esp),%eax
  405929:	8b 48 08             	mov    0x8(%eax),%ecx
  40592c:	3b 0d 6c 04 41 00    	cmp    0x41046c,%ecx
  405932:	74 0c                	je     0x405940
  405934:	8b 44 24 04          	mov    0x4(%esp),%eax
  405938:	83 48 04 08          	orl    $0x8,0x4(%eax)
  40593c:	33 c0                	xor    %eax,%eax
  40593e:	40                   	inc    %eax
  40593f:	c3                   	ret
  405940:	6a 00                	push   $0x0
  405942:	50                   	push   %eax
  405943:	ff 70 14             	push   0x14(%eax)
  405946:	ff 70 0c             	push   0xc(%eax)
  405949:	6a 00                	push   $0x0
  40594b:	ff 74 24 20          	push   0x20(%esp)
  40594f:	ff 70 10             	push   0x10(%eax)
  405952:	ff 74 24 20          	push   0x20(%esp)
  405956:	e8 18 1b 00 00       	call   0x407473
  40595b:	83 c4 20             	add    $0x20,%esp
  40595e:	c3                   	ret
  40595f:	55                   	push   %ebp
  405960:	8b ec                	mov    %esp,%ebp
  405962:	83 ec 34             	sub    $0x34,%esp
  405965:	53                   	push   %ebx
  405966:	81 7d 08 23 01 00 00 	cmpl   $0x123,0x8(%ebp)
  40596d:	75 12                	jne    0x405981
  40596f:	b8 f8 59 40 00       	mov    $0x4059f8,%eax
  405974:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  405977:	89 01                	mov    %eax,(%ecx)
  405979:	33 c0                	xor    %eax,%eax
  40597b:	40                   	inc    %eax
  40597c:	e9 a0 00 00 00       	jmp    0x405a21
  405981:	83 65 d8 00          	andl   $0x0,-0x28(%ebp)
  405985:	c7 45 dc 24 5a 40 00 	movl   $0x405a24,-0x24(%ebp)
  40598c:	a1 6c 04 41 00       	mov    0x41046c,%eax
  405991:	89 45 e0             	mov    %eax,-0x20(%ebp)
  405994:	8b 45 18             	mov    0x18(%ebp),%eax
  405997:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  40599a:	8b 45 0c             	mov    0xc(%ebp),%eax
  40599d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  4059a0:	8b 45 1c             	mov    0x1c(%ebp),%eax
  4059a3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  4059a6:	8b 45 20             	mov    0x20(%ebp),%eax
  4059a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  4059ac:	83 65 f4 00          	andl   $0x0,-0xc(%ebp)
  4059b0:	83 65 f8 00          	andl   $0x0,-0x8(%ebp)
  4059b4:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  4059b8:	89 65 f4             	mov    %esp,-0xc(%ebp)
  4059bb:	89 6d f8             	mov    %ebp,-0x8(%ebp)
  4059be:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
  4059c4:	89 45 d8             	mov    %eax,-0x28(%ebp)
  4059c7:	8d 45 d8             	lea    -0x28(%ebp),%eax
  4059ca:	64 a3 00 00 00 00    	mov    %eax,%fs:0x0
  4059d0:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
  4059d7:	8b 45 08             	mov    0x8(%ebp),%eax
  4059da:	89 45 d0             	mov    %eax,-0x30(%ebp)
  4059dd:	8b 45 10             	mov    0x10(%ebp),%eax
  4059e0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  4059e3:	8d 45 d0             	lea    -0x30(%ebp),%eax
  4059e6:	50                   	push   %eax
  4059e7:	8b 45 08             	mov    0x8(%ebp),%eax
  4059ea:	ff 30                	push   (%eax)
  4059ec:	ff 15 ac 1d 41 00    	call   *0x411dac
  4059f2:	59                   	pop    %ecx
  4059f3:	59                   	pop    %ecx
  4059f4:	83 65 cc 00          	andl   $0x0,-0x34(%ebp)
  4059f8:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  4059fc:	74 17                	je     0x405a15
  4059fe:	64 8b 1d 00 00 00 00 	mov    %fs:0x0,%ebx
  405a05:	8b 03                	mov    (%ebx),%eax
  405a07:	8b 5d d8             	mov    -0x28(%ebp),%ebx
  405a0a:	89 03                	mov    %eax,(%ebx)
  405a0c:	64 89 1d 00 00 00 00 	mov    %ebx,%fs:0x0
  405a13:	eb 09                	jmp    0x405a1e
  405a15:	8b 45 d8             	mov    -0x28(%ebp),%eax
  405a18:	64 a3 00 00 00 00    	mov    %eax,%fs:0x0
  405a1e:	8b 45 cc             	mov    -0x34(%ebp),%eax
  405a21:	5b                   	pop    %ebx
  405a22:	c9                   	leave
  405a23:	c3                   	ret
  405a24:	55                   	push   %ebp
  405a25:	8b ec                	mov    %esp,%ebp
  405a27:	51                   	push   %ecx
  405a28:	53                   	push   %ebx
  405a29:	fc                   	cld
  405a2a:	8b 45 0c             	mov    0xc(%ebp),%eax
  405a2d:	8b 40 08             	mov    0x8(%eax),%eax
  405a30:	3b 05 6c 04 41 00    	cmp    0x41046c,%eax
  405a36:	74 17                	je     0x405a4f
  405a38:	8b 45 08             	mov    0x8(%ebp),%eax
  405a3b:	8b 40 04             	mov    0x4(%eax),%eax
  405a3e:	83 c8 08             	or     $0x8,%eax
  405a41:	8b 4d 08             	mov    0x8(%ebp),%ecx
  405a44:	89 41 04             	mov    %eax,0x4(%ecx)
  405a47:	33 c0                	xor    %eax,%eax
  405a49:	40                   	inc    %eax
  405a4a:	e9 84 00 00 00       	jmp    0x405ad3
  405a4f:	8b 45 08             	mov    0x8(%ebp),%eax
  405a52:	8b 40 04             	mov    0x4(%eax),%eax
  405a55:	83 e0 66             	and    $0x66,%eax
  405a58:	74 0f                	je     0x405a69
  405a5a:	8b 45 0c             	mov    0xc(%ebp),%eax
  405a5d:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  405a64:	33 c0                	xor    %eax,%eax
  405a66:	40                   	inc    %eax
  405a67:	eb 6a                	jmp    0x405ad3
  405a69:	6a 01                	push   $0x1
  405a6b:	8b 45 0c             	mov    0xc(%ebp),%eax
  405a6e:	ff 70 18             	push   0x18(%eax)
  405a71:	8b 45 0c             	mov    0xc(%ebp),%eax
  405a74:	ff 70 14             	push   0x14(%eax)
  405a77:	8b 45 0c             	mov    0xc(%ebp),%eax
  405a7a:	ff 70 0c             	push   0xc(%eax)
  405a7d:	6a 00                	push   $0x0
  405a7f:	ff 75 10             	push   0x10(%ebp)
  405a82:	8b 45 0c             	mov    0xc(%ebp),%eax
  405a85:	ff 70 10             	push   0x10(%eax)
  405a88:	ff 75 08             	push   0x8(%ebp)
  405a8b:	e8 e3 19 00 00       	call   0x407473
  405a90:	83 c4 20             	add    $0x20,%esp
  405a93:	8b 45 0c             	mov    0xc(%ebp),%eax
  405a96:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
  405a9a:	75 0b                	jne    0x405aa7
  405a9c:	ff 75 08             	push   0x8(%ebp)
  405a9f:	ff 75 0c             	push   0xc(%ebp)
  405aa2:	e8 f5 fd ff ff       	call   0x40589c
  405aa7:	6a 00                	push   $0x0
  405aa9:	6a 00                	push   $0x0
  405aab:	6a 00                	push   $0x0
  405aad:	6a 00                	push   $0x0
  405aaf:	6a 00                	push   $0x0
  405ab1:	8d 45 fc             	lea    -0x4(%ebp),%eax
  405ab4:	50                   	push   %eax
  405ab5:	68 23 01 00 00       	push   $0x123
  405aba:	e8 a0 fe ff ff       	call   0x40595f
  405abf:	83 c4 1c             	add    $0x1c,%esp
  405ac2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  405ac5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  405ac8:	8b 63 1c             	mov    0x1c(%ebx),%esp
  405acb:	8b 6b 20             	mov    0x20(%ebx),%ebp
  405ace:	ff e0                	jmp    *%eax
  405ad0:	33 c0                	xor    %eax,%eax
  405ad2:	40                   	inc    %eax
  405ad3:	5b                   	pop    %ebx
  405ad4:	c9                   	leave
  405ad5:	c3                   	ret
  405ad6:	55                   	push   %ebp
  405ad7:	8b ec                	mov    %esp,%ebp
  405ad9:	51                   	push   %ecx
  405ada:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  405ade:	53                   	push   %ebx
  405adf:	56                   	push   %esi
  405ae0:	57                   	push   %edi
  405ae1:	8b 7d 08             	mov    0x8(%ebp),%edi
  405ae4:	8b 77 0c             	mov    0xc(%edi),%esi
  405ae7:	8b 5f 10             	mov    0x10(%edi),%ebx
  405aea:	8b c6                	mov    %esi,%eax
  405aec:	89 45 fc             	mov    %eax,-0x4(%ebp)
  405aef:	89 75 08             	mov    %esi,0x8(%ebp)
  405af2:	7c 38                	jl     0x405b2c
  405af4:	83 fe ff             	cmp    $0xffffffff,%esi
  405af7:	75 05                	jne    0x405afe
  405af9:	e8 44 1a 00 00       	call   0x407542
  405afe:	8b 4d 10             	mov    0x10(%ebp),%ecx
  405b01:	4e                   	dec    %esi
  405b02:	8d 04 b6             	lea    (%esi,%esi,4),%eax
  405b05:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  405b08:	39 48 04             	cmp    %ecx,0x4(%eax)
  405b0b:	7d 05                	jge    0x405b12
  405b0d:	3b 48 08             	cmp    0x8(%eax),%ecx
  405b10:	7e 05                	jle    0x405b17
  405b12:	83 fe ff             	cmp    $0xffffffff,%esi
  405b15:	75 0c                	jne    0x405b23
  405b17:	8b 45 08             	mov    0x8(%ebp),%eax
  405b1a:	ff 4d 0c             	decl   0xc(%ebp)
  405b1d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  405b20:	89 75 08             	mov    %esi,0x8(%ebp)
  405b23:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  405b27:	7d cb                	jge    0x405af4
  405b29:	8b 45 fc             	mov    -0x4(%ebp),%eax
  405b2c:	8b 4d 14             	mov    0x14(%ebp),%ecx
  405b2f:	46                   	inc    %esi
  405b30:	89 31                	mov    %esi,(%ecx)
  405b32:	8b 4d 18             	mov    0x18(%ebp),%ecx
  405b35:	89 01                	mov    %eax,(%ecx)
  405b37:	3b 47 0c             	cmp    0xc(%edi),%eax
  405b3a:	77 04                	ja     0x405b40
  405b3c:	3b f0                	cmp    %eax,%esi
  405b3e:	76 05                	jbe    0x405b45
  405b40:	e8 fd 19 00 00       	call   0x407542
  405b45:	5f                   	pop    %edi
  405b46:	8d 04 b6             	lea    (%esi,%esi,4),%eax
  405b49:	5e                   	pop    %esi
  405b4a:	8d 04 83             	lea    (%ebx,%eax,4),%eax
  405b4d:	5b                   	pop    %ebx
  405b4e:	c9                   	leave
  405b4f:	c3                   	ret
  405b50:	8b 44 24 04          	mov    0x4(%esp),%eax
  405b54:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  405b58:	89 08                	mov    %ecx,(%eax)
  405b5a:	8b 0d 40 1d 41 00    	mov    0x411d40,%ecx
  405b60:	89 48 04             	mov    %ecx,0x4(%eax)
  405b63:	a3 40 1d 41 00       	mov    %eax,0x411d40
  405b68:	c3                   	ret
  405b69:	a1 40 1d 41 00       	mov    0x411d40,%eax
  405b6e:	eb 0b                	jmp    0x405b7b
  405b70:	8b 08                	mov    (%eax),%ecx
  405b72:	3b 4c 24 04          	cmp    0x4(%esp),%ecx
  405b76:	74 09                	je     0x405b81
  405b78:	8b 40 04             	mov    0x4(%eax),%eax
  405b7b:	85 c0                	test   %eax,%eax
  405b7d:	75 f1                	jne    0x405b70
  405b7f:	40                   	inc    %eax
  405b80:	c3                   	ret
  405b81:	33 c0                	xor    %eax,%eax
  405b83:	c3                   	ret
  405b84:	8b 54 24 04          	mov    0x4(%esp),%edx
  405b88:	a1 40 1d 41 00       	mov    0x411d40,%eax
  405b8d:	3b d0                	cmp    %eax,%edx
  405b8f:	75 09                	jne    0x405b9a
  405b91:	8b 42 04             	mov    0x4(%edx),%eax
  405b94:	a3 40 1d 41 00       	mov    %eax,0x411d40
  405b99:	c3                   	ret
  405b9a:	8b c8                	mov    %eax,%ecx
  405b9c:	83 c0 04             	add    $0x4,%eax
  405b9f:	eb 0b                	jmp    0x405bac
  405ba1:	8b 00                	mov    (%eax),%eax
  405ba3:	3b d0                	cmp    %eax,%edx
  405ba5:	74 0f                	je     0x405bb6
  405ba7:	8b c8                	mov    %eax,%ecx
  405ba9:	8d 41 04             	lea    0x4(%ecx),%eax
  405bac:	83 38 00             	cmpl   $0x0,(%eax)
  405baf:	75 f0                	jne    0x405ba1
  405bb1:	e9 8c 19 00 00       	jmp    0x407542
  405bb6:	8b 42 04             	mov    0x4(%edx),%eax
  405bb9:	89 41 04             	mov    %eax,0x4(%ecx)
  405bbc:	c3                   	ret
  405bbd:	55                   	push   %ebp
  405bbe:	8b ec                	mov    %esp,%ebp
  405bc0:	83 ec 18             	sub    $0x18,%esp
  405bc3:	a1 6c 04 41 00       	mov    0x41046c,%eax
  405bc8:	83 65 e8 00          	andl   $0x0,-0x18(%ebp)
  405bcc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  405bcf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  405bd2:	8b 45 0c             	mov    0xc(%ebp),%eax
  405bd5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  405bd8:	8b 45 14             	mov    0x14(%ebp),%eax
  405bdb:	40                   	inc    %eax
  405bdc:	c7 45 ec 24 59 40 00 	movl   $0x405924,-0x14(%ebp)
  405be3:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  405be6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  405be9:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
  405bef:	89 45 e8             	mov    %eax,-0x18(%ebp)
  405bf2:	8d 45 e8             	lea    -0x18(%ebp),%eax
  405bf5:	64 a3 00 00 00 00    	mov    %eax,%fs:0x0
  405bfb:	ff 75 18             	push   0x18(%ebp)
  405bfe:	51                   	push   %ecx
  405bff:	ff 75 10             	push   0x10(%ebp)
  405c02:	e8 69 19 00 00       	call   0x407570
  405c07:	8b c8                	mov    %eax,%ecx
  405c09:	8b 45 e8             	mov    -0x18(%ebp),%eax
  405c0c:	64 a3 00 00 00 00    	mov    %eax,%fs:0x0
  405c12:	8b c1                	mov    %ecx,%eax
  405c14:	c9                   	leave
  405c15:	c3                   	ret
  405c16:	cc                   	int3
  405c17:	cc                   	int3
  405c18:	55                   	push   %ebp
  405c19:	8b ec                	mov    %esp,%ebp
  405c1b:	53                   	push   %ebx
  405c1c:	56                   	push   %esi
  405c1d:	57                   	push   %edi
  405c1e:	55                   	push   %ebp
  405c1f:	6a 00                	push   $0x0
  405c21:	6a 00                	push   $0x0
  405c23:	68 30 5c 40 00       	push   $0x405c30
  405c28:	ff 75 08             	push   0x8(%ebp)
  405c2b:	e8 34 63 00 00       	call   0x40bf64
  405c30:	5d                   	pop    %ebp
  405c31:	5f                   	pop    %edi
  405c32:	5e                   	pop    %esi
  405c33:	5b                   	pop    %ebx
  405c34:	8b e5                	mov    %ebp,%esp
  405c36:	5d                   	pop    %ebp
  405c37:	c3                   	ret
  405c38:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  405c3c:	f7 41 04 06 00 00 00 	testl  $0x6,0x4(%ecx)
  405c43:	b8 01 00 00 00       	mov    $0x1,%eax
  405c48:	74 0f                	je     0x405c59
  405c4a:	8b 44 24 08          	mov    0x8(%esp),%eax
  405c4e:	8b 54 24 10          	mov    0x10(%esp),%edx
  405c52:	89 02                	mov    %eax,(%edx)
  405c54:	b8 03 00 00 00       	mov    $0x3,%eax
  405c59:	c3                   	ret
  405c5a:	53                   	push   %ebx
  405c5b:	56                   	push   %esi
  405c5c:	57                   	push   %edi
  405c5d:	8b 44 24 10          	mov    0x10(%esp),%eax
  405c61:	50                   	push   %eax
  405c62:	6a fe                	push   $0xfffffffe
  405c64:	68 38 5c 40 00       	push   $0x405c38
  405c69:	64 ff 35 00 00 00 00 	push   %fs:0x0
  405c70:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
  405c77:	8b 44 24 20          	mov    0x20(%esp),%eax
  405c7b:	8b 58 08             	mov    0x8(%eax),%ebx
  405c7e:	8b 70 0c             	mov    0xc(%eax),%esi
  405c81:	83 fe ff             	cmp    $0xffffffff,%esi
  405c84:	74 2e                	je     0x405cb4
  405c86:	3b 74 24 24          	cmp    0x24(%esp),%esi
  405c8a:	74 28                	je     0x405cb4
  405c8c:	8d 34 76             	lea    (%esi,%esi,2),%esi
  405c8f:	8b 0c b3             	mov    (%ebx,%esi,4),%ecx
  405c92:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  405c96:	89 48 0c             	mov    %ecx,0xc(%eax)
  405c99:	83 7c b3 04 00       	cmpl   $0x0,0x4(%ebx,%esi,4)
  405c9e:	75 12                	jne    0x405cb2
  405ca0:	68 01 01 00 00       	push   $0x101
  405ca5:	8b 44 b3 08          	mov    0x8(%ebx,%esi,4),%eax
  405ca9:	e8 40 00 00 00       	call   0x405cee
  405cae:	ff 54 b3 08          	call   *0x8(%ebx,%esi,4)
  405cb2:	eb c3                	jmp    0x405c77
  405cb4:	64 8f 05 00 00 00 00 	pop    %fs:0x0
  405cbb:	83 c4 0c             	add    $0xc,%esp
  405cbe:	5f                   	pop    %edi
  405cbf:	5e                   	pop    %esi
  405cc0:	5b                   	pop    %ebx
  405cc1:	c3                   	ret
  405cc2:	33 c0                	xor    %eax,%eax
  405cc4:	64 8b 0d 00 00 00 00 	mov    %fs:0x0,%ecx
  405ccb:	81 79 04 38 5c 40 00 	cmpl   $0x405c38,0x4(%ecx)
  405cd2:	75 10                	jne    0x405ce4
  405cd4:	8b 51 0c             	mov    0xc(%ecx),%edx
  405cd7:	8b 52 0c             	mov    0xc(%edx),%edx
  405cda:	39 51 08             	cmp    %edx,0x8(%ecx)
  405cdd:	75 05                	jne    0x405ce4
  405cdf:	b8 01 00 00 00       	mov    $0x1,%eax
  405ce4:	c3                   	ret
  405ce5:	53                   	push   %ebx
  405ce6:	51                   	push   %ecx
  405ce7:	bb 44 04 41 00       	mov    $0x410444,%ebx
  405cec:	eb 0a                	jmp    0x405cf8
  405cee:	53                   	push   %ebx
  405cef:	51                   	push   %ecx
  405cf0:	bb 44 04 41 00       	mov    $0x410444,%ebx
  405cf5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  405cf8:	89 4b 08             	mov    %ecx,0x8(%ebx)
  405cfb:	89 43 04             	mov    %eax,0x4(%ebx)
  405cfe:	89 6b 0c             	mov    %ebp,0xc(%ebx)
  405d01:	59                   	pop    %ecx
  405d02:	5b                   	pop    %ebx
  405d03:	c2 04 00             	ret    $0x4
  405d06:	cc                   	int3
  405d07:	cc                   	int3
  405d08:	cc                   	int3
  405d09:	cc                   	int3
  405d0a:	cc                   	int3
  405d0b:	cc                   	int3
  405d0c:	cc                   	int3
  405d0d:	cc                   	int3
  405d0e:	cc                   	int3
  405d0f:	cc                   	int3
  405d10:	3d 00 10 00 00       	cmp    $0x1000,%eax
  405d15:	73 0e                	jae    0x405d25
  405d17:	f7 d8                	neg    %eax
  405d19:	03 c4                	add    %esp,%eax
  405d1b:	83 c0 04             	add    $0x4,%eax
  405d1e:	85 00                	test   %eax,(%eax)
  405d20:	94                   	xchg   %eax,%esp
  405d21:	8b 00                	mov    (%eax),%eax
  405d23:	50                   	push   %eax
  405d24:	c3                   	ret
  405d25:	51                   	push   %ecx
  405d26:	8d 4c 24 08          	lea    0x8(%esp),%ecx
  405d2a:	81 e9 00 10 00 00    	sub    $0x1000,%ecx
  405d30:	2d 00 10 00 00       	sub    $0x1000,%eax
  405d35:	85 01                	test   %eax,(%ecx)
  405d37:	3d 00 10 00 00       	cmp    $0x1000,%eax
  405d3c:	73 ec                	jae    0x405d2a
  405d3e:	2b c8                	sub    %eax,%ecx
  405d40:	8b c4                	mov    %esp,%eax
  405d42:	85 01                	test   %eax,(%ecx)
  405d44:	8b e1                	mov    %ecx,%esp
  405d46:	8b 08                	mov    (%eax),%ecx
  405d48:	8b 40 04             	mov    0x4(%eax),%eax
  405d4b:	50                   	push   %eax
  405d4c:	c3                   	ret
  405d4d:	6a 01                	push   $0x1
  405d4f:	ff 74 24 08          	push   0x8(%esp)
  405d53:	e8 e1 0e 00 00       	call   0x406c39
  405d58:	59                   	pop    %ecx
  405d59:	59                   	pop    %ecx
  405d5a:	c3                   	ret
  405d5b:	cc                   	int3
  405d5c:	cc                   	int3
  405d5d:	cc                   	int3
  405d5e:	cc                   	int3
  405d5f:	cc                   	int3
  405d60:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  405d64:	57                   	push   %edi
  405d65:	85 c9                	test   %ecx,%ecx
  405d67:	0f 84 92 00 00 00    	je     0x405dff
  405d6d:	56                   	push   %esi
  405d6e:	53                   	push   %ebx
  405d6f:	8b d9                	mov    %ecx,%ebx
  405d71:	8b 74 24 14          	mov    0x14(%esp),%esi
  405d75:	f7 c6 03 00 00 00    	test   $0x3,%esi
  405d7b:	8b 7c 24 10          	mov    0x10(%esp),%edi
  405d7f:	75 0b                	jne    0x405d8c
  405d81:	c1 e9 02             	shr    $0x2,%ecx
  405d84:	0f 85 85 00 00 00    	jne    0x405e0f
  405d8a:	eb 27                	jmp    0x405db3
  405d8c:	8a 06                	mov    (%esi),%al
  405d8e:	83 c6 01             	add    $0x1,%esi
  405d91:	88 07                	mov    %al,(%edi)
  405d93:	83 c7 01             	add    $0x1,%edi
  405d96:	83 e9 01             	sub    $0x1,%ecx
  405d99:	74 2b                	je     0x405dc6
  405d9b:	84 c0                	test   %al,%al
  405d9d:	74 2f                	je     0x405dce
  405d9f:	f7 c6 03 00 00 00    	test   $0x3,%esi
  405da5:	75 e5                	jne    0x405d8c
  405da7:	8b d9                	mov    %ecx,%ebx
  405da9:	c1 e9 02             	shr    $0x2,%ecx
  405dac:	75 61                	jne    0x405e0f
  405dae:	83 e3 03             	and    $0x3,%ebx
  405db1:	74 13                	je     0x405dc6
  405db3:	8a 06                	mov    (%esi),%al
  405db5:	83 c6 01             	add    $0x1,%esi
  405db8:	88 07                	mov    %al,(%edi)
  405dba:	83 c7 01             	add    $0x1,%edi
  405dbd:	84 c0                	test   %al,%al
  405dbf:	74 37                	je     0x405df8
  405dc1:	83 eb 01             	sub    $0x1,%ebx
  405dc4:	75 ed                	jne    0x405db3
  405dc6:	8b 44 24 10          	mov    0x10(%esp),%eax
  405dca:	5b                   	pop    %ebx
  405dcb:	5e                   	pop    %esi
  405dcc:	5f                   	pop    %edi
  405dcd:	c3                   	ret
  405dce:	f7 c7 03 00 00 00    	test   $0x3,%edi
  405dd4:	74 16                	je     0x405dec
  405dd6:	88 07                	mov    %al,(%edi)
  405dd8:	83 c7 01             	add    $0x1,%edi
  405ddb:	83 e9 01             	sub    $0x1,%ecx
  405dde:	0f 84 98 00 00 00    	je     0x405e7c
  405de4:	f7 c7 03 00 00 00    	test   $0x3,%edi
  405dea:	75 ea                	jne    0x405dd6
  405dec:	8b d9                	mov    %ecx,%ebx
  405dee:	c1 e9 02             	shr    $0x2,%ecx
  405df1:	75 74                	jne    0x405e67
  405df3:	88 07                	mov    %al,(%edi)
  405df5:	83 c7 01             	add    $0x1,%edi
  405df8:	83 eb 01             	sub    $0x1,%ebx
  405dfb:	75 f6                	jne    0x405df3
  405dfd:	5b                   	pop    %ebx
  405dfe:	5e                   	pop    %esi
  405dff:	8b 44 24 08          	mov    0x8(%esp),%eax
  405e03:	5f                   	pop    %edi
  405e04:	c3                   	ret
  405e05:	89 17                	mov    %edx,(%edi)
  405e07:	83 c7 04             	add    $0x4,%edi
  405e0a:	83 e9 01             	sub    $0x1,%ecx
  405e0d:	74 9f                	je     0x405dae
  405e0f:	ba ff fe fe 7e       	mov    $0x7efefeff,%edx
  405e14:	8b 06                	mov    (%esi),%eax
  405e16:	03 d0                	add    %eax,%edx
  405e18:	83 f0 ff             	xor    $0xffffffff,%eax
  405e1b:	33 c2                	xor    %edx,%eax
  405e1d:	8b 16                	mov    (%esi),%edx
  405e1f:	83 c6 04             	add    $0x4,%esi
  405e22:	a9 00 01 01 81       	test   $0x81010100,%eax
  405e27:	74 dc                	je     0x405e05
  405e29:	84 d2                	test   %dl,%dl
  405e2b:	74 2c                	je     0x405e59
  405e2d:	84 f6                	test   %dh,%dh
  405e2f:	74 1e                	je     0x405e4f
  405e31:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
  405e37:	74 0c                	je     0x405e45
  405e39:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
  405e3f:	75 c4                	jne    0x405e05
  405e41:	89 17                	mov    %edx,(%edi)
  405e43:	eb 18                	jmp    0x405e5d
  405e45:	81 e2 ff ff 00 00    	and    $0xffff,%edx
  405e4b:	89 17                	mov    %edx,(%edi)
  405e4d:	eb 0e                	jmp    0x405e5d
  405e4f:	81 e2 ff 00 00 00    	and    $0xff,%edx
  405e55:	89 17                	mov    %edx,(%edi)
  405e57:	eb 04                	jmp    0x405e5d
  405e59:	33 d2                	xor    %edx,%edx
  405e5b:	89 17                	mov    %edx,(%edi)
  405e5d:	83 c7 04             	add    $0x4,%edi
  405e60:	33 c0                	xor    %eax,%eax
  405e62:	83 e9 01             	sub    $0x1,%ecx
  405e65:	74 0c                	je     0x405e73
  405e67:	33 c0                	xor    %eax,%eax
  405e69:	89 07                	mov    %eax,(%edi)
  405e6b:	83 c7 04             	add    $0x4,%edi
  405e6e:	83 e9 01             	sub    $0x1,%ecx
  405e71:	75 f6                	jne    0x405e69
  405e73:	83 e3 03             	and    $0x3,%ebx
  405e76:	0f 85 77 ff ff ff    	jne    0x405df3
  405e7c:	8b 44 24 10          	mov    0x10(%esp),%eax
  405e80:	5b                   	pop    %ebx
  405e81:	5e                   	pop    %esi
  405e82:	5f                   	pop    %edi
  405e83:	c3                   	ret
  405e84:	cc                   	int3
  405e85:	cc                   	int3
  405e86:	cc                   	int3
  405e87:	cc                   	int3
  405e88:	cc                   	int3
  405e89:	cc                   	int3
  405e8a:	cc                   	int3
  405e8b:	cc                   	int3
  405e8c:	cc                   	int3
  405e8d:	cc                   	int3
  405e8e:	cc                   	int3
  405e8f:	cc                   	int3
  405e90:	55                   	push   %ebp
  405e91:	8b ec                	mov    %esp,%ebp
  405e93:	57                   	push   %edi
  405e94:	8b 7d 08             	mov    0x8(%ebp),%edi
  405e97:	33 c0                	xor    %eax,%eax
  405e99:	83 c9 ff             	or     $0xffffffff,%ecx
  405e9c:	f2 ae                	repnz scas %es:(%edi),%al
  405e9e:	83 c1 01             	add    $0x1,%ecx
  405ea1:	f7 d9                	neg    %ecx
  405ea3:	83 ef 01             	sub    $0x1,%edi
  405ea6:	8a 45 0c             	mov    0xc(%ebp),%al
  405ea9:	fd                   	std
  405eaa:	f2 ae                	repnz scas %es:(%edi),%al
  405eac:	83 c7 01             	add    $0x1,%edi
  405eaf:	38 07                	cmp    %al,(%edi)
  405eb1:	74 04                	je     0x405eb7
  405eb3:	33 c0                	xor    %eax,%eax
  405eb5:	eb 02                	jmp    0x405eb9
  405eb7:	8b c7                	mov    %edi,%eax
  405eb9:	fc                   	cld
  405eba:	5f                   	pop    %edi
  405ebb:	c9                   	leave
  405ebc:	c3                   	ret
  405ebd:	8b 44 24 04          	mov    0x4(%esp),%eax
  405ec1:	66 8b 08             	mov    (%eax),%cx
  405ec4:	40                   	inc    %eax
  405ec5:	40                   	inc    %eax
  405ec6:	66 85 c9             	test   %cx,%cx
  405ec9:	75 f6                	jne    0x405ec1
  405ecb:	2b 44 24 04          	sub    0x4(%esp),%eax
  405ecf:	d1 f8                	sar    $1,%eax
  405ed1:	48                   	dec    %eax
  405ed2:	c3                   	ret
  405ed3:	6a 14                	push   $0x14
  405ed5:	68 e8 d5 40 00       	push   $0x40d5e8
  405eda:	e8 dd 16 00 00       	call   0x4075bc
  405edf:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  405ee3:	ff 4d 10             	decl   0x10(%ebp)
  405ee6:	78 0e                	js     0x405ef6
  405ee8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  405eeb:	2b 4d 0c             	sub    0xc(%ebp),%ecx
  405eee:	89 4d 08             	mov    %ecx,0x8(%ebp)
  405ef1:	ff 55 14             	call   *0x14(%ebp)
  405ef4:	eb ed                	jmp    0x405ee3
  405ef6:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  405efa:	e8 f8 16 00 00       	call   0x4075f7
  405eff:	c2 10 00             	ret    $0x10
  405f02:	8b 45 ec             	mov    -0x14(%ebp),%eax
  405f05:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  405f08:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  405f0b:	8b 00                	mov    (%eax),%eax
  405f0d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  405f10:	8b 45 e0             	mov    -0x20(%ebp),%eax
  405f13:	81 38 63 73 6d e0    	cmpl   $0xe06d7363,(%eax)
  405f19:	74 10                	je     0x405f2b
  405f1b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  405f22:	8b 45 dc             	mov    -0x24(%ebp),%eax
  405f25:	c3                   	ret
  405f26:	8b 65 e8             	mov    -0x18(%ebp),%esp
  405f29:	eb cb                	jmp    0x405ef6
  405f2b:	e8 e5 15 00 00       	call   0x407515
  405f30:	cc                   	int3
  405f31:	6a 0c                	push   $0xc
  405f33:	68 f8 d5 40 00       	push   $0x40d5f8
  405f38:	e8 7f 16 00 00       	call   0x4075bc
  405f3d:	83 65 e4 00          	andl   $0x0,-0x1c(%ebp)
  405f41:	8b 75 0c             	mov    0xc(%ebp),%esi
  405f44:	8b c6                	mov    %esi,%eax
  405f46:	0f af 45 10          	imul   0x10(%ebp),%eax
  405f4a:	01 45 08             	add    %eax,0x8(%ebp)
  405f4d:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  405f51:	ff 4d 10             	decl   0x10(%ebp)
  405f54:	78 0b                	js     0x405f61
  405f56:	29 75 08             	sub    %esi,0x8(%ebp)
  405f59:	8b 4d 08             	mov    0x8(%ebp),%ecx
  405f5c:	ff 55 14             	call   *0x14(%ebp)
  405f5f:	eb f0                	jmp    0x405f51
  405f61:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  405f68:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  405f6c:	e8 08 00 00 00       	call   0x405f79
  405f71:	e8 81 16 00 00       	call   0x4075f7
  405f76:	c2 10 00             	ret    $0x10
  405f79:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  405f7d:	75 11                	jne    0x405f90
  405f7f:	ff 75 14             	push   0x14(%ebp)
  405f82:	ff 75 10             	push   0x10(%ebp)
  405f85:	ff 75 0c             	push   0xc(%ebp)
  405f88:	ff 75 08             	push   0x8(%ebp)
  405f8b:	e8 43 ff ff ff       	call   0x405ed3
  405f90:	c3                   	ret
  405f91:	6a 10                	push   $0x10
  405f93:	68 08 d6 40 00       	push   $0x40d608
  405f98:	e8 1f 16 00 00       	call   0x4075bc
  405f9d:	33 c0                	xor    %eax,%eax
  405f9f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  405fa2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  405fa5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  405fa8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  405fab:	3b 45 10             	cmp    0x10(%ebp),%eax
  405fae:	7d 13                	jge    0x405fc3
  405fb0:	8b 75 08             	mov    0x8(%ebp),%esi
  405fb3:	8b ce                	mov    %esi,%ecx
  405fb5:	ff 55 14             	call   *0x14(%ebp)
  405fb8:	03 75 0c             	add    0xc(%ebp),%esi
  405fbb:	89 75 08             	mov    %esi,0x8(%ebp)
  405fbe:	ff 45 e4             	incl   -0x1c(%ebp)
  405fc1:	eb e5                	jmp    0x405fa8
  405fc3:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
  405fca:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  405fce:	e8 08 00 00 00       	call   0x405fdb
  405fd3:	e8 1f 16 00 00       	call   0x4075f7
  405fd8:	c2 14 00             	ret    $0x14
  405fdb:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  405fdf:	75 11                	jne    0x405ff2
  405fe1:	ff 75 18             	push   0x18(%ebp)
  405fe4:	ff 75 e4             	push   -0x1c(%ebp)
  405fe7:	ff 75 0c             	push   0xc(%ebp)
  405fea:	ff 75 08             	push   0x8(%ebp)
  405fed:	e8 e1 fe ff ff       	call   0x405ed3
  405ff2:	c3                   	ret
  405ff3:	55                   	push   %ebp
  405ff4:	8b ec                	mov    %esp,%ebp
  405ff6:	51                   	push   %ecx
  405ff7:	56                   	push   %esi
  405ff8:	57                   	push   %edi
  405ff9:	8b f8                	mov    %eax,%edi
  405ffb:	8b 4f 14             	mov    0x14(%edi),%ecx
  405ffe:	83 f9 45             	cmp    $0x45,%ecx
  406001:	7c 72                	jl     0x406075
  406003:	be 8b 00 00 00       	mov    $0x8b,%esi
  406008:	3b ce                	cmp    %esi,%ecx
  40600a:	7f 69                	jg     0x406075
  40600c:	8b 47 10             	mov    0x10(%edi),%eax
  40600f:	85 c0                	test   %eax,%eax
  406011:	7c 05                	jl     0x406018
  406013:	83 f8 0b             	cmp    $0xb,%eax
  406016:	7e 21                	jle    0x406039
  406018:	53                   	push   %ebx
  406019:	6a 0c                	push   $0xc
  40601b:	99                   	cltd
  40601c:	5b                   	pop    %ebx
  40601d:	f7 fb                	idiv   %ebx
  40601f:	5b                   	pop    %ebx
  406020:	03 c8                	add    %eax,%ecx
  406022:	85 d2                	test   %edx,%edx
  406024:	89 57 10             	mov    %edx,0x10(%edi)
  406027:	7d 07                	jge    0x406030
  406029:	83 c2 0c             	add    $0xc,%edx
  40602c:	89 57 10             	mov    %edx,0x10(%edi)
  40602f:	49                   	dec    %ecx
  406030:	83 f9 45             	cmp    $0x45,%ecx
  406033:	7c 40                	jl     0x406075
  406035:	3b ce                	cmp    %esi,%ecx
  406037:	7f 3c                	jg     0x406075
  406039:	f6 c1 03             	test   $0x3,%cl
  40603c:	8b 47 10             	mov    0x10(%edi),%eax
  40603f:	8b 14 85 6c 05 41 00 	mov    0x41056c(,%eax,4),%edx
  406046:	75 06                	jne    0x40604e
  406048:	83 f8 01             	cmp    $0x1,%eax
  40604b:	7e 01                	jle    0x40604e
  40604d:	42                   	inc    %edx
  40604e:	8d 41 ff             	lea    -0x1(%ecx),%eax
  406051:	69 c9 6d 01 00 00    	imul   $0x16d,%ecx,%ecx
  406057:	c1 f8 02             	sar    $0x2,%eax
  40605a:	03 c2                	add    %edx,%eax
  40605c:	8d 84 01 21 9c ff ff 	lea    -0x63df(%ecx,%eax,1),%eax
  406063:	85 c0                	test   %eax,%eax
  406065:	8b 4f 0c             	mov    0xc(%edi),%ecx
  406068:	8d 34 08             	lea    (%eax,%ecx,1),%esi
  40606b:	7c 0f                	jl     0x40607c
  40606d:	85 c9                	test   %ecx,%ecx
  40606f:	7c 13                	jl     0x406084
  406071:	85 f6                	test   %esi,%esi
  406073:	7d 0f                	jge    0x406084
  406075:	83 c8 ff             	or     $0xffffffff,%eax
  406078:	5f                   	pop    %edi
  406079:	5e                   	pop    %esi
  40607a:	c9                   	leave
  40607b:	c3                   	ret
  40607c:	85 c9                	test   %ecx,%ecx
  40607e:	7d 04                	jge    0x406084
  406080:	85 f6                	test   %esi,%esi
  406082:	7d f1                	jge    0x406075
  406084:	8d 0c 76             	lea    (%esi,%esi,2),%ecx
  406087:	c1 e1 03             	shl    $0x3,%ecx
  40608a:	85 f6                	test   %esi,%esi
  40608c:	74 11                	je     0x40609f
  40608e:	8b c1                	mov    %ecx,%eax
  406090:	99                   	cltd
  406091:	f7 fe                	idiv   %esi
  406093:	33 d2                	xor    %edx,%edx
  406095:	83 f8 18             	cmp    $0x18,%eax
  406098:	0f 95 c2             	setne  %dl
  40609b:	8b c2                	mov    %edx,%eax
  40609d:	eb 02                	jmp    0x4060a1
  40609f:	33 c0                	xor    %eax,%eax
  4060a1:	85 c0                	test   %eax,%eax
  4060a3:	75 d0                	jne    0x406075
  4060a5:	85 c9                	test   %ecx,%ecx
  4060a7:	8b 47 08             	mov    0x8(%edi),%eax
  4060aa:	8d 34 08             	lea    (%eax,%ecx,1),%esi
  4060ad:	7c 0a                	jl     0x4060b9
  4060af:	85 c0                	test   %eax,%eax
  4060b1:	7c 0e                	jl     0x4060c1
  4060b3:	85 f6                	test   %esi,%esi
  4060b5:	7c be                	jl     0x406075
  4060b7:	eb 08                	jmp    0x4060c1
  4060b9:	85 c0                	test   %eax,%eax
  4060bb:	7d 04                	jge    0x4060c1
  4060bd:	85 f6                	test   %esi,%esi
  4060bf:	7d b4                	jge    0x406075
  4060c1:	8b ce                	mov    %esi,%ecx
  4060c3:	6b c9 3c             	imul   $0x3c,%ecx,%ecx
  4060c6:	85 f6                	test   %esi,%esi
  4060c8:	74 11                	je     0x4060db
  4060ca:	8b c1                	mov    %ecx,%eax
  4060cc:	99                   	cltd
  4060cd:	f7 fe                	idiv   %esi
  4060cf:	33 d2                	xor    %edx,%edx
  4060d1:	83 f8 3c             	cmp    $0x3c,%eax
  4060d4:	0f 95 c2             	setne  %dl
  4060d7:	8b c2                	mov    %edx,%eax
  4060d9:	eb 02                	jmp    0x4060dd
  4060db:	33 c0                	xor    %eax,%eax
  4060dd:	85 c0                	test   %eax,%eax
  4060df:	75 94                	jne    0x406075
  4060e1:	85 c9                	test   %ecx,%ecx
  4060e3:	8b 47 04             	mov    0x4(%edi),%eax
  4060e6:	8d 34 08             	lea    (%eax,%ecx,1),%esi
  4060e9:	7c 0a                	jl     0x4060f5
  4060eb:	85 c0                	test   %eax,%eax
  4060ed:	7c 12                	jl     0x406101
  4060ef:	85 f6                	test   %esi,%esi
  4060f1:	7c 82                	jl     0x406075
  4060f3:	eb 0c                	jmp    0x406101
  4060f5:	85 c0                	test   %eax,%eax
  4060f7:	7d 08                	jge    0x406101
  4060f9:	85 f6                	test   %esi,%esi
  4060fb:	0f 8d 74 ff ff ff    	jge    0x406075
  406101:	8b ce                	mov    %esi,%ecx
  406103:	6b c9 3c             	imul   $0x3c,%ecx,%ecx
  406106:	85 f6                	test   %esi,%esi
  406108:	74 11                	je     0x40611b
  40610a:	8b c1                	mov    %ecx,%eax
  40610c:	99                   	cltd
  40610d:	f7 fe                	idiv   %esi
  40610f:	33 d2                	xor    %edx,%edx
  406111:	83 f8 3c             	cmp    $0x3c,%eax
  406114:	0f 95 c2             	setne  %dl
  406117:	8b c2                	mov    %edx,%eax
  406119:	eb 02                	jmp    0x40611d
  40611b:	33 c0                	xor    %eax,%eax
  40611d:	85 c0                	test   %eax,%eax
  40611f:	0f 85 50 ff ff ff    	jne    0x406075
  406125:	85 c9                	test   %ecx,%ecx
  406127:	8b 07                	mov    (%edi),%eax
  406129:	8d 14 08             	lea    (%eax,%ecx,1),%edx
  40612c:	89 55 fc             	mov    %edx,-0x4(%ebp)
  40612f:	7c 0e                	jl     0x40613f
  406131:	85 c0                	test   %eax,%eax
  406133:	7c 16                	jl     0x40614b
  406135:	85 d2                	test   %edx,%edx
  406137:	0f 8c 38 ff ff ff    	jl     0x406075
  40613d:	eb 0c                	jmp    0x40614b
  40613f:	85 c0                	test   %eax,%eax
  406141:	7d 08                	jge    0x40614b
  406143:	85 d2                	test   %edx,%edx
  406145:	0f 8d 2a ff ff ff    	jge    0x406075
  40614b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  40614f:	74 41                	je     0x406192
  406151:	e8 48 1c 00 00       	call   0x407d9e
  406156:	a1 88 04 41 00       	mov    0x410488,%eax
  40615b:	01 45 fc             	add    %eax,-0x4(%ebp)
  40615e:	8d 45 fc             	lea    -0x4(%ebp),%eax
  406161:	50                   	push   %eax
  406162:	e8 59 00 00 00       	call   0x4061c0
  406167:	85 c0                	test   %eax,%eax
  406169:	59                   	pop    %ecx
  40616a:	0f 84 05 ff ff ff    	je     0x406075
  406170:	8b 4f 20             	mov    0x20(%edi),%ecx
  406173:	85 c9                	test   %ecx,%ecx
  406175:	7f 08                	jg     0x40617f
  406177:	7d 2b                	jge    0x4061a4
  406179:	83 78 20 00          	cmpl   $0x0,0x20(%eax)
  40617d:	7e 25                	jle    0x4061a4
  40617f:	a1 90 04 41 00       	mov    0x410490,%eax
  406184:	01 45 fc             	add    %eax,-0x4(%ebp)
  406187:	8d 45 fc             	lea    -0x4(%ebp),%eax
  40618a:	50                   	push   %eax
  40618b:	e8 30 00 00 00       	call   0x4061c0
  406190:	eb 09                	jmp    0x40619b
  406192:	8d 45 fc             	lea    -0x4(%ebp),%eax
  406195:	50                   	push   %eax
  406196:	e8 76 15 00 00       	call   0x407711
  40619b:	85 c0                	test   %eax,%eax
  40619d:	59                   	pop    %ecx
  40619e:	0f 84 d1 fe ff ff    	je     0x406075
  4061a4:	6a 09                	push   $0x9
  4061a6:	8b f0                	mov    %eax,%esi
  4061a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  4061ab:	59                   	pop    %ecx
  4061ac:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  4061ae:	e9 c5 fe ff ff       	jmp    0x406078
  4061b3:	8b 44 24 04          	mov    0x4(%esp),%eax
  4061b7:	6a 01                	push   $0x1
  4061b9:	e8 35 fe ff ff       	call   0x405ff3
  4061be:	59                   	pop    %ecx
  4061bf:	c3                   	ret
  4061c0:	55                   	push   %ebp
  4061c1:	8b ec                	mov    %esp,%ebp
  4061c3:	56                   	push   %esi
  4061c4:	8b 75 08             	mov    0x8(%ebp),%esi
  4061c7:	83 3e 00             	cmpl   $0x0,(%esi)
  4061ca:	7d 07                	jge    0x4061d3
  4061cc:	33 c0                	xor    %eax,%eax
  4061ce:	e9 32 01 00 00       	jmp    0x406305
  4061d3:	e8 c6 1b 00 00       	call   0x407d9e
  4061d8:	8b 06                	mov    (%esi),%eax
  4061da:	3d 80 f4 03 00       	cmp    $0x3f480,%eax
  4061df:	7e 58                	jle    0x406239
  4061e1:	3d 7f 0b fc 7f       	cmp    $0x7ffc0b7f,%eax
  4061e6:	7d 51                	jge    0x406239
  4061e8:	2b 05 88 04 41 00    	sub    0x410488,%eax
  4061ee:	89 45 08             	mov    %eax,0x8(%ebp)
  4061f1:	8d 45 08             	lea    0x8(%ebp),%eax
  4061f4:	50                   	push   %eax
  4061f5:	e8 17 15 00 00       	call   0x407711
  4061fa:	83 3d 8c 04 41 00 00 	cmpl   $0x0,0x41048c
  406201:	59                   	pop    %ecx
  406202:	8b f0                	mov    %eax,%esi
  406204:	0f 84 f9 00 00 00    	je     0x406303
  40620a:	56                   	push   %esi
  40620b:	e8 01 1a 00 00       	call   0x407c11
  406210:	85 c0                	test   %eax,%eax
  406212:	59                   	pop    %ecx
  406213:	0f 84 ea 00 00 00    	je     0x406303
  406219:	a1 90 04 41 00       	mov    0x410490,%eax
  40621e:	29 45 08             	sub    %eax,0x8(%ebp)
  406221:	8d 45 08             	lea    0x8(%ebp),%eax
  406224:	50                   	push   %eax
  406225:	e8 e7 14 00 00       	call   0x407711
  40622a:	8b f0                	mov    %eax,%esi
  40622c:	59                   	pop    %ecx
  40622d:	c7 46 20 01 00 00 00 	movl   $0x1,0x20(%esi)
  406234:	e9 ca 00 00 00       	jmp    0x406303
  406239:	56                   	push   %esi
  40623a:	e8 d2 14 00 00       	call   0x407711
  40623f:	83 3d 8c 04 41 00 00 	cmpl   $0x0,0x41048c
  406246:	59                   	pop    %ecx
  406247:	8b f0                	mov    %eax,%esi
  406249:	74 28                	je     0x406273
  40624b:	56                   	push   %esi
  40624c:	e8 c0 19 00 00       	call   0x407c11
  406251:	85 c0                	test   %eax,%eax
  406253:	59                   	pop    %ecx
  406254:	74 1d                	je     0x406273
  406256:	8b 06                	mov    (%esi),%eax
  406258:	2b 05 90 04 41 00    	sub    0x410490,%eax
  40625e:	2b 05 88 04 41 00    	sub    0x410488,%eax
  406264:	89 45 08             	mov    %eax,0x8(%ebp)
  406267:	c7 46 20 01 00 00 00 	movl   $0x1,0x20(%esi)
  40626e:	8b 45 08             	mov    0x8(%ebp),%eax
  406271:	eb 0b                	jmp    0x40627e
  406273:	8b 06                	mov    (%esi),%eax
  406275:	2b 05 88 04 41 00    	sub    0x410488,%eax
  40627b:	89 45 08             	mov    %eax,0x8(%ebp)
  40627e:	53                   	push   %ebx
  40627f:	6a 3c                	push   $0x3c
  406281:	59                   	pop    %ecx
  406282:	99                   	cltd
  406283:	8b d9                	mov    %ecx,%ebx
  406285:	f7 fb                	idiv   %ebx
  406287:	85 d2                	test   %edx,%edx
  406289:	89 16                	mov    %edx,(%esi)
  40628b:	7d 07                	jge    0x406294
  40628d:	03 d1                	add    %ecx,%edx
  40628f:	89 16                	mov    %edx,(%esi)
  406291:	29 4d 08             	sub    %ecx,0x8(%ebp)
  406294:	8b 45 08             	mov    0x8(%ebp),%eax
  406297:	99                   	cltd
  406298:	8b d9                	mov    %ecx,%ebx
  40629a:	f7 fb                	idiv   %ebx
  40629c:	03 46 04             	add    0x4(%esi),%eax
  40629f:	89 45 08             	mov    %eax,0x8(%ebp)
  4062a2:	99                   	cltd
  4062a3:	f7 fb                	idiv   %ebx
  4062a5:	5b                   	pop    %ebx
  4062a6:	85 d2                	test   %edx,%edx
  4062a8:	89 56 04             	mov    %edx,0x4(%esi)
  4062ab:	7d 09                	jge    0x4062b6
  4062ad:	83 c2 3c             	add    $0x3c,%edx
  4062b0:	89 56 04             	mov    %edx,0x4(%esi)
  4062b3:	29 4d 08             	sub    %ecx,0x8(%ebp)
  4062b6:	8b 45 08             	mov    0x8(%ebp),%eax
  4062b9:	99                   	cltd
  4062ba:	f7 f9                	idiv   %ecx
  4062bc:	6a 18                	push   $0x18
  4062be:	59                   	pop    %ecx
  4062bf:	03 46 08             	add    0x8(%esi),%eax
  4062c2:	89 45 08             	mov    %eax,0x8(%ebp)
  4062c5:	99                   	cltd
  4062c6:	f7 f9                	idiv   %ecx
  4062c8:	85 d2                	test   %edx,%edx
  4062ca:	89 56 08             	mov    %edx,0x8(%esi)
  4062cd:	7d 08                	jge    0x4062d7
  4062cf:	03 d1                	add    %ecx,%edx
  4062d1:	89 56 08             	mov    %edx,0x8(%esi)
  4062d4:	29 4d 08             	sub    %ecx,0x8(%ebp)
  4062d7:	8b 45 08             	mov    0x8(%ebp),%eax
  4062da:	6a 18                	push   $0x18
  4062dc:	99                   	cltd
  4062dd:	59                   	pop    %ecx
  4062de:	f7 f9                	idiv   %ecx
  4062e0:	8b c8                	mov    %eax,%ecx
  4062e2:	85 c9                	test   %ecx,%ecx
  4062e4:	89 4d 08             	mov    %ecx,0x8(%ebp)
  4062e7:	7e 1f                	jle    0x406308
  4062e9:	8b 46 18             	mov    0x18(%esi),%eax
  4062ec:	03 c1                	add    %ecx,%eax
  4062ee:	99                   	cltd
  4062ef:	6a 07                	push   $0x7
  4062f1:	59                   	pop    %ecx
  4062f2:	f7 f9                	idiv   %ecx
  4062f4:	89 56 18             	mov    %edx,0x18(%esi)
  4062f7:	8b 45 08             	mov    0x8(%ebp),%eax
  4062fa:	01 46 0c             	add    %eax,0xc(%esi)
  4062fd:	8b 45 08             	mov    0x8(%ebp),%eax
  406300:	01 46 1c             	add    %eax,0x1c(%esi)
  406303:	8b c6                	mov    %esi,%eax
  406305:	5e                   	pop    %esi
  406306:	5d                   	pop    %ebp
  406307:	c3                   	ret
  406308:	7d f9                	jge    0x406303
  40630a:	8b 46 18             	mov    0x18(%esi),%eax
  40630d:	8d 44 08 07          	lea    0x7(%eax,%ecx,1),%eax
  406311:	99                   	cltd
  406312:	6a 07                	push   $0x7
  406314:	59                   	pop    %ecx
  406315:	f7 f9                	idiv   %ecx
  406317:	89 56 18             	mov    %edx,0x18(%esi)
  40631a:	8b 45 08             	mov    0x8(%ebp),%eax
  40631d:	01 46 0c             	add    %eax,0xc(%esi)
  406320:	8b 46 0c             	mov    0xc(%esi),%eax
  406323:	85 c0                	test   %eax,%eax
  406325:	7f d6                	jg     0x4062fd
  406327:	83 c0 1f             	add    $0x1f,%eax
  40632a:	ff 4e 14             	decl   0x14(%esi)
  40632d:	89 46 0c             	mov    %eax,0xc(%esi)
  406330:	c7 46 1c 6c 01 00 00 	movl   $0x16c,0x1c(%esi)
  406337:	c7 46 10 0b 00 00 00 	movl   $0xb,0x10(%esi)
  40633e:	eb c3                	jmp    0x406303
  406340:	8b 44 24 08          	mov    0x8(%esp),%eax
  406344:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  406348:	0b c8                	or     %eax,%ecx
  40634a:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  40634e:	75 09                	jne    0x406359
  406350:	8b 44 24 04          	mov    0x4(%esp),%eax
  406354:	f7 e1                	mul    %ecx
  406356:	c2 10 00             	ret    $0x10
  406359:	53                   	push   %ebx
  40635a:	f7 e1                	mul    %ecx
  40635c:	8b d8                	mov    %eax,%ebx
  40635e:	8b 44 24 08          	mov    0x8(%esp),%eax
  406362:	f7 64 24 14          	mull   0x14(%esp)
  406366:	03 d8                	add    %eax,%ebx
  406368:	8b 44 24 08          	mov    0x8(%esp),%eax
  40636c:	f7 e1                	mul    %ecx
  40636e:	03 d3                	add    %ebx,%edx
  406370:	5b                   	pop    %ebx
  406371:	c2 10 00             	ret    $0x10
  406374:	cc                   	int3
  406375:	cc                   	int3
  406376:	cc                   	int3
  406377:	cc                   	int3
  406378:	cc                   	int3
  406379:	cc                   	int3
  40637a:	cc                   	int3
  40637b:	cc                   	int3
  40637c:	cc                   	int3
  40637d:	cc                   	int3
  40637e:	cc                   	int3
  40637f:	cc                   	int3
  406380:	55                   	push   %ebp
  406381:	8b ec                	mov    %esp,%ebp
  406383:	57                   	push   %edi
  406384:	56                   	push   %esi
  406385:	8b 75 0c             	mov    0xc(%ebp),%esi
  406388:	8b 4d 10             	mov    0x10(%ebp),%ecx
  40638b:	8b 7d 08             	mov    0x8(%ebp),%edi
  40638e:	8b c1                	mov    %ecx,%eax
  406390:	8b d1                	mov    %ecx,%edx
  406392:	03 c6                	add    %esi,%eax
  406394:	3b fe                	cmp    %esi,%edi
  406396:	76 08                	jbe    0x4063a0
  406398:	3b f8                	cmp    %eax,%edi
  40639a:	0f 82 7c 01 00 00    	jb     0x40651c
  4063a0:	f7 c7 03 00 00 00    	test   $0x3,%edi
  4063a6:	75 14                	jne    0x4063bc
  4063a8:	c1 e9 02             	shr    $0x2,%ecx
  4063ab:	83 e2 03             	and    $0x3,%edx
  4063ae:	83 f9 08             	cmp    $0x8,%ecx
  4063b1:	72 29                	jb     0x4063dc
  4063b3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  4063b5:	ff 24 95 cc 64 40 00 	jmp    *0x4064cc(,%edx,4)
  4063bc:	8b c7                	mov    %edi,%eax
  4063be:	ba 03 00 00 00       	mov    $0x3,%edx
  4063c3:	83 e9 04             	sub    $0x4,%ecx
  4063c6:	72 0c                	jb     0x4063d4
  4063c8:	83 e0 03             	and    $0x3,%eax
  4063cb:	03 c8                	add    %eax,%ecx
  4063cd:	ff 24 85 e0 63 40 00 	jmp    *0x4063e0(,%eax,4)
  4063d4:	ff 24 8d dc 64 40 00 	jmp    *0x4064dc(,%ecx,4)
  4063db:	90                   	nop
  4063dc:	ff 24 8d 60 64 40 00 	jmp    *0x406460(,%ecx,4)
  4063e3:	90                   	nop
  4063e4:	f0 63 40 00          	lock arpl %eax,0x0(%eax)
  4063e8:	1c 64                	sbb    $0x64,%al
  4063ea:	40                   	inc    %eax
  4063eb:	00 40 64             	add    %al,0x64(%eax)
  4063ee:	40                   	inc    %eax
  4063ef:	00 23                	add    %ah,(%ebx)
  4063f1:	d1 8a 06 88 07 8a    	rorl   $1,-0x75f877fa(%edx)
  4063f7:	46                   	inc    %esi
  4063f8:	01 88 47 01 8a 46    	add    %ecx,0x468a0147(%eax)
  4063fe:	02 c1                	add    %cl,%al
  406400:	e9 02 88 47 02       	jmp    0x287ec07
  406405:	83 c6 03             	add    $0x3,%esi
  406408:	83 c7 03             	add    $0x3,%edi
  40640b:	83 f9 08             	cmp    $0x8,%ecx
  40640e:	72 cc                	jb     0x4063dc
  406410:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  406412:	ff 24 95 cc 64 40 00 	jmp    *0x4064cc(,%edx,4)
  406419:	8d 49 00             	lea    0x0(%ecx),%ecx
  40641c:	23 d1                	and    %ecx,%edx
  40641e:	8a 06                	mov    (%esi),%al
  406420:	88 07                	mov    %al,(%edi)
  406422:	8a 46 01             	mov    0x1(%esi),%al
  406425:	c1 e9 02             	shr    $0x2,%ecx
  406428:	88 47 01             	mov    %al,0x1(%edi)
  40642b:	83 c6 02             	add    $0x2,%esi
  40642e:	83 c7 02             	add    $0x2,%edi
  406431:	83 f9 08             	cmp    $0x8,%ecx
  406434:	72 a6                	jb     0x4063dc
  406436:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  406438:	ff 24 95 cc 64 40 00 	jmp    *0x4064cc(,%edx,4)
  40643f:	90                   	nop
  406440:	23 d1                	and    %ecx,%edx
  406442:	8a 06                	mov    (%esi),%al
  406444:	88 07                	mov    %al,(%edi)
  406446:	83 c6 01             	add    $0x1,%esi
  406449:	c1 e9 02             	shr    $0x2,%ecx
  40644c:	83 c7 01             	add    $0x1,%edi
  40644f:	83 f9 08             	cmp    $0x8,%ecx
  406452:	72 88                	jb     0x4063dc
  406454:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  406456:	ff 24 95 cc 64 40 00 	jmp    *0x4064cc(,%edx,4)
  40645d:	8d 49 00             	lea    0x0(%ecx),%ecx
  406460:	c3                   	ret
  406461:	64 40                	fs inc %eax
  406463:	00 b0 64 40 00 a8    	add    %dh,-0x57ffbf9c(%eax)
  406469:	64 40                	fs inc %eax
  40646b:	00 a0 64 40 00 98    	add    %ah,-0x67ffbf9c(%eax)
  406471:	64 40                	fs inc %eax
  406473:	00 90 64 40 00 88    	add    %dl,-0x77ffbf9c(%eax)
  406479:	64 40                	fs inc %eax
  40647b:	00 80 64 40 00 8b    	add    %al,-0x74ffbf9c(%eax)
  406481:	44                   	inc    %esp
  406482:	8e e4                	mov    %esp,%fs
  406484:	89 44 8f e4          	mov    %eax,-0x1c(%edi,%ecx,4)
  406488:	8b 44 8e e8          	mov    -0x18(%esi,%ecx,4),%eax
  40648c:	89 44 8f e8          	mov    %eax,-0x18(%edi,%ecx,4)
  406490:	8b 44 8e ec          	mov    -0x14(%esi,%ecx,4),%eax
  406494:	89 44 8f ec          	mov    %eax,-0x14(%edi,%ecx,4)
  406498:	8b 44 8e f0          	mov    -0x10(%esi,%ecx,4),%eax
  40649c:	89 44 8f f0          	mov    %eax,-0x10(%edi,%ecx,4)
  4064a0:	8b 44 8e f4          	mov    -0xc(%esi,%ecx,4),%eax
  4064a4:	89 44 8f f4          	mov    %eax,-0xc(%edi,%ecx,4)
  4064a8:	8b 44 8e f8          	mov    -0x8(%esi,%ecx,4),%eax
  4064ac:	89 44 8f f8          	mov    %eax,-0x8(%edi,%ecx,4)
  4064b0:	8b 44 8e fc          	mov    -0x4(%esi,%ecx,4),%eax
  4064b4:	89 44 8f fc          	mov    %eax,-0x4(%edi,%ecx,4)
  4064b8:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
  4064bf:	03 f0                	add    %eax,%esi
  4064c1:	03 f8                	add    %eax,%edi
  4064c3:	ff 24 95 cc 64 40 00 	jmp    *0x4064cc(,%edx,4)
  4064ca:	8b ff                	mov    %edi,%edi
  4064cc:	dc 64 40 00          	fsubl  0x0(%eax,%eax,2)
  4064d0:	e4 64                	in     $0x64,%al
  4064d2:	40                   	inc    %eax
  4064d3:	00 f0                	add    %dh,%al
  4064d5:	64 40                	fs inc %eax
  4064d7:	00 04 65 40 00 8b 45 	add    %al,0x458b0040(,%eiz,2)
  4064de:	08 5e 5f             	or     %bl,0x5f(%esi)
  4064e1:	c9                   	leave
  4064e2:	c3                   	ret
  4064e3:	90                   	nop
  4064e4:	8a 06                	mov    (%esi),%al
  4064e6:	88 07                	mov    %al,(%edi)
  4064e8:	8b 45 08             	mov    0x8(%ebp),%eax
  4064eb:	5e                   	pop    %esi
  4064ec:	5f                   	pop    %edi
  4064ed:	c9                   	leave
  4064ee:	c3                   	ret
  4064ef:	90                   	nop
  4064f0:	8a 06                	mov    (%esi),%al
  4064f2:	88 07                	mov    %al,(%edi)
  4064f4:	8a 46 01             	mov    0x1(%esi),%al
  4064f7:	88 47 01             	mov    %al,0x1(%edi)
  4064fa:	8b 45 08             	mov    0x8(%ebp),%eax
  4064fd:	5e                   	pop    %esi
  4064fe:	5f                   	pop    %edi
  4064ff:	c9                   	leave
  406500:	c3                   	ret
  406501:	8d 49 00             	lea    0x0(%ecx),%ecx
  406504:	8a 06                	mov    (%esi),%al
  406506:	88 07                	mov    %al,(%edi)
  406508:	8a 46 01             	mov    0x1(%esi),%al
  40650b:	88 47 01             	mov    %al,0x1(%edi)
  40650e:	8a 46 02             	mov    0x2(%esi),%al
  406511:	88 47 02             	mov    %al,0x2(%edi)
  406514:	8b 45 08             	mov    0x8(%ebp),%eax
  406517:	5e                   	pop    %esi
  406518:	5f                   	pop    %edi
  406519:	c9                   	leave
  40651a:	c3                   	ret
  40651b:	90                   	nop
  40651c:	8d 74 31 fc          	lea    -0x4(%ecx,%esi,1),%esi
  406520:	8d 7c 39 fc          	lea    -0x4(%ecx,%edi,1),%edi
  406524:	f7 c7 03 00 00 00    	test   $0x3,%edi
  40652a:	75 24                	jne    0x406550
  40652c:	c1 e9 02             	shr    $0x2,%ecx
  40652f:	83 e2 03             	and    $0x3,%edx
  406532:	83 f9 08             	cmp    $0x8,%ecx
  406535:	72 0d                	jb     0x406544
  406537:	fd                   	std
  406538:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  40653a:	fc                   	cld
  40653b:	ff 24 95 68 66 40 00 	jmp    *0x406668(,%edx,4)
  406542:	8b ff                	mov    %edi,%edi
  406544:	f7 d9                	neg    %ecx
  406546:	ff 24 8d 18 66 40 00 	jmp    *0x406618(,%ecx,4)
  40654d:	8d 49 00             	lea    0x0(%ecx),%ecx
  406550:	8b c7                	mov    %edi,%eax
  406552:	ba 03 00 00 00       	mov    $0x3,%edx
  406557:	83 f9 04             	cmp    $0x4,%ecx
  40655a:	72 0c                	jb     0x406568
  40655c:	83 e0 03             	and    $0x3,%eax
  40655f:	2b c8                	sub    %eax,%ecx
  406561:	ff 24 85 6c 65 40 00 	jmp    *0x40656c(,%eax,4)
  406568:	ff 24 8d 68 66 40 00 	jmp    *0x406668(,%ecx,4)
  40656f:	90                   	nop
  406570:	7c 65                	jl     0x4065d7
  406572:	40                   	inc    %eax
  406573:	00 a0 65 40 00 c8    	add    %ah,-0x37ffbf9b(%eax)
  406579:	65 40                	gs inc %eax
  40657b:	00 8a 46 03 23 d1    	add    %cl,-0x2edcfcba(%edx)
  406581:	88 47 03             	mov    %al,0x3(%edi)
  406584:	83 ee 01             	sub    $0x1,%esi
  406587:	c1 e9 02             	shr    $0x2,%ecx
  40658a:	83 ef 01             	sub    $0x1,%edi
  40658d:	83 f9 08             	cmp    $0x8,%ecx
  406590:	72 b2                	jb     0x406544
  406592:	fd                   	std
  406593:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  406595:	fc                   	cld
  406596:	ff 24 95 68 66 40 00 	jmp    *0x406668(,%edx,4)
  40659d:	8d 49 00             	lea    0x0(%ecx),%ecx
  4065a0:	8a 46 03             	mov    0x3(%esi),%al
  4065a3:	23 d1                	and    %ecx,%edx
  4065a5:	88 47 03             	mov    %al,0x3(%edi)
  4065a8:	8a 46 02             	mov    0x2(%esi),%al
  4065ab:	c1 e9 02             	shr    $0x2,%ecx
  4065ae:	88 47 02             	mov    %al,0x2(%edi)
  4065b1:	83 ee 02             	sub    $0x2,%esi
  4065b4:	83 ef 02             	sub    $0x2,%edi
  4065b7:	83 f9 08             	cmp    $0x8,%ecx
  4065ba:	72 88                	jb     0x406544
  4065bc:	fd                   	std
  4065bd:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  4065bf:	fc                   	cld
  4065c0:	ff 24 95 68 66 40 00 	jmp    *0x406668(,%edx,4)
  4065c7:	90                   	nop
  4065c8:	8a 46 03             	mov    0x3(%esi),%al
  4065cb:	23 d1                	and    %ecx,%edx
  4065cd:	88 47 03             	mov    %al,0x3(%edi)
  4065d0:	8a 46 02             	mov    0x2(%esi),%al
  4065d3:	88 47 02             	mov    %al,0x2(%edi)
  4065d6:	8a 46 01             	mov    0x1(%esi),%al
  4065d9:	c1 e9 02             	shr    $0x2,%ecx
  4065dc:	88 47 01             	mov    %al,0x1(%edi)
  4065df:	83 ee 03             	sub    $0x3,%esi
  4065e2:	83 ef 03             	sub    $0x3,%edi
  4065e5:	83 f9 08             	cmp    $0x8,%ecx
  4065e8:	0f 82 56 ff ff ff    	jb     0x406544
  4065ee:	fd                   	std
  4065ef:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  4065f1:	fc                   	cld
  4065f2:	ff 24 95 68 66 40 00 	jmp    *0x406668(,%edx,4)
  4065f9:	8d 49 00             	lea    0x0(%ecx),%ecx
  4065fc:	1c 66                	sbb    $0x66,%al
  4065fe:	40                   	inc    %eax
  4065ff:	00 24 66             	add    %ah,(%esi,%eiz,2)
  406602:	40                   	inc    %eax
  406603:	00 2c 66             	add    %ch,(%esi,%eiz,2)
  406606:	40                   	inc    %eax
  406607:	00 34 66             	add    %dh,(%esi,%eiz,2)
  40660a:	40                   	inc    %eax
  40660b:	00 3c 66             	add    %bh,(%esi,%eiz,2)
  40660e:	40                   	inc    %eax
  40660f:	00 44 66 40          	add    %al,0x40(%esi,%eiz,2)
  406613:	00 4c 66 40          	add    %cl,0x40(%esi,%eiz,2)
  406617:	00 5f 66             	add    %bl,0x66(%edi)
  40661a:	40                   	inc    %eax
  40661b:	00 8b 44 8e 1c 89    	add    %cl,-0x76e371bc(%ebx)
  406621:	44                   	inc    %esp
  406622:	8f                   	(bad)
  406623:	1c 8b                	sbb    $0x8b,%al
  406625:	44                   	inc    %esp
  406626:	8e 18                	mov    (%eax),%ds
  406628:	89 44 8f 18          	mov    %eax,0x18(%edi,%ecx,4)
  40662c:	8b 44 8e 14          	mov    0x14(%esi,%ecx,4),%eax
  406630:	89 44 8f 14          	mov    %eax,0x14(%edi,%ecx,4)
  406634:	8b 44 8e 10          	mov    0x10(%esi,%ecx,4),%eax
  406638:	89 44 8f 10          	mov    %eax,0x10(%edi,%ecx,4)
  40663c:	8b 44 8e 0c          	mov    0xc(%esi,%ecx,4),%eax
  406640:	89 44 8f 0c          	mov    %eax,0xc(%edi,%ecx,4)
  406644:	8b 44 8e 08          	mov    0x8(%esi,%ecx,4),%eax
  406648:	89 44 8f 08          	mov    %eax,0x8(%edi,%ecx,4)
  40664c:	8b 44 8e 04          	mov    0x4(%esi,%ecx,4),%eax
  406650:	89 44 8f 04          	mov    %eax,0x4(%edi,%ecx,4)
  406654:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
  40665b:	03 f0                	add    %eax,%esi
  40665d:	03 f8                	add    %eax,%edi
  40665f:	ff 24 95 68 66 40 00 	jmp    *0x406668(,%edx,4)
  406666:	8b ff                	mov    %edi,%edi
  406668:	78 66                	js     0x4066d0
  40666a:	40                   	inc    %eax
  40666b:	00 80 66 40 00 90    	add    %al,-0x6fffbf9a(%eax)
  406671:	66 40                	inc    %ax
  406673:	00 a4 66 40 00 8b 45 	add    %ah,0x458b0040(%esi,%eiz,2)
  40667a:	08 5e 5f             	or     %bl,0x5f(%esi)
  40667d:	c9                   	leave
  40667e:	c3                   	ret
  40667f:	90                   	nop
  406680:	8a 46 03             	mov    0x3(%esi),%al
  406683:	88 47 03             	mov    %al,0x3(%edi)
  406686:	8b 45 08             	mov    0x8(%ebp),%eax
  406689:	5e                   	pop    %esi
  40668a:	5f                   	pop    %edi
  40668b:	c9                   	leave
  40668c:	c3                   	ret
  40668d:	8d 49 00             	lea    0x0(%ecx),%ecx
  406690:	8a 46 03             	mov    0x3(%esi),%al
  406693:	88 47 03             	mov    %al,0x3(%edi)
  406696:	8a 46 02             	mov    0x2(%esi),%al
  406699:	88 47 02             	mov    %al,0x2(%edi)
  40669c:	8b 45 08             	mov    0x8(%ebp),%eax
  40669f:	5e                   	pop    %esi
  4066a0:	5f                   	pop    %edi
  4066a1:	c9                   	leave
  4066a2:	c3                   	ret
  4066a3:	90                   	nop
  4066a4:	8a 46 03             	mov    0x3(%esi),%al
  4066a7:	88 47 03             	mov    %al,0x3(%edi)
  4066aa:	8a 46 02             	mov    0x2(%esi),%al
  4066ad:	88 47 02             	mov    %al,0x2(%edi)
  4066b0:	8a 46 01             	mov    0x1(%esi),%al
  4066b3:	88 47 01             	mov    %al,0x1(%edi)
  4066b6:	8b 45 08             	mov    0x8(%ebp),%eax
  4066b9:	5e                   	pop    %esi
  4066ba:	5f                   	pop    %edi
  4066bb:	c9                   	leave
  4066bc:	c3                   	ret
  4066bd:	83 3d 4c 1d 41 00 01 	cmpl   $0x1,0x411d4c
  4066c4:	75 05                	jne    0x4066cb
  4066c6:	e8 5f 18 00 00       	call   0x407f2a
  4066cb:	ff 74 24 04          	push   0x4(%esp)
  4066cf:	e8 df 16 00 00       	call   0x407db3
  4066d4:	68 ff 00 00 00       	push   $0xff
  4066d9:	ff 15 60 04 41 00    	call   *0x410460
  4066df:	59                   	pop    %ecx
  4066e0:	59                   	pop    %ecx
  4066e1:	c3                   	ret
  4066e2:	6a 60                	push   $0x60
  4066e4:	68 18 d6 40 00       	push   $0x40d618
  4066e9:	e8 ce 0e 00 00       	call   0x4075bc
  4066ee:	bf 94 00 00 00       	mov    $0x94,%edi
  4066f3:	8b c7                	mov    %edi,%eax
  4066f5:	e8 16 f6 ff ff       	call   0x405d10
  4066fa:	89 65 e8             	mov    %esp,-0x18(%ebp)
  4066fd:	8b f4                	mov    %esp,%esi
  4066ff:	89 3e                	mov    %edi,(%esi)
  406701:	56                   	push   %esi
  406702:	ff 15 40 d1 40 00    	call   *0x40d140  ; 0x40d140=KERNEL32.dll!GetVersionExA
  406708:	8b 4e 10             	mov    0x10(%esi),%ecx
  40670b:	89 0d 5c 1d 41 00    	mov    %ecx,0x411d5c
  406711:	8b 46 04             	mov    0x4(%esi),%eax
  406714:	a3 68 1d 41 00       	mov    %eax,0x411d68
  406719:	8b 56 08             	mov    0x8(%esi),%edx
  40671c:	89 15 6c 1d 41 00    	mov    %edx,0x411d6c
  406722:	8b 76 0c             	mov    0xc(%esi),%esi
  406725:	81 e6 ff 7f 00 00    	and    $0x7fff,%esi
  40672b:	89 35 60 1d 41 00    	mov    %esi,0x411d60
  406731:	83 f9 02             	cmp    $0x2,%ecx
  406734:	74 0c                	je     0x406742
  406736:	81 ce 00 80 00 00    	or     $0x8000,%esi
  40673c:	89 35 60 1d 41 00    	mov    %esi,0x411d60
  406742:	c1 e0 08             	shl    $0x8,%eax
  406745:	03 c2                	add    %edx,%eax
  406747:	a3 64 1d 41 00       	mov    %eax,0x411d64
  40674c:	33 f6                	xor    %esi,%esi
  40674e:	56                   	push   %esi
  40674f:	8b 3d 34 d1 40 00    	mov    0x40d134,%edi  ; 0x40d134=KERNEL32.dll!GetModuleHandleA
  406755:	ff d7                	call   *%edi
  406757:	66 81 38 4d 5a       	cmpw   $0x5a4d,(%eax)
  40675c:	75 1f                	jne    0x40677d
  40675e:	8b 48 3c             	mov    0x3c(%eax),%ecx
  406761:	03 c8                	add    %eax,%ecx
  406763:	81 39 50 45 00 00    	cmpl   $0x4550,(%ecx)
  406769:	75 12                	jne    0x40677d
  40676b:	0f b7 41 18          	movzwl 0x18(%ecx),%eax
  40676f:	3d 0b 01 00 00       	cmp    $0x10b,%eax
  406774:	74 1f                	je     0x406795
  406776:	3d 0b 02 00 00       	cmp    $0x20b,%eax
  40677b:	74 05                	je     0x406782
  40677d:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  406780:	eb 27                	jmp    0x4067a9
  406782:	83 b9 84 00 00 00 0e 	cmpl   $0xe,0x84(%ecx)
  406789:	76 f2                	jbe    0x40677d
  40678b:	33 c0                	xor    %eax,%eax
  40678d:	39 b1 f8 00 00 00    	cmp    %esi,0xf8(%ecx)
  406793:	eb 0e                	jmp    0x4067a3
  406795:	83 79 74 0e          	cmpl   $0xe,0x74(%ecx)
  406799:	76 e2                	jbe    0x40677d
  40679b:	33 c0                	xor    %eax,%eax
  40679d:	39 b1 e8 00 00 00    	cmp    %esi,0xe8(%ecx)
  4067a3:	0f 95 c0             	setne  %al
  4067a6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  4067a9:	56                   	push   %esi
  4067aa:	e8 c6 1f 00 00       	call   0x408775
  4067af:	59                   	pop    %ecx
  4067b0:	85 c0                	test   %eax,%eax
  4067b2:	75 21                	jne    0x4067d5
  4067b4:	83 3d 4c 1d 41 00 01 	cmpl   $0x1,0x411d4c
  4067bb:	75 05                	jne    0x4067c2
  4067bd:	e8 68 17 00 00       	call   0x407f2a
  4067c2:	6a 1c                	push   $0x1c
  4067c4:	e8 ea 15 00 00       	call   0x407db3
  4067c9:	68 ff 00 00 00       	push   $0xff
  4067ce:	e8 4d 02 00 00       	call   0x406a20
  4067d3:	59                   	pop    %ecx
  4067d4:	59                   	pop    %ecx
  4067d5:	e8 f9 1e 00 00       	call   0x4086d3
  4067da:	89 75 fc             	mov    %esi,-0x4(%ebp)
  4067dd:	e8 46 1d 00 00       	call   0x408528
  4067e2:	85 c0                	test   %eax,%eax
  4067e4:	7d 08                	jge    0x4067ee
  4067e6:	6a 1b                	push   $0x1b
  4067e8:	e8 d0 fe ff ff       	call   0x4066bd
  4067ed:	59                   	pop    %ecx
  4067ee:	ff 15 3c d1 40 00    	call   *0x40d13c  ; 0x40d13c=KERNEL32.dll!GetCommandLineA
  4067f4:	a3 14 34 41 00       	mov    %eax,0x413414
  4067f9:	e8 08 1c 00 00       	call   0x408406
  4067fe:	a3 44 1d 41 00       	mov    %eax,0x411d44
  406803:	e8 5c 1b 00 00       	call   0x408364
  406808:	85 c0                	test   %eax,%eax
  40680a:	7d 08                	jge    0x406814
  40680c:	6a 08                	push   $0x8
  40680e:	e8 aa fe ff ff       	call   0x4066bd
  406813:	59                   	pop    %ecx
  406814:	e8 18 19 00 00       	call   0x408131
  406819:	85 c0                	test   %eax,%eax
  40681b:	7d 08                	jge    0x406825
  40681d:	6a 09                	push   $0x9
  40681f:	e8 99 fe ff ff       	call   0x4066bd
  406824:	59                   	pop    %ecx
  406825:	6a 01                	push   $0x1
  406827:	e8 24 02 00 00       	call   0x406a50
  40682c:	59                   	pop    %ecx
  40682d:	89 45 d8             	mov    %eax,-0x28(%ebp)
  406830:	3b c6                	cmp    %esi,%eax
  406832:	74 07                	je     0x40683b
  406834:	50                   	push   %eax
  406835:	e8 83 fe ff ff       	call   0x4066bd
  40683a:	59                   	pop    %ecx
  40683b:	89 75 bc             	mov    %esi,-0x44(%ebp)
  40683e:	8d 45 90             	lea    -0x70(%ebp),%eax
  406841:	50                   	push   %eax
  406842:	ff 15 38 d1 40 00    	call   *0x40d138  ; 0x40d138=KERNEL32.dll!GetStartupInfoA
  406848:	e8 87 18 00 00       	call   0x4080d4
  40684d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  406850:	f6 45 bc 01          	testb  $0x1,-0x44(%ebp)
  406854:	74 06                	je     0x40685c
  406856:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
  40685a:	eb 03                	jmp    0x40685f
  40685c:	6a 0a                	push   $0xa
  40685e:	58                   	pop    %eax
  40685f:	50                   	push   %eax
  406860:	ff 75 e0             	push   -0x20(%ebp)
  406863:	56                   	push   %esi
  406864:	56                   	push   %esi
  406865:	ff d7                	call   *%edi
  406867:	50                   	push   %eax
  406868:	e8 93 ac ff ff       	call   0x401500
  40686d:	8b f8                	mov    %eax,%edi
  40686f:	89 7d d4             	mov    %edi,-0x2c(%ebp)
  406872:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  406875:	75 06                	jne    0x40687d
  406877:	57                   	push   %edi
  406878:	e8 fe 02 00 00       	call   0x406b7b
  40687d:	e8 1b 03 00 00       	call   0x406b9d
  406882:	eb 2b                	jmp    0x4068af
  406884:	8b 45 ec             	mov    -0x14(%ebp),%eax
  406887:	8b 08                	mov    (%eax),%ecx
  406889:	8b 09                	mov    (%ecx),%ecx
  40688b:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  40688e:	50                   	push   %eax
  40688f:	51                   	push   %ecx
  406890:	e8 ce 16 00 00       	call   0x407f63
  406895:	59                   	pop    %ecx
  406896:	59                   	pop    %ecx
  406897:	c3                   	ret
  406898:	8b 65 e8             	mov    -0x18(%ebp),%esp
  40689b:	8b 7d dc             	mov    -0x24(%ebp),%edi
  40689e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  4068a2:	75 06                	jne    0x4068aa
  4068a4:	57                   	push   %edi
  4068a5:	e8 e2 02 00 00       	call   0x406b8c
  4068aa:	e8 fd 02 00 00       	call   0x406bac
  4068af:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  4068b3:	8b c7                	mov    %edi,%eax
  4068b5:	8d 65 84             	lea    -0x7c(%ebp),%esp
  4068b8:	e8 3a 0d 00 00       	call   0x4075f7
  4068bd:	c3                   	ret
  4068be:	53                   	push   %ebx
  4068bf:	8b 5c 24 08          	mov    0x8(%esp),%ebx
  4068c3:	85 db                	test   %ebx,%ebx
  4068c5:	55                   	push   %ebp
  4068c6:	57                   	push   %edi
  4068c7:	75 0f                	jne    0x4068d8
  4068c9:	ff 74 24 14          	push   0x14(%esp)
  4068cd:	e8 93 03 00 00       	call   0x406c65
  4068d2:	59                   	pop    %ecx
  4068d3:	e9 44 01 00 00       	jmp    0x406a1c
  4068d8:	56                   	push   %esi
  4068d9:	8b 74 24 18          	mov    0x18(%esp),%esi
  4068dd:	85 f6                	test   %esi,%esi
  4068df:	75 0c                	jne    0x4068ed
  4068e1:	53                   	push   %ebx
  4068e2:	e8 90 03 00 00       	call   0x406c77
  4068e7:	59                   	pop    %ecx
  4068e8:	e9 2c 01 00 00       	jmp    0x406a19
  4068ed:	83 3d e4 32 41 00 03 	cmpl   $0x3,0x4132e4
  4068f4:	0f 85 eb 00 00 00    	jne    0x4069e5
  4068fa:	33 ff                	xor    %edi,%edi
  4068fc:	83 fe e0             	cmp    $0xffffffe0,%esi
  4068ff:	0f 87 c2 00 00 00    	ja     0x4069c7
  406905:	53                   	push   %ebx
  406906:	e8 1e 1f 00 00       	call   0x408829
  40690b:	8b e8                	mov    %eax,%ebp
  40690d:	85 ed                	test   %ebp,%ebp
  40690f:	59                   	pop    %ecx
  406910:	0f 84 90 00 00 00    	je     0x4069a6
  406916:	3b 35 d0 32 41 00    	cmp    0x4132d0,%esi
  40691c:	77 48                	ja     0x406966
  40691e:	56                   	push   %esi
  40691f:	53                   	push   %ebx
  406920:	55                   	push   %ebp
  406921:	e8 03 24 00 00       	call   0x408d29
  406926:	83 c4 0c             	add    $0xc,%esp
  406929:	85 c0                	test   %eax,%eax
  40692b:	74 04                	je     0x406931
  40692d:	8b fb                	mov    %ebx,%edi
  40692f:	eb 31                	jmp    0x406962
  406931:	56                   	push   %esi
  406932:	e8 d1 26 00 00       	call   0x409008
  406937:	8b f8                	mov    %eax,%edi
  406939:	85 ff                	test   %edi,%edi
  40693b:	59                   	pop    %ecx
  40693c:	74 28                	je     0x406966
  40693e:	8b 43 fc             	mov    -0x4(%ebx),%eax
  406941:	48                   	dec    %eax
  406942:	3b c6                	cmp    %esi,%eax
  406944:	72 02                	jb     0x406948
  406946:	8b c6                	mov    %esi,%eax
  406948:	50                   	push   %eax
  406949:	53                   	push   %ebx
  40694a:	57                   	push   %edi
  40694b:	e8 c0 29 00 00       	call   0x409310
  406950:	53                   	push   %ebx
  406951:	e8 d3 1e 00 00       	call   0x408829
  406956:	8b e8                	mov    %eax,%ebp
  406958:	53                   	push   %ebx
  406959:	55                   	push   %ebp
  40695a:	e8 f5 1e 00 00       	call   0x408854
  40695f:	83 c4 18             	add    $0x18,%esp
  406962:	85 ff                	test   %edi,%edi
  406964:	75 3c                	jne    0x4069a2
  406966:	85 f6                	test   %esi,%esi
  406968:	75 01                	jne    0x40696b
  40696a:	46                   	inc    %esi
  40696b:	83 c6 0f             	add    $0xf,%esi
  40696e:	83 e6 f0             	and    $0xfffffff0,%esi
  406971:	56                   	push   %esi
  406972:	6a 00                	push   $0x0
  406974:	ff 35 e0 32 41 00    	push   0x4132e0
  40697a:	ff 15 48 d1 40 00    	call   *0x40d148  ; 0x40d148=KERNEL32.dll!HeapAlloc
  406980:	8b f8                	mov    %eax,%edi
  406982:	85 ff                	test   %edi,%edi
  406984:	74 1c                	je     0x4069a2
  406986:	8b 43 fc             	mov    -0x4(%ebx),%eax
  406989:	48                   	dec    %eax
  40698a:	3b c6                	cmp    %esi,%eax
  40698c:	72 02                	jb     0x406990
  40698e:	8b c6                	mov    %esi,%eax
  406990:	50                   	push   %eax
  406991:	53                   	push   %ebx
  406992:	57                   	push   %edi
  406993:	e8 78 29 00 00       	call   0x409310
  406998:	53                   	push   %ebx
  406999:	55                   	push   %ebp
  40699a:	e8 b5 1e 00 00       	call   0x408854
  40699f:	83 c4 14             	add    $0x14,%esp
  4069a2:	85 ed                	test   %ebp,%ebp
  4069a4:	75 1d                	jne    0x4069c3
  4069a6:	85 f6                	test   %esi,%esi
  4069a8:	75 01                	jne    0x4069ab
  4069aa:	46                   	inc    %esi
  4069ab:	83 c6 0f             	add    $0xf,%esi
  4069ae:	83 e6 f0             	and    $0xfffffff0,%esi
  4069b1:	56                   	push   %esi
  4069b2:	53                   	push   %ebx
  4069b3:	6a 00                	push   $0x0
  4069b5:	ff 35 e0 32 41 00    	push   0x4132e0
  4069bb:	ff 15 44 d1 40 00    	call   *0x40d144  ; 0x40d144=KERNEL32.dll!HeapReAlloc
  4069c1:	8b f8                	mov    %eax,%edi
  4069c3:	85 ff                	test   %edi,%edi
  4069c5:	75 1a                	jne    0x4069e1
  4069c7:	83 3d a8 1f 41 00 00 	cmpl   $0x0,0x411fa8
  4069ce:	74 11                	je     0x4069e1
  4069d0:	56                   	push   %esi
  4069d1:	e8 f0 1d 00 00       	call   0x4087c6
  4069d6:	85 c0                	test   %eax,%eax
  4069d8:	59                   	pop    %ecx
  4069d9:	0f 85 1b ff ff ff    	jne    0x4068fa
  4069df:	eb 38                	jmp    0x406a19
  4069e1:	8b c7                	mov    %edi,%eax
  4069e3:	eb 36                	jmp    0x406a1b
  4069e5:	33 c0                	xor    %eax,%eax
  4069e7:	83 fe e0             	cmp    $0xffffffe0,%esi
  4069ea:	77 19                	ja     0x406a05
  4069ec:	85 f6                	test   %esi,%esi
  4069ee:	75 01                	jne    0x4069f1
  4069f0:	46                   	inc    %esi
  4069f1:	56                   	push   %esi
  4069f2:	53                   	push   %ebx
  4069f3:	6a 00                	push   $0x0
  4069f5:	ff 35 e0 32 41 00    	push   0x4132e0
  4069fb:	ff 15 44 d1 40 00    	call   *0x40d144  ; 0x40d144=KERNEL32.dll!HeapReAlloc
  406a01:	85 c0                	test   %eax,%eax
  406a03:	75 16                	jne    0x406a1b
  406a05:	83 3d a8 1f 41 00 00 	cmpl   $0x0,0x411fa8
  406a0c:	74 0d                	je     0x406a1b
  406a0e:	56                   	push   %esi
  406a0f:	e8 b2 1d 00 00       	call   0x4087c6
  406a14:	85 c0                	test   %eax,%eax
  406a16:	59                   	pop    %ecx
  406a17:	75 cc                	jne    0x4069e5
  406a19:	33 c0                	xor    %eax,%eax
  406a1b:	5e                   	pop    %esi
  406a1c:	5f                   	pop    %edi
  406a1d:	5d                   	pop    %ebp
  406a1e:	5b                   	pop    %ebx
  406a1f:	c3                   	ret
  406a20:	68 34 d6 40 00       	push   $0x40d634  ; 0x40d634='mscoree.dll'
  406a25:	ff 15 34 d1 40 00    	call   *0x40d134  ; 0x40d134=KERNEL32.dll!GetModuleHandleA
  406a2b:	85 c0                	test   %eax,%eax
  406a2d:	74 16                	je     0x406a45
  406a2f:	68 24 d6 40 00       	push   $0x40d624  ; 0x40d624='CorExitProcess'
  406a34:	50                   	push   %eax
  406a35:	ff 15 2c d0 40 00    	call   *0x40d02c  ; 0x40d02c=KERNEL32.dll!GetProcAddress
  406a3b:	85 c0                	test   %eax,%eax
  406a3d:	74 06                	je     0x406a45
  406a3f:	ff 74 24 04          	push   0x4(%esp)
  406a43:	ff d0                	call   *%eax
  406a45:	ff 74 24 04          	push   0x4(%esp)
  406a49:	ff 15 4c d1 40 00    	call   *0x40d14c  ; 0x40d14c=KERNEL32.dll!ExitProcess
  406a4f:	cc                   	int3
  406a50:	a1 10 34 41 00       	mov    0x413410,%eax
  406a55:	85 c0                	test   %eax,%eax
  406a57:	74 07                	je     0x406a60
  406a59:	ff 74 24 04          	push   0x4(%esp)
  406a5d:	ff d0                	call   *%eax
  406a5f:	59                   	pop    %ecx
  406a60:	56                   	push   %esi
  406a61:	57                   	push   %edi
  406a62:	b9 10 00 41 00       	mov    $0x410010,%ecx
  406a67:	bf 24 00 41 00       	mov    $0x410024,%edi
  406a6c:	33 c0                	xor    %eax,%eax
  406a6e:	3b cf                	cmp    %edi,%ecx
  406a70:	8b f1                	mov    %ecx,%esi
  406a72:	73 17                	jae    0x406a8b
  406a74:	85 c0                	test   %eax,%eax
  406a76:	75 3f                	jne    0x406ab7
  406a78:	8b 0e                	mov    (%esi),%ecx
  406a7a:	85 c9                	test   %ecx,%ecx
  406a7c:	74 02                	je     0x406a80
  406a7e:	ff d1                	call   *%ecx
  406a80:	83 c6 04             	add    $0x4,%esi
  406a83:	3b f7                	cmp    %edi,%esi
  406a85:	72 ed                	jb     0x406a74
  406a87:	85 c0                	test   %eax,%eax
  406a89:	75 2c                	jne    0x406ab7
  406a8b:	68 17 87 40 00       	push   $0x408717
  406a90:	e8 91 ed ff ff       	call   0x405826
  406a95:	be 00 00 41 00       	mov    $0x410000,%esi
  406a9a:	8b c6                	mov    %esi,%eax
  406a9c:	bf 0c 00 41 00       	mov    $0x41000c,%edi
  406aa1:	3b c7                	cmp    %edi,%eax
  406aa3:	59                   	pop    %ecx
  406aa4:	73 0f                	jae    0x406ab5
  406aa6:	8b 06                	mov    (%esi),%eax
  406aa8:	85 c0                	test   %eax,%eax
  406aaa:	74 02                	je     0x406aae
  406aac:	ff d0                	call   *%eax
  406aae:	83 c6 04             	add    $0x4,%esi
  406ab1:	3b f7                	cmp    %edi,%esi
  406ab3:	72 f1                	jb     0x406aa6
  406ab5:	33 c0                	xor    %eax,%eax
  406ab7:	5f                   	pop    %edi
  406ab8:	5e                   	pop    %esi
  406ab9:	c3                   	ret
  406aba:	55                   	push   %ebp
  406abb:	8b ec                	mov    %esp,%ebp
  406abd:	56                   	push   %esi
  406abe:	33 f6                	xor    %esi,%esi
  406ac0:	46                   	inc    %esi
  406ac1:	39 35 9c 1d 41 00    	cmp    %esi,0x411d9c
  406ac7:	57                   	push   %edi
  406ac8:	75 10                	jne    0x406ada
  406aca:	ff 75 08             	push   0x8(%ebp)
  406acd:	ff 15 54 d1 40 00    	call   *0x40d154  ; 0x40d154=KERNEL32.dll!GetCurrentProcess
  406ad3:	50                   	push   %eax
  406ad4:	ff 15 50 d1 40 00    	call   *0x40d150  ; 0x40d150=KERNEL32.dll!TerminateProcess
  406ada:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  406ade:	8a 45 10             	mov    0x10(%ebp),%al
  406ae1:	89 35 98 1d 41 00    	mov    %esi,0x411d98
  406ae7:	a2 94 1d 41 00       	mov    %al,0x411d94
  406aec:	75 52                	jne    0x406b40
  406aee:	8b 0d 08 34 41 00    	mov    0x413408,%ecx
  406af4:	85 c9                	test   %ecx,%ecx
  406af6:	74 29                	je     0x406b21
  406af8:	a1 04 34 41 00       	mov    0x413404,%eax
  406afd:	83 e8 04             	sub    $0x4,%eax
  406b00:	3b c1                	cmp    %ecx,%eax
  406b02:	eb 16                	jmp    0x406b1a
  406b04:	8b 00                	mov    (%eax),%eax
  406b06:	85 c0                	test   %eax,%eax
  406b08:	74 02                	je     0x406b0c
  406b0a:	ff d0                	call   *%eax
  406b0c:	a1 04 34 41 00       	mov    0x413404,%eax
  406b11:	83 e8 04             	sub    $0x4,%eax
  406b14:	3b 05 08 34 41 00    	cmp    0x413408,%eax
  406b1a:	a3 04 34 41 00       	mov    %eax,0x413404
  406b1f:	73 e3                	jae    0x406b04
  406b21:	b8 28 00 41 00       	mov    $0x410028,%eax
  406b26:	be 30 00 41 00       	mov    $0x410030,%esi
  406b2b:	3b c6                	cmp    %esi,%eax
  406b2d:	8b f8                	mov    %eax,%edi
  406b2f:	73 0f                	jae    0x406b40
  406b31:	8b 07                	mov    (%edi),%eax
  406b33:	85 c0                	test   %eax,%eax
  406b35:	74 02                	je     0x406b39
  406b37:	ff d0                	call   *%eax
  406b39:	83 c7 04             	add    $0x4,%edi
  406b3c:	3b fe                	cmp    %esi,%edi
  406b3e:	72 f1                	jb     0x406b31
  406b40:	b8 34 00 41 00       	mov    $0x410034,%eax
  406b45:	be 3c 00 41 00       	mov    $0x41003c,%esi
  406b4a:	3b c6                	cmp    %esi,%eax
  406b4c:	8b f8                	mov    %eax,%edi
  406b4e:	73 0f                	jae    0x406b5f
  406b50:	8b 07                	mov    (%edi),%eax
  406b52:	85 c0                	test   %eax,%eax
  406b54:	74 02                	je     0x406b58
  406b56:	ff d0                	call   *%eax
  406b58:	83 c7 04             	add    $0x4,%edi
  406b5b:	3b fe                	cmp    %esi,%edi
  406b5d:	72 f1                	jb     0x406b50
  406b5f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  406b63:	5f                   	pop    %edi
  406b64:	5e                   	pop    %esi
  406b65:	75 12                	jne    0x406b79
  406b67:	ff 75 08             	push   0x8(%ebp)
  406b6a:	c7 05 9c 1d 41 00 01 	movl   $0x1,0x411d9c
  406b71:	00 00 00 
  406b74:	e8 a7 fe ff ff       	call   0x406a20
  406b79:	5d                   	pop    %ebp
  406b7a:	c3                   	ret
  406b7b:	6a 00                	push   $0x0
  406b7d:	6a 00                	push   $0x0
  406b7f:	ff 74 24 0c          	push   0xc(%esp)
  406b83:	e8 32 ff ff ff       	call   0x406aba
  406b88:	83 c4 0c             	add    $0xc,%esp
  406b8b:	c3                   	ret
  406b8c:	6a 00                	push   $0x0
  406b8e:	6a 01                	push   $0x1
  406b90:	ff 74 24 0c          	push   0xc(%esp)
  406b94:	e8 21 ff ff ff       	call   0x406aba
  406b99:	83 c4 0c             	add    $0xc,%esp
  406b9c:	c3                   	ret
  406b9d:	6a 01                	push   $0x1
  406b9f:	6a 00                	push   $0x0
  406ba1:	6a 00                	push   $0x0
  406ba3:	e8 12 ff ff ff       	call   0x406aba
  406ba8:	83 c4 0c             	add    $0xc,%esp
  406bab:	c3                   	ret
  406bac:	6a 01                	push   $0x1
  406bae:	6a 01                	push   $0x1
  406bb0:	6a 00                	push   $0x0
  406bb2:	e8 03 ff ff ff       	call   0x406aba
  406bb7:	83 c4 0c             	add    $0xc,%esp
  406bba:	c3                   	ret
  406bbb:	83 3d e4 32 41 00 03 	cmpl   $0x3,0x4132e4
  406bc2:	56                   	push   %esi
  406bc3:	75 1a                	jne    0x406bdf
  406bc5:	8b 74 24 08          	mov    0x8(%esp),%esi
  406bc9:	56                   	push   %esi
  406bca:	e8 5a 1c 00 00       	call   0x408829
  406bcf:	85 c0                	test   %eax,%eax
  406bd1:	59                   	pop    %ecx
  406bd2:	74 08                	je     0x406bdc
  406bd4:	8b 46 fc             	mov    -0x4(%esi),%eax
  406bd7:	83 e8 09             	sub    $0x9,%eax
  406bda:	5e                   	pop    %esi
  406bdb:	c3                   	ret
  406bdc:	56                   	push   %esi
  406bdd:	eb 04                	jmp    0x406be3
  406bdf:	ff 74 24 08          	push   0x8(%esp)
  406be3:	6a 00                	push   $0x0
  406be5:	ff 35 e0 32 41 00    	push   0x4132e0
  406beb:	ff 15 58 d1 40 00    	call   *0x40d158  ; 0x40d158=KERNEL32.dll!HeapSize
  406bf1:	5e                   	pop    %esi
  406bf2:	c3                   	ret
  406bf3:	83 3d e4 32 41 00 03 	cmpl   $0x3,0x4132e4
  406bfa:	56                   	push   %esi
  406bfb:	8b 74 24 08          	mov    0x8(%esp),%esi
  406bff:	75 13                	jne    0x406c14
  406c01:	3b 35 d0 32 41 00    	cmp    0x4132d0,%esi
  406c07:	77 0b                	ja     0x406c14
  406c09:	56                   	push   %esi
  406c0a:	e8 f9 23 00 00       	call   0x409008
  406c0f:	85 c0                	test   %eax,%eax
  406c11:	59                   	pop    %ecx
  406c12:	75 23                	jne    0x406c37
  406c14:	85 f6                	test   %esi,%esi
  406c16:	75 01                	jne    0x406c19
  406c18:	46                   	inc    %esi
  406c19:	83 3d e4 32 41 00 01 	cmpl   $0x1,0x4132e4
  406c20:	74 06                	je     0x406c28
  406c22:	83 c6 0f             	add    $0xf,%esi
  406c25:	83 e6 f0             	and    $0xfffffff0,%esi
  406c28:	56                   	push   %esi
  406c29:	6a 00                	push   $0x0
  406c2b:	ff 35 e0 32 41 00    	push   0x4132e0
  406c31:	ff 15 48 d1 40 00    	call   *0x40d148  ; 0x40d148=KERNEL32.dll!HeapAlloc
  406c37:	5e                   	pop    %esi
  406c38:	c3                   	ret
  406c39:	83 7c 24 04 e0       	cmpl   $0xffffffe0,0x4(%esp)
  406c3e:	77 22                	ja     0x406c62
  406c40:	ff 74 24 04          	push   0x4(%esp)
  406c44:	e8 aa ff ff ff       	call   0x406bf3
  406c49:	85 c0                	test   %eax,%eax
  406c4b:	59                   	pop    %ecx
  406c4c:	75 16                	jne    0x406c64
  406c4e:	39 44 24 08          	cmp    %eax,0x8(%esp)
  406c52:	74 10                	je     0x406c64
  406c54:	ff 74 24 04          	push   0x4(%esp)
  406c58:	e8 69 1b 00 00       	call   0x4087c6
  406c5d:	85 c0                	test   %eax,%eax
  406c5f:	59                   	pop    %ecx
  406c60:	75 de                	jne    0x406c40
  406c62:	33 c0                	xor    %eax,%eax
  406c64:	c3                   	ret
  406c65:	ff 35 a8 1f 41 00    	push   0x411fa8
  406c6b:	ff 74 24 08          	push   0x8(%esp)
  406c6f:	e8 c5 ff ff ff       	call   0x406c39
  406c74:	59                   	pop    %ecx
  406c75:	59                   	pop    %ecx
  406c76:	c3                   	ret
  406c77:	56                   	push   %esi
  406c78:	8b 74 24 08          	mov    0x8(%esp),%esi
  406c7c:	85 f6                	test   %esi,%esi
  406c7e:	74 2d                	je     0x406cad
  406c80:	83 3d e4 32 41 00 03 	cmpl   $0x3,0x4132e4
  406c87:	56                   	push   %esi
  406c88:	75 15                	jne    0x406c9f
  406c8a:	e8 9a 1b 00 00       	call   0x408829
  406c8f:	85 c0                	test   %eax,%eax
  406c91:	59                   	pop    %ecx
  406c92:	56                   	push   %esi
  406c93:	74 0a                	je     0x406c9f
  406c95:	50                   	push   %eax
  406c96:	e8 b9 1b 00 00       	call   0x408854
  406c9b:	59                   	pop    %ecx
  406c9c:	59                   	pop    %ecx
  406c9d:	5e                   	pop    %esi
  406c9e:	c3                   	ret
  406c9f:	6a 00                	push   $0x0
  406ca1:	ff 35 e0 32 41 00    	push   0x4132e0
  406ca7:	ff 15 5c d1 40 00    	call   *0x40d15c  ; 0x40d15c=KERNEL32.dll!HeapFree
  406cad:	5e                   	pop    %esi
  406cae:	c3                   	ret
  406caf:	8b 46 04             	mov    0x4(%esi),%eax
  406cb2:	85 c0                	test   %eax,%eax
  406cb4:	74 44                	je     0x406cfa
  406cb6:	8d 50 08             	lea    0x8(%eax),%edx
  406cb9:	80 3a 00             	cmpb   $0x0,(%edx)
  406cbc:	74 3c                	je     0x406cfa
  406cbe:	8b 4f 04             	mov    0x4(%edi),%ecx
  406cc1:	3b c1                	cmp    %ecx,%eax
  406cc3:	74 10                	je     0x406cd5
  406cc5:	83 c1 08             	add    $0x8,%ecx
  406cc8:	51                   	push   %ecx
  406cc9:	52                   	push   %edx
  406cca:	e8 f1 29 00 00       	call   0x4096c0
  406ccf:	85 c0                	test   %eax,%eax
  406cd1:	59                   	pop    %ecx
  406cd2:	59                   	pop    %ecx
  406cd3:	75 22                	jne    0x406cf7
  406cd5:	f6 07 02             	testb  $0x2,(%edi)
  406cd8:	74 05                	je     0x406cdf
  406cda:	f6 06 08             	testb  $0x8,(%esi)
  406cdd:	74 18                	je     0x406cf7
  406cdf:	8b 44 24 04          	mov    0x4(%esp),%eax
  406ce3:	8b 00                	mov    (%eax),%eax
  406ce5:	a8 01                	test   $0x1,%al
  406ce7:	74 05                	je     0x406cee
  406ce9:	f6 06 01             	testb  $0x1,(%esi)
  406cec:	74 09                	je     0x406cf7
  406cee:	a8 02                	test   $0x2,%al
  406cf0:	74 08                	je     0x406cfa
  406cf2:	f6 06 02             	testb  $0x2,(%esi)
  406cf5:	75 03                	jne    0x406cfa
  406cf7:	33 c0                	xor    %eax,%eax
  406cf9:	c3                   	ret
  406cfa:	33 c0                	xor    %eax,%eax
  406cfc:	40                   	inc    %eax
  406cfd:	c3                   	ret
  406cfe:	8b 00                	mov    (%eax),%eax
  406d00:	81 38 63 73 6d e0    	cmpl   $0xe06d7363,(%eax)
  406d06:	74 03                	je     0x406d0b
  406d08:	33 c0                	xor    %eax,%eax
  406d0a:	c3                   	ret
  406d0b:	83 25 a8 1d 41 00 00 	andl   $0x0,0x411da8
  406d12:	e9 fe 07 00 00       	jmp    0x407515
  406d17:	6a 10                	push   $0x10
  406d19:	68 40 d6 40 00       	push   $0x40d640
  406d1e:	e8 99 08 00 00       	call   0x4075bc
  406d23:	8b 5d 08             	mov    0x8(%ebp),%ebx
  406d26:	8b 73 08             	mov    0x8(%ebx),%esi
  406d29:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  406d2c:	ff 05 a8 1d 41 00    	incl   0x411da8
  406d32:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  406d36:	8b 7d 10             	mov    0x10(%ebp),%edi
  406d39:	3b 75 14             	cmp    0x14(%ebp),%esi
  406d3c:	74 64                	je     0x406da2
  406d3e:	83 fe ff             	cmp    $0xffffffff,%esi
  406d41:	7e 05                	jle    0x406d48
  406d43:	3b 77 04             	cmp    0x4(%edi),%esi
  406d46:	7c 05                	jl     0x406d4d
  406d48:	e8 f5 07 00 00       	call   0x407542
  406d4d:	8b c6                	mov    %esi,%eax
  406d4f:	c1 e0 03             	shl    $0x3,%eax
  406d52:	8b 4f 08             	mov    0x8(%edi),%ecx
  406d55:	03 c8                	add    %eax,%ecx
  406d57:	8b 31                	mov    (%ecx),%esi
  406d59:	89 75 e0             	mov    %esi,-0x20(%ebp)
  406d5c:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
  406d63:	83 79 04 00          	cmpl   $0x0,0x4(%ecx)
  406d67:	74 15                	je     0x406d7e
  406d69:	89 73 08             	mov    %esi,0x8(%ebx)
  406d6c:	68 03 01 00 00       	push   $0x103
  406d71:	53                   	push   %ebx
  406d72:	8b 4f 08             	mov    0x8(%edi),%ecx
  406d75:	ff 74 01 04          	push   0x4(%ecx,%eax,1)
  406d79:	e8 f2 07 00 00       	call   0x407570
  406d7e:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  406d82:	eb 19                	jmp    0x406d9d
  406d84:	8b 45 ec             	mov    -0x14(%ebp),%eax
  406d87:	e8 72 ff ff ff       	call   0x406cfe
  406d8c:	c3                   	ret
  406d8d:	8b 65 e8             	mov    -0x18(%ebp),%esp
  406d90:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  406d94:	8b 7d 10             	mov    0x10(%ebp),%edi
  406d97:	8b 5d 08             	mov    0x8(%ebp),%ebx
  406d9a:	8b 75 e0             	mov    -0x20(%ebp),%esi
  406d9d:	89 75 e4             	mov    %esi,-0x1c(%ebp)
  406da0:	eb 97                	jmp    0x406d39
  406da2:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  406da6:	e8 19 00 00 00       	call   0x406dc4
  406dab:	3b 75 14             	cmp    0x14(%ebp),%esi
  406dae:	74 05                	je     0x406db5
  406db0:	e8 8d 07 00 00       	call   0x407542
  406db5:	89 73 08             	mov    %esi,0x8(%ebx)
  406db8:	e8 3a 08 00 00       	call   0x4075f7
  406dbd:	c3                   	ret
  406dbe:	8b 5d 08             	mov    0x8(%ebp),%ebx
  406dc1:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  406dc4:	83 3d a8 1d 41 00 00 	cmpl   $0x0,0x411da8
  406dcb:	7e 06                	jle    0x406dd3
  406dcd:	ff 0d a8 1d 41 00    	decl   0x411da8
  406dd3:	c3                   	ret
  406dd4:	6a 08                	push   $0x8
  406dd6:	68 58 d6 40 00       	push   $0x40d658
  406ddb:	e8 dc 07 00 00       	call   0x4075bc
  406de0:	8b 45 08             	mov    0x8(%ebp),%eax
  406de3:	85 c0                	test   %eax,%eax
  406de5:	74 1b                	je     0x406e02
  406de7:	8b 48 1c             	mov    0x1c(%eax),%ecx
  406dea:	8b 49 04             	mov    0x4(%ecx),%ecx
  406ded:	85 c9                	test   %ecx,%ecx
  406def:	74 11                	je     0x406e02
  406df1:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  406df5:	51                   	push   %ecx
  406df6:	ff 70 18             	push   0x18(%eax)
  406df9:	e8 97 ea ff ff       	call   0x405895
  406dfe:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  406e02:	e8 f0 07 00 00       	call   0x4075f7
  406e07:	c3                   	ret
  406e08:	33 c0                	xor    %eax,%eax
  406e0a:	38 45 0c             	cmp    %al,0xc(%ebp)
  406e0d:	0f 95 c0             	setne  %al
  406e10:	c3                   	ret
  406e11:	8b 65 e8             	mov    -0x18(%ebp),%esp
  406e14:	e9 fc 06 00 00       	jmp    0x407515
  406e19:	56                   	push   %esi
  406e1a:	8b f0                	mov    %eax,%esi
  406e1c:	8b 01                	mov    (%ecx),%eax
  406e1e:	03 c6                	add    %esi,%eax
  406e20:	83 79 04 00          	cmpl   $0x0,0x4(%ecx)
  406e24:	7c 10                	jl     0x406e36
  406e26:	8b 51 04             	mov    0x4(%ecx),%edx
  406e29:	8b 49 08             	mov    0x8(%ecx),%ecx
  406e2c:	8b 34 32             	mov    (%edx,%esi,1),%esi
  406e2f:	8b 0c 0e             	mov    (%esi,%ecx,1),%ecx
  406e32:	03 ca                	add    %edx,%ecx
  406e34:	03 c1                	add    %ecx,%eax
  406e36:	5e                   	pop    %esi
  406e37:	c3                   	ret
  406e38:	6a 40                	push   $0x40
  406e3a:	68 68 d6 40 00       	push   $0x40d668
  406e3f:	e8 78 07 00 00       	call   0x4075bc
  406e44:	8b d9                	mov    %ecx,%ebx
  406e46:	8b 7d 0c             	mov    0xc(%ebp),%edi
  406e49:	8b 75 08             	mov    0x8(%ebp),%esi
  406e4c:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  406e4f:	83 65 b8 00          	andl   $0x0,-0x48(%ebp)
  406e53:	8b 47 fc             	mov    -0x4(%edi),%eax
  406e56:	89 45 c8             	mov    %eax,-0x38(%ebp)
  406e59:	ff 76 18             	push   0x18(%esi)
  406e5c:	8d 45 b0             	lea    -0x50(%ebp),%eax
  406e5f:	50                   	push   %eax
  406e60:	e8 eb ec ff ff       	call   0x405b50
  406e65:	59                   	pop    %ecx
  406e66:	59                   	pop    %ecx
  406e67:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  406e6a:	a1 a0 1d 41 00       	mov    0x411da0,%eax
  406e6f:	89 45 c0             	mov    %eax,-0x40(%ebp)
  406e72:	a1 a4 1d 41 00       	mov    0x411da4,%eax
  406e77:	89 45 bc             	mov    %eax,-0x44(%ebp)
  406e7a:	89 35 a0 1d 41 00    	mov    %esi,0x411da0
  406e80:	8b 45 10             	mov    0x10(%ebp),%eax
  406e83:	a3 a4 1d 41 00       	mov    %eax,0x411da4
  406e88:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  406e8c:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
  406e93:	ff 75 1c             	push   0x1c(%ebp)
  406e96:	ff 75 18             	push   0x18(%ebp)
  406e99:	53                   	push   %ebx
  406e9a:	ff 75 14             	push   0x14(%ebp)
  406e9d:	57                   	push   %edi
  406e9e:	e8 1a ed ff ff       	call   0x405bbd
  406ea3:	83 c4 14             	add    $0x14,%esp
  406ea6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  406ea9:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  406ead:	e9 af 00 00 00       	jmp    0x406f61
  406eb2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  406eb5:	8b 00                	mov    (%eax),%eax
  406eb7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  406eba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  406ebd:	81 38 63 73 6d e0    	cmpl   $0xe06d7363,(%eax)
  406ec3:	75 31                	jne    0x406ef6
  406ec5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  406ec8:	83 78 10 03          	cmpl   $0x3,0x10(%eax)
  406ecc:	75 28                	jne    0x406ef6
  406ece:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  406ed1:	81 78 14 20 05 93 19 	cmpl   $0x19930520,0x14(%eax)
  406ed8:	74 0c                	je     0x406ee6
  406eda:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  406edd:	81 78 14 21 05 93 19 	cmpl   $0x19930521,0x14(%eax)
  406ee4:	75 10                	jne    0x406ef6
  406ee6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  406ee9:	83 78 1c 00          	cmpl   $0x0,0x1c(%eax)
  406eed:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
  406ef4:	74 07                	je     0x406efd
  406ef6:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  406efd:	8b 45 dc             	mov    -0x24(%ebp),%eax
  406f00:	c3                   	ret
  406f01:	8b 65 e8             	mov    -0x18(%ebp),%esp
  406f04:	8b 4d 14             	mov    0x14(%ebp),%ecx
  406f07:	8b 41 08             	mov    0x8(%ecx),%eax
  406f0a:	89 45 d0             	mov    %eax,-0x30(%ebp)
  406f0d:	8b 7d 0c             	mov    0xc(%ebp),%edi
  406f10:	8b 47 08             	mov    0x8(%edi),%eax
  406f13:	89 45 d8             	mov    %eax,-0x28(%ebp)
  406f16:	8b 51 10             	mov    0x10(%ecx),%edx
  406f19:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  406f1c:	33 d2                	xor    %edx,%edx
  406f1e:	89 55 cc             	mov    %edx,-0x34(%ebp)
  406f21:	3b 51 0c             	cmp    0xc(%ecx),%edx
  406f24:	73 24                	jae    0x406f4a
  406f26:	8d 34 92             	lea    (%edx,%edx,4),%esi
  406f29:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
  406f2c:	8d 34 b3             	lea    (%ebx,%esi,4),%esi
  406f2f:	8b 5e 04             	mov    0x4(%esi),%ebx
  406f32:	3b c3                	cmp    %ebx,%eax
  406f34:	7e 3d                	jle    0x406f73
  406f36:	3b 46 08             	cmp    0x8(%esi),%eax
  406f39:	7f 38                	jg     0x406f73
  406f3b:	8d 43 01             	lea    0x1(%ebx),%eax
  406f3e:	89 45 d8             	mov    %eax,-0x28(%ebp)
  406f41:	8b 55 d0             	mov    -0x30(%ebp),%edx
  406f44:	8b 04 c2             	mov    (%edx,%eax,8),%eax
  406f47:	89 45 d8             	mov    %eax,-0x28(%ebp)
  406f4a:	50                   	push   %eax
  406f4b:	51                   	push   %ecx
  406f4c:	33 f6                	xor    %esi,%esi
  406f4e:	56                   	push   %esi
  406f4f:	57                   	push   %edi
  406f50:	e8 c2 fd ff ff       	call   0x406d17
  406f55:	83 c4 10             	add    $0x10,%esp
  406f58:	89 75 e0             	mov    %esi,-0x20(%ebp)
  406f5b:	89 75 fc             	mov    %esi,-0x4(%ebp)
  406f5e:	8b 75 08             	mov    0x8(%ebp),%esi
  406f61:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  406f65:	e8 12 00 00 00       	call   0x406f7c
  406f6a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  406f6d:	e8 85 06 00 00       	call   0x4075f7
  406f72:	c3                   	ret
  406f73:	42                   	inc    %edx
  406f74:	eb a8                	jmp    0x406f1e
  406f76:	8b 7d 0c             	mov    0xc(%ebp),%edi
  406f79:	8b 75 08             	mov    0x8(%ebp),%esi
  406f7c:	8b 45 c8             	mov    -0x38(%ebp),%eax
  406f7f:	89 47 fc             	mov    %eax,-0x4(%edi)
  406f82:	ff 75 c4             	push   -0x3c(%ebp)
  406f85:	e8 fa eb ff ff       	call   0x405b84
  406f8a:	59                   	pop    %ecx
  406f8b:	8b 45 c0             	mov    -0x40(%ebp),%eax
  406f8e:	a3 a0 1d 41 00       	mov    %eax,0x411da0
  406f93:	8b 45 bc             	mov    -0x44(%ebp),%eax
  406f96:	a3 a4 1d 41 00       	mov    %eax,0x411da4
  406f9b:	81 3e 63 73 6d e0    	cmpl   $0xe06d7363,(%esi)
  406fa1:	75 3e                	jne    0x406fe1
  406fa3:	83 7e 10 03          	cmpl   $0x3,0x10(%esi)
  406fa7:	75 38                	jne    0x406fe1
  406fa9:	8b 46 14             	mov    0x14(%esi),%eax
  406fac:	3d 20 05 93 19       	cmp    $0x19930520,%eax
  406fb1:	74 07                	je     0x406fba
  406fb3:	3d 21 05 93 19       	cmp    $0x19930521,%eax
  406fb8:	75 27                	jne    0x406fe1
  406fba:	83 7d b8 00          	cmpl   $0x0,-0x48(%ebp)
  406fbe:	75 21                	jne    0x406fe1
  406fc0:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  406fc4:	74 1b                	je     0x406fe1
  406fc6:	ff 76 18             	push   0x18(%esi)
  406fc9:	e8 9b eb ff ff       	call   0x405b69
  406fce:	59                   	pop    %ecx
  406fcf:	85 c0                	test   %eax,%eax
  406fd1:	74 0e                	je     0x406fe1
  406fd3:	e8 ea ec ff ff       	call   0x405cc2
  406fd8:	50                   	push   %eax
  406fd9:	56                   	push   %esi
  406fda:	e8 f5 fd ff ff       	call   0x406dd4
  406fdf:	59                   	pop    %ecx
  406fe0:	59                   	pop    %ecx
  406fe1:	c3                   	ret
  406fe2:	6a 08                	push   $0x8
  406fe4:	68 80 d6 40 00       	push   $0x40d680
  406fe9:	e8 ce 05 00 00       	call   0x4075bc
  406fee:	8b f1                	mov    %ecx,%esi
  406ff0:	8b 45 0c             	mov    0xc(%ebp),%eax
  406ff3:	8b fa                	mov    %edx,%edi
  406ff5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  406ff8:	8b 48 04             	mov    0x4(%eax),%ecx
  406ffb:	85 c9                	test   %ecx,%ecx
  406ffd:	0f 84 49 01 00 00    	je     0x40714c
  407003:	80 79 08 00          	cmpb   $0x0,0x8(%ecx)
  407007:	0f 84 3f 01 00 00    	je     0x40714c
  40700d:	8b 48 08             	mov    0x8(%eax),%ecx
  407010:	85 c9                	test   %ecx,%ecx
  407012:	75 0a                	jne    0x40701e
  407014:	f6 40 03 80          	testb  $0x80,0x3(%eax)
  407018:	0f 84 2e 01 00 00    	je     0x40714c
  40701e:	8b 00                	mov    (%eax),%eax
  407020:	85 c0                	test   %eax,%eax
  407022:	78 04                	js     0x407028
  407024:	8d 7c 39 0c          	lea    0xc(%ecx,%edi,1),%edi
  407028:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  40702c:	6a 01                	push   $0x1
  40702e:	ff 73 18             	push   0x18(%ebx)
  407031:	a8 08                	test   $0x8,%al
  407033:	74 35                	je     0x40706a
  407035:	e8 0e 27 00 00       	call   0x409748
  40703a:	59                   	pop    %ecx
  40703b:	59                   	pop    %ecx
  40703c:	85 c0                	test   %eax,%eax
  40703e:	0f 84 ff 00 00 00    	je     0x407143
  407044:	6a 01                	push   $0x1
  407046:	57                   	push   %edi
  407047:	e8 18 27 00 00       	call   0x409764
  40704c:	59                   	pop    %ecx
  40704d:	59                   	pop    %ecx
  40704e:	85 c0                	test   %eax,%eax
  407050:	0f 84 ed 00 00 00    	je     0x407143
  407056:	8b 43 18             	mov    0x18(%ebx),%eax
  407059:	89 07                	mov    %eax,(%edi)
  40705b:	8d 4e 08             	lea    0x8(%esi),%ecx
  40705e:	e8 b6 fd ff ff       	call   0x406e19
  407063:	89 07                	mov    %eax,(%edi)
  407065:	e9 de 00 00 00       	jmp    0x407148
  40706a:	f6 06 01             	testb  $0x1,(%esi)
  40706d:	74 46                	je     0x4070b5
  40706f:	e8 d4 26 00 00       	call   0x409748
  407074:	59                   	pop    %ecx
  407075:	59                   	pop    %ecx
  407076:	85 c0                	test   %eax,%eax
  407078:	0f 84 c5 00 00 00    	je     0x407143
  40707e:	6a 01                	push   $0x1
  407080:	57                   	push   %edi
  407081:	e8 de 26 00 00       	call   0x409764
  407086:	59                   	pop    %ecx
  407087:	59                   	pop    %ecx
  407088:	85 c0                	test   %eax,%eax
  40708a:	0f 84 b3 00 00 00    	je     0x407143
  407090:	ff 76 14             	push   0x14(%esi)
  407093:	ff 73 18             	push   0x18(%ebx)
  407096:	57                   	push   %edi
  407097:	e8 e4 f2 ff ff       	call   0x406380
  40709c:	83 c4 0c             	add    $0xc,%esp
  40709f:	83 7e 14 04          	cmpl   $0x4,0x14(%esi)
  4070a3:	0f 85 9f 00 00 00    	jne    0x407148
  4070a9:	8b 07                	mov    (%edi),%eax
  4070ab:	85 c0                	test   %eax,%eax
  4070ad:	0f 84 95 00 00 00    	je     0x407148
  4070b3:	eb a6                	jmp    0x40705b
  4070b5:	83 7e 18 00          	cmpl   $0x0,0x18(%esi)
  4070b9:	75 33                	jne    0x4070ee
  4070bb:	e8 88 26 00 00       	call   0x409748
  4070c0:	59                   	pop    %ecx
  4070c1:	59                   	pop    %ecx
  4070c2:	85 c0                	test   %eax,%eax
  4070c4:	74 7d                	je     0x407143
  4070c6:	6a 01                	push   $0x1
  4070c8:	57                   	push   %edi
  4070c9:	e8 96 26 00 00       	call   0x409764
  4070ce:	59                   	pop    %ecx
  4070cf:	59                   	pop    %ecx
  4070d0:	85 c0                	test   %eax,%eax
  4070d2:	74 6f                	je     0x407143
  4070d4:	ff 76 14             	push   0x14(%esi)
  4070d7:	8d 4e 08             	lea    0x8(%esi),%ecx
  4070da:	8b 43 18             	mov    0x18(%ebx),%eax
  4070dd:	e8 37 fd ff ff       	call   0x406e19
  4070e2:	50                   	push   %eax
  4070e3:	57                   	push   %edi
  4070e4:	e8 97 f2 ff ff       	call   0x406380
  4070e9:	83 c4 0c             	add    $0xc,%esp
  4070ec:	eb 5a                	jmp    0x407148
  4070ee:	e8 55 26 00 00       	call   0x409748
  4070f3:	59                   	pop    %ecx
  4070f4:	59                   	pop    %ecx
  4070f5:	85 c0                	test   %eax,%eax
  4070f7:	74 4a                	je     0x407143
  4070f9:	6a 01                	push   $0x1
  4070fb:	57                   	push   %edi
  4070fc:	e8 63 26 00 00       	call   0x409764
  407101:	59                   	pop    %ecx
  407102:	59                   	pop    %ecx
  407103:	85 c0                	test   %eax,%eax
  407105:	74 3c                	je     0x407143
  407107:	ff 76 18             	push   0x18(%esi)
  40710a:	e8 71 26 00 00       	call   0x409780
  40710f:	59                   	pop    %ecx
  407110:	85 c0                	test   %eax,%eax
  407112:	74 2f                	je     0x407143
  407114:	8b 43 18             	mov    0x18(%ebx),%eax
  407117:	8d 4e 08             	lea    0x8(%esi),%ecx
  40711a:	f6 06 04             	testb  $0x4,(%esi)
  40711d:	74 13                	je     0x407132
  40711f:	6a 01                	push   $0x1
  407121:	e8 f3 fc ff ff       	call   0x406e19
  407126:	50                   	push   %eax
  407127:	ff 76 18             	push   0x18(%esi)
  40712a:	57                   	push   %edi
  40712b:	e8 65 e7 ff ff       	call   0x405895
  407130:	eb 16                	jmp    0x407148
  407132:	e8 e2 fc ff ff       	call   0x406e19
  407137:	50                   	push   %eax
  407138:	ff 76 18             	push   0x18(%esi)
  40713b:	57                   	push   %edi
  40713c:	e8 54 e7 ff ff       	call   0x405895
  407141:	eb 05                	jmp    0x407148
  407143:	e8 fa 03 00 00       	call   0x407542
  407148:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40714c:	e8 a6 04 00 00       	call   0x4075f7
  407151:	c3                   	ret
  407152:	33 c0                	xor    %eax,%eax
  407154:	40                   	inc    %eax
  407155:	c3                   	ret
  407156:	8b 65 e8             	mov    -0x18(%ebp),%esp
  407159:	e9 b7 03 00 00       	jmp    0x407515
  40715e:	55                   	push   %ebp
  40715f:	8b ec                	mov    %esp,%ebp
  407161:	85 c9                	test   %ecx,%ecx
  407163:	74 0d                	je     0x407172
  407165:	53                   	push   %ebx
  407166:	ff 75 08             	push   0x8(%ebp)
  407169:	8b d6                	mov    %esi,%edx
  40716b:	e8 72 fe ff ff       	call   0x406fe2
  407170:	59                   	pop    %ecx
  407171:	59                   	pop    %ecx
  407172:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  407176:	ff 75 08             	push   0x8(%ebp)
  407179:	75 03                	jne    0x40717e
  40717b:	56                   	push   %esi
  40717c:	eb 03                	jmp    0x407181
  40717e:	ff 75 1c             	push   0x1c(%ebp)
  407181:	e8 16 e7 ff ff       	call   0x40589c
  407186:	ff 37                	push   (%edi)
  407188:	ff 75 14             	push   0x14(%ebp)
  40718b:	ff 75 10             	push   0x10(%ebp)
  40718e:	56                   	push   %esi
  40718f:	e8 83 fb ff ff       	call   0x406d17
  407194:	8b 47 04             	mov    0x4(%edi),%eax
  407197:	68 00 01 00 00       	push   $0x100
  40719c:	ff 75 18             	push   0x18(%ebp)
  40719f:	40                   	inc    %eax
  4071a0:	ff 75 14             	push   0x14(%ebp)
  4071a3:	89 46 08             	mov    %eax,0x8(%esi)
  4071a6:	ff 75 0c             	push   0xc(%ebp)
  4071a9:	8b 4b 0c             	mov    0xc(%ebx),%ecx
  4071ac:	56                   	push   %esi
  4071ad:	ff 75 08             	push   0x8(%ebp)
  4071b0:	e8 83 fc ff ff       	call   0x406e38
  4071b5:	83 c4 28             	add    $0x28,%esp
  4071b8:	85 c0                	test   %eax,%eax
  4071ba:	74 07                	je     0x4071c3
  4071bc:	56                   	push   %esi
  4071bd:	50                   	push   %eax
  4071be:	e8 a2 e6 ff ff       	call   0x405865
  4071c3:	5d                   	pop    %ebp
  4071c4:	c3                   	ret
  4071c5:	55                   	push   %ebp
  4071c6:	8b ec                	mov    %esp,%ebp
  4071c8:	51                   	push   %ecx
  4071c9:	51                   	push   %ecx
  4071ca:	8b 45 08             	mov    0x8(%ebp),%eax
  4071cd:	81 38 03 00 00 80    	cmpl   $0x80000003,(%eax)
  4071d3:	0f 84 a6 00 00 00    	je     0x40727f
  4071d9:	83 3d ac 1d 41 00 00 	cmpl   $0x0,0x411dac
  4071e0:	74 1f                	je     0x407201
  4071e2:	ff 75 24             	push   0x24(%ebp)
  4071e5:	ff 75 20             	push   0x20(%ebp)
  4071e8:	ff 75 18             	push   0x18(%ebp)
  4071eb:	ff 75 14             	push   0x14(%ebp)
  4071ee:	ff 75 10             	push   0x10(%ebp)
  4071f1:	ff 75 0c             	push   0xc(%ebp)
  4071f4:	50                   	push   %eax
  4071f5:	e8 65 e7 ff ff       	call   0x40595f
  4071fa:	83 c4 1c             	add    $0x1c,%esp
  4071fd:	85 c0                	test   %eax,%eax
  4071ff:	75 7e                	jne    0x40727f
  407201:	56                   	push   %esi
  407202:	8b 75 1c             	mov    0x1c(%ebp),%esi
  407205:	57                   	push   %edi
  407206:	8d 45 f8             	lea    -0x8(%ebp),%eax
  407209:	50                   	push   %eax
  40720a:	8d 45 fc             	lea    -0x4(%ebp),%eax
  40720d:	50                   	push   %eax
  40720e:	56                   	push   %esi
  40720f:	ff 75 20             	push   0x20(%ebp)
  407212:	ff 75 18             	push   0x18(%ebp)
  407215:	e8 bc e8 ff ff       	call   0x405ad6
  40721a:	8b f8                	mov    %eax,%edi
  40721c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  40721f:	83 c4 14             	add    $0x14,%esp
  407222:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  407225:	73 56                	jae    0x40727d
  407227:	53                   	push   %ebx
  407228:	3b 37                	cmp    (%edi),%esi
  40722a:	7c 42                	jl     0x40726e
  40722c:	3b 77 04             	cmp    0x4(%edi),%esi
  40722f:	7f 3d                	jg     0x40726e
  407231:	8b 47 0c             	mov    0xc(%edi),%eax
  407234:	8b 4f 10             	mov    0x10(%edi),%ecx
  407237:	c1 e0 04             	shl    $0x4,%eax
  40723a:	03 c1                	add    %ecx,%eax
  40723c:	8b 48 f4             	mov    -0xc(%eax),%ecx
  40723f:	85 c9                	test   %ecx,%ecx
  407241:	74 06                	je     0x407249
  407243:	80 79 08 00          	cmpb   $0x0,0x8(%ecx)
  407247:	75 25                	jne    0x40726e
  407249:	ff 75 24             	push   0x24(%ebp)
  40724c:	8b 75 0c             	mov    0xc(%ebp),%esi
  40724f:	ff 75 20             	push   0x20(%ebp)
  407252:	8d 58 f0             	lea    -0x10(%eax),%ebx
  407255:	ff 75 18             	push   0x18(%ebp)
  407258:	33 c9                	xor    %ecx,%ecx
  40725a:	ff 75 14             	push   0x14(%ebp)
  40725d:	ff 75 10             	push   0x10(%ebp)
  407260:	ff 75 08             	push   0x8(%ebp)
  407263:	e8 f6 fe ff ff       	call   0x40715e
  407268:	8b 75 1c             	mov    0x1c(%ebp),%esi
  40726b:	83 c4 18             	add    $0x18,%esp
  40726e:	ff 45 fc             	incl   -0x4(%ebp)
  407271:	8b 45 fc             	mov    -0x4(%ebp),%eax
  407274:	83 c7 14             	add    $0x14,%edi
  407277:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  40727a:	72 ac                	jb     0x407228
  40727c:	5b                   	pop    %ebx
  40727d:	5f                   	pop    %edi
  40727e:	5e                   	pop    %esi
  40727f:	c9                   	leave
  407280:	c3                   	ret
  407281:	55                   	push   %ebp
  407282:	8b ec                	mov    %esp,%ebp
  407284:	83 ec 24             	sub    $0x24,%esp
  407287:	8b 45 0c             	mov    0xc(%ebp),%eax
  40728a:	8b 40 08             	mov    0x8(%eax),%eax
  40728d:	83 f8 ff             	cmp    $0xffffffff,%eax
  407290:	c6 45 ff 00          	movb   $0x0,-0x1(%ebp)
  407294:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  407297:	7c 08                	jl     0x4072a1
  407299:	8b 4d 18             	mov    0x18(%ebp),%ecx
  40729c:	3b 41 04             	cmp    0x4(%ecx),%eax
  40729f:	7c 05                	jl     0x4072a6
  4072a1:	e8 9c 02 00 00       	call   0x407542
  4072a6:	53                   	push   %ebx
  4072a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  4072aa:	81 3b 63 73 6d e0    	cmpl   $0xe06d7363,(%ebx)
  4072b0:	56                   	push   %esi
  4072b1:	57                   	push   %edi
  4072b2:	0f 85 90 01 00 00    	jne    0x407448
  4072b8:	83 7b 10 03          	cmpl   $0x3,0x10(%ebx)
  4072bc:	bf 20 05 93 19       	mov    $0x19930520,%edi
  4072c1:	75 79                	jne    0x40733c
  4072c3:	8b 43 14             	mov    0x14(%ebx),%eax
  4072c6:	3b c7                	cmp    %edi,%eax
  4072c8:	74 07                	je     0x4072d1
  4072ca:	3d 21 05 93 19       	cmp    $0x19930521,%eax
  4072cf:	75 6b                	jne    0x40733c
  4072d1:	83 7b 1c 00          	cmpl   $0x0,0x1c(%ebx)
  4072d5:	75 65                	jne    0x40733c
  4072d7:	a1 a0 1d 41 00       	mov    0x411da0,%eax
  4072dc:	85 c0                	test   %eax,%eax
  4072de:	0f 84 5c 01 00 00    	je     0x407440
  4072e4:	8b f0                	mov    %eax,%esi
  4072e6:	a1 a4 1d 41 00       	mov    0x411da4,%eax
  4072eb:	6a 01                	push   $0x1
  4072ed:	56                   	push   %esi
  4072ee:	89 75 08             	mov    %esi,0x8(%ebp)
  4072f1:	89 45 10             	mov    %eax,0x10(%ebp)
  4072f4:	c6 45 ff 01          	movb   $0x1,-0x1(%ebp)
  4072f8:	e8 4b 24 00 00       	call   0x409748
  4072fd:	85 c0                	test   %eax,%eax
  4072ff:	59                   	pop    %ecx
  407300:	59                   	pop    %ecx
  407301:	75 05                	jne    0x407308
  407303:	e8 3a 02 00 00       	call   0x407542
  407308:	81 3e 63 73 6d e0    	cmpl   $0xe06d7363,(%esi)
  40730e:	0f 85 31 01 00 00    	jne    0x407445
  407314:	8b 45 08             	mov    0x8(%ebp),%eax
  407317:	83 78 10 03          	cmpl   $0x3,0x10(%eax)
  40731b:	75 1c                	jne    0x407339
  40731d:	8b 40 14             	mov    0x14(%eax),%eax
  407320:	3b c7                	cmp    %edi,%eax
  407322:	74 07                	je     0x40732b
  407324:	3d 21 05 93 19       	cmp    $0x19930521,%eax
  407329:	75 0e                	jne    0x407339
  40732b:	8b 45 08             	mov    0x8(%ebp),%eax
  40732e:	83 78 1c 00          	cmpl   $0x0,0x1c(%eax)
  407332:	75 05                	jne    0x407339
  407334:	e8 09 02 00 00       	call   0x407542
  407339:	8b 5d 08             	mov    0x8(%ebp),%ebx
  40733c:	81 3b 63 73 6d e0    	cmpl   $0xe06d7363,(%ebx)
  407342:	0f 85 00 01 00 00    	jne    0x407448
  407348:	83 7b 10 03          	cmpl   $0x3,0x10(%ebx)
  40734c:	0f 85 f6 00 00 00    	jne    0x407448
  407352:	8b 43 14             	mov    0x14(%ebx),%eax
  407355:	3b c7                	cmp    %edi,%eax
  407357:	74 0b                	je     0x407364
  407359:	3d 21 05 93 19       	cmp    $0x19930521,%eax
  40735e:	0f 85 e4 00 00 00    	jne    0x407448
  407364:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  407367:	8d 45 e0             	lea    -0x20(%ebp),%eax
  40736a:	50                   	push   %eax
  40736b:	8d 45 f4             	lea    -0xc(%ebp),%eax
  40736e:	50                   	push   %eax
  40736f:	56                   	push   %esi
  407370:	ff 75 20             	push   0x20(%ebp)
  407373:	ff 75 18             	push   0x18(%ebp)
  407376:	e8 5b e7 ff ff       	call   0x405ad6
  40737b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  40737e:	83 c4 14             	add    $0x14,%esp
  407381:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
  407384:	89 45 f8             	mov    %eax,-0x8(%ebp)
  407387:	0f 83 a3 00 00 00    	jae    0x407430
  40738d:	eb 03                	jmp    0x407392
  40738f:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  407392:	39 30                	cmp    %esi,(%eax)
  407394:	0f 8f 81 00 00 00    	jg     0x40741b
  40739a:	3b 70 04             	cmp    0x4(%eax),%esi
  40739d:	7f 7c                	jg     0x40741b
  40739f:	8b 48 0c             	mov    0xc(%eax),%ecx
  4073a2:	85 c9                	test   %ecx,%ecx
  4073a4:	8b 70 10             	mov    0x10(%eax),%esi
  4073a7:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  4073aa:	7e 6f                	jle    0x40741b
  4073ac:	8b 4b 1c             	mov    0x1c(%ebx),%ecx
  4073af:	8b 49 0c             	mov    0xc(%ecx),%ecx
  4073b2:	8d 51 04             	lea    0x4(%ecx),%edx
  4073b5:	8b 09                	mov    (%ecx),%ecx
  4073b7:	85 c9                	test   %ecx,%ecx
  4073b9:	89 55 f0             	mov    %edx,-0x10(%ebp)
  4073bc:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  4073bf:	7e 24                	jle    0x4073e5
  4073c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  4073c4:	8b 38                	mov    (%eax),%edi
  4073c6:	ff 73 1c             	push   0x1c(%ebx)
  4073c9:	89 7d dc             	mov    %edi,-0x24(%ebp)
  4073cc:	e8 de f8 ff ff       	call   0x406caf
  4073d1:	85 c0                	test   %eax,%eax
  4073d3:	59                   	pop    %ecx
  4073d4:	75 1d                	jne    0x4073f3
  4073d6:	ff 4d ec             	decl   -0x14(%ebp)
  4073d9:	83 45 f0 04          	addl   $0x4,-0x10(%ebp)
  4073dd:	39 45 ec             	cmp    %eax,-0x14(%ebp)
  4073e0:	7f df                	jg     0x4073c1
  4073e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
  4073e5:	ff 4d e8             	decl   -0x18(%ebp)
  4073e8:	83 c6 10             	add    $0x10,%esi
  4073eb:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  4073ef:	7f bb                	jg     0x4073ac
  4073f1:	eb 28                	jmp    0x40741b
  4073f3:	ff 75 24             	push   0x24(%ebp)
  4073f6:	8b 7d f8             	mov    -0x8(%ebp),%edi
  4073f9:	ff 75 20             	push   0x20(%ebp)
  4073fc:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  4073ff:	ff 75 18             	push   0x18(%ebp)
  407402:	ff 75 14             	push   0x14(%ebp)
  407405:	ff 75 10             	push   0x10(%ebp)
  407408:	53                   	push   %ebx
  407409:	8b de                	mov    %esi,%ebx
  40740b:	8b 75 0c             	mov    0xc(%ebp),%esi
  40740e:	e8 4b fd ff ff       	call   0x40715e
  407413:	8b 5d 08             	mov    0x8(%ebp),%ebx
  407416:	83 c4 18             	add    $0x18,%esp
  407419:	8b c7                	mov    %edi,%eax
  40741b:	ff 45 f4             	incl   -0xc(%ebp)
  40741e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  407421:	83 c0 14             	add    $0x14,%eax
  407424:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
  407427:	89 45 f8             	mov    %eax,-0x8(%ebp)
  40742a:	0f 82 5f ff ff ff    	jb     0x40738f
  407430:	80 7d 1c 00          	cmpb   $0x0,0x1c(%ebp)
  407434:	74 0a                	je     0x407440
  407436:	6a 01                	push   $0x1
  407438:	53                   	push   %ebx
  407439:	e8 96 f9 ff ff       	call   0x406dd4
  40743e:	59                   	pop    %ecx
  40743f:	59                   	pop    %ecx
  407440:	5f                   	pop    %edi
  407441:	5e                   	pop    %esi
  407442:	5b                   	pop    %ebx
  407443:	c9                   	leave
  407444:	c3                   	ret
  407445:	8b 5d 08             	mov    0x8(%ebp),%ebx
  407448:	80 7d 1c 00          	cmpb   $0x0,0x1c(%ebp)
  40744c:	75 20                	jne    0x40746e
  40744e:	ff 75 24             	push   0x24(%ebp)
  407451:	ff 75 20             	push   0x20(%ebp)
  407454:	ff 75 e4             	push   -0x1c(%ebp)
  407457:	ff 75 18             	push   0x18(%ebp)
  40745a:	ff 75 14             	push   0x14(%ebp)
  40745d:	ff 75 10             	push   0x10(%ebp)
  407460:	ff 75 0c             	push   0xc(%ebp)
  407463:	53                   	push   %ebx
  407464:	e8 5c fd ff ff       	call   0x4071c5
  407469:	83 c4 20             	add    $0x20,%esp
  40746c:	eb d2                	jmp    0x407440
  40746e:	e9 a2 00 00 00       	jmp    0x407515
  407473:	55                   	push   %ebp
  407474:	8b ec                	mov    %esp,%ebp
  407476:	56                   	push   %esi
  407477:	8b 75 18             	mov    0x18(%ebp),%esi
  40747a:	8b 06                	mov    (%esi),%eax
  40747c:	57                   	push   %edi
  40747d:	25 ff ff ff 1f       	and    $0x1fffffff,%eax
  407482:	bf 20 05 93 19       	mov    $0x19930520,%edi
  407487:	3b c7                	cmp    %edi,%eax
  407489:	74 05                	je     0x407490
  40748b:	e8 b2 00 00 00       	call   0x407542
  407490:	8b 45 08             	mov    0x8(%ebp),%eax
  407493:	f6 40 04 66          	testb  $0x66,0x4(%eax)
  407497:	74 1f                	je     0x4074b8
  407499:	83 7e 04 00          	cmpl   $0x0,0x4(%esi)
  40749d:	74 6f                	je     0x40750e
  40749f:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  4074a3:	75 69                	jne    0x40750e
  4074a5:	6a ff                	push   $0xffffffff
  4074a7:	56                   	push   %esi
  4074a8:	ff 75 14             	push   0x14(%ebp)
  4074ab:	ff 75 0c             	push   0xc(%ebp)
  4074ae:	e8 64 f8 ff ff       	call   0x406d17
  4074b3:	83 c4 10             	add    $0x10,%esp
  4074b6:	eb 56                	jmp    0x40750e
  4074b8:	83 7e 0c 00          	cmpl   $0x0,0xc(%esi)
  4074bc:	74 50                	je     0x40750e
  4074be:	81 38 63 73 6d e0    	cmpl   $0xe06d7363,(%eax)
  4074c4:	75 2c                	jne    0x4074f2
  4074c6:	39 78 14             	cmp    %edi,0x14(%eax)
  4074c9:	76 27                	jbe    0x4074f2
  4074cb:	8b 48 1c             	mov    0x1c(%eax),%ecx
  4074ce:	8b 49 08             	mov    0x8(%ecx),%ecx
  4074d1:	85 c9                	test   %ecx,%ecx
  4074d3:	74 1d                	je     0x4074f2
  4074d5:	0f b6 55 24          	movzbl 0x24(%ebp),%edx
  4074d9:	52                   	push   %edx
  4074da:	ff 75 20             	push   0x20(%ebp)
  4074dd:	ff 75 1c             	push   0x1c(%ebp)
  4074e0:	56                   	push   %esi
  4074e1:	ff 75 14             	push   0x14(%ebp)
  4074e4:	ff 75 10             	push   0x10(%ebp)
  4074e7:	ff 75 0c             	push   0xc(%ebp)
  4074ea:	50                   	push   %eax
  4074eb:	ff d1                	call   *%ecx
  4074ed:	83 c4 20             	add    $0x20,%esp
  4074f0:	eb 1f                	jmp    0x407511
  4074f2:	ff 75 20             	push   0x20(%ebp)
  4074f5:	ff 75 1c             	push   0x1c(%ebp)
  4074f8:	ff 75 24             	push   0x24(%ebp)
  4074fb:	56                   	push   %esi
  4074fc:	ff 75 14             	push   0x14(%ebp)
  4074ff:	ff 75 10             	push   0x10(%ebp)
  407502:	ff 75 0c             	push   0xc(%ebp)
  407505:	50                   	push   %eax
  407506:	e8 76 fd ff ff       	call   0x407281
  40750b:	83 c4 20             	add    $0x20,%esp
  40750e:	33 c0                	xor    %eax,%eax
  407510:	40                   	inc    %eax
  407511:	5f                   	pop    %edi
  407512:	5e                   	pop    %esi
  407513:	5d                   	pop    %ebp
  407514:	c3                   	ret
  407515:	6a 08                	push   $0x8
  407517:	68 90 d6 40 00       	push   $0x40d690
  40751c:	e8 9b 00 00 00       	call   0x4075bc
  407521:	a1 b0 1d 41 00       	mov    0x411db0,%eax
  407526:	85 c0                	test   %eax,%eax
  407528:	74 13                	je     0x40753d
  40752a:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  40752e:	ff d0                	call   *%eax
  407530:	eb 07                	jmp    0x407539
  407532:	33 c0                	xor    %eax,%eax
  407534:	40                   	inc    %eax
  407535:	c3                   	ret
  407536:	8b 65 e8             	mov    -0x18(%ebp),%esp
  407539:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40753d:	e9 56 22 00 00       	jmp    0x409798
  407542:	6a 08                	push   $0x8
  407544:	68 a0 d6 40 00       	push   $0x40d6a0
  407549:	e8 6e 00 00 00       	call   0x4075bc
  40754e:	a1 74 04 41 00       	mov    0x410474,%eax
  407553:	85 c0                	test   %eax,%eax
  407555:	74 13                	je     0x40756a
  407557:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  40755b:	ff d0                	call   *%eax
  40755d:	eb 07                	jmp    0x407566
  40755f:	33 c0                	xor    %eax,%eax
  407561:	40                   	inc    %eax
  407562:	c3                   	ret
  407563:	8b 65 e8             	mov    -0x18(%ebp),%esp
  407566:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40756a:	e9 a6 ff ff ff       	jmp    0x407515
  40756f:	cc                   	int3
  407570:	55                   	push   %ebp
  407571:	8b ec                	mov    %esp,%ebp
  407573:	83 ec 04             	sub    $0x4,%esp
  407576:	53                   	push   %ebx
  407577:	51                   	push   %ecx
  407578:	8b 45 0c             	mov    0xc(%ebp),%eax
  40757b:	83 c0 0c             	add    $0xc,%eax
  40757e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  407581:	8b 45 08             	mov    0x8(%ebp),%eax
  407584:	55                   	push   %ebp
  407585:	ff 75 10             	push   0x10(%ebp)
  407588:	8b 4d 10             	mov    0x10(%ebp),%ecx
  40758b:	8b 6d fc             	mov    -0x4(%ebp),%ebp
  40758e:	e8 52 e7 ff ff       	call   0x405ce5
  407593:	56                   	push   %esi
  407594:	57                   	push   %edi
  407595:	ff d0                	call   *%eax
  407597:	5f                   	pop    %edi
  407598:	5e                   	pop    %esi
  407599:	8b dd                	mov    %ebp,%ebx
  40759b:	5d                   	pop    %ebp
  40759c:	8b 4d 10             	mov    0x10(%ebp),%ecx
  40759f:	55                   	push   %ebp
  4075a0:	8b eb                	mov    %ebx,%ebp
  4075a2:	81 f9 00 01 00 00    	cmp    $0x100,%ecx
  4075a8:	75 05                	jne    0x4075af
  4075aa:	b9 02 00 00 00       	mov    $0x2,%ecx
  4075af:	51                   	push   %ecx
  4075b0:	e8 30 e7 ff ff       	call   0x405ce5
  4075b5:	5d                   	pop    %ebp
  4075b6:	59                   	pop    %ecx
  4075b7:	5b                   	pop    %ebx
  4075b8:	c9                   	leave
  4075b9:	c2 0c 00             	ret    $0xc
  4075bc:	68 10 76 40 00       	push   $0x407610
  4075c1:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
  4075c7:	50                   	push   %eax
  4075c8:	8b 44 24 10          	mov    0x10(%esp),%eax
  4075cc:	89 6c 24 10          	mov    %ebp,0x10(%esp)
  4075d0:	8d 6c 24 10          	lea    0x10(%esp),%ebp
  4075d4:	2b e0                	sub    %eax,%esp
  4075d6:	53                   	push   %ebx
  4075d7:	56                   	push   %esi
  4075d8:	57                   	push   %edi
  4075d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
  4075dc:	89 65 e8             	mov    %esp,-0x18(%ebp)
  4075df:	50                   	push   %eax
  4075e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  4075e3:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%ebp)
  4075ea:	89 45 f8             	mov    %eax,-0x8(%ebp)
  4075ed:	8d 45 f0             	lea    -0x10(%ebp),%eax
  4075f0:	64 a3 00 00 00 00    	mov    %eax,%fs:0x0
  4075f6:	c3                   	ret
  4075f7:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  4075fa:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
  407601:	59                   	pop    %ecx
  407602:	5f                   	pop    %edi
  407603:	5e                   	pop    %esi
  407604:	5b                   	pop    %ebx
  407605:	c9                   	leave
  407606:	51                   	push   %ecx
  407607:	c3                   	ret
  407608:	56                   	push   %esi
  407609:	43                   	inc    %ebx
  40760a:	32 30                	xor    (%eax),%dh
  40760c:	58                   	pop    %eax
  40760d:	43                   	inc    %ebx
  40760e:	30 30                	xor    %dh,(%eax)
  407610:	55                   	push   %ebp
  407611:	8b ec                	mov    %esp,%ebp
  407613:	83 ec 08             	sub    $0x8,%esp
  407616:	53                   	push   %ebx
  407617:	56                   	push   %esi
  407618:	57                   	push   %edi
  407619:	55                   	push   %ebp
  40761a:	fc                   	cld
  40761b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  40761e:	8b 45 08             	mov    0x8(%ebp),%eax
  407621:	f7 40 04 06 00 00 00 	testl  $0x6,0x4(%eax)
  407628:	0f 85 ab 00 00 00    	jne    0x4076d9
  40762e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  407631:	8b 45 10             	mov    0x10(%ebp),%eax
  407634:	89 45 fc             	mov    %eax,-0x4(%ebp)
  407637:	8d 45 f8             	lea    -0x8(%ebp),%eax
  40763a:	89 43 fc             	mov    %eax,-0x4(%ebx)
  40763d:	8b 73 0c             	mov    0xc(%ebx),%esi
  407640:	8b 7b 08             	mov    0x8(%ebx),%edi
  407643:	53                   	push   %ebx
  407644:	e8 7c 25 00 00       	call   0x409bc5
  407649:	83 c4 04             	add    $0x4,%esp
  40764c:	0b c0                	or     %eax,%eax
  40764e:	74 7b                	je     0x4076cb
  407650:	83 fe ff             	cmp    $0xffffffff,%esi
  407653:	74 7d                	je     0x4076d2
  407655:	8d 0c 76             	lea    (%esi,%esi,2),%ecx
  407658:	8b 44 8f 04          	mov    0x4(%edi,%ecx,4),%eax
  40765c:	0b c0                	or     %eax,%eax
  40765e:	74 59                	je     0x4076b9
  407660:	56                   	push   %esi
  407661:	55                   	push   %ebp
  407662:	8d 6b 10             	lea    0x10(%ebx),%ebp
  407665:	33 db                	xor    %ebx,%ebx
  407667:	33 c9                	xor    %ecx,%ecx
  407669:	33 d2                	xor    %edx,%edx
  40766b:	33 f6                	xor    %esi,%esi
  40766d:	33 ff                	xor    %edi,%edi
  40766f:	ff d0                	call   *%eax
  407671:	5d                   	pop    %ebp
  407672:	5e                   	pop    %esi
  407673:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  407676:	0b c0                	or     %eax,%eax
  407678:	74 3f                	je     0x4076b9
  40767a:	78 48                	js     0x4076c4
  40767c:	8b 7b 08             	mov    0x8(%ebx),%edi
  40767f:	53                   	push   %ebx
  407680:	e8 93 e5 ff ff       	call   0x405c18
  407685:	83 c4 04             	add    $0x4,%esp
  407688:	8d 6b 10             	lea    0x10(%ebx),%ebp
  40768b:	56                   	push   %esi
  40768c:	53                   	push   %ebx
  40768d:	e8 c8 e5 ff ff       	call   0x405c5a
  407692:	83 c4 08             	add    $0x8,%esp
  407695:	8d 0c 76             	lea    (%esi,%esi,2),%ecx
  407698:	6a 01                	push   $0x1
  40769a:	8b 44 8f 08          	mov    0x8(%edi,%ecx,4),%eax
  40769e:	e8 4b e6 ff ff       	call   0x405cee
  4076a3:	8b 04 8f             	mov    (%edi,%ecx,4),%eax
  4076a6:	89 43 0c             	mov    %eax,0xc(%ebx)
  4076a9:	8b 44 8f 08          	mov    0x8(%edi,%ecx,4),%eax
  4076ad:	33 db                	xor    %ebx,%ebx
  4076af:	33 c9                	xor    %ecx,%ecx
  4076b1:	33 d2                	xor    %edx,%edx
  4076b3:	33 f6                	xor    %esi,%esi
  4076b5:	33 ff                	xor    %edi,%edi
  4076b7:	ff d0                	call   *%eax
  4076b9:	8b 7b 08             	mov    0x8(%ebx),%edi
  4076bc:	8d 0c 76             	lea    (%esi,%esi,2),%ecx
  4076bf:	8b 34 8f             	mov    (%edi,%ecx,4),%esi
  4076c2:	eb 8c                	jmp    0x407650
  4076c4:	b8 00 00 00 00       	mov    $0x0,%eax
  4076c9:	eb 23                	jmp    0x4076ee
  4076cb:	8b 45 08             	mov    0x8(%ebp),%eax
  4076ce:	83 48 04 08          	orl    $0x8,0x4(%eax)
  4076d2:	b8 01 00 00 00       	mov    $0x1,%eax
  4076d7:	eb 15                	jmp    0x4076ee
  4076d9:	55                   	push   %ebp
  4076da:	8d 6b 10             	lea    0x10(%ebx),%ebp
  4076dd:	6a ff                	push   $0xffffffff
  4076df:	53                   	push   %ebx
  4076e0:	e8 75 e5 ff ff       	call   0x405c5a
  4076e5:	83 c4 08             	add    $0x8,%esp
  4076e8:	5d                   	pop    %ebp
  4076e9:	b8 01 00 00 00       	mov    $0x1,%eax
  4076ee:	5d                   	pop    %ebp
  4076ef:	5f                   	pop    %edi
  4076f0:	5e                   	pop    %esi
  4076f1:	5b                   	pop    %ebx
  4076f2:	8b e5                	mov    %ebp,%esp
  4076f4:	5d                   	pop    %ebp
  4076f5:	c3                   	ret
  4076f6:	55                   	push   %ebp
  4076f7:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  4076fb:	8b 29                	mov    (%ecx),%ebp
  4076fd:	8b 41 1c             	mov    0x1c(%ecx),%eax
  407700:	50                   	push   %eax
  407701:	8b 41 18             	mov    0x18(%ecx),%eax
  407704:	50                   	push   %eax
  407705:	e8 50 e5 ff ff       	call   0x405c5a
  40770a:	83 c4 08             	add    $0x8,%esp
  40770d:	5d                   	pop    %ebp
  40770e:	c2 04 00             	ret    $0x4
  407711:	53                   	push   %ebx
  407712:	8b 5c 24 08          	mov    0x8(%esp),%ebx
  407716:	8b 0b                	mov    (%ebx),%ecx
  407718:	56                   	push   %esi
  407719:	33 f6                	xor    %esi,%esi
  40771b:	85 c9                	test   %ecx,%ecx
  40771d:	7d 07                	jge    0x407726
  40771f:	33 c0                	xor    %eax,%eax
  407721:	e9 dd 00 00 00       	jmp    0x407803
  407726:	8b c1                	mov    %ecx,%eax
  407728:	99                   	cltd
  407729:	57                   	push   %edi
  40772a:	bf 80 1f 86 07       	mov    $0x7861f80,%edi
  40772f:	f7 ff                	idiv   %edi
  407731:	8b d0                	mov    %eax,%edx
  407733:	69 d2 80 e0 79 f8    	imul   $0xf879e080,%edx,%edx
  407739:	03 ca                	add    %edx,%ecx
  40773b:	ba 80 33 e1 01       	mov    $0x1e13380,%edx
  407740:	3b ca                	cmp    %edx,%ecx
  407742:	8d 04 85 46 00 00 00 	lea    0x46(,%eax,4),%eax
  407749:	7c 1b                	jl     0x407766
  40774b:	2b ca                	sub    %edx,%ecx
  40774d:	40                   	inc    %eax
  40774e:	3b ca                	cmp    %edx,%ecx
  407750:	7c 14                	jl     0x407766
  407752:	2b ca                	sub    %edx,%ecx
  407754:	ba 00 85 e2 01       	mov    $0x1e28500,%edx
  407759:	40                   	inc    %eax
  40775a:	3b ca                	cmp    %edx,%ecx
  40775c:	7c 05                	jl     0x407763
  40775e:	40                   	inc    %eax
  40775f:	2b ca                	sub    %edx,%ecx
  407761:	eb 03                	jmp    0x407766
  407763:	33 f6                	xor    %esi,%esi
  407765:	46                   	inc    %esi
  407766:	a3 c8 1d 41 00       	mov    %eax,0x411dc8
  40776b:	8b c1                	mov    %ecx,%eax
  40776d:	55                   	push   %ebp
  40776e:	bf 80 51 01 00       	mov    $0x15180,%edi
  407773:	99                   	cltd
  407774:	8b ef                	mov    %edi,%ebp
  407776:	f7 fd                	idiv   %ebp
  407778:	5d                   	pop    %ebp
  407779:	8b d0                	mov    %eax,%edx
  40777b:	69 d2 80 ae fe ff    	imul   $0xfffeae80,%edx,%edx
  407781:	03 ca                	add    %edx,%ecx
  407783:	85 f6                	test   %esi,%esi
  407785:	a3 d0 1d 41 00       	mov    %eax,0x411dd0
  40778a:	be 38 05 41 00       	mov    $0x410538,%esi
  40778f:	75 05                	jne    0x407796
  407791:	be 6c 05 41 00       	mov    $0x41056c,%esi
  407796:	33 d2                	xor    %edx,%edx
  407798:	42                   	inc    %edx
  407799:	39 46 04             	cmp    %eax,0x4(%esi)
  40779c:	7d 06                	jge    0x4077a4
  40779e:	42                   	inc    %edx
  40779f:	39 04 96             	cmp    %eax,(%esi,%edx,4)
  4077a2:	7c fa                	jl     0x40779e
  4077a4:	4a                   	dec    %edx
  4077a5:	89 15 c4 1d 41 00    	mov    %edx,0x411dc4
  4077ab:	2b 04 96             	sub    (%esi,%edx,4),%eax
  4077ae:	6a 07                	push   $0x7
  4077b0:	a3 c0 1d 41 00       	mov    %eax,0x411dc0
  4077b5:	8b 03                	mov    (%ebx),%eax
  4077b7:	99                   	cltd
  4077b8:	f7 ff                	idiv   %edi
  4077ba:	5e                   	pop    %esi
  4077bb:	6a 3c                	push   $0x3c
  4077bd:	83 c0 04             	add    $0x4,%eax
  4077c0:	99                   	cltd
  4077c1:	f7 fe                	idiv   %esi
  4077c3:	8b c1                	mov    %ecx,%eax
  4077c5:	be 10 0e 00 00       	mov    $0xe10,%esi
  4077ca:	89 15 cc 1d 41 00    	mov    %edx,0x411dcc
  4077d0:	99                   	cltd
  4077d1:	f7 fe                	idiv   %esi
  4077d3:	5e                   	pop    %esi
  4077d4:	5f                   	pop    %edi
  4077d5:	a3 bc 1d 41 00       	mov    %eax,0x411dbc
  4077da:	69 c0 f0 f1 ff ff    	imul   $0xfffff1f0,%eax,%eax
  4077e0:	03 c8                	add    %eax,%ecx
  4077e2:	8b c1                	mov    %ecx,%eax
  4077e4:	99                   	cltd
  4077e5:	f7 fe                	idiv   %esi
  4077e7:	a3 b8 1d 41 00       	mov    %eax,0x411db8
  4077ec:	6b c0 3c             	imul   $0x3c,%eax,%eax
  4077ef:	2b c8                	sub    %eax,%ecx
  4077f1:	83 25 d4 1d 41 00 00 	andl   $0x0,0x411dd4
  4077f8:	89 0d b4 1d 41 00    	mov    %ecx,0x411db4
  4077fe:	b8 b4 1d 41 00       	mov    $0x411db4,%eax
  407803:	5e                   	pop    %esi
  407804:	5b                   	pop    %ebx
  407805:	c3                   	ret
  407806:	55                   	push   %ebp
  407807:	8b ec                	mov    %esp,%ebp
  407809:	51                   	push   %ecx
  40780a:	51                   	push   %ecx
  40780b:	83 0d 2c 05 41 00 ff 	orl    $0xffffffff,0x41052c
  407812:	83 0d 20 05 41 00 ff 	orl    $0xffffffff,0x410520
  407819:	53                   	push   %ebx
  40781a:	56                   	push   %esi
  40781b:	57                   	push   %edi
  40781c:	8b 3d 1c 20 41 00    	mov    0x41201c,%edi
  407822:	33 db                	xor    %ebx,%ebx
  407824:	68 64 d7 40 00       	push   $0x40d764
  407829:	89 5d f8             	mov    %ebx,-0x8(%ebp)
  40782c:	89 1d 84 1e 41 00    	mov    %ebx,0x411e84
  407832:	e8 11 27 00 00       	call   0x409f48
  407837:	8b f0                	mov    %eax,%esi
  407839:	3b f3                	cmp    %ebx,%esi
  40783b:	59                   	pop    %ecx
  40783c:	0f 84 1d 01 00 00    	je     0x40795f
  407842:	38 1e                	cmp    %bl,(%esi)
  407844:	0f 84 15 01 00 00    	je     0x40795f
  40784a:	a1 88 1e 41 00       	mov    0x411e88,%eax
  40784f:	3b c3                	cmp    %ebx,%eax
  407851:	74 21                	je     0x407874
  407853:	50                   	push   %eax
  407854:	56                   	push   %esi
  407855:	e8 66 1e 00 00       	call   0x4096c0
  40785a:	85 c0                	test   %eax,%eax
  40785c:	59                   	pop    %ecx
  40785d:	59                   	pop    %ecx
  40785e:	0f 84 f0 01 00 00    	je     0x407a54
  407864:	a1 88 1e 41 00       	mov    0x411e88,%eax
  407869:	3b c3                	cmp    %ebx,%eax
  40786b:	74 07                	je     0x407874
  40786d:	50                   	push   %eax
  40786e:	e8 04 f4 ff ff       	call   0x406c77
  407873:	59                   	pop    %ecx
  407874:	56                   	push   %esi
  407875:	e8 e6 21 00 00       	call   0x409a60
  40787a:	40                   	inc    %eax
  40787b:	50                   	push   %eax
  40787c:	e8 e4 f3 ff ff       	call   0x406c65
  407881:	3b c3                	cmp    %ebx,%eax
  407883:	59                   	pop    %ecx
  407884:	59                   	pop    %ecx
  407885:	a3 88 1e 41 00       	mov    %eax,0x411e88
  40788a:	0f 84 c4 01 00 00    	je     0x407a54
  407890:	56                   	push   %esi
  407891:	50                   	push   %eax
  407892:	e8 b9 25 00 00       	call   0x409e50
  407897:	6a 03                	push   $0x3
  407899:	56                   	push   %esi
  40789a:	ff 35 18 05 41 00    	push   0x410518
  4078a0:	e8 bb e4 ff ff       	call   0x405d60
  4078a5:	a1 18 05 41 00       	mov    0x410518,%eax
  4078aa:	83 c6 03             	add    $0x3,%esi
  4078ad:	83 c4 14             	add    $0x14,%esp
  4078b0:	88 58 03             	mov    %bl,0x3(%eax)
  4078b3:	80 3e 2d             	cmpb   $0x2d,(%esi)
  4078b6:	75 08                	jne    0x4078c0
  4078b8:	c7 45 f8 01 00 00 00 	movl   $0x1,-0x8(%ebp)
  4078bf:	46                   	inc    %esi
  4078c0:	56                   	push   %esi
  4078c1:	e8 28 25 00 00       	call   0x409dee
  4078c6:	69 c0 10 0e 00 00    	imul   $0xe10,%eax,%eax
  4078cc:	59                   	pop    %ecx
  4078cd:	a3 88 04 41 00       	mov    %eax,0x410488
  4078d2:	8a 06                	mov    (%esi),%al
  4078d4:	3c 2b                	cmp    $0x2b,%al
  4078d6:	74 08                	je     0x4078e0
  4078d8:	3c 30                	cmp    $0x30,%al
  4078da:	7c 07                	jl     0x4078e3
  4078dc:	3c 39                	cmp    $0x39,%al
  4078de:	7f 03                	jg     0x4078e3
  4078e0:	46                   	inc    %esi
  4078e1:	eb ef                	jmp    0x4078d2
  4078e3:	80 3e 3a             	cmpb   $0x3a,(%esi)
  4078e6:	75 3e                	jne    0x407926
  4078e8:	46                   	inc    %esi
  4078e9:	56                   	push   %esi
  4078ea:	e8 ff 24 00 00       	call   0x409dee
  4078ef:	6b c0 3c             	imul   $0x3c,%eax,%eax
  4078f2:	01 05 88 04 41 00    	add    %eax,0x410488
  4078f8:	59                   	pop    %ecx
  4078f9:	eb 05                	jmp    0x407900
  4078fb:	3c 39                	cmp    $0x39,%al
  4078fd:	7f 07                	jg     0x407906
  4078ff:	46                   	inc    %esi
  407900:	8a 06                	mov    (%esi),%al
  407902:	3c 30                	cmp    $0x30,%al
  407904:	7d f5                	jge    0x4078fb
  407906:	80 3e 3a             	cmpb   $0x3a,(%esi)
  407909:	75 1b                	jne    0x407926
  40790b:	46                   	inc    %esi
  40790c:	56                   	push   %esi
  40790d:	e8 dc 24 00 00       	call   0x409dee
  407912:	01 05 88 04 41 00    	add    %eax,0x410488
  407918:	59                   	pop    %ecx
  407919:	eb 05                	jmp    0x407920
  40791b:	3c 39                	cmp    $0x39,%al
  40791d:	7f 07                	jg     0x407926
  40791f:	46                   	inc    %esi
  407920:	8a 06                	mov    (%esi),%al
  407922:	3c 30                	cmp    $0x30,%al
  407924:	7d f5                	jge    0x40791b
  407926:	39 5d f8             	cmp    %ebx,-0x8(%ebp)
  407929:	74 06                	je     0x407931
  40792b:	f7 1d 88 04 41 00    	negl   0x410488
  407931:	0f be 06             	movsbl (%esi),%eax
  407934:	3b c3                	cmp    %ebx,%eax
  407936:	a3 8c 04 41 00       	mov    %eax,0x41048c
  40793b:	0f 84 0c 01 00 00    	je     0x407a4d
  407941:	6a 03                	push   $0x3
  407943:	56                   	push   %esi
  407944:	ff 35 1c 05 41 00    	push   0x41051c
  40794a:	e8 11 e4 ff ff       	call   0x405d60
  40794f:	a1 1c 05 41 00       	mov    0x41051c,%eax
  407954:	83 c4 0c             	add    $0xc,%esp
  407957:	88 58 03             	mov    %bl,0x3(%eax)
  40795a:	e9 f5 00 00 00       	jmp    0x407a54
  40795f:	a1 88 1e 41 00       	mov    0x411e88,%eax
  407964:	3b c3                	cmp    %ebx,%eax
  407966:	74 0d                	je     0x407975
  407968:	50                   	push   %eax
  407969:	e8 09 f3 ff ff       	call   0x406c77
  40796e:	59                   	pop    %ecx
  40796f:	89 1d 88 1e 41 00    	mov    %ebx,0x411e88
  407975:	68 d8 1d 41 00       	push   $0x411dd8
  40797a:	ff 15 60 d1 40 00    	call   *0x40d160  ; 0x40d160=KERNEL32.dll!GetTimeZoneInformation
  407980:	83 f8 ff             	cmp    $0xffffffff,%eax
  407983:	0f 84 cb 00 00 00    	je     0x407a54
  407989:	a1 d8 1d 41 00       	mov    0x411dd8,%eax
  40798e:	8b 0d 2c 1e 41 00    	mov    0x411e2c,%ecx
  407994:	6b c0 3c             	imul   $0x3c,%eax,%eax
  407997:	33 d2                	xor    %edx,%edx
  407999:	42                   	inc    %edx
  40799a:	66 39 1d 1e 1e 41 00 	cmp    %bx,0x411e1e
  4079a1:	89 15 84 1e 41 00    	mov    %edx,0x411e84
  4079a7:	a3 88 04 41 00       	mov    %eax,0x410488
  4079ac:	74 0c                	je     0x4079ba
  4079ae:	8b f1                	mov    %ecx,%esi
  4079b0:	6b f6 3c             	imul   $0x3c,%esi,%esi
  4079b3:	03 c6                	add    %esi,%eax
  4079b5:	a3 88 04 41 00       	mov    %eax,0x410488
  4079ba:	66 39 1d 72 1e 41 00 	cmp    %bx,0x411e72
  4079c1:	74 1b                	je     0x4079de
  4079c3:	a1 80 1e 41 00       	mov    0x411e80,%eax
  4079c8:	3b c3                	cmp    %ebx,%eax
  4079ca:	74 12                	je     0x4079de
  4079cc:	2b c1                	sub    %ecx,%eax
  4079ce:	6b c0 3c             	imul   $0x3c,%eax,%eax
  4079d1:	89 15 8c 04 41 00    	mov    %edx,0x41048c
  4079d7:	a3 90 04 41 00       	mov    %eax,0x410490
  4079dc:	eb 0c                	jmp    0x4079ea
  4079de:	89 1d 8c 04 41 00    	mov    %ebx,0x41048c
  4079e4:	89 1d 90 04 41 00    	mov    %ebx,0x410490
  4079ea:	8b 35 84 d0 40 00    	mov    0x40d084,%esi  ; 0x40d084=KERNEL32.dll!WideCharToMultiByte
  4079f0:	8d 45 fc             	lea    -0x4(%ebp),%eax
  4079f3:	50                   	push   %eax
  4079f4:	53                   	push   %ebx
  4079f5:	6a 3f                	push   $0x3f
  4079f7:	ff 35 18 05 41 00    	push   0x410518
  4079fd:	6a ff                	push   $0xffffffff
  4079ff:	68 dc 1d 41 00       	push   $0x411ddc
  407a04:	53                   	push   %ebx
  407a05:	57                   	push   %edi
  407a06:	ff d6                	call   *%esi
  407a08:	85 c0                	test   %eax,%eax
  407a0a:	74 0f                	je     0x407a1b
  407a0c:	39 5d fc             	cmp    %ebx,-0x4(%ebp)
  407a0f:	75 0a                	jne    0x407a1b
  407a11:	a1 18 05 41 00       	mov    0x410518,%eax
  407a16:	88 58 3f             	mov    %bl,0x3f(%eax)
  407a19:	eb 07                	jmp    0x407a22
  407a1b:	a1 18 05 41 00       	mov    0x410518,%eax
  407a20:	88 18                	mov    %bl,(%eax)
  407a22:	8d 45 fc             	lea    -0x4(%ebp),%eax
  407a25:	50                   	push   %eax
  407a26:	53                   	push   %ebx
  407a27:	6a 3f                	push   $0x3f
  407a29:	ff 35 1c 05 41 00    	push   0x41051c
  407a2f:	6a ff                	push   $0xffffffff
  407a31:	68 30 1e 41 00       	push   $0x411e30
  407a36:	53                   	push   %ebx
  407a37:	57                   	push   %edi
  407a38:	ff d6                	call   *%esi
  407a3a:	85 c0                	test   %eax,%eax
  407a3c:	74 0f                	je     0x407a4d
  407a3e:	39 5d fc             	cmp    %ebx,-0x4(%ebp)
  407a41:	75 0a                	jne    0x407a4d
  407a43:	a1 1c 05 41 00       	mov    0x41051c,%eax
  407a48:	88 58 3f             	mov    %bl,0x3f(%eax)
  407a4b:	eb 07                	jmp    0x407a54
  407a4d:	a1 1c 05 41 00       	mov    0x41051c,%eax
  407a52:	88 18                	mov    %bl,(%eax)
  407a54:	5f                   	pop    %edi
  407a55:	5e                   	pop    %esi
  407a56:	5b                   	pop    %ebx
  407a57:	c9                   	leave
  407a58:	c3                   	ret
  407a59:	55                   	push   %ebp
  407a5a:	8b ec                	mov    %esp,%ebp
  407a5c:	51                   	push   %ecx
  407a5d:	51                   	push   %ecx
  407a5e:	53                   	push   %ebx
  407a5f:	56                   	push   %esi
  407a60:	57                   	push   %edi
  407a61:	8b 7d 10             	mov    0x10(%ebp),%edi
  407a64:	8b f0                	mov    %eax,%esi
  407a66:	8b c7                	mov    %edi,%eax
  407a68:	6a 04                	push   $0x4
  407a6a:	99                   	cltd
  407a6b:	5b                   	pop    %ebx
  407a6c:	f7 fb                	idiv   %ebx
  407a6e:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  407a72:	0f 85 e9 00 00 00    	jne    0x407b61
  407a78:	85 d2                	test   %edx,%edx
  407a7a:	89 55 f8             	mov    %edx,-0x8(%ebp)
  407a7d:	75 0c                	jne    0x407a8b
  407a7f:	8b c7                	mov    %edi,%eax
  407a81:	6a 64                	push   $0x64
  407a83:	99                   	cltd
  407a84:	5b                   	pop    %ebx
  407a85:	f7 fb                	idiv   %ebx
  407a87:	85 d2                	test   %edx,%edx
  407a89:	75 1f                	jne    0x407aaa
  407a8b:	8d 87 6c 07 00 00    	lea    0x76c(%edi),%eax
  407a91:	99                   	cltd
  407a92:	bb 90 01 00 00       	mov    $0x190,%ebx
  407a97:	f7 fb                	idiv   %ebx
  407a99:	85 d2                	test   %edx,%edx
  407a9b:	74 0d                	je     0x407aaa
  407a9d:	8b c6                	mov    %esi,%eax
  407a9f:	c1 e0 02             	shl    $0x2,%eax
  407aa2:	8b b0 68 05 41 00    	mov    0x410568(%eax),%esi
  407aa8:	eb 0b                	jmp    0x407ab5
  407aaa:	8b c6                	mov    %esi,%eax
  407aac:	c1 e0 02             	shl    $0x2,%eax
  407aaf:	8b b0 34 05 41 00    	mov    0x410534(%eax),%esi
  407ab5:	89 45 0c             	mov    %eax,0xc(%ebp)
  407ab8:	8d 87 2b 01 00 00    	lea    0x12b(%edi),%eax
  407abe:	99                   	cltd
  407abf:	8d 5f ff             	lea    -0x1(%edi),%ebx
  407ac2:	bf 90 01 00 00       	mov    $0x190,%edi
  407ac7:	f7 ff                	idiv   %edi
  407ac9:	6a 64                	push   $0x64
  407acb:	5f                   	pop    %edi
  407acc:	46                   	inc    %esi
  407acd:	6a 04                	push   $0x4
  407acf:	89 45 fc             	mov    %eax,-0x4(%ebp)
  407ad2:	8b c3                	mov    %ebx,%eax
  407ad4:	99                   	cltd
  407ad5:	f7 ff                	idiv   %edi
  407ad7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  407ada:	5f                   	pop    %edi
  407adb:	6a 07                	push   $0x7
  407add:	2b d0                	sub    %eax,%edx
  407adf:	8b 45 10             	mov    0x10(%ebp),%eax
  407ae2:	48                   	dec    %eax
  407ae3:	8b da                	mov    %edx,%ebx
  407ae5:	99                   	cltd
  407ae6:	f7 ff                	idiv   %edi
  407ae8:	8b 7d 10             	mov    0x10(%ebp),%edi
  407aeb:	8b d7                	mov    %edi,%edx
  407aed:	69 d2 6d 01 00 00    	imul   $0x16d,%edx,%edx
  407af3:	03 c6                	add    %esi,%eax
  407af5:	03 c3                	add    %ebx,%eax
  407af7:	8d 84 02 25 9c ff ff 	lea    -0x63db(%edx,%eax,1),%eax
  407afe:	99                   	cltd
  407aff:	5b                   	pop    %ebx
  407b00:	f7 fb                	idiv   %ebx
  407b02:	8b 45 14             	mov    0x14(%ebp),%eax
  407b05:	6b c0 07             	imul   $0x7,%eax,%eax
  407b08:	2b c2                	sub    %edx,%eax
  407b0a:	03 45 18             	add    0x18(%ebp),%eax
  407b0d:	3b 55 18             	cmp    0x18(%ebp),%edx
  407b10:	7f 06                	jg     0x407b18
  407b12:	8d 74 06 f9          	lea    -0x7(%esi,%eax,1),%esi
  407b16:	eb 02                	jmp    0x407b1a
  407b18:	03 f0                	add    %eax,%esi
  407b1a:	83 7d 14 05          	cmpl   $0x5,0x14(%ebp)
  407b1e:	75 76                	jne    0x407b96
  407b20:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  407b24:	75 0c                	jne    0x407b32
  407b26:	8b c7                	mov    %edi,%eax
  407b28:	6a 64                	push   $0x64
  407b2a:	99                   	cltd
  407b2b:	5b                   	pop    %ebx
  407b2c:	f7 fb                	idiv   %ebx
  407b2e:	85 d2                	test   %edx,%edx
  407b30:	75 1d                	jne    0x407b4f
  407b32:	8d 87 6c 07 00 00    	lea    0x76c(%edi),%eax
  407b38:	99                   	cltd
  407b39:	bb 90 01 00 00       	mov    $0x190,%ebx
  407b3e:	f7 fb                	idiv   %ebx
  407b40:	85 d2                	test   %edx,%edx
  407b42:	74 0b                	je     0x407b4f
  407b44:	8b 45 0c             	mov    0xc(%ebp),%eax
  407b47:	8b 80 6c 05 41 00    	mov    0x41056c(%eax),%eax
  407b4d:	eb 09                	jmp    0x407b58
  407b4f:	8b 45 0c             	mov    0xc(%ebp),%eax
  407b52:	8b 80 38 05 41 00    	mov    0x410538(%eax),%eax
  407b58:	3b f0                	cmp    %eax,%esi
  407b5a:	7e 3a                	jle    0x407b96
  407b5c:	83 ee 07             	sub    $0x7,%esi
  407b5f:	eb 35                	jmp    0x407b96
  407b61:	85 d2                	test   %edx,%edx
  407b63:	75 0c                	jne    0x407b71
  407b65:	8b c7                	mov    %edi,%eax
  407b67:	6a 64                	push   $0x64
  407b69:	99                   	cltd
  407b6a:	5b                   	pop    %ebx
  407b6b:	f7 fb                	idiv   %ebx
  407b6d:	85 d2                	test   %edx,%edx
  407b6f:	75 1b                	jne    0x407b8c
  407b71:	8d 87 6c 07 00 00    	lea    0x76c(%edi),%eax
  407b77:	99                   	cltd
  407b78:	bb 90 01 00 00       	mov    $0x190,%ebx
  407b7d:	f7 fb                	idiv   %ebx
  407b7f:	85 d2                	test   %edx,%edx
  407b81:	74 09                	je     0x407b8c
  407b83:	8b 34 b5 68 05 41 00 	mov    0x410568(,%esi,4),%esi
  407b8a:	eb 07                	jmp    0x407b93
  407b8c:	8b 34 b5 34 05 41 00 	mov    0x410534(,%esi,4),%esi
  407b93:	03 75 1c             	add    0x1c(%ebp),%esi
  407b96:	6b c9 3c             	imul   $0x3c,%ecx,%ecx
  407b99:	03 4d 20             	add    0x20(%ebp),%ecx
  407b9c:	6b c9 3c             	imul   $0x3c,%ecx,%ecx
  407b9f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  407ba3:	75 20                	jne    0x407bc5
  407ba5:	03 4d 24             	add    0x24(%ebp),%ecx
  407ba8:	89 35 24 05 41 00    	mov    %esi,0x410524
  407bae:	69 c9 e8 03 00 00    	imul   $0x3e8,%ecx,%ecx
  407bb4:	03 4d 28             	add    0x28(%ebp),%ecx
  407bb7:	89 3d 20 05 41 00    	mov    %edi,0x410520
  407bbd:	89 0d 28 05 41 00    	mov    %ecx,0x410528
  407bc3:	eb 47                	jmp    0x407c0c
  407bc5:	03 0d 90 04 41 00    	add    0x410490,%ecx
  407bcb:	89 35 30 05 41 00    	mov    %esi,0x410530
  407bd1:	03 4d 24             	add    0x24(%ebp),%ecx
  407bd4:	69 c9 e8 03 00 00    	imul   $0x3e8,%ecx,%ecx
  407bda:	03 4d 28             	add    0x28(%ebp),%ecx
  407bdd:	89 0d 34 05 41 00    	mov    %ecx,0x410534
  407be3:	79 09                	jns    0x407bee
  407be5:	81 c1 00 5c 26 05    	add    $0x5265c00,%ecx
  407beb:	4e                   	dec    %esi
  407bec:	eb 0c                	jmp    0x407bfa
  407bee:	b8 00 5c 26 05       	mov    $0x5265c00,%eax
  407bf3:	3b c8                	cmp    %eax,%ecx
  407bf5:	7c 0f                	jl     0x407c06
  407bf7:	2b c8                	sub    %eax,%ecx
  407bf9:	46                   	inc    %esi
  407bfa:	89 0d 34 05 41 00    	mov    %ecx,0x410534
  407c00:	89 35 30 05 41 00    	mov    %esi,0x410530
  407c06:	89 3d 2c 05 41 00    	mov    %edi,0x41052c
  407c0c:	5f                   	pop    %edi
  407c0d:	5e                   	pop    %esi
  407c0e:	5b                   	pop    %ebx
  407c0f:	c9                   	leave
  407c10:	c3                   	ret
  407c11:	56                   	push   %esi
  407c12:	33 f6                	xor    %esi,%esi
  407c14:	39 35 8c 04 41 00    	cmp    %esi,0x41048c
  407c1a:	75 04                	jne    0x407c20
  407c1c:	33 c0                	xor    %eax,%eax
  407c1e:	5e                   	pop    %esi
  407c1f:	c3                   	ret
  407c20:	53                   	push   %ebx
  407c21:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  407c25:	55                   	push   %ebp
  407c26:	33 ed                	xor    %ebp,%ebp
  407c28:	57                   	push   %edi
  407c29:	8b 7b 14             	mov    0x14(%ebx),%edi
  407c2c:	45                   	inc    %ebp
  407c2d:	3b 3d 20 05 41 00    	cmp    0x410520,%edi
  407c33:	75 0c                	jne    0x407c41
  407c35:	3b 3d 2c 05 41 00    	cmp    0x41052c,%edi
  407c3b:	0f 84 ec 00 00 00    	je     0x407d2d
  407c41:	39 35 84 1e 41 00    	cmp    %esi,0x411e84
  407c47:	0f 84 b4 00 00 00    	je     0x407d01
  407c4d:	66 39 35 70 1e 41 00 	cmp    %si,0x411e70
  407c54:	0f b7 05 7e 1e 41 00 	movzwl 0x411e7e,%eax
  407c5b:	0f b7 0d 78 1e 41 00 	movzwl 0x411e78,%ecx
  407c62:	50                   	push   %eax
  407c63:	0f b7 05 7c 1e 41 00 	movzwl 0x411e7c,%eax
  407c6a:	50                   	push   %eax
  407c6b:	0f b7 05 7a 1e 41 00 	movzwl 0x411e7a,%eax
  407c72:	50                   	push   %eax
  407c73:	75 15                	jne    0x407c8a
  407c75:	0f b7 05 74 1e 41 00 	movzwl 0x411e74,%eax
  407c7c:	56                   	push   %esi
  407c7d:	50                   	push   %eax
  407c7e:	0f b7 05 76 1e 41 00 	movzwl 0x411e76,%eax
  407c85:	50                   	push   %eax
  407c86:	57                   	push   %edi
  407c87:	55                   	push   %ebp
  407c88:	eb 0c                	jmp    0x407c96
  407c8a:	0f b7 05 76 1e 41 00 	movzwl 0x411e76,%eax
  407c91:	50                   	push   %eax
  407c92:	56                   	push   %esi
  407c93:	56                   	push   %esi
  407c94:	57                   	push   %edi
  407c95:	56                   	push   %esi
  407c96:	0f b7 05 72 1e 41 00 	movzwl 0x411e72,%eax
  407c9d:	55                   	push   %ebp
  407c9e:	e8 b6 fd ff ff       	call   0x407a59
  407ca3:	0f b7 05 2a 1e 41 00 	movzwl 0x411e2a,%eax
  407caa:	0f b7 0d 24 1e 41 00 	movzwl 0x411e24,%ecx
  407cb1:	83 c4 24             	add    $0x24,%esp
  407cb4:	66 39 35 1c 1e 41 00 	cmp    %si,0x411e1c
  407cbb:	50                   	push   %eax
  407cbc:	0f b7 05 28 1e 41 00 	movzwl 0x411e28,%eax
  407cc3:	50                   	push   %eax
  407cc4:	0f b7 05 26 1e 41 00 	movzwl 0x411e26,%eax
  407ccb:	50                   	push   %eax
  407ccc:	75 25                	jne    0x407cf3
  407cce:	0f b7 05 20 1e 41 00 	movzwl 0x411e20,%eax
  407cd5:	56                   	push   %esi
  407cd6:	50                   	push   %eax
  407cd7:	0f b7 05 22 1e 41 00 	movzwl 0x411e22,%eax
  407cde:	50                   	push   %eax
  407cdf:	57                   	push   %edi
  407ce0:	55                   	push   %ebp
  407ce1:	0f b7 05 1e 1e 41 00 	movzwl 0x411e1e,%eax
  407ce8:	56                   	push   %esi
  407ce9:	e8 6b fd ff ff       	call   0x407a59
  407cee:	83 c4 24             	add    $0x24,%esp
  407cf1:	eb 3a                	jmp    0x407d2d
  407cf3:	0f b7 05 22 1e 41 00 	movzwl 0x411e22,%eax
  407cfa:	50                   	push   %eax
  407cfb:	56                   	push   %esi
  407cfc:	56                   	push   %esi
  407cfd:	57                   	push   %edi
  407cfe:	56                   	push   %esi
  407cff:	eb e0                	jmp    0x407ce1
  407d01:	56                   	push   %esi
  407d02:	56                   	push   %esi
  407d03:	56                   	push   %esi
  407d04:	56                   	push   %esi
  407d05:	56                   	push   %esi
  407d06:	55                   	push   %ebp
  407d07:	57                   	push   %edi
  407d08:	55                   	push   %ebp
  407d09:	55                   	push   %ebp
  407d0a:	6a 02                	push   $0x2
  407d0c:	59                   	pop    %ecx
  407d0d:	6a 04                	push   $0x4
  407d0f:	58                   	pop    %eax
  407d10:	e8 44 fd ff ff       	call   0x407a59
  407d15:	56                   	push   %esi
  407d16:	56                   	push   %esi
  407d17:	56                   	push   %esi
  407d18:	56                   	push   %esi
  407d19:	56                   	push   %esi
  407d1a:	6a 05                	push   $0x5
  407d1c:	57                   	push   %edi
  407d1d:	55                   	push   %ebp
  407d1e:	56                   	push   %esi
  407d1f:	6a 02                	push   $0x2
  407d21:	59                   	pop    %ecx
  407d22:	6a 0a                	push   $0xa
  407d24:	58                   	pop    %eax
  407d25:	e8 2f fd ff ff       	call   0x407a59
  407d2a:	83 c4 48             	add    $0x48,%esp
  407d2d:	8b 15 24 05 41 00    	mov    0x410524,%edx
  407d33:	a1 30 05 41 00       	mov    0x410530,%eax
  407d38:	3b d0                	cmp    %eax,%edx
  407d3a:	8b 4b 1c             	mov    0x1c(%ebx),%ecx
  407d3d:	7d 17                	jge    0x407d56
  407d3f:	3b ca                	cmp    %edx,%ecx
  407d41:	7c 23                	jl     0x407d66
  407d43:	3b c8                	cmp    %eax,%ecx
  407d45:	7f 1f                	jg     0x407d66
  407d47:	3b ca                	cmp    %edx,%ecx
  407d49:	7e 1f                	jle    0x407d6a
  407d4b:	3b c8                	cmp    %eax,%ecx
  407d4d:	7d 1b                	jge    0x407d6a
  407d4f:	8b c5                	mov    %ebp,%eax
  407d51:	5f                   	pop    %edi
  407d52:	5d                   	pop    %ebp
  407d53:	5b                   	pop    %ebx
  407d54:	5e                   	pop    %esi
  407d55:	c3                   	ret
  407d56:	3b c8                	cmp    %eax,%ecx
  407d58:	7c f5                	jl     0x407d4f
  407d5a:	3b ca                	cmp    %edx,%ecx
  407d5c:	7f f1                	jg     0x407d4f
  407d5e:	3b c8                	cmp    %eax,%ecx
  407d60:	7e 08                	jle    0x407d6a
  407d62:	3b ca                	cmp    %edx,%ecx
  407d64:	7d 04                	jge    0x407d6a
  407d66:	33 c0                	xor    %eax,%eax
  407d68:	eb e7                	jmp    0x407d51
  407d6a:	8b 43 08             	mov    0x8(%ebx),%eax
  407d6d:	6b c0 3c             	imul   $0x3c,%eax,%eax
  407d70:	03 43 04             	add    0x4(%ebx),%eax
  407d73:	6b c0 3c             	imul   $0x3c,%eax,%eax
  407d76:	03 03                	add    (%ebx),%eax
  407d78:	69 c0 e8 03 00 00    	imul   $0x3e8,%eax,%eax
  407d7e:	3b ca                	cmp    %edx,%ecx
  407d80:	75 0d                	jne    0x407d8f
  407d82:	33 c9                	xor    %ecx,%ecx
  407d84:	3b 05 28 05 41 00    	cmp    0x410528,%eax
  407d8a:	0f 9d c1             	setge  %cl
  407d8d:	eb 0b                	jmp    0x407d9a
  407d8f:	33 c9                	xor    %ecx,%ecx
  407d91:	3b 05 34 05 41 00    	cmp    0x410534,%eax
  407d97:	0f 9c c1             	setl   %cl
  407d9a:	8b c1                	mov    %ecx,%eax
  407d9c:	eb b3                	jmp    0x407d51
  407d9e:	83 3d 8c 1e 41 00 00 	cmpl   $0x0,0x411e8c
  407da5:	75 0b                	jne    0x407db2
  407da7:	e8 5a fa ff ff       	call   0x407806
  407dac:	ff 05 8c 1e 41 00    	incl   0x411e8c
  407db2:	c3                   	ret
  407db3:	55                   	push   %ebp
  407db4:	8d ac 24 74 ff ff ff 	lea    -0x8c(%esp),%ebp
  407dbb:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  407dc1:	a1 6c 04 41 00       	mov    0x41046c,%eax
  407dc6:	8b 8d 94 00 00 00    	mov    0x94(%ebp),%ecx
  407dcc:	53                   	push   %ebx
  407dcd:	56                   	push   %esi
  407dce:	89 85 88 00 00 00    	mov    %eax,0x88(%ebp)
  407dd4:	33 d2                	xor    %edx,%edx
  407dd6:	57                   	push   %edi
  407dd7:	33 c0                	xor    %eax,%eax
  407dd9:	3b 0c c5 a0 05 41 00 	cmp    0x4105a0(,%eax,8),%ecx
  407de0:	74 06                	je     0x407de8
  407de2:	40                   	inc    %eax
  407de3:	83 f8 13             	cmp    $0x13,%eax
  407de6:	72 f1                	jb     0x407dd9
  407de8:	8b f0                	mov    %eax,%esi
  407dea:	c1 e6 03             	shl    $0x3,%esi
  407ded:	3b 8e a0 05 41 00    	cmp    0x4105a0(%esi),%ecx
  407df3:	0f 85 15 01 00 00    	jne    0x407f0e
  407df9:	a1 4c 1d 41 00       	mov    0x411d4c,%eax
  407dfe:	83 f8 01             	cmp    $0x1,%eax
  407e01:	0f 84 df 00 00 00    	je     0x407ee6
  407e07:	3b c2                	cmp    %edx,%eax
  407e09:	75 0d                	jne    0x407e18
  407e0b:	83 3d 64 04 41 00 01 	cmpl   $0x1,0x410464
  407e12:	0f 84 ce 00 00 00    	je     0x407ee6
  407e18:	81 f9 fc 00 00 00    	cmp    $0xfc,%ecx
  407e1e:	0f 84 ea 00 00 00    	je     0x407f0e
  407e24:	68 04 01 00 00       	push   $0x104
  407e29:	8d 45 80             	lea    -0x80(%ebp),%eax
  407e2c:	50                   	push   %eax
  407e2d:	52                   	push   %edx
  407e2e:	88 95 84 00 00 00    	mov    %dl,0x84(%ebp)
  407e34:	ff 15 24 d1 40 00    	call   *0x40d124  ; 0x40d124=KERNEL32.dll!GetModuleFileNameA
  407e3a:	85 c0                	test   %eax,%eax
  407e3c:	75 10                	jne    0x407e4e
  407e3e:	8d 45 80             	lea    -0x80(%ebp),%eax
  407e41:	68 54 db 40 00       	push   $0x40db54  ; 0x40db54='<program name unknown>'
  407e46:	50                   	push   %eax
  407e47:	e8 04 20 00 00       	call   0x409e50
  407e4c:	59                   	pop    %ecx
  407e4d:	59                   	pop    %ecx
  407e4e:	8d 7d 80             	lea    -0x80(%ebp),%edi
  407e51:	8b c7                	mov    %edi,%eax
  407e53:	50                   	push   %eax
  407e54:	e8 07 1c 00 00       	call   0x409a60
  407e59:	40                   	inc    %eax
  407e5a:	83 f8 3c             	cmp    $0x3c,%eax
  407e5d:	59                   	pop    %ecx
  407e5e:	76 22                	jbe    0x407e82
  407e60:	8b c7                	mov    %edi,%eax
  407e62:	50                   	push   %eax
  407e63:	e8 f8 1b 00 00       	call   0x409a60
  407e68:	8b f8                	mov    %eax,%edi
  407e6a:	8d 45 80             	lea    -0x80(%ebp),%eax
  407e6d:	83 e8 3b             	sub    $0x3b,%eax
  407e70:	6a 03                	push   $0x3
  407e72:	03 f8                	add    %eax,%edi
  407e74:	68 50 db 40 00       	push   $0x40db50
  407e79:	57                   	push   %edi
  407e7a:	e8 e1 de ff ff       	call   0x405d60
  407e7f:	83 c4 10             	add    $0x10,%esp
  407e82:	57                   	push   %edi
  407e83:	e8 d8 1b 00 00       	call   0x409a60
  407e88:	ff b6 a4 05 41 00    	push   0x4105a4(%esi)
  407e8e:	8b d8                	mov    %eax,%ebx
  407e90:	e8 cb 1b 00 00       	call   0x409a60
  407e95:	8d 44 03 1c          	lea    0x1c(%ebx,%eax,1),%eax
  407e99:	59                   	pop    %ecx
  407e9a:	83 c0 03             	add    $0x3,%eax
  407e9d:	59                   	pop    %ecx
  407e9e:	83 e0 fc             	and    $0xfffffffc,%eax
  407ea1:	e8 6a de ff ff       	call   0x405d10
  407ea6:	8b dc                	mov    %esp,%ebx
  407ea8:	68 34 db 40 00       	push   $0x40db34  ; 0x40db34='Runtime Error!'
  407ead:	53                   	push   %ebx
  407eae:	e8 9d 1f 00 00       	call   0x409e50
  407eb3:	57                   	push   %edi
  407eb4:	53                   	push   %ebx
  407eb5:	e8 a6 1f 00 00       	call   0x409e60
  407eba:	68 30 db 40 00       	push   $0x40db30
  407ebf:	53                   	push   %ebx
  407ec0:	e8 9b 1f 00 00       	call   0x409e60
  407ec5:	ff b6 a4 05 41 00    	push   0x4105a4(%esi)
  407ecb:	53                   	push   %ebx
  407ecc:	e8 8f 1f 00 00       	call   0x409e60
  407ed1:	68 10 20 01 00       	push   $0x12010
  407ed6:	68 08 db 40 00       	push   $0x40db08  ; 0x40db08='Microsoft Visual C++ Runtime Library'
  407edb:	53                   	push   %ebx
  407edc:	e8 e8 20 00 00       	call   0x409fc9
  407ee1:	83 c4 2c             	add    $0x2c,%esp
  407ee4:	eb 28                	jmp    0x407f0e
  407ee6:	52                   	push   %edx
  407ee7:	8d 85 94 00 00 00    	lea    0x94(%ebp),%eax
  407eed:	50                   	push   %eax
  407eee:	8d b6 a4 05 41 00    	lea    0x4105a4(%esi),%esi
  407ef4:	ff 36                	push   (%esi)
  407ef6:	e8 65 1b 00 00       	call   0x409a60
  407efb:	59                   	pop    %ecx
  407efc:	50                   	push   %eax
  407efd:	ff 36                	push   (%esi)
  407eff:	6a f4                	push   $0xfffffff4
  407f01:	ff 15 64 d1 40 00    	call   *0x40d164  ; 0x40d164=KERNEL32.dll!GetStdHandle
  407f07:	50                   	push   %eax
  407f08:	ff 15 50 d0 40 00    	call   *0x40d050  ; 0x40d050=KERNEL32.dll!WriteFile
  407f0e:	8d a5 74 ff ff ff    	lea    -0x8c(%ebp),%esp
  407f14:	8b 8d 88 00 00 00    	mov    0x88(%ebp),%ecx
  407f1a:	e8 fd 1b 00 00       	call   0x409b1c
  407f1f:	5f                   	pop    %edi
  407f20:	5e                   	pop    %esi
  407f21:	5b                   	pop    %ebx
  407f22:	81 c5 8c 00 00 00    	add    $0x8c,%ebp
  407f28:	c9                   	leave
  407f29:	c3                   	ret
  407f2a:	a1 4c 1d 41 00       	mov    0x411d4c,%eax
  407f2f:	83 f8 01             	cmp    $0x1,%eax
  407f32:	74 0d                	je     0x407f41
  407f34:	85 c0                	test   %eax,%eax
  407f36:	75 2a                	jne    0x407f62
  407f38:	83 3d 64 04 41 00 01 	cmpl   $0x1,0x410464
  407f3f:	75 21                	jne    0x407f62
  407f41:	68 fc 00 00 00       	push   $0xfc
  407f46:	e8 68 fe ff ff       	call   0x407db3
  407f4b:	a1 90 1e 41 00       	mov    0x411e90,%eax
  407f50:	85 c0                	test   %eax,%eax
  407f52:	59                   	pop    %ecx
  407f53:	74 02                	je     0x407f57
  407f55:	ff d0                	call   *%eax
  407f57:	68 ff 00 00 00       	push   $0xff
  407f5c:	e8 52 fe ff ff       	call   0x407db3
  407f61:	59                   	pop    %ecx
  407f62:	c3                   	ret
  407f63:	55                   	push   %ebp
  407f64:	8b ec                	mov    %esp,%ebp
  407f66:	8b 55 08             	mov    0x8(%ebp),%edx
  407f69:	a1 b8 06 41 00       	mov    0x4106b8,%eax
  407f6e:	53                   	push   %ebx
  407f6f:	b9 38 06 41 00       	mov    $0x410638,%ecx
  407f74:	56                   	push   %esi
  407f75:	39 11                	cmp    %edx,(%ecx)
  407f77:	74 11                	je     0x407f8a
  407f79:	8d 34 40             	lea    (%eax,%eax,2),%esi
  407f7c:	83 c1 0c             	add    $0xc,%ecx
  407f7f:	8d 34 b5 38 06 41 00 	lea    0x410638(,%esi,4),%esi
  407f86:	3b ce                	cmp    %esi,%ecx
  407f88:	72 eb                	jb     0x407f75
  407f8a:	8d 04 40             	lea    (%eax,%eax,2),%eax
  407f8d:	8d 04 85 38 06 41 00 	lea    0x410638(,%eax,4),%eax
  407f94:	3b c8                	cmp    %eax,%ecx
  407f96:	73 04                	jae    0x407f9c
  407f98:	39 11                	cmp    %edx,(%ecx)
  407f9a:	74 02                	je     0x407f9e
  407f9c:	33 c9                	xor    %ecx,%ecx
  407f9e:	85 c9                	test   %ecx,%ecx
  407fa0:	0f 84 21 01 00 00    	je     0x4080c7
  407fa6:	8b 59 08             	mov    0x8(%ecx),%ebx
  407fa9:	85 db                	test   %ebx,%ebx
  407fab:	0f 84 16 01 00 00    	je     0x4080c7
  407fb1:	83 fb 05             	cmp    $0x5,%ebx
  407fb4:	75 0c                	jne    0x407fc2
  407fb6:	83 61 08 00          	andl   $0x0,0x8(%ecx)
  407fba:	33 c0                	xor    %eax,%eax
  407fbc:	40                   	inc    %eax
  407fbd:	e9 0e 01 00 00       	jmp    0x4080d0
  407fc2:	83 fb 01             	cmp    $0x1,%ebx
  407fc5:	0f 84 f7 00 00 00    	je     0x4080c2
  407fcb:	a1 94 1e 41 00       	mov    0x411e94,%eax
  407fd0:	89 45 08             	mov    %eax,0x8(%ebp)
  407fd3:	8b 45 0c             	mov    0xc(%ebp),%eax
  407fd6:	a3 94 1e 41 00       	mov    %eax,0x411e94
  407fdb:	8b 41 04             	mov    0x4(%ecx),%eax
  407fde:	83 f8 08             	cmp    $0x8,%eax
  407fe1:	0f 85 cb 00 00 00    	jne    0x4080b2
  407fe7:	a1 b0 06 41 00       	mov    0x4106b0,%eax
  407fec:	8b 15 b4 06 41 00    	mov    0x4106b4,%edx
  407ff2:	03 d0                	add    %eax,%edx
  407ff4:	3b c2                	cmp    %edx,%eax
  407ff6:	7d 15                	jge    0x40800d
  407ff8:	8d 34 40             	lea    (%eax,%eax,2),%esi
  407ffb:	8d 34 b5 40 06 41 00 	lea    0x410640(,%esi,4),%esi
  408002:	2b d0                	sub    %eax,%edx
  408004:	83 26 00             	andl   $0x0,(%esi)
  408007:	83 c6 0c             	add    $0xc,%esi
  40800a:	4a                   	dec    %edx
  40800b:	75 f7                	jne    0x408004
  40800d:	8b 09                	mov    (%ecx),%ecx
  40800f:	81 f9 8e 00 00 c0    	cmp    $0xc000008e,%ecx
  408015:	8b 35 bc 06 41 00    	mov    0x4106bc,%esi
  40801b:	75 0c                	jne    0x408029
  40801d:	c7 05 bc 06 41 00 83 	movl   $0x83,0x4106bc
  408024:	00 00 00 
  408027:	eb 76                	jmp    0x40809f
  408029:	81 f9 90 00 00 c0    	cmp    $0xc0000090,%ecx
  40802f:	75 0c                	jne    0x40803d
  408031:	c7 05 bc 06 41 00 81 	movl   $0x81,0x4106bc
  408038:	00 00 00 
  40803b:	eb 62                	jmp    0x40809f
  40803d:	81 f9 91 00 00 c0    	cmp    $0xc0000091,%ecx
  408043:	75 0c                	jne    0x408051
  408045:	c7 05 bc 06 41 00 84 	movl   $0x84,0x4106bc
  40804c:	00 00 00 
  40804f:	eb 4e                	jmp    0x40809f
  408051:	81 f9 93 00 00 c0    	cmp    $0xc0000093,%ecx
  408057:	75 0c                	jne    0x408065
  408059:	c7 05 bc 06 41 00 85 	movl   $0x85,0x4106bc
  408060:	00 00 00 
  408063:	eb 3a                	jmp    0x40809f
  408065:	81 f9 8d 00 00 c0    	cmp    $0xc000008d,%ecx
  40806b:	75 0c                	jne    0x408079
  40806d:	c7 05 bc 06 41 00 82 	movl   $0x82,0x4106bc
  408074:	00 00 00 
  408077:	eb 26                	jmp    0x40809f
  408079:	81 f9 8f 00 00 c0    	cmp    $0xc000008f,%ecx
  40807f:	75 0c                	jne    0x40808d
  408081:	c7 05 bc 06 41 00 86 	movl   $0x86,0x4106bc
  408088:	00 00 00 
  40808b:	eb 12                	jmp    0x40809f
  40808d:	81 f9 92 00 00 c0    	cmp    $0xc0000092,%ecx
  408093:	75 0a                	jne    0x40809f
  408095:	c7 05 bc 06 41 00 8a 	movl   $0x8a,0x4106bc
  40809c:	00 00 00 
  40809f:	ff 35 bc 06 41 00    	push   0x4106bc
  4080a5:	6a 08                	push   $0x8
  4080a7:	ff d3                	call   *%ebx
  4080a9:	59                   	pop    %ecx
  4080aa:	89 35 bc 06 41 00    	mov    %esi,0x4106bc
  4080b0:	eb 07                	jmp    0x4080b9
  4080b2:	83 61 08 00          	andl   $0x0,0x8(%ecx)
  4080b6:	50                   	push   %eax
  4080b7:	ff d3                	call   *%ebx
  4080b9:	8b 45 08             	mov    0x8(%ebp),%eax
  4080bc:	59                   	pop    %ecx
  4080bd:	a3 94 1e 41 00       	mov    %eax,0x411e94
  4080c2:	83 c8 ff             	or     $0xffffffff,%eax
  4080c5:	eb 09                	jmp    0x4080d0
  4080c7:	ff 75 0c             	push   0xc(%ebp)
  4080ca:	ff 15 68 d1 40 00    	call   *0x40d168  ; 0x40d168=KERNEL32.dll!UnhandledExceptionFilter
  4080d0:	5e                   	pop    %esi
  4080d1:	5b                   	pop    %ebx
  4080d2:	5d                   	pop    %ebp
  4080d3:	c3                   	ret
  4080d4:	56                   	push   %esi
  4080d5:	57                   	push   %edi
  4080d6:	33 ff                	xor    %edi,%edi
  4080d8:	39 3d 0c 34 41 00    	cmp    %edi,0x41340c
  4080de:	75 05                	jne    0x4080e5
  4080e0:	e8 eb 23 00 00       	call   0x40a4d0
  4080e5:	8b 35 14 34 41 00    	mov    0x413414,%esi
  4080eb:	85 f6                	test   %esi,%esi
  4080ed:	75 05                	jne    0x4080f4
  4080ef:	be 4e d4 40 00       	mov    $0x40d44e,%esi
  4080f4:	8a 06                	mov    (%esi),%al
  4080f6:	3c 20                	cmp    $0x20,%al
  4080f8:	77 08                	ja     0x408102
  4080fa:	84 c0                	test   %al,%al
  4080fc:	74 2e                	je     0x40812c
  4080fe:	85 ff                	test   %edi,%edi
  408100:	74 24                	je     0x408126
  408102:	3c 22                	cmp    $0x22,%al
  408104:	75 09                	jne    0x40810f
  408106:	33 c9                	xor    %ecx,%ecx
  408108:	85 ff                	test   %edi,%edi
  40810a:	0f 94 c1             	sete   %cl
  40810d:	8b f9                	mov    %ecx,%edi
  40810f:	0f b6 c0             	movzbl %al,%eax
  408112:	50                   	push   %eax
  408113:	e8 dd 1f 00 00       	call   0x40a0f5
  408118:	85 c0                	test   %eax,%eax
  40811a:	59                   	pop    %ecx
  40811b:	74 01                	je     0x40811e
  40811d:	46                   	inc    %esi
  40811e:	46                   	inc    %esi
  40811f:	eb d3                	jmp    0x4080f4
  408121:	3c 20                	cmp    $0x20,%al
  408123:	77 07                	ja     0x40812c
  408125:	46                   	inc    %esi
  408126:	8a 06                	mov    (%esi),%al
  408128:	84 c0                	test   %al,%al
  40812a:	75 f5                	jne    0x408121
  40812c:	5f                   	pop    %edi
  40812d:	8b c6                	mov    %esi,%eax
  40812f:	5e                   	pop    %esi
  408130:	c3                   	ret
  408131:	53                   	push   %ebx
  408132:	33 db                	xor    %ebx,%ebx
  408134:	39 1d 0c 34 41 00    	cmp    %ebx,0x41340c
  40813a:	56                   	push   %esi
  40813b:	57                   	push   %edi
  40813c:	75 05                	jne    0x408143
  40813e:	e8 8d 23 00 00       	call   0x40a4d0
  408143:	8b 35 44 1d 41 00    	mov    0x411d44,%esi
  408149:	33 ff                	xor    %edi,%edi
  40814b:	3b f3                	cmp    %ebx,%esi
  40814d:	75 12                	jne    0x408161
  40814f:	eb 30                	jmp    0x408181
  408151:	3c 3d                	cmp    $0x3d,%al
  408153:	74 01                	je     0x408156
  408155:	47                   	inc    %edi
  408156:	56                   	push   %esi
  408157:	e8 04 19 00 00       	call   0x409a60
  40815c:	59                   	pop    %ecx
  40815d:	8d 74 06 01          	lea    0x1(%esi,%eax,1),%esi
  408161:	8a 06                	mov    (%esi),%al
  408163:	3a c3                	cmp    %bl,%al
  408165:	75 ea                	jne    0x408151
  408167:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
  40816e:	50                   	push   %eax
  40816f:	e8 f1 ea ff ff       	call   0x406c65
  408174:	8b f8                	mov    %eax,%edi
  408176:	3b fb                	cmp    %ebx,%edi
  408178:	59                   	pop    %ecx
  408179:	89 3d 7c 1d 41 00    	mov    %edi,0x411d7c
  40817f:	75 05                	jne    0x408186
  408181:	83 c8 ff             	or     $0xffffffff,%eax
  408184:	eb 58                	jmp    0x4081de
  408186:	8b 35 44 1d 41 00    	mov    0x411d44,%esi
  40818c:	55                   	push   %ebp
  40818d:	eb 2a                	jmp    0x4081b9
  40818f:	56                   	push   %esi
  408190:	e8 cb 18 00 00       	call   0x409a60
  408195:	8b e8                	mov    %eax,%ebp
  408197:	45                   	inc    %ebp
  408198:	80 3e 3d             	cmpb   $0x3d,(%esi)
  40819b:	59                   	pop    %ecx
  40819c:	74 19                	je     0x4081b7
  40819e:	55                   	push   %ebp
  40819f:	e8 c1 ea ff ff       	call   0x406c65
  4081a4:	3b c3                	cmp    %ebx,%eax
  4081a6:	59                   	pop    %ecx
  4081a7:	89 07                	mov    %eax,(%edi)
  4081a9:	74 37                	je     0x4081e2
  4081ab:	56                   	push   %esi
  4081ac:	50                   	push   %eax
  4081ad:	e8 9e 1c 00 00       	call   0x409e50
  4081b2:	59                   	pop    %ecx
  4081b3:	59                   	pop    %ecx
  4081b4:	83 c7 04             	add    $0x4,%edi
  4081b7:	03 f5                	add    %ebp,%esi
  4081b9:	38 1e                	cmp    %bl,(%esi)
  4081bb:	75 d2                	jne    0x40818f
  4081bd:	ff 35 44 1d 41 00    	push   0x411d44
  4081c3:	e8 af ea ff ff       	call   0x406c77
  4081c8:	89 1d 44 1d 41 00    	mov    %ebx,0x411d44
  4081ce:	89 1f                	mov    %ebx,(%edi)
  4081d0:	c7 05 00 34 41 00 01 	movl   $0x1,0x413400
  4081d7:	00 00 00 
  4081da:	33 c0                	xor    %eax,%eax
  4081dc:	59                   	pop    %ecx
  4081dd:	5d                   	pop    %ebp
  4081de:	5f                   	pop    %edi
  4081df:	5e                   	pop    %esi
  4081e0:	5b                   	pop    %ebx
  4081e1:	c3                   	ret
  4081e2:	ff 35 7c 1d 41 00    	push   0x411d7c
  4081e8:	e8 8a ea ff ff       	call   0x406c77
  4081ed:	89 1d 7c 1d 41 00    	mov    %ebx,0x411d7c
  4081f3:	83 c8 ff             	or     $0xffffffff,%eax
  4081f6:	eb e4                	jmp    0x4081dc
  4081f8:	55                   	push   %ebp
  4081f9:	8b ec                	mov    %esp,%ebp
  4081fb:	51                   	push   %ecx
  4081fc:	53                   	push   %ebx
  4081fd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  408200:	33 d2                	xor    %edx,%edx
  408202:	39 55 08             	cmp    %edx,0x8(%ebp)
  408205:	57                   	push   %edi
  408206:	89 16                	mov    %edx,(%esi)
  408208:	8b f9                	mov    %ecx,%edi
  40820a:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  408210:	74 09                	je     0x40821b
  408212:	8b 4d 08             	mov    0x8(%ebp),%ecx
  408215:	83 45 08 04          	addl   $0x4,0x8(%ebp)
  408219:	89 39                	mov    %edi,(%ecx)
  40821b:	80 38 22             	cmpb   $0x22,(%eax)
  40821e:	75 0e                	jne    0x40822e
  408220:	33 c9                	xor    %ecx,%ecx
  408222:	85 d2                	test   %edx,%edx
  408224:	0f 94 c1             	sete   %cl
  408227:	40                   	inc    %eax
  408228:	8b d1                	mov    %ecx,%edx
  40822a:	b1 22                	mov    $0x22,%cl
  40822c:	eb 2d                	jmp    0x40825b
  40822e:	ff 06                	incl   (%esi)
  408230:	85 ff                	test   %edi,%edi
  408232:	74 05                	je     0x408239
  408234:	8a 08                	mov    (%eax),%cl
  408236:	88 0f                	mov    %cl,(%edi)
  408238:	47                   	inc    %edi
  408239:	8a 08                	mov    (%eax),%cl
  40823b:	0f b6 d9             	movzbl %cl,%ebx
  40823e:	40                   	inc    %eax
  40823f:	f6 83 81 20 41 00 04 	testb  $0x4,0x412081(%ebx)
  408246:	74 0c                	je     0x408254
  408248:	ff 06                	incl   (%esi)
  40824a:	85 ff                	test   %edi,%edi
  40824c:	74 05                	je     0x408253
  40824e:	8a 18                	mov    (%eax),%bl
  408250:	88 1f                	mov    %bl,(%edi)
  408252:	47                   	inc    %edi
  408253:	40                   	inc    %eax
  408254:	84 c9                	test   %cl,%cl
  408256:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  408259:	74 32                	je     0x40828d
  40825b:	85 d2                	test   %edx,%edx
  40825d:	75 bc                	jne    0x40821b
  40825f:	80 f9 20             	cmp    $0x20,%cl
  408262:	74 05                	je     0x408269
  408264:	80 f9 09             	cmp    $0x9,%cl
  408267:	75 b2                	jne    0x40821b
  408269:	85 ff                	test   %edi,%edi
  40826b:	74 04                	je     0x408271
  40826d:	c6 47 ff 00          	movb   $0x0,-0x1(%edi)
  408271:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  408275:	80 38 00             	cmpb   $0x0,(%eax)
  408278:	0f 84 d6 00 00 00    	je     0x408354
  40827e:	8a 08                	mov    (%eax),%cl
  408280:	80 f9 20             	cmp    $0x20,%cl
  408283:	74 05                	je     0x40828a
  408285:	80 f9 09             	cmp    $0x9,%cl
  408288:	75 06                	jne    0x408290
  40828a:	40                   	inc    %eax
  40828b:	eb f1                	jmp    0x40827e
  40828d:	48                   	dec    %eax
  40828e:	eb e1                	jmp    0x408271
  408290:	80 38 00             	cmpb   $0x0,(%eax)
  408293:	0f 84 bb 00 00 00    	je     0x408354
  408299:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  40829d:	74 09                	je     0x4082a8
  40829f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  4082a2:	83 45 08 04          	addl   $0x4,0x8(%ebp)
  4082a6:	89 39                	mov    %edi,(%ecx)
  4082a8:	ff 03                	incl   (%ebx)
  4082aa:	33 db                	xor    %ebx,%ebx
  4082ac:	43                   	inc    %ebx
  4082ad:	33 d2                	xor    %edx,%edx
  4082af:	eb 02                	jmp    0x4082b3
  4082b1:	40                   	inc    %eax
  4082b2:	42                   	inc    %edx
  4082b3:	80 38 5c             	cmpb   $0x5c,(%eax)
  4082b6:	74 f9                	je     0x4082b1
  4082b8:	80 38 22             	cmpb   $0x22,(%eax)
  4082bb:	75 26                	jne    0x4082e3
  4082bd:	f6 c2 01             	test   $0x1,%dl
  4082c0:	75 1f                	jne    0x4082e1
  4082c2:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  4082c6:	74 0c                	je     0x4082d4
  4082c8:	8d 48 01             	lea    0x1(%eax),%ecx
  4082cb:	80 39 22             	cmpb   $0x22,(%ecx)
  4082ce:	75 04                	jne    0x4082d4
  4082d0:	8b c1                	mov    %ecx,%eax
  4082d2:	eb 02                	jmp    0x4082d6
  4082d4:	33 db                	xor    %ebx,%ebx
  4082d6:	33 c9                	xor    %ecx,%ecx
  4082d8:	39 4d fc             	cmp    %ecx,-0x4(%ebp)
  4082db:	0f 94 c1             	sete   %cl
  4082de:	89 4d fc             	mov    %ecx,-0x4(%ebp)
  4082e1:	d1 ea                	shr    $1,%edx
  4082e3:	85 d2                	test   %edx,%edx
  4082e5:	74 0d                	je     0x4082f4
  4082e7:	85 ff                	test   %edi,%edi
  4082e9:	74 04                	je     0x4082ef
  4082eb:	c6 07 5c             	movb   $0x5c,(%edi)
  4082ee:	47                   	inc    %edi
  4082ef:	ff 06                	incl   (%esi)
  4082f1:	4a                   	dec    %edx
  4082f2:	75 f3                	jne    0x4082e7
  4082f4:	8a 08                	mov    (%eax),%cl
  4082f6:	84 c9                	test   %cl,%cl
  4082f8:	74 48                	je     0x408342
  4082fa:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  4082fe:	75 0a                	jne    0x40830a
  408300:	80 f9 20             	cmp    $0x20,%cl
  408303:	74 3d                	je     0x408342
  408305:	80 f9 09             	cmp    $0x9,%cl
  408308:	74 38                	je     0x408342
  40830a:	85 db                	test   %ebx,%ebx
  40830c:	74 2e                	je     0x40833c
  40830e:	85 ff                	test   %edi,%edi
  408310:	74 19                	je     0x40832b
  408312:	0f b6 d1             	movzbl %cl,%edx
  408315:	f6 82 81 20 41 00 04 	testb  $0x4,0x412081(%edx)
  40831c:	74 06                	je     0x408324
  40831e:	88 0f                	mov    %cl,(%edi)
  408320:	47                   	inc    %edi
  408321:	40                   	inc    %eax
  408322:	ff 06                	incl   (%esi)
  408324:	8a 08                	mov    (%eax),%cl
  408326:	88 0f                	mov    %cl,(%edi)
  408328:	47                   	inc    %edi
  408329:	eb 0f                	jmp    0x40833a
  40832b:	0f b6 c9             	movzbl %cl,%ecx
  40832e:	f6 81 81 20 41 00 04 	testb  $0x4,0x412081(%ecx)
  408335:	74 03                	je     0x40833a
  408337:	40                   	inc    %eax
  408338:	ff 06                	incl   (%esi)
  40833a:	ff 06                	incl   (%esi)
  40833c:	40                   	inc    %eax
  40833d:	e9 68 ff ff ff       	jmp    0x4082aa
  408342:	85 ff                	test   %edi,%edi
  408344:	74 04                	je     0x40834a
  408346:	c6 07 00             	movb   $0x0,(%edi)
  408349:	47                   	inc    %edi
  40834a:	ff 06                	incl   (%esi)
  40834c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  40834f:	e9 21 ff ff ff       	jmp    0x408275
  408354:	8b 45 08             	mov    0x8(%ebp),%eax
  408357:	85 c0                	test   %eax,%eax
  408359:	74 03                	je     0x40835e
  40835b:	83 20 00             	andl   $0x0,(%eax)
  40835e:	ff 03                	incl   (%ebx)
  408360:	5f                   	pop    %edi
  408361:	5b                   	pop    %ebx
  408362:	c9                   	leave
  408363:	c3                   	ret
  408364:	55                   	push   %ebp
  408365:	8b ec                	mov    %esp,%ebp
  408367:	51                   	push   %ecx
  408368:	51                   	push   %ecx
  408369:	53                   	push   %ebx
  40836a:	56                   	push   %esi
  40836b:	57                   	push   %edi
  40836c:	33 ff                	xor    %edi,%edi
  40836e:	39 3d 0c 34 41 00    	cmp    %edi,0x41340c
  408374:	75 05                	jne    0x40837b
  408376:	e8 55 21 00 00       	call   0x40a4d0
  40837b:	68 04 01 00 00       	push   $0x104
  408380:	be 98 1e 41 00       	mov    $0x411e98,%esi
  408385:	56                   	push   %esi
  408386:	57                   	push   %edi
  408387:	c6 05 9c 1f 41 00 00 	movb   $0x0,0x411f9c
  40838e:	ff 15 24 d1 40 00    	call   *0x40d124  ; 0x40d124=KERNEL32.dll!GetModuleFileNameA
  408394:	a1 14 34 41 00       	mov    0x413414,%eax
  408399:	3b c7                	cmp    %edi,%eax
  40839b:	89 35 8c 1d 41 00    	mov    %esi,0x411d8c
  4083a1:	74 07                	je     0x4083aa
  4083a3:	80 38 00             	cmpb   $0x0,(%eax)
  4083a6:	8b d8                	mov    %eax,%ebx
  4083a8:	75 02                	jne    0x4083ac
  4083aa:	8b de                	mov    %esi,%ebx
  4083ac:	8d 45 fc             	lea    -0x4(%ebp),%eax
  4083af:	50                   	push   %eax
  4083b0:	57                   	push   %edi
  4083b1:	8d 75 f8             	lea    -0x8(%ebp),%esi
  4083b4:	33 c9                	xor    %ecx,%ecx
  4083b6:	8b c3                	mov    %ebx,%eax
  4083b8:	e8 3b fe ff ff       	call   0x4081f8
  4083bd:	8b 75 fc             	mov    -0x4(%ebp),%esi
  4083c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
  4083c3:	c1 e6 02             	shl    $0x2,%esi
  4083c6:	03 c6                	add    %esi,%eax
  4083c8:	50                   	push   %eax
  4083c9:	e8 97 e8 ff ff       	call   0x406c65
  4083ce:	8b f8                	mov    %eax,%edi
  4083d0:	83 c4 0c             	add    $0xc,%esp
  4083d3:	85 ff                	test   %edi,%edi
  4083d5:	75 05                	jne    0x4083dc
  4083d7:	83 c8 ff             	or     $0xffffffff,%eax
  4083da:	eb 25                	jmp    0x408401
  4083dc:	8d 45 fc             	lea    -0x4(%ebp),%eax
  4083df:	50                   	push   %eax
  4083e0:	8d 0c 3e             	lea    (%esi,%edi,1),%ecx
  4083e3:	57                   	push   %edi
  4083e4:	8d 75 f8             	lea    -0x8(%ebp),%esi
  4083e7:	8b c3                	mov    %ebx,%eax
  4083e9:	e8 0a fe ff ff       	call   0x4081f8
  4083ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
  4083f1:	48                   	dec    %eax
  4083f2:	59                   	pop    %ecx
  4083f3:	a3 70 1d 41 00       	mov    %eax,0x411d70
  4083f8:	59                   	pop    %ecx
  4083f9:	89 3d 74 1d 41 00    	mov    %edi,0x411d74
  4083ff:	33 c0                	xor    %eax,%eax
  408401:	5f                   	pop    %edi
  408402:	5e                   	pop    %esi
  408403:	5b                   	pop    %ebx
  408404:	c9                   	leave
  408405:	c3                   	ret
  408406:	51                   	push   %ecx
  408407:	51                   	push   %ecx
  408408:	a1 a0 1f 41 00       	mov    0x411fa0,%eax
  40840d:	53                   	push   %ebx
  40840e:	55                   	push   %ebp
  40840f:	56                   	push   %esi
  408410:	57                   	push   %edi
  408411:	8b 3d 1c d1 40 00    	mov    0x40d11c,%edi  ; 0x40d11c=KERNEL32.dll!GetEnvironmentStringsW
  408417:	33 db                	xor    %ebx,%ebx
  408419:	33 f6                	xor    %esi,%esi
  40841b:	3b c3                	cmp    %ebx,%eax
  40841d:	6a 02                	push   $0x2
  40841f:	5d                   	pop    %ebp
  408420:	75 2d                	jne    0x40844f
  408422:	ff d7                	call   *%edi
  408424:	8b f0                	mov    %eax,%esi
  408426:	3b f3                	cmp    %ebx,%esi
  408428:	74 0c                	je     0x408436
  40842a:	c7 05 a0 1f 41 00 01 	movl   $0x1,0x411fa0
  408431:	00 00 00 
  408434:	eb 1e                	jmp    0x408454
  408436:	ff 15 0c d1 40 00    	call   *0x40d10c  ; 0x40d10c=KERNEL32.dll!GetLastError
  40843c:	83 f8 78             	cmp    $0x78,%eax
  40843f:	75 09                	jne    0x40844a
  408441:	8b c5                	mov    %ebp,%eax
  408443:	a3 a0 1f 41 00       	mov    %eax,0x411fa0
  408448:	eb 05                	jmp    0x40844f
  40844a:	a1 a0 1f 41 00       	mov    0x411fa0,%eax
  40844f:	83 f8 01             	cmp    $0x1,%eax
  408452:	75 7d                	jne    0x4084d1
  408454:	3b f3                	cmp    %ebx,%esi
  408456:	75 08                	jne    0x408460
  408458:	ff d7                	call   *%edi
  40845a:	8b f0                	mov    %eax,%esi
  40845c:	3b f3                	cmp    %ebx,%esi
  40845e:	74 79                	je     0x4084d9
  408460:	66 39 1e             	cmp    %bx,(%esi)
  408463:	8b c6                	mov    %esi,%eax
  408465:	74 0e                	je     0x408475
  408467:	03 c5                	add    %ebp,%eax
  408469:	66 39 18             	cmp    %bx,(%eax)
  40846c:	75 f9                	jne    0x408467
  40846e:	03 c5                	add    %ebp,%eax
  408470:	66 39 18             	cmp    %bx,(%eax)
  408473:	75 f2                	jne    0x408467
  408475:	8b 3d 84 d0 40 00    	mov    0x40d084,%edi  ; 0x40d084=KERNEL32.dll!WideCharToMultiByte
  40847b:	53                   	push   %ebx
  40847c:	53                   	push   %ebx
  40847d:	53                   	push   %ebx
  40847e:	2b c6                	sub    %esi,%eax
  408480:	53                   	push   %ebx
  408481:	d1 f8                	sar    $1,%eax
  408483:	40                   	inc    %eax
  408484:	50                   	push   %eax
  408485:	56                   	push   %esi
  408486:	53                   	push   %ebx
  408487:	53                   	push   %ebx
  408488:	89 44 24 34          	mov    %eax,0x34(%esp)
  40848c:	ff d7                	call   *%edi
  40848e:	8b e8                	mov    %eax,%ebp
  408490:	3b eb                	cmp    %ebx,%ebp
  408492:	74 32                	je     0x4084c6
  408494:	55                   	push   %ebp
  408495:	e8 cb e7 ff ff       	call   0x406c65
  40849a:	3b c3                	cmp    %ebx,%eax
  40849c:	59                   	pop    %ecx
  40849d:	89 44 24 10          	mov    %eax,0x10(%esp)
  4084a1:	74 23                	je     0x4084c6
  4084a3:	53                   	push   %ebx
  4084a4:	53                   	push   %ebx
  4084a5:	55                   	push   %ebp
  4084a6:	50                   	push   %eax
  4084a7:	ff 74 24 24          	push   0x24(%esp)
  4084ab:	56                   	push   %esi
  4084ac:	53                   	push   %ebx
  4084ad:	53                   	push   %ebx
  4084ae:	ff d7                	call   *%edi
  4084b0:	85 c0                	test   %eax,%eax
  4084b2:	75 0e                	jne    0x4084c2
  4084b4:	ff 74 24 10          	push   0x10(%esp)
  4084b8:	e8 ba e7 ff ff       	call   0x406c77
  4084bd:	59                   	pop    %ecx
  4084be:	89 5c 24 10          	mov    %ebx,0x10(%esp)
  4084c2:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  4084c6:	56                   	push   %esi
  4084c7:	ff 15 28 d1 40 00    	call   *0x40d128  ; 0x40d128=KERNEL32.dll!FreeEnvironmentStringsW
  4084cd:	8b c3                	mov    %ebx,%eax
  4084cf:	eb 50                	jmp    0x408521
  4084d1:	3b c5                	cmp    %ebp,%eax
  4084d3:	74 08                	je     0x4084dd
  4084d5:	3b c3                	cmp    %ebx,%eax
  4084d7:	74 04                	je     0x4084dd
  4084d9:	33 c0                	xor    %eax,%eax
  4084db:	eb 44                	jmp    0x408521
  4084dd:	ff 15 2c d1 40 00    	call   *0x40d12c  ; 0x40d12c=KERNEL32.dll!GetEnvironmentStrings
  4084e3:	8b f0                	mov    %eax,%esi
  4084e5:	3b f3                	cmp    %ebx,%esi
  4084e7:	74 f0                	je     0x4084d9
  4084e9:	38 1e                	cmp    %bl,(%esi)
  4084eb:	74 0a                	je     0x4084f7
  4084ed:	40                   	inc    %eax
  4084ee:	38 18                	cmp    %bl,(%eax)
  4084f0:	75 fb                	jne    0x4084ed
  4084f2:	40                   	inc    %eax
  4084f3:	38 18                	cmp    %bl,(%eax)
  4084f5:	75 f6                	jne    0x4084ed
  4084f7:	2b c6                	sub    %esi,%eax
  4084f9:	40                   	inc    %eax
  4084fa:	8b e8                	mov    %eax,%ebp
  4084fc:	55                   	push   %ebp
  4084fd:	e8 63 e7 ff ff       	call   0x406c65
  408502:	8b f8                	mov    %eax,%edi
  408504:	3b fb                	cmp    %ebx,%edi
  408506:	59                   	pop    %ecx
  408507:	75 04                	jne    0x40850d
  408509:	33 ff                	xor    %edi,%edi
  40850b:	eb 0b                	jmp    0x408518
  40850d:	55                   	push   %ebp
  40850e:	56                   	push   %esi
  40850f:	57                   	push   %edi
  408510:	e8 fb 0d 00 00       	call   0x409310
  408515:	83 c4 0c             	add    $0xc,%esp
  408518:	56                   	push   %esi
  408519:	ff 15 6c d1 40 00    	call   *0x40d16c  ; 0x40d16c=KERNEL32.dll!FreeEnvironmentStringsA
  40851f:	8b c7                	mov    %edi,%eax
  408521:	5f                   	pop    %edi
  408522:	5e                   	pop    %esi
  408523:	5d                   	pop    %ebp
  408524:	5b                   	pop    %ebx
  408525:	59                   	pop    %ecx
  408526:	59                   	pop    %ecx
  408527:	c3                   	ret
  408528:	83 ec 44             	sub    $0x44,%esp
  40852b:	68 00 01 00 00       	push   $0x100
  408530:	e8 30 e7 ff ff       	call   0x406c65
  408535:	85 c0                	test   %eax,%eax
  408537:	59                   	pop    %ecx
  408538:	75 08                	jne    0x408542
  40853a:	83 c8 ff             	or     $0xffffffff,%eax
  40853d:	e9 8d 01 00 00       	jmp    0x4086cf
  408542:	a3 00 33 41 00       	mov    %eax,0x413300
  408547:	c7 05 e8 32 41 00 20 	movl   $0x20,0x4132e8
  40854e:	00 00 00 
  408551:	8d 88 00 01 00 00    	lea    0x100(%eax),%ecx
  408557:	eb 1a                	jmp    0x408573
  408559:	83 08 ff             	orl    $0xffffffff,(%eax)
  40855c:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  408560:	c6 40 05 0a          	movb   $0xa,0x5(%eax)
  408564:	8b 0d 00 33 41 00    	mov    0x413300,%ecx
  40856a:	83 c0 08             	add    $0x8,%eax
  40856d:	81 c1 00 01 00 00    	add    $0x100,%ecx
  408573:	3b c1                	cmp    %ecx,%eax
  408575:	72 e2                	jb     0x408559
  408577:	53                   	push   %ebx
  408578:	56                   	push   %esi
  408579:	57                   	push   %edi
  40857a:	8d 44 24 0c          	lea    0xc(%esp),%eax
  40857e:	50                   	push   %eax
  40857f:	ff 15 38 d1 40 00    	call   *0x40d138  ; 0x40d138=KERNEL32.dll!GetStartupInfoA
  408585:	66 83 7c 24 3e 00    	cmpw   $0x0,0x3e(%esp)
  40858b:	0f 84 c7 00 00 00    	je     0x408658
  408591:	8b 44 24 40          	mov    0x40(%esp),%eax
  408595:	85 c0                	test   %eax,%eax
  408597:	0f 84 bb 00 00 00    	je     0x408658
  40859d:	8b 30                	mov    (%eax),%esi
  40859f:	55                   	push   %ebp
  4085a0:	8d 68 04             	lea    0x4(%eax),%ebp
  4085a3:	b8 00 08 00 00       	mov    $0x800,%eax
  4085a8:	3b f0                	cmp    %eax,%esi
  4085aa:	8d 1c 2e             	lea    (%esi,%ebp,1),%ebx
  4085ad:	7c 02                	jl     0x4085b1
  4085af:	8b f0                	mov    %eax,%esi
  4085b1:	39 35 e8 32 41 00    	cmp    %esi,0x4132e8
  4085b7:	7d 52                	jge    0x40860b
  4085b9:	bf 04 33 41 00       	mov    $0x413304,%edi
  4085be:	68 00 01 00 00       	push   $0x100
  4085c3:	e8 9d e6 ff ff       	call   0x406c65
  4085c8:	85 c0                	test   %eax,%eax
  4085ca:	59                   	pop    %ecx
  4085cb:	74 38                	je     0x408605
  4085cd:	83 05 e8 32 41 00 20 	addl   $0x20,0x4132e8
  4085d4:	89 07                	mov    %eax,(%edi)
  4085d6:	8d 88 00 01 00 00    	lea    0x100(%eax),%ecx
  4085dc:	eb 16                	jmp    0x4085f4
  4085de:	83 08 ff             	orl    $0xffffffff,(%eax)
  4085e1:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  4085e5:	c6 40 05 0a          	movb   $0xa,0x5(%eax)
  4085e9:	8b 0f                	mov    (%edi),%ecx
  4085eb:	83 c0 08             	add    $0x8,%eax
  4085ee:	81 c1 00 01 00 00    	add    $0x100,%ecx
  4085f4:	3b c1                	cmp    %ecx,%eax
  4085f6:	72 e6                	jb     0x4085de
  4085f8:	83 c7 04             	add    $0x4,%edi
  4085fb:	39 35 e8 32 41 00    	cmp    %esi,0x4132e8
  408601:	7c bb                	jl     0x4085be
  408603:	eb 06                	jmp    0x40860b
  408605:	8b 35 e8 32 41 00    	mov    0x4132e8,%esi
  40860b:	33 ff                	xor    %edi,%edi
  40860d:	85 f6                	test   %esi,%esi
  40860f:	7e 46                	jle    0x408657
  408611:	8b 03                	mov    (%ebx),%eax
  408613:	83 f8 ff             	cmp    $0xffffffff,%eax
  408616:	74 36                	je     0x40864e
  408618:	8a 4d 00             	mov    0x0(%ebp),%cl
  40861b:	f6 c1 01             	test   $0x1,%cl
  40861e:	74 2e                	je     0x40864e
  408620:	f6 c1 08             	test   $0x8,%cl
  408623:	75 0b                	jne    0x408630
  408625:	50                   	push   %eax
  408626:	ff 15 00 d1 40 00    	call   *0x40d100  ; 0x40d100=KERNEL32.dll!GetFileType
  40862c:	85 c0                	test   %eax,%eax
  40862e:	74 1e                	je     0x40864e
  408630:	8b c7                	mov    %edi,%eax
  408632:	c1 f8 05             	sar    $0x5,%eax
  408635:	8b 04 85 00 33 41 00 	mov    0x413300(,%eax,4),%eax
  40863c:	8b cf                	mov    %edi,%ecx
  40863e:	83 e1 1f             	and    $0x1f,%ecx
  408641:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
  408644:	8b 0b                	mov    (%ebx),%ecx
  408646:	89 08                	mov    %ecx,(%eax)
  408648:	8a 4d 00             	mov    0x0(%ebp),%cl
  40864b:	88 48 04             	mov    %cl,0x4(%eax)
  40864e:	47                   	inc    %edi
  40864f:	45                   	inc    %ebp
  408650:	83 c3 04             	add    $0x4,%ebx
  408653:	3b fe                	cmp    %esi,%edi
  408655:	7c ba                	jl     0x408611
  408657:	5d                   	pop    %ebp
  408658:	33 db                	xor    %ebx,%ebx
  40865a:	a1 00 33 41 00       	mov    0x413300,%eax
  40865f:	8d 34 d8             	lea    (%eax,%ebx,8),%esi
  408662:	83 3e ff             	cmpl   $0xffffffff,(%esi)
  408665:	75 4d                	jne    0x4086b4
  408667:	85 db                	test   %ebx,%ebx
  408669:	c6 46 04 81          	movb   $0x81,0x4(%esi)
  40866d:	75 05                	jne    0x408674
  40866f:	6a f6                	push   $0xfffffff6
  408671:	58                   	pop    %eax
  408672:	eb 0a                	jmp    0x40867e
  408674:	8b c3                	mov    %ebx,%eax
  408676:	48                   	dec    %eax
  408677:	f7 d8                	neg    %eax
  408679:	1b c0                	sbb    %eax,%eax
  40867b:	83 c0 f5             	add    $0xfffffff5,%eax
  40867e:	50                   	push   %eax
  40867f:	ff 15 64 d1 40 00    	call   *0x40d164  ; 0x40d164=KERNEL32.dll!GetStdHandle
  408685:	8b f8                	mov    %eax,%edi
  408687:	83 ff ff             	cmp    $0xffffffff,%edi
  40868a:	74 17                	je     0x4086a3
  40868c:	57                   	push   %edi
  40868d:	ff 15 00 d1 40 00    	call   *0x40d100  ; 0x40d100=KERNEL32.dll!GetFileType
  408693:	85 c0                	test   %eax,%eax
  408695:	74 0c                	je     0x4086a3
  408697:	25 ff 00 00 00       	and    $0xff,%eax
  40869c:	83 f8 02             	cmp    $0x2,%eax
  40869f:	89 3e                	mov    %edi,(%esi)
  4086a1:	75 06                	jne    0x4086a9
  4086a3:	80 4e 04 40          	orb    $0x40,0x4(%esi)
  4086a7:	eb 0f                	jmp    0x4086b8
  4086a9:	83 f8 03             	cmp    $0x3,%eax
  4086ac:	75 0a                	jne    0x4086b8
  4086ae:	80 4e 04 08          	orb    $0x8,0x4(%esi)
  4086b2:	eb 04                	jmp    0x4086b8
  4086b4:	80 4e 04 80          	orb    $0x80,0x4(%esi)
  4086b8:	43                   	inc    %ebx
  4086b9:	83 fb 03             	cmp    $0x3,%ebx
  4086bc:	7c 9c                	jl     0x40865a
  4086be:	ff 35 e8 32 41 00    	push   0x4132e8
  4086c4:	ff 15 18 d1 40 00    	call   *0x40d118  ; 0x40d118=KERNEL32.dll!SetHandleCount
  4086ca:	5f                   	pop    %edi
  4086cb:	5e                   	pop    %esi
  4086cc:	33 c0                	xor    %eax,%eax
  4086ce:	5b                   	pop    %ebx
  4086cf:	83 c4 44             	add    $0x44,%esp
  4086d2:	c3                   	ret
  4086d3:	6a 0c                	push   $0xc
  4086d5:	68 70 db 40 00       	push   $0x40db70
  4086da:	e8 dd ee ff ff       	call   0x4075bc
  4086df:	c7 45 e4 b4 e3 40 00 	movl   $0x40e3b4,-0x1c(%ebp)
  4086e6:	81 7d e4 b4 e3 40 00 	cmpl   $0x40e3b4,-0x1c(%ebp)
  4086ed:	73 22                	jae    0x408711
  4086ef:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  4086f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  4086f6:	8b 00                	mov    (%eax),%eax
  4086f8:	85 c0                	test   %eax,%eax
  4086fa:	74 0b                	je     0x408707
  4086fc:	ff d0                	call   *%eax
  4086fe:	eb 07                	jmp    0x408707
  408700:	33 c0                	xor    %eax,%eax
  408702:	40                   	inc    %eax
  408703:	c3                   	ret
  408704:	8b 65 e8             	mov    -0x18(%ebp),%esp
  408707:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40870b:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
  40870f:	eb d5                	jmp    0x4086e6
  408711:	e8 e1 ee ff ff       	call   0x4075f7
  408716:	c3                   	ret
  408717:	6a 0c                	push   $0xc
  408719:	68 80 db 40 00       	push   $0x40db80
  40871e:	e8 99 ee ff ff       	call   0x4075bc
  408723:	c7 45 e4 bc e3 40 00 	movl   $0x40e3bc,-0x1c(%ebp)
  40872a:	81 7d e4 bc e3 40 00 	cmpl   $0x40e3bc,-0x1c(%ebp)
  408731:	73 22                	jae    0x408755
  408733:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  408737:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  40873a:	8b 00                	mov    (%eax),%eax
  40873c:	85 c0                	test   %eax,%eax
  40873e:	74 0b                	je     0x40874b
  408740:	ff d0                	call   *%eax
  408742:	eb 07                	jmp    0x40874b
  408744:	33 c0                	xor    %eax,%eax
  408746:	40                   	inc    %eax
  408747:	c3                   	ret
  408748:	8b 65 e8             	mov    -0x18(%ebp),%esp
  40874b:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40874f:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
  408753:	eb d5                	jmp    0x40872a
  408755:	e8 9d ee ff ff       	call   0x4075f7
  40875a:	c3                   	ret
  40875b:	83 3d 5c 1d 41 00 02 	cmpl   $0x2,0x411d5c
  408762:	75 0d                	jne    0x408771
  408764:	83 3d 68 1d 41 00 05 	cmpl   $0x5,0x411d68
  40876b:	72 04                	jb     0x408771
  40876d:	33 c0                	xor    %eax,%eax
  40876f:	40                   	inc    %eax
  408770:	c3                   	ret
  408771:	6a 03                	push   $0x3
  408773:	58                   	pop    %eax
  408774:	c3                   	ret
  408775:	33 c0                	xor    %eax,%eax
  408777:	39 44 24 04          	cmp    %eax,0x4(%esp)
  40877b:	6a 00                	push   $0x0
  40877d:	0f 94 c0             	sete   %al
  408780:	68 00 10 00 00       	push   $0x1000
  408785:	50                   	push   %eax
  408786:	ff 15 f4 d0 40 00    	call   *0x40d0f4  ; 0x40d0f4=KERNEL32.dll!HeapCreate
  40878c:	85 c0                	test   %eax,%eax
  40878e:	a3 e0 32 41 00       	mov    %eax,0x4132e0
  408793:	74 2a                	je     0x4087bf
  408795:	e8 c1 ff ff ff       	call   0x40875b
  40879a:	83 f8 03             	cmp    $0x3,%eax
  40879d:	a3 e4 32 41 00       	mov    %eax,0x4132e4
  4087a2:	75 1e                	jne    0x4087c2
  4087a4:	68 f8 03 00 00       	push   $0x3f8
  4087a9:	e8 33 00 00 00       	call   0x4087e1
  4087ae:	85 c0                	test   %eax,%eax
  4087b0:	59                   	pop    %ecx
  4087b1:	75 0f                	jne    0x4087c2
  4087b3:	ff 35 e0 32 41 00    	push   0x4132e0
  4087b9:	ff 15 f8 d0 40 00    	call   *0x40d0f8  ; 0x40d0f8=KERNEL32.dll!HeapDestroy
  4087bf:	33 c0                	xor    %eax,%eax
  4087c1:	c3                   	ret
  4087c2:	33 c0                	xor    %eax,%eax
  4087c4:	40                   	inc    %eax
  4087c5:	c3                   	ret
  4087c6:	a1 a4 1f 41 00       	mov    0x411fa4,%eax
  4087cb:	85 c0                	test   %eax,%eax
  4087cd:	74 0f                	je     0x4087de
  4087cf:	ff 74 24 04          	push   0x4(%esp)
  4087d3:	ff d0                	call   *%eax
  4087d5:	85 c0                	test   %eax,%eax
  4087d7:	59                   	pop    %ecx
  4087d8:	74 04                	je     0x4087de
  4087da:	33 c0                	xor    %eax,%eax
  4087dc:	40                   	inc    %eax
  4087dd:	c3                   	ret
  4087de:	33 c0                	xor    %eax,%eax
  4087e0:	c3                   	ret
  4087e1:	68 40 01 00 00       	push   $0x140
  4087e6:	6a 00                	push   $0x0
  4087e8:	ff 35 e0 32 41 00    	push   0x4132e0
  4087ee:	ff 15 48 d1 40 00    	call   *0x40d148  ; 0x40d148=KERNEL32.dll!HeapAlloc
  4087f4:	85 c0                	test   %eax,%eax
  4087f6:	a3 cc 32 41 00       	mov    %eax,0x4132cc
  4087fb:	75 01                	jne    0x4087fe
  4087fd:	c3                   	ret
  4087fe:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  408802:	83 25 c4 32 41 00 00 	andl   $0x0,0x4132c4
  408809:	83 25 c8 32 41 00 00 	andl   $0x0,0x4132c8
  408810:	a3 d4 32 41 00       	mov    %eax,0x4132d4
  408815:	33 c0                	xor    %eax,%eax
  408817:	89 0d d0 32 41 00    	mov    %ecx,0x4132d0
  40881d:	c7 05 d8 32 41 00 10 	movl   $0x10,0x4132d8
  408824:	00 00 00 
  408827:	40                   	inc    %eax
  408828:	c3                   	ret
  408829:	a1 c8 32 41 00       	mov    0x4132c8,%eax
  40882e:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  408831:	a1 cc 32 41 00       	mov    0x4132cc,%eax
  408836:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
  408839:	eb 12                	jmp    0x40884d
  40883b:	8b 54 24 04          	mov    0x4(%esp),%edx
  40883f:	2b 50 0c             	sub    0xc(%eax),%edx
  408842:	81 fa 00 00 10 00    	cmp    $0x100000,%edx
  408848:	72 09                	jb     0x408853
  40884a:	83 c0 14             	add    $0x14,%eax
  40884d:	3b c1                	cmp    %ecx,%eax
  40884f:	72 ea                	jb     0x40883b
  408851:	33 c0                	xor    %eax,%eax
  408853:	c3                   	ret
  408854:	55                   	push   %ebp
  408855:	8b ec                	mov    %esp,%ebp
  408857:	83 ec 10             	sub    $0x10,%esp
  40885a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  40885d:	8b 41 10             	mov    0x10(%ecx),%eax
  408860:	56                   	push   %esi
  408861:	8b 75 0c             	mov    0xc(%ebp),%esi
  408864:	57                   	push   %edi
  408865:	8b fe                	mov    %esi,%edi
  408867:	2b 79 0c             	sub    0xc(%ecx),%edi
  40886a:	83 c6 fc             	add    $0xfffffffc,%esi
  40886d:	c1 ef 0f             	shr    $0xf,%edi
  408870:	8b cf                	mov    %edi,%ecx
  408872:	69 c9 04 02 00 00    	imul   $0x204,%ecx,%ecx
  408878:	8d 8c 01 44 01 00 00 	lea    0x144(%ecx,%eax,1),%ecx
  40887f:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  408882:	8b 0e                	mov    (%esi),%ecx
  408884:	49                   	dec    %ecx
  408885:	f6 c1 01             	test   $0x1,%cl
  408888:	89 4d fc             	mov    %ecx,-0x4(%ebp)
  40888b:	0f 85 d7 02 00 00    	jne    0x408b68
  408891:	53                   	push   %ebx
  408892:	8d 1c 31             	lea    (%ecx,%esi,1),%ebx
  408895:	8b 13                	mov    (%ebx),%edx
  408897:	89 55 f4             	mov    %edx,-0xc(%ebp)
  40889a:	8b 56 fc             	mov    -0x4(%esi),%edx
  40889d:	89 55 f8             	mov    %edx,-0x8(%ebp)
  4088a0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  4088a3:	f6 c2 01             	test   $0x1,%dl
  4088a6:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  4088a9:	75 74                	jne    0x40891f
  4088ab:	c1 fa 04             	sar    $0x4,%edx
  4088ae:	4a                   	dec    %edx
  4088af:	83 fa 3f             	cmp    $0x3f,%edx
  4088b2:	76 03                	jbe    0x4088b7
  4088b4:	6a 3f                	push   $0x3f
  4088b6:	5a                   	pop    %edx
  4088b7:	8b 4b 04             	mov    0x4(%ebx),%ecx
  4088ba:	3b 4b 08             	cmp    0x8(%ebx),%ecx
  4088bd:	75 42                	jne    0x408901
  4088bf:	83 fa 20             	cmp    $0x20,%edx
  4088c2:	bb 00 00 00 80       	mov    $0x80000000,%ebx
  4088c7:	73 19                	jae    0x4088e2
  4088c9:	8b ca                	mov    %edx,%ecx
  4088cb:	d3 eb                	shr    %cl,%ebx
  4088cd:	8d 4c 02 04          	lea    0x4(%edx,%eax,1),%ecx
  4088d1:	f7 d3                	not    %ebx
  4088d3:	21 5c b8 44          	and    %ebx,0x44(%eax,%edi,4)
  4088d7:	fe 09                	decb   (%ecx)
  4088d9:	75 23                	jne    0x4088fe
  4088db:	8b 4d 08             	mov    0x8(%ebp),%ecx
  4088de:	21 19                	and    %ebx,(%ecx)
  4088e0:	eb 1c                	jmp    0x4088fe
  4088e2:	8d 4a e0             	lea    -0x20(%edx),%ecx
  4088e5:	d3 eb                	shr    %cl,%ebx
  4088e7:	8d 4c 02 04          	lea    0x4(%edx,%eax,1),%ecx
  4088eb:	f7 d3                	not    %ebx
  4088ed:	21 9c b8 c4 00 00 00 	and    %ebx,0xc4(%eax,%edi,4)
  4088f4:	fe 09                	decb   (%ecx)
  4088f6:	75 06                	jne    0x4088fe
  4088f8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  4088fb:	21 59 04             	and    %ebx,0x4(%ecx)
  4088fe:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  408901:	8b 53 08             	mov    0x8(%ebx),%edx
  408904:	8b 5b 04             	mov    0x4(%ebx),%ebx
  408907:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  40890a:	03 4d f4             	add    -0xc(%ebp),%ecx
  40890d:	89 5a 04             	mov    %ebx,0x4(%edx)
  408910:	8b 55 0c             	mov    0xc(%ebp),%edx
  408913:	8b 5a 04             	mov    0x4(%edx),%ebx
  408916:	8b 52 08             	mov    0x8(%edx),%edx
  408919:	89 53 08             	mov    %edx,0x8(%ebx)
  40891c:	89 4d fc             	mov    %ecx,-0x4(%ebp)
  40891f:	8b d1                	mov    %ecx,%edx
  408921:	c1 fa 04             	sar    $0x4,%edx
  408924:	4a                   	dec    %edx
  408925:	83 fa 3f             	cmp    $0x3f,%edx
  408928:	76 03                	jbe    0x40892d
  40892a:	6a 3f                	push   $0x3f
  40892c:	5a                   	pop    %edx
  40892d:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  408930:	83 e3 01             	and    $0x1,%ebx
  408933:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  408936:	0f 85 8f 00 00 00    	jne    0x4089cb
  40893c:	2b 75 f8             	sub    -0x8(%ebp),%esi
  40893f:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  408942:	c1 fb 04             	sar    $0x4,%ebx
  408945:	6a 3f                	push   $0x3f
  408947:	89 75 0c             	mov    %esi,0xc(%ebp)
  40894a:	4b                   	dec    %ebx
  40894b:	5e                   	pop    %esi
  40894c:	3b de                	cmp    %esi,%ebx
  40894e:	76 02                	jbe    0x408952
  408950:	8b de                	mov    %esi,%ebx
  408952:	03 4d f8             	add    -0x8(%ebp),%ecx
  408955:	8b d1                	mov    %ecx,%edx
  408957:	c1 fa 04             	sar    $0x4,%edx
  40895a:	4a                   	dec    %edx
  40895b:	3b d6                	cmp    %esi,%edx
  40895d:	89 4d fc             	mov    %ecx,-0x4(%ebp)
  408960:	76 02                	jbe    0x408964
  408962:	8b d6                	mov    %esi,%edx
  408964:	3b da                	cmp    %edx,%ebx
  408966:	74 5e                	je     0x4089c6
  408968:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  40896b:	8b 71 04             	mov    0x4(%ecx),%esi
  40896e:	3b 71 08             	cmp    0x8(%ecx),%esi
  408971:	75 3b                	jne    0x4089ae
  408973:	83 fb 20             	cmp    $0x20,%ebx
  408976:	be 00 00 00 80       	mov    $0x80000000,%esi
  40897b:	73 17                	jae    0x408994
  40897d:	8b cb                	mov    %ebx,%ecx
  40897f:	d3 ee                	shr    %cl,%esi
  408981:	f7 d6                	not    %esi
  408983:	21 74 b8 44          	and    %esi,0x44(%eax,%edi,4)
  408987:	fe 4c 03 04          	decb   0x4(%ebx,%eax,1)
  40898b:	75 21                	jne    0x4089ae
  40898d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  408990:	21 31                	and    %esi,(%ecx)
  408992:	eb 1a                	jmp    0x4089ae
  408994:	8d 4b e0             	lea    -0x20(%ebx),%ecx
  408997:	d3 ee                	shr    %cl,%esi
  408999:	f7 d6                	not    %esi
  40899b:	21 b4 b8 c4 00 00 00 	and    %esi,0xc4(%eax,%edi,4)
  4089a2:	fe 4c 03 04          	decb   0x4(%ebx,%eax,1)
  4089a6:	75 06                	jne    0x4089ae
  4089a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  4089ab:	21 71 04             	and    %esi,0x4(%ecx)
  4089ae:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  4089b1:	8b 71 08             	mov    0x8(%ecx),%esi
  4089b4:	8b 49 04             	mov    0x4(%ecx),%ecx
  4089b7:	89 4e 04             	mov    %ecx,0x4(%esi)
  4089ba:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  4089bd:	8b 71 04             	mov    0x4(%ecx),%esi
  4089c0:	8b 49 08             	mov    0x8(%ecx),%ecx
  4089c3:	89 4e 08             	mov    %ecx,0x8(%esi)
  4089c6:	8b 75 0c             	mov    0xc(%ebp),%esi
  4089c9:	eb 03                	jmp    0x4089ce
  4089cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  4089ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  4089d2:	75 08                	jne    0x4089dc
  4089d4:	3b da                	cmp    %edx,%ebx
  4089d6:	0f 84 80 00 00 00    	je     0x408a5c
  4089dc:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  4089df:	8d 0c d1             	lea    (%ecx,%edx,8),%ecx
  4089e2:	8b 59 04             	mov    0x4(%ecx),%ebx
  4089e5:	89 4e 08             	mov    %ecx,0x8(%esi)
  4089e8:	89 5e 04             	mov    %ebx,0x4(%esi)
  4089eb:	89 71 04             	mov    %esi,0x4(%ecx)
  4089ee:	8b 4e 04             	mov    0x4(%esi),%ecx
  4089f1:	89 71 08             	mov    %esi,0x8(%ecx)
  4089f4:	8b 4e 04             	mov    0x4(%esi),%ecx
  4089f7:	3b 4e 08             	cmp    0x8(%esi),%ecx
  4089fa:	75 60                	jne    0x408a5c
  4089fc:	8a 4c 02 04          	mov    0x4(%edx,%eax,1),%cl
  408a00:	88 4d 0f             	mov    %cl,0xf(%ebp)
  408a03:	fe c1                	inc    %cl
  408a05:	83 fa 20             	cmp    $0x20,%edx
  408a08:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
  408a0c:	73 25                	jae    0x408a33
  408a0e:	80 7d 0f 00          	cmpb   $0x0,0xf(%ebp)
  408a12:	75 0e                	jne    0x408a22
  408a14:	8b ca                	mov    %edx,%ecx
  408a16:	bb 00 00 00 80       	mov    $0x80000000,%ebx
  408a1b:	d3 eb                	shr    %cl,%ebx
  408a1d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  408a20:	09 19                	or     %ebx,(%ecx)
  408a22:	bb 00 00 00 80       	mov    $0x80000000,%ebx
  408a27:	8b ca                	mov    %edx,%ecx
  408a29:	d3 eb                	shr    %cl,%ebx
  408a2b:	8d 44 b8 44          	lea    0x44(%eax,%edi,4),%eax
  408a2f:	09 18                	or     %ebx,(%eax)
  408a31:	eb 29                	jmp    0x408a5c
  408a33:	80 7d 0f 00          	cmpb   $0x0,0xf(%ebp)
  408a37:	75 10                	jne    0x408a49
  408a39:	8d 4a e0             	lea    -0x20(%edx),%ecx
  408a3c:	bb 00 00 00 80       	mov    $0x80000000,%ebx
  408a41:	d3 eb                	shr    %cl,%ebx
  408a43:	8b 4d 08             	mov    0x8(%ebp),%ecx
  408a46:	09 59 04             	or     %ebx,0x4(%ecx)
  408a49:	8d 4a e0             	lea    -0x20(%edx),%ecx
  408a4c:	ba 00 00 00 80       	mov    $0x80000000,%edx
  408a51:	d3 ea                	shr    %cl,%edx
  408a53:	8d 84 b8 c4 00 00 00 	lea    0xc4(%eax,%edi,4),%eax
  408a5a:	09 10                	or     %edx,(%eax)
  408a5c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  408a5f:	89 06                	mov    %eax,(%esi)
  408a61:	89 44 30 fc          	mov    %eax,-0x4(%eax,%esi,1)
  408a65:	8b 45 f0             	mov    -0x10(%ebp),%eax
  408a68:	ff 08                	decl   (%eax)
  408a6a:	0f 85 f7 00 00 00    	jne    0x408b67
  408a70:	a1 c4 32 41 00       	mov    0x4132c4,%eax
  408a75:	85 c0                	test   %eax,%eax
  408a77:	0f 84 dc 00 00 00    	je     0x408b59
  408a7d:	8b 0d dc 32 41 00    	mov    0x4132dc,%ecx
  408a83:	8b 35 f0 d0 40 00    	mov    0x40d0f0,%esi  ; 0x40d0f0=KERNEL32.dll!VirtualFree
  408a89:	68 00 40 00 00       	push   $0x4000
  408a8e:	c1 e1 0f             	shl    $0xf,%ecx
  408a91:	03 48 0c             	add    0xc(%eax),%ecx
  408a94:	bb 00 80 00 00       	mov    $0x8000,%ebx
  408a99:	53                   	push   %ebx
  408a9a:	51                   	push   %ecx
  408a9b:	ff d6                	call   *%esi
  408a9d:	8b 0d dc 32 41 00    	mov    0x4132dc,%ecx
  408aa3:	a1 c4 32 41 00       	mov    0x4132c4,%eax
  408aa8:	ba 00 00 00 80       	mov    $0x80000000,%edx
  408aad:	d3 ea                	shr    %cl,%edx
  408aaf:	09 50 08             	or     %edx,0x8(%eax)
  408ab2:	a1 c4 32 41 00       	mov    0x4132c4,%eax
  408ab7:	8b 40 10             	mov    0x10(%eax),%eax
  408aba:	8b 0d dc 32 41 00    	mov    0x4132dc,%ecx
  408ac0:	83 a4 88 c4 00 00 00 	andl   $0x0,0xc4(%eax,%ecx,4)
  408ac7:	00 
  408ac8:	a1 c4 32 41 00       	mov    0x4132c4,%eax
  408acd:	8b 40 10             	mov    0x10(%eax),%eax
  408ad0:	fe 48 43             	decb   0x43(%eax)
  408ad3:	a1 c4 32 41 00       	mov    0x4132c4,%eax
  408ad8:	8b 48 10             	mov    0x10(%eax),%ecx
  408adb:	80 79 43 00          	cmpb   $0x0,0x43(%ecx)
  408adf:	75 09                	jne    0x408aea
  408ae1:	83 60 04 fe          	andl   $0xfffffffe,0x4(%eax)
  408ae5:	a1 c4 32 41 00       	mov    0x4132c4,%eax
  408aea:	83 78 08 ff          	cmpl   $0xffffffff,0x8(%eax)
  408aee:	75 69                	jne    0x408b59
  408af0:	53                   	push   %ebx
  408af1:	6a 00                	push   $0x0
  408af3:	ff 70 0c             	push   0xc(%eax)
  408af6:	ff d6                	call   *%esi
  408af8:	a1 c4 32 41 00       	mov    0x4132c4,%eax
  408afd:	ff 70 10             	push   0x10(%eax)
  408b00:	6a 00                	push   $0x0
  408b02:	ff 35 e0 32 41 00    	push   0x4132e0
  408b08:	ff 15 5c d1 40 00    	call   *0x40d15c  ; 0x40d15c=KERNEL32.dll!HeapFree
  408b0e:	a1 c8 32 41 00       	mov    0x4132c8,%eax
  408b13:	8b 15 cc 32 41 00    	mov    0x4132cc,%edx
  408b19:	8d 04 80             	lea    (%eax,%eax,4),%eax
  408b1c:	c1 e0 02             	shl    $0x2,%eax
  408b1f:	8b c8                	mov    %eax,%ecx
  408b21:	a1 c4 32 41 00       	mov    0x4132c4,%eax
  408b26:	2b c8                	sub    %eax,%ecx
  408b28:	8d 4c 11 ec          	lea    -0x14(%ecx,%edx,1),%ecx
  408b2c:	51                   	push   %ecx
  408b2d:	8d 48 14             	lea    0x14(%eax),%ecx
  408b30:	51                   	push   %ecx
  408b31:	50                   	push   %eax
  408b32:	e8 49 d8 ff ff       	call   0x406380
  408b37:	8b 45 08             	mov    0x8(%ebp),%eax
  408b3a:	83 c4 0c             	add    $0xc,%esp
  408b3d:	ff 0d c8 32 41 00    	decl   0x4132c8
  408b43:	3b 05 c4 32 41 00    	cmp    0x4132c4,%eax
  408b49:	76 04                	jbe    0x408b4f
  408b4b:	83 6d 08 14          	subl   $0x14,0x8(%ebp)
  408b4f:	a1 cc 32 41 00       	mov    0x4132cc,%eax
  408b54:	a3 d4 32 41 00       	mov    %eax,0x4132d4
  408b59:	8b 45 08             	mov    0x8(%ebp),%eax
  408b5c:	a3 c4 32 41 00       	mov    %eax,0x4132c4
  408b61:	89 3d dc 32 41 00    	mov    %edi,0x4132dc
  408b67:	5b                   	pop    %ebx
  408b68:	5f                   	pop    %edi
  408b69:	5e                   	pop    %esi
  408b6a:	c9                   	leave
  408b6b:	c3                   	ret
  408b6c:	a1 c8 32 41 00       	mov    0x4132c8,%eax
  408b71:	8b 0d d8 32 41 00    	mov    0x4132d8,%ecx
  408b77:	57                   	push   %edi
  408b78:	33 ff                	xor    %edi,%edi
  408b7a:	3b c1                	cmp    %ecx,%eax
  408b7c:	75 34                	jne    0x408bb2
  408b7e:	8d 44 89 50          	lea    0x50(%ecx,%ecx,4),%eax
  408b82:	c1 e0 02             	shl    $0x2,%eax
  408b85:	50                   	push   %eax
  408b86:	ff 35 cc 32 41 00    	push   0x4132cc
  408b8c:	57                   	push   %edi
  408b8d:	ff 35 e0 32 41 00    	push   0x4132e0
  408b93:	ff 15 44 d1 40 00    	call   *0x40d144  ; 0x40d144=KERNEL32.dll!HeapReAlloc
  408b99:	3b c7                	cmp    %edi,%eax
  408b9b:	75 04                	jne    0x408ba1
  408b9d:	33 c0                	xor    %eax,%eax
  408b9f:	5f                   	pop    %edi
  408ba0:	c3                   	ret
  408ba1:	83 05 d8 32 41 00 10 	addl   $0x10,0x4132d8
  408ba8:	a3 cc 32 41 00       	mov    %eax,0x4132cc
  408bad:	a1 c8 32 41 00       	mov    0x4132c8,%eax
  408bb2:	8b 0d cc 32 41 00    	mov    0x4132cc,%ecx
  408bb8:	56                   	push   %esi
  408bb9:	68 c4 41 00 00       	push   $0x41c4
  408bbe:	6a 08                	push   $0x8
  408bc0:	ff 35 e0 32 41 00    	push   0x4132e0
  408bc6:	8d 04 80             	lea    (%eax,%eax,4),%eax
  408bc9:	8d 34 81             	lea    (%ecx,%eax,4),%esi
  408bcc:	ff 15 48 d1 40 00    	call   *0x40d148  ; 0x40d148=KERNEL32.dll!HeapAlloc
  408bd2:	3b c7                	cmp    %edi,%eax
  408bd4:	89 46 10             	mov    %eax,0x10(%esi)
  408bd7:	75 04                	jne    0x408bdd
  408bd9:	33 c0                	xor    %eax,%eax
  408bdb:	eb 43                	jmp    0x408c20
  408bdd:	6a 04                	push   $0x4
  408bdf:	68 00 20 00 00       	push   $0x2000
  408be4:	68 00 00 10 00       	push   $0x100000
  408be9:	57                   	push   %edi
  408bea:	ff 15 ec d0 40 00    	call   *0x40d0ec  ; 0x40d0ec=KERNEL32.dll!VirtualAlloc
  408bf0:	3b c7                	cmp    %edi,%eax
  408bf2:	89 46 0c             	mov    %eax,0xc(%esi)
  408bf5:	75 12                	jne    0x408c09
  408bf7:	ff 76 10             	push   0x10(%esi)
  408bfa:	57                   	push   %edi
  408bfb:	ff 35 e0 32 41 00    	push   0x4132e0
  408c01:	ff 15 5c d1 40 00    	call   *0x40d15c  ; 0x40d15c=KERNEL32.dll!HeapFree
  408c07:	eb d0                	jmp    0x408bd9
  408c09:	83 4e 08 ff          	orl    $0xffffffff,0x8(%esi)
  408c0d:	89 3e                	mov    %edi,(%esi)
  408c0f:	89 7e 04             	mov    %edi,0x4(%esi)
  408c12:	ff 05 c8 32 41 00    	incl   0x4132c8
  408c18:	8b 46 10             	mov    0x10(%esi),%eax
  408c1b:	83 08 ff             	orl    $0xffffffff,(%eax)
  408c1e:	8b c6                	mov    %esi,%eax
  408c20:	5e                   	pop    %esi
  408c21:	5f                   	pop    %edi
  408c22:	c3                   	ret
  408c23:	55                   	push   %ebp
  408c24:	8b ec                	mov    %esp,%ebp
  408c26:	51                   	push   %ecx
  408c27:	51                   	push   %ecx
  408c28:	8b 4d 08             	mov    0x8(%ebp),%ecx
  408c2b:	8b 41 08             	mov    0x8(%ecx),%eax
  408c2e:	53                   	push   %ebx
  408c2f:	56                   	push   %esi
  408c30:	8b 71 10             	mov    0x10(%ecx),%esi
  408c33:	57                   	push   %edi
  408c34:	33 db                	xor    %ebx,%ebx
  408c36:	eb 03                	jmp    0x408c3b
  408c38:	d1 e0                	shl    $1,%eax
  408c3a:	43                   	inc    %ebx
  408c3b:	85 c0                	test   %eax,%eax
  408c3d:	7d f9                	jge    0x408c38
  408c3f:	8b c3                	mov    %ebx,%eax
  408c41:	69 c0 04 02 00 00    	imul   $0x204,%eax,%eax
  408c47:	8d 84 30 44 01 00 00 	lea    0x144(%eax,%esi,1),%eax
  408c4e:	6a 3f                	push   $0x3f
  408c50:	89 45 f8             	mov    %eax,-0x8(%ebp)
  408c53:	5a                   	pop    %edx
  408c54:	89 40 08             	mov    %eax,0x8(%eax)
  408c57:	89 40 04             	mov    %eax,0x4(%eax)
  408c5a:	83 c0 08             	add    $0x8,%eax
  408c5d:	4a                   	dec    %edx
  408c5e:	75 f4                	jne    0x408c54
  408c60:	6a 04                	push   $0x4
  408c62:	8b fb                	mov    %ebx,%edi
  408c64:	68 00 10 00 00       	push   $0x1000
  408c69:	c1 e7 0f             	shl    $0xf,%edi
  408c6c:	03 79 0c             	add    0xc(%ecx),%edi
  408c6f:	68 00 80 00 00       	push   $0x8000
  408c74:	57                   	push   %edi
  408c75:	ff 15 ec d0 40 00    	call   *0x40d0ec  ; 0x40d0ec=KERNEL32.dll!VirtualAlloc
  408c7b:	85 c0                	test   %eax,%eax
  408c7d:	75 08                	jne    0x408c87
  408c7f:	83 c8 ff             	or     $0xffffffff,%eax
  408c82:	e9 9d 00 00 00       	jmp    0x408d24
  408c87:	8d 97 00 70 00 00    	lea    0x7000(%edi),%edx
  408c8d:	3b fa                	cmp    %edx,%edi
  408c8f:	89 55 fc             	mov    %edx,-0x4(%ebp)
  408c92:	77 43                	ja     0x408cd7
  408c94:	8b ca                	mov    %edx,%ecx
  408c96:	2b cf                	sub    %edi,%ecx
  408c98:	c1 e9 0c             	shr    $0xc,%ecx
  408c9b:	8d 47 10             	lea    0x10(%edi),%eax
  408c9e:	41                   	inc    %ecx
  408c9f:	83 48 f8 ff          	orl    $0xffffffff,-0x8(%eax)
  408ca3:	83 88 ec 0f 00 00 ff 	orl    $0xffffffff,0xfec(%eax)
  408caa:	8d 90 fc 0f 00 00    	lea    0xffc(%eax),%edx
  408cb0:	89 10                	mov    %edx,(%eax)
  408cb2:	8d 90 fc ef ff ff    	lea    -0x1004(%eax),%edx
  408cb8:	c7 40 fc f0 0f 00 00 	movl   $0xff0,-0x4(%eax)
  408cbf:	89 50 04             	mov    %edx,0x4(%eax)
  408cc2:	c7 80 e8 0f 00 00 f0 	movl   $0xff0,0xfe8(%eax)
  408cc9:	0f 00 00 
  408ccc:	05 00 10 00 00       	add    $0x1000,%eax
  408cd1:	49                   	dec    %ecx
  408cd2:	75 cb                	jne    0x408c9f
  408cd4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  408cd7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  408cda:	05 f8 01 00 00       	add    $0x1f8,%eax
  408cdf:	8d 4f 0c             	lea    0xc(%edi),%ecx
  408ce2:	89 48 04             	mov    %ecx,0x4(%eax)
  408ce5:	89 41 08             	mov    %eax,0x8(%ecx)
  408ce8:	8d 4a 0c             	lea    0xc(%edx),%ecx
  408ceb:	89 48 08             	mov    %ecx,0x8(%eax)
  408cee:	89 41 04             	mov    %eax,0x4(%ecx)
  408cf1:	83 64 9e 44 00       	andl   $0x0,0x44(%esi,%ebx,4)
  408cf6:	33 ff                	xor    %edi,%edi
  408cf8:	47                   	inc    %edi
  408cf9:	89 bc 9e c4 00 00 00 	mov    %edi,0xc4(%esi,%ebx,4)
  408d00:	8a 46 43             	mov    0x43(%esi),%al
  408d03:	8a c8                	mov    %al,%cl
  408d05:	fe c1                	inc    %cl
  408d07:	84 c0                	test   %al,%al
  408d09:	8b 45 08             	mov    0x8(%ebp),%eax
  408d0c:	88 4e 43             	mov    %cl,0x43(%esi)
  408d0f:	75 03                	jne    0x408d14
  408d11:	09 78 04             	or     %edi,0x4(%eax)
  408d14:	ba 00 00 00 80       	mov    $0x80000000,%edx
  408d19:	8b cb                	mov    %ebx,%ecx
  408d1b:	d3 ea                	shr    %cl,%edx
  408d1d:	f7 d2                	not    %edx
  408d1f:	21 50 08             	and    %edx,0x8(%eax)
  408d22:	8b c3                	mov    %ebx,%eax
  408d24:	5f                   	pop    %edi
  408d25:	5e                   	pop    %esi
  408d26:	5b                   	pop    %ebx
  408d27:	c9                   	leave
  408d28:	c3                   	ret
  408d29:	55                   	push   %ebp
  408d2a:	8b ec                	mov    %esp,%ebp
  408d2c:	83 ec 0c             	sub    $0xc,%esp
  408d2f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  408d32:	8b 41 10             	mov    0x10(%ecx),%eax
  408d35:	53                   	push   %ebx
  408d36:	56                   	push   %esi
  408d37:	8b 75 10             	mov    0x10(%ebp),%esi
  408d3a:	57                   	push   %edi
  408d3b:	8b 7d 0c             	mov    0xc(%ebp),%edi
  408d3e:	8b d7                	mov    %edi,%edx
  408d40:	2b 51 0c             	sub    0xc(%ecx),%edx
  408d43:	83 c6 17             	add    $0x17,%esi
  408d46:	c1 ea 0f             	shr    $0xf,%edx
  408d49:	8b ca                	mov    %edx,%ecx
  408d4b:	69 c9 04 02 00 00    	imul   $0x204,%ecx,%ecx
  408d51:	8d 8c 01 44 01 00 00 	lea    0x144(%ecx,%eax,1),%ecx
  408d58:	89 4d f4             	mov    %ecx,-0xc(%ebp)
  408d5b:	8b 4f fc             	mov    -0x4(%edi),%ecx
  408d5e:	83 e6 f0             	and    $0xfffffff0,%esi
  408d61:	49                   	dec    %ecx
  408d62:	3b f1                	cmp    %ecx,%esi
  408d64:	8d 7c 39 fc          	lea    -0x4(%ecx,%edi,1),%edi
  408d68:	8b 1f                	mov    (%edi),%ebx
  408d6a:	89 4d 10             	mov    %ecx,0x10(%ebp)
  408d6d:	89 5d fc             	mov    %ebx,-0x4(%ebp)
  408d70:	0f 8e 55 01 00 00    	jle    0x408ecb
  408d76:	f6 c3 01             	test   $0x1,%bl
  408d79:	0f 85 45 01 00 00    	jne    0x408ec4
  408d7f:	03 d9                	add    %ecx,%ebx
  408d81:	3b f3                	cmp    %ebx,%esi
  408d83:	0f 8f 3b 01 00 00    	jg     0x408ec4
  408d89:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  408d8c:	c1 f9 04             	sar    $0x4,%ecx
  408d8f:	49                   	dec    %ecx
  408d90:	83 f9 3f             	cmp    $0x3f,%ecx
  408d93:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  408d96:	76 06                	jbe    0x408d9e
  408d98:	6a 3f                	push   $0x3f
  408d9a:	59                   	pop    %ecx
  408d9b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  408d9e:	8b 5f 04             	mov    0x4(%edi),%ebx
  408da1:	3b 5f 08             	cmp    0x8(%edi),%ebx
  408da4:	75 43                	jne    0x408de9
  408da6:	83 f9 20             	cmp    $0x20,%ecx
  408da9:	bb 00 00 00 80       	mov    $0x80000000,%ebx
  408dae:	73 1a                	jae    0x408dca
  408db0:	d3 eb                	shr    %cl,%ebx
  408db2:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  408db5:	8d 4c 01 04          	lea    0x4(%ecx,%eax,1),%ecx
  408db9:	f7 d3                	not    %ebx
  408dbb:	21 5c 90 44          	and    %ebx,0x44(%eax,%edx,4)
  408dbf:	fe 09                	decb   (%ecx)
  408dc1:	75 26                	jne    0x408de9
  408dc3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  408dc6:	21 19                	and    %ebx,(%ecx)
  408dc8:	eb 1f                	jmp    0x408de9
  408dca:	83 c1 e0             	add    $0xffffffe0,%ecx
  408dcd:	d3 eb                	shr    %cl,%ebx
  408dcf:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  408dd2:	8d 4c 01 04          	lea    0x4(%ecx,%eax,1),%ecx
  408dd6:	f7 d3                	not    %ebx
  408dd8:	21 9c 90 c4 00 00 00 	and    %ebx,0xc4(%eax,%edx,4)
  408ddf:	fe 09                	decb   (%ecx)
  408de1:	75 06                	jne    0x408de9
  408de3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  408de6:	21 59 04             	and    %ebx,0x4(%ecx)
  408de9:	8b 4f 08             	mov    0x8(%edi),%ecx
  408dec:	8b 5f 04             	mov    0x4(%edi),%ebx
  408def:	89 59 04             	mov    %ebx,0x4(%ecx)
  408df2:	8b 4f 04             	mov    0x4(%edi),%ecx
  408df5:	8b 7f 08             	mov    0x8(%edi),%edi
  408df8:	89 79 08             	mov    %edi,0x8(%ecx)
  408dfb:	8b 4d 10             	mov    0x10(%ebp),%ecx
  408dfe:	2b ce                	sub    %esi,%ecx
  408e00:	01 4d fc             	add    %ecx,-0x4(%ebp)
  408e03:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  408e07:	0f 8e a5 00 00 00    	jle    0x408eb2
  408e0d:	8b 7d fc             	mov    -0x4(%ebp),%edi
  408e10:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  408e13:	c1 ff 04             	sar    $0x4,%edi
  408e16:	4f                   	dec    %edi
  408e17:	83 ff 3f             	cmp    $0x3f,%edi
  408e1a:	8d 4c 31 fc          	lea    -0x4(%ecx,%esi,1),%ecx
  408e1e:	76 03                	jbe    0x408e23
  408e20:	6a 3f                	push   $0x3f
  408e22:	5f                   	pop    %edi
  408e23:	8b 5d f4             	mov    -0xc(%ebp),%ebx
  408e26:	8d 1c fb             	lea    (%ebx,%edi,8),%ebx
  408e29:	89 5d 10             	mov    %ebx,0x10(%ebp)
  408e2c:	8b 5b 04             	mov    0x4(%ebx),%ebx
  408e2f:	89 59 04             	mov    %ebx,0x4(%ecx)
  408e32:	8b 5d 10             	mov    0x10(%ebp),%ebx
  408e35:	89 59 08             	mov    %ebx,0x8(%ecx)
  408e38:	89 4b 04             	mov    %ecx,0x4(%ebx)
  408e3b:	8b 59 04             	mov    0x4(%ecx),%ebx
  408e3e:	89 4b 08             	mov    %ecx,0x8(%ebx)
  408e41:	8b 59 04             	mov    0x4(%ecx),%ebx
  408e44:	3b 59 08             	cmp    0x8(%ecx),%ebx
  408e47:	75 57                	jne    0x408ea0
  408e49:	8a 4c 07 04          	mov    0x4(%edi,%eax,1),%cl
  408e4d:	88 4d 13             	mov    %cl,0x13(%ebp)
  408e50:	fe c1                	inc    %cl
  408e52:	83 ff 20             	cmp    $0x20,%edi
  408e55:	88 4c 07 04          	mov    %cl,0x4(%edi,%eax,1)
  408e59:	73 1c                	jae    0x408e77
  408e5b:	80 7d 13 00          	cmpb   $0x0,0x13(%ebp)
  408e5f:	75 0e                	jne    0x408e6f
  408e61:	8b cf                	mov    %edi,%ecx
  408e63:	bb 00 00 00 80       	mov    $0x80000000,%ebx
  408e68:	d3 eb                	shr    %cl,%ebx
  408e6a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  408e6d:	09 19                	or     %ebx,(%ecx)
  408e6f:	8d 44 90 44          	lea    0x44(%eax,%edx,4),%eax
  408e73:	8b cf                	mov    %edi,%ecx
  408e75:	eb 20                	jmp    0x408e97
  408e77:	80 7d 13 00          	cmpb   $0x0,0x13(%ebp)
  408e7b:	75 10                	jne    0x408e8d
  408e7d:	8d 4f e0             	lea    -0x20(%edi),%ecx
  408e80:	bb 00 00 00 80       	mov    $0x80000000,%ebx
  408e85:	d3 eb                	shr    %cl,%ebx
  408e87:	8b 4d 08             	mov    0x8(%ebp),%ecx
  408e8a:	09 59 04             	or     %ebx,0x4(%ecx)
  408e8d:	8d 84 90 c4 00 00 00 	lea    0xc4(%eax,%edx,4),%eax
  408e94:	8d 4f e0             	lea    -0x20(%edi),%ecx
  408e97:	ba 00 00 00 80       	mov    $0x80000000,%edx
  408e9c:	d3 ea                	shr    %cl,%edx
  408e9e:	09 10                	or     %edx,(%eax)
  408ea0:	8b 55 0c             	mov    0xc(%ebp),%edx
  408ea3:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  408ea6:	8d 44 32 fc          	lea    -0x4(%edx,%esi,1),%eax
  408eaa:	89 08                	mov    %ecx,(%eax)
  408eac:	89 4c 01 fc          	mov    %ecx,-0x4(%ecx,%eax,1)
  408eb0:	eb 03                	jmp    0x408eb5
  408eb2:	8b 55 0c             	mov    0xc(%ebp),%edx
  408eb5:	8d 46 01             	lea    0x1(%esi),%eax
  408eb8:	89 42 fc             	mov    %eax,-0x4(%edx)
  408ebb:	89 44 32 f8          	mov    %eax,-0x8(%edx,%esi,1)
  408ebf:	e9 3c 01 00 00       	jmp    0x409000
  408ec4:	33 c0                	xor    %eax,%eax
  408ec6:	e9 38 01 00 00       	jmp    0x409003
  408ecb:	0f 8d 2f 01 00 00    	jge    0x409000
  408ed1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  408ed4:	29 75 10             	sub    %esi,0x10(%ebp)
  408ed7:	8d 4e 01             	lea    0x1(%esi),%ecx
  408eda:	89 4b fc             	mov    %ecx,-0x4(%ebx)
  408edd:	8d 5c 33 fc          	lea    -0x4(%ebx,%esi,1),%ebx
  408ee1:	8b 75 10             	mov    0x10(%ebp),%esi
  408ee4:	c1 fe 04             	sar    $0x4,%esi
  408ee7:	4e                   	dec    %esi
  408ee8:	83 fe 3f             	cmp    $0x3f,%esi
  408eeb:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  408eee:	89 4b fc             	mov    %ecx,-0x4(%ebx)
  408ef1:	76 03                	jbe    0x408ef6
  408ef3:	6a 3f                	push   $0x3f
  408ef5:	5e                   	pop    %esi
  408ef6:	f6 45 fc 01          	testb  $0x1,-0x4(%ebp)
  408efa:	0f 85 80 00 00 00    	jne    0x408f80
  408f00:	8b 75 fc             	mov    -0x4(%ebp),%esi
  408f03:	c1 fe 04             	sar    $0x4,%esi
  408f06:	4e                   	dec    %esi
  408f07:	83 fe 3f             	cmp    $0x3f,%esi
  408f0a:	76 03                	jbe    0x408f0f
  408f0c:	6a 3f                	push   $0x3f
  408f0e:	5e                   	pop    %esi
  408f0f:	8b 4f 04             	mov    0x4(%edi),%ecx
  408f12:	3b 4f 08             	cmp    0x8(%edi),%ecx
  408f15:	75 42                	jne    0x408f59
  408f17:	83 fe 20             	cmp    $0x20,%esi
  408f1a:	bb 00 00 00 80       	mov    $0x80000000,%ebx
  408f1f:	73 19                	jae    0x408f3a
  408f21:	8b ce                	mov    %esi,%ecx
  408f23:	d3 eb                	shr    %cl,%ebx
  408f25:	8d 74 06 04          	lea    0x4(%esi,%eax,1),%esi
  408f29:	f7 d3                	not    %ebx
  408f2b:	21 5c 90 44          	and    %ebx,0x44(%eax,%edx,4)
  408f2f:	fe 0e                	decb   (%esi)
  408f31:	75 23                	jne    0x408f56
  408f33:	8b 4d 08             	mov    0x8(%ebp),%ecx
  408f36:	21 19                	and    %ebx,(%ecx)
  408f38:	eb 1c                	jmp    0x408f56
  408f3a:	8d 4e e0             	lea    -0x20(%esi),%ecx
  408f3d:	d3 eb                	shr    %cl,%ebx
  408f3f:	8d 4c 06 04          	lea    0x4(%esi,%eax,1),%ecx
  408f43:	f7 d3                	not    %ebx
  408f45:	21 9c 90 c4 00 00 00 	and    %ebx,0xc4(%eax,%edx,4)
  408f4c:	fe 09                	decb   (%ecx)
  408f4e:	75 06                	jne    0x408f56
  408f50:	8b 4d 08             	mov    0x8(%ebp),%ecx
  408f53:	21 59 04             	and    %ebx,0x4(%ecx)
  408f56:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  408f59:	8b 4f 08             	mov    0x8(%edi),%ecx
  408f5c:	8b 77 04             	mov    0x4(%edi),%esi
  408f5f:	89 71 04             	mov    %esi,0x4(%ecx)
  408f62:	8b 77 08             	mov    0x8(%edi),%esi
  408f65:	8b 4f 04             	mov    0x4(%edi),%ecx
  408f68:	89 71 08             	mov    %esi,0x8(%ecx)
  408f6b:	8b 75 10             	mov    0x10(%ebp),%esi
  408f6e:	03 75 fc             	add    -0x4(%ebp),%esi
  408f71:	89 75 10             	mov    %esi,0x10(%ebp)
  408f74:	c1 fe 04             	sar    $0x4,%esi
  408f77:	4e                   	dec    %esi
  408f78:	83 fe 3f             	cmp    $0x3f,%esi
  408f7b:	76 03                	jbe    0x408f80
  408f7d:	6a 3f                	push   $0x3f
  408f7f:	5e                   	pop    %esi
  408f80:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  408f83:	8d 0c f1             	lea    (%ecx,%esi,8),%ecx
  408f86:	8b 79 04             	mov    0x4(%ecx),%edi
  408f89:	89 4b 08             	mov    %ecx,0x8(%ebx)
  408f8c:	89 7b 04             	mov    %edi,0x4(%ebx)
  408f8f:	89 59 04             	mov    %ebx,0x4(%ecx)
  408f92:	8b 4b 04             	mov    0x4(%ebx),%ecx
  408f95:	89 59 08             	mov    %ebx,0x8(%ecx)
  408f98:	8b 4b 04             	mov    0x4(%ebx),%ecx
  408f9b:	3b 4b 08             	cmp    0x8(%ebx),%ecx
  408f9e:	75 57                	jne    0x408ff7
  408fa0:	8a 4c 06 04          	mov    0x4(%esi,%eax,1),%cl
  408fa4:	88 4d 0f             	mov    %cl,0xf(%ebp)
  408fa7:	fe c1                	inc    %cl
  408fa9:	83 fe 20             	cmp    $0x20,%esi
  408fac:	88 4c 06 04          	mov    %cl,0x4(%esi,%eax,1)
  408fb0:	73 1c                	jae    0x408fce
  408fb2:	80 7d 0f 00          	cmpb   $0x0,0xf(%ebp)
  408fb6:	75 0e                	jne    0x408fc6
  408fb8:	8b ce                	mov    %esi,%ecx
  408fba:	bf 00 00 00 80       	mov    $0x80000000,%edi
  408fbf:	d3 ef                	shr    %cl,%edi
  408fc1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  408fc4:	09 39                	or     %edi,(%ecx)
  408fc6:	8d 44 90 44          	lea    0x44(%eax,%edx,4),%eax
  408fca:	8b ce                	mov    %esi,%ecx
  408fcc:	eb 20                	jmp    0x408fee
  408fce:	80 7d 0f 00          	cmpb   $0x0,0xf(%ebp)
  408fd2:	75 10                	jne    0x408fe4
  408fd4:	8d 4e e0             	lea    -0x20(%esi),%ecx
  408fd7:	bf 00 00 00 80       	mov    $0x80000000,%edi
  408fdc:	d3 ef                	shr    %cl,%edi
  408fde:	8b 4d 08             	mov    0x8(%ebp),%ecx
  408fe1:	09 79 04             	or     %edi,0x4(%ecx)
  408fe4:	8d 84 90 c4 00 00 00 	lea    0xc4(%eax,%edx,4),%eax
  408feb:	8d 4e e0             	lea    -0x20(%esi),%ecx
  408fee:	ba 00 00 00 80       	mov    $0x80000000,%edx
  408ff3:	d3 ea                	shr    %cl,%edx
  408ff5:	09 10                	or     %edx,(%eax)
  408ff7:	8b 45 10             	mov    0x10(%ebp),%eax
  408ffa:	89 03                	mov    %eax,(%ebx)
  408ffc:	89 44 18 fc          	mov    %eax,-0x4(%eax,%ebx,1)
  409000:	33 c0                	xor    %eax,%eax
  409002:	40                   	inc    %eax
  409003:	5f                   	pop    %edi
  409004:	5e                   	pop    %esi
  409005:	5b                   	pop    %ebx
  409006:	c9                   	leave
  409007:	c3                   	ret
  409008:	55                   	push   %ebp
  409009:	8b ec                	mov    %esp,%ebp
  40900b:	83 ec 14             	sub    $0x14,%esp
  40900e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  409011:	a1 c8 32 41 00       	mov    0x4132c8,%eax
  409016:	8b 15 cc 32 41 00    	mov    0x4132cc,%edx
  40901c:	83 c1 17             	add    $0x17,%ecx
  40901f:	83 e1 f0             	and    $0xfffffff0,%ecx
  409022:	53                   	push   %ebx
  409023:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  409026:	c1 f9 04             	sar    $0x4,%ecx
  409029:	56                   	push   %esi
  40902a:	8d 04 80             	lea    (%eax,%eax,4),%eax
  40902d:	57                   	push   %edi
  40902e:	49                   	dec    %ecx
  40902f:	83 f9 20             	cmp    $0x20,%ecx
  409032:	8d 3c 82             	lea    (%edx,%eax,4),%edi
  409035:	89 7d fc             	mov    %edi,-0x4(%ebp)
  409038:	7d 0b                	jge    0x409045
  40903a:	83 ce ff             	or     $0xffffffff,%esi
  40903d:	d3 ee                	shr    %cl,%esi
  40903f:	83 4d f8 ff          	orl    $0xffffffff,-0x8(%ebp)
  409043:	eb 0d                	jmp    0x409052
  409045:	83 c1 e0             	add    $0xffffffe0,%ecx
  409048:	83 c8 ff             	or     $0xffffffff,%eax
  40904b:	33 f6                	xor    %esi,%esi
  40904d:	d3 e8                	shr    %cl,%eax
  40904f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  409052:	a1 d4 32 41 00       	mov    0x4132d4,%eax
  409057:	8b d8                	mov    %eax,%ebx
  409059:	89 75 f4             	mov    %esi,-0xc(%ebp)
  40905c:	3b df                	cmp    %edi,%ebx
  40905e:	eb 14                	jmp    0x409074
  409060:	8b 4b 04             	mov    0x4(%ebx),%ecx
  409063:	8b 3b                	mov    (%ebx),%edi
  409065:	23 4d f8             	and    -0x8(%ebp),%ecx
  409068:	23 fe                	and    %esi,%edi
  40906a:	0b cf                	or     %edi,%ecx
  40906c:	75 0b                	jne    0x409079
  40906e:	83 c3 14             	add    $0x14,%ebx
  409071:	3b 5d fc             	cmp    -0x4(%ebp),%ebx
  409074:	89 5d 08             	mov    %ebx,0x8(%ebp)
  409077:	72 e7                	jb     0x409060
  409079:	3b 5d fc             	cmp    -0x4(%ebp),%ebx
  40907c:	75 24                	jne    0x4090a2
  40907e:	8b da                	mov    %edx,%ebx
  409080:	eb 11                	jmp    0x409093
  409082:	8b 4b 04             	mov    0x4(%ebx),%ecx
  409085:	8b 3b                	mov    (%ebx),%edi
  409087:	23 4d f8             	and    -0x8(%ebp),%ecx
  40908a:	23 fe                	and    %esi,%edi
  40908c:	0b cf                	or     %edi,%ecx
  40908e:	75 0a                	jne    0x40909a
  409090:	83 c3 14             	add    $0x14,%ebx
  409093:	3b d8                	cmp    %eax,%ebx
  409095:	89 5d 08             	mov    %ebx,0x8(%ebp)
  409098:	72 e8                	jb     0x409082
  40909a:	3b d8                	cmp    %eax,%ebx
  40909c:	0f 84 94 00 00 00    	je     0x409136
  4090a2:	89 1d d4 32 41 00    	mov    %ebx,0x4132d4
  4090a8:	8b 43 10             	mov    0x10(%ebx),%eax
  4090ab:	8b 10                	mov    (%eax),%edx
  4090ad:	83 fa ff             	cmp    $0xffffffff,%edx
  4090b0:	89 55 fc             	mov    %edx,-0x4(%ebp)
  4090b3:	74 14                	je     0x4090c9
  4090b5:	8b 8c 90 c4 00 00 00 	mov    0xc4(%eax,%edx,4),%ecx
  4090bc:	8b 7c 90 44          	mov    0x44(%eax,%edx,4),%edi
  4090c0:	23 4d f8             	and    -0x8(%ebp),%ecx
  4090c3:	23 fe                	and    %esi,%edi
  4090c5:	0b cf                	or     %edi,%ecx
  4090c7:	75 36                	jne    0x4090ff
  4090c9:	8b 90 c4 00 00 00    	mov    0xc4(%eax),%edx
  4090cf:	23 55 f8             	and    -0x8(%ebp),%edx
  4090d2:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  4090d6:	8d 48 44             	lea    0x44(%eax),%ecx
  4090d9:	8b 31                	mov    (%ecx),%esi
  4090db:	23 75 f4             	and    -0xc(%ebp),%esi
  4090de:	0b d6                	or     %esi,%edx
  4090e0:	8b 75 f4             	mov    -0xc(%ebp),%esi
  4090e3:	75 17                	jne    0x4090fc
  4090e5:	8b 91 84 00 00 00    	mov    0x84(%ecx),%edx
  4090eb:	23 55 f8             	and    -0x8(%ebp),%edx
  4090ee:	ff 45 fc             	incl   -0x4(%ebp)
  4090f1:	83 c1 04             	add    $0x4,%ecx
  4090f4:	8b 39                	mov    (%ecx),%edi
  4090f6:	23 fe                	and    %esi,%edi
  4090f8:	0b d7                	or     %edi,%edx
  4090fa:	74 e9                	je     0x4090e5
  4090fc:	8b 55 fc             	mov    -0x4(%ebp),%edx
  4090ff:	8b ca                	mov    %edx,%ecx
  409101:	69 c9 04 02 00 00    	imul   $0x204,%ecx,%ecx
  409107:	8d 8c 01 44 01 00 00 	lea    0x144(%ecx,%eax,1),%ecx
  40910e:	89 4d f4             	mov    %ecx,-0xc(%ebp)
  409111:	8b 4c 90 44          	mov    0x44(%eax,%edx,4),%ecx
  409115:	33 ff                	xor    %edi,%edi
  409117:	23 ce                	and    %esi,%ecx
  409119:	75 6d                	jne    0x409188
  40911b:	8b 8c 90 c4 00 00 00 	mov    0xc4(%eax,%edx,4),%ecx
  409122:	23 4d f8             	and    -0x8(%ebp),%ecx
  409125:	6a 20                	push   $0x20
  409127:	5f                   	pop    %edi
  409128:	eb 5e                	jmp    0x409188
  40912a:	83 7b 08 00          	cmpl   $0x0,0x8(%ebx)
  40912e:	75 0b                	jne    0x40913b
  409130:	83 c3 14             	add    $0x14,%ebx
  409133:	89 5d 08             	mov    %ebx,0x8(%ebp)
  409136:	3b 5d fc             	cmp    -0x4(%ebp),%ebx
  409139:	72 ef                	jb     0x40912a
  40913b:	3b 5d fc             	cmp    -0x4(%ebp),%ebx
  40913e:	75 26                	jne    0x409166
  409140:	8b da                	mov    %edx,%ebx
  409142:	eb 09                	jmp    0x40914d
  409144:	83 7b 08 00          	cmpl   $0x0,0x8(%ebx)
  409148:	75 0a                	jne    0x409154
  40914a:	83 c3 14             	add    $0x14,%ebx
  40914d:	3b d8                	cmp    %eax,%ebx
  40914f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  409152:	72 f0                	jb     0x409144
  409154:	3b d8                	cmp    %eax,%ebx
  409156:	75 0e                	jne    0x409166
  409158:	e8 0f fa ff ff       	call   0x408b6c
  40915d:	8b d8                	mov    %eax,%ebx
  40915f:	85 db                	test   %ebx,%ebx
  409161:	89 5d 08             	mov    %ebx,0x8(%ebp)
  409164:	74 18                	je     0x40917e
  409166:	53                   	push   %ebx
  409167:	e8 b7 fa ff ff       	call   0x408c23
  40916c:	59                   	pop    %ecx
  40916d:	8b 4b 10             	mov    0x10(%ebx),%ecx
  409170:	89 01                	mov    %eax,(%ecx)
  409172:	8b 43 10             	mov    0x10(%ebx),%eax
  409175:	83 38 ff             	cmpl   $0xffffffff,(%eax)
  409178:	0f 85 24 ff ff ff    	jne    0x4090a2
  40917e:	33 c0                	xor    %eax,%eax
  409180:	e9 7a 01 00 00       	jmp    0x4092ff
  409185:	d1 e1                	shl    $1,%ecx
  409187:	47                   	inc    %edi
  409188:	85 c9                	test   %ecx,%ecx
  40918a:	7d f9                	jge    0x409185
  40918c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  40918f:	8b 54 f9 04          	mov    0x4(%ecx,%edi,8),%edx
  409193:	8b 0a                	mov    (%edx),%ecx
  409195:	2b 4d f0             	sub    -0x10(%ebp),%ecx
  409198:	8b f1                	mov    %ecx,%esi
  40919a:	c1 fe 04             	sar    $0x4,%esi
  40919d:	4e                   	dec    %esi
  40919e:	83 fe 3f             	cmp    $0x3f,%esi
  4091a1:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  4091a4:	7e 03                	jle    0x4091a9
  4091a6:	6a 3f                	push   $0x3f
  4091a8:	5e                   	pop    %esi
  4091a9:	3b f7                	cmp    %edi,%esi
  4091ab:	0f 84 01 01 00 00    	je     0x4092b2
  4091b1:	8b 4a 04             	mov    0x4(%edx),%ecx
  4091b4:	3b 4a 08             	cmp    0x8(%edx),%ecx
  4091b7:	75 5c                	jne    0x409215
  4091b9:	83 ff 20             	cmp    $0x20,%edi
  4091bc:	bb 00 00 00 80       	mov    $0x80000000,%ebx
  4091c1:	7d 26                	jge    0x4091e9
  4091c3:	8b cf                	mov    %edi,%ecx
  4091c5:	d3 eb                	shr    %cl,%ebx
  4091c7:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  4091ca:	8d 7c 38 04          	lea    0x4(%eax,%edi,1),%edi
  4091ce:	f7 d3                	not    %ebx
  4091d0:	89 5d ec             	mov    %ebx,-0x14(%ebp)
  4091d3:	23 5c 88 44          	and    0x44(%eax,%ecx,4),%ebx
  4091d7:	89 5c 88 44          	mov    %ebx,0x44(%eax,%ecx,4)
  4091db:	fe 0f                	decb   (%edi)
  4091dd:	75 33                	jne    0x409212
  4091df:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  4091e2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  4091e5:	21 0b                	and    %ecx,(%ebx)
  4091e7:	eb 2c                	jmp    0x409215
  4091e9:	8d 4f e0             	lea    -0x20(%edi),%ecx
  4091ec:	d3 eb                	shr    %cl,%ebx
  4091ee:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  4091f1:	8d 8c 88 c4 00 00 00 	lea    0xc4(%eax,%ecx,4),%ecx
  4091f8:	8d 7c 38 04          	lea    0x4(%eax,%edi,1),%edi
  4091fc:	f7 d3                	not    %ebx
  4091fe:	21 19                	and    %ebx,(%ecx)
  409200:	fe 0f                	decb   (%edi)
  409202:	89 5d ec             	mov    %ebx,-0x14(%ebp)
  409205:	75 0b                	jne    0x409212
  409207:	8b 5d 08             	mov    0x8(%ebp),%ebx
  40920a:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  40920d:	21 4b 04             	and    %ecx,0x4(%ebx)
  409210:	eb 03                	jmp    0x409215
  409212:	8b 5d 08             	mov    0x8(%ebp),%ebx
  409215:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  409219:	8b 4a 08             	mov    0x8(%edx),%ecx
  40921c:	8b 7a 04             	mov    0x4(%edx),%edi
  40921f:	89 79 04             	mov    %edi,0x4(%ecx)
  409222:	8b 4a 04             	mov    0x4(%edx),%ecx
  409225:	8b 7a 08             	mov    0x8(%edx),%edi
  409228:	89 79 08             	mov    %edi,0x8(%ecx)
  40922b:	0f 84 8d 00 00 00    	je     0x4092be
  409231:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  409234:	8d 0c f1             	lea    (%ecx,%esi,8),%ecx
  409237:	8b 79 04             	mov    0x4(%ecx),%edi
  40923a:	89 4a 08             	mov    %ecx,0x8(%edx)
  40923d:	89 7a 04             	mov    %edi,0x4(%edx)
  409240:	89 51 04             	mov    %edx,0x4(%ecx)
  409243:	8b 4a 04             	mov    0x4(%edx),%ecx
  409246:	89 51 08             	mov    %edx,0x8(%ecx)
  409249:	8b 4a 04             	mov    0x4(%edx),%ecx
  40924c:	3b 4a 08             	cmp    0x8(%edx),%ecx
  40924f:	75 5e                	jne    0x4092af
  409251:	8a 4c 06 04          	mov    0x4(%esi,%eax,1),%cl
  409255:	88 4d 0b             	mov    %cl,0xb(%ebp)
  409258:	fe c1                	inc    %cl
  40925a:	83 fe 20             	cmp    $0x20,%esi
  40925d:	88 4c 06 04          	mov    %cl,0x4(%esi,%eax,1)
  409261:	7d 23                	jge    0x409286
  409263:	80 7d 0b 00          	cmpb   $0x0,0xb(%ebp)
  409267:	75 0b                	jne    0x409274
  409269:	bf 00 00 00 80       	mov    $0x80000000,%edi
  40926e:	8b ce                	mov    %esi,%ecx
  409270:	d3 ef                	shr    %cl,%edi
  409272:	09 3b                	or     %edi,(%ebx)
  409274:	8b ce                	mov    %esi,%ecx
  409276:	bf 00 00 00 80       	mov    $0x80000000,%edi
  40927b:	d3 ef                	shr    %cl,%edi
  40927d:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  409280:	09 7c 88 44          	or     %edi,0x44(%eax,%ecx,4)
  409284:	eb 29                	jmp    0x4092af
  409286:	80 7d 0b 00          	cmpb   $0x0,0xb(%ebp)
  40928a:	75 0d                	jne    0x409299
  40928c:	8d 4e e0             	lea    -0x20(%esi),%ecx
  40928f:	bf 00 00 00 80       	mov    $0x80000000,%edi
  409294:	d3 ef                	shr    %cl,%edi
  409296:	09 7b 04             	or     %edi,0x4(%ebx)
  409299:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  40929c:	8d bc 88 c4 00 00 00 	lea    0xc4(%eax,%ecx,4),%edi
  4092a3:	8d 4e e0             	lea    -0x20(%esi),%ecx
  4092a6:	be 00 00 00 80       	mov    $0x80000000,%esi
  4092ab:	d3 ee                	shr    %cl,%esi
  4092ad:	09 37                	or     %esi,(%edi)
  4092af:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  4092b2:	85 c9                	test   %ecx,%ecx
  4092b4:	74 0b                	je     0x4092c1
  4092b6:	89 0a                	mov    %ecx,(%edx)
  4092b8:	89 4c 11 fc          	mov    %ecx,-0x4(%ecx,%edx,1)
  4092bc:	eb 03                	jmp    0x4092c1
  4092be:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  4092c1:	8b 75 f0             	mov    -0x10(%ebp),%esi
  4092c4:	03 d1                	add    %ecx,%edx
  4092c6:	8d 4e 01             	lea    0x1(%esi),%ecx
  4092c9:	89 0a                	mov    %ecx,(%edx)
  4092cb:	89 4c 32 fc          	mov    %ecx,-0x4(%edx,%esi,1)
  4092cf:	8b 75 f4             	mov    -0xc(%ebp),%esi
  4092d2:	8b 0e                	mov    (%esi),%ecx
  4092d4:	85 c9                	test   %ecx,%ecx
  4092d6:	8d 79 01             	lea    0x1(%ecx),%edi
  4092d9:	89 3e                	mov    %edi,(%esi)
  4092db:	75 1a                	jne    0x4092f7
  4092dd:	3b 1d c4 32 41 00    	cmp    0x4132c4,%ebx
  4092e3:	75 12                	jne    0x4092f7
  4092e5:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  4092e8:	3b 0d dc 32 41 00    	cmp    0x4132dc,%ecx
  4092ee:	75 07                	jne    0x4092f7
  4092f0:	83 25 c4 32 41 00 00 	andl   $0x0,0x4132c4
  4092f7:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  4092fa:	89 08                	mov    %ecx,(%eax)
  4092fc:	8d 42 04             	lea    0x4(%edx),%eax
  4092ff:	5f                   	pop    %edi
  409300:	5e                   	pop    %esi
  409301:	5b                   	pop    %ebx
  409302:	c9                   	leave
  409303:	c3                   	ret
  409304:	cc                   	int3
  409305:	cc                   	int3
  409306:	cc                   	int3
  409307:	cc                   	int3
  409308:	cc                   	int3
  409309:	cc                   	int3
  40930a:	cc                   	int3
  40930b:	cc                   	int3
  40930c:	cc                   	int3
  40930d:	cc                   	int3
  40930e:	cc                   	int3
  40930f:	cc                   	int3
  409310:	55                   	push   %ebp
  409311:	8b ec                	mov    %esp,%ebp
  409313:	57                   	push   %edi
  409314:	56                   	push   %esi
  409315:	8b 75 0c             	mov    0xc(%ebp),%esi
  409318:	8b 4d 10             	mov    0x10(%ebp),%ecx
  40931b:	8b 7d 08             	mov    0x8(%ebp),%edi
  40931e:	8b c1                	mov    %ecx,%eax
  409320:	8b d1                	mov    %ecx,%edx
  409322:	03 c6                	add    %esi,%eax
  409324:	3b fe                	cmp    %esi,%edi
  409326:	76 08                	jbe    0x409330
  409328:	3b f8                	cmp    %eax,%edi
  40932a:	0f 82 7c 01 00 00    	jb     0x4094ac
  409330:	f7 c7 03 00 00 00    	test   $0x3,%edi
  409336:	75 14                	jne    0x40934c
  409338:	c1 e9 02             	shr    $0x2,%ecx
  40933b:	83 e2 03             	and    $0x3,%edx
  40933e:	83 f9 08             	cmp    $0x8,%ecx
  409341:	72 29                	jb     0x40936c
  409343:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  409345:	ff 24 95 5c 94 40 00 	jmp    *0x40945c(,%edx,4)
  40934c:	8b c7                	mov    %edi,%eax
  40934e:	ba 03 00 00 00       	mov    $0x3,%edx
  409353:	83 e9 04             	sub    $0x4,%ecx
  409356:	72 0c                	jb     0x409364
  409358:	83 e0 03             	and    $0x3,%eax
  40935b:	03 c8                	add    %eax,%ecx
  40935d:	ff 24 85 70 93 40 00 	jmp    *0x409370(,%eax,4)
  409364:	ff 24 8d 6c 94 40 00 	jmp    *0x40946c(,%ecx,4)
  40936b:	90                   	nop
  40936c:	ff 24 8d f0 93 40 00 	jmp    *0x4093f0(,%ecx,4)
  409373:	90                   	nop
  409374:	80 93 40 00 ac 93 40 	adcb   $0x40,-0x6c53ffc0(%ebx)
  40937b:	00 d0                	add    %dl,%al
  40937d:	93                   	xchg   %eax,%ebx
  40937e:	40                   	inc    %eax
  40937f:	00 23                	add    %ah,(%ebx)
  409381:	d1 8a 06 88 07 8a    	rorl   $1,-0x75f877fa(%edx)
  409387:	46                   	inc    %esi
  409388:	01 88 47 01 8a 46    	add    %ecx,0x468a0147(%eax)
  40938e:	02 c1                	add    %cl,%al
  409390:	e9 02 88 47 02       	jmp    0x2881b97
  409395:	83 c6 03             	add    $0x3,%esi
  409398:	83 c7 03             	add    $0x3,%edi
  40939b:	83 f9 08             	cmp    $0x8,%ecx
  40939e:	72 cc                	jb     0x40936c
  4093a0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  4093a2:	ff 24 95 5c 94 40 00 	jmp    *0x40945c(,%edx,4)
  4093a9:	8d 49 00             	lea    0x0(%ecx),%ecx
  4093ac:	23 d1                	and    %ecx,%edx
  4093ae:	8a 06                	mov    (%esi),%al
  4093b0:	88 07                	mov    %al,(%edi)
  4093b2:	8a 46 01             	mov    0x1(%esi),%al
  4093b5:	c1 e9 02             	shr    $0x2,%ecx
  4093b8:	88 47 01             	mov    %al,0x1(%edi)
  4093bb:	83 c6 02             	add    $0x2,%esi
  4093be:	83 c7 02             	add    $0x2,%edi
  4093c1:	83 f9 08             	cmp    $0x8,%ecx
  4093c4:	72 a6                	jb     0x40936c
  4093c6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  4093c8:	ff 24 95 5c 94 40 00 	jmp    *0x40945c(,%edx,4)
  4093cf:	90                   	nop
  4093d0:	23 d1                	and    %ecx,%edx
  4093d2:	8a 06                	mov    (%esi),%al
  4093d4:	88 07                	mov    %al,(%edi)
  4093d6:	83 c6 01             	add    $0x1,%esi
  4093d9:	c1 e9 02             	shr    $0x2,%ecx
  4093dc:	83 c7 01             	add    $0x1,%edi
  4093df:	83 f9 08             	cmp    $0x8,%ecx
  4093e2:	72 88                	jb     0x40936c
  4093e4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  4093e6:	ff 24 95 5c 94 40 00 	jmp    *0x40945c(,%edx,4)
  4093ed:	8d 49 00             	lea    0x0(%ecx),%ecx
  4093f0:	53                   	push   %ebx
  4093f1:	94                   	xchg   %eax,%esp
  4093f2:	40                   	inc    %eax
  4093f3:	00 40 94             	add    %al,-0x6c(%eax)
  4093f6:	40                   	inc    %eax
  4093f7:	00 38                	add    %bh,(%eax)
  4093f9:	94                   	xchg   %eax,%esp
  4093fa:	40                   	inc    %eax
  4093fb:	00 30                	add    %dh,(%eax)
  4093fd:	94                   	xchg   %eax,%esp
  4093fe:	40                   	inc    %eax
  4093ff:	00 28                	add    %ch,(%eax)
  409401:	94                   	xchg   %eax,%esp
  409402:	40                   	inc    %eax
  409403:	00 20                	add    %ah,(%eax)
  409405:	94                   	xchg   %eax,%esp
  409406:	40                   	inc    %eax
  409407:	00 18                	add    %bl,(%eax)
  409409:	94                   	xchg   %eax,%esp
  40940a:	40                   	inc    %eax
  40940b:	00 10                	add    %dl,(%eax)
  40940d:	94                   	xchg   %eax,%esp
  40940e:	40                   	inc    %eax
  40940f:	00 8b 44 8e e4 89    	add    %cl,-0x761b71bc(%ebx)
  409415:	44                   	inc    %esp
  409416:	8f                   	(bad)
  409417:	e4 8b                	in     $0x8b,%al
  409419:	44                   	inc    %esp
  40941a:	8e e8                	mov    %eax,%gs
  40941c:	89 44 8f e8          	mov    %eax,-0x18(%edi,%ecx,4)
  409420:	8b 44 8e ec          	mov    -0x14(%esi,%ecx,4),%eax
  409424:	89 44 8f ec          	mov    %eax,-0x14(%edi,%ecx,4)
  409428:	8b 44 8e f0          	mov    -0x10(%esi,%ecx,4),%eax
  40942c:	89 44 8f f0          	mov    %eax,-0x10(%edi,%ecx,4)
  409430:	8b 44 8e f4          	mov    -0xc(%esi,%ecx,4),%eax
  409434:	89 44 8f f4          	mov    %eax,-0xc(%edi,%ecx,4)
  409438:	8b 44 8e f8          	mov    -0x8(%esi,%ecx,4),%eax
  40943c:	89 44 8f f8          	mov    %eax,-0x8(%edi,%ecx,4)
  409440:	8b 44 8e fc          	mov    -0x4(%esi,%ecx,4),%eax
  409444:	89 44 8f fc          	mov    %eax,-0x4(%edi,%ecx,4)
  409448:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
  40944f:	03 f0                	add    %eax,%esi
  409451:	03 f8                	add    %eax,%edi
  409453:	ff 24 95 5c 94 40 00 	jmp    *0x40945c(,%edx,4)
  40945a:	8b ff                	mov    %edi,%edi
  40945c:	6c                   	insb   (%dx),%es:(%edi)
  40945d:	94                   	xchg   %eax,%esp
  40945e:	40                   	inc    %eax
  40945f:	00 74 94 40          	add    %dh,0x40(%esp,%edx,4)
  409463:	00 80 94 40 00 94    	add    %al,-0x6bffbf6c(%eax)
  409469:	94                   	xchg   %eax,%esp
  40946a:	40                   	inc    %eax
  40946b:	00 8b 45 08 5e 5f    	add    %cl,0x5f5e0845(%ebx)
  409471:	c9                   	leave
  409472:	c3                   	ret
  409473:	90                   	nop
  409474:	8a 06                	mov    (%esi),%al
  409476:	88 07                	mov    %al,(%edi)
  409478:	8b 45 08             	mov    0x8(%ebp),%eax
  40947b:	5e                   	pop    %esi
  40947c:	5f                   	pop    %edi
  40947d:	c9                   	leave
  40947e:	c3                   	ret
  40947f:	90                   	nop
  409480:	8a 06                	mov    (%esi),%al
  409482:	88 07                	mov    %al,(%edi)
  409484:	8a 46 01             	mov    0x1(%esi),%al
  409487:	88 47 01             	mov    %al,0x1(%edi)
  40948a:	8b 45 08             	mov    0x8(%ebp),%eax
  40948d:	5e                   	pop    %esi
  40948e:	5f                   	pop    %edi
  40948f:	c9                   	leave
  409490:	c3                   	ret
  409491:	8d 49 00             	lea    0x0(%ecx),%ecx
  409494:	8a 06                	mov    (%esi),%al
  409496:	88 07                	mov    %al,(%edi)
  409498:	8a 46 01             	mov    0x1(%esi),%al
  40949b:	88 47 01             	mov    %al,0x1(%edi)
  40949e:	8a 46 02             	mov    0x2(%esi),%al
  4094a1:	88 47 02             	mov    %al,0x2(%edi)
  4094a4:	8b 45 08             	mov    0x8(%ebp),%eax
  4094a7:	5e                   	pop    %esi
  4094a8:	5f                   	pop    %edi
  4094a9:	c9                   	leave
  4094aa:	c3                   	ret
  4094ab:	90                   	nop
  4094ac:	8d 74 31 fc          	lea    -0x4(%ecx,%esi,1),%esi
  4094b0:	8d 7c 39 fc          	lea    -0x4(%ecx,%edi,1),%edi
  4094b4:	f7 c7 03 00 00 00    	test   $0x3,%edi
  4094ba:	75 24                	jne    0x4094e0
  4094bc:	c1 e9 02             	shr    $0x2,%ecx
  4094bf:	83 e2 03             	and    $0x3,%edx
  4094c2:	83 f9 08             	cmp    $0x8,%ecx
  4094c5:	72 0d                	jb     0x4094d4
  4094c7:	fd                   	std
  4094c8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  4094ca:	fc                   	cld
  4094cb:	ff 24 95 f8 95 40 00 	jmp    *0x4095f8(,%edx,4)
  4094d2:	8b ff                	mov    %edi,%edi
  4094d4:	f7 d9                	neg    %ecx
  4094d6:	ff 24 8d a8 95 40 00 	jmp    *0x4095a8(,%ecx,4)
  4094dd:	8d 49 00             	lea    0x0(%ecx),%ecx
  4094e0:	8b c7                	mov    %edi,%eax
  4094e2:	ba 03 00 00 00       	mov    $0x3,%edx
  4094e7:	83 f9 04             	cmp    $0x4,%ecx
  4094ea:	72 0c                	jb     0x4094f8
  4094ec:	83 e0 03             	and    $0x3,%eax
  4094ef:	2b c8                	sub    %eax,%ecx
  4094f1:	ff 24 85 fc 94 40 00 	jmp    *0x4094fc(,%eax,4)
  4094f8:	ff 24 8d f8 95 40 00 	jmp    *0x4095f8(,%ecx,4)
  4094ff:	90                   	nop
  409500:	0c 95                	or     $0x95,%al
  409502:	40                   	inc    %eax
  409503:	00 30                	add    %dh,(%eax)
  409505:	95                   	xchg   %eax,%ebp
  409506:	40                   	inc    %eax
  409507:	00 58 95             	add    %bl,-0x6b(%eax)
  40950a:	40                   	inc    %eax
  40950b:	00 8a 46 03 23 d1    	add    %cl,-0x2edcfcba(%edx)
  409511:	88 47 03             	mov    %al,0x3(%edi)
  409514:	83 ee 01             	sub    $0x1,%esi
  409517:	c1 e9 02             	shr    $0x2,%ecx
  40951a:	83 ef 01             	sub    $0x1,%edi
  40951d:	83 f9 08             	cmp    $0x8,%ecx
  409520:	72 b2                	jb     0x4094d4
  409522:	fd                   	std
  409523:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  409525:	fc                   	cld
  409526:	ff 24 95 f8 95 40 00 	jmp    *0x4095f8(,%edx,4)
  40952d:	8d 49 00             	lea    0x0(%ecx),%ecx
  409530:	8a 46 03             	mov    0x3(%esi),%al
  409533:	23 d1                	and    %ecx,%edx
  409535:	88 47 03             	mov    %al,0x3(%edi)
  409538:	8a 46 02             	mov    0x2(%esi),%al
  40953b:	c1 e9 02             	shr    $0x2,%ecx
  40953e:	88 47 02             	mov    %al,0x2(%edi)
  409541:	83 ee 02             	sub    $0x2,%esi
  409544:	83 ef 02             	sub    $0x2,%edi
  409547:	83 f9 08             	cmp    $0x8,%ecx
  40954a:	72 88                	jb     0x4094d4
  40954c:	fd                   	std
  40954d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  40954f:	fc                   	cld
  409550:	ff 24 95 f8 95 40 00 	jmp    *0x4095f8(,%edx,4)
  409557:	90                   	nop
  409558:	8a 46 03             	mov    0x3(%esi),%al
  40955b:	23 d1                	and    %ecx,%edx
  40955d:	88 47 03             	mov    %al,0x3(%edi)
  409560:	8a 46 02             	mov    0x2(%esi),%al
  409563:	88 47 02             	mov    %al,0x2(%edi)
  409566:	8a 46 01             	mov    0x1(%esi),%al
  409569:	c1 e9 02             	shr    $0x2,%ecx
  40956c:	88 47 01             	mov    %al,0x1(%edi)
  40956f:	83 ee 03             	sub    $0x3,%esi
  409572:	83 ef 03             	sub    $0x3,%edi
  409575:	83 f9 08             	cmp    $0x8,%ecx
  409578:	0f 82 56 ff ff ff    	jb     0x4094d4
  40957e:	fd                   	std
  40957f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  409581:	fc                   	cld
  409582:	ff 24 95 f8 95 40 00 	jmp    *0x4095f8(,%edx,4)
  409589:	8d 49 00             	lea    0x0(%ecx),%ecx
  40958c:	ac                   	lods   %ds:(%esi),%al
  40958d:	95                   	xchg   %eax,%ebp
  40958e:	40                   	inc    %eax
  40958f:	00 b4 95 40 00 bc 95 	add    %dh,-0x6a43ffc0(%ebp,%edx,4)
  409596:	40                   	inc    %eax
  409597:	00 c4                	add    %al,%ah
  409599:	95                   	xchg   %eax,%ebp
  40959a:	40                   	inc    %eax
  40959b:	00 cc                	add    %cl,%ah
  40959d:	95                   	xchg   %eax,%ebp
  40959e:	40                   	inc    %eax
  40959f:	00 d4                	add    %dl,%ah
  4095a1:	95                   	xchg   %eax,%ebp
  4095a2:	40                   	inc    %eax
  4095a3:	00 dc                	add    %bl,%ah
  4095a5:	95                   	xchg   %eax,%ebp
  4095a6:	40                   	inc    %eax
  4095a7:	00 ef                	add    %ch,%bh
  4095a9:	95                   	xchg   %eax,%ebp
  4095aa:	40                   	inc    %eax
  4095ab:	00 8b 44 8e 1c 89    	add    %cl,-0x76e371bc(%ebx)
  4095b1:	44                   	inc    %esp
  4095b2:	8f                   	(bad)
  4095b3:	1c 8b                	sbb    $0x8b,%al
  4095b5:	44                   	inc    %esp
  4095b6:	8e 18                	mov    (%eax),%ds
  4095b8:	89 44 8f 18          	mov    %eax,0x18(%edi,%ecx,4)
  4095bc:	8b 44 8e 14          	mov    0x14(%esi,%ecx,4),%eax
  4095c0:	89 44 8f 14          	mov    %eax,0x14(%edi,%ecx,4)
  4095c4:	8b 44 8e 10          	mov    0x10(%esi,%ecx,4),%eax
  4095c8:	89 44 8f 10          	mov    %eax,0x10(%edi,%ecx,4)
  4095cc:	8b 44 8e 0c          	mov    0xc(%esi,%ecx,4),%eax
  4095d0:	89 44 8f 0c          	mov    %eax,0xc(%edi,%ecx,4)
  4095d4:	8b 44 8e 08          	mov    0x8(%esi,%ecx,4),%eax
  4095d8:	89 44 8f 08          	mov    %eax,0x8(%edi,%ecx,4)
  4095dc:	8b 44 8e 04          	mov    0x4(%esi,%ecx,4),%eax
  4095e0:	89 44 8f 04          	mov    %eax,0x4(%edi,%ecx,4)
  4095e4:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
  4095eb:	03 f0                	add    %eax,%esi
  4095ed:	03 f8                	add    %eax,%edi
  4095ef:	ff 24 95 f8 95 40 00 	jmp    *0x4095f8(,%edx,4)
  4095f6:	8b ff                	mov    %edi,%edi
  4095f8:	08 96 40 00 10 96    	or     %dl,-0x69efffc0(%esi)
  4095fe:	40                   	inc    %eax
  4095ff:	00 20                	add    %ah,(%eax)
  409601:	96                   	xchg   %eax,%esi
  409602:	40                   	inc    %eax
  409603:	00 34 96             	add    %dh,(%esi,%edx,4)
  409606:	40                   	inc    %eax
  409607:	00 8b 45 08 5e 5f    	add    %cl,0x5f5e0845(%ebx)
  40960d:	c9                   	leave
  40960e:	c3                   	ret
  40960f:	90                   	nop
  409610:	8a 46 03             	mov    0x3(%esi),%al
  409613:	88 47 03             	mov    %al,0x3(%edi)
  409616:	8b 45 08             	mov    0x8(%ebp),%eax
  409619:	5e                   	pop    %esi
  40961a:	5f                   	pop    %edi
  40961b:	c9                   	leave
  40961c:	c3                   	ret
  40961d:	8d 49 00             	lea    0x0(%ecx),%ecx
  409620:	8a 46 03             	mov    0x3(%esi),%al
  409623:	88 47 03             	mov    %al,0x3(%edi)
  409626:	8a 46 02             	mov    0x2(%esi),%al
  409629:	88 47 02             	mov    %al,0x2(%edi)
  40962c:	8b 45 08             	mov    0x8(%ebp),%eax
  40962f:	5e                   	pop    %esi
  409630:	5f                   	pop    %edi
  409631:	c9                   	leave
  409632:	c3                   	ret
  409633:	90                   	nop
  409634:	8a 46 03             	mov    0x3(%esi),%al
  409637:	88 47 03             	mov    %al,0x3(%edi)
  40963a:	8a 46 02             	mov    0x2(%esi),%al
  40963d:	88 47 02             	mov    %al,0x2(%edi)
  409640:	8a 46 01             	mov    0x1(%esi),%al
  409643:	88 47 01             	mov    %al,0x1(%edi)
  409646:	8b 45 08             	mov    0x8(%ebp),%eax
  409649:	5e                   	pop    %esi
  40964a:	5f                   	pop    %edi
  40964b:	c9                   	leave
  40964c:	c3                   	ret
  40964d:	56                   	push   %esi
  40964e:	8b 74 24 08          	mov    0x8(%esp),%esi
  409652:	8b 06                	mov    (%esi),%eax
  409654:	81 38 63 73 6d e0    	cmpl   $0xe06d7363,(%eax)
  40965a:	75 1c                	jne    0x409678
  40965c:	83 78 10 03          	cmpl   $0x3,0x10(%eax)
  409660:	75 16                	jne    0x409678
  409662:	8b 40 14             	mov    0x14(%eax),%eax
  409665:	3d 20 05 93 19       	cmp    $0x19930520,%eax
  40966a:	74 07                	je     0x409673
  40966c:	3d 21 05 93 19       	cmp    $0x19930521,%eax
  409671:	75 05                	jne    0x409678
  409673:	e8 9d de ff ff       	call   0x407515
  409678:	a1 ac 1f 41 00       	mov    0x411fac,%eax
  40967d:	85 c0                	test   %eax,%eax
  40967f:	74 14                	je     0x409695
  409681:	50                   	push   %eax
  409682:	e8 f9 00 00 00       	call   0x409780
  409687:	85 c0                	test   %eax,%eax
  409689:	59                   	pop    %ecx
  40968a:	74 09                	je     0x409695
  40968c:	56                   	push   %esi
  40968d:	ff 15 ac 1f 41 00    	call   *0x411fac
  409693:	eb 02                	jmp    0x409697
  409695:	33 c0                	xor    %eax,%eax
  409697:	5e                   	pop    %esi
  409698:	c2 04 00             	ret    $0x4
  40969b:	68 4d 96 40 00       	push   $0x40964d
  4096a0:	ff 15 e4 d0 40 00    	call   *0x40d0e4  ; 0x40d0e4=KERNEL32.dll!SetUnhandledExceptionFilter
  4096a6:	a3 ac 1f 41 00       	mov    %eax,0x411fac
  4096ab:	33 c0                	xor    %eax,%eax
  4096ad:	c3                   	ret
  4096ae:	ff 35 ac 1f 41 00    	push   0x411fac
  4096b4:	ff 15 e4 d0 40 00    	call   *0x40d0e4  ; 0x40d0e4=KERNEL32.dll!SetUnhandledExceptionFilter
  4096ba:	c3                   	ret
  4096bb:	cc                   	int3
  4096bc:	cc                   	int3
  4096bd:	cc                   	int3
  4096be:	cc                   	int3
  4096bf:	cc                   	int3
  4096c0:	8b 54 24 04          	mov    0x4(%esp),%edx
  4096c4:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  4096c8:	f7 c2 03 00 00 00    	test   $0x3,%edx
  4096ce:	75 3c                	jne    0x40970c
  4096d0:	8b 02                	mov    (%edx),%eax
  4096d2:	3a 01                	cmp    (%ecx),%al
  4096d4:	75 2e                	jne    0x409704
  4096d6:	0a c0                	or     %al,%al
  4096d8:	74 26                	je     0x409700
  4096da:	3a 61 01             	cmp    0x1(%ecx),%ah
  4096dd:	75 25                	jne    0x409704
  4096df:	0a e4                	or     %ah,%ah
  4096e1:	74 1d                	je     0x409700
  4096e3:	c1 e8 10             	shr    $0x10,%eax
  4096e6:	3a 41 02             	cmp    0x2(%ecx),%al
  4096e9:	75 19                	jne    0x409704
  4096eb:	0a c0                	or     %al,%al
  4096ed:	74 11                	je     0x409700
  4096ef:	3a 61 03             	cmp    0x3(%ecx),%ah
  4096f2:	75 10                	jne    0x409704
  4096f4:	83 c1 04             	add    $0x4,%ecx
  4096f7:	83 c2 04             	add    $0x4,%edx
  4096fa:	0a e4                	or     %ah,%ah
  4096fc:	75 d2                	jne    0x4096d0
  4096fe:	8b ff                	mov    %edi,%edi
  409700:	33 c0                	xor    %eax,%eax
  409702:	c3                   	ret
  409703:	90                   	nop
  409704:	1b c0                	sbb    %eax,%eax
  409706:	d1 e0                	shl    $1,%eax
  409708:	83 c0 01             	add    $0x1,%eax
  40970b:	c3                   	ret
  40970c:	f7 c2 01 00 00 00    	test   $0x1,%edx
  409712:	74 18                	je     0x40972c
  409714:	8a 02                	mov    (%edx),%al
  409716:	83 c2 01             	add    $0x1,%edx
  409719:	3a 01                	cmp    (%ecx),%al
  40971b:	75 e7                	jne    0x409704
  40971d:	83 c1 01             	add    $0x1,%ecx
  409720:	0a c0                	or     %al,%al
  409722:	74 dc                	je     0x409700
  409724:	f7 c2 02 00 00 00    	test   $0x2,%edx
  40972a:	74 a4                	je     0x4096d0
  40972c:	66 8b 02             	mov    (%edx),%ax
  40972f:	83 c2 02             	add    $0x2,%edx
  409732:	3a 01                	cmp    (%ecx),%al
  409734:	75 ce                	jne    0x409704
  409736:	0a c0                	or     %al,%al
  409738:	74 c6                	je     0x409700
  40973a:	3a 61 01             	cmp    0x1(%ecx),%ah
  40973d:	75 c5                	jne    0x409704
  40973f:	0a e4                	or     %ah,%ah
  409741:	74 bd                	je     0x409700
  409743:	83 c1 02             	add    $0x2,%ecx
  409746:	eb 88                	jmp    0x4096d0
  409748:	56                   	push   %esi
  409749:	ff 74 24 0c          	push   0xc(%esp)
  40974d:	33 f6                	xor    %esi,%esi
  40974f:	ff 74 24 0c          	push   0xc(%esp)
  409753:	46                   	inc    %esi
  409754:	ff 15 e0 d0 40 00    	call   *0x40d0e0  ; 0x40d0e0=KERNEL32.dll!IsBadReadPtr
  40975a:	85 c0                	test   %eax,%eax
  40975c:	74 02                	je     0x409760
  40975e:	33 f6                	xor    %esi,%esi
  409760:	8b c6                	mov    %esi,%eax
  409762:	5e                   	pop    %esi
  409763:	c3                   	ret
  409764:	56                   	push   %esi
  409765:	ff 74 24 0c          	push   0xc(%esp)
  409769:	33 f6                	xor    %esi,%esi
  40976b:	ff 74 24 0c          	push   0xc(%esp)
  40976f:	46                   	inc    %esi
  409770:	ff 15 e8 d0 40 00    	call   *0x40d0e8  ; 0x40d0e8=KERNEL32.dll!IsBadWritePtr
  409776:	85 c0                	test   %eax,%eax
  409778:	74 02                	je     0x40977c
  40977a:	33 f6                	xor    %esi,%esi
  40977c:	8b c6                	mov    %esi,%eax
  40977e:	5e                   	pop    %esi
  40977f:	c3                   	ret
  409780:	56                   	push   %esi
  409781:	ff 74 24 08          	push   0x8(%esp)
  409785:	33 f6                	xor    %esi,%esi
  409787:	46                   	inc    %esi
  409788:	ff 15 dc d0 40 00    	call   *0x40d0dc  ; 0x40d0dc=KERNEL32.dll!IsBadCodePtr
  40978e:	85 c0                	test   %eax,%eax
  409790:	74 02                	je     0x409794
  409792:	33 f6                	xor    %esi,%esi
  409794:	8b c6                	mov    %esi,%eax
  409796:	5e                   	pop    %esi
  409797:	c3                   	ret
  409798:	6a 0a                	push   $0xa
  40979a:	e8 14 e6 ff ff       	call   0x407db3
  40979f:	6a 16                	push   $0x16
  4097a1:	e8 81 0d 00 00       	call   0x40a527
  4097a6:	59                   	pop    %ecx
  4097a7:	59                   	pop    %ecx
  4097a8:	6a 03                	push   $0x3
  4097aa:	e8 dd d3 ff ff       	call   0x406b8c
  4097af:	cc                   	int3
  4097b0:	55                   	push   %ebp
  4097b1:	8d ac 24 64 fc ff ff 	lea    -0x39c(%esp),%ebp
  4097b8:	81 ec 1c 04 00 00    	sub    $0x41c,%esp
  4097be:	8b 8d a4 03 00 00    	mov    0x3a4(%ebp),%ecx
  4097c4:	3b 0d e8 32 41 00    	cmp    0x4132e8,%ecx
  4097ca:	a1 6c 04 41 00       	mov    0x41046c,%eax
  4097cf:	53                   	push   %ebx
  4097d0:	56                   	push   %esi
  4097d1:	89 85 98 03 00 00    	mov    %eax,0x398(%ebp)
  4097d7:	57                   	push   %edi
  4097d8:	0f 83 98 01 00 00    	jae    0x409976
  4097de:	8b c1                	mov    %ecx,%eax
  4097e0:	c1 f8 05             	sar    $0x5,%eax
  4097e3:	8d 1c 85 00 33 41 00 	lea    0x413300(,%eax,4),%ebx
  4097ea:	8b 03                	mov    (%ebx),%eax
  4097ec:	8b f1                	mov    %ecx,%esi
  4097ee:	83 e6 1f             	and    $0x1f,%esi
  4097f1:	c1 e6 03             	shl    $0x3,%esi
  4097f4:	8a 44 30 04          	mov    0x4(%eax,%esi,1),%al
  4097f8:	a8 01                	test   $0x1,%al
  4097fa:	89 5d 80             	mov    %ebx,-0x80(%ebp)
  4097fd:	0f 84 73 01 00 00    	je     0x409976
  409803:	33 ff                	xor    %edi,%edi
  409805:	39 bd ac 03 00 00    	cmp    %edi,0x3ac(%ebp)
  40980b:	89 7d 8c             	mov    %edi,-0x74(%ebp)
  40980e:	89 7d 84             	mov    %edi,-0x7c(%ebp)
  409811:	75 07                	jne    0x40981a
  409813:	33 c0                	xor    %eax,%eax
  409815:	e9 70 01 00 00       	jmp    0x40998a
  40981a:	a8 20                	test   $0x20,%al
  40981c:	74 0d                	je     0x40982b
  40981e:	6a 02                	push   $0x2
  409820:	57                   	push   %edi
  409821:	57                   	push   %edi
  409822:	51                   	push   %ecx
  409823:	e8 3d 0f 00 00       	call   0x40a765
  409828:	83 c4 10             	add    $0x10,%esp
  40982b:	8b 03                	mov    (%ebx),%eax
  40982d:	03 c6                	add    %esi,%eax
  40982f:	f6 40 04 80          	testb  $0x80,0x4(%eax)
  409833:	0f 84 c7 00 00 00    	je     0x409900
  409839:	39 bd ac 03 00 00    	cmp    %edi,0x3ac(%ebp)
  40983f:	8b 85 a8 03 00 00    	mov    0x3a8(%ebp),%eax
  409845:	89 45 90             	mov    %eax,-0x70(%ebp)
  409848:	89 bd a4 03 00 00    	mov    %edi,0x3a4(%ebp)
  40984e:	0f 86 f3 00 00 00    	jbe    0x409947
  409854:	8b 4d 90             	mov    -0x70(%ebp),%ecx
  409857:	2b 8d a8 03 00 00    	sub    0x3a8(%ebp),%ecx
  40985d:	8d 45 94             	lea    -0x6c(%ebp),%eax
  409860:	3b 8d ac 03 00 00    	cmp    0x3ac(%ebp),%ecx
  409866:	73 25                	jae    0x40988d
  409868:	8b 55 90             	mov    -0x70(%ebp),%edx
  40986b:	ff 45 90             	incl   -0x70(%ebp)
  40986e:	8a 12                	mov    (%edx),%dl
  409870:	41                   	inc    %ecx
  409871:	80 fa 0a             	cmp    $0xa,%dl
  409874:	75 08                	jne    0x40987e
  409876:	ff 45 84             	incl   -0x7c(%ebp)
  409879:	c6 00 0d             	movb   $0xd,(%eax)
  40987c:	40                   	inc    %eax
  40987d:	47                   	inc    %edi
  40987e:	8b 5d 80             	mov    -0x80(%ebp),%ebx
  409881:	88 10                	mov    %dl,(%eax)
  409883:	40                   	inc    %eax
  409884:	47                   	inc    %edi
  409885:	81 ff 00 04 00 00    	cmp    $0x400,%edi
  40988b:	7c d3                	jl     0x409860
  40988d:	8b f8                	mov    %eax,%edi
  40988f:	8d 45 94             	lea    -0x6c(%ebp),%eax
  409892:	2b f8                	sub    %eax,%edi
  409894:	6a 00                	push   $0x0
  409896:	8d 45 88             	lea    -0x78(%ebp),%eax
  409899:	50                   	push   %eax
  40989a:	57                   	push   %edi
  40989b:	8d 45 94             	lea    -0x6c(%ebp),%eax
  40989e:	50                   	push   %eax
  40989f:	8b 03                	mov    (%ebx),%eax
  4098a1:	ff 34 30             	push   (%eax,%esi,1)
  4098a4:	ff 15 50 d0 40 00    	call   *0x40d050  ; 0x40d050=KERNEL32.dll!WriteFile
  4098aa:	85 c0                	test   %eax,%eax
  4098ac:	74 1f                	je     0x4098cd
  4098ae:	8b 45 88             	mov    -0x78(%ebp),%eax
  4098b1:	01 45 8c             	add    %eax,-0x74(%ebp)
  4098b4:	3b c7                	cmp    %edi,%eax
  4098b6:	7c 21                	jl     0x4098d9
  4098b8:	8b 45 90             	mov    -0x70(%ebp),%eax
  4098bb:	2b 85 a8 03 00 00    	sub    0x3a8(%ebp),%eax
  4098c1:	33 ff                	xor    %edi,%edi
  4098c3:	3b 85 ac 03 00 00    	cmp    0x3ac(%ebp),%eax
  4098c9:	72 89                	jb     0x409854
  4098cb:	eb 0e                	jmp    0x4098db
  4098cd:	ff 15 0c d1 40 00    	call   *0x40d10c  ; 0x40d10c=KERNEL32.dll!GetLastError
  4098d3:	89 85 a4 03 00 00    	mov    %eax,0x3a4(%ebp)
  4098d9:	33 ff                	xor    %edi,%edi
  4098db:	8b 45 8c             	mov    -0x74(%ebp),%eax
  4098de:	3b c7                	cmp    %edi,%eax
  4098e0:	0f 85 8b 00 00 00    	jne    0x409971
  4098e6:	39 bd a4 03 00 00    	cmp    %edi,0x3a4(%ebp)
  4098ec:	74 59                	je     0x409947
  4098ee:	6a 05                	push   $0x5
  4098f0:	58                   	pop    %eax
  4098f1:	39 85 a4 03 00 00    	cmp    %eax,0x3a4(%ebp)
  4098f7:	75 40                	jne    0x409939
  4098f9:	a3 54 1d 41 00       	mov    %eax,0x411d54
  4098fe:	eb 7d                	jmp    0x40997d
  409900:	57                   	push   %edi
  409901:	8d 4d 88             	lea    -0x78(%ebp),%ecx
  409904:	51                   	push   %ecx
  409905:	ff b5 ac 03 00 00    	push   0x3ac(%ebp)
  40990b:	ff b5 a8 03 00 00    	push   0x3a8(%ebp)
  409911:	ff 30                	push   (%eax)
  409913:	ff 15 50 d0 40 00    	call   *0x40d050  ; 0x40d050=KERNEL32.dll!WriteFile
  409919:	85 c0                	test   %eax,%eax
  40991b:	74 0e                	je     0x40992b
  40991d:	8b 45 88             	mov    -0x78(%ebp),%eax
  409920:	89 bd a4 03 00 00    	mov    %edi,0x3a4(%ebp)
  409926:	89 45 8c             	mov    %eax,-0x74(%ebp)
  409929:	eb b0                	jmp    0x4098db
  40992b:	ff 15 0c d1 40 00    	call   *0x40d10c  ; 0x40d10c=KERNEL32.dll!GetLastError
  409931:	89 85 a4 03 00 00    	mov    %eax,0x3a4(%ebp)
  409937:	eb a2                	jmp    0x4098db
  409939:	ff b5 a4 03 00 00    	push   0x3a4(%ebp)
  40993f:	e8 0c 0d 00 00       	call   0x40a650
  409944:	59                   	pop    %ecx
  409945:	eb 40                	jmp    0x409987
  409947:	8b 03                	mov    (%ebx),%eax
  409949:	f6 44 30 04 40       	testb  $0x40,0x4(%eax,%esi,1)
  40994e:	74 0f                	je     0x40995f
  409950:	8b 85 a8 03 00 00    	mov    0x3a8(%ebp),%eax
  409956:	80 38 1a             	cmpb   $0x1a,(%eax)
  409959:	0f 84 b4 fe ff ff    	je     0x409813
  40995f:	c7 05 50 1d 41 00 1c 	movl   $0x1c,0x411d50
  409966:	00 00 00 
  409969:	89 3d 54 1d 41 00    	mov    %edi,0x411d54
  40996f:	eb 16                	jmp    0x409987
  409971:	2b 45 84             	sub    -0x7c(%ebp),%eax
  409974:	eb 14                	jmp    0x40998a
  409976:	83 25 54 1d 41 00 00 	andl   $0x0,0x411d54
  40997d:	c7 05 50 1d 41 00 09 	movl   $0x9,0x411d50
  409984:	00 00 00 
  409987:	83 c8 ff             	or     $0xffffffff,%eax
  40998a:	8b 8d 98 03 00 00    	mov    0x398(%ebp),%ecx
  409990:	5f                   	pop    %edi
  409991:	5e                   	pop    %esi
  409992:	5b                   	pop    %ebx
  409993:	e8 84 01 00 00       	call   0x409b1c
  409998:	81 c5 9c 03 00 00    	add    $0x39c,%ebp
  40999e:	c9                   	leave
  40999f:	c3                   	ret
  4099a0:	a1 c0 32 41 00       	mov    0x4132c0,%eax
  4099a5:	85 c0                	test   %eax,%eax
  4099a7:	56                   	push   %esi
  4099a8:	6a 14                	push   $0x14
  4099aa:	5e                   	pop    %esi
  4099ab:	75 07                	jne    0x4099b4
  4099ad:	b8 00 02 00 00       	mov    $0x200,%eax
  4099b2:	eb 06                	jmp    0x4099ba
  4099b4:	3b c6                	cmp    %esi,%eax
  4099b6:	7d 07                	jge    0x4099bf
  4099b8:	8b c6                	mov    %esi,%eax
  4099ba:	a3 c0 32 41 00       	mov    %eax,0x4132c0
  4099bf:	6a 04                	push   $0x4
  4099c1:	50                   	push   %eax
  4099c2:	e8 3d 0e 00 00       	call   0x40a804
  4099c7:	85 c0                	test   %eax,%eax
  4099c9:	59                   	pop    %ecx
  4099ca:	59                   	pop    %ecx
  4099cb:	a3 a0 22 41 00       	mov    %eax,0x4122a0
  4099d0:	75 1e                	jne    0x4099f0
  4099d2:	6a 04                	push   $0x4
  4099d4:	56                   	push   %esi
  4099d5:	89 35 c0 32 41 00    	mov    %esi,0x4132c0
  4099db:	e8 24 0e 00 00       	call   0x40a804
  4099e0:	85 c0                	test   %eax,%eax
  4099e2:	59                   	pop    %ecx
  4099e3:	59                   	pop    %ecx
  4099e4:	a3 a0 22 41 00       	mov    %eax,0x4122a0
  4099e9:	75 05                	jne    0x4099f0
  4099eb:	6a 1a                	push   $0x1a
  4099ed:	58                   	pop    %eax
  4099ee:	5e                   	pop    %esi
  4099ef:	c3                   	ret
  4099f0:	33 d2                	xor    %edx,%edx
  4099f2:	b9 d0 06 41 00       	mov    $0x4106d0,%ecx
  4099f7:	eb 05                	jmp    0x4099fe
  4099f9:	a1 a0 22 41 00       	mov    0x4122a0,%eax
  4099fe:	89 0c 02             	mov    %ecx,(%edx,%eax,1)
  409a01:	83 c1 20             	add    $0x20,%ecx
  409a04:	83 c2 04             	add    $0x4,%edx
  409a07:	81 f9 50 09 41 00    	cmp    $0x410950,%ecx
  409a0d:	7c ea                	jl     0x4099f9
  409a0f:	33 d2                	xor    %edx,%edx
  409a11:	b9 e0 06 41 00       	mov    $0x4106e0,%ecx
  409a16:	8b c2                	mov    %edx,%eax
  409a18:	c1 f8 05             	sar    $0x5,%eax
  409a1b:	8b 04 85 00 33 41 00 	mov    0x413300(,%eax,4),%eax
  409a22:	8b f2                	mov    %edx,%esi
  409a24:	83 e6 1f             	and    $0x1f,%esi
  409a27:	8b 04 f0             	mov    (%eax,%esi,8),%eax
  409a2a:	83 f8 ff             	cmp    $0xffffffff,%eax
  409a2d:	74 04                	je     0x409a33
  409a2f:	85 c0                	test   %eax,%eax
  409a31:	75 03                	jne    0x409a36
  409a33:	83 09 ff             	orl    $0xffffffff,(%ecx)
  409a36:	83 c1 20             	add    $0x20,%ecx
  409a39:	42                   	inc    %edx
  409a3a:	81 f9 40 07 41 00    	cmp    $0x410740,%ecx
  409a40:	7c d4                	jl     0x409a16
  409a42:	33 c0                	xor    %eax,%eax
  409a44:	5e                   	pop    %esi
  409a45:	c3                   	ret
  409a46:	e8 91 0f 00 00       	call   0x40a9dc
  409a4b:	80 3d 94 1d 41 00 00 	cmpb   $0x0,0x411d94
  409a52:	74 05                	je     0x409a59
  409a54:	e9 26 0e 00 00       	jmp    0x40a87f
  409a59:	c3                   	ret
  409a5a:	cc                   	int3
  409a5b:	cc                   	int3
  409a5c:	cc                   	int3
  409a5d:	cc                   	int3
  409a5e:	cc                   	int3
  409a5f:	cc                   	int3
  409a60:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  409a64:	f7 c1 03 00 00 00    	test   $0x3,%ecx
  409a6a:	74 24                	je     0x409a90
  409a6c:	8a 01                	mov    (%ecx),%al
  409a6e:	83 c1 01             	add    $0x1,%ecx
  409a71:	84 c0                	test   %al,%al
  409a73:	74 4e                	je     0x409ac3
  409a75:	f7 c1 03 00 00 00    	test   $0x3,%ecx
  409a7b:	75 ef                	jne    0x409a6c
  409a7d:	05 00 00 00 00       	add    $0x0,%eax
  409a82:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
  409a89:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
  409a90:	8b 01                	mov    (%ecx),%eax
  409a92:	ba ff fe fe 7e       	mov    $0x7efefeff,%edx
  409a97:	03 d0                	add    %eax,%edx
  409a99:	83 f0 ff             	xor    $0xffffffff,%eax
  409a9c:	33 c2                	xor    %edx,%eax
  409a9e:	83 c1 04             	add    $0x4,%ecx
  409aa1:	a9 00 01 01 81       	test   $0x81010100,%eax
  409aa6:	74 e8                	je     0x409a90
  409aa8:	8b 41 fc             	mov    -0x4(%ecx),%eax
  409aab:	84 c0                	test   %al,%al
  409aad:	74 32                	je     0x409ae1
  409aaf:	84 e4                	test   %ah,%ah
  409ab1:	74 24                	je     0x409ad7
  409ab3:	a9 00 00 ff 00       	test   $0xff0000,%eax
  409ab8:	74 13                	je     0x409acd
  409aba:	a9 00 00 00 ff       	test   $0xff000000,%eax
  409abf:	74 02                	je     0x409ac3
  409ac1:	eb cd                	jmp    0x409a90
  409ac3:	8d 41 ff             	lea    -0x1(%ecx),%eax
  409ac6:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  409aca:	2b c1                	sub    %ecx,%eax
  409acc:	c3                   	ret
  409acd:	8d 41 fe             	lea    -0x2(%ecx),%eax
  409ad0:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  409ad4:	2b c1                	sub    %ecx,%eax
  409ad6:	c3                   	ret
  409ad7:	8d 41 fd             	lea    -0x3(%ecx),%eax
  409ada:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  409ade:	2b c1                	sub    %ecx,%eax
  409ae0:	c3                   	ret
  409ae1:	8d 41 fc             	lea    -0x4(%ecx),%eax
  409ae4:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  409ae8:	2b c1                	sub    %ecx,%eax
  409aea:	c3                   	ret
  409aeb:	6a 08                	push   $0x8
  409aed:	68 98 e0 40 00       	push   $0x40e098
  409af2:	e8 c5 da ff ff       	call   0x4075bc
  409af7:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  409afb:	6a 00                	push   $0x0
  409afd:	6a 01                	push   $0x1
  409aff:	e8 50 0f 00 00       	call   0x40aa54
  409b04:	59                   	pop    %ecx
  409b05:	59                   	pop    %ecx
  409b06:	eb 07                	jmp    0x409b0f
  409b08:	33 c0                	xor    %eax,%eax
  409b0a:	40                   	inc    %eax
  409b0b:	c3                   	ret
  409b0c:	8b 65 e8             	mov    -0x18(%ebp),%esp
  409b0f:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  409b13:	6a 03                	push   $0x3
  409b15:	ff 15 4c d1 40 00    	call   *0x40d14c  ; 0x40d14c=KERNEL32.dll!ExitProcess
  409b1b:	cc                   	int3
  409b1c:	3b 0d 6c 04 41 00    	cmp    0x41046c,%ecx
  409b22:	75 01                	jne    0x409b25
  409b24:	c3                   	ret
  409b25:	e9 c1 ff ff ff       	jmp    0x409aeb
  409b2a:	cc                   	int3
  409b2b:	cc                   	int3
  409b2c:	cc                   	int3
  409b2d:	cc                   	int3
  409b2e:	cc                   	int3
  409b2f:	cc                   	int3
  409b30:	56                   	push   %esi
  409b31:	8b 44 24 14          	mov    0x14(%esp),%eax
  409b35:	0b c0                	or     %eax,%eax
  409b37:	75 28                	jne    0x409b61
  409b39:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  409b3d:	8b 44 24 0c          	mov    0xc(%esp),%eax
  409b41:	33 d2                	xor    %edx,%edx
  409b43:	f7 f1                	div    %ecx
  409b45:	8b d8                	mov    %eax,%ebx
  409b47:	8b 44 24 08          	mov    0x8(%esp),%eax
  409b4b:	f7 f1                	div    %ecx
  409b4d:	8b f0                	mov    %eax,%esi
  409b4f:	8b c3                	mov    %ebx,%eax
  409b51:	f7 64 24 10          	mull   0x10(%esp)
  409b55:	8b c8                	mov    %eax,%ecx
  409b57:	8b c6                	mov    %esi,%eax
  409b59:	f7 64 24 10          	mull   0x10(%esp)
  409b5d:	03 d1                	add    %ecx,%edx
  409b5f:	eb 47                	jmp    0x409ba8
  409b61:	8b c8                	mov    %eax,%ecx
  409b63:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  409b67:	8b 54 24 0c          	mov    0xc(%esp),%edx
  409b6b:	8b 44 24 08          	mov    0x8(%esp),%eax
  409b6f:	d1 e9                	shr    $1,%ecx
  409b71:	d1 db                	rcr    $1,%ebx
  409b73:	d1 ea                	shr    $1,%edx
  409b75:	d1 d8                	rcr    $1,%eax
  409b77:	0b c9                	or     %ecx,%ecx
  409b79:	75 f4                	jne    0x409b6f
  409b7b:	f7 f3                	div    %ebx
  409b7d:	8b f0                	mov    %eax,%esi
  409b7f:	f7 64 24 14          	mull   0x14(%esp)
  409b83:	8b c8                	mov    %eax,%ecx
  409b85:	8b 44 24 10          	mov    0x10(%esp),%eax
  409b89:	f7 e6                	mul    %esi
  409b8b:	03 d1                	add    %ecx,%edx
  409b8d:	72 0e                	jb     0x409b9d
  409b8f:	3b 54 24 0c          	cmp    0xc(%esp),%edx
  409b93:	77 08                	ja     0x409b9d
  409b95:	72 0f                	jb     0x409ba6
  409b97:	3b 44 24 08          	cmp    0x8(%esp),%eax
  409b9b:	76 09                	jbe    0x409ba6
  409b9d:	4e                   	dec    %esi
  409b9e:	2b 44 24 10          	sub    0x10(%esp),%eax
  409ba2:	1b 54 24 14          	sbb    0x14(%esp),%edx
  409ba6:	33 db                	xor    %ebx,%ebx
  409ba8:	2b 44 24 08          	sub    0x8(%esp),%eax
  409bac:	1b 54 24 0c          	sbb    0xc(%esp),%edx
  409bb0:	f7 da                	neg    %edx
  409bb2:	f7 d8                	neg    %eax
  409bb4:	83 da 00             	sbb    $0x0,%edx
  409bb7:	8b ca                	mov    %edx,%ecx
  409bb9:	8b d3                	mov    %ebx,%edx
  409bbb:	8b d9                	mov    %ecx,%ebx
  409bbd:	8b c8                	mov    %eax,%ecx
  409bbf:	8b c6                	mov    %esi,%eax
  409bc1:	5e                   	pop    %esi
  409bc2:	c2 10 00             	ret    $0x10
  409bc5:	55                   	push   %ebp
  409bc6:	8b ec                	mov    %esp,%ebp
  409bc8:	83 ec 20             	sub    $0x20,%esp
  409bcb:	53                   	push   %ebx
  409bcc:	56                   	push   %esi
  409bcd:	8b 75 08             	mov    0x8(%ebp),%esi
  409bd0:	8b 5e 08             	mov    0x8(%esi),%ebx
  409bd3:	f6 c3 03             	test   $0x3,%bl
  409bd6:	75 1b                	jne    0x409bf3
  409bd8:	64 a1 18 00 00 00    	mov    %fs:0x18,%eax
  409bde:	89 45 08             	mov    %eax,0x8(%ebp)
  409be1:	8b 45 08             	mov    0x8(%ebp),%eax
  409be4:	8b 48 08             	mov    0x8(%eax),%ecx
  409be7:	3b d9                	cmp    %ecx,%ebx
  409be9:	89 4d fc             	mov    %ecx,-0x4(%ebp)
  409bec:	72 0c                	jb     0x409bfa
  409bee:	3b 58 04             	cmp    0x4(%eax),%ebx
  409bf1:	73 07                	jae    0x409bfa
  409bf3:	33 c0                	xor    %eax,%eax
  409bf5:	e9 f0 01 00 00       	jmp    0x409dea
  409bfa:	57                   	push   %edi
  409bfb:	8b 7e 0c             	mov    0xc(%esi),%edi
  409bfe:	83 ff ff             	cmp    $0xffffffff,%edi
  409c01:	75 08                	jne    0x409c0b
  409c03:	33 c0                	xor    %eax,%eax
  409c05:	40                   	inc    %eax
  409c06:	e9 de 01 00 00       	jmp    0x409de9
  409c0b:	33 d2                	xor    %edx,%edx
  409c0d:	89 55 08             	mov    %edx,0x8(%ebp)
  409c10:	8b c3                	mov    %ebx,%eax
  409c12:	8b 08                	mov    (%eax),%ecx
  409c14:	83 f9 ff             	cmp    $0xffffffff,%ecx
  409c17:	74 08                	je     0x409c21
  409c19:	3b ca                	cmp    %edx,%ecx
  409c1b:	0f 83 45 01 00 00    	jae    0x409d66
  409c21:	83 78 04 00          	cmpl   $0x0,0x4(%eax)
  409c25:	74 03                	je     0x409c2a
  409c27:	ff 45 08             	incl   0x8(%ebp)
  409c2a:	42                   	inc    %edx
  409c2b:	83 c0 0c             	add    $0xc,%eax
  409c2e:	3b d7                	cmp    %edi,%edx
  409c30:	76 e0                	jbe    0x409c12
  409c32:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  409c36:	74 14                	je     0x409c4c
  409c38:	8b 46 f8             	mov    -0x8(%esi),%eax
  409c3b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  409c3e:	0f 82 22 01 00 00    	jb     0x409d66
  409c44:	3b c6                	cmp    %esi,%eax
  409c46:	0f 83 1a 01 00 00    	jae    0x409d66
  409c4c:	a1 b8 1f 41 00       	mov    0x411fb8,%eax
  409c51:	8b fb                	mov    %ebx,%edi
  409c53:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
  409c59:	33 f6                	xor    %esi,%esi
  409c5b:	85 c0                	test   %eax,%eax
  409c5d:	7e 12                	jle    0x409c71
  409c5f:	39 3c b5 c0 1f 41 00 	cmp    %edi,0x411fc0(,%esi,4)
  409c66:	0f 84 fe 00 00 00    	je     0x409d6a
  409c6c:	46                   	inc    %esi
  409c6d:	3b f0                	cmp    %eax,%esi
  409c6f:	7c ee                	jl     0x409c5f
  409c71:	6a 1c                	push   $0x1c
  409c73:	8d 45 e0             	lea    -0x20(%ebp),%eax
  409c76:	50                   	push   %eax
  409c77:	53                   	push   %ebx
  409c78:	ff 15 d4 d0 40 00    	call   *0x40d0d4  ; 0x40d0d4=KERNEL32.dll!VirtualQuery
  409c7e:	85 c0                	test   %eax,%eax
  409c80:	0f 84 60 01 00 00    	je     0x409de6
  409c86:	81 7d f8 00 00 00 01 	cmpl   $0x1000000,-0x8(%ebp)
  409c8d:	0f 85 53 01 00 00    	jne    0x409de6
  409c93:	f6 45 f4 cc          	testb  $0xcc,-0xc(%ebp)
  409c97:	74 56                	je     0x409cef
  409c99:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  409c9c:	66 81 39 4d 5a       	cmpw   $0x5a4d,(%ecx)
  409ca1:	0f 85 3f 01 00 00    	jne    0x409de6
  409ca7:	8b 41 3c             	mov    0x3c(%ecx),%eax
  409caa:	03 c1                	add    %ecx,%eax
  409cac:	81 38 50 45 00 00    	cmpl   $0x4550,(%eax)
  409cb2:	0f 85 2e 01 00 00    	jne    0x409de6
  409cb8:	66 81 78 18 0b 01    	cmpw   $0x10b,0x18(%eax)
  409cbe:	0f 85 22 01 00 00    	jne    0x409de6
  409cc4:	2b d9                	sub    %ecx,%ebx
  409cc6:	66 83 78 06 00       	cmpw   $0x0,0x6(%eax)
  409ccb:	0f b7 48 14          	movzwl 0x14(%eax),%ecx
  409ccf:	8d 4c 01 18          	lea    0x18(%ecx,%eax,1),%ecx
  409cd3:	0f 86 0d 01 00 00    	jbe    0x409de6
  409cd9:	8b 41 0c             	mov    0xc(%ecx),%eax
  409cdc:	3b d8                	cmp    %eax,%ebx
  409cde:	72 0f                	jb     0x409cef
  409ce0:	8b 51 08             	mov    0x8(%ecx),%edx
  409ce3:	03 d0                	add    %eax,%edx
  409ce5:	3b da                	cmp    %edx,%ebx
  409ce7:	73 06                	jae    0x409cef
  409ce9:	f6 41 27 80          	testb  $0x80,0x27(%ecx)
  409ced:	75 77                	jne    0x409d66
  409cef:	6a 01                	push   $0x1
  409cf1:	68 00 20 41 00       	push   $0x412000
  409cf6:	ff 15 d8 d0 40 00    	call   *0x40d0d8  ; 0x40d0d8=KERNEL32.dll!InterlockedExchange
  409cfc:	85 c0                	test   %eax,%eax
  409cfe:	0f 85 ff fe ff ff    	jne    0x409c03
  409d04:	8b 0d b8 1f 41 00    	mov    0x411fb8,%ecx
  409d0a:	85 c9                	test   %ecx,%ecx
  409d0c:	8b d1                	mov    %ecx,%edx
  409d0e:	7e 13                	jle    0x409d23
  409d10:	8d 04 8d bc 1f 41 00 	lea    0x411fbc(,%ecx,4),%eax
  409d17:	39 38                	cmp    %edi,(%eax)
  409d19:	74 08                	je     0x409d23
  409d1b:	4a                   	dec    %edx
  409d1c:	83 e8 04             	sub    $0x4,%eax
  409d1f:	85 d2                	test   %edx,%edx
  409d21:	7f f4                	jg     0x409d17
  409d23:	85 d2                	test   %edx,%edx
  409d25:	75 2d                	jne    0x409d54
  409d27:	6a 0f                	push   $0xf
  409d29:	5b                   	pop    %ebx
  409d2a:	3b cb                	cmp    %ebx,%ecx
  409d2c:	7f 02                	jg     0x409d30
  409d2e:	8b d9                	mov    %ecx,%ebx
  409d30:	33 d2                	xor    %edx,%edx
  409d32:	85 db                	test   %ebx,%ebx
  409d34:	7c 12                	jl     0x409d48
  409d36:	8d 04 95 c0 1f 41 00 	lea    0x411fc0(,%edx,4),%eax
  409d3d:	8b 30                	mov    (%eax),%esi
  409d3f:	42                   	inc    %edx
  409d40:	3b d3                	cmp    %ebx,%edx
  409d42:	89 38                	mov    %edi,(%eax)
  409d44:	8b fe                	mov    %esi,%edi
  409d46:	7e ee                	jle    0x409d36
  409d48:	83 f9 10             	cmp    $0x10,%ecx
  409d4b:	7d 07                	jge    0x409d54
  409d4d:	41                   	inc    %ecx
  409d4e:	89 0d b8 1f 41 00    	mov    %ecx,0x411fb8
  409d54:	6a 00                	push   $0x0
  409d56:	68 00 20 41 00       	push   $0x412000
  409d5b:	ff 15 d8 d0 40 00    	call   *0x40d0d8  ; 0x40d0d8=KERNEL32.dll!InterlockedExchange
  409d61:	e9 9d fe ff ff       	jmp    0x409c03
  409d66:	33 c0                	xor    %eax,%eax
  409d68:	eb 7f                	jmp    0x409de9
  409d6a:	85 f6                	test   %esi,%esi
  409d6c:	0f 8e 91 fe ff ff    	jle    0x409c03
  409d72:	8b 1d d8 d0 40 00    	mov    0x40d0d8,%ebx  ; 0x40d0d8=KERNEL32.dll!InterlockedExchange
  409d78:	6a 01                	push   $0x1
  409d7a:	68 00 20 41 00       	push   $0x412000
  409d7f:	ff d3                	call   *%ebx
  409d81:	85 c0                	test   %eax,%eax
  409d83:	0f 85 7a fe ff ff    	jne    0x409c03
  409d89:	39 3c b5 c0 1f 41 00 	cmp    %edi,0x411fc0(,%esi,4)
  409d90:	74 2e                	je     0x409dc0
  409d92:	a1 b8 1f 41 00       	mov    0x411fb8,%eax
  409d97:	8d 70 ff             	lea    -0x1(%eax),%esi
  409d9a:	85 f6                	test   %esi,%esi
  409d9c:	7c 10                	jl     0x409dae
  409d9e:	39 3c b5 c0 1f 41 00 	cmp    %edi,0x411fc0(,%esi,4)
  409da5:	74 03                	je     0x409daa
  409da7:	4e                   	dec    %esi
  409da8:	79 f4                	jns    0x409d9e
  409daa:	85 f6                	test   %esi,%esi
  409dac:	7d 10                	jge    0x409dbe
  409dae:	83 f8 10             	cmp    $0x10,%eax
  409db1:	7d 06                	jge    0x409db9
  409db3:	40                   	inc    %eax
  409db4:	a3 b8 1f 41 00       	mov    %eax,0x411fb8
  409db9:	8d 70 ff             	lea    -0x1(%eax),%esi
  409dbc:	eb 02                	jmp    0x409dc0
  409dbe:	74 18                	je     0x409dd8
  409dc0:	33 c9                	xor    %ecx,%ecx
  409dc2:	85 f6                	test   %esi,%esi
  409dc4:	7c 12                	jl     0x409dd8
  409dc6:	8d 04 8d c0 1f 41 00 	lea    0x411fc0(,%ecx,4),%eax
  409dcd:	8b 10                	mov    (%eax),%edx
  409dcf:	41                   	inc    %ecx
  409dd0:	3b ce                	cmp    %esi,%ecx
  409dd2:	89 38                	mov    %edi,(%eax)
  409dd4:	8b fa                	mov    %edx,%edi
  409dd6:	7e ee                	jle    0x409dc6
  409dd8:	6a 00                	push   $0x0
  409dda:	68 00 20 41 00       	push   $0x412000
  409ddf:	ff d3                	call   *%ebx
  409de1:	e9 1d fe ff ff       	jmp    0x409c03
  409de6:	83 c8 ff             	or     $0xffffffff,%eax
  409de9:	5f                   	pop    %edi
  409dea:	5e                   	pop    %esi
  409deb:	5b                   	pop    %ebx
  409dec:	c9                   	leave
  409ded:	c3                   	ret
  409dee:	56                   	push   %esi
  409def:	8b 74 24 08          	mov    0x8(%esp),%esi
  409df3:	eb 01                	jmp    0x409df6
  409df5:	46                   	inc    %esi
  409df6:	0f b6 06             	movzbl (%esi),%eax
  409df9:	50                   	push   %eax
  409dfa:	e8 9d 0d 00 00       	call   0x40ab9c
  409dff:	85 c0                	test   %eax,%eax
  409e01:	59                   	pop    %ecx
  409e02:	75 f1                	jne    0x409df5
  409e04:	0f b6 0e             	movzbl (%esi),%ecx
  409e07:	46                   	inc    %esi
  409e08:	83 f9 2d             	cmp    $0x2d,%ecx
  409e0b:	8b d1                	mov    %ecx,%edx
  409e0d:	74 05                	je     0x409e14
  409e0f:	83 f9 2b             	cmp    $0x2b,%ecx
  409e12:	75 04                	jne    0x409e18
  409e14:	0f b6 0e             	movzbl (%esi),%ecx
  409e17:	46                   	inc    %esi
  409e18:	33 c0                	xor    %eax,%eax
  409e1a:	83 f9 30             	cmp    $0x30,%ecx
  409e1d:	7c 0a                	jl     0x409e29
  409e1f:	83 f9 39             	cmp    $0x39,%ecx
  409e22:	7f 05                	jg     0x409e29
  409e24:	83 e9 30             	sub    $0x30,%ecx
  409e27:	eb 03                	jmp    0x409e2c
  409e29:	83 c9 ff             	or     $0xffffffff,%ecx
  409e2c:	83 f9 ff             	cmp    $0xffffffff,%ecx
  409e2f:	74 0c                	je     0x409e3d
  409e31:	8d 04 80             	lea    (%eax,%eax,4),%eax
  409e34:	8d 04 41             	lea    (%ecx,%eax,2),%eax
  409e37:	0f b6 0e             	movzbl (%esi),%ecx
  409e3a:	46                   	inc    %esi
  409e3b:	eb dd                	jmp    0x409e1a
  409e3d:	83 fa 2d             	cmp    $0x2d,%edx
  409e40:	5e                   	pop    %esi
  409e41:	75 02                	jne    0x409e45
  409e43:	f7 d8                	neg    %eax
  409e45:	c3                   	ret
  409e46:	cc                   	int3
  409e47:	cc                   	int3
  409e48:	cc                   	int3
  409e49:	cc                   	int3
  409e4a:	cc                   	int3
  409e4b:	cc                   	int3
  409e4c:	cc                   	int3
  409e4d:	cc                   	int3
  409e4e:	cc                   	int3
  409e4f:	cc                   	int3
  409e50:	57                   	push   %edi
  409e51:	8b 7c 24 08          	mov    0x8(%esp),%edi
  409e55:	eb 6e                	jmp    0x409ec5
  409e57:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
  409e5e:	8b ff                	mov    %edi,%edi
  409e60:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  409e64:	57                   	push   %edi
  409e65:	f7 c1 03 00 00 00    	test   $0x3,%ecx
  409e6b:	74 13                	je     0x409e80
  409e6d:	8a 01                	mov    (%ecx),%al
  409e6f:	83 c1 01             	add    $0x1,%ecx
  409e72:	84 c0                	test   %al,%al
  409e74:	74 3d                	je     0x409eb3
  409e76:	f7 c1 03 00 00 00    	test   $0x3,%ecx
  409e7c:	75 ef                	jne    0x409e6d
  409e7e:	8b ff                	mov    %edi,%edi
  409e80:	8b 01                	mov    (%ecx),%eax
  409e82:	ba ff fe fe 7e       	mov    $0x7efefeff,%edx
  409e87:	03 d0                	add    %eax,%edx
  409e89:	83 f0 ff             	xor    $0xffffffff,%eax
  409e8c:	33 c2                	xor    %edx,%eax
  409e8e:	83 c1 04             	add    $0x4,%ecx
  409e91:	a9 00 01 01 81       	test   $0x81010100,%eax
  409e96:	74 e8                	je     0x409e80
  409e98:	8b 41 fc             	mov    -0x4(%ecx),%eax
  409e9b:	84 c0                	test   %al,%al
  409e9d:	74 23                	je     0x409ec2
  409e9f:	84 e4                	test   %ah,%ah
  409ea1:	74 1a                	je     0x409ebd
  409ea3:	a9 00 00 ff 00       	test   $0xff0000,%eax
  409ea8:	74 0e                	je     0x409eb8
  409eaa:	a9 00 00 00 ff       	test   $0xff000000,%eax
  409eaf:	74 02                	je     0x409eb3
  409eb1:	eb cd                	jmp    0x409e80
  409eb3:	8d 79 ff             	lea    -0x1(%ecx),%edi
  409eb6:	eb 0d                	jmp    0x409ec5
  409eb8:	8d 79 fe             	lea    -0x2(%ecx),%edi
  409ebb:	eb 08                	jmp    0x409ec5
  409ebd:	8d 79 fd             	lea    -0x3(%ecx),%edi
  409ec0:	eb 03                	jmp    0x409ec5
  409ec2:	8d 79 fc             	lea    -0x4(%ecx),%edi
  409ec5:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  409ec9:	f7 c1 03 00 00 00    	test   $0x3,%ecx
  409ecf:	74 1d                	je     0x409eee
  409ed1:	8a 11                	mov    (%ecx),%dl
  409ed3:	83 c1 01             	add    $0x1,%ecx
  409ed6:	84 d2                	test   %dl,%dl
  409ed8:	74 66                	je     0x409f40
  409eda:	88 17                	mov    %dl,(%edi)
  409edc:	83 c7 01             	add    $0x1,%edi
  409edf:	f7 c1 03 00 00 00    	test   $0x3,%ecx
  409ee5:	75 ea                	jne    0x409ed1
  409ee7:	eb 05                	jmp    0x409eee
  409ee9:	89 17                	mov    %edx,(%edi)
  409eeb:	83 c7 04             	add    $0x4,%edi
  409eee:	ba ff fe fe 7e       	mov    $0x7efefeff,%edx
  409ef3:	8b 01                	mov    (%ecx),%eax
  409ef5:	03 d0                	add    %eax,%edx
  409ef7:	83 f0 ff             	xor    $0xffffffff,%eax
  409efa:	33 c2                	xor    %edx,%eax
  409efc:	8b 11                	mov    (%ecx),%edx
  409efe:	83 c1 04             	add    $0x4,%ecx
  409f01:	a9 00 01 01 81       	test   $0x81010100,%eax
  409f06:	74 e1                	je     0x409ee9
  409f08:	84 d2                	test   %dl,%dl
  409f0a:	74 34                	je     0x409f40
  409f0c:	84 f6                	test   %dh,%dh
  409f0e:	74 27                	je     0x409f37
  409f10:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
  409f16:	74 12                	je     0x409f2a
  409f18:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
  409f1e:	74 02                	je     0x409f22
  409f20:	eb c7                	jmp    0x409ee9
  409f22:	89 17                	mov    %edx,(%edi)
  409f24:	8b 44 24 08          	mov    0x8(%esp),%eax
  409f28:	5f                   	pop    %edi
  409f29:	c3                   	ret
  409f2a:	66 89 17             	mov    %dx,(%edi)
  409f2d:	8b 44 24 08          	mov    0x8(%esp),%eax
  409f31:	c6 47 02 00          	movb   $0x0,0x2(%edi)
  409f35:	5f                   	pop    %edi
  409f36:	c3                   	ret
  409f37:	66 89 17             	mov    %dx,(%edi)
  409f3a:	8b 44 24 08          	mov    0x8(%esp),%eax
  409f3e:	5f                   	pop    %edi
  409f3f:	c3                   	ret
  409f40:	88 17                	mov    %dl,(%edi)
  409f42:	8b 44 24 08          	mov    0x8(%esp),%eax
  409f46:	5f                   	pop    %edi
  409f47:	c3                   	ret
  409f48:	83 3d 00 34 41 00 00 	cmpl   $0x0,0x413400
  409f4f:	56                   	push   %esi
  409f50:	8b 35 7c 1d 41 00    	mov    0x411d7c,%esi
  409f56:	75 04                	jne    0x409f5c
  409f58:	33 c0                	xor    %eax,%eax
  409f5a:	5e                   	pop    %esi
  409f5b:	c3                   	ret
  409f5c:	85 f6                	test   %esi,%esi
  409f5e:	53                   	push   %ebx
  409f5f:	57                   	push   %edi
  409f60:	75 1b                	jne    0x409f7d
  409f62:	39 35 84 1d 41 00    	cmp    %esi,0x411d84
  409f68:	74 51                	je     0x409fbb
  409f6a:	e8 fc 0c 00 00       	call   0x40ac6b
  409f6f:	85 c0                	test   %eax,%eax
  409f71:	75 48                	jne    0x409fbb
  409f73:	8b 35 7c 1d 41 00    	mov    0x411d7c,%esi
  409f79:	85 f6                	test   %esi,%esi
  409f7b:	74 3e                	je     0x409fbb
  409f7d:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  409f81:	85 db                	test   %ebx,%ebx
  409f83:	74 36                	je     0x409fbb
  409f85:	53                   	push   %ebx
  409f86:	e8 d5 fa ff ff       	call   0x409a60
  409f8b:	59                   	pop    %ecx
  409f8c:	8b f8                	mov    %eax,%edi
  409f8e:	eb 25                	jmp    0x409fb5
  409f90:	50                   	push   %eax
  409f91:	e8 ca fa ff ff       	call   0x409a60
  409f96:	3b c7                	cmp    %edi,%eax
  409f98:	59                   	pop    %ecx
  409f99:	76 17                	jbe    0x409fb2
  409f9b:	8b 06                	mov    (%esi),%eax
  409f9d:	80 3c 38 3d          	cmpb   $0x3d,(%eax,%edi,1)
  409fa1:	75 0f                	jne    0x409fb2
  409fa3:	57                   	push   %edi
  409fa4:	53                   	push   %ebx
  409fa5:	50                   	push   %eax
  409fa6:	e8 81 0c 00 00       	call   0x40ac2c
  409fab:	83 c4 0c             	add    $0xc,%esp
  409fae:	85 c0                	test   %eax,%eax
  409fb0:	74 0f                	je     0x409fc1
  409fb2:	83 c6 04             	add    $0x4,%esi
  409fb5:	8b 06                	mov    (%esi),%eax
  409fb7:	85 c0                	test   %eax,%eax
  409fb9:	75 d5                	jne    0x409f90
  409fbb:	33 c0                	xor    %eax,%eax
  409fbd:	5f                   	pop    %edi
  409fbe:	5b                   	pop    %ebx
  409fbf:	5e                   	pop    %esi
  409fc0:	c3                   	ret
  409fc1:	8b 06                	mov    (%esi),%eax
  409fc3:	8d 44 38 01          	lea    0x1(%eax,%edi,1),%eax
  409fc7:	eb f4                	jmp    0x409fbd
  409fc9:	55                   	push   %ebp
  409fca:	8b ec                	mov    %esp,%ebp
  409fcc:	83 ec 10             	sub    $0x10,%esp
  409fcf:	53                   	push   %ebx
  409fd0:	33 db                	xor    %ebx,%ebx
  409fd2:	39 1d 24 20 41 00    	cmp    %ebx,0x412024
  409fd8:	56                   	push   %esi
  409fd9:	57                   	push   %edi
  409fda:	75 6d                	jne    0x40a049
  409fdc:	68 08 e1 40 00       	push   $0x40e108  ; 0x40e108='user32.dll'
  409fe1:	ff 15 30 d0 40 00    	call   *0x40d030  ; 0x40d030=KERNEL32.dll!LoadLibraryA
  409fe7:	8b f8                	mov    %eax,%edi
  409fe9:	3b fb                	cmp    %ebx,%edi
  409feb:	0f 84 93 00 00 00    	je     0x40a084
  409ff1:	8b 35 2c d0 40 00    	mov    0x40d02c,%esi  ; 0x40d02c=KERNEL32.dll!GetProcAddress
  409ff7:	68 fc e0 40 00       	push   $0x40e0fc  ; 0x40e0fc='MessageBoxA'
  409ffc:	57                   	push   %edi
  409ffd:	ff d6                	call   *%esi
  409fff:	85 c0                	test   %eax,%eax
  40a001:	a3 24 20 41 00       	mov    %eax,0x412024
  40a006:	74 7c                	je     0x40a084
  40a008:	68 ec e0 40 00       	push   $0x40e0ec  ; 0x40e0ec='GetActiveWindow'
  40a00d:	57                   	push   %edi
  40a00e:	ff d6                	call   *%esi
  40a010:	68 d8 e0 40 00       	push   $0x40e0d8  ; 0x40e0d8='GetLastActivePopup'
  40a015:	57                   	push   %edi
  40a016:	a3 28 20 41 00       	mov    %eax,0x412028
  40a01b:	ff d6                	call   *%esi
  40a01d:	83 3d 5c 1d 41 00 02 	cmpl   $0x2,0x411d5c
  40a024:	a3 2c 20 41 00       	mov    %eax,0x41202c
  40a029:	75 1e                	jne    0x40a049
  40a02b:	68 bc e0 40 00       	push   $0x40e0bc  ; 0x40e0bc='GetUserObjectInformationA'
  40a030:	57                   	push   %edi
  40a031:	ff d6                	call   *%esi
  40a033:	85 c0                	test   %eax,%eax
  40a035:	a3 34 20 41 00       	mov    %eax,0x412034
  40a03a:	74 0d                	je     0x40a049
  40a03c:	68 a4 e0 40 00       	push   $0x40e0a4  ; 0x40e0a4='GetProcessWindowStation'
  40a041:	57                   	push   %edi
  40a042:	ff d6                	call   *%esi
  40a044:	a3 30 20 41 00       	mov    %eax,0x412030
  40a049:	a1 30 20 41 00       	mov    0x412030,%eax
  40a04e:	85 c0                	test   %eax,%eax
  40a050:	74 3c                	je     0x40a08e
  40a052:	ff d0                	call   *%eax
  40a054:	85 c0                	test   %eax,%eax
  40a056:	74 1d                	je     0x40a075
  40a058:	8d 4d fc             	lea    -0x4(%ebp),%ecx
  40a05b:	51                   	push   %ecx
  40a05c:	6a 0c                	push   $0xc
  40a05e:	8d 4d f0             	lea    -0x10(%ebp),%ecx
  40a061:	51                   	push   %ecx
  40a062:	6a 01                	push   $0x1
  40a064:	50                   	push   %eax
  40a065:	ff 15 34 20 41 00    	call   *0x412034
  40a06b:	85 c0                	test   %eax,%eax
  40a06d:	74 06                	je     0x40a075
  40a06f:	f6 45 f8 01          	testb  $0x1,-0x8(%ebp)
  40a073:	75 19                	jne    0x40a08e
  40a075:	83 3d 68 1d 41 00 04 	cmpl   $0x4,0x411d68
  40a07c:	72 0a                	jb     0x40a088
  40a07e:	80 4d 12 20          	orb    $0x20,0x12(%ebp)
  40a082:	eb 29                	jmp    0x40a0ad
  40a084:	33 c0                	xor    %eax,%eax
  40a086:	eb 35                	jmp    0x40a0bd
  40a088:	80 4d 12 04          	orb    $0x4,0x12(%ebp)
  40a08c:	eb 1f                	jmp    0x40a0ad
  40a08e:	a1 28 20 41 00       	mov    0x412028,%eax
  40a093:	85 c0                	test   %eax,%eax
  40a095:	74 16                	je     0x40a0ad
  40a097:	ff d0                	call   *%eax
  40a099:	8b d8                	mov    %eax,%ebx
  40a09b:	85 db                	test   %ebx,%ebx
  40a09d:	74 0e                	je     0x40a0ad
  40a09f:	a1 2c 20 41 00       	mov    0x41202c,%eax
  40a0a4:	85 c0                	test   %eax,%eax
  40a0a6:	74 05                	je     0x40a0ad
  40a0a8:	53                   	push   %ebx
  40a0a9:	ff d0                	call   *%eax
  40a0ab:	8b d8                	mov    %eax,%ebx
  40a0ad:	ff 75 10             	push   0x10(%ebp)
  40a0b0:	ff 75 0c             	push   0xc(%ebp)
  40a0b3:	ff 75 08             	push   0x8(%ebp)
  40a0b6:	53                   	push   %ebx
  40a0b7:	ff 15 24 20 41 00    	call   *0x412024
  40a0bd:	5f                   	pop    %edi
  40a0be:	5e                   	pop    %esi
  40a0bf:	5b                   	pop    %ebx
  40a0c0:	c9                   	leave
  40a0c1:	c3                   	ret
  40a0c2:	0f b6 44 24 04       	movzbl 0x4(%esp),%eax
  40a0c7:	8a 4c 24 0c          	mov    0xc(%esp),%cl
  40a0cb:	84 88 81 20 41 00    	test   %cl,0x412081(%eax)
  40a0d1:	75 1e                	jne    0x40a0f1
  40a0d3:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  40a0d8:	74 10                	je     0x40a0ea
  40a0da:	8b 0d 68 09 41 00    	mov    0x410968,%ecx
  40a0e0:	0f b7 04 41          	movzwl (%ecx,%eax,2),%eax
  40a0e4:	23 44 24 08          	and    0x8(%esp),%eax
  40a0e8:	eb 02                	jmp    0x40a0ec
  40a0ea:	33 c0                	xor    %eax,%eax
  40a0ec:	85 c0                	test   %eax,%eax
  40a0ee:	75 01                	jne    0x40a0f1
  40a0f0:	c3                   	ret
  40a0f1:	33 c0                	xor    %eax,%eax
  40a0f3:	40                   	inc    %eax
  40a0f4:	c3                   	ret
  40a0f5:	6a 04                	push   $0x4
  40a0f7:	6a 00                	push   $0x0
  40a0f9:	ff 74 24 0c          	push   0xc(%esp)
  40a0fd:	e8 c0 ff ff ff       	call   0x40a0c2
  40a102:	83 c4 0c             	add    $0xc,%esp
  40a105:	c3                   	ret
  40a106:	2d a4 03 00 00       	sub    $0x3a4,%eax
  40a10b:	74 22                	je     0x40a12f
  40a10d:	83 e8 04             	sub    $0x4,%eax
  40a110:	74 17                	je     0x40a129
  40a112:	83 e8 0d             	sub    $0xd,%eax
  40a115:	74 0c                	je     0x40a123
  40a117:	48                   	dec    %eax
  40a118:	74 03                	je     0x40a11d
  40a11a:	33 c0                	xor    %eax,%eax
  40a11c:	c3                   	ret
  40a11d:	b8 04 04 00 00       	mov    $0x404,%eax
  40a122:	c3                   	ret
  40a123:	b8 12 04 00 00       	mov    $0x412,%eax
  40a128:	c3                   	ret
  40a129:	b8 04 08 00 00       	mov    $0x804,%eax
  40a12e:	c3                   	ret
  40a12f:	b8 11 04 00 00       	mov    $0x411,%eax
  40a134:	c3                   	ret
  40a135:	57                   	push   %edi
  40a136:	6a 40                	push   $0x40
  40a138:	33 c0                	xor    %eax,%eax
  40a13a:	59                   	pop    %ecx
  40a13b:	bf 80 20 41 00       	mov    $0x412080,%edi
  40a140:	f3 ab                	rep stos %eax,%es:(%edi)
  40a142:	aa                   	stos   %al,%es:(%edi)
  40a143:	33 c0                	xor    %eax,%eax
  40a145:	a3 84 21 41 00       	mov    %eax,0x412184
  40a14a:	a3 64 20 41 00       	mov    %eax,0x412064
  40a14f:	a3 60 20 41 00       	mov    %eax,0x412060
  40a154:	bf 90 21 41 00       	mov    $0x412190,%edi
  40a159:	ab                   	stos   %eax,%es:(%edi)
  40a15a:	ab                   	stos   %eax,%es:(%edi)
  40a15b:	ab                   	stos   %eax,%es:(%edi)
  40a15c:	5f                   	pop    %edi
  40a15d:	c3                   	ret
  40a15e:	55                   	push   %ebp
  40a15f:	8b ec                	mov    %esp,%ebp
  40a161:	81 ec 18 05 00 00    	sub    $0x518,%esp
  40a167:	a1 6c 04 41 00       	mov    0x41046c,%eax
  40a16c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  40a16f:	56                   	push   %esi
  40a170:	8d 45 e8             	lea    -0x18(%ebp),%eax
  40a173:	50                   	push   %eax
  40a174:	ff 35 84 21 41 00    	push   0x412184
  40a17a:	ff 15 c8 d0 40 00    	call   *0x40d0c8  ; 0x40d0c8=KERNEL32.dll!GetCPInfo
  40a180:	83 f8 01             	cmp    $0x1,%eax
  40a183:	be 00 01 00 00       	mov    $0x100,%esi
  40a188:	0f 85 0d 01 00 00    	jne    0x40a29b
  40a18e:	33 c0                	xor    %eax,%eax
  40a190:	88 84 05 e8 fe ff ff 	mov    %al,-0x118(%ebp,%eax,1)
  40a197:	40                   	inc    %eax
  40a198:	3b c6                	cmp    %esi,%eax
  40a19a:	72 f4                	jb     0x40a190
  40a19c:	8a 45 ee             	mov    -0x12(%ebp),%al
  40a19f:	84 c0                	test   %al,%al
  40a1a1:	c6 85 e8 fe ff ff 20 	movb   $0x20,-0x118(%ebp)
  40a1a8:	74 36                	je     0x40a1e0
  40a1aa:	53                   	push   %ebx
  40a1ab:	8d 55 ef             	lea    -0x11(%ebp),%edx
  40a1ae:	57                   	push   %edi
  40a1af:	0f b6 0a             	movzbl (%edx),%ecx
  40a1b2:	0f b6 c0             	movzbl %al,%eax
  40a1b5:	3b c1                	cmp    %ecx,%eax
  40a1b7:	77 1d                	ja     0x40a1d6
  40a1b9:	2b c8                	sub    %eax,%ecx
  40a1bb:	41                   	inc    %ecx
  40a1bc:	8b d9                	mov    %ecx,%ebx
  40a1be:	c1 e9 02             	shr    $0x2,%ecx
  40a1c1:	8d bc 05 e8 fe ff ff 	lea    -0x118(%ebp,%eax,1),%edi
  40a1c8:	b8 20 20 20 20       	mov    $0x20202020,%eax
  40a1cd:	f3 ab                	rep stos %eax,%es:(%edi)
  40a1cf:	8b cb                	mov    %ebx,%ecx
  40a1d1:	83 e1 03             	and    $0x3,%ecx
  40a1d4:	f3 aa                	rep stos %al,%es:(%edi)
  40a1d6:	42                   	inc    %edx
  40a1d7:	8a 02                	mov    (%edx),%al
  40a1d9:	42                   	inc    %edx
  40a1da:	84 c0                	test   %al,%al
  40a1dc:	75 d1                	jne    0x40a1af
  40a1de:	5f                   	pop    %edi
  40a1df:	5b                   	pop    %ebx
  40a1e0:	6a 00                	push   $0x0
  40a1e2:	ff 35 60 20 41 00    	push   0x412060
  40a1e8:	8d 85 e8 fa ff ff    	lea    -0x518(%ebp),%eax
  40a1ee:	ff 35 84 21 41 00    	push   0x412184
  40a1f4:	50                   	push   %eax
  40a1f5:	56                   	push   %esi
  40a1f6:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
  40a1fc:	50                   	push   %eax
  40a1fd:	6a 01                	push   $0x1
  40a1ff:	e8 b3 0e 00 00       	call   0x40b0b7
  40a204:	6a 00                	push   $0x0
  40a206:	ff 35 84 21 41 00    	push   0x412184
  40a20c:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
  40a212:	56                   	push   %esi
  40a213:	50                   	push   %eax
  40a214:	56                   	push   %esi
  40a215:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
  40a21b:	50                   	push   %eax
  40a21c:	56                   	push   %esi
  40a21d:	ff 35 60 20 41 00    	push   0x412060
  40a223:	e8 d3 0a 00 00       	call   0x40acfb
  40a228:	6a 00                	push   $0x0
  40a22a:	ff 35 84 21 41 00    	push   0x412184
  40a230:	8d 85 e8 fc ff ff    	lea    -0x318(%ebp),%eax
  40a236:	56                   	push   %esi
  40a237:	50                   	push   %eax
  40a238:	56                   	push   %esi
  40a239:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
  40a23f:	50                   	push   %eax
  40a240:	68 00 02 00 00       	push   $0x200
  40a245:	ff 35 60 20 41 00    	push   0x412060
  40a24b:	e8 ab 0a 00 00       	call   0x40acfb
  40a250:	83 c4 5c             	add    $0x5c,%esp
  40a253:	33 c0                	xor    %eax,%eax
  40a255:	66 8b 8c 45 e8 fa ff 	mov    -0x518(%ebp,%eax,2),%cx
  40a25c:	ff 
  40a25d:	f6 c1 01             	test   $0x1,%cl
  40a260:	74 16                	je     0x40a278
  40a262:	80 88 81 20 41 00 10 	orb    $0x10,0x412081(%eax)
  40a269:	8a 8c 05 e8 fd ff ff 	mov    -0x218(%ebp,%eax,1),%cl
  40a270:	88 88 a0 21 41 00    	mov    %cl,0x4121a0(%eax)
  40a276:	eb 1c                	jmp    0x40a294
  40a278:	f6 c1 02             	test   $0x2,%cl
  40a27b:	74 10                	je     0x40a28d
  40a27d:	80 88 81 20 41 00 20 	orb    $0x20,0x412081(%eax)
  40a284:	8a 8c 05 e8 fc ff ff 	mov    -0x318(%ebp,%eax,1),%cl
  40a28b:	eb e3                	jmp    0x40a270
  40a28d:	c6 80 a0 21 41 00 00 	movb   $0x0,0x4121a0(%eax)
  40a294:	40                   	inc    %eax
  40a295:	3b c6                	cmp    %esi,%eax
  40a297:	72 bc                	jb     0x40a255
  40a299:	eb 44                	jmp    0x40a2df
  40a29b:	33 c0                	xor    %eax,%eax
  40a29d:	83 f8 41             	cmp    $0x41,%eax
  40a2a0:	72 19                	jb     0x40a2bb
  40a2a2:	83 f8 5a             	cmp    $0x5a,%eax
  40a2a5:	77 14                	ja     0x40a2bb
  40a2a7:	80 88 81 20 41 00 10 	orb    $0x10,0x412081(%eax)
  40a2ae:	8a c8                	mov    %al,%cl
  40a2b0:	80 c1 20             	add    $0x20,%cl
  40a2b3:	88 88 a0 21 41 00    	mov    %cl,0x4121a0(%eax)
  40a2b9:	eb 1f                	jmp    0x40a2da
  40a2bb:	83 f8 61             	cmp    $0x61,%eax
  40a2be:	72 13                	jb     0x40a2d3
  40a2c0:	83 f8 7a             	cmp    $0x7a,%eax
  40a2c3:	77 0e                	ja     0x40a2d3
  40a2c5:	80 88 81 20 41 00 20 	orb    $0x20,0x412081(%eax)
  40a2cc:	8a c8                	mov    %al,%cl
  40a2ce:	80 e9 20             	sub    $0x20,%cl
  40a2d1:	eb e0                	jmp    0x40a2b3
  40a2d3:	c6 80 a0 21 41 00 00 	movb   $0x0,0x4121a0(%eax)
  40a2da:	40                   	inc    %eax
  40a2db:	3b c6                	cmp    %esi,%eax
  40a2dd:	72 be                	jb     0x40a29d
  40a2df:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  40a2e2:	5e                   	pop    %esi
  40a2e3:	e8 34 f8 ff ff       	call   0x409b1c
  40a2e8:	c9                   	leave
  40a2e9:	c3                   	ret
  40a2ea:	55                   	push   %ebp
  40a2eb:	8b ec                	mov    %esp,%ebp
  40a2ed:	83 ec 1c             	sub    $0x1c,%esp
  40a2f0:	a1 6c 04 41 00       	mov    0x41046c,%eax
  40a2f5:	53                   	push   %ebx
  40a2f6:	56                   	push   %esi
  40a2f7:	8b 75 08             	mov    0x8(%ebp),%esi
  40a2fa:	33 db                	xor    %ebx,%ebx
  40a2fc:	83 fe fe             	cmp    $0xfffffffe,%esi
  40a2ff:	89 45 fc             	mov    %eax,-0x4(%ebp)
  40a302:	57                   	push   %edi
  40a303:	89 1d 38 20 41 00    	mov    %ebx,0x412038
  40a309:	75 12                	jne    0x40a31d
  40a30b:	c7 05 38 20 41 00 01 	movl   $0x1,0x412038
  40a312:	00 00 00 
  40a315:	ff 15 cc d0 40 00    	call   *0x40d0cc  ; 0x40d0cc=KERNEL32.dll!GetOEMCP
  40a31b:	eb 2b                	jmp    0x40a348
  40a31d:	83 fe fd             	cmp    $0xfffffffd,%esi
  40a320:	75 12                	jne    0x40a334
  40a322:	c7 05 38 20 41 00 01 	movl   $0x1,0x412038
  40a329:	00 00 00 
  40a32c:	ff 15 d0 d0 40 00    	call   *0x40d0d0  ; 0x40d0d0=KERNEL32.dll!GetACP
  40a332:	eb 14                	jmp    0x40a348
  40a334:	83 fe fc             	cmp    $0xfffffffc,%esi
  40a337:	75 14                	jne    0x40a34d
  40a339:	a1 1c 20 41 00       	mov    0x41201c,%eax
  40a33e:	c7 05 38 20 41 00 01 	movl   $0x1,0x412038
  40a345:	00 00 00 
  40a348:	89 45 08             	mov    %eax,0x8(%ebp)
  40a34b:	8b f0                	mov    %eax,%esi
  40a34d:	3b 35 84 21 41 00    	cmp    0x412184,%esi
  40a353:	0f 84 63 01 00 00    	je     0x40a4bc
  40a359:	3b f3                	cmp    %ebx,%esi
  40a35b:	0f 84 51 01 00 00    	je     0x40a4b2
  40a361:	33 d2                	xor    %edx,%edx
  40a363:	33 c0                	xor    %eax,%eax
  40a365:	39 b0 80 09 41 00    	cmp    %esi,0x410980(%eax)
  40a36b:	74 67                	je     0x40a3d4
  40a36d:	83 c0 30             	add    $0x30,%eax
  40a370:	42                   	inc    %edx
  40a371:	3d f0 00 00 00       	cmp    $0xf0,%eax
  40a376:	72 ed                	jb     0x40a365
  40a378:	8d 45 e8             	lea    -0x18(%ebp),%eax
  40a37b:	50                   	push   %eax
  40a37c:	56                   	push   %esi
  40a37d:	ff 15 c8 d0 40 00    	call   *0x40d0c8  ; 0x40d0c8=KERNEL32.dll!GetCPInfo
  40a383:	83 f8 01             	cmp    $0x1,%eax
  40a386:	0f 85 1e 01 00 00    	jne    0x40a4aa
  40a38c:	6a 40                	push   $0x40
  40a38e:	33 c0                	xor    %eax,%eax
  40a390:	59                   	pop    %ecx
  40a391:	bf 80 20 41 00       	mov    $0x412080,%edi
  40a396:	f3 ab                	rep stos %eax,%es:(%edi)
  40a398:	aa                   	stos   %al,%es:(%edi)
  40a399:	33 ff                	xor    %edi,%edi
  40a39b:	47                   	inc    %edi
  40a39c:	39 7d e8             	cmp    %edi,-0x18(%ebp)
  40a39f:	89 35 84 21 41 00    	mov    %esi,0x412184
  40a3a5:	89 1d 60 20 41 00    	mov    %ebx,0x412060
  40a3ab:	0f 86 e7 00 00 00    	jbe    0x40a498
  40a3b1:	80 7d ee 00          	cmpb   $0x0,-0x12(%ebp)
  40a3b5:	0f 84 b8 00 00 00    	je     0x40a473
  40a3bb:	8d 4d ef             	lea    -0x11(%ebp),%ecx
  40a3be:	8a 11                	mov    (%ecx),%dl
  40a3c0:	84 d2                	test   %dl,%dl
  40a3c2:	0f 84 ab 00 00 00    	je     0x40a473
  40a3c8:	0f b6 41 ff          	movzbl -0x1(%ecx),%eax
  40a3cc:	0f b6 d2             	movzbl %dl,%edx
  40a3cf:	e9 8f 00 00 00       	jmp    0x40a463
  40a3d4:	6a 40                	push   $0x40
  40a3d6:	33 c0                	xor    %eax,%eax
  40a3d8:	59                   	pop    %ecx
  40a3d9:	bf 80 20 41 00       	mov    $0x412080,%edi
  40a3de:	f3 ab                	rep stos %eax,%es:(%edi)
  40a3e0:	8d 0c 52             	lea    (%edx,%edx,2),%ecx
  40a3e3:	c1 e1 04             	shl    $0x4,%ecx
  40a3e6:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  40a3e9:	aa                   	stos   %al,%es:(%edi)
  40a3ea:	8d 99 90 09 41 00    	lea    0x410990(%ecx),%ebx
  40a3f0:	8a 03                	mov    (%ebx),%al
  40a3f2:	8b f3                	mov    %ebx,%esi
  40a3f4:	eb 29                	jmp    0x40a41f
  40a3f6:	8a 56 01             	mov    0x1(%esi),%dl
  40a3f9:	84 d2                	test   %dl,%dl
  40a3fb:	74 26                	je     0x40a423
  40a3fd:	0f b6 c0             	movzbl %al,%eax
  40a400:	0f b6 fa             	movzbl %dl,%edi
  40a403:	3b c7                	cmp    %edi,%eax
  40a405:	77 14                	ja     0x40a41b
  40a407:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  40a40a:	8a 92 78 09 41 00    	mov    0x410978(%edx),%dl
  40a410:	08 90 81 20 41 00    	or     %dl,0x412081(%eax)
  40a416:	40                   	inc    %eax
  40a417:	3b c7                	cmp    %edi,%eax
  40a419:	76 f5                	jbe    0x40a410
  40a41b:	46                   	inc    %esi
  40a41c:	46                   	inc    %esi
  40a41d:	8a 06                	mov    (%esi),%al
  40a41f:	84 c0                	test   %al,%al
  40a421:	75 d3                	jne    0x40a3f6
  40a423:	ff 45 e4             	incl   -0x1c(%ebp)
  40a426:	83 c3 08             	add    $0x8,%ebx
  40a429:	83 7d e4 04          	cmpl   $0x4,-0x1c(%ebp)
  40a42d:	72 c1                	jb     0x40a3f0
  40a42f:	8b 45 08             	mov    0x8(%ebp),%eax
  40a432:	a3 84 21 41 00       	mov    %eax,0x412184
  40a437:	c7 05 64 20 41 00 01 	movl   $0x1,0x412064
  40a43e:	00 00 00 
  40a441:	e8 c0 fc ff ff       	call   0x40a106
  40a446:	8d b1 84 09 41 00    	lea    0x410984(%ecx),%esi
  40a44c:	bf 90 21 41 00       	mov    $0x412190,%edi
  40a451:	a5                   	movsl  %ds:(%esi),%es:(%edi)
  40a452:	a5                   	movsl  %ds:(%esi),%es:(%edi)
  40a453:	a3 60 20 41 00       	mov    %eax,0x412060
  40a458:	a5                   	movsl  %ds:(%esi),%es:(%edi)
  40a459:	eb 5c                	jmp    0x40a4b7
  40a45b:	80 88 81 20 41 00 04 	orb    $0x4,0x412081(%eax)
  40a462:	40                   	inc    %eax
  40a463:	3b c2                	cmp    %edx,%eax
  40a465:	76 f4                	jbe    0x40a45b
  40a467:	41                   	inc    %ecx
  40a468:	41                   	inc    %ecx
  40a469:	80 79 ff 00          	cmpb   $0x0,-0x1(%ecx)
  40a46d:	0f 85 4b ff ff ff    	jne    0x40a3be
  40a473:	8b c7                	mov    %edi,%eax
  40a475:	80 88 81 20 41 00 08 	orb    $0x8,0x412081(%eax)
  40a47c:	40                   	inc    %eax
  40a47d:	3d ff 00 00 00       	cmp    $0xff,%eax
  40a482:	72 f1                	jb     0x40a475
  40a484:	8b c6                	mov    %esi,%eax
  40a486:	e8 7b fc ff ff       	call   0x40a106
  40a48b:	a3 60 20 41 00       	mov    %eax,0x412060
  40a490:	89 3d 64 20 41 00    	mov    %edi,0x412064
  40a496:	eb 06                	jmp    0x40a49e
  40a498:	89 1d 64 20 41 00    	mov    %ebx,0x412064
  40a49e:	33 c0                	xor    %eax,%eax
  40a4a0:	bf 90 21 41 00       	mov    $0x412190,%edi
  40a4a5:	ab                   	stos   %eax,%es:(%edi)
  40a4a6:	ab                   	stos   %eax,%es:(%edi)
  40a4a7:	ab                   	stos   %eax,%es:(%edi)
  40a4a8:	eb 0d                	jmp    0x40a4b7
  40a4aa:	39 1d 38 20 41 00    	cmp    %ebx,0x412038
  40a4b0:	74 0e                	je     0x40a4c0
  40a4b2:	e8 7e fc ff ff       	call   0x40a135
  40a4b7:	e8 a2 fc ff ff       	call   0x40a15e
  40a4bc:	33 c0                	xor    %eax,%eax
  40a4be:	eb 03                	jmp    0x40a4c3
  40a4c0:	83 c8 ff             	or     $0xffffffff,%eax
  40a4c3:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  40a4c6:	5f                   	pop    %edi
  40a4c7:	5e                   	pop    %esi
  40a4c8:	5b                   	pop    %ebx
  40a4c9:	e8 4e f6 ff ff       	call   0x409b1c
  40a4ce:	c9                   	leave
  40a4cf:	c3                   	ret
  40a4d0:	83 3d 0c 34 41 00 00 	cmpl   $0x0,0x41340c
  40a4d7:	75 12                	jne    0x40a4eb
  40a4d9:	6a fd                	push   $0xfffffffd
  40a4db:	e8 0a fe ff ff       	call   0x40a2ea
  40a4e0:	59                   	pop    %ecx
  40a4e1:	c7 05 0c 34 41 00 01 	movl   $0x1,0x41340c
  40a4e8:	00 00 00 
  40a4eb:	33 c0                	xor    %eax,%eax
  40a4ed:	c3                   	ret
  40a4ee:	8b 0d b8 06 41 00    	mov    0x4106b8,%ecx
  40a4f4:	b8 38 06 41 00       	mov    $0x410638,%eax
  40a4f9:	56                   	push   %esi
  40a4fa:	39 50 04             	cmp    %edx,0x4(%eax)
  40a4fd:	74 11                	je     0x40a510
  40a4ff:	8d 34 49             	lea    (%ecx,%ecx,2),%esi
  40a502:	83 c0 0c             	add    $0xc,%eax
  40a505:	8d 34 b5 38 06 41 00 	lea    0x410638(,%esi,4),%esi
  40a50c:	3b c6                	cmp    %esi,%eax
  40a50e:	72 ea                	jb     0x40a4fa
  40a510:	8d 0c 49             	lea    (%ecx,%ecx,2),%ecx
  40a513:	8d 0c 8d 38 06 41 00 	lea    0x410638(,%ecx,4),%ecx
  40a51a:	3b c1                	cmp    %ecx,%eax
  40a51c:	5e                   	pop    %esi
  40a51d:	73 05                	jae    0x40a524
  40a51f:	39 50 04             	cmp    %edx,0x4(%eax)
  40a522:	74 02                	je     0x40a526
  40a524:	33 c0                	xor    %eax,%eax
  40a526:	c3                   	ret
  40a527:	55                   	push   %ebp
  40a528:	8b ec                	mov    %esp,%ebp
  40a52a:	56                   	push   %esi
  40a52b:	57                   	push   %edi
  40a52c:	8b 7d 08             	mov    0x8(%ebp),%edi
  40a52f:	8b c7                	mov    %edi,%eax
  40a531:	48                   	dec    %eax
  40a532:	48                   	dec    %eax
  40a533:	74 58                	je     0x40a58d
  40a535:	48                   	dec    %eax
  40a536:	48                   	dec    %eax
  40a537:	74 46                	je     0x40a57f
  40a539:	83 e8 04             	sub    $0x4,%eax
  40a53c:	74 41                	je     0x40a57f
  40a53e:	83 e8 03             	sub    $0x3,%eax
  40a541:	74 3c                	je     0x40a57f
  40a543:	83 e8 04             	sub    $0x4,%eax
  40a546:	74 2a                	je     0x40a572
  40a548:	83 e8 06             	sub    $0x6,%eax
  40a54b:	74 18                	je     0x40a565
  40a54d:	48                   	dec    %eax
  40a54e:	74 08                	je     0x40a558
  40a550:	83 c8 ff             	or     $0xffffffff,%eax
  40a553:	e9 f4 00 00 00       	jmp    0x40a64c
  40a558:	8b 35 44 20 41 00    	mov    0x412044,%esi
  40a55e:	b8 44 20 41 00       	mov    $0x412044,%eax
  40a563:	eb 33                	jmp    0x40a598
  40a565:	8b 35 40 20 41 00    	mov    0x412040,%esi
  40a56b:	b8 40 20 41 00       	mov    $0x412040,%eax
  40a570:	eb 26                	jmp    0x40a598
  40a572:	8b 35 48 20 41 00    	mov    0x412048,%esi
  40a578:	b8 48 20 41 00       	mov    $0x412048,%eax
  40a57d:	eb 19                	jmp    0x40a598
  40a57f:	8b d7                	mov    %edi,%edx
  40a581:	e8 68 ff ff ff       	call   0x40a4ee
  40a586:	83 c0 08             	add    $0x8,%eax
  40a589:	8b 30                	mov    (%eax),%esi
  40a58b:	eb 0b                	jmp    0x40a598
  40a58d:	8b 35 3c 20 41 00    	mov    0x41203c,%esi
  40a593:	b8 3c 20 41 00       	mov    $0x41203c,%eax
  40a598:	83 fe 01             	cmp    $0x1,%esi
  40a59b:	0f 84 a9 00 00 00    	je     0x40a64a
  40a5a1:	85 f6                	test   %esi,%esi
  40a5a3:	75 07                	jne    0x40a5ac
  40a5a5:	6a 03                	push   $0x3
  40a5a7:	e8 e0 c5 ff ff       	call   0x406b8c
  40a5ac:	53                   	push   %ebx
  40a5ad:	6a 08                	push   $0x8
  40a5af:	59                   	pop    %ecx
  40a5b0:	3b f9                	cmp    %ecx,%edi
  40a5b2:	74 0a                	je     0x40a5be
  40a5b4:	83 ff 0b             	cmp    $0xb,%edi
  40a5b7:	74 05                	je     0x40a5be
  40a5b9:	83 ff 04             	cmp    $0x4,%edi
  40a5bc:	75 26                	jne    0x40a5e4
  40a5be:	8b 1d 94 1e 41 00    	mov    0x411e94,%ebx
  40a5c4:	83 25 94 1e 41 00 00 	andl   $0x0,0x411e94
  40a5cb:	3b f9                	cmp    %ecx,%edi
  40a5cd:	75 44                	jne    0x40a613
  40a5cf:	8b 15 bc 06 41 00    	mov    0x4106bc,%edx
  40a5d5:	89 55 08             	mov    %edx,0x8(%ebp)
  40a5d8:	c7 05 bc 06 41 00 8c 	movl   $0x8c,0x4106bc
  40a5df:	00 00 00 
  40a5e2:	eb 03                	jmp    0x40a5e7
  40a5e4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  40a5e7:	3b f9                	cmp    %ecx,%edi
  40a5e9:	75 28                	jne    0x40a613
  40a5eb:	a1 b0 06 41 00       	mov    0x4106b0,%eax
  40a5f0:	8b 0d b4 06 41 00    	mov    0x4106b4,%ecx
  40a5f6:	03 c8                	add    %eax,%ecx
  40a5f8:	3b c1                	cmp    %ecx,%eax
  40a5fa:	7d 1e                	jge    0x40a61a
  40a5fc:	8d 14 40             	lea    (%eax,%eax,2),%edx
  40a5ff:	8d 14 95 40 06 41 00 	lea    0x410640(,%edx,4),%edx
  40a606:	2b c8                	sub    %eax,%ecx
  40a608:	83 22 00             	andl   $0x0,(%edx)
  40a60b:	83 c2 0c             	add    $0xc,%edx
  40a60e:	49                   	dec    %ecx
  40a60f:	75 f7                	jne    0x40a608
  40a611:	eb 07                	jmp    0x40a61a
  40a613:	83 20 00             	andl   $0x0,(%eax)
  40a616:	3b f9                	cmp    %ecx,%edi
  40a618:	75 0e                	jne    0x40a628
  40a61a:	ff 35 bc 06 41 00    	push   0x4106bc
  40a620:	6a 08                	push   $0x8
  40a622:	ff d6                	call   *%esi
  40a624:	59                   	pop    %ecx
  40a625:	59                   	pop    %ecx
  40a626:	eb 0e                	jmp    0x40a636
  40a628:	57                   	push   %edi
  40a629:	ff d6                	call   *%esi
  40a62b:	83 ff 0b             	cmp    $0xb,%edi
  40a62e:	59                   	pop    %ecx
  40a62f:	74 05                	je     0x40a636
  40a631:	83 ff 04             	cmp    $0x4,%edi
  40a634:	75 13                	jne    0x40a649
  40a636:	83 ff 08             	cmp    $0x8,%edi
  40a639:	89 1d 94 1e 41 00    	mov    %ebx,0x411e94
  40a63f:	75 08                	jne    0x40a649
  40a641:	8b 45 08             	mov    0x8(%ebp),%eax
  40a644:	a3 bc 06 41 00       	mov    %eax,0x4106bc
  40a649:	5b                   	pop    %ebx
  40a64a:	33 c0                	xor    %eax,%eax
  40a64c:	5f                   	pop    %edi
  40a64d:	5e                   	pop    %esi
  40a64e:	5d                   	pop    %ebp
  40a64f:	c3                   	ret
  40a650:	8b 44 24 04          	mov    0x4(%esp),%eax
  40a654:	a3 54 1d 41 00       	mov    %eax,0x411d54
  40a659:	33 c9                	xor    %ecx,%ecx
  40a65b:	3b 04 cd 70 0a 41 00 	cmp    0x410a70(,%ecx,8),%eax
  40a662:	74 1b                	je     0x40a67f
  40a664:	41                   	inc    %ecx
  40a665:	83 f9 2d             	cmp    $0x2d,%ecx
  40a668:	72 f1                	jb     0x40a65b
  40a66a:	83 f8 13             	cmp    $0x13,%eax
  40a66d:	72 1d                	jb     0x40a68c
  40a66f:	83 f8 24             	cmp    $0x24,%eax
  40a672:	77 18                	ja     0x40a68c
  40a674:	c7 05 50 1d 41 00 0d 	movl   $0xd,0x411d50
  40a67b:	00 00 00 
  40a67e:	c3                   	ret
  40a67f:	8b 04 cd 74 0a 41 00 	mov    0x410a74(,%ecx,8),%eax
  40a686:	a3 50 1d 41 00       	mov    %eax,0x411d50
  40a68b:	c3                   	ret
  40a68c:	3d bc 00 00 00       	cmp    $0xbc,%eax
  40a691:	72 11                	jb     0x40a6a4
  40a693:	3d ca 00 00 00       	cmp    $0xca,%eax
  40a698:	c7 05 50 1d 41 00 08 	movl   $0x8,0x411d50
  40a69f:	00 00 00 
  40a6a2:	76 0a                	jbe    0x40a6ae
  40a6a4:	c7 05 50 1d 41 00 16 	movl   $0x16,0x411d50
  40a6ab:	00 00 00 
  40a6ae:	c3                   	ret
  40a6af:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  40a6b3:	3b 0d e8 32 41 00    	cmp    0x4132e8,%ecx
  40a6b9:	56                   	push   %esi
  40a6ba:	57                   	push   %edi
  40a6bb:	73 55                	jae    0x40a712
  40a6bd:	8b c1                	mov    %ecx,%eax
  40a6bf:	c1 f8 05             	sar    $0x5,%eax
  40a6c2:	8b f1                	mov    %ecx,%esi
  40a6c4:	8d 3c 85 00 33 41 00 	lea    0x413300(,%eax,4),%edi
  40a6cb:	8b 07                	mov    (%edi),%eax
  40a6cd:	83 e6 1f             	and    $0x1f,%esi
  40a6d0:	c1 e6 03             	shl    $0x3,%esi
  40a6d3:	03 c6                	add    %esi,%eax
  40a6d5:	f6 40 04 01          	testb  $0x1,0x4(%eax)
  40a6d9:	74 37                	je     0x40a712
  40a6db:	83 38 ff             	cmpl   $0xffffffff,(%eax)
  40a6de:	74 32                	je     0x40a712
  40a6e0:	83 3d 64 04 41 00 01 	cmpl   $0x1,0x410464
  40a6e7:	75 1f                	jne    0x40a708
  40a6e9:	33 c0                	xor    %eax,%eax
  40a6eb:	2b c8                	sub    %eax,%ecx
  40a6ed:	74 10                	je     0x40a6ff
  40a6ef:	49                   	dec    %ecx
  40a6f0:	74 08                	je     0x40a6fa
  40a6f2:	49                   	dec    %ecx
  40a6f3:	75 13                	jne    0x40a708
  40a6f5:	50                   	push   %eax
  40a6f6:	6a f4                	push   $0xfffffff4
  40a6f8:	eb 08                	jmp    0x40a702
  40a6fa:	50                   	push   %eax
  40a6fb:	6a f5                	push   $0xfffffff5
  40a6fd:	eb 03                	jmp    0x40a702
  40a6ff:	50                   	push   %eax
  40a700:	6a f6                	push   $0xfffffff6
  40a702:	ff 15 c4 d0 40 00    	call   *0x40d0c4  ; 0x40d0c4=KERNEL32.dll!SetStdHandle
  40a708:	8b 07                	mov    (%edi),%eax
  40a70a:	83 0c 06 ff          	orl    $0xffffffff,(%esi,%eax,1)
  40a70e:	33 c0                	xor    %eax,%eax
  40a710:	eb 14                	jmp    0x40a726
  40a712:	83 25 54 1d 41 00 00 	andl   $0x0,0x411d54
  40a719:	c7 05 50 1d 41 00 09 	movl   $0x9,0x411d50
  40a720:	00 00 00 
  40a723:	83 c8 ff             	or     $0xffffffff,%eax
  40a726:	5f                   	pop    %edi
  40a727:	5e                   	pop    %esi
  40a728:	c3                   	ret
  40a729:	8b 44 24 04          	mov    0x4(%esp),%eax
  40a72d:	3b 05 e8 32 41 00    	cmp    0x4132e8,%eax
  40a733:	73 1b                	jae    0x40a750
  40a735:	8b c8                	mov    %eax,%ecx
  40a737:	c1 f9 05             	sar    $0x5,%ecx
  40a73a:	8b 0c 8d 00 33 41 00 	mov    0x413300(,%ecx,4),%ecx
  40a741:	83 e0 1f             	and    $0x1f,%eax
  40a744:	8d 04 c1             	lea    (%ecx,%eax,8),%eax
  40a747:	f6 40 04 01          	testb  $0x1,0x4(%eax)
  40a74b:	74 03                	je     0x40a750
  40a74d:	8b 00                	mov    (%eax),%eax
  40a74f:	c3                   	ret
  40a750:	83 25 54 1d 41 00 00 	andl   $0x0,0x411d54
  40a757:	c7 05 50 1d 41 00 09 	movl   $0x9,0x411d50
  40a75e:	00 00 00 
  40a761:	83 c8 ff             	or     $0xffffffff,%eax
  40a764:	c3                   	ret
  40a765:	55                   	push   %ebp
  40a766:	8b ec                	mov    %esp,%ebp
  40a768:	51                   	push   %ecx
  40a769:	51                   	push   %ecx
  40a76a:	8b 45 08             	mov    0x8(%ebp),%eax
  40a76d:	3b 05 e8 32 41 00    	cmp    0x4132e8,%eax
  40a773:	56                   	push   %esi
  40a774:	57                   	push   %edi
  40a775:	73 72                	jae    0x40a7e9
  40a777:	8b c8                	mov    %eax,%ecx
  40a779:	c1 f9 05             	sar    $0x5,%ecx
  40a77c:	8b f0                	mov    %eax,%esi
  40a77e:	83 e6 1f             	and    $0x1f,%esi
  40a781:	8d 3c 8d 00 33 41 00 	lea    0x413300(,%ecx,4),%edi
  40a788:	8b 0f                	mov    (%edi),%ecx
  40a78a:	c1 e6 03             	shl    $0x3,%esi
  40a78d:	f6 44 31 04 01       	testb  $0x1,0x4(%ecx,%esi,1)
  40a792:	74 55                	je     0x40a7e9
  40a794:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  40a797:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  40a79a:	8b 4d 10             	mov    0x10(%ebp),%ecx
  40a79d:	50                   	push   %eax
  40a79e:	89 4d fc             	mov    %ecx,-0x4(%ebp)
  40a7a1:	e8 83 ff ff ff       	call   0x40a729
  40a7a6:	83 f8 ff             	cmp    $0xffffffff,%eax
  40a7a9:	59                   	pop    %ecx
  40a7aa:	74 44                	je     0x40a7f0
  40a7ac:	ff 75 14             	push   0x14(%ebp)
  40a7af:	8d 4d fc             	lea    -0x4(%ebp),%ecx
  40a7b2:	51                   	push   %ecx
  40a7b3:	ff 75 f8             	push   -0x8(%ebp)
  40a7b6:	50                   	push   %eax
  40a7b7:	ff 15 54 d0 40 00    	call   *0x40d054  ; 0x40d054=KERNEL32.dll!SetFilePointer
  40a7bd:	83 f8 ff             	cmp    $0xffffffff,%eax
  40a7c0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  40a7c3:	75 13                	jne    0x40a7d8
  40a7c5:	ff 15 0c d1 40 00    	call   *0x40d10c  ; 0x40d10c=KERNEL32.dll!GetLastError
  40a7cb:	85 c0                	test   %eax,%eax
  40a7cd:	74 09                	je     0x40a7d8
  40a7cf:	50                   	push   %eax
  40a7d0:	e8 7b fe ff ff       	call   0x40a650
  40a7d5:	59                   	pop    %ecx
  40a7d6:	eb 22                	jmp    0x40a7fa
  40a7d8:	8b 07                	mov    (%edi),%eax
  40a7da:	8d 44 30 04          	lea    0x4(%eax,%esi,1),%eax
  40a7de:	80 20 fd             	andb   $0xfd,(%eax)
  40a7e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
  40a7e4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  40a7e7:	eb 17                	jmp    0x40a800
  40a7e9:	83 25 54 1d 41 00 00 	andl   $0x0,0x411d54
  40a7f0:	c7 05 50 1d 41 00 09 	movl   $0x9,0x411d50
  40a7f7:	00 00 00 
  40a7fa:	83 c8 ff             	or     $0xffffffff,%eax
  40a7fd:	83 ca ff             	or     $0xffffffff,%edx
  40a800:	5f                   	pop    %edi
  40a801:	5e                   	pop    %esi
  40a802:	c9                   	leave
  40a803:	c3                   	ret
  40a804:	53                   	push   %ebx
  40a805:	56                   	push   %esi
  40a806:	8b 74 24 0c          	mov    0xc(%esp),%esi
  40a80a:	0f af 74 24 10       	imul   0x10(%esp),%esi
  40a80f:	85 f6                	test   %esi,%esi
  40a811:	57                   	push   %edi
  40a812:	8b de                	mov    %esi,%ebx
  40a814:	75 01                	jne    0x40a817
  40a816:	46                   	inc    %esi
  40a817:	33 ff                	xor    %edi,%edi
  40a819:	83 fe e0             	cmp    $0xffffffe0,%esi
  40a81c:	77 39                	ja     0x40a857
  40a81e:	83 3d e4 32 41 00 03 	cmpl   $0x3,0x4132e4
  40a825:	75 1b                	jne    0x40a842
  40a827:	83 c6 0f             	add    $0xf,%esi
  40a82a:	83 e6 f0             	and    $0xfffffff0,%esi
  40a82d:	3b 1d d0 32 41 00    	cmp    0x4132d0,%ebx
  40a833:	77 0d                	ja     0x40a842
  40a835:	53                   	push   %ebx
  40a836:	e8 cd e7 ff ff       	call   0x409008
  40a83b:	8b f8                	mov    %eax,%edi
  40a83d:	85 ff                	test   %edi,%edi
  40a83f:	59                   	pop    %ecx
  40a840:	75 2b                	jne    0x40a86d
  40a842:	56                   	push   %esi
  40a843:	6a 08                	push   $0x8
  40a845:	ff 35 e0 32 41 00    	push   0x4132e0
  40a84b:	ff 15 48 d1 40 00    	call   *0x40d148  ; 0x40d148=KERNEL32.dll!HeapAlloc
  40a851:	8b f8                	mov    %eax,%edi
  40a853:	85 ff                	test   %edi,%edi
  40a855:	75 22                	jne    0x40a879
  40a857:	83 3d a8 1f 41 00 00 	cmpl   $0x0,0x411fa8
  40a85e:	74 19                	je     0x40a879
  40a860:	56                   	push   %esi
  40a861:	e8 60 df ff ff       	call   0x4087c6
  40a866:	85 c0                	test   %eax,%eax
  40a868:	59                   	pop    %ecx
  40a869:	75 ac                	jne    0x40a817
  40a86b:	eb 0e                	jmp    0x40a87b
  40a86d:	53                   	push   %ebx
  40a86e:	6a 00                	push   $0x0
  40a870:	57                   	push   %edi
  40a871:	e8 0a 0a 00 00       	call   0x40b280
  40a876:	83 c4 0c             	add    $0xc,%esp
  40a879:	8b c7                	mov    %edi,%eax
  40a87b:	5f                   	pop    %edi
  40a87c:	5e                   	pop    %esi
  40a87d:	5b                   	pop    %ebx
  40a87e:	c3                   	ret
  40a87f:	56                   	push   %esi
  40a880:	57                   	push   %edi
  40a881:	6a 03                	push   $0x3
  40a883:	5e                   	pop    %esi
  40a884:	33 ff                	xor    %edi,%edi
  40a886:	39 35 c0 32 41 00    	cmp    %esi,0x4132c0
  40a88c:	7e 44                	jle    0x40a8d2
  40a88e:	a1 a0 22 41 00       	mov    0x4122a0,%eax
  40a893:	8b 04 b0             	mov    (%eax,%esi,4),%eax
  40a896:	85 c0                	test   %eax,%eax
  40a898:	74 2f                	je     0x40a8c9
  40a89a:	f6 40 0c 83          	testb  $0x83,0xc(%eax)
  40a89e:	74 0d                	je     0x40a8ad
  40a8a0:	50                   	push   %eax
  40a8a1:	e8 3a 0a 00 00       	call   0x40b2e0
  40a8a6:	83 f8 ff             	cmp    $0xffffffff,%eax
  40a8a9:	59                   	pop    %ecx
  40a8aa:	74 01                	je     0x40a8ad
  40a8ac:	47                   	inc    %edi
  40a8ad:	83 fe 14             	cmp    $0x14,%esi
  40a8b0:	7c 17                	jl     0x40a8c9
  40a8b2:	a1 a0 22 41 00       	mov    0x4122a0,%eax
  40a8b7:	ff 34 b0             	push   (%eax,%esi,4)
  40a8ba:	e8 b8 c3 ff ff       	call   0x406c77
  40a8bf:	a1 a0 22 41 00       	mov    0x4122a0,%eax
  40a8c4:	83 24 b0 00          	andl   $0x0,(%eax,%esi,4)
  40a8c8:	59                   	pop    %ecx
  40a8c9:	46                   	inc    %esi
  40a8ca:	3b 35 c0 32 41 00    	cmp    0x4132c0,%esi
  40a8d0:	7c bc                	jl     0x40a88e
  40a8d2:	8b c7                	mov    %edi,%eax
  40a8d4:	5f                   	pop    %edi
  40a8d5:	5e                   	pop    %esi
  40a8d6:	c3                   	ret
  40a8d7:	53                   	push   %ebx
  40a8d8:	56                   	push   %esi
  40a8d9:	8b 74 24 0c          	mov    0xc(%esp),%esi
  40a8dd:	8b 46 0c             	mov    0xc(%esi),%eax
  40a8e0:	8b c8                	mov    %eax,%ecx
  40a8e2:	80 e1 03             	and    $0x3,%cl
  40a8e5:	33 db                	xor    %ebx,%ebx
  40a8e7:	80 f9 02             	cmp    $0x2,%cl
  40a8ea:	75 3a                	jne    0x40a926
  40a8ec:	66 a9 08 01          	test   $0x108,%ax
  40a8f0:	74 34                	je     0x40a926
  40a8f2:	8b 46 08             	mov    0x8(%esi),%eax
  40a8f5:	57                   	push   %edi
  40a8f6:	8b 3e                	mov    (%esi),%edi
  40a8f8:	2b f8                	sub    %eax,%edi
  40a8fa:	85 ff                	test   %edi,%edi
  40a8fc:	7e 27                	jle    0x40a925
  40a8fe:	57                   	push   %edi
  40a8ff:	50                   	push   %eax
  40a900:	ff 76 10             	push   0x10(%esi)
  40a903:	e8 a8 ee ff ff       	call   0x4097b0
  40a908:	83 c4 0c             	add    $0xc,%esp
  40a90b:	3b c7                	cmp    %edi,%eax
  40a90d:	75 0f                	jne    0x40a91e
  40a90f:	8b 46 0c             	mov    0xc(%esi),%eax
  40a912:	84 c0                	test   %al,%al
  40a914:	79 0f                	jns    0x40a925
  40a916:	83 e0 fd             	and    $0xfffffffd,%eax
  40a919:	89 46 0c             	mov    %eax,0xc(%esi)
  40a91c:	eb 07                	jmp    0x40a925
  40a91e:	83 4e 0c 20          	orl    $0x20,0xc(%esi)
  40a922:	83 cb ff             	or     $0xffffffff,%ebx
  40a925:	5f                   	pop    %edi
  40a926:	8b 46 08             	mov    0x8(%esi),%eax
  40a929:	83 66 04 00          	andl   $0x0,0x4(%esi)
  40a92d:	89 06                	mov    %eax,(%esi)
  40a92f:	5e                   	pop    %esi
  40a930:	8b c3                	mov    %ebx,%eax
  40a932:	5b                   	pop    %ebx
  40a933:	c3                   	ret
  40a934:	56                   	push   %esi
  40a935:	8b 74 24 08          	mov    0x8(%esp),%esi
  40a939:	85 f6                	test   %esi,%esi
  40a93b:	75 09                	jne    0x40a946
  40a93d:	56                   	push   %esi
  40a93e:	e8 2c 00 00 00       	call   0x40a96f
  40a943:	59                   	pop    %ecx
  40a944:	5e                   	pop    %esi
  40a945:	c3                   	ret
  40a946:	56                   	push   %esi
  40a947:	e8 8b ff ff ff       	call   0x40a8d7
  40a94c:	85 c0                	test   %eax,%eax
  40a94e:	59                   	pop    %ecx
  40a94f:	74 05                	je     0x40a956
  40a951:	83 c8 ff             	or     $0xffffffff,%eax
  40a954:	5e                   	pop    %esi
  40a955:	c3                   	ret
  40a956:	f6 46 0d 40          	testb  $0x40,0xd(%esi)
  40a95a:	74 0f                	je     0x40a96b
  40a95c:	ff 76 10             	push   0x10(%esi)
  40a95f:	e8 d2 09 00 00       	call   0x40b336
  40a964:	59                   	pop    %ecx
  40a965:	f7 d8                	neg    %eax
  40a967:	1b c0                	sbb    %eax,%eax
  40a969:	5e                   	pop    %esi
  40a96a:	c3                   	ret
  40a96b:	33 c0                	xor    %eax,%eax
  40a96d:	5e                   	pop    %esi
  40a96e:	c3                   	ret
  40a96f:	53                   	push   %ebx
  40a970:	56                   	push   %esi
  40a971:	57                   	push   %edi
  40a972:	33 f6                	xor    %esi,%esi
  40a974:	33 db                	xor    %ebx,%ebx
  40a976:	33 ff                	xor    %edi,%edi
  40a978:	39 35 c0 32 41 00    	cmp    %esi,0x4132c0
  40a97e:	7e 4d                	jle    0x40a9cd
  40a980:	a1 a0 22 41 00       	mov    0x4122a0,%eax
  40a985:	8b 04 b0             	mov    (%eax,%esi,4),%eax
  40a988:	85 c0                	test   %eax,%eax
  40a98a:	74 38                	je     0x40a9c4
  40a98c:	8b 48 0c             	mov    0xc(%eax),%ecx
  40a98f:	f6 c1 83             	test   $0x83,%cl
  40a992:	74 30                	je     0x40a9c4
  40a994:	83 7c 24 10 01       	cmpl   $0x1,0x10(%esp)
  40a999:	75 0f                	jne    0x40a9aa
  40a99b:	50                   	push   %eax
  40a99c:	e8 93 ff ff ff       	call   0x40a934
  40a9a1:	83 f8 ff             	cmp    $0xffffffff,%eax
  40a9a4:	59                   	pop    %ecx
  40a9a5:	74 1d                	je     0x40a9c4
  40a9a7:	43                   	inc    %ebx
  40a9a8:	eb 1a                	jmp    0x40a9c4
  40a9aa:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
  40a9af:	75 13                	jne    0x40a9c4
  40a9b1:	f6 c1 02             	test   $0x2,%cl
  40a9b4:	74 0e                	je     0x40a9c4
  40a9b6:	50                   	push   %eax
  40a9b7:	e8 78 ff ff ff       	call   0x40a934
  40a9bc:	83 f8 ff             	cmp    $0xffffffff,%eax
  40a9bf:	59                   	pop    %ecx
  40a9c0:	75 02                	jne    0x40a9c4
  40a9c2:	0b f8                	or     %eax,%edi
  40a9c4:	46                   	inc    %esi
  40a9c5:	3b 35 c0 32 41 00    	cmp    0x4132c0,%esi
  40a9cb:	7c b3                	jl     0x40a980
  40a9cd:	83 7c 24 10 01       	cmpl   $0x1,0x10(%esp)
  40a9d2:	8b c3                	mov    %ebx,%eax
  40a9d4:	74 02                	je     0x40a9d8
  40a9d6:	8b c7                	mov    %edi,%eax
  40a9d8:	5f                   	pop    %edi
  40a9d9:	5e                   	pop    %esi
  40a9da:	5b                   	pop    %ebx
  40a9db:	c3                   	ret
  40a9dc:	6a 01                	push   $0x1
  40a9de:	e8 8c ff ff ff       	call   0x40a96f
  40a9e3:	59                   	pop    %ecx
  40a9e4:	c3                   	ret
  40a9e5:	6a 02                	push   $0x2
  40a9e7:	e8 d1 bc ff ff       	call   0x4066bd
  40a9ec:	59                   	pop    %ecx
  40a9ed:	c3                   	ret
  40a9ee:	55                   	push   %ebp
  40a9ef:	8b ec                	mov    %esp,%ebp
  40a9f1:	83 ec 10             	sub    $0x10,%esp
  40a9f4:	a1 6c 04 41 00       	mov    0x41046c,%eax
  40a9f9:	85 c0                	test   %eax,%eax
  40a9fb:	74 07                	je     0x40aa04
  40a9fd:	3d 4e e6 40 bb       	cmp    $0xbb40e64e,%eax
  40aa02:	75 4e                	jne    0x40aa52
  40aa04:	56                   	push   %esi
  40aa05:	8d 45 f8             	lea    -0x8(%ebp),%eax
  40aa08:	50                   	push   %eax
  40aa09:	ff 15 80 d0 40 00    	call   *0x40d080  ; 0x40d080=KERNEL32.dll!GetSystemTimeAsFileTime
  40aa0f:	8b 75 fc             	mov    -0x4(%ebp),%esi
  40aa12:	33 75 f8             	xor    -0x8(%ebp),%esi
  40aa15:	ff 15 b4 d0 40 00    	call   *0x40d0b4  ; 0x40d0b4=KERNEL32.dll!GetCurrentProcessId
  40aa1b:	33 f0                	xor    %eax,%esi
  40aa1d:	ff 15 b8 d0 40 00    	call   *0x40d0b8  ; 0x40d0b8=KERNEL32.dll!GetCurrentThreadId
  40aa23:	33 f0                	xor    %eax,%esi
  40aa25:	ff 15 bc d0 40 00    	call   *0x40d0bc  ; 0x40d0bc=KERNEL32.dll!GetTickCount
  40aa2b:	33 f0                	xor    %eax,%esi
  40aa2d:	8d 45 f0             	lea    -0x10(%ebp),%eax
  40aa30:	50                   	push   %eax
  40aa31:	ff 15 c0 d0 40 00    	call   *0x40d0c0  ; 0x40d0c0=KERNEL32.dll!QueryPerformanceCounter
  40aa37:	8b 45 f4             	mov    -0xc(%ebp),%eax
  40aa3a:	33 45 f0             	xor    -0x10(%ebp),%eax
  40aa3d:	33 f0                	xor    %eax,%esi
  40aa3f:	89 35 6c 04 41 00    	mov    %esi,0x41046c
  40aa45:	75 0a                	jne    0x40aa51
  40aa47:	c7 05 6c 04 41 00 4e 	movl   $0xbb40e64e,0x41046c
  40aa4e:	e6 40 bb 
  40aa51:	5e                   	pop    %esi
  40aa52:	c9                   	leave
  40aa53:	c3                   	ret
  40aa54:	68 18 01 00 00       	push   $0x118
  40aa59:	68 b8 e2 40 00       	push   $0x40e2b8
  40aa5e:	e8 59 cb ff ff       	call   0x4075bc
  40aa63:	a1 6c 04 41 00       	mov    0x41046c,%eax
  40aa68:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  40aa6b:	a1 50 20 41 00       	mov    0x412050,%eax
  40aa70:	33 c9                	xor    %ecx,%ecx
  40aa72:	3b c1                	cmp    %ecx,%eax
  40aa74:	74 1f                	je     0x40aa95
  40aa76:	89 4d fc             	mov    %ecx,-0x4(%ebp)
  40aa79:	ff 75 0c             	push   0xc(%ebp)
  40aa7c:	ff 75 08             	push   0x8(%ebp)
  40aa7f:	ff d0                	call   *%eax
  40aa81:	59                   	pop    %ecx
  40aa82:	59                   	pop    %ecx
  40aa83:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40aa87:	e9 08 01 00 00       	jmp    0x40ab94
  40aa8c:	33 c0                	xor    %eax,%eax
  40aa8e:	40                   	inc    %eax
  40aa8f:	c3                   	ret
  40aa90:	8b 65 e8             	mov    -0x18(%ebp),%esp
  40aa93:	eb ee                	jmp    0x40aa83
  40aa95:	8b 45 08             	mov    0x8(%ebp),%eax
  40aa98:	48                   	dec    %eax
  40aa99:	74 16                	je     0x40aab1
  40aa9b:	bf 94 e2 40 00       	mov    $0x40e294,%edi  ; 0x40e294='Unknown security failure detected!'
  40aaa0:	c7 85 d8 fe ff ff e0 	movl   $0x40e1e0,-0x128(%ebp)  ; 0x40e1e0='A security error of unknown cause has been detected which has'
  40aaa7:	e1 40 00 
  40aaaa:	be d4 00 00 00       	mov    $0xd4,%esi
  40aaaf:	eb 14                	jmp    0x40aac5
  40aab1:	bf c0 e1 40 00       	mov    $0x40e1c0,%edi  ; 0x40e1c0='Buffer overrun detected!'
  40aab6:	c7 85 d8 fe ff ff 20 	movl   $0x40e120,-0x128(%ebp)  ; 0x40e120="A buffer overrun has been detected which has corrupted the program's"
  40aabd:	e1 40 00 
  40aac0:	be b9 00 00 00       	mov    $0xb9,%esi
  40aac5:	88 4d e0             	mov    %cl,-0x20(%ebp)
  40aac8:	68 04 01 00 00       	push   $0x104
  40aacd:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
  40aad3:	50                   	push   %eax
  40aad4:	51                   	push   %ecx
  40aad5:	ff 15 24 d1 40 00    	call   *0x40d124  ; 0x40d124=KERNEL32.dll!GetModuleFileNameA
  40aadb:	85 c0                	test   %eax,%eax
  40aadd:	75 13                	jne    0x40aaf2
  40aadf:	68 54 db 40 00       	push   $0x40db54  ; 0x40db54='<program name unknown>'
  40aae4:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
  40aaea:	50                   	push   %eax
  40aaeb:	e8 60 f3 ff ff       	call   0x409e50
  40aaf0:	59                   	pop    %ecx
  40aaf1:	59                   	pop    %ecx
  40aaf2:	8d 9d dc fe ff ff    	lea    -0x124(%ebp),%ebx
  40aaf8:	8b c3                	mov    %ebx,%eax
  40aafa:	50                   	push   %eax
  40aafb:	e8 60 ef ff ff       	call   0x409a60
  40ab00:	59                   	pop    %ecx
  40ab01:	83 c0 0b             	add    $0xb,%eax
  40ab04:	83 f8 3c             	cmp    $0x3c,%eax
  40ab07:	76 25                	jbe    0x40ab2e
  40ab09:	8b c3                	mov    %ebx,%eax
  40ab0b:	50                   	push   %eax
  40ab0c:	e8 4f ef ff ff       	call   0x409a60
  40ab11:	8b d8                	mov    %eax,%ebx
  40ab13:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
  40ab19:	83 e8 31             	sub    $0x31,%eax
  40ab1c:	03 d8                	add    %eax,%ebx
  40ab1e:	6a 03                	push   $0x3
  40ab20:	68 50 db 40 00       	push   $0x40db50
  40ab25:	53                   	push   %ebx
  40ab26:	e8 35 b2 ff ff       	call   0x405d60
  40ab2b:	83 c4 10             	add    $0x10,%esp
  40ab2e:	53                   	push   %ebx
  40ab2f:	e8 2c ef ff ff       	call   0x409a60
  40ab34:	59                   	pop    %ecx
  40ab35:	8d 44 30 0c          	lea    0xc(%eax,%esi,1),%eax
  40ab39:	83 c0 03             	add    $0x3,%eax
  40ab3c:	83 e0 fc             	and    $0xfffffffc,%eax
  40ab3f:	e8 cc b1 ff ff       	call   0x405d10
  40ab44:	89 65 e8             	mov    %esp,-0x18(%ebp)
  40ab47:	8b f4                	mov    %esp,%esi
  40ab49:	57                   	push   %edi
  40ab4a:	56                   	push   %esi
  40ab4b:	e8 00 f3 ff ff       	call   0x409e50
  40ab50:	bf 30 db 40 00       	mov    $0x40db30,%edi
  40ab55:	57                   	push   %edi
  40ab56:	56                   	push   %esi
  40ab57:	e8 04 f3 ff ff       	call   0x409e60
  40ab5c:	68 14 e1 40 00       	push   $0x40e114  ; 0x40e114='Program: '
  40ab61:	56                   	push   %esi
  40ab62:	e8 f9 f2 ff ff       	call   0x409e60
  40ab67:	53                   	push   %ebx
  40ab68:	56                   	push   %esi
  40ab69:	e8 f2 f2 ff ff       	call   0x409e60
  40ab6e:	57                   	push   %edi
  40ab6f:	56                   	push   %esi
  40ab70:	e8 eb f2 ff ff       	call   0x409e60
  40ab75:	ff b5 d8 fe ff ff    	push   -0x128(%ebp)
  40ab7b:	56                   	push   %esi
  40ab7c:	e8 df f2 ff ff       	call   0x409e60
  40ab81:	68 10 20 01 00       	push   $0x12010
  40ab86:	68 08 db 40 00       	push   $0x40db08  ; 0x40db08='Microsoft Visual C++ Runtime Library'
  40ab8b:	56                   	push   %esi
  40ab8c:	e8 38 f4 ff ff       	call   0x409fc9
  40ab91:	83 c4 3c             	add    $0x3c,%esp
  40ab94:	6a 03                	push   $0x3
  40ab96:	e8 f1 bf ff ff       	call   0x406b8c
  40ab9b:	cc                   	int3
  40ab9c:	55                   	push   %ebp
  40ab9d:	8b ec                	mov    %esp,%ebp
  40ab9f:	51                   	push   %ecx
  40aba0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  40aba3:	81 f9 ff 00 00 00    	cmp    $0xff,%ecx
  40aba9:	76 5e                	jbe    0x40ac09
  40abab:	66 83 65 fc 00       	andw   $0x0,-0x4(%ebp)
  40abb0:	57                   	push   %edi
  40abb1:	33 c0                	xor    %eax,%eax
  40abb3:	8d 7d fe             	lea    -0x2(%ebp),%edi
  40abb6:	66 ab                	stos   %ax,%es:(%edi)
  40abb8:	8b c1                	mov    %ecx,%eax
  40abba:	c1 e8 08             	shr    $0x8,%eax
  40abbd:	83 3d 64 20 41 00 00 	cmpl   $0x0,0x412064
  40abc4:	88 45 0a             	mov    %al,0xa(%ebp)
  40abc7:	88 4d 0b             	mov    %cl,0xb(%ebp)
  40abca:	5f                   	pop    %edi
  40abcb:	75 04                	jne    0x40abd1
  40abcd:	33 c0                	xor    %eax,%eax
  40abcf:	c9                   	leave
  40abd0:	c3                   	ret
  40abd1:	6a 01                	push   $0x1
  40abd3:	ff 35 60 20 41 00    	push   0x412060
  40abd9:	8d 45 fc             	lea    -0x4(%ebp),%eax
  40abdc:	ff 35 84 21 41 00    	push   0x412184
  40abe2:	50                   	push   %eax
  40abe3:	6a 02                	push   $0x2
  40abe5:	8d 45 0a             	lea    0xa(%ebp),%eax
  40abe8:	50                   	push   %eax
  40abe9:	6a 01                	push   $0x1
  40abeb:	e8 c7 04 00 00       	call   0x40b0b7
  40abf0:	83 c4 1c             	add    $0x1c,%esp
  40abf3:	85 c0                	test   %eax,%eax
  40abf5:	74 d6                	je     0x40abcd
  40abf7:	66 83 7d fe 00       	cmpw   $0x0,-0x2(%ebp)
  40abfc:	75 cf                	jne    0x40abcd
  40abfe:	f6 45 fc 08          	testb  $0x8,-0x4(%ebp)
  40ac02:	74 c9                	je     0x40abcd
  40ac04:	33 c0                	xor    %eax,%eax
  40ac06:	40                   	inc    %eax
  40ac07:	c9                   	leave
  40ac08:	c3                   	ret
  40ac09:	83 3d d8 0b 41 00 01 	cmpl   $0x1,0x410bd8
  40ac10:	7e 0c                	jle    0x40ac1e
  40ac12:	6a 08                	push   $0x8
  40ac14:	51                   	push   %ecx
  40ac15:	e8 73 07 00 00       	call   0x40b38d
  40ac1a:	59                   	pop    %ecx
  40ac1b:	59                   	pop    %ecx
  40ac1c:	c9                   	leave
  40ac1d:	c3                   	ret
  40ac1e:	a1 68 09 41 00       	mov    0x410968,%eax
  40ac23:	0f b6 04 48          	movzbl (%eax,%ecx,2),%eax
  40ac27:	83 e0 08             	and    $0x8,%eax
  40ac2a:	c9                   	leave
  40ac2b:	c3                   	ret
  40ac2c:	55                   	push   %ebp
  40ac2d:	8b ec                	mov    %esp,%ebp
  40ac2f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  40ac33:	75 04                	jne    0x40ac39
  40ac35:	33 c0                	xor    %eax,%eax
  40ac37:	5d                   	pop    %ebp
  40ac38:	c3                   	ret
  40ac39:	ff 35 84 21 41 00    	push   0x412184
  40ac3f:	ff 75 10             	push   0x10(%ebp)
  40ac42:	ff 75 0c             	push   0xc(%ebp)
  40ac45:	ff 75 10             	push   0x10(%ebp)
  40ac48:	ff 75 08             	push   0x8(%ebp)
  40ac4b:	6a 01                	push   $0x1
  40ac4d:	ff 35 60 20 41 00    	push   0x412060
  40ac53:	e8 cf 07 00 00       	call   0x40b427
  40ac58:	83 c4 1c             	add    $0x1c,%esp
  40ac5b:	85 c0                	test   %eax,%eax
  40ac5d:	75 07                	jne    0x40ac66
  40ac5f:	b8 ff ff ff 7f       	mov    $0x7fffffff,%eax
  40ac64:	5d                   	pop    %ebp
  40ac65:	c3                   	ret
  40ac66:	83 c0 fe             	add    $0xfffffffe,%eax
  40ac69:	5d                   	pop    %ebp
  40ac6a:	c3                   	ret
  40ac6b:	55                   	push   %ebp
  40ac6c:	8b ec                	mov    %esp,%ebp
  40ac6e:	51                   	push   %ecx
  40ac6f:	51                   	push   %ecx
  40ac70:	53                   	push   %ebx
  40ac71:	56                   	push   %esi
  40ac72:	33 f6                	xor    %esi,%esi
  40ac74:	57                   	push   %edi
  40ac75:	8b 3d 84 1d 41 00    	mov    0x411d84,%edi
  40ac7b:	89 75 fc             	mov    %esi,-0x4(%ebp)
  40ac7e:	8b 07                	mov    (%edi),%eax
  40ac80:	3b c6                	cmp    %esi,%eax
  40ac82:	74 62                	je     0x40ace6
  40ac84:	8b 1d 84 d0 40 00    	mov    0x40d084,%ebx  ; 0x40d084=KERNEL32.dll!WideCharToMultiByte
  40ac8a:	56                   	push   %esi
  40ac8b:	56                   	push   %esi
  40ac8c:	56                   	push   %esi
  40ac8d:	56                   	push   %esi
  40ac8e:	6a ff                	push   $0xffffffff
  40ac90:	50                   	push   %eax
  40ac91:	56                   	push   %esi
  40ac92:	56                   	push   %esi
  40ac93:	ff d3                	call   *%ebx
  40ac95:	3b c6                	cmp    %esi,%eax
  40ac97:	89 45 f8             	mov    %eax,-0x8(%ebp)
  40ac9a:	74 5a                	je     0x40acf6
  40ac9c:	50                   	push   %eax
  40ac9d:	e8 c3 bf ff ff       	call   0x406c65
  40aca2:	3b c6                	cmp    %esi,%eax
  40aca4:	59                   	pop    %ecx
  40aca5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  40aca8:	74 4c                	je     0x40acf6
  40acaa:	56                   	push   %esi
  40acab:	56                   	push   %esi
  40acac:	ff 75 f8             	push   -0x8(%ebp)
  40acaf:	50                   	push   %eax
  40acb0:	6a ff                	push   $0xffffffff
  40acb2:	ff 37                	push   (%edi)
  40acb4:	56                   	push   %esi
  40acb5:	56                   	push   %esi
  40acb6:	ff d3                	call   *%ebx
  40acb8:	85 c0                	test   %eax,%eax
  40acba:	74 31                	je     0x40aced
  40acbc:	8d 45 fc             	lea    -0x4(%ebp),%eax
  40acbf:	56                   	push   %esi
  40acc0:	50                   	push   %eax
  40acc1:	e8 93 0b 00 00       	call   0x40b859
  40acc6:	85 c0                	test   %eax,%eax
  40acc8:	59                   	pop    %ecx
  40acc9:	59                   	pop    %ecx
  40acca:	7d 11                	jge    0x40acdd
  40accc:	39 75 fc             	cmp    %esi,-0x4(%ebp)
  40accf:	74 0c                	je     0x40acdd
  40acd1:	ff 75 fc             	push   -0x4(%ebp)
  40acd4:	e8 9e bf ff ff       	call   0x406c77
  40acd9:	59                   	pop    %ecx
  40acda:	89 75 fc             	mov    %esi,-0x4(%ebp)
  40acdd:	83 c7 04             	add    $0x4,%edi
  40ace0:	8b 07                	mov    (%edi),%eax
  40ace2:	3b c6                	cmp    %esi,%eax
  40ace4:	75 a4                	jne    0x40ac8a
  40ace6:	33 c0                	xor    %eax,%eax
  40ace8:	5f                   	pop    %edi
  40ace9:	5e                   	pop    %esi
  40acea:	5b                   	pop    %ebx
  40aceb:	c9                   	leave
  40acec:	c3                   	ret
  40aced:	ff 75 fc             	push   -0x4(%ebp)
  40acf0:	e8 82 bf ff ff       	call   0x406c77
  40acf5:	59                   	pop    %ecx
  40acf6:	83 c8 ff             	or     $0xffffffff,%eax
  40acf9:	eb ed                	jmp    0x40ace8
  40acfb:	6a 38                	push   $0x38
  40acfd:	68 c8 e2 40 00       	push   $0x40e2c8
  40ad02:	e8 b5 c8 ff ff       	call   0x4075bc
  40ad07:	33 db                	xor    %ebx,%ebx
  40ad09:	39 1d 54 20 41 00    	cmp    %ebx,0x412054
  40ad0f:	75 38                	jne    0x40ad49
  40ad11:	53                   	push   %ebx
  40ad12:	53                   	push   %ebx
  40ad13:	33 f6                	xor    %esi,%esi
  40ad15:	46                   	inc    %esi
  40ad16:	56                   	push   %esi
  40ad17:	68 c4 e2 40 00       	push   $0x40e2c4
  40ad1c:	68 00 01 00 00       	push   $0x100
  40ad21:	53                   	push   %ebx
  40ad22:	ff 15 a8 d0 40 00    	call   *0x40d0a8  ; 0x40d0a8=KERNEL32.dll!LCMapStringW
  40ad28:	85 c0                	test   %eax,%eax
  40ad2a:	74 08                	je     0x40ad34
  40ad2c:	89 35 54 20 41 00    	mov    %esi,0x412054
  40ad32:	eb 15                	jmp    0x40ad49
  40ad34:	ff 15 0c d1 40 00    	call   *0x40d10c  ; 0x40d10c=KERNEL32.dll!GetLastError
  40ad3a:	83 f8 78             	cmp    $0x78,%eax
  40ad3d:	75 0a                	jne    0x40ad49
  40ad3f:	c7 05 54 20 41 00 02 	movl   $0x2,0x412054
  40ad46:	00 00 00 
  40ad49:	39 5d 14             	cmp    %ebx,0x14(%ebp)
  40ad4c:	7e 1b                	jle    0x40ad69
  40ad4e:	8b 4d 14             	mov    0x14(%ebp),%ecx
  40ad51:	8b 45 10             	mov    0x10(%ebp),%eax
  40ad54:	49                   	dec    %ecx
  40ad55:	38 18                	cmp    %bl,(%eax)
  40ad57:	74 08                	je     0x40ad61
  40ad59:	40                   	inc    %eax
  40ad5a:	3b cb                	cmp    %ebx,%ecx
  40ad5c:	75 f6                	jne    0x40ad54
  40ad5e:	83 c9 ff             	or     $0xffffffff,%ecx
  40ad61:	83 c8 ff             	or     $0xffffffff,%eax
  40ad64:	2b c1                	sub    %ecx,%eax
  40ad66:	01 45 14             	add    %eax,0x14(%ebp)
  40ad69:	a1 54 20 41 00       	mov    0x412054,%eax
  40ad6e:	83 f8 02             	cmp    $0x2,%eax
  40ad71:	0f 84 dc 01 00 00    	je     0x40af53
  40ad77:	3b c3                	cmp    %ebx,%eax
  40ad79:	0f 84 d4 01 00 00    	je     0x40af53
  40ad7f:	83 f8 01             	cmp    $0x1,%eax
  40ad82:	0f 85 fe 01 00 00    	jne    0x40af86
  40ad88:	33 ff                	xor    %edi,%edi
  40ad8a:	89 7d d4             	mov    %edi,-0x2c(%ebp)
  40ad8d:	89 5d c8             	mov    %ebx,-0x38(%ebp)
  40ad90:	89 5d cc             	mov    %ebx,-0x34(%ebp)
  40ad93:	39 5d 20             	cmp    %ebx,0x20(%ebp)
  40ad96:	75 08                	jne    0x40ada0
  40ad98:	a1 1c 20 41 00       	mov    0x41201c,%eax
  40ad9d:	89 45 20             	mov    %eax,0x20(%ebp)
  40ada0:	53                   	push   %ebx
  40ada1:	53                   	push   %ebx
  40ada2:	ff 75 14             	push   0x14(%ebp)
  40ada5:	ff 75 10             	push   0x10(%ebp)
  40ada8:	33 c0                	xor    %eax,%eax
  40adaa:	39 5d 24             	cmp    %ebx,0x24(%ebp)
  40adad:	0f 95 c0             	setne  %al
  40adb0:	8d 04 c5 01 00 00 00 	lea    0x1(,%eax,8),%eax
  40adb7:	50                   	push   %eax
  40adb8:	ff 75 20             	push   0x20(%ebp)
  40adbb:	ff 15 ac d0 40 00    	call   *0x40d0ac  ; 0x40d0ac=KERNEL32.dll!MultiByteToWideChar
  40adc1:	8b f0                	mov    %eax,%esi
  40adc3:	89 75 d0             	mov    %esi,-0x30(%ebp)
  40adc6:	3b f3                	cmp    %ebx,%esi
  40adc8:	0f 84 b8 01 00 00    	je     0x40af86
  40adce:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
  40add5:	8d 04 36             	lea    (%esi,%esi,1),%eax
  40add8:	83 c0 03             	add    $0x3,%eax
  40addb:	83 e0 fc             	and    $0xfffffffc,%eax
  40adde:	e8 2d af ff ff       	call   0x405d10
  40ade3:	89 65 e8             	mov    %esp,-0x18(%ebp)
  40ade6:	8b c4                	mov    %esp,%eax
  40ade8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  40adeb:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40adef:	eb 1b                	jmp    0x40ae0c
  40adf1:	33 c0                	xor    %eax,%eax
  40adf3:	40                   	inc    %eax
  40adf4:	c3                   	ret
  40adf5:	8b 65 e8             	mov    -0x18(%ebp),%esp
  40adf8:	e8 3d 0e 00 00       	call   0x40bc3a
  40adfd:	33 db                	xor    %ebx,%ebx
  40adff:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  40ae02:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40ae06:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  40ae09:	8b 75 d0             	mov    -0x30(%ebp),%esi
  40ae0c:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
  40ae0f:	75 1c                	jne    0x40ae2d
  40ae11:	8d 04 36             	lea    (%esi,%esi,1),%eax
  40ae14:	50                   	push   %eax
  40ae15:	e8 4b be ff ff       	call   0x406c65
  40ae1a:	59                   	pop    %ecx
  40ae1b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  40ae1e:	3b c3                	cmp    %ebx,%eax
  40ae20:	0f 84 60 01 00 00    	je     0x40af86
  40ae26:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
  40ae2d:	56                   	push   %esi
  40ae2e:	ff 75 e4             	push   -0x1c(%ebp)
  40ae31:	ff 75 14             	push   0x14(%ebp)
  40ae34:	ff 75 10             	push   0x10(%ebp)
  40ae37:	6a 01                	push   $0x1
  40ae39:	ff 75 20             	push   0x20(%ebp)
  40ae3c:	ff 15 ac d0 40 00    	call   *0x40d0ac  ; 0x40d0ac=KERNEL32.dll!MultiByteToWideChar
  40ae42:	85 c0                	test   %eax,%eax
  40ae44:	0f 84 e6 00 00 00    	je     0x40af30
  40ae4a:	53                   	push   %ebx
  40ae4b:	53                   	push   %ebx
  40ae4c:	56                   	push   %esi
  40ae4d:	ff 75 e4             	push   -0x1c(%ebp)
  40ae50:	ff 75 0c             	push   0xc(%ebp)
  40ae53:	ff 75 08             	push   0x8(%ebp)
  40ae56:	ff 15 a8 d0 40 00    	call   *0x40d0a8  ; 0x40d0a8=KERNEL32.dll!LCMapStringW
  40ae5c:	8b f8                	mov    %eax,%edi
  40ae5e:	89 7d d4             	mov    %edi,-0x2c(%ebp)
  40ae61:	3b fb                	cmp    %ebx,%edi
  40ae63:	0f 84 c7 00 00 00    	je     0x40af30
  40ae69:	f6 45 0d 04          	testb  $0x4,0xd(%ebp)
  40ae6d:	74 2d                	je     0x40ae9c
  40ae6f:	39 5d 1c             	cmp    %ebx,0x1c(%ebp)
  40ae72:	0f 84 b8 00 00 00    	je     0x40af30
  40ae78:	3b 7d 1c             	cmp    0x1c(%ebp),%edi
  40ae7b:	0f 8f af 00 00 00    	jg     0x40af30
  40ae81:	ff 75 1c             	push   0x1c(%ebp)
  40ae84:	ff 75 18             	push   0x18(%ebp)
  40ae87:	56                   	push   %esi
  40ae88:	ff 75 e4             	push   -0x1c(%ebp)
  40ae8b:	ff 75 0c             	push   0xc(%ebp)
  40ae8e:	ff 75 08             	push   0x8(%ebp)
  40ae91:	ff 15 a8 d0 40 00    	call   *0x40d0a8  ; 0x40d0a8=KERNEL32.dll!LCMapStringW
  40ae97:	e9 94 00 00 00       	jmp    0x40af30
  40ae9c:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%ebp)
  40aea3:	8d 04 3f             	lea    (%edi,%edi,1),%eax
  40aea6:	83 c0 03             	add    $0x3,%eax
  40aea9:	83 e0 fc             	and    $0xfffffffc,%eax
  40aeac:	e8 5f ae ff ff       	call   0x405d10
  40aeb1:	89 65 e8             	mov    %esp,-0x18(%ebp)
  40aeb4:	8b c4                	mov    %esp,%eax
  40aeb6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  40aeb9:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40aebd:	eb 1b                	jmp    0x40aeda
  40aebf:	33 c0                	xor    %eax,%eax
  40aec1:	40                   	inc    %eax
  40aec2:	c3                   	ret
  40aec3:	8b 65 e8             	mov    -0x18(%ebp),%esp
  40aec6:	e8 6f 0d 00 00       	call   0x40bc3a
  40aecb:	33 db                	xor    %ebx,%ebx
  40aecd:	89 5d e0             	mov    %ebx,-0x20(%ebp)
  40aed0:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40aed4:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  40aed7:	8b 75 d0             	mov    -0x30(%ebp),%esi
  40aeda:	39 5d e0             	cmp    %ebx,-0x20(%ebp)
  40aedd:	75 18                	jne    0x40aef7
  40aedf:	8d 04 3f             	lea    (%edi,%edi,1),%eax
  40aee2:	50                   	push   %eax
  40aee3:	e8 7d bd ff ff       	call   0x406c65
  40aee8:	59                   	pop    %ecx
  40aee9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  40aeec:	3b c3                	cmp    %ebx,%eax
  40aeee:	74 40                	je     0x40af30
  40aef0:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
  40aef7:	57                   	push   %edi
  40aef8:	ff 75 e0             	push   -0x20(%ebp)
  40aefb:	56                   	push   %esi
  40aefc:	ff 75 e4             	push   -0x1c(%ebp)
  40aeff:	ff 75 0c             	push   0xc(%ebp)
  40af02:	ff 75 08             	push   0x8(%ebp)
  40af05:	ff 15 a8 d0 40 00    	call   *0x40d0a8  ; 0x40d0a8=KERNEL32.dll!LCMapStringW
  40af0b:	85 c0                	test   %eax,%eax
  40af0d:	74 21                	je     0x40af30
  40af0f:	53                   	push   %ebx
  40af10:	53                   	push   %ebx
  40af11:	39 5d 1c             	cmp    %ebx,0x1c(%ebp)
  40af14:	75 04                	jne    0x40af1a
  40af16:	53                   	push   %ebx
  40af17:	53                   	push   %ebx
  40af18:	eb 06                	jmp    0x40af20
  40af1a:	ff 75 1c             	push   0x1c(%ebp)
  40af1d:	ff 75 18             	push   0x18(%ebp)
  40af20:	57                   	push   %edi
  40af21:	ff 75 e0             	push   -0x20(%ebp)
  40af24:	53                   	push   %ebx
  40af25:	ff 75 20             	push   0x20(%ebp)
  40af28:	ff 15 84 d0 40 00    	call   *0x40d084  ; 0x40d084=KERNEL32.dll!WideCharToMultiByte
  40af2e:	8b f8                	mov    %eax,%edi
  40af30:	39 5d cc             	cmp    %ebx,-0x34(%ebp)
  40af33:	74 09                	je     0x40af3e
  40af35:	ff 75 e0             	push   -0x20(%ebp)
  40af38:	e8 3a bd ff ff       	call   0x406c77
  40af3d:	59                   	pop    %ecx
  40af3e:	39 5d c8             	cmp    %ebx,-0x38(%ebp)
  40af41:	74 09                	je     0x40af4c
  40af43:	ff 75 e4             	push   -0x1c(%ebp)
  40af46:	e8 2c bd ff ff       	call   0x406c77
  40af4b:	59                   	pop    %ecx
  40af4c:	8b c7                	mov    %edi,%eax
  40af4e:	e9 5b 01 00 00       	jmp    0x40b0ae
  40af53:	89 5d d8             	mov    %ebx,-0x28(%ebp)
  40af56:	33 ff                	xor    %edi,%edi
  40af58:	89 5d c4             	mov    %ebx,-0x3c(%ebp)
  40af5b:	39 5d 08             	cmp    %ebx,0x8(%ebp)
  40af5e:	75 08                	jne    0x40af68
  40af60:	a1 0c 20 41 00       	mov    0x41200c,%eax
  40af65:	89 45 08             	mov    %eax,0x8(%ebp)
  40af68:	39 5d 20             	cmp    %ebx,0x20(%ebp)
  40af6b:	75 08                	jne    0x40af75
  40af6d:	a1 1c 20 41 00       	mov    0x41201c,%eax
  40af72:	89 45 20             	mov    %eax,0x20(%ebp)
  40af75:	ff 75 08             	push   0x8(%ebp)
  40af78:	e8 b1 0a 00 00       	call   0x40ba2e
  40af7d:	59                   	pop    %ecx
  40af7e:	89 45 c0             	mov    %eax,-0x40(%ebp)
  40af81:	83 f8 ff             	cmp    $0xffffffff,%eax
  40af84:	75 07                	jne    0x40af8d
  40af86:	33 c0                	xor    %eax,%eax
  40af88:	e9 21 01 00 00       	jmp    0x40b0ae
  40af8d:	3b 45 20             	cmp    0x20(%ebp),%eax
  40af90:	0f 84 ee 00 00 00    	je     0x40b084
  40af96:	53                   	push   %ebx
  40af97:	53                   	push   %ebx
  40af98:	8d 4d 14             	lea    0x14(%ebp),%ecx
  40af9b:	51                   	push   %ecx
  40af9c:	ff 75 10             	push   0x10(%ebp)
  40af9f:	50                   	push   %eax
  40afa0:	ff 75 20             	push   0x20(%ebp)
  40afa3:	e8 c9 0a 00 00       	call   0x40ba71
  40afa8:	83 c4 18             	add    $0x18,%esp
  40afab:	89 45 d8             	mov    %eax,-0x28(%ebp)
  40afae:	3b c3                	cmp    %ebx,%eax
  40afb0:	74 d4                	je     0x40af86
  40afb2:	53                   	push   %ebx
  40afb3:	53                   	push   %ebx
  40afb4:	ff 75 14             	push   0x14(%ebp)
  40afb7:	50                   	push   %eax
  40afb8:	ff 75 0c             	push   0xc(%ebp)
  40afbb:	ff 75 08             	push   0x8(%ebp)
  40afbe:	ff 15 b0 d0 40 00    	call   *0x40d0b0  ; 0x40d0b0=KERNEL32.dll!LCMapStringA
  40afc4:	8b f0                	mov    %eax,%esi
  40afc6:	89 75 dc             	mov    %esi,-0x24(%ebp)
  40afc9:	3b f3                	cmp    %ebx,%esi
  40afcb:	0f 84 a2 00 00 00    	je     0x40b073
  40afd1:	89 5d fc             	mov    %ebx,-0x4(%ebp)
  40afd4:	83 c0 03             	add    $0x3,%eax
  40afd7:	83 e0 fc             	and    $0xfffffffc,%eax
  40afda:	e8 31 ad ff ff       	call   0x405d10
  40afdf:	89 65 e8             	mov    %esp,-0x18(%ebp)
  40afe2:	8b fc                	mov    %esp,%edi
  40afe4:	89 7d bc             	mov    %edi,-0x44(%ebp)
  40afe7:	56                   	push   %esi
  40afe8:	53                   	push   %ebx
  40afe9:	57                   	push   %edi
  40afea:	e8 91 02 00 00       	call   0x40b280
  40afef:	83 c4 0c             	add    $0xc,%esp
  40aff2:	eb 10                	jmp    0x40b004
  40aff4:	33 c0                	xor    %eax,%eax
  40aff6:	40                   	inc    %eax
  40aff7:	c3                   	ret
  40aff8:	8b 65 e8             	mov    -0x18(%ebp),%esp
  40affb:	e8 3a 0c 00 00       	call   0x40bc3a
  40b000:	33 db                	xor    %ebx,%ebx
  40b002:	33 ff                	xor    %edi,%edi
  40b004:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40b008:	3b fb                	cmp    %ebx,%edi
  40b00a:	75 23                	jne    0x40b02f
  40b00c:	ff 75 dc             	push   -0x24(%ebp)
  40b00f:	e8 51 bc ff ff       	call   0x406c65
  40b014:	59                   	pop    %ecx
  40b015:	8b f8                	mov    %eax,%edi
  40b017:	3b fb                	cmp    %ebx,%edi
  40b019:	74 31                	je     0x40b04c
  40b01b:	ff 75 dc             	push   -0x24(%ebp)
  40b01e:	53                   	push   %ebx
  40b01f:	57                   	push   %edi
  40b020:	e8 5b 02 00 00       	call   0x40b280
  40b025:	83 c4 0c             	add    $0xc,%esp
  40b028:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  40b02f:	ff 75 dc             	push   -0x24(%ebp)
  40b032:	57                   	push   %edi
  40b033:	ff 75 14             	push   0x14(%ebp)
  40b036:	ff 75 d8             	push   -0x28(%ebp)
  40b039:	ff 75 0c             	push   0xc(%ebp)
  40b03c:	ff 75 08             	push   0x8(%ebp)
  40b03f:	ff 15 b0 d0 40 00    	call   *0x40d0b0  ; 0x40d0b0=KERNEL32.dll!LCMapStringA
  40b045:	89 45 dc             	mov    %eax,-0x24(%ebp)
  40b048:	3b c3                	cmp    %ebx,%eax
  40b04a:	75 04                	jne    0x40b050
  40b04c:	33 f6                	xor    %esi,%esi
  40b04e:	eb 26                	jmp    0x40b076
  40b050:	ff 75 1c             	push   0x1c(%ebp)
  40b053:	ff 75 18             	push   0x18(%ebp)
  40b056:	8d 45 dc             	lea    -0x24(%ebp),%eax
  40b059:	50                   	push   %eax
  40b05a:	57                   	push   %edi
  40b05b:	ff 75 20             	push   0x20(%ebp)
  40b05e:	ff 75 c0             	push   -0x40(%ebp)
  40b061:	e8 0b 0a 00 00       	call   0x40ba71
  40b066:	83 c4 18             	add    $0x18,%esp
  40b069:	8b f0                	mov    %eax,%esi
  40b06b:	f7 de                	neg    %esi
  40b06d:	1b f6                	sbb    %esi,%esi
  40b06f:	f7 de                	neg    %esi
  40b071:	eb 03                	jmp    0x40b076
  40b073:	8b 75 b8             	mov    -0x48(%ebp),%esi
  40b076:	39 5d c4             	cmp    %ebx,-0x3c(%ebp)
  40b079:	74 23                	je     0x40b09e
  40b07b:	57                   	push   %edi
  40b07c:	e8 f6 bb ff ff       	call   0x406c77
  40b081:	59                   	pop    %ecx
  40b082:	eb 1a                	jmp    0x40b09e
  40b084:	ff 75 1c             	push   0x1c(%ebp)
  40b087:	ff 75 18             	push   0x18(%ebp)
  40b08a:	ff 75 14             	push   0x14(%ebp)
  40b08d:	ff 75 10             	push   0x10(%ebp)
  40b090:	ff 75 0c             	push   0xc(%ebp)
  40b093:	ff 75 08             	push   0x8(%ebp)
  40b096:	ff 15 b0 d0 40 00    	call   *0x40d0b0  ; 0x40d0b0=KERNEL32.dll!LCMapStringA
  40b09c:	8b f0                	mov    %eax,%esi
  40b09e:	39 5d d8             	cmp    %ebx,-0x28(%ebp)
  40b0a1:	74 09                	je     0x40b0ac
  40b0a3:	ff 75 d8             	push   -0x28(%ebp)
  40b0a6:	e8 cc bb ff ff       	call   0x406c77
  40b0ab:	59                   	pop    %ecx
  40b0ac:	8b c6                	mov    %esi,%eax
  40b0ae:	8d 65 ac             	lea    -0x54(%ebp),%esp
  40b0b1:	e8 41 c5 ff ff       	call   0x4075f7
  40b0b6:	c3                   	ret
  40b0b7:	6a 1c                	push   $0x1c
  40b0b9:	68 f0 e2 40 00       	push   $0x40e2f0
  40b0be:	e8 f9 c4 ff ff       	call   0x4075bc
  40b0c3:	33 f6                	xor    %esi,%esi
  40b0c5:	39 35 58 20 41 00    	cmp    %esi,0x412058
  40b0cb:	75 35                	jne    0x40b102
  40b0cd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  40b0d0:	50                   	push   %eax
  40b0d1:	33 ff                	xor    %edi,%edi
  40b0d3:	47                   	inc    %edi
  40b0d4:	57                   	push   %edi
  40b0d5:	68 c4 e2 40 00       	push   $0x40e2c4
  40b0da:	57                   	push   %edi
  40b0db:	ff 15 a0 d0 40 00    	call   *0x40d0a0  ; 0x40d0a0=KERNEL32.dll!GetStringTypeW
  40b0e1:	85 c0                	test   %eax,%eax
  40b0e3:	74 08                	je     0x40b0ed
  40b0e5:	89 3d 58 20 41 00    	mov    %edi,0x412058
  40b0eb:	eb 15                	jmp    0x40b102
  40b0ed:	ff 15 0c d1 40 00    	call   *0x40d10c  ; 0x40d10c=KERNEL32.dll!GetLastError
  40b0f3:	83 f8 78             	cmp    $0x78,%eax
  40b0f6:	75 0a                	jne    0x40b102
  40b0f8:	c7 05 58 20 41 00 02 	movl   $0x2,0x412058
  40b0ff:	00 00 00 
  40b102:	a1 58 20 41 00       	mov    0x412058,%eax
  40b107:	83 f8 02             	cmp    $0x2,%eax
  40b10a:	0f 84 ea 00 00 00    	je     0x40b1fa
  40b110:	3b c6                	cmp    %esi,%eax
  40b112:	0f 84 e2 00 00 00    	je     0x40b1fa
  40b118:	83 f8 01             	cmp    $0x1,%eax
  40b11b:	0f 85 ff 00 00 00    	jne    0x40b220
  40b121:	89 75 dc             	mov    %esi,-0x24(%ebp)
  40b124:	89 75 e0             	mov    %esi,-0x20(%ebp)
  40b127:	39 75 18             	cmp    %esi,0x18(%ebp)
  40b12a:	75 08                	jne    0x40b134
  40b12c:	a1 1c 20 41 00       	mov    0x41201c,%eax
  40b131:	89 45 18             	mov    %eax,0x18(%ebp)
  40b134:	56                   	push   %esi
  40b135:	56                   	push   %esi
  40b136:	ff 75 10             	push   0x10(%ebp)
  40b139:	ff 75 0c             	push   0xc(%ebp)
  40b13c:	33 c0                	xor    %eax,%eax
  40b13e:	39 75 20             	cmp    %esi,0x20(%ebp)
  40b141:	0f 95 c0             	setne  %al
  40b144:	8d 04 c5 01 00 00 00 	lea    0x1(,%eax,8),%eax
  40b14b:	50                   	push   %eax
  40b14c:	ff 75 18             	push   0x18(%ebp)
  40b14f:	ff 15 ac d0 40 00    	call   *0x40d0ac  ; 0x40d0ac=KERNEL32.dll!MultiByteToWideChar
  40b155:	8b f8                	mov    %eax,%edi
  40b157:	89 7d d8             	mov    %edi,-0x28(%ebp)
  40b15a:	85 ff                	test   %edi,%edi
  40b15c:	0f 84 be 00 00 00    	je     0x40b220
  40b162:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
  40b166:	8d 1c 3f             	lea    (%edi,%edi,1),%ebx
  40b169:	8b c3                	mov    %ebx,%eax
  40b16b:	83 c0 03             	add    $0x3,%eax
  40b16e:	83 e0 fc             	and    $0xfffffffc,%eax
  40b171:	e8 9a ab ff ff       	call   0x405d10
  40b176:	89 65 e8             	mov    %esp,-0x18(%ebp)
  40b179:	8b f4                	mov    %esp,%esi
  40b17b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
  40b17e:	53                   	push   %ebx
  40b17f:	6a 00                	push   $0x0
  40b181:	56                   	push   %esi
  40b182:	e8 f9 00 00 00       	call   0x40b280
  40b187:	83 c4 0c             	add    $0xc,%esp
  40b18a:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40b18e:	eb 15                	jmp    0x40b1a5
  40b190:	33 c0                	xor    %eax,%eax
  40b192:	40                   	inc    %eax
  40b193:	c3                   	ret
  40b194:	8b 65 e8             	mov    -0x18(%ebp),%esp
  40b197:	e8 9e 0a 00 00       	call   0x40bc3a
  40b19c:	33 f6                	xor    %esi,%esi
  40b19e:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40b1a2:	8b 7d d8             	mov    -0x28(%ebp),%edi
  40b1a5:	85 f6                	test   %esi,%esi
  40b1a7:	75 17                	jne    0x40b1c0
  40b1a9:	57                   	push   %edi
  40b1aa:	6a 02                	push   $0x2
  40b1ac:	e8 53 f6 ff ff       	call   0x40a804
  40b1b1:	59                   	pop    %ecx
  40b1b2:	59                   	pop    %ecx
  40b1b3:	8b f0                	mov    %eax,%esi
  40b1b5:	85 f6                	test   %esi,%esi
  40b1b7:	74 67                	je     0x40b220
  40b1b9:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
  40b1c0:	57                   	push   %edi
  40b1c1:	56                   	push   %esi
  40b1c2:	ff 75 10             	push   0x10(%ebp)
  40b1c5:	ff 75 0c             	push   0xc(%ebp)
  40b1c8:	6a 01                	push   $0x1
  40b1ca:	ff 75 18             	push   0x18(%ebp)
  40b1cd:	ff 15 ac d0 40 00    	call   *0x40d0ac  ; 0x40d0ac=KERNEL32.dll!MultiByteToWideChar
  40b1d3:	85 c0                	test   %eax,%eax
  40b1d5:	74 11                	je     0x40b1e8
  40b1d7:	ff 75 14             	push   0x14(%ebp)
  40b1da:	50                   	push   %eax
  40b1db:	56                   	push   %esi
  40b1dc:	ff 75 08             	push   0x8(%ebp)
  40b1df:	ff 15 a0 d0 40 00    	call   *0x40d0a0  ; 0x40d0a0=KERNEL32.dll!GetStringTypeW
  40b1e5:	89 45 dc             	mov    %eax,-0x24(%ebp)
  40b1e8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  40b1ec:	74 07                	je     0x40b1f5
  40b1ee:	56                   	push   %esi
  40b1ef:	e8 83 ba ff ff       	call   0x406c77
  40b1f4:	59                   	pop    %ecx
  40b1f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  40b1f8:	eb 6e                	jmp    0x40b268
  40b1fa:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
  40b1fd:	3b de                	cmp    %esi,%ebx
  40b1ff:	75 06                	jne    0x40b207
  40b201:	8b 1d 0c 20 41 00    	mov    0x41200c,%ebx
  40b207:	8b 7d 18             	mov    0x18(%ebp),%edi
  40b20a:	85 ff                	test   %edi,%edi
  40b20c:	75 06                	jne    0x40b214
  40b20e:	8b 3d 1c 20 41 00    	mov    0x41201c,%edi
  40b214:	53                   	push   %ebx
  40b215:	e8 14 08 00 00       	call   0x40ba2e
  40b21a:	59                   	pop    %ecx
  40b21b:	83 f8 ff             	cmp    $0xffffffff,%eax
  40b21e:	75 04                	jne    0x40b224
  40b220:	33 c0                	xor    %eax,%eax
  40b222:	eb 44                	jmp    0x40b268
  40b224:	3b c7                	cmp    %edi,%eax
  40b226:	74 1e                	je     0x40b246
  40b228:	6a 00                	push   $0x0
  40b22a:	6a 00                	push   $0x0
  40b22c:	8d 4d 10             	lea    0x10(%ebp),%ecx
  40b22f:	51                   	push   %ecx
  40b230:	ff 75 0c             	push   0xc(%ebp)
  40b233:	50                   	push   %eax
  40b234:	57                   	push   %edi
  40b235:	e8 37 08 00 00       	call   0x40ba71
  40b23a:	83 c4 18             	add    $0x18,%esp
  40b23d:	8b f0                	mov    %eax,%esi
  40b23f:	85 f6                	test   %esi,%esi
  40b241:	74 dd                	je     0x40b220
  40b243:	89 75 0c             	mov    %esi,0xc(%ebp)
  40b246:	ff 75 14             	push   0x14(%ebp)
  40b249:	ff 75 10             	push   0x10(%ebp)
  40b24c:	ff 75 0c             	push   0xc(%ebp)
  40b24f:	ff 75 08             	push   0x8(%ebp)
  40b252:	53                   	push   %ebx
  40b253:	ff 15 a4 d0 40 00    	call   *0x40d0a4  ; 0x40d0a4=KERNEL32.dll!GetStringTypeA
  40b259:	8b f8                	mov    %eax,%edi
  40b25b:	85 f6                	test   %esi,%esi
  40b25d:	74 07                	je     0x40b266
  40b25f:	56                   	push   %esi
  40b260:	e8 12 ba ff ff       	call   0x406c77
  40b265:	59                   	pop    %ecx
  40b266:	8b c7                	mov    %edi,%eax
  40b268:	8d 65 c8             	lea    -0x38(%ebp),%esp
  40b26b:	e8 87 c3 ff ff       	call   0x4075f7
  40b270:	c3                   	ret
  40b271:	cc                   	int3
  40b272:	cc                   	int3
  40b273:	cc                   	int3
  40b274:	cc                   	int3
  40b275:	cc                   	int3
  40b276:	cc                   	int3
  40b277:	cc                   	int3
  40b278:	cc                   	int3
  40b279:	cc                   	int3
  40b27a:	cc                   	int3
  40b27b:	cc                   	int3
  40b27c:	cc                   	int3
  40b27d:	cc                   	int3
  40b27e:	cc                   	int3
  40b27f:	cc                   	int3
  40b280:	8b 54 24 0c          	mov    0xc(%esp),%edx
  40b284:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  40b288:	85 d2                	test   %edx,%edx
  40b28a:	74 4f                	je     0x40b2db
  40b28c:	33 c0                	xor    %eax,%eax
  40b28e:	8a 44 24 08          	mov    0x8(%esp),%al
  40b292:	57                   	push   %edi
  40b293:	8b f9                	mov    %ecx,%edi
  40b295:	83 fa 04             	cmp    $0x4,%edx
  40b298:	72 31                	jb     0x40b2cb
  40b29a:	f7 d9                	neg    %ecx
  40b29c:	83 e1 03             	and    $0x3,%ecx
  40b29f:	74 0c                	je     0x40b2ad
  40b2a1:	2b d1                	sub    %ecx,%edx
  40b2a3:	88 07                	mov    %al,(%edi)
  40b2a5:	83 c7 01             	add    $0x1,%edi
  40b2a8:	83 e9 01             	sub    $0x1,%ecx
  40b2ab:	75 f6                	jne    0x40b2a3
  40b2ad:	8b c8                	mov    %eax,%ecx
  40b2af:	c1 e0 08             	shl    $0x8,%eax
  40b2b2:	03 c1                	add    %ecx,%eax
  40b2b4:	8b c8                	mov    %eax,%ecx
  40b2b6:	c1 e0 10             	shl    $0x10,%eax
  40b2b9:	03 c1                	add    %ecx,%eax
  40b2bb:	8b ca                	mov    %edx,%ecx
  40b2bd:	83 e2 03             	and    $0x3,%edx
  40b2c0:	c1 e9 02             	shr    $0x2,%ecx
  40b2c3:	74 06                	je     0x40b2cb
  40b2c5:	f3 ab                	rep stos %eax,%es:(%edi)
  40b2c7:	85 d2                	test   %edx,%edx
  40b2c9:	74 0a                	je     0x40b2d5
  40b2cb:	88 07                	mov    %al,(%edi)
  40b2cd:	83 c7 01             	add    $0x1,%edi
  40b2d0:	83 ea 01             	sub    $0x1,%edx
  40b2d3:	75 f6                	jne    0x40b2cb
  40b2d5:	8b 44 24 08          	mov    0x8(%esp),%eax
  40b2d9:	5f                   	pop    %edi
  40b2da:	c3                   	ret
  40b2db:	8b 44 24 04          	mov    0x4(%esp),%eax
  40b2df:	c3                   	ret
  40b2e0:	56                   	push   %esi
  40b2e1:	8b 74 24 08          	mov    0x8(%esp),%esi
  40b2e5:	8b 46 0c             	mov    0xc(%esi),%eax
  40b2e8:	57                   	push   %edi
  40b2e9:	83 cf ff             	or     $0xffffffff,%edi
  40b2ec:	a8 40                	test   $0x40,%al
  40b2ee:	74 05                	je     0x40b2f5
  40b2f0:	83 c8 ff             	or     $0xffffffff,%eax
  40b2f3:	eb 3a                	jmp    0x40b32f
  40b2f5:	a8 83                	test   $0x83,%al
  40b2f7:	74 34                	je     0x40b32d
  40b2f9:	56                   	push   %esi
  40b2fa:	e8 d8 f5 ff ff       	call   0x40a8d7
  40b2ff:	56                   	push   %esi
  40b300:	8b f8                	mov    %eax,%edi
  40b302:	e8 c9 0a 00 00       	call   0x40bdd0
  40b307:	ff 76 10             	push   0x10(%esi)
  40b30a:	e8 0e 0a 00 00       	call   0x40bd1d
  40b30f:	83 c4 0c             	add    $0xc,%esp
  40b312:	85 c0                	test   %eax,%eax
  40b314:	7d 05                	jge    0x40b31b
  40b316:	83 cf ff             	or     $0xffffffff,%edi
  40b319:	eb 12                	jmp    0x40b32d
  40b31b:	8b 46 1c             	mov    0x1c(%esi),%eax
  40b31e:	85 c0                	test   %eax,%eax
  40b320:	74 0b                	je     0x40b32d
  40b322:	50                   	push   %eax
  40b323:	e8 4f b9 ff ff       	call   0x406c77
  40b328:	83 66 1c 00          	andl   $0x0,0x1c(%esi)
  40b32c:	59                   	pop    %ecx
  40b32d:	8b c7                	mov    %edi,%eax
  40b32f:	83 66 0c 00          	andl   $0x0,0xc(%esi)
  40b333:	5f                   	pop    %edi
  40b334:	5e                   	pop    %esi
  40b335:	c3                   	ret
  40b336:	8b 44 24 04          	mov    0x4(%esp),%eax
  40b33a:	3b 05 e8 32 41 00    	cmp    0x4132e8,%eax
  40b340:	73 3d                	jae    0x40b37f
  40b342:	8b c8                	mov    %eax,%ecx
  40b344:	c1 f9 05             	sar    $0x5,%ecx
  40b347:	8b 0c 8d 00 33 41 00 	mov    0x413300(,%ecx,4),%ecx
  40b34e:	8b d0                	mov    %eax,%edx
  40b350:	83 e2 1f             	and    $0x1f,%edx
  40b353:	f6 44 d1 04 01       	testb  $0x1,0x4(%ecx,%edx,8)
  40b358:	74 25                	je     0x40b37f
  40b35a:	50                   	push   %eax
  40b35b:	e8 c9 f3 ff ff       	call   0x40a729
  40b360:	59                   	pop    %ecx
  40b361:	50                   	push   %eax
  40b362:	ff 15 9c d0 40 00    	call   *0x40d09c  ; 0x40d09c=KERNEL32.dll!FlushFileBuffers
  40b368:	85 c0                	test   %eax,%eax
  40b36a:	75 08                	jne    0x40b374
  40b36c:	ff 15 0c d1 40 00    	call   *0x40d10c  ; 0x40d10c=KERNEL32.dll!GetLastError
  40b372:	eb 02                	jmp    0x40b376
  40b374:	33 c0                	xor    %eax,%eax
  40b376:	85 c0                	test   %eax,%eax
  40b378:	74 12                	je     0x40b38c
  40b37a:	a3 54 1d 41 00       	mov    %eax,0x411d54
  40b37f:	c7 05 50 1d 41 00 09 	movl   $0x9,0x411d50
  40b386:	00 00 00 
  40b389:	83 c8 ff             	or     $0xffffffff,%eax
  40b38c:	c3                   	ret
  40b38d:	55                   	push   %ebp
  40b38e:	8b ec                	mov    %esp,%ebp
  40b390:	51                   	push   %ecx
  40b391:	8b 45 08             	mov    0x8(%ebp),%eax
  40b394:	8d 48 01             	lea    0x1(%eax),%ecx
  40b397:	81 f9 00 01 00 00    	cmp    $0x100,%ecx
  40b39d:	77 0c                	ja     0x40b3ab
  40b39f:	8b 0d 68 09 41 00    	mov    0x410968,%ecx
  40b3a5:	0f b7 04 41          	movzwl (%ecx,%eax,2),%eax
  40b3a9:	eb 5b                	jmp    0x40b406
  40b3ab:	8b c8                	mov    %eax,%ecx
  40b3ad:	c1 f9 08             	sar    $0x8,%ecx
  40b3b0:	56                   	push   %esi
  40b3b1:	8b 35 68 09 41 00    	mov    0x410968,%esi
  40b3b7:	0f b6 d1             	movzbl %cl,%edx
  40b3ba:	f6 44 56 01 80       	testb  $0x80,0x1(%esi,%edx,2)
  40b3bf:	5e                   	pop    %esi
  40b3c0:	74 0f                	je     0x40b3d1
  40b3c2:	6a 02                	push   $0x2
  40b3c4:	88 45 fd             	mov    %al,-0x3(%ebp)
  40b3c7:	88 4d fc             	mov    %cl,-0x4(%ebp)
  40b3ca:	c6 45 fe 00          	movb   $0x0,-0x2(%ebp)
  40b3ce:	58                   	pop    %eax
  40b3cf:	eb 0a                	jmp    0x40b3db
  40b3d1:	88 45 fc             	mov    %al,-0x4(%ebp)
  40b3d4:	33 c0                	xor    %eax,%eax
  40b3d6:	c6 45 fd 00          	movb   $0x0,-0x3(%ebp)
  40b3da:	40                   	inc    %eax
  40b3db:	6a 01                	push   $0x1
  40b3dd:	ff 35 0c 20 41 00    	push   0x41200c
  40b3e3:	8d 4d 0a             	lea    0xa(%ebp),%ecx
  40b3e6:	ff 35 1c 20 41 00    	push   0x41201c
  40b3ec:	51                   	push   %ecx
  40b3ed:	50                   	push   %eax
  40b3ee:	8d 45 fc             	lea    -0x4(%ebp),%eax
  40b3f1:	50                   	push   %eax
  40b3f2:	6a 01                	push   $0x1
  40b3f4:	e8 be fc ff ff       	call   0x40b0b7
  40b3f9:	83 c4 1c             	add    $0x1c,%esp
  40b3fc:	85 c0                	test   %eax,%eax
  40b3fe:	75 02                	jne    0x40b402
  40b400:	c9                   	leave
  40b401:	c3                   	ret
  40b402:	0f b7 45 0a          	movzwl 0xa(%ebp),%eax
  40b406:	23 45 0c             	and    0xc(%ebp),%eax
  40b409:	c9                   	leave
  40b40a:	c3                   	ret
  40b40b:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  40b40f:	85 c9                	test   %ecx,%ecx
  40b411:	74 0b                	je     0x40b41e
  40b413:	49                   	dec    %ecx
  40b414:	80 38 00             	cmpb   $0x0,(%eax)
  40b417:	74 06                	je     0x40b41f
  40b419:	40                   	inc    %eax
  40b41a:	85 c9                	test   %ecx,%ecx
  40b41c:	75 f5                	jne    0x40b413
  40b41e:	49                   	dec    %ecx
  40b41f:	8b 44 24 04          	mov    0x4(%esp),%eax
  40b423:	2b c1                	sub    %ecx,%eax
  40b425:	48                   	dec    %eax
  40b426:	c3                   	ret
  40b427:	6a 40                	push   $0x40
  40b429:	68 00 e3 40 00       	push   $0x40e300
  40b42e:	e8 89 c1 ff ff       	call   0x4075bc
  40b433:	a1 6c 04 41 00       	mov    0x41046c,%eax
  40b438:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  40b43b:	33 ff                	xor    %edi,%edi
  40b43d:	33 f6                	xor    %esi,%esi
  40b43f:	46                   	inc    %esi
  40b440:	39 3d 5c 20 41 00    	cmp    %edi,0x41205c
  40b446:	75 32                	jne    0x40b47a
  40b448:	56                   	push   %esi
  40b449:	b8 c4 e2 40 00       	mov    $0x40e2c4,%eax
  40b44e:	50                   	push   %eax
  40b44f:	56                   	push   %esi
  40b450:	50                   	push   %eax
  40b451:	57                   	push   %edi
  40b452:	57                   	push   %edi
  40b453:	ff 15 94 d0 40 00    	call   *0x40d094  ; 0x40d094=KERNEL32.dll!CompareStringW
  40b459:	85 c0                	test   %eax,%eax
  40b45b:	74 08                	je     0x40b465
  40b45d:	89 35 5c 20 41 00    	mov    %esi,0x41205c
  40b463:	eb 15                	jmp    0x40b47a
  40b465:	ff 15 0c d1 40 00    	call   *0x40d10c  ; 0x40d10c=KERNEL32.dll!GetLastError
  40b46b:	83 f8 78             	cmp    $0x78,%eax
  40b46e:	75 0a                	jne    0x40b47a
  40b470:	c7 05 5c 20 41 00 02 	movl   $0x2,0x41205c
  40b477:	00 00 00 
  40b47a:	39 7d 14             	cmp    %edi,0x14(%ebp)
  40b47d:	7e 0f                	jle    0x40b48e
  40b47f:	ff 75 14             	push   0x14(%ebp)
  40b482:	8b 45 10             	mov    0x10(%ebp),%eax
  40b485:	e8 81 ff ff ff       	call   0x40b40b
  40b48a:	59                   	pop    %ecx
  40b48b:	89 45 14             	mov    %eax,0x14(%ebp)
  40b48e:	8b 45 1c             	mov    0x1c(%ebp),%eax
  40b491:	3b c7                	cmp    %edi,%eax
  40b493:	7e 0d                	jle    0x40b4a2
  40b495:	50                   	push   %eax
  40b496:	8b 45 18             	mov    0x18(%ebp),%eax
  40b499:	e8 6d ff ff ff       	call   0x40b40b
  40b49e:	59                   	pop    %ecx
  40b49f:	89 45 1c             	mov    %eax,0x1c(%ebp)
  40b4a2:	8b 0d 5c 20 41 00    	mov    0x41205c,%ecx
  40b4a8:	6a 02                	push   $0x2
  40b4aa:	5b                   	pop    %ebx
  40b4ab:	3b cb                	cmp    %ebx,%ecx
  40b4ad:	0f 84 39 02 00 00    	je     0x40b6ec
  40b4b3:	3b cf                	cmp    %edi,%ecx
  40b4b5:	0f 84 31 02 00 00    	je     0x40b6ec
  40b4bb:	3b ce                	cmp    %esi,%ecx
  40b4bd:	0f 85 56 02 00 00    	jne    0x40b719
  40b4c3:	89 7d c4             	mov    %edi,-0x3c(%ebp)
  40b4c6:	89 7d bc             	mov    %edi,-0x44(%ebp)
  40b4c9:	89 7d c0             	mov    %edi,-0x40(%ebp)
  40b4cc:	39 7d 20             	cmp    %edi,0x20(%ebp)
  40b4cf:	75 09                	jne    0x40b4da
  40b4d1:	8b 0d 1c 20 41 00    	mov    0x41201c,%ecx
  40b4d7:	89 4d 20             	mov    %ecx,0x20(%ebp)
  40b4da:	39 7d 14             	cmp    %edi,0x14(%ebp)
  40b4dd:	74 08                	je     0x40b4e7
  40b4df:	3b c7                	cmp    %edi,%eax
  40b4e1:	0f 85 a9 00 00 00    	jne    0x40b590
  40b4e7:	39 45 14             	cmp    %eax,0x14(%ebp)
  40b4ea:	75 07                	jne    0x40b4f3
  40b4ec:	8b c3                	mov    %ebx,%eax
  40b4ee:	e9 a7 02 00 00       	jmp    0x40b79a
  40b4f3:	3b c6                	cmp    %esi,%eax
  40b4f5:	0f 8f 9d 02 00 00    	jg     0x40b798
  40b4fb:	39 75 14             	cmp    %esi,0x14(%ebp)
  40b4fe:	7e 08                	jle    0x40b508
  40b500:	6a 03                	push   $0x3
  40b502:	58                   	pop    %eax
  40b503:	e9 92 02 00 00       	jmp    0x40b79a
  40b508:	8d 45 d0             	lea    -0x30(%ebp),%eax
  40b50b:	50                   	push   %eax
  40b50c:	ff 75 20             	push   0x20(%ebp)
  40b50f:	ff 15 c8 d0 40 00    	call   *0x40d0c8  ; 0x40d0c8=KERNEL32.dll!GetCPInfo
  40b515:	85 c0                	test   %eax,%eax
  40b517:	0f 84 fc 01 00 00    	je     0x40b719
  40b51d:	39 7d 14             	cmp    %edi,0x14(%ebp)
  40b520:	7e 2b                	jle    0x40b54d
  40b522:	39 5d d0             	cmp    %ebx,-0x30(%ebp)
  40b525:	72 d9                	jb     0x40b500
  40b527:	8d 45 d6             	lea    -0x2a(%ebp),%eax
  40b52a:	80 7d d6 00          	cmpb   $0x0,-0x2a(%ebp)
  40b52e:	74 d0                	je     0x40b500
  40b530:	8a 50 01             	mov    0x1(%eax),%dl
  40b533:	84 d2                	test   %dl,%dl
  40b535:	74 c9                	je     0x40b500
  40b537:	8b 4d 10             	mov    0x10(%ebp),%ecx
  40b53a:	8a 09                	mov    (%ecx),%cl
  40b53c:	3a 08                	cmp    (%eax),%cl
  40b53e:	72 04                	jb     0x40b544
  40b540:	3a ca                	cmp    %dl,%cl
  40b542:	76 a8                	jbe    0x40b4ec
  40b544:	03 c3                	add    %ebx,%eax
  40b546:	80 38 00             	cmpb   $0x0,(%eax)
  40b549:	75 e5                	jne    0x40b530
  40b54b:	eb b3                	jmp    0x40b500
  40b54d:	39 7d 1c             	cmp    %edi,0x1c(%ebp)
  40b550:	7e 3e                	jle    0x40b590
  40b552:	39 5d d0             	cmp    %ebx,-0x30(%ebp)
  40b555:	0f 82 3d 02 00 00    	jb     0x40b798
  40b55b:	8d 45 d6             	lea    -0x2a(%ebp),%eax
  40b55e:	80 7d d6 00          	cmpb   $0x0,-0x2a(%ebp)
  40b562:	0f 84 30 02 00 00    	je     0x40b798
  40b568:	8a 50 01             	mov    0x1(%eax),%dl
  40b56b:	84 d2                	test   %dl,%dl
  40b56d:	0f 84 25 02 00 00    	je     0x40b798
  40b573:	8b 4d 18             	mov    0x18(%ebp),%ecx
  40b576:	8a 09                	mov    (%ecx),%cl
  40b578:	3a 08                	cmp    (%eax),%cl
  40b57a:	72 08                	jb     0x40b584
  40b57c:	3a ca                	cmp    %dl,%cl
  40b57e:	0f 86 68 ff ff ff    	jbe    0x40b4ec
  40b584:	03 c3                	add    %ebx,%eax
  40b586:	80 38 00             	cmpb   $0x0,(%eax)
  40b589:	75 dd                	jne    0x40b568
  40b58b:	e9 08 02 00 00       	jmp    0x40b798
  40b590:	57                   	push   %edi
  40b591:	57                   	push   %edi
  40b592:	ff 75 14             	push   0x14(%ebp)
  40b595:	ff 75 10             	push   0x10(%ebp)
  40b598:	6a 09                	push   $0x9
  40b59a:	ff 75 20             	push   0x20(%ebp)
  40b59d:	ff 15 ac d0 40 00    	call   *0x40d0ac  ; 0x40d0ac=KERNEL32.dll!MultiByteToWideChar
  40b5a3:	8b d8                	mov    %eax,%ebx
  40b5a5:	89 5d b8             	mov    %ebx,-0x48(%ebp)
  40b5a8:	3b df                	cmp    %edi,%ebx
  40b5aa:	0f 84 69 01 00 00    	je     0x40b719
  40b5b0:	89 7d fc             	mov    %edi,-0x4(%ebp)
  40b5b3:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
  40b5b6:	83 c0 03             	add    $0x3,%eax
  40b5b9:	83 e0 fc             	and    $0xfffffffc,%eax
  40b5bc:	e8 4f a7 ff ff       	call   0x405d10
  40b5c1:	89 65 e8             	mov    %esp,-0x18(%ebp)
  40b5c4:	8b c4                	mov    %esp,%eax
  40b5c6:	89 45 cc             	mov    %eax,-0x34(%ebp)
  40b5c9:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40b5cd:	eb 1c                	jmp    0x40b5eb
  40b5cf:	33 c0                	xor    %eax,%eax
  40b5d1:	40                   	inc    %eax
  40b5d2:	c3                   	ret
  40b5d3:	8b 65 e8             	mov    -0x18(%ebp),%esp
  40b5d6:	e8 5f 06 00 00       	call   0x40bc3a
  40b5db:	83 65 cc 00          	andl   $0x0,-0x34(%ebp)
  40b5df:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40b5e3:	8b 5d b8             	mov    -0x48(%ebp),%ebx
  40b5e6:	33 f6                	xor    %esi,%esi
  40b5e8:	46                   	inc    %esi
  40b5e9:	33 ff                	xor    %edi,%edi
  40b5eb:	8b 45 cc             	mov    -0x34(%ebp),%eax
  40b5ee:	3b c7                	cmp    %edi,%eax
  40b5f0:	75 18                	jne    0x40b60a
  40b5f2:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
  40b5f5:	50                   	push   %eax
  40b5f6:	e8 6a b6 ff ff       	call   0x406c65
  40b5fb:	59                   	pop    %ecx
  40b5fc:	89 45 cc             	mov    %eax,-0x34(%ebp)
  40b5ff:	3b c7                	cmp    %edi,%eax
  40b601:	0f 84 12 01 00 00    	je     0x40b719
  40b607:	89 75 c4             	mov    %esi,-0x3c(%ebp)
  40b60a:	53                   	push   %ebx
  40b60b:	50                   	push   %eax
  40b60c:	ff 75 14             	push   0x14(%ebp)
  40b60f:	ff 75 10             	push   0x10(%ebp)
  40b612:	56                   	push   %esi
  40b613:	ff 75 20             	push   0x20(%ebp)
  40b616:	ff 15 ac d0 40 00    	call   *0x40d0ac  ; 0x40d0ac=KERNEL32.dll!MultiByteToWideChar
  40b61c:	85 c0                	test   %eax,%eax
  40b61e:	0f 84 b1 00 00 00    	je     0x40b6d5
  40b624:	6a 00                	push   $0x0
  40b626:	6a 00                	push   $0x0
  40b628:	ff 75 1c             	push   0x1c(%ebp)
  40b62b:	ff 75 18             	push   0x18(%ebp)
  40b62e:	6a 09                	push   $0x9
  40b630:	ff 75 20             	push   0x20(%ebp)
  40b633:	ff 15 ac d0 40 00    	call   *0x40d0ac  ; 0x40d0ac=KERNEL32.dll!MultiByteToWideChar
  40b639:	8b f0                	mov    %eax,%esi
  40b63b:	89 75 b4             	mov    %esi,-0x4c(%ebp)
  40b63e:	85 f6                	test   %esi,%esi
  40b640:	0f 84 8f 00 00 00    	je     0x40b6d5
  40b646:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
  40b64d:	8d 04 36             	lea    (%esi,%esi,1),%eax
  40b650:	83 c0 03             	add    $0x3,%eax
  40b653:	83 e0 fc             	and    $0xfffffffc,%eax
  40b656:	e8 b5 a6 ff ff       	call   0x405d10
  40b65b:	89 65 e8             	mov    %esp,-0x18(%ebp)
  40b65e:	8b fc                	mov    %esp,%edi
  40b660:	89 7d b0             	mov    %edi,-0x50(%ebp)
  40b663:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40b667:	eb 18                	jmp    0x40b681
  40b669:	33 c0                	xor    %eax,%eax
  40b66b:	40                   	inc    %eax
  40b66c:	c3                   	ret
  40b66d:	8b 65 e8             	mov    -0x18(%ebp),%esp
  40b670:	e8 c5 05 00 00       	call   0x40bc3a
  40b675:	33 ff                	xor    %edi,%edi
  40b677:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40b67b:	8b 5d b8             	mov    -0x48(%ebp),%ebx
  40b67e:	8b 75 b4             	mov    -0x4c(%ebp),%esi
  40b681:	85 ff                	test   %edi,%edi
  40b683:	75 17                	jne    0x40b69c
  40b685:	8d 04 36             	lea    (%esi,%esi,1),%eax
  40b688:	50                   	push   %eax
  40b689:	e8 d7 b5 ff ff       	call   0x406c65
  40b68e:	59                   	pop    %ecx
  40b68f:	8b f8                	mov    %eax,%edi
  40b691:	85 ff                	test   %edi,%edi
  40b693:	74 40                	je     0x40b6d5
  40b695:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
  40b69c:	56                   	push   %esi
  40b69d:	57                   	push   %edi
  40b69e:	ff 75 1c             	push   0x1c(%ebp)
  40b6a1:	ff 75 18             	push   0x18(%ebp)
  40b6a4:	6a 01                	push   $0x1
  40b6a6:	ff 75 20             	push   0x20(%ebp)
  40b6a9:	ff 15 ac d0 40 00    	call   *0x40d0ac  ; 0x40d0ac=KERNEL32.dll!MultiByteToWideChar
  40b6af:	85 c0                	test   %eax,%eax
  40b6b1:	74 15                	je     0x40b6c8
  40b6b3:	56                   	push   %esi
  40b6b4:	57                   	push   %edi
  40b6b5:	53                   	push   %ebx
  40b6b6:	ff 75 cc             	push   -0x34(%ebp)
  40b6b9:	ff 75 0c             	push   0xc(%ebp)
  40b6bc:	ff 75 08             	push   0x8(%ebp)
  40b6bf:	ff 15 94 d0 40 00    	call   *0x40d094  ; 0x40d094=KERNEL32.dll!CompareStringW
  40b6c5:	89 45 c0             	mov    %eax,-0x40(%ebp)
  40b6c8:	83 7d bc 00          	cmpl   $0x0,-0x44(%ebp)
  40b6cc:	74 07                	je     0x40b6d5
  40b6ce:	57                   	push   %edi
  40b6cf:	e8 a3 b5 ff ff       	call   0x406c77
  40b6d4:	59                   	pop    %ecx
  40b6d5:	83 7d c4 00          	cmpl   $0x0,-0x3c(%ebp)
  40b6d9:	74 09                	je     0x40b6e4
  40b6db:	ff 75 cc             	push   -0x34(%ebp)
  40b6de:	e8 94 b5 ff ff       	call   0x406c77
  40b6e3:	59                   	pop    %ecx
  40b6e4:	8b 45 c0             	mov    -0x40(%ebp),%eax
  40b6e7:	e9 ae 00 00 00       	jmp    0x40b79a
  40b6ec:	89 7d c8             	mov    %edi,-0x38(%ebp)
  40b6ef:	39 7d 08             	cmp    %edi,0x8(%ebp)
  40b6f2:	75 08                	jne    0x40b6fc
  40b6f4:	a1 0c 20 41 00       	mov    0x41200c,%eax
  40b6f9:	89 45 08             	mov    %eax,0x8(%ebp)
  40b6fc:	8b 5d 20             	mov    0x20(%ebp),%ebx
  40b6ff:	3b df                	cmp    %edi,%ebx
  40b701:	75 06                	jne    0x40b709
  40b703:	8b 1d 1c 20 41 00    	mov    0x41201c,%ebx
  40b709:	ff 75 08             	push   0x8(%ebp)
  40b70c:	e8 1d 03 00 00       	call   0x40ba2e
  40b711:	59                   	pop    %ecx
  40b712:	8b f0                	mov    %eax,%esi
  40b714:	83 fe ff             	cmp    $0xffffffff,%esi
  40b717:	75 04                	jne    0x40b71d
  40b719:	33 c0                	xor    %eax,%eax
  40b71b:	eb 7d                	jmp    0x40b79a
  40b71d:	3b f3                	cmp    %ebx,%esi
  40b71f:	74 49                	je     0x40b76a
  40b721:	6a 00                	push   $0x0
  40b723:	6a 00                	push   $0x0
  40b725:	8d 45 14             	lea    0x14(%ebp),%eax
  40b728:	50                   	push   %eax
  40b729:	ff 75 10             	push   0x10(%ebp)
  40b72c:	56                   	push   %esi
  40b72d:	53                   	push   %ebx
  40b72e:	e8 3e 03 00 00       	call   0x40ba71
  40b733:	83 c4 18             	add    $0x18,%esp
  40b736:	8b f8                	mov    %eax,%edi
  40b738:	85 ff                	test   %edi,%edi
  40b73a:	74 dd                	je     0x40b719
  40b73c:	6a 00                	push   $0x0
  40b73e:	6a 00                	push   $0x0
  40b740:	8d 45 1c             	lea    0x1c(%ebp),%eax
  40b743:	50                   	push   %eax
  40b744:	ff 75 18             	push   0x18(%ebp)
  40b747:	56                   	push   %esi
  40b748:	53                   	push   %ebx
  40b749:	e8 23 03 00 00       	call   0x40ba71
  40b74e:	83 c4 18             	add    $0x18,%esp
  40b751:	89 45 c8             	mov    %eax,-0x38(%ebp)
  40b754:	85 c0                	test   %eax,%eax
  40b756:	75 09                	jne    0x40b761
  40b758:	57                   	push   %edi
  40b759:	e8 19 b5 ff ff       	call   0x406c77
  40b75e:	59                   	pop    %ecx
  40b75f:	eb b8                	jmp    0x40b719
  40b761:	89 7d 10             	mov    %edi,0x10(%ebp)
  40b764:	8b 45 c8             	mov    -0x38(%ebp),%eax
  40b767:	89 45 18             	mov    %eax,0x18(%ebp)
  40b76a:	ff 75 1c             	push   0x1c(%ebp)
  40b76d:	ff 75 18             	push   0x18(%ebp)
  40b770:	ff 75 14             	push   0x14(%ebp)
  40b773:	ff 75 10             	push   0x10(%ebp)
  40b776:	ff 75 0c             	push   0xc(%ebp)
  40b779:	ff 75 08             	push   0x8(%ebp)
  40b77c:	ff 15 98 d0 40 00    	call   *0x40d098  ; 0x40d098=KERNEL32.dll!CompareStringA
  40b782:	8b f0                	mov    %eax,%esi
  40b784:	85 ff                	test   %edi,%edi
  40b786:	74 10                	je     0x40b798
  40b788:	57                   	push   %edi
  40b789:	e8 e9 b4 ff ff       	call   0x406c77
  40b78e:	ff 75 c8             	push   -0x38(%ebp)
  40b791:	e8 e1 b4 ff ff       	call   0x406c77
  40b796:	59                   	pop    %ecx
  40b797:	59                   	pop    %ecx
  40b798:	8b c6                	mov    %esi,%eax
  40b79a:	8d 65 a4             	lea    -0x5c(%ebp),%esp
  40b79d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  40b7a0:	e8 77 e3 ff ff       	call   0x409b1c
  40b7a5:	e8 4d be ff ff       	call   0x4075f7
  40b7aa:	c3                   	ret
  40b7ab:	56                   	push   %esi
  40b7ac:	8b 35 7c 1d 41 00    	mov    0x411d7c,%esi
  40b7b2:	eb 22                	jmp    0x40b7d6
  40b7b4:	57                   	push   %edi
  40b7b5:	50                   	push   %eax
  40b7b6:	ff 74 24 10          	push   0x10(%esp)
  40b7ba:	e8 6d f4 ff ff       	call   0x40ac2c
  40b7bf:	83 c4 0c             	add    $0xc,%esp
  40b7c2:	85 c0                	test   %eax,%eax
  40b7c4:	75 0d                	jne    0x40b7d3
  40b7c6:	8b 06                	mov    (%esi),%eax
  40b7c8:	8a 04 07             	mov    (%edi,%eax,1),%al
  40b7cb:	3c 3d                	cmp    $0x3d,%al
  40b7cd:	74 1c                	je     0x40b7eb
  40b7cf:	84 c0                	test   %al,%al
  40b7d1:	74 18                	je     0x40b7eb
  40b7d3:	83 c6 04             	add    $0x4,%esi
  40b7d6:	8b 06                	mov    (%esi),%eax
  40b7d8:	85 c0                	test   %eax,%eax
  40b7da:	75 d8                	jne    0x40b7b4
  40b7dc:	8b c6                	mov    %esi,%eax
  40b7de:	2b 05 7c 1d 41 00    	sub    0x411d7c,%eax
  40b7e4:	5e                   	pop    %esi
  40b7e5:	c1 f8 02             	sar    $0x2,%eax
  40b7e8:	f7 d8                	neg    %eax
  40b7ea:	c3                   	ret
  40b7eb:	8b c6                	mov    %esi,%eax
  40b7ed:	2b 05 7c 1d 41 00    	sub    0x411d7c,%eax
  40b7f3:	5e                   	pop    %esi
  40b7f4:	c1 f8 02             	sar    $0x2,%eax
  40b7f7:	c3                   	ret
  40b7f8:	55                   	push   %ebp
  40b7f9:	8b ec                	mov    %esp,%ebp
  40b7fb:	51                   	push   %ecx
  40b7fc:	33 c9                	xor    %ecx,%ecx
  40b7fe:	85 ff                	test   %edi,%edi
  40b800:	8b c7                	mov    %edi,%eax
  40b802:	75 02                	jne    0x40b806
  40b804:	c9                   	leave
  40b805:	c3                   	ret
  40b806:	83 3f 00             	cmpl   $0x0,(%edi)
  40b809:	74 09                	je     0x40b814
  40b80b:	83 c0 04             	add    $0x4,%eax
  40b80e:	41                   	inc    %ecx
  40b80f:	83 38 00             	cmpl   $0x0,(%eax)
  40b812:	75 f7                	jne    0x40b80b
  40b814:	53                   	push   %ebx
  40b815:	8d 04 8d 04 00 00 00 	lea    0x4(,%ecx,4),%eax
  40b81c:	56                   	push   %esi
  40b81d:	50                   	push   %eax
  40b81e:	e8 42 b4 ff ff       	call   0x406c65
  40b823:	8b f0                	mov    %eax,%esi
  40b825:	85 f6                	test   %esi,%esi
  40b827:	59                   	pop    %ecx
  40b828:	89 75 fc             	mov    %esi,-0x4(%ebp)
  40b82b:	75 08                	jne    0x40b835
  40b82d:	6a 09                	push   $0x9
  40b82f:	e8 89 ae ff ff       	call   0x4066bd
  40b834:	59                   	pop    %ecx
  40b835:	8b 07                	mov    (%edi),%eax
  40b837:	8b df                	mov    %edi,%ebx
  40b839:	eb 11                	jmp    0x40b84c
  40b83b:	50                   	push   %eax
  40b83c:	e8 ba 05 00 00       	call   0x40bdfb
  40b841:	89 06                	mov    %eax,(%esi)
  40b843:	83 c6 04             	add    $0x4,%esi
  40b846:	83 c3 04             	add    $0x4,%ebx
  40b849:	8b 03                	mov    (%ebx),%eax
  40b84b:	59                   	pop    %ecx
  40b84c:	85 c0                	test   %eax,%eax
  40b84e:	75 eb                	jne    0x40b83b
  40b850:	21 06                	and    %eax,(%esi)
  40b852:	8b 45 fc             	mov    -0x4(%ebp),%eax
  40b855:	5e                   	pop    %esi
  40b856:	5b                   	pop    %ebx
  40b857:	c9                   	leave
  40b858:	c3                   	ret
  40b859:	55                   	push   %ebp
  40b85a:	8b ec                	mov    %esp,%ebp
  40b85c:	83 ec 10             	sub    $0x10,%esp
  40b85f:	8b 45 08             	mov    0x8(%ebp),%eax
  40b862:	53                   	push   %ebx
  40b863:	33 db                	xor    %ebx,%ebx
  40b865:	3b c3                	cmp    %ebx,%eax
  40b867:	57                   	push   %edi
  40b868:	89 5d f0             	mov    %ebx,-0x10(%ebp)
  40b86b:	75 05                	jne    0x40b872
  40b86d:	83 c8 ff             	or     $0xffffffff,%eax
  40b870:	eb 61                	jmp    0x40b8d3
  40b872:	56                   	push   %esi
  40b873:	8b 30                	mov    (%eax),%esi
  40b875:	3b f3                	cmp    %ebx,%esi
  40b877:	89 75 fc             	mov    %esi,-0x4(%ebp)
  40b87a:	74 53                	je     0x40b8cf
  40b87c:	6a 3d                	push   $0x3d
  40b87e:	56                   	push   %esi
  40b87f:	e8 a2 05 00 00       	call   0x40be26
  40b884:	3b c3                	cmp    %ebx,%eax
  40b886:	59                   	pop    %ecx
  40b887:	59                   	pop    %ecx
  40b888:	89 45 f4             	mov    %eax,-0xc(%ebp)
  40b88b:	74 42                	je     0x40b8cf
  40b88d:	3b f0                	cmp    %eax,%esi
  40b88f:	74 3e                	je     0x40b8cf
  40b891:	33 c9                	xor    %ecx,%ecx
  40b893:	38 58 01             	cmp    %bl,0x1(%eax)
  40b896:	a1 7c 1d 41 00       	mov    0x411d7c,%eax
  40b89b:	0f 94 c1             	sete   %cl
  40b89e:	3b 05 80 1d 41 00    	cmp    0x411d80,%eax
  40b8a4:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  40b8a7:	75 0c                	jne    0x40b8b5
  40b8a9:	8b f8                	mov    %eax,%edi
  40b8ab:	e8 48 ff ff ff       	call   0x40b7f8
  40b8b0:	a3 7c 1d 41 00       	mov    %eax,0x411d7c
  40b8b5:	3b c3                	cmp    %ebx,%eax
  40b8b7:	75 55                	jne    0x40b90e
  40b8b9:	39 5d 0c             	cmp    %ebx,0xc(%ebp)
  40b8bc:	74 19                	je     0x40b8d7
  40b8be:	39 1d 84 1d 41 00    	cmp    %ebx,0x411d84
  40b8c4:	74 11                	je     0x40b8d7
  40b8c6:	e8 a0 f3 ff ff       	call   0x40ac6b
  40b8cb:	85 c0                	test   %eax,%eax
  40b8cd:	74 3f                	je     0x40b90e
  40b8cf:	83 c8 ff             	or     $0xffffffff,%eax
  40b8d2:	5e                   	pop    %esi
  40b8d3:	5f                   	pop    %edi
  40b8d4:	5b                   	pop    %ebx
  40b8d5:	c9                   	leave
  40b8d6:	c3                   	ret
  40b8d7:	39 5d f8             	cmp    %ebx,-0x8(%ebp)
  40b8da:	74 04                	je     0x40b8e0
  40b8dc:	33 c0                	xor    %eax,%eax
  40b8de:	eb f2                	jmp    0x40b8d2
  40b8e0:	6a 04                	push   $0x4
  40b8e2:	e8 7e b3 ff ff       	call   0x406c65
  40b8e7:	3b c3                	cmp    %ebx,%eax
  40b8e9:	59                   	pop    %ecx
  40b8ea:	a3 7c 1d 41 00       	mov    %eax,0x411d7c
  40b8ef:	74 de                	je     0x40b8cf
  40b8f1:	89 18                	mov    %ebx,(%eax)
  40b8f3:	39 1d 84 1d 41 00    	cmp    %ebx,0x411d84
  40b8f9:	75 13                	jne    0x40b90e
  40b8fb:	6a 04                	push   $0x4
  40b8fd:	e8 63 b3 ff ff       	call   0x406c65
  40b902:	3b c3                	cmp    %ebx,%eax
  40b904:	59                   	pop    %ecx
  40b905:	a3 84 1d 41 00       	mov    %eax,0x411d84
  40b90a:	74 c3                	je     0x40b8cf
  40b90c:	89 18                	mov    %ebx,(%eax)
  40b90e:	8b 7d f4             	mov    -0xc(%ebp),%edi
  40b911:	2b 7d fc             	sub    -0x4(%ebp),%edi
  40b914:	ff 75 fc             	push   -0x4(%ebp)
  40b917:	8b 35 7c 1d 41 00    	mov    0x411d7c,%esi
  40b91d:	e8 89 fe ff ff       	call   0x40b7ab
  40b922:	8b f8                	mov    %eax,%edi
  40b924:	3b fb                	cmp    %ebx,%edi
  40b926:	59                   	pop    %ecx
  40b927:	7c 46                	jl     0x40b96f
  40b929:	39 1e                	cmp    %ebx,(%esi)
  40b92b:	74 42                	je     0x40b96f
  40b92d:	8d 34 be             	lea    (%esi,%edi,4),%esi
  40b930:	ff 36                	push   (%esi)
  40b932:	e8 40 b3 ff ff       	call   0x406c77
  40b937:	39 5d f8             	cmp    %ebx,-0x8(%ebp)
  40b93a:	59                   	pop    %ecx
  40b93b:	75 15                	jne    0x40b952
  40b93d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  40b940:	89 06                	mov    %eax,(%esi)
  40b942:	8b 45 08             	mov    0x8(%ebp),%eax
  40b945:	89 18                	mov    %ebx,(%eax)
  40b947:	eb 67                	jmp    0x40b9b0
  40b949:	8b 46 04             	mov    0x4(%esi),%eax
  40b94c:	89 06                	mov    %eax,(%esi)
  40b94e:	47                   	inc    %edi
  40b94f:	83 c6 04             	add    $0x4,%esi
  40b952:	39 1e                	cmp    %ebx,(%esi)
  40b954:	75 f3                	jne    0x40b949
  40b956:	8b c7                	mov    %edi,%eax
  40b958:	c1 e0 02             	shl    $0x2,%eax
  40b95b:	50                   	push   %eax
  40b95c:	ff 35 7c 1d 41 00    	push   0x411d7c
  40b962:	e8 57 af ff ff       	call   0x4068be
  40b967:	3b c3                	cmp    %ebx,%eax
  40b969:	59                   	pop    %ecx
  40b96a:	59                   	pop    %ecx
  40b96b:	74 43                	je     0x40b9b0
  40b96d:	eb 3c                	jmp    0x40b9ab
  40b96f:	39 5d f8             	cmp    %ebx,-0x8(%ebp)
  40b972:	0f 85 a3 00 00 00    	jne    0x40ba1b
  40b978:	3b fb                	cmp    %ebx,%edi
  40b97a:	7d 02                	jge    0x40b97e
  40b97c:	f7 df                	neg    %edi
  40b97e:	8d 04 bd 08 00 00 00 	lea    0x8(,%edi,4),%eax
  40b985:	50                   	push   %eax
  40b986:	ff 35 7c 1d 41 00    	push   0x411d7c
  40b98c:	e8 2d af ff ff       	call   0x4068be
  40b991:	3b c3                	cmp    %ebx,%eax
  40b993:	59                   	pop    %ecx
  40b994:	59                   	pop    %ecx
  40b995:	0f 84 34 ff ff ff    	je     0x40b8cf
  40b99b:	8b 55 fc             	mov    -0x4(%ebp),%edx
  40b99e:	8d 0c b8             	lea    (%eax,%edi,4),%ecx
  40b9a1:	89 11                	mov    %edx,(%ecx)
  40b9a3:	89 59 04             	mov    %ebx,0x4(%ecx)
  40b9a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  40b9a9:	89 19                	mov    %ebx,(%ecx)
  40b9ab:	a3 7c 1d 41 00       	mov    %eax,0x411d7c
  40b9b0:	39 5d 0c             	cmp    %ebx,0xc(%ebp)
  40b9b3:	74 50                	je     0x40ba05
  40b9b5:	ff 75 fc             	push   -0x4(%ebp)
  40b9b8:	e8 a3 e0 ff ff       	call   0x409a60
  40b9bd:	40                   	inc    %eax
  40b9be:	40                   	inc    %eax
  40b9bf:	50                   	push   %eax
  40b9c0:	e8 a0 b2 ff ff       	call   0x406c65
  40b9c5:	8b f0                	mov    %eax,%esi
  40b9c7:	3b f3                	cmp    %ebx,%esi
  40b9c9:	59                   	pop    %ecx
  40b9ca:	59                   	pop    %ecx
  40b9cb:	74 38                	je     0x40ba05
  40b9cd:	ff 75 fc             	push   -0x4(%ebp)
  40b9d0:	56                   	push   %esi
  40b9d1:	e8 7a e4 ff ff       	call   0x409e50
  40b9d6:	8b c6                	mov    %esi,%eax
  40b9d8:	2b 45 fc             	sub    -0x4(%ebp),%eax
  40b9db:	59                   	pop    %ecx
  40b9dc:	03 45 f4             	add    -0xc(%ebp),%eax
  40b9df:	59                   	pop    %ecx
  40b9e0:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  40b9e3:	88 18                	mov    %bl,(%eax)
  40b9e5:	40                   	inc    %eax
  40b9e6:	f7 d9                	neg    %ecx
  40b9e8:	1b c9                	sbb    %ecx,%ecx
  40b9ea:	f7 d1                	not    %ecx
  40b9ec:	23 c8                	and    %eax,%ecx
  40b9ee:	51                   	push   %ecx
  40b9ef:	56                   	push   %esi
  40b9f0:	ff 15 20 d1 40 00    	call   *0x40d120  ; 0x40d120=KERNEL32.dll!SetEnvironmentVariableA
  40b9f6:	85 c0                	test   %eax,%eax
  40b9f8:	75 04                	jne    0x40b9fe
  40b9fa:	83 4d f0 ff          	orl    $0xffffffff,-0x10(%ebp)
  40b9fe:	56                   	push   %esi
  40b9ff:	e8 73 b2 ff ff       	call   0x406c77
  40ba04:	59                   	pop    %ecx
  40ba05:	39 5d f8             	cmp    %ebx,-0x8(%ebp)
  40ba08:	74 09                	je     0x40ba13
  40ba0a:	ff 75 fc             	push   -0x4(%ebp)
  40ba0d:	e8 65 b2 ff ff       	call   0x406c77
  40ba12:	59                   	pop    %ecx
  40ba13:	8b 45 f0             	mov    -0x10(%ebp),%eax
  40ba16:	e9 b7 fe ff ff       	jmp    0x40b8d2
  40ba1b:	ff 75 fc             	push   -0x4(%ebp)
  40ba1e:	e8 54 b2 ff ff       	call   0x406c77
  40ba23:	8b 45 08             	mov    0x8(%ebp),%eax
  40ba26:	59                   	pop    %ecx
  40ba27:	89 18                	mov    %ebx,(%eax)
  40ba29:	e9 ae fe ff ff       	jmp    0x40b8dc
  40ba2e:	55                   	push   %ebp
  40ba2f:	8b ec                	mov    %esp,%ebp
  40ba31:	83 ec 0c             	sub    $0xc,%esp
  40ba34:	a1 6c 04 41 00       	mov    0x41046c,%eax
  40ba39:	6a 06                	push   $0x6
  40ba3b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  40ba3e:	8d 45 f4             	lea    -0xc(%ebp),%eax
  40ba41:	50                   	push   %eax
  40ba42:	68 04 10 00 00       	push   $0x1004
  40ba47:	ff 75 08             	push   0x8(%ebp)
  40ba4a:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
  40ba4e:	ff 15 8c d0 40 00    	call   *0x40d08c  ; 0x40d08c=KERNEL32.dll!GetLocaleInfoA
  40ba54:	85 c0                	test   %eax,%eax
  40ba56:	75 05                	jne    0x40ba5d
  40ba58:	83 c8 ff             	or     $0xffffffff,%eax
  40ba5b:	eb 0a                	jmp    0x40ba67
  40ba5d:	8d 45 f4             	lea    -0xc(%ebp),%eax
  40ba60:	50                   	push   %eax
  40ba61:	e8 88 e3 ff ff       	call   0x409dee
  40ba66:	59                   	pop    %ecx
  40ba67:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  40ba6a:	e8 ad e0 ff ff       	call   0x409b1c
  40ba6f:	c9                   	leave
  40ba70:	c3                   	ret
  40ba71:	6a 38                	push   $0x38
  40ba73:	68 18 e3 40 00       	push   $0x40e318
  40ba78:	e8 3f bb ff ff       	call   0x4075bc
  40ba7d:	a1 6c 04 41 00       	mov    0x41046c,%eax
  40ba82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  40ba85:	33 ff                	xor    %edi,%edi
  40ba87:	89 7d cc             	mov    %edi,-0x34(%ebp)
  40ba8a:	89 7d bc             	mov    %edi,-0x44(%ebp)
  40ba8d:	8b 45 14             	mov    0x14(%ebp),%eax
  40ba90:	8b 18                	mov    (%eax),%ebx
  40ba92:	89 5d c0             	mov    %ebx,-0x40(%ebp)
  40ba95:	89 7d c4             	mov    %edi,-0x3c(%ebp)
  40ba98:	8b 45 08             	mov    0x8(%ebp),%eax
  40ba9b:	3b 45 0c             	cmp    0xc(%ebp),%eax
  40ba9e:	0f 84 73 01 00 00    	je     0x40bc17
  40baa4:	8d 4d d0             	lea    -0x30(%ebp),%ecx
  40baa7:	51                   	push   %ecx
  40baa8:	50                   	push   %eax
  40baa9:	8b 35 c8 d0 40 00    	mov    0x40d0c8,%esi  ; 0x40d0c8=KERNEL32.dll!GetCPInfo
  40baaf:	ff d6                	call   *%esi
  40bab1:	85 c0                	test   %eax,%eax
  40bab3:	74 20                	je     0x40bad5
  40bab5:	83 7d d0 01          	cmpl   $0x1,-0x30(%ebp)
  40bab9:	75 1a                	jne    0x40bad5
  40babb:	8d 45 d0             	lea    -0x30(%ebp),%eax
  40babe:	50                   	push   %eax
  40babf:	ff 75 0c             	push   0xc(%ebp)
  40bac2:	ff d6                	call   *%esi
  40bac4:	85 c0                	test   %eax,%eax
  40bac6:	74 0d                	je     0x40bad5
  40bac8:	83 7d d0 01          	cmpl   $0x1,-0x30(%ebp)
  40bacc:	75 07                	jne    0x40bad5
  40bace:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  40bad5:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
  40bad8:	74 1a                	je     0x40baf4
  40bada:	83 fb ff             	cmp    $0xffffffff,%ebx
  40badd:	74 04                	je     0x40bae3
  40badf:	8b f3                	mov    %ebx,%esi
  40bae1:	eb 0c                	jmp    0x40baef
  40bae3:	ff 75 10             	push   0x10(%ebp)
  40bae6:	e8 75 df ff ff       	call   0x409a60
  40baeb:	59                   	pop    %ecx
  40baec:	8b f0                	mov    %eax,%esi
  40baee:	46                   	inc    %esi
  40baef:	89 75 c8             	mov    %esi,-0x38(%ebp)
  40baf2:	eb 03                	jmp    0x40baf7
  40baf4:	8b 75 c8             	mov    -0x38(%ebp),%esi
  40baf7:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
  40bafa:	75 1a                	jne    0x40bb16
  40bafc:	57                   	push   %edi
  40bafd:	57                   	push   %edi
  40bafe:	53                   	push   %ebx
  40baff:	ff 75 10             	push   0x10(%ebp)
  40bb02:	6a 01                	push   $0x1
  40bb04:	ff 75 08             	push   0x8(%ebp)
  40bb07:	ff 15 ac d0 40 00    	call   *0x40d0ac  ; 0x40d0ac=KERNEL32.dll!MultiByteToWideChar
  40bb0d:	8b f0                	mov    %eax,%esi
  40bb0f:	89 75 c8             	mov    %esi,-0x38(%ebp)
  40bb12:	3b f7                	cmp    %edi,%esi
  40bb14:	74 58                	je     0x40bb6e
  40bb16:	89 7d fc             	mov    %edi,-0x4(%ebp)
  40bb19:	8d 04 36             	lea    (%esi,%esi,1),%eax
  40bb1c:	83 c0 03             	add    $0x3,%eax
  40bb1f:	83 e0 fc             	and    $0xfffffffc,%eax
  40bb22:	e8 e9 a1 ff ff       	call   0x405d10
  40bb27:	89 65 e8             	mov    %esp,-0x18(%ebp)
  40bb2a:	8b dc                	mov    %esp,%ebx
  40bb2c:	89 5d b8             	mov    %ebx,-0x48(%ebp)
  40bb2f:	8d 04 36             	lea    (%esi,%esi,1),%eax
  40bb32:	50                   	push   %eax
  40bb33:	57                   	push   %edi
  40bb34:	53                   	push   %ebx
  40bb35:	e8 46 f7 ff ff       	call   0x40b280
  40bb3a:	83 c4 0c             	add    $0xc,%esp
  40bb3d:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40bb41:	eb 17                	jmp    0x40bb5a
  40bb43:	33 c0                	xor    %eax,%eax
  40bb45:	40                   	inc    %eax
  40bb46:	c3                   	ret
  40bb47:	8b 65 e8             	mov    -0x18(%ebp),%esp
  40bb4a:	e8 eb 00 00 00       	call   0x40bc3a
  40bb4f:	33 ff                	xor    %edi,%edi
  40bb51:	33 db                	xor    %ebx,%ebx
  40bb53:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
  40bb57:	8b 75 c8             	mov    -0x38(%ebp),%esi
  40bb5a:	3b df                	cmp    %edi,%ebx
  40bb5c:	75 1e                	jne    0x40bb7c
  40bb5e:	56                   	push   %esi
  40bb5f:	6a 02                	push   $0x2
  40bb61:	e8 9e ec ff ff       	call   0x40a804
  40bb66:	59                   	pop    %ecx
  40bb67:	59                   	pop    %ecx
  40bb68:	8b d8                	mov    %eax,%ebx
  40bb6a:	3b df                	cmp    %edi,%ebx
  40bb6c:	75 07                	jne    0x40bb75
  40bb6e:	33 c0                	xor    %eax,%eax
  40bb70:	e9 b4 00 00 00       	jmp    0x40bc29
  40bb75:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
  40bb7c:	56                   	push   %esi
  40bb7d:	53                   	push   %ebx
  40bb7e:	ff 75 c0             	push   -0x40(%ebp)
  40bb81:	ff 75 10             	push   0x10(%ebp)
  40bb84:	6a 01                	push   $0x1
  40bb86:	ff 75 08             	push   0x8(%ebp)
  40bb89:	ff 15 ac d0 40 00    	call   *0x40d0ac  ; 0x40d0ac=KERNEL32.dll!MultiByteToWideChar
  40bb8f:	85 c0                	test   %eax,%eax
  40bb91:	0f 84 83 00 00 00    	je     0x40bc1a
  40bb97:	39 7d 18             	cmp    %edi,0x18(%ebp)
  40bb9a:	74 20                	je     0x40bbbc
  40bb9c:	57                   	push   %edi
  40bb9d:	57                   	push   %edi
  40bb9e:	ff 75 1c             	push   0x1c(%ebp)
  40bba1:	ff 75 18             	push   0x18(%ebp)
  40bba4:	56                   	push   %esi
  40bba5:	53                   	push   %ebx
  40bba6:	57                   	push   %edi
  40bba7:	ff 75 0c             	push   0xc(%ebp)
  40bbaa:	ff 15 84 d0 40 00    	call   *0x40d084  ; 0x40d084=KERNEL32.dll!WideCharToMultiByte
  40bbb0:	85 c0                	test   %eax,%eax
  40bbb2:	74 66                	je     0x40bc1a
  40bbb4:	8b 45 18             	mov    0x18(%ebp),%eax
  40bbb7:	89 45 cc             	mov    %eax,-0x34(%ebp)
  40bbba:	eb 5e                	jmp    0x40bc1a
  40bbbc:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
  40bbbf:	75 16                	jne    0x40bbd7
  40bbc1:	57                   	push   %edi
  40bbc2:	57                   	push   %edi
  40bbc3:	57                   	push   %edi
  40bbc4:	57                   	push   %edi
  40bbc5:	56                   	push   %esi
  40bbc6:	53                   	push   %ebx
  40bbc7:	57                   	push   %edi
  40bbc8:	ff 75 0c             	push   0xc(%ebp)
  40bbcb:	ff 15 84 d0 40 00    	call   *0x40d084  ; 0x40d084=KERNEL32.dll!WideCharToMultiByte
  40bbd1:	8b f0                	mov    %eax,%esi
  40bbd3:	3b f7                	cmp    %edi,%esi
  40bbd5:	74 43                	je     0x40bc1a
  40bbd7:	56                   	push   %esi
  40bbd8:	6a 01                	push   $0x1
  40bbda:	e8 25 ec ff ff       	call   0x40a804
  40bbdf:	59                   	pop    %ecx
  40bbe0:	59                   	pop    %ecx
  40bbe1:	89 45 cc             	mov    %eax,-0x34(%ebp)
  40bbe4:	3b c7                	cmp    %edi,%eax
  40bbe6:	74 32                	je     0x40bc1a
  40bbe8:	57                   	push   %edi
  40bbe9:	57                   	push   %edi
  40bbea:	56                   	push   %esi
  40bbeb:	50                   	push   %eax
  40bbec:	56                   	push   %esi
  40bbed:	53                   	push   %ebx
  40bbee:	57                   	push   %edi
  40bbef:	ff 75 0c             	push   0xc(%ebp)
  40bbf2:	ff 15 84 d0 40 00    	call   *0x40d084  ; 0x40d084=KERNEL32.dll!WideCharToMultiByte
  40bbf8:	3b c7                	cmp    %edi,%eax
  40bbfa:	75 0e                	jne    0x40bc0a
  40bbfc:	ff 75 cc             	push   -0x34(%ebp)
  40bbff:	e8 73 b0 ff ff       	call   0x406c77
  40bc04:	59                   	pop    %ecx
  40bc05:	89 7d cc             	mov    %edi,-0x34(%ebp)
  40bc08:	eb 10                	jmp    0x40bc1a
  40bc0a:	83 7d c0 ff          	cmpl   $0xffffffff,-0x40(%ebp)
  40bc0e:	74 0a                	je     0x40bc1a
  40bc10:	8b 4d 14             	mov    0x14(%ebp),%ecx
  40bc13:	89 01                	mov    %eax,(%ecx)
  40bc15:	eb 03                	jmp    0x40bc1a
  40bc17:	8b 5d b8             	mov    -0x48(%ebp),%ebx
  40bc1a:	39 7d bc             	cmp    %edi,-0x44(%ebp)
  40bc1d:	74 07                	je     0x40bc26
  40bc1f:	53                   	push   %ebx
  40bc20:	e8 52 b0 ff ff       	call   0x406c77
  40bc25:	59                   	pop    %ecx
  40bc26:	8b 45 cc             	mov    -0x34(%ebp),%eax
  40bc29:	8d 65 ac             	lea    -0x54(%ebp),%esp
  40bc2c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  40bc2f:	e8 e8 de ff ff       	call   0x409b1c
  40bc34:	e8 be b9 ff ff       	call   0x4075f7
  40bc39:	c3                   	ret
  40bc3a:	55                   	push   %ebp
  40bc3b:	8b ec                	mov    %esp,%ebp
  40bc3d:	83 ec 4c             	sub    $0x4c,%esp
  40bc40:	53                   	push   %ebx
  40bc41:	56                   	push   %esi
  40bc42:	57                   	push   %edi
  40bc43:	6a 04                	push   $0x4
  40bc45:	58                   	pop    %eax
  40bc46:	e8 c5 a0 ff ff       	call   0x405d10
  40bc4b:	8b f4                	mov    %esp,%esi
  40bc4d:	6a 1c                	push   $0x1c
  40bc4f:	8d 45 d8             	lea    -0x28(%ebp),%eax
  40bc52:	50                   	push   %eax
  40bc53:	56                   	push   %esi
  40bc54:	ff 15 d4 d0 40 00    	call   *0x40d0d4  ; 0x40d0d4=KERNEL32.dll!VirtualQuery
  40bc5a:	85 c0                	test   %eax,%eax
  40bc5c:	74 77                	je     0x40bcd5
  40bc5e:	8b 5d dc             	mov    -0x24(%ebp),%ebx
  40bc61:	8d 45 b4             	lea    -0x4c(%ebp),%eax
  40bc64:	50                   	push   %eax
  40bc65:	ff 15 fc d0 40 00    	call   *0x40d0fc  ; 0x40d0fc=KERNEL32.dll!GetSystemInfo
  40bc6b:	8b 4d b8             	mov    -0x48(%ebp),%ecx
  40bc6e:	a1 5c 1d 41 00       	mov    0x411d5c,%eax
  40bc73:	8d 79 ff             	lea    -0x1(%ecx),%edi
  40bc76:	f7 d7                	not    %edi
  40bc78:	23 fe                	and    %esi,%edi
  40bc7a:	2b f9                	sub    %ecx,%edi
  40bc7c:	8b f0                	mov    %eax,%esi
  40bc7e:	4e                   	dec    %esi
  40bc7f:	f7 de                	neg    %esi
  40bc81:	1b f6                	sbb    %esi,%esi
  40bc83:	83 e6 f1             	and    $0xfffffff1,%esi
  40bc86:	83 c6 11             	add    $0x11,%esi
  40bc89:	0f af f1             	imul   %ecx,%esi
  40bc8c:	03 f3                	add    %ebx,%esi
  40bc8e:	3b fe                	cmp    %esi,%edi
  40bc90:	89 4d f8             	mov    %ecx,-0x8(%ebp)
  40bc93:	72 40                	jb     0x40bcd5
  40bc95:	83 f8 01             	cmp    $0x1,%eax
  40bc98:	74 5c                	je     0x40bcf6
  40bc9a:	89 5d fc             	mov    %ebx,-0x4(%ebp)
  40bc9d:	bb 00 10 00 00       	mov    $0x1000,%ebx
  40bca2:	6a 1c                	push   $0x1c
  40bca4:	8d 45 d8             	lea    -0x28(%ebp),%eax
  40bca7:	50                   	push   %eax
  40bca8:	ff 75 fc             	push   -0x4(%ebp)
  40bcab:	ff 15 d4 d0 40 00    	call   *0x40d0d4  ; 0x40d0d4=KERNEL32.dll!VirtualQuery
  40bcb1:	85 c0                	test   %eax,%eax
  40bcb3:	74 20                	je     0x40bcd5
  40bcb5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  40bcb8:	01 45 fc             	add    %eax,-0x4(%ebp)
  40bcbb:	85 5d e8             	test   %ebx,-0x18(%ebp)
  40bcbe:	74 e2                	je     0x40bca2
  40bcc0:	f6 45 ed 01          	testb  $0x1,-0x13(%ebp)
  40bcc4:	8b 45 d8             	mov    -0x28(%ebp),%eax
  40bcc7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  40bcca:	74 05                	je     0x40bcd1
  40bccc:	33 c0                	xor    %eax,%eax
  40bcce:	40                   	inc    %eax
  40bccf:	eb 44                	jmp    0x40bd15
  40bcd1:	3b f8                	cmp    %eax,%edi
  40bcd3:	73 04                	jae    0x40bcd9
  40bcd5:	33 c0                	xor    %eax,%eax
  40bcd7:	eb 3c                	jmp    0x40bd15
  40bcd9:	3b c6                	cmp    %esi,%eax
  40bcdb:	73 03                	jae    0x40bce0
  40bcdd:	89 75 fc             	mov    %esi,-0x4(%ebp)
  40bce0:	6a 04                	push   $0x4
  40bce2:	53                   	push   %ebx
  40bce3:	ff 75 f8             	push   -0x8(%ebp)
  40bce6:	ff 75 fc             	push   -0x4(%ebp)
  40bce9:	ff 15 ec d0 40 00    	call   *0x40d0ec  ; 0x40d0ec=KERNEL32.dll!VirtualAlloc
  40bcef:	a1 5c 1d 41 00       	mov    0x411d5c,%eax
  40bcf4:	eb 03                	jmp    0x40bcf9
  40bcf6:	89 7d fc             	mov    %edi,-0x4(%ebp)
  40bcf9:	48                   	dec    %eax
  40bcfa:	f7 d8                	neg    %eax
  40bcfc:	1b c0                	sbb    %eax,%eax
  40bcfe:	25 03 01 00 00       	and    $0x103,%eax
  40bd03:	8d 4d f4             	lea    -0xc(%ebp),%ecx
  40bd06:	51                   	push   %ecx
  40bd07:	40                   	inc    %eax
  40bd08:	50                   	push   %eax
  40bd09:	ff 75 f8             	push   -0x8(%ebp)
  40bd0c:	ff 75 fc             	push   -0x4(%ebp)
  40bd0f:	ff 15 88 d0 40 00    	call   *0x40d088  ; 0x40d088=KERNEL32.dll!VirtualProtect
  40bd15:	8d 65 a8             	lea    -0x58(%ebp),%esp
  40bd18:	5f                   	pop    %edi
  40bd19:	5e                   	pop    %esi
  40bd1a:	5b                   	pop    %ebx
  40bd1b:	c9                   	leave
  40bd1c:	c3                   	ret
  40bd1d:	53                   	push   %ebx
  40bd1e:	55                   	push   %ebp
  40bd1f:	56                   	push   %esi
  40bd20:	57                   	push   %edi
  40bd21:	8b 7c 24 14          	mov    0x14(%esp),%edi
  40bd25:	3b 3d e8 32 41 00    	cmp    0x4132e8,%edi
  40bd2b:	0f 83 86 00 00 00    	jae    0x40bdb7
  40bd31:	8b c7                	mov    %edi,%eax
  40bd33:	c1 f8 05             	sar    $0x5,%eax
  40bd36:	8b f7                	mov    %edi,%esi
  40bd38:	83 e6 1f             	and    $0x1f,%esi
  40bd3b:	8d 1c 85 00 33 41 00 	lea    0x413300(,%eax,4),%ebx
  40bd42:	8b 03                	mov    (%ebx),%eax
  40bd44:	c1 e6 03             	shl    $0x3,%esi
  40bd47:	f6 44 30 04 01       	testb  $0x1,0x4(%eax,%esi,1)
  40bd4c:	74 69                	je     0x40bdb7
  40bd4e:	57                   	push   %edi
  40bd4f:	e8 d5 e9 ff ff       	call   0x40a729
  40bd54:	83 f8 ff             	cmp    $0xffffffff,%eax
  40bd57:	59                   	pop    %ecx
  40bd58:	74 3c                	je     0x40bd96
  40bd5a:	83 ff 01             	cmp    $0x1,%edi
  40bd5d:	74 05                	je     0x40bd64
  40bd5f:	83 ff 02             	cmp    $0x2,%edi
  40bd62:	75 16                	jne    0x40bd7a
  40bd64:	6a 02                	push   $0x2
  40bd66:	e8 be e9 ff ff       	call   0x40a729
  40bd6b:	6a 01                	push   $0x1
  40bd6d:	8b e8                	mov    %eax,%ebp
  40bd6f:	e8 b5 e9 ff ff       	call   0x40a729
  40bd74:	3b c5                	cmp    %ebp,%eax
  40bd76:	59                   	pop    %ecx
  40bd77:	59                   	pop    %ecx
  40bd78:	74 1c                	je     0x40bd96
  40bd7a:	57                   	push   %edi
  40bd7b:	e8 a9 e9 ff ff       	call   0x40a729
  40bd80:	59                   	pop    %ecx
  40bd81:	50                   	push   %eax
  40bd82:	ff 15 48 d0 40 00    	call   *0x40d048  ; 0x40d048=KERNEL32.dll!CloseHandle
  40bd88:	85 c0                	test   %eax,%eax
  40bd8a:	75 0a                	jne    0x40bd96
  40bd8c:	ff 15 0c d1 40 00    	call   *0x40d10c  ; 0x40d10c=KERNEL32.dll!GetLastError
  40bd92:	8b e8                	mov    %eax,%ebp
  40bd94:	eb 02                	jmp    0x40bd98
  40bd96:	33 ed                	xor    %ebp,%ebp
  40bd98:	57                   	push   %edi
  40bd99:	e8 11 e9 ff ff       	call   0x40a6af
  40bd9e:	85 ed                	test   %ebp,%ebp
  40bda0:	8b 03                	mov    (%ebx),%eax
  40bda2:	59                   	pop    %ecx
  40bda3:	c6 44 30 04 00       	movb   $0x0,0x4(%eax,%esi,1)
  40bda8:	74 09                	je     0x40bdb3
  40bdaa:	55                   	push   %ebp
  40bdab:	e8 a0 e8 ff ff       	call   0x40a650
  40bdb0:	59                   	pop    %ecx
  40bdb1:	eb 15                	jmp    0x40bdc8
  40bdb3:	33 c0                	xor    %eax,%eax
  40bdb5:	eb 14                	jmp    0x40bdcb
  40bdb7:	83 25 54 1d 41 00 00 	andl   $0x0,0x411d54
  40bdbe:	c7 05 50 1d 41 00 09 	movl   $0x9,0x411d50
  40bdc5:	00 00 00 
  40bdc8:	83 c8 ff             	or     $0xffffffff,%eax
  40bdcb:	5f                   	pop    %edi
  40bdcc:	5e                   	pop    %esi
  40bdcd:	5d                   	pop    %ebp
  40bdce:	5b                   	pop    %ebx
  40bdcf:	c3                   	ret
  40bdd0:	56                   	push   %esi
  40bdd1:	8b 74 24 08          	mov    0x8(%esp),%esi
  40bdd5:	8b 46 0c             	mov    0xc(%esi),%eax
  40bdd8:	a8 83                	test   $0x83,%al
  40bdda:	74 1d                	je     0x40bdf9
  40bddc:	a8 08                	test   $0x8,%al
  40bdde:	74 19                	je     0x40bdf9
  40bde0:	ff 76 08             	push   0x8(%esi)
  40bde3:	e8 8f ae ff ff       	call   0x406c77
  40bde8:	66 81 66 0c f7 fb    	andw   $0xfbf7,0xc(%esi)
  40bdee:	33 c0                	xor    %eax,%eax
  40bdf0:	59                   	pop    %ecx
  40bdf1:	89 06                	mov    %eax,(%esi)
  40bdf3:	89 46 08             	mov    %eax,0x8(%esi)
  40bdf6:	89 46 04             	mov    %eax,0x4(%esi)
  40bdf9:	5e                   	pop    %esi
  40bdfa:	c3                   	ret
  40bdfb:	56                   	push   %esi
  40bdfc:	8b 74 24 08          	mov    0x8(%esp),%esi
  40be00:	85 f6                	test   %esi,%esi
  40be02:	74 1e                	je     0x40be22
  40be04:	56                   	push   %esi
  40be05:	e8 56 dc ff ff       	call   0x409a60
  40be0a:	40                   	inc    %eax
  40be0b:	50                   	push   %eax
  40be0c:	e8 54 ae ff ff       	call   0x406c65
  40be11:	85 c0                	test   %eax,%eax
  40be13:	59                   	pop    %ecx
  40be14:	59                   	pop    %ecx
  40be15:	74 0b                	je     0x40be22
  40be17:	56                   	push   %esi
  40be18:	50                   	push   %eax
  40be19:	e8 32 e0 ff ff       	call   0x409e50
  40be1e:	59                   	pop    %ecx
  40be1f:	59                   	pop    %ecx
  40be20:	5e                   	pop    %esi
  40be21:	c3                   	ret
  40be22:	33 c0                	xor    %eax,%eax
  40be24:	5e                   	pop    %esi
  40be25:	c3                   	ret
  40be26:	55                   	push   %ebp
  40be27:	8b ec                	mov    %esp,%ebp
  40be29:	83 3d 64 20 41 00 00 	cmpl   $0x0,0x412064
  40be30:	75 06                	jne    0x40be38
  40be32:	5d                   	pop    %ebp
  40be33:	e9 68 00 00 00       	jmp    0x40bea0
  40be38:	8b 4d 08             	mov    0x8(%ebp),%ecx
  40be3b:	eb 31                	jmp    0x40be6e
  40be3d:	0f b6 d0             	movzbl %al,%edx
  40be40:	f6 82 81 20 41 00 04 	testb  $0x4,0x412081(%edx)
  40be47:	74 1c                	je     0x40be65
  40be49:	41                   	inc    %ecx
  40be4a:	8a 11                	mov    (%ecx),%dl
  40be4c:	84 d2                	test   %dl,%dl
  40be4e:	74 39                	je     0x40be89
  40be50:	0f b7 c0             	movzwl %ax,%eax
  40be53:	0f b6 d2             	movzbl %dl,%edx
  40be56:	c1 e0 08             	shl    $0x8,%eax
  40be59:	0b c2                	or     %edx,%eax
  40be5b:	39 45 0c             	cmp    %eax,0xc(%ebp)
  40be5e:	75 0d                	jne    0x40be6d
  40be60:	8d 41 ff             	lea    -0x1(%ecx),%eax
  40be63:	5d                   	pop    %ebp
  40be64:	c3                   	ret
  40be65:	0f b7 d0             	movzwl %ax,%edx
  40be68:	39 55 0c             	cmp    %edx,0xc(%ebp)
  40be6b:	74 0a                	je     0x40be77
  40be6d:	41                   	inc    %ecx
  40be6e:	66 0f b6 01          	movzbw (%ecx),%ax
  40be72:	66 85 c0             	test   %ax,%ax
  40be75:	75 c6                	jne    0x40be3d
  40be77:	0f b7 d0             	movzwl %ax,%edx
  40be7a:	8b 45 0c             	mov    0xc(%ebp),%eax
  40be7d:	2b c2                	sub    %edx,%eax
  40be7f:	f7 d8                	neg    %eax
  40be81:	1b c0                	sbb    %eax,%eax
  40be83:	f7 d0                	not    %eax
  40be85:	23 c1                	and    %ecx,%eax
  40be87:	5d                   	pop    %ebp
  40be88:	c3                   	ret
  40be89:	33 c0                	xor    %eax,%eax
  40be8b:	5d                   	pop    %ebp
  40be8c:	c3                   	ret
  40be8d:	cc                   	int3
  40be8e:	cc                   	int3
  40be8f:	cc                   	int3
  40be90:	8d 42 ff             	lea    -0x1(%edx),%eax
  40be93:	5b                   	pop    %ebx
  40be94:	c3                   	ret
  40be95:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
  40be9c:	8d 64 24 00          	lea    0x0(%esp),%esp
  40bea0:	33 c0                	xor    %eax,%eax
  40bea2:	8a 44 24 08          	mov    0x8(%esp),%al
  40bea6:	53                   	push   %ebx
  40bea7:	8b d8                	mov    %eax,%ebx
  40bea9:	c1 e0 08             	shl    $0x8,%eax
  40beac:	8b 54 24 08          	mov    0x8(%esp),%edx
  40beb0:	f7 c2 03 00 00 00    	test   $0x3,%edx
  40beb6:	74 15                	je     0x40becd
  40beb8:	8a 0a                	mov    (%edx),%cl
  40beba:	83 c2 01             	add    $0x1,%edx
  40bebd:	38 d9                	cmp    %bl,%cl
  40bebf:	74 cf                	je     0x40be90
  40bec1:	84 c9                	test   %cl,%cl
  40bec3:	74 51                	je     0x40bf16
  40bec5:	f7 c2 03 00 00 00    	test   $0x3,%edx
  40becb:	75 eb                	jne    0x40beb8
  40becd:	0b d8                	or     %eax,%ebx
  40becf:	57                   	push   %edi
  40bed0:	8b c3                	mov    %ebx,%eax
  40bed2:	c1 e3 10             	shl    $0x10,%ebx
  40bed5:	56                   	push   %esi
  40bed6:	0b d8                	or     %eax,%ebx
  40bed8:	8b 0a                	mov    (%edx),%ecx
  40beda:	bf ff fe fe 7e       	mov    $0x7efefeff,%edi
  40bedf:	8b c1                	mov    %ecx,%eax
  40bee1:	8b f7                	mov    %edi,%esi
  40bee3:	33 cb                	xor    %ebx,%ecx
  40bee5:	03 f0                	add    %eax,%esi
  40bee7:	03 f9                	add    %ecx,%edi
  40bee9:	83 f1 ff             	xor    $0xffffffff,%ecx
  40beec:	83 f0 ff             	xor    $0xffffffff,%eax
  40beef:	33 cf                	xor    %edi,%ecx
  40bef1:	33 c6                	xor    %esi,%eax
  40bef3:	83 c2 04             	add    $0x4,%edx
  40bef6:	81 e1 00 01 01 81    	and    $0x81010100,%ecx
  40befc:	75 1c                	jne    0x40bf1a
  40befe:	25 00 01 01 81       	and    $0x81010100,%eax
  40bf03:	74 d3                	je     0x40bed8
  40bf05:	25 00 01 01 01       	and    $0x1010100,%eax
  40bf0a:	75 08                	jne    0x40bf14
  40bf0c:	81 e6 00 00 00 80    	and    $0x80000000,%esi
  40bf12:	75 c4                	jne    0x40bed8
  40bf14:	5e                   	pop    %esi
  40bf15:	5f                   	pop    %edi
  40bf16:	5b                   	pop    %ebx
  40bf17:	33 c0                	xor    %eax,%eax
  40bf19:	c3                   	ret
  40bf1a:	8b 42 fc             	mov    -0x4(%edx),%eax
  40bf1d:	38 d8                	cmp    %bl,%al
  40bf1f:	74 36                	je     0x40bf57
  40bf21:	84 c0                	test   %al,%al
  40bf23:	74 ef                	je     0x40bf14
  40bf25:	38 dc                	cmp    %bl,%ah
  40bf27:	74 27                	je     0x40bf50
  40bf29:	84 e4                	test   %ah,%ah
  40bf2b:	74 e7                	je     0x40bf14
  40bf2d:	c1 e8 10             	shr    $0x10,%eax
  40bf30:	38 d8                	cmp    %bl,%al
  40bf32:	74 15                	je     0x40bf49
  40bf34:	84 c0                	test   %al,%al
  40bf36:	74 dc                	je     0x40bf14
  40bf38:	38 dc                	cmp    %bl,%ah
  40bf3a:	74 06                	je     0x40bf42
  40bf3c:	84 e4                	test   %ah,%ah
  40bf3e:	74 d4                	je     0x40bf14
  40bf40:	eb 96                	jmp    0x40bed8
  40bf42:	5e                   	pop    %esi
  40bf43:	5f                   	pop    %edi
  40bf44:	8d 42 ff             	lea    -0x1(%edx),%eax
  40bf47:	5b                   	pop    %ebx
  40bf48:	c3                   	ret
  40bf49:	8d 42 fe             	lea    -0x2(%edx),%eax
  40bf4c:	5e                   	pop    %esi
  40bf4d:	5f                   	pop    %edi
  40bf4e:	5b                   	pop    %ebx
  40bf4f:	c3                   	ret
  40bf50:	8d 42 fd             	lea    -0x3(%edx),%eax
  40bf53:	5e                   	pop    %esi
  40bf54:	5f                   	pop    %edi
  40bf55:	5b                   	pop    %ebx
  40bf56:	c3                   	ret
  40bf57:	8d 42 fc             	lea    -0x4(%edx),%eax
  40bf5a:	5e                   	pop    %esi
  40bf5b:	5f                   	pop    %edi
  40bf5c:	5b                   	pop    %ebx
  40bf5d:	c3                   	ret
  40bf5e:	ff 25 ec d1 40 00    	jmp    *0x40d1ec  ; 0x40d1ec=urlmon.dll!URLDownloadToFileA
  40bf64:	ff 25 30 d1 40 00    	jmp    *0x40d130  ; 0x40d130=KERNEL32.dll!RtlUnwind
  40bf6a:	55                   	push   %ebp
  40bf6b:	8b ec                	mov    %esp,%ebp
  40bf6d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  40bf71:	74 48                	je     0x40bfbb
  40bf73:	83 3d 0c 20 41 00 00 	cmpl   $0x0,0x41200c
  40bf7a:	75 06                	jne    0x40bf82
  40bf7c:	5d                   	pop    %ebp
  40bf7d:	e9 1e 01 00 00       	jmp    0x40c0a0
  40bf82:	53                   	push   %ebx
  40bf83:	56                   	push   %esi
  40bf84:	8b 75 08             	mov    0x8(%ebp),%esi
  40bf87:	57                   	push   %edi
  40bf88:	8b 7d 0c             	mov    0xc(%ebp),%edi
  40bf8b:	0f b6 06             	movzbl (%esi),%eax
  40bf8e:	50                   	push   %eax
  40bf8f:	e8 2b 00 00 00       	call   0x40bfbf
  40bf94:	8b d8                	mov    %eax,%ebx
  40bf96:	0f b6 07             	movzbl (%edi),%eax
  40bf99:	50                   	push   %eax
  40bf9a:	46                   	inc    %esi
  40bf9b:	e8 1f 00 00 00       	call   0x40bfbf
  40bfa0:	59                   	pop    %ecx
  40bfa1:	47                   	inc    %edi
  40bfa2:	ff 4d 10             	decl   0x10(%ebp)
  40bfa5:	59                   	pop    %ecx
  40bfa6:	8b c8                	mov    %eax,%ecx
  40bfa8:	74 08                	je     0x40bfb2
  40bfaa:	85 db                	test   %ebx,%ebx
  40bfac:	74 04                	je     0x40bfb2
  40bfae:	3b d9                	cmp    %ecx,%ebx
  40bfb0:	74 d9                	je     0x40bf8b
  40bfb2:	5f                   	pop    %edi
  40bfb3:	8b c3                	mov    %ebx,%eax
  40bfb5:	5e                   	pop    %esi
  40bfb6:	2b c1                	sub    %ecx,%eax
  40bfb8:	5b                   	pop    %ebx
  40bfb9:	5d                   	pop    %ebp
  40bfba:	c3                   	ret
  40bfbb:	33 c0                	xor    %eax,%eax
  40bfbd:	5d                   	pop    %ebp
  40bfbe:	c3                   	ret
  40bfbf:	55                   	push   %ebp
  40bfc0:	8b ec                	mov    %esp,%ebp
  40bfc2:	51                   	push   %ecx
  40bfc3:	51                   	push   %ecx
  40bfc4:	83 3d 0c 20 41 00 00 	cmpl   $0x0,0x41200c
  40bfcb:	53                   	push   %ebx
  40bfcc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  40bfcf:	56                   	push   %esi
  40bfd0:	57                   	push   %edi
  40bfd1:	0f 84 a9 00 00 00    	je     0x40c080
  40bfd7:	83 3d 70 09 41 00 00 	cmpl   $0x0,0x410970
  40bfde:	74 09                	je     0x40bfe9
  40bfe0:	83 fb 7f             	cmp    $0x7f,%ebx
  40bfe3:	0f 86 97 00 00 00    	jbe    0x40c080
  40bfe9:	33 f6                	xor    %esi,%esi
  40bfeb:	bf 00 01 00 00       	mov    $0x100,%edi
  40bff0:	46                   	inc    %esi
  40bff1:	3b df                	cmp    %edi,%ebx
  40bff3:	73 22                	jae    0x40c017
  40bff5:	39 35 d8 0b 41 00    	cmp    %esi,0x410bd8
  40bffb:	7e 0b                	jle    0x40c008
  40bffd:	56                   	push   %esi
  40bffe:	53                   	push   %ebx
  40bfff:	e8 89 f3 ff ff       	call   0x40b38d
  40c004:	59                   	pop    %ecx
  40c005:	59                   	pop    %ecx
  40c006:	eb 0b                	jmp    0x40c013
  40c008:	a1 68 09 41 00       	mov    0x410968,%eax
  40c00d:	0f b6 04 58          	movzbl (%eax,%ebx,2),%eax
  40c011:	23 c6                	and    %esi,%eax
  40c013:	85 c0                	test   %eax,%eax
  40c015:	74 76                	je     0x40c08d
  40c017:	8b 15 68 09 41 00    	mov    0x410968,%edx
  40c01d:	8b c3                	mov    %ebx,%eax
  40c01f:	c1 f8 08             	sar    $0x8,%eax
  40c022:	0f b6 c8             	movzbl %al,%ecx
  40c025:	f6 44 4a 01 80       	testb  $0x80,0x1(%edx,%ecx,2)
  40c02a:	74 0f                	je     0x40c03b
  40c02c:	6a 02                	push   $0x2
  40c02e:	88 45 fc             	mov    %al,-0x4(%ebp)
  40c031:	88 5d fd             	mov    %bl,-0x3(%ebp)
  40c034:	c6 45 fe 00          	movb   $0x0,-0x2(%ebp)
  40c038:	58                   	pop    %eax
  40c039:	eb 09                	jmp    0x40c044
  40c03b:	88 5d fc             	mov    %bl,-0x4(%ebp)
  40c03e:	c6 45 fd 00          	movb   $0x0,-0x3(%ebp)
  40c042:	8b c6                	mov    %esi,%eax
  40c044:	56                   	push   %esi
  40c045:	ff 35 1c 20 41 00    	push   0x41201c
  40c04b:	8d 4d f8             	lea    -0x8(%ebp),%ecx
  40c04e:	6a 03                	push   $0x3
  40c050:	51                   	push   %ecx
  40c051:	50                   	push   %eax
  40c052:	8d 45 fc             	lea    -0x4(%ebp),%eax
  40c055:	50                   	push   %eax
  40c056:	57                   	push   %edi
  40c057:	ff 35 0c 20 41 00    	push   0x41200c
  40c05d:	e8 99 ec ff ff       	call   0x40acfb
  40c062:	83 c4 20             	add    $0x20,%esp
  40c065:	85 c0                	test   %eax,%eax
  40c067:	74 24                	je     0x40c08d
  40c069:	3b c6                	cmp    %esi,%eax
  40c06b:	75 06                	jne    0x40c073
  40c06d:	0f b6 45 f8          	movzbl -0x8(%ebp),%eax
  40c071:	eb 1c                	jmp    0x40c08f
  40c073:	0f b6 4d f9          	movzbl -0x7(%ebp),%ecx
  40c077:	33 c0                	xor    %eax,%eax
  40c079:	8a 65 f8             	mov    -0x8(%ebp),%ah
  40c07c:	0b c1                	or     %ecx,%eax
  40c07e:	eb 0f                	jmp    0x40c08f
  40c080:	83 fb 41             	cmp    $0x41,%ebx
  40c083:	7c 08                	jl     0x40c08d
  40c085:	83 fb 5a             	cmp    $0x5a,%ebx
  40c088:	8d 43 20             	lea    0x20(%ebx),%eax
  40c08b:	7e 02                	jle    0x40c08f
  40c08d:	8b c3                	mov    %ebx,%eax
  40c08f:	5f                   	pop    %edi
  40c090:	5e                   	pop    %esi
  40c091:	5b                   	pop    %ebx
  40c092:	c9                   	leave
  40c093:	c3                   	ret
  40c094:	cc                   	int3
  40c095:	cc                   	int3
  40c096:	cc                   	int3
  40c097:	cc                   	int3
  40c098:	cc                   	int3
  40c099:	cc                   	int3
  40c09a:	cc                   	int3
  40c09b:	cc                   	int3
  40c09c:	cc                   	int3
  40c09d:	cc                   	int3
  40c09e:	cc                   	int3
  40c09f:	cc                   	int3
  40c0a0:	55                   	push   %ebp
  40c0a1:	8b ec                	mov    %esp,%ebp
  40c0a3:	57                   	push   %edi
  40c0a4:	56                   	push   %esi
  40c0a5:	53                   	push   %ebx
  40c0a6:	8b 4d 10             	mov    0x10(%ebp),%ecx
  40c0a9:	0b c9                	or     %ecx,%ecx
  40c0ab:	74 4d                	je     0x40c0fa
  40c0ad:	8b 75 08             	mov    0x8(%ebp),%esi
  40c0b0:	8b 7d 0c             	mov    0xc(%ebp),%edi
  40c0b3:	b7 41                	mov    $0x41,%bh
  40c0b5:	b3 5a                	mov    $0x5a,%bl
  40c0b7:	b6 20                	mov    $0x20,%dh
  40c0b9:	8d 49 00             	lea    0x0(%ecx),%ecx
  40c0bc:	8a 26                	mov    (%esi),%ah
  40c0be:	0a e4                	or     %ah,%ah
  40c0c0:	8a 07                	mov    (%edi),%al
  40c0c2:	74 27                	je     0x40c0eb
  40c0c4:	0a c0                	or     %al,%al
  40c0c6:	74 23                	je     0x40c0eb
  40c0c8:	83 c6 01             	add    $0x1,%esi
  40c0cb:	83 c7 01             	add    $0x1,%edi
  40c0ce:	38 fc                	cmp    %bh,%ah
  40c0d0:	72 06                	jb     0x40c0d8
  40c0d2:	38 dc                	cmp    %bl,%ah
  40c0d4:	77 02                	ja     0x40c0d8
  40c0d6:	02 e6                	add    %dh,%ah
  40c0d8:	38 f8                	cmp    %bh,%al
  40c0da:	72 06                	jb     0x40c0e2
  40c0dc:	38 d8                	cmp    %bl,%al
  40c0de:	77 02                	ja     0x40c0e2
  40c0e0:	02 c6                	add    %dh,%al
  40c0e2:	38 c4                	cmp    %al,%ah
  40c0e4:	75 0b                	jne    0x40c0f1
  40c0e6:	83 e9 01             	sub    $0x1,%ecx
  40c0e9:	75 d1                	jne    0x40c0bc
  40c0eb:	33 c9                	xor    %ecx,%ecx
  40c0ed:	38 c4                	cmp    %al,%ah
  40c0ef:	74 09                	je     0x40c0fa
  40c0f1:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  40c0f6:	72 02                	jb     0x40c0fa
  40c0f8:	f7 d9                	neg    %ecx
  40c0fa:	8b c1                	mov    %ecx,%eax
  40c0fc:	5b                   	pop    %ebx
  40c0fd:	5e                   	pop    %esi
  40c0fe:	5f                   	pop    %edi
  40c0ff:	c9                   	leave
  40c100:	c3                   	ret
  40c101:	cc                   	int3
  40c102:	cc                   	int3
  40c103:	cc                   	int3
  40c104:	cc                   	int3
  40c105:	cc                   	int3
  40c106:	cc                   	int3
  40c107:	cc                   	int3
  40c108:	cc                   	int3
  40c109:	cc                   	int3
  40c10a:	cc                   	int3
  40c10b:	cc                   	int3
  40c10c:	cc                   	int3
  40c10d:	cc                   	int3
  40c10e:	cc                   	int3
  40c10f:	cc                   	int3
  40c110:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  40c113:	83 c1 14             	add    $0x14,%ecx
  40c116:	e9 95 54 ff ff       	jmp    0x4015b0
  40c11b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  40c11e:	83 c1 20             	add    $0x20,%ecx
  40c121:	e9 8a 54 ff ff       	jmp    0x4015b0
  40c126:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  40c129:	83 c1 2c             	add    $0x2c,%ecx
  40c12c:	e9 7f 54 ff ff       	jmp    0x4015b0
  40c131:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  40c134:	83 c1 38             	add    $0x38,%ecx
  40c137:	e9 74 54 ff ff       	jmp    0x4015b0
  40c13c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  40c13f:	83 c1 44             	add    $0x44,%ecx
  40c142:	e9 69 54 ff ff       	jmp    0x4015b0
  40c147:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  40c14a:	83 c1 50             	add    $0x50,%ecx
  40c14d:	e9 5e 54 ff ff       	jmp    0x4015b0
  40c152:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  40c155:	83 c1 5c             	add    $0x5c,%ecx
  40c158:	e9 53 54 ff ff       	jmp    0x4015b0
  40c15d:	b8 f8 e3 40 00       	mov    $0x40e3f8,%eax
  40c162:	e9 87 97 ff ff       	jmp    0x4058ee
  40c167:	cc                   	int3
  40c168:	cc                   	int3
  40c169:	cc                   	int3
  40c16a:	cc                   	int3
  40c16b:	cc                   	int3
  40c16c:	cc                   	int3
  40c16d:	cc                   	int3
  40c16e:	cc                   	int3
  40c16f:	cc                   	int3
  40c170:	8d 8d 98 fc ff ff    	lea    -0x368(%ebp),%ecx
  40c176:	e9 55 84 ff ff       	jmp    0x4045d0
  40c17b:	8d 8d ac fc ff ff    	lea    -0x354(%ebp),%ecx
  40c181:	e9 5a 85 ff ff       	jmp    0x4046e0
  40c186:	8d 8d c0 fc ff ff    	lea    -0x340(%ebp),%ecx
  40c18c:	e9 4f 85 ff ff       	jmp    0x4046e0
  40c191:	8d 8d d4 fc ff ff    	lea    -0x32c(%ebp),%ecx
  40c197:	e9 74 72 ff ff       	jmp    0x403410
  40c19c:	b8 34 e4 40 00       	mov    $0x40e434,%eax
  40c1a1:	e9 48 97 ff ff       	jmp    0x4058ee
  40c1a6:	cc                   	int3
  40c1a7:	cc                   	int3
  40c1a8:	cc                   	int3
  40c1a9:	cc                   	int3
  40c1aa:	cc                   	int3
  40c1ab:	cc                   	int3
  40c1ac:	cc                   	int3
  40c1ad:	cc                   	int3
  40c1ae:	cc                   	int3
  40c1af:	cc                   	int3
  40c1b0:	8d 4d 80             	lea    -0x80(%ebp),%ecx
  40c1b3:	e9 f8 53 ff ff       	jmp    0x4015b0
  40c1b8:	8d 8d 34 ff ff ff    	lea    -0xcc(%ebp),%ecx
  40c1be:	e9 ed 53 ff ff       	jmp    0x4015b0
  40c1c3:	8d 8d 4c ff ff ff    	lea    -0xb4(%ebp),%ecx
  40c1c9:	e9 e2 53 ff ff       	jmp    0x4015b0
  40c1ce:	8d 8d 70 ff ff ff    	lea    -0x90(%ebp),%ecx
  40c1d4:	e9 d7 53 ff ff       	jmp    0x4015b0
  40c1d9:	8d 4d b8             	lea    -0x48(%ebp),%ecx
  40c1dc:	e9 9f 78 ff ff       	jmp    0x403a80
  40c1e1:	8d 4d 98             	lea    -0x68(%ebp),%ecx
  40c1e4:	e9 27 94 ff ff       	jmp    0x405610
  40c1e9:	8d 8d 64 ff ff ff    	lea    -0x9c(%ebp),%ecx
  40c1ef:	e9 bc 53 ff ff       	jmp    0x4015b0
  40c1f4:	8d 8d 40 ff ff ff    	lea    -0xc0(%ebp),%ecx
  40c1fa:	e9 b1 53 ff ff       	jmp    0x4015b0
  40c1ff:	8d 8d 58 ff ff ff    	lea    -0xa8(%ebp),%ecx
  40c205:	e9 a6 53 ff ff       	jmp    0x4015b0
  40c20a:	8d 4d 8c             	lea    -0x74(%ebp),%ecx
  40c20d:	e9 9e 53 ff ff       	jmp    0x4015b0
  40c212:	8d 4d a8             	lea    -0x58(%ebp),%ecx
  40c215:	e9 96 53 ff ff       	jmp    0x4015b0
  40c21a:	8d 4d e4             	lea    -0x1c(%ebp),%ecx
  40c21d:	e9 8e 53 ff ff       	jmp    0x4015b0
  40c222:	b8 b0 e4 40 00       	mov    $0x40e4b0,%eax
  40c227:	e9 c2 96 ff ff       	jmp    0x4058ee
  40c22c:	cc                   	int3
  40c22d:	cc                   	int3
  40c22e:	cc                   	int3
  40c22f:	cc                   	int3
  40c230:	8d 8d e4 fe ff ff    	lea    -0x11c(%ebp),%ecx
  40c236:	e9 75 53 ff ff       	jmp    0x4015b0
  40c23b:	b8 d4 e4 40 00       	mov    $0x40e4d4,%eax
  40c240:	e9 a9 96 ff ff       	jmp    0x4058ee
  40c245:	cc                   	int3
  40c246:	cc                   	int3
  40c247:	cc                   	int3
  40c248:	cc                   	int3
  40c249:	cc                   	int3
  40c24a:	cc                   	int3
  40c24b:	cc                   	int3
  40c24c:	cc                   	int3
  40c24d:	cc                   	int3
  40c24e:	cc                   	int3
  40c24f:	cc                   	int3
  40c250:	8d 4d e8             	lea    -0x18(%ebp),%ecx
  40c253:	e9 58 53 ff ff       	jmp    0x4015b0
  40c258:	8d 4d dc             	lea    -0x24(%ebp),%ecx
  40c25b:	e9 50 53 ff ff       	jmp    0x4015b0
  40c260:	b8 00 e5 40 00       	mov    $0x40e500,%eax
  40c265:	e9 84 96 ff ff       	jmp    0x4058ee
  40c26a:	cc                   	int3
  40c26b:	cc                   	int3
  40c26c:	cc                   	int3
  40c26d:	cc                   	int3
  40c26e:	cc                   	int3
  40c26f:	cc                   	int3
  40c270:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  40c273:	83 c1 14             	add    $0x14,%ecx
  40c276:	e9 35 53 ff ff       	jmp    0x4015b0
  40c27b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  40c27e:	83 c1 20             	add    $0x20,%ecx
  40c281:	e9 2a 53 ff ff       	jmp    0x4015b0
  40c286:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  40c289:	83 c1 2c             	add    $0x2c,%ecx
  40c28c:	e9 1f 53 ff ff       	jmp    0x4015b0
  40c291:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  40c294:	83 c1 38             	add    $0x38,%ecx
  40c297:	e9 14 53 ff ff       	jmp    0x4015b0
  40c29c:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  40c29f:	83 c1 44             	add    $0x44,%ecx
  40c2a2:	e9 09 53 ff ff       	jmp    0x4015b0
  40c2a7:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  40c2aa:	83 c1 50             	add    $0x50,%ecx
  40c2ad:	e9 fe 52 ff ff       	jmp    0x4015b0
  40c2b2:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  40c2b5:	83 c1 5c             	add    $0x5c,%ecx
  40c2b8:	e9 f3 52 ff ff       	jmp    0x4015b0
  40c2bd:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  40c2c0:	83 c1 78             	add    $0x78,%ecx
  40c2c3:	e9 e8 52 ff ff       	jmp    0x4015b0
  40c2c8:	b8 5c e5 40 00       	mov    $0x40e55c,%eax
  40c2cd:	e9 1c 96 ff ff       	jmp    0x4058ee
  40c2d2:	cc                   	int3
  40c2d3:	cc                   	int3
  40c2d4:	cc                   	int3
  40c2d5:	cc                   	int3
  40c2d6:	cc                   	int3
  40c2d7:	cc                   	int3
  40c2d8:	cc                   	int3
  40c2d9:	cc                   	int3
  40c2da:	cc                   	int3
  40c2db:	cc                   	int3
  40c2dc:	cc                   	int3
  40c2dd:	cc                   	int3
  40c2de:	cc                   	int3
  40c2df:	cc                   	int3
  40c2e0:	8d 8d f8 fc ff ff    	lea    -0x308(%ebp),%ecx
  40c2e6:	e9 c5 52 ff ff       	jmp    0x4015b0
  40c2eb:	68 b0 15 40 00       	push   $0x4015b0
  40c2f0:	6a 28                	push   $0x28
  40c2f2:	6a 0c                	push   $0xc
  40c2f4:	8d 85 14 fe ff ff    	lea    -0x1ec(%ebp),%eax
  40c2fa:	50                   	push   %eax
  40c2fb:	e8 31 9c ff ff       	call   0x405f31
  40c300:	c3                   	ret
  40c301:	b8 88 e5 40 00       	mov    $0x40e588,%eax
  40c306:	e9 e3 95 ff ff       	jmp    0x4058ee
  40c30b:	cc                   	int3
  40c30c:	cc                   	int3
  40c30d:	cc                   	int3
  40c30e:	cc                   	int3
  40c30f:	cc                   	int3
  40c310:	8d 4d e8             	lea    -0x18(%ebp),%ecx
  40c313:	e9 98 52 ff ff       	jmp    0x4015b0
  40c318:	b8 ac e5 40 00       	mov    $0x40e5ac,%eax
  40c31d:	e9 cc 95 ff ff       	jmp    0x4058ee
  40c322:	cc                   	int3
  40c323:	cc                   	int3
  40c324:	cc                   	int3
  40c325:	cc                   	int3
  40c326:	cc                   	int3
  40c327:	cc                   	int3
  40c328:	cc                   	int3
  40c329:	cc                   	int3
  40c32a:	cc                   	int3
  40c32b:	cc                   	int3
  40c32c:	cc                   	int3
  40c32d:	cc                   	int3
  40c32e:	cc                   	int3
  40c32f:	cc                   	int3
  40c330:	8d 4d e8             	lea    -0x18(%ebp),%ecx
  40c333:	e9 78 52 ff ff       	jmp    0x4015b0
  40c338:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  40c33b:	83 e0 01             	and    $0x1,%eax
  40c33e:	0f 84 0c 00 00 00    	je     0x40c350
  40c344:	83 65 e4 fe          	andl   $0xfffffffe,-0x1c(%ebp)
  40c348:	8b 4d 04             	mov    0x4(%ebp),%ecx
  40c34b:	e9 60 52 ff ff       	jmp    0x4015b0
  40c350:	c3                   	ret
  40c351:	b8 d8 e5 40 00       	mov    $0x40e5d8,%eax
  40c356:	e9 93 95 ff ff       	jmp    0x4058ee
  40c35b:	cc                   	int3
  40c35c:	cc                   	int3
  40c35d:	cc                   	int3
  40c35e:	cc                   	int3
  40c35f:	cc                   	int3
  40c360:	8d 4d dc             	lea    -0x24(%ebp),%ecx
  40c363:	e9 48 52 ff ff       	jmp    0x4015b0
  40c368:	8d 4d d0             	lea    -0x30(%ebp),%ecx
  40c36b:	e9 40 52 ff ff       	jmp    0x4015b0
  40c370:	8d 4d e8             	lea    -0x18(%ebp),%ecx
  40c373:	e9 38 52 ff ff       	jmp    0x4015b0
  40c378:	8d 4d e8             	lea    -0x18(%ebp),%ecx
  40c37b:	e9 30 52 ff ff       	jmp    0x4015b0
  40c380:	b8 14 e6 40 00       	mov    $0x40e614,%eax
  40c385:	e9 64 95 ff ff       	jmp    0x4058ee
  40c38a:	cc                   	int3
  40c38b:	cc                   	int3
  40c38c:	cc                   	int3
  40c38d:	cc                   	int3
  40c38e:	cc                   	int3
  40c38f:	cc                   	int3
  40c390:	8d 4d e8             	lea    -0x18(%ebp),%ecx
  40c393:	e9 18 52 ff ff       	jmp    0x4015b0
  40c398:	b8 38 e6 40 00       	mov    $0x40e638,%eax
  40c39d:	e9 4c 95 ff ff       	jmp    0x4058ee
  40c3a2:	cc                   	int3
  40c3a3:	cc                   	int3
  40c3a4:	cc                   	int3
  40c3a5:	cc                   	int3
  40c3a6:	cc                   	int3
  40c3a7:	cc                   	int3
  40c3a8:	cc                   	int3
  40c3a9:	cc                   	int3
  40c3aa:	cc                   	int3
  40c3ab:	cc                   	int3
  40c3ac:	cc                   	int3
  40c3ad:	cc                   	int3
  40c3ae:	cc                   	int3
  40c3af:	cc                   	int3
  40c3b0:	8d 4d e0             	lea    -0x20(%ebp),%ecx
  40c3b3:	e9 18 82 ff ff       	jmp    0x4045d0
  40c3b8:	b8 5c e6 40 00       	mov    $0x40e65c,%eax
  40c3bd:	e9 2c 95 ff ff       	jmp    0x4058ee
  40c3c2:	cc                   	int3
  40c3c3:	cc                   	int3
  40c3c4:	cc                   	int3
  40c3c5:	cc                   	int3
  40c3c6:	cc                   	int3
  40c3c7:	cc                   	int3
  40c3c8:	cc                   	int3
  40c3c9:	cc                   	int3
  40c3ca:	cc                   	int3
  40c3cb:	cc                   	int3
  40c3cc:	cc                   	int3
  40c3cd:	cc                   	int3
  40c3ce:	cc                   	int3
  40c3cf:	cc                   	int3
  40c3d0:	b9 70 0c 41 00       	mov    $0x410c70,%ecx
  40c3d5:	e8 36 69 ff ff       	call   0x402d10
  40c3da:	68 f0 c3 40 00       	push   $0x40c3f0
  40c3df:	e8 42 94 ff ff       	call   0x405826
  40c3e4:	59                   	pop    %ecx
  40c3e5:	c3                   	ret
  40c3e6:	cc                   	int3
  40c3e7:	cc                   	int3
  40c3e8:	cc                   	int3
  40c3e9:	cc                   	int3
  40c3ea:	cc                   	int3
  40c3eb:	cc                   	int3
  40c3ec:	cc                   	int3
  40c3ed:	cc                   	int3
  40c3ee:	cc                   	int3
  40c3ef:	cc                   	int3
  40c3f0:	b9 70 0c 41 00       	mov    $0x410c70,%ecx
  40c3f5:	e9 e6 51 ff ff       	jmp    0x4015e0
