
/Users/miguel/Desktop/QY/CLIENT/service/onepusonenew/game/pacman/bin/pacmandll.dll:     file format pei-i386


Disassembly of section .text:

10001000 <.text>:
10001000:	53                   	push   %ebx
10001001:	8b d9                	mov    %ecx,%ebx
10001003:	8b 43 0c             	mov    0xc(%ebx),%eax
10001006:	50                   	push   %eax
10001007:	ff 15 10 c0 00 10    	call   *0x1000c010  ; 0x1000c010=KERNEL32.dll!GlobalSize
1000100d:	8b 4c 24 08          	mov    0x8(%esp),%ecx
10001011:	3b c8                	cmp    %eax,%ecx
10001013:	7e 5b                	jle    0x10001070
10001015:	55                   	push   %ebp
10001016:	56                   	push   %esi
10001017:	57                   	push   %edi
10001018:	83 c1 40             	add    $0x40,%ecx
1000101b:	51                   	push   %ecx
1000101c:	6a 02                	push   $0x2
1000101e:	ff 15 0c c0 00 10    	call   *0x1000c00c  ; 0x1000c00c=KERNEL32.dll!GlobalAlloc
10001024:	50                   	push   %eax
10001025:	89 44 24 18          	mov    %eax,0x18(%esp)
10001029:	ff 15 08 c0 00 10    	call   *0x1000c008  ; 0x1000c008=KERNEL32.dll!GlobalLock
1000102f:	8b 4b 08             	mov    0x8(%ebx),%ecx
10001032:	0f b7 09             	movzwl (%ecx),%ecx
10001035:	8b 33                	mov    (%ebx),%esi
10001037:	8b d1                	mov    %ecx,%edx
10001039:	8b e8                	mov    %eax,%ebp
1000103b:	c1 e9 02             	shr    $0x2,%ecx
1000103e:	8b fd                	mov    %ebp,%edi
10001040:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
10001042:	8b ca                	mov    %edx,%ecx
10001044:	83 e1 03             	and    $0x3,%ecx
10001047:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
10001049:	8b 43 0c             	mov    0xc(%ebx),%eax
1000104c:	50                   	push   %eax
1000104d:	ff 15 04 c0 00 10    	call   *0x1000c004  ; 0x1000c004=KERNEL32.dll!GlobalUnlock
10001053:	8b 4b 0c             	mov    0xc(%ebx),%ecx
10001056:	51                   	push   %ecx
10001057:	ff 15 00 c0 00 10    	call   *0x1000c000  ; 0x1000c000=KERNEL32.dll!GlobalFree
1000105d:	8b 54 24 14          	mov    0x14(%esp),%edx
10001061:	89 2b                	mov    %ebp,(%ebx)
10001063:	89 6b 04             	mov    %ebp,0x4(%ebx)
10001066:	5f                   	pop    %edi
10001067:	45                   	inc    %ebp
10001068:	5e                   	pop    %esi
10001069:	89 6b 08             	mov    %ebp,0x8(%ebx)
1000106c:	89 53 0c             	mov    %edx,0xc(%ebx)
1000106f:	5d                   	pop    %ebp
10001070:	5b                   	pop    %ebx
10001071:	c2 04 00             	ret    $0x4
10001074:	90                   	nop
10001075:	90                   	nop
10001076:	90                   	nop
10001077:	90                   	nop
10001078:	90                   	nop
10001079:	90                   	nop
1000107a:	90                   	nop
1000107b:	90                   	nop
1000107c:	90                   	nop
1000107d:	90                   	nop
1000107e:	90                   	nop
1000107f:	90                   	nop
10001080:	8b 54 24 04          	mov    0x4(%esp),%edx
10001084:	85 d2                	test   %edx,%edx
10001086:	7c 5f                	jl     0x100010e7
10001088:	8b 41 04             	mov    0x4(%ecx),%eax
1000108b:	0f b6 00             	movzbl (%eax),%eax
1000108e:	3b d0                	cmp    %eax,%edx
10001090:	7d 55                	jge    0x100010e7
10001092:	8b 01                	mov    (%ecx),%eax
10001094:	83 c0 03             	add    $0x3,%eax
10001097:	85 d2                	test   %edx,%edx
10001099:	7e 4e                	jle    0x100010e9
1000109b:	eb 03                	jmp    0x100010a0
1000109d:	8d 49 00             	lea    0x0(%ecx),%ecx
100010a0:	0f be 08             	movsbl (%eax),%ecx
100010a3:	4a                   	dec    %edx
100010a4:	49                   	dec    %ecx
100010a5:	83 f9 30             	cmp    $0x30,%ecx
100010a8:	77 3d                	ja     0x100010e7
100010aa:	0f b6 89 0c 11 00 10 	movzbl 0x1000110c(%ecx),%ecx
100010b1:	ff 24 8d ec 10 00 10 	jmp    *0x100010ec(,%ecx,4)
100010b8:	83 c0 05             	add    $0x5,%eax
100010bb:	eb 23                	jmp    0x100010e0
100010bd:	83 c0 03             	add    $0x3,%eax
100010c0:	eb 1e                	jmp    0x100010e0
100010c2:	83 c0 02             	add    $0x2,%eax
100010c5:	eb 19                	jmp    0x100010e0
100010c7:	0f b6 48 01          	movzbl 0x1(%eax),%ecx
100010cb:	8d 44 08 02          	lea    0x2(%eax,%ecx,1),%eax
100010cf:	eb 0f                	jmp    0x100010e0
100010d1:	83 c0 09             	add    $0x9,%eax
100010d4:	eb 0a                	jmp    0x100010e0
100010d6:	40                   	inc    %eax
100010d7:	eb 07                	jmp    0x100010e0
100010d9:	8b 48 01             	mov    0x1(%eax),%ecx
100010dc:	8d 44 08 05          	lea    0x5(%eax,%ecx,1),%eax
100010e0:	85 d2                	test   %edx,%edx
100010e2:	7f bc                	jg     0x100010a0
100010e4:	c2 04 00             	ret    $0x4
100010e7:	33 c0                	xor    %eax,%eax
100010e9:	c2 04 00             	ret    $0x4
100010ec:	b8 10 00 10 d9       	mov    $0xd9100010,%eax
100010f1:	10 00                	adc    %al,(%eax)
100010f3:	10 d1                	adc    %dl,%cl
100010f5:	10 00                	adc    %al,(%eax)
100010f7:	10 d6                	adc    %dl,%dh
100010f9:	10 00                	adc    %al,(%eax)
100010fb:	10 c2                	adc    %al,%dl
100010fd:	10 00                	adc    %al,(%eax)
100010ff:	10 c7                	adc    %al,%bh
10001101:	10 00                	adc    %al,(%eax)
10001103:	10 bd 10 00 10 e7    	adc    %bh,-0x18effff0(%ebp)
10001109:	10 00                	adc    %al,(%eax)
1000110b:	10 00                	adc    %al,(%eax)
1000110d:	01 02                	add    %eax,(%edx)
1000110f:	01 02                	add    %eax,(%edx)
10001111:	07                   	pop    %es
10001112:	07                   	pop    %es
10001113:	07                   	pop    %es
10001114:	07                   	pop    %es
10001115:	07                   	pop    %es
10001116:	07                   	pop    %es
10001117:	07                   	pop    %es
10001118:	07                   	pop    %es
10001119:	07                   	pop    %es
1000111a:	07                   	pop    %es
1000111b:	07                   	pop    %es
1000111c:	03 04 03             	add    (%ebx,%eax,1),%eax
1000111f:	07                   	pop    %es
10001120:	07                   	pop    %es
10001121:	07                   	pop    %es
10001122:	07                   	pop    %es
10001123:	07                   	pop    %es
10001124:	07                   	pop    %es
10001125:	07                   	pop    %es
10001126:	07                   	pop    %es
10001127:	07                   	pop    %es
10001128:	07                   	pop    %es
10001129:	07                   	pop    %es
1000112a:	07                   	pop    %es
1000112b:	07                   	pop    %es
1000112c:	04 05                	add    $0x5,%al
1000112e:	07                   	pop    %es
1000112f:	07                   	pop    %es
10001130:	07                   	pop    %es
10001131:	07                   	pop    %es
10001132:	07                   	pop    %es
10001133:	07                   	pop    %es
10001134:	07                   	pop    %es
10001135:	07                   	pop    %es
10001136:	07                   	pop    %es
10001137:	07                   	pop    %es
10001138:	07                   	pop    %es
10001139:	07                   	pop    %es
1000113a:	07                   	pop    %es
1000113b:	07                   	pop    %es
1000113c:	06                   	push   %es
1000113d:	90                   	nop
1000113e:	90                   	nop
1000113f:	90                   	nop
10001140:	53                   	push   %ebx
10001141:	8b 5c 24 08          	mov    0x8(%esp),%ebx
10001145:	85 db                	test   %ebx,%ebx
10001147:	56                   	push   %esi
10001148:	8b f1                	mov    %ecx,%esi
1000114a:	8b 46 08             	mov    0x8(%esi),%eax
1000114d:	57                   	push   %edi
1000114e:	0f b7 38             	movzwl (%eax),%edi
10001151:	75 26                	jne    0x10001179
10001153:	8d 4f 01             	lea    0x1(%edi),%ecx
10001156:	51                   	push   %ecx
10001157:	8b ce                	mov    %esi,%ecx
10001159:	e8 a2 fe ff ff       	call   0x10001000
1000115e:	8b 16                	mov    (%esi),%edx
10001160:	c6 04 17 11          	movb   $0x11,(%edi,%edx,1)
10001164:	8b 46 08             	mov    0x8(%esi),%eax
10001167:	66 ff 00             	incw   (%eax)
1000116a:	8b 76 04             	mov    0x4(%esi),%esi
1000116d:	8a 06                	mov    (%esi),%al
1000116f:	fe c0                	inc    %al
10001171:	5f                   	pop    %edi
10001172:	88 06                	mov    %al,(%esi)
10001174:	5e                   	pop    %esi
10001175:	5b                   	pop    %ebx
10001176:	c2 04 00             	ret    $0x4
10001179:	83 fb 81             	cmp    $0xffffff81,%ebx
1000117c:	7e 35                	jle    0x100011b3
1000117e:	81 fb 80 00 00 00    	cmp    $0x80,%ebx
10001184:	7d 2d                	jge    0x100011b3
10001186:	8d 47 02             	lea    0x2(%edi),%eax
10001189:	50                   	push   %eax
1000118a:	8b ce                	mov    %esi,%ecx
1000118c:	e8 6f fe ff ff       	call   0x10001000
10001191:	8b 0e                	mov    (%esi),%ecx
10001193:	c6 04 0f 21          	movb   $0x21,(%edi,%ecx,1)
10001197:	8b 16                	mov    (%esi),%edx
10001199:	88 5c 3a 01          	mov    %bl,0x1(%edx,%edi,1)
1000119d:	8b 46 08             	mov    0x8(%esi),%eax
100011a0:	66 83 00 02          	addw   $0x2,(%eax)
100011a4:	8b 76 04             	mov    0x4(%esi),%esi
100011a7:	8a 06                	mov    (%esi),%al
100011a9:	fe c0                	inc    %al
100011ab:	5f                   	pop    %edi
100011ac:	88 06                	mov    %al,(%esi)
100011ae:	5e                   	pop    %esi
100011af:	5b                   	pop    %ebx
100011b0:	c2 04 00             	ret    $0x4
100011b3:	81 fb 01 80 ff ff    	cmp    $0xffff8001,%ebx
100011b9:	7e 36                	jle    0x100011f1
100011bb:	81 fb 00 80 00 00    	cmp    $0x8000,%ebx
100011c1:	7d 2e                	jge    0x100011f1
100011c3:	8d 47 03             	lea    0x3(%edi),%eax
100011c6:	50                   	push   %eax
100011c7:	8b ce                	mov    %esi,%ecx
100011c9:	e8 32 fe ff ff       	call   0x10001000
100011ce:	8b 0e                	mov    (%esi),%ecx
100011d0:	c6 04 0f 31          	movb   $0x31,(%edi,%ecx,1)
100011d4:	8b 16                	mov    (%esi),%edx
100011d6:	66 89 5c 3a 01       	mov    %bx,0x1(%edx,%edi,1)
100011db:	8b 46 08             	mov    0x8(%esi),%eax
100011de:	66 83 00 03          	addw   $0x3,(%eax)
100011e2:	8b 76 04             	mov    0x4(%esi),%esi
100011e5:	8a 06                	mov    (%esi),%al
100011e7:	fe c0                	inc    %al
100011e9:	5f                   	pop    %edi
100011ea:	88 06                	mov    %al,(%esi)
100011ec:	5e                   	pop    %esi
100011ed:	5b                   	pop    %ebx
100011ee:	c2 04 00             	ret    $0x4
100011f1:	8d 47 05             	lea    0x5(%edi),%eax
100011f4:	50                   	push   %eax
100011f5:	8b ce                	mov    %esi,%ecx
100011f7:	e8 04 fe ff ff       	call   0x10001000
100011fc:	8b 0e                	mov    (%esi),%ecx
100011fe:	c6 04 0f 01          	movb   $0x1,(%edi,%ecx,1)
10001202:	8b 16                	mov    (%esi),%edx
10001204:	89 5c 3a 01          	mov    %ebx,0x1(%edx,%edi,1)
10001208:	8b 46 08             	mov    0x8(%esi),%eax
1000120b:	66 83 00 05          	addw   $0x5,(%eax)
1000120f:	8b 76 04             	mov    0x4(%esi),%esi
10001212:	8a 06                	mov    (%esi),%al
10001214:	fe c0                	inc    %al
10001216:	5f                   	pop    %edi
10001217:	88 06                	mov    %al,(%esi)
10001219:	5e                   	pop    %esi
1000121a:	5b                   	pop    %ebx
1000121b:	c2 04 00             	ret    $0x4
1000121e:	90                   	nop
1000121f:	90                   	nop
10001220:	53                   	push   %ebx
10001221:	55                   	push   %ebp
10001222:	56                   	push   %esi
10001223:	8b 74 24 10          	mov    0x10(%esp),%esi
10001227:	85 f6                	test   %esi,%esi
10001229:	8b e9                	mov    %ecx,%ebp
1000122b:	8b 45 08             	mov    0x8(%ebp),%eax
1000122e:	57                   	push   %edi
1000122f:	0f b7 38             	movzwl (%eax),%edi
10001232:	74 17                	je     0x1000124b
10001234:	8b de                	mov    %esi,%ebx
10001236:	8d 4b 01             	lea    0x1(%ebx),%ecx
10001239:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
10001240:	8a 03                	mov    (%ebx),%al
10001242:	43                   	inc    %ebx
10001243:	84 c0                	test   %al,%al
10001245:	75 f9                	jne    0x10001240
10001247:	2b d9                	sub    %ecx,%ebx
10001249:	75 33                	jne    0x1000127e
1000124b:	8d 4f 02             	lea    0x2(%edi),%ecx
1000124e:	51                   	push   %ecx
1000124f:	8b cd                	mov    %ebp,%ecx
10001251:	e8 aa fd ff ff       	call   0x10001000
10001256:	8b 55 00             	mov    0x0(%ebp),%edx
10001259:	c6 04 17 12          	movb   $0x12,(%edi,%edx,1)
1000125d:	8b 45 00             	mov    0x0(%ebp),%eax
10001260:	c6 44 38 01 00       	movb   $0x0,0x1(%eax,%edi,1)
10001265:	8b 45 08             	mov    0x8(%ebp),%eax
10001268:	66 83 00 02          	addw   $0x2,(%eax)
1000126c:	8b 6d 04             	mov    0x4(%ebp),%ebp
1000126f:	8a 45 00             	mov    0x0(%ebp),%al
10001272:	5f                   	pop    %edi
10001273:	fe c0                	inc    %al
10001275:	5e                   	pop    %esi
10001276:	88 45 00             	mov    %al,0x0(%ebp)
10001279:	5d                   	pop    %ebp
1000127a:	5b                   	pop    %ebx
1000127b:	c2 04 00             	ret    $0x4
1000127e:	81 fb ff 00 00 00    	cmp    $0xff,%ebx
10001284:	7d 29                	jge    0x100012af
10001286:	43                   	inc    %ebx
10001287:	8d 4c 3b 02          	lea    0x2(%ebx,%edi,1),%ecx
1000128b:	51                   	push   %ecx
1000128c:	8b cd                	mov    %ebp,%ecx
1000128e:	e8 6d fd ff ff       	call   0x10001000
10001293:	8b 55 00             	mov    0x0(%ebp),%edx
10001296:	c6 04 17 22          	movb   $0x22,(%edi,%edx,1)
1000129a:	8b 45 00             	mov    0x0(%ebp),%eax
1000129d:	88 5c 38 01          	mov    %bl,0x1(%eax,%edi,1)
100012a1:	8b 55 00             	mov    0x0(%ebp),%edx
100012a4:	8b cb                	mov    %ebx,%ecx
100012a6:	8d 7c 3a 02          	lea    0x2(%edx,%edi,1),%edi
100012aa:	83 c3 02             	add    $0x2,%ebx
100012ad:	eb 27                	jmp    0x100012d6
100012af:	43                   	inc    %ebx
100012b0:	8d 4c 3b 05          	lea    0x5(%ebx,%edi,1),%ecx
100012b4:	51                   	push   %ecx
100012b5:	8b cd                	mov    %ebp,%ecx
100012b7:	e8 44 fd ff ff       	call   0x10001000
100012bc:	8b 55 00             	mov    0x0(%ebp),%edx
100012bf:	c6 04 17 02          	movb   $0x2,(%edi,%edx,1)
100012c3:	8b 45 00             	mov    0x0(%ebp),%eax
100012c6:	89 5c 38 01          	mov    %ebx,0x1(%eax,%edi,1)
100012ca:	8b 55 00             	mov    0x0(%ebp),%edx
100012cd:	8b cb                	mov    %ebx,%ecx
100012cf:	8d 7c 3a 05          	lea    0x5(%edx,%edi,1),%edi
100012d3:	83 c3 05             	add    $0x5,%ebx
100012d6:	8b c1                	mov    %ecx,%eax
100012d8:	c1 e9 02             	shr    $0x2,%ecx
100012db:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
100012dd:	8b c8                	mov    %eax,%ecx
100012df:	83 e1 03             	and    $0x3,%ecx
100012e2:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
100012e4:	8b 45 08             	mov    0x8(%ebp),%eax
100012e7:	66 01 18             	add    %bx,(%eax)
100012ea:	8b 6d 04             	mov    0x4(%ebp),%ebp
100012ed:	8a 45 00             	mov    0x0(%ebp),%al
100012f0:	5f                   	pop    %edi
100012f1:	fe c0                	inc    %al
100012f3:	5e                   	pop    %esi
100012f4:	88 45 00             	mov    %al,0x0(%ebp)
100012f7:	5d                   	pop    %ebp
100012f8:	5b                   	pop    %ebx
100012f9:	c2 04 00             	ret    $0x4
100012fc:	90                   	nop
100012fd:	90                   	nop
100012fe:	90                   	nop
100012ff:	90                   	nop
10001300:	8b 44 24 04          	mov    0x4(%esp),%eax
10001304:	50                   	push   %eax
10001305:	e8 76 fd ff ff       	call   0x10001080
1000130a:	85 c0                	test   %eax,%eax
1000130c:	75 03                	jne    0x10001311
1000130e:	c2 04 00             	ret    $0x4
10001311:	0f be 00             	movsbl (%eax),%eax
10001314:	c2 04 00             	ret    $0x4
10001317:	90                   	nop
10001318:	90                   	nop
10001319:	90                   	nop
1000131a:	90                   	nop
1000131b:	90                   	nop
1000131c:	90                   	nop
1000131d:	90                   	nop
1000131e:	90                   	nop
1000131f:	90                   	nop
10001320:	8b 44 24 04          	mov    0x4(%esp),%eax
10001324:	50                   	push   %eax
10001325:	e8 56 fd ff ff       	call   0x10001080
1000132a:	0f be 08             	movsbl (%eax),%ecx
1000132d:	49                   	dec    %ecx
1000132e:	83 f9 30             	cmp    $0x30,%ecx
10001331:	77 22                	ja     0x10001355
10001333:	0f b6 89 70 13 00 10 	movzbl 0x10001370(%ecx),%ecx
1000133a:	ff 24 8d 5c 13 00 10 	jmp    *0x1000135c(,%ecx,4)
10001341:	8b 40 01             	mov    0x1(%eax),%eax
10001344:	c2 04 00             	ret    $0x4
10001347:	0f be 40 01          	movsbl 0x1(%eax),%eax
1000134b:	c2 04 00             	ret    $0x4
1000134e:	0f bf 40 01          	movswl 0x1(%eax),%eax
10001352:	c2 04 00             	ret    $0x4
10001355:	33 c0                	xor    %eax,%eax
10001357:	c2 04 00             	ret    $0x4
1000135a:	8b ff                	mov    %edi,%edi
1000135c:	41                   	inc    %ecx
1000135d:	13 00                	adc    (%eax),%eax
1000135f:	10 55 13             	adc    %dl,0x13(%ebp)
10001362:	00 10                	add    %dl,(%eax)
10001364:	47                   	inc    %edi
10001365:	13 00                	adc    (%eax),%eax
10001367:	10 4e 13             	adc    %cl,0x13(%esi)
1000136a:	00 10                	add    %dl,(%eax)
1000136c:	55                   	push   %ebp
1000136d:	13 00                	adc    (%eax),%eax
1000136f:	10 00                	adc    %al,(%eax)
10001371:	04 04                	add    $0x4,%al
10001373:	04 04                	add    $0x4,%al
10001375:	04 04                	add    $0x4,%al
10001377:	04 04                	add    $0x4,%al
10001379:	04 04                	add    $0x4,%al
1000137b:	04 04                	add    $0x4,%al
1000137d:	04 04                	add    $0x4,%al
1000137f:	04 01                	add    $0x1,%al
10001381:	04 04                	add    $0x4,%al
10001383:	04 04                	add    $0x4,%al
10001385:	04 04                	add    $0x4,%al
10001387:	04 04                	add    $0x4,%al
10001389:	04 04                	add    $0x4,%al
1000138b:	04 04                	add    $0x4,%al
1000138d:	04 04                	add    $0x4,%al
1000138f:	04 02                	add    $0x2,%al
10001391:	04 04                	add    $0x4,%al
10001393:	04 04                	add    $0x4,%al
10001395:	04 04                	add    $0x4,%al
10001397:	04 04                	add    $0x4,%al
10001399:	04 04                	add    $0x4,%al
1000139b:	04 04                	add    $0x4,%al
1000139d:	04 04                	add    $0x4,%al
1000139f:	04 03                	add    $0x3,%al
100013a1:	90                   	nop
100013a2:	90                   	nop
100013a3:	90                   	nop
100013a4:	90                   	nop
100013a5:	90                   	nop
100013a6:	90                   	nop
100013a7:	90                   	nop
100013a8:	90                   	nop
100013a9:	90                   	nop
100013aa:	90                   	nop
100013ab:	90                   	nop
100013ac:	90                   	nop
100013ad:	90                   	nop
100013ae:	90                   	nop
100013af:	90                   	nop
100013b0:	c3                   	ret
100013b1:	90                   	nop
100013b2:	90                   	nop
100013b3:	90                   	nop
100013b4:	90                   	nop
100013b5:	90                   	nop
100013b6:	90                   	nop
100013b7:	90                   	nop
100013b8:	90                   	nop
100013b9:	90                   	nop
100013ba:	90                   	nop
100013bb:	90                   	nop
100013bc:	90                   	nop
100013bd:	90                   	nop
100013be:	90                   	nop
100013bf:	90                   	nop
100013c0:	c2 04 00             	ret    $0x4
100013c3:	90                   	nop
100013c4:	90                   	nop
100013c5:	90                   	nop
100013c6:	90                   	nop
100013c7:	90                   	nop
100013c8:	90                   	nop
100013c9:	90                   	nop
100013ca:	90                   	nop
100013cb:	90                   	nop
100013cc:	90                   	nop
100013cd:	90                   	nop
100013ce:	90                   	nop
100013cf:	90                   	nop
100013d0:	8b 44 24 04          	mov    0x4(%esp),%eax
100013d4:	8b 4c 24 08          	mov    0x8(%esp),%ecx
100013d8:	3b c1                	cmp    %ecx,%eax
100013da:	74 11                	je     0x100013ed
100013dc:	8b 54 24 0c          	mov    0xc(%esp),%edx
100013e0:	56                   	push   %esi
100013e1:	8b 32                	mov    (%edx),%esi
100013e3:	89 30                	mov    %esi,(%eax)
100013e5:	83 c0 04             	add    $0x4,%eax
100013e8:	3b c1                	cmp    %ecx,%eax
100013ea:	75 f5                	jne    0x100013e1
100013ec:	5e                   	pop    %esi
100013ed:	c3                   	ret
100013ee:	90                   	nop
100013ef:	90                   	nop
100013f0:	55                   	push   %ebp
100013f1:	8b ec                	mov    %esp,%ebp
100013f3:	6a ff                	push   $0xffffffff
100013f5:	68 10 b1 00 10       	push   $0x1000b110
100013fa:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10001400:	50                   	push   %eax
10001401:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10001408:	83 ec 0c             	sub    $0xc,%esp
1000140b:	8b 45 08             	mov    0x8(%ebp),%eax
1000140e:	53                   	push   %ebx
1000140f:	56                   	push   %esi
10001410:	8b f0                	mov    %eax,%esi
10001412:	83 ce 0f             	or     $0xf,%esi
10001415:	83 fe fe             	cmp    $0xfffffffe,%esi
10001418:	57                   	push   %edi
10001419:	8b d9                	mov    %ecx,%ebx
1000141b:	89 65 f0             	mov    %esp,-0x10(%ebp)
1000141e:	89 5d e8             	mov    %ebx,-0x18(%ebp)
10001421:	89 75 ec             	mov    %esi,-0x14(%ebp)
10001424:	76 05                	jbe    0x1000142b
10001426:	89 45 ec             	mov    %eax,-0x14(%ebp)
10001429:	8b f0                	mov    %eax,%esi
1000142b:	8d 46 01             	lea    0x1(%esi),%eax
1000142e:	50                   	push   %eax
1000142f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
10001436:	e8 d5 40 00 00       	call   0x10005510
1000143b:	8b d0                	mov    %eax,%edx
1000143d:	83 c4 04             	add    $0x4,%esp
10001440:	89 55 08             	mov    %edx,0x8(%ebp)
10001443:	eb 29                	jmp    0x1000146e
10001445:	8b 45 08             	mov    0x8(%ebp),%eax
10001448:	89 45 ec             	mov    %eax,-0x14(%ebp)
1000144b:	40                   	inc    %eax
1000144c:	89 65 f0             	mov    %esp,-0x10(%ebp)
1000144f:	50                   	push   %eax
10001450:	c6 45 fc 02          	movb   $0x2,-0x4(%ebp)
10001454:	e8 b7 40 00 00       	call   0x10005510
10001459:	89 45 08             	mov    %eax,0x8(%ebp)
1000145c:	83 c4 04             	add    $0x4,%esp
1000145f:	b8 65 14 00 10       	mov    $0x10001465,%eax
10001464:	c3                   	ret
10001465:	8b 5d e8             	mov    -0x18(%ebp),%ebx
10001468:	8b 75 ec             	mov    -0x14(%ebp),%esi
1000146b:	8b 55 08             	mov    0x8(%ebp),%edx
1000146e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
10001471:	85 c9                	test   %ecx,%ecx
10001473:	76 24                	jbe    0x10001499
10001475:	83 7b 18 10          	cmpl   $0x10,0x18(%ebx)
10001479:	72 05                	jb     0x10001480
1000147b:	8b 73 04             	mov    0x4(%ebx),%esi
1000147e:	eb 03                	jmp    0x10001483
10001480:	8d 73 04             	lea    0x4(%ebx),%esi
10001483:	8b c1                	mov    %ecx,%eax
10001485:	c1 e9 02             	shr    $0x2,%ecx
10001488:	8b fa                	mov    %edx,%edi
1000148a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
1000148c:	8b c8                	mov    %eax,%ecx
1000148e:	83 e1 03             	and    $0x3,%ecx
10001491:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
10001493:	8b 75 ec             	mov    -0x14(%ebp),%esi
10001496:	8b 4d 0c             	mov    0xc(%ebp),%ecx
10001499:	83 7b 18 10          	cmpl   $0x10,0x18(%ebx)
1000149d:	72 12                	jb     0x100014b1
1000149f:	8b 43 04             	mov    0x4(%ebx),%eax
100014a2:	50                   	push   %eax
100014a3:	e8 35 45 00 00       	call   0x100059dd
100014a8:	8b 55 08             	mov    0x8(%ebp),%edx
100014ab:	8b 4d 0c             	mov    0xc(%ebp),%ecx
100014ae:	83 c4 04             	add    $0x4,%esp
100014b1:	83 fe 10             	cmp    $0x10,%esi
100014b4:	8d 43 04             	lea    0x4(%ebx),%eax
100014b7:	c6 00 00             	movb   $0x0,(%eax)
100014ba:	89 10                	mov    %edx,(%eax)
100014bc:	89 73 18             	mov    %esi,0x18(%ebx)
100014bf:	89 4b 14             	mov    %ecx,0x14(%ebx)
100014c2:	72 02                	jb     0x100014c6
100014c4:	8b c2                	mov    %edx,%eax
100014c6:	5f                   	pop    %edi
100014c7:	c6 04 08 00          	movb   $0x0,(%eax,%ecx,1)
100014cb:	8b 4d f4             	mov    -0xc(%ebp),%ecx
100014ce:	5e                   	pop    %esi
100014cf:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
100014d6:	5b                   	pop    %ebx
100014d7:	8b e5                	mov    %ebp,%esp
100014d9:	5d                   	pop    %ebp
100014da:	c2 08 00             	ret    $0x8
100014dd:	8b 75 e8             	mov    -0x18(%ebp),%esi
100014e0:	83 7e 18 10          	cmpl   $0x10,0x18(%esi)
100014e4:	72 0c                	jb     0x100014f2
100014e6:	8b 46 04             	mov    0x4(%esi),%eax
100014e9:	50                   	push   %eax
100014ea:	e8 ee 44 00 00       	call   0x100059dd
100014ef:	83 c4 04             	add    $0x4,%esp
100014f2:	6a 00                	push   $0x0
100014f4:	c7 46 18 0f 00 00 00 	movl   $0xf,0x18(%esi)
100014fb:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
10001502:	6a 00                	push   $0x0
10001504:	c6 46 04 00          	movb   $0x0,0x4(%esi)
10001508:	e8 d5 44 00 00       	call   0x100059e2
1000150d:	cc                   	int3
1000150e:	90                   	nop
1000150f:	90                   	nop
10001510:	8b 44 24 08          	mov    0x8(%esp),%eax
10001514:	85 c0                	test   %eax,%eax
10001516:	76 1a                	jbe    0x10001532
10001518:	8b 54 24 0c          	mov    0xc(%esp),%edx
1000151c:	8b c8                	mov    %eax,%ecx
1000151e:	8b 44 24 04          	mov    0x4(%esp),%eax
10001522:	56                   	push   %esi
10001523:	85 c0                	test   %eax,%eax
10001525:	74 04                	je     0x1000152b
10001527:	8b 32                	mov    (%edx),%esi
10001529:	89 30                	mov    %esi,(%eax)
1000152b:	83 c0 04             	add    $0x4,%eax
1000152e:	49                   	dec    %ecx
1000152f:	75 f2                	jne    0x10001523
10001531:	5e                   	pop    %esi
10001532:	c3                   	ret
10001533:	90                   	nop
10001534:	90                   	nop
10001535:	90                   	nop
10001536:	90                   	nop
10001537:	90                   	nop
10001538:	90                   	nop
10001539:	90                   	nop
1000153a:	90                   	nop
1000153b:	90                   	nop
1000153c:	90                   	nop
1000153d:	90                   	nop
1000153e:	90                   	nop
1000153f:	90                   	nop
10001540:	56                   	push   %esi
10001541:	8b f1                	mov    %ecx,%esi
10001543:	83 7e 18 10          	cmpl   $0x10,0x18(%esi)
10001547:	72 0c                	jb     0x10001555
10001549:	8b 46 04             	mov    0x4(%esi),%eax
1000154c:	50                   	push   %eax
1000154d:	e8 8b 44 00 00       	call   0x100059dd
10001552:	83 c4 04             	add    $0x4,%esp
10001555:	33 c0                	xor    %eax,%eax
10001557:	c7 46 18 0f 00 00 00 	movl   $0xf,0x18(%esi)
1000155e:	89 46 14             	mov    %eax,0x14(%esi)
10001561:	88 46 04             	mov    %al,0x4(%esi)
10001564:	5e                   	pop    %esi
10001565:	c3                   	ret
10001566:	90                   	nop
10001567:	90                   	nop
10001568:	90                   	nop
10001569:	90                   	nop
1000156a:	90                   	nop
1000156b:	90                   	nop
1000156c:	90                   	nop
1000156d:	90                   	nop
1000156e:	90                   	nop
1000156f:	90                   	nop
10001570:	56                   	push   %esi
10001571:	57                   	push   %edi
10001572:	8b 7c 24 0c          	mov    0xc(%esp),%edi
10001576:	83 ff fe             	cmp    $0xfffffffe,%edi
10001579:	8b f1                	mov    %ecx,%esi
1000157b:	76 05                	jbe    0x10001582
1000157d:	e8 31 40 00 00       	call   0x100055b3
10001582:	8b 46 18             	mov    0x18(%esi),%eax
10001585:	3b c7                	cmp    %edi,%eax
10001587:	73 39                	jae    0x100015c2
10001589:	8a 44 24 10          	mov    0x10(%esp),%al
1000158d:	84 c0                	test   %al,%al
1000158f:	74 18                	je     0x100015a9
10001591:	33 c0                	xor    %eax,%eax
10001593:	50                   	push   %eax
10001594:	57                   	push   %edi
10001595:	8b ce                	mov    %esi,%ecx
10001597:	e8 54 fe ff ff       	call   0x100013f0
1000159c:	33 c0                	xor    %eax,%eax
1000159e:	3b c7                	cmp    %edi,%eax
100015a0:	1b c0                	sbb    %eax,%eax
100015a2:	5f                   	pop    %edi
100015a3:	f7 d8                	neg    %eax
100015a5:	5e                   	pop    %esi
100015a6:	c2 08 00             	ret    $0x8
100015a9:	8b 46 14             	mov    0x14(%esi),%eax
100015ac:	50                   	push   %eax
100015ad:	57                   	push   %edi
100015ae:	8b ce                	mov    %esi,%ecx
100015b0:	e8 3b fe ff ff       	call   0x100013f0
100015b5:	33 c0                	xor    %eax,%eax
100015b7:	3b c7                	cmp    %edi,%eax
100015b9:	1b c0                	sbb    %eax,%eax
100015bb:	5f                   	pop    %edi
100015bc:	f7 d8                	neg    %eax
100015be:	5e                   	pop    %esi
100015bf:	c2 08 00             	ret    $0x8
100015c2:	8a 4c 24 10          	mov    0x10(%esp),%cl
100015c6:	84 c9                	test   %cl,%cl
100015c8:	74 35                	je     0x100015ff
100015ca:	83 ff 10             	cmp    $0x10,%edi
100015cd:	73 30                	jae    0x100015ff
100015cf:	83 f8 10             	cmp    $0x10,%eax
100015d2:	72 0c                	jb     0x100015e0
100015d4:	8b 46 04             	mov    0x4(%esi),%eax
100015d7:	50                   	push   %eax
100015d8:	e8 00 44 00 00       	call   0x100059dd
100015dd:	83 c4 04             	add    $0x4,%esp
100015e0:	33 c0                	xor    %eax,%eax
100015e2:	3b c7                	cmp    %edi,%eax
100015e4:	c7 46 18 0f 00 00 00 	movl   $0xf,0x18(%esi)
100015eb:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
100015f2:	1b c0                	sbb    %eax,%eax
100015f4:	5f                   	pop    %edi
100015f5:	c6 46 04 00          	movb   $0x0,0x4(%esi)
100015f9:	f7 d8                	neg    %eax
100015fb:	5e                   	pop    %esi
100015fc:	c2 08 00             	ret    $0x8
100015ff:	85 ff                	test   %edi,%edi
10001601:	75 21                	jne    0x10001624
10001603:	83 f8 10             	cmp    $0x10,%eax
10001606:	89 7e 14             	mov    %edi,0x14(%esi)
10001609:	72 13                	jb     0x1000161e
1000160b:	8b 76 04             	mov    0x4(%esi),%esi
1000160e:	33 c0                	xor    %eax,%eax
10001610:	3b c7                	cmp    %edi,%eax
10001612:	1b c0                	sbb    %eax,%eax
10001614:	5f                   	pop    %edi
10001615:	c6 06 00             	movb   $0x0,(%esi)
10001618:	f7 d8                	neg    %eax
1000161a:	5e                   	pop    %esi
1000161b:	c2 08 00             	ret    $0x8
1000161e:	83 c6 04             	add    $0x4,%esi
10001621:	c6 06 00             	movb   $0x0,(%esi)
10001624:	33 c0                	xor    %eax,%eax
10001626:	3b c7                	cmp    %edi,%eax
10001628:	1b c0                	sbb    %eax,%eax
1000162a:	5f                   	pop    %edi
1000162b:	f7 d8                	neg    %eax
1000162d:	5e                   	pop    %esi
1000162e:	c2 08 00             	ret    $0x8
10001631:	90                   	nop
10001632:	90                   	nop
10001633:	90                   	nop
10001634:	90                   	nop
10001635:	90                   	nop
10001636:	90                   	nop
10001637:	90                   	nop
10001638:	90                   	nop
10001639:	90                   	nop
1000163a:	90                   	nop
1000163b:	90                   	nop
1000163c:	90                   	nop
1000163d:	90                   	nop
1000163e:	90                   	nop
1000163f:	90                   	nop
10001640:	56                   	push   %esi
10001641:	8b f1                	mov    %ecx,%esi
10001643:	c7 06 b0 c2 00 10    	movl   $0x1000c2b0,(%esi)
10001649:	83 7e 24 10          	cmpl   $0x10,0x24(%esi)
1000164d:	72 0c                	jb     0x1000165b
1000164f:	8b 46 10             	mov    0x10(%esi),%eax
10001652:	50                   	push   %eax
10001653:	e8 85 43 00 00       	call   0x100059dd
10001658:	83 c4 04             	add    $0x4,%esp
1000165b:	33 c0                	xor    %eax,%eax
1000165d:	c7 46 24 0f 00 00 00 	movl   $0xf,0x24(%esi)
10001664:	89 46 20             	mov    %eax,0x20(%esi)
10001667:	88 46 10             	mov    %al,0x10(%esi)
1000166a:	8b ce                	mov    %esi,%ecx
1000166c:	5e                   	pop    %esi
1000166d:	e9 94 48 00 00       	jmp    0x10005f06
10001672:	90                   	nop
10001673:	90                   	nop
10001674:	90                   	nop
10001675:	90                   	nop
10001676:	90                   	nop
10001677:	90                   	nop
10001678:	90                   	nop
10001679:	90                   	nop
1000167a:	90                   	nop
1000167b:	90                   	nop
1000167c:	90                   	nop
1000167d:	90                   	nop
1000167e:	90                   	nop
1000167f:	90                   	nop
10001680:	83 79 24 10          	cmpl   $0x10,0x24(%ecx)
10001684:	72 04                	jb     0x1000168a
10001686:	8b 41 10             	mov    0x10(%ecx),%eax
10001689:	c3                   	ret
1000168a:	8d 41 10             	lea    0x10(%ecx),%eax
1000168d:	c3                   	ret
1000168e:	90                   	nop
1000168f:	90                   	nop
10001690:	53                   	push   %ebx
10001691:	55                   	push   %ebp
10001692:	56                   	push   %esi
10001693:	8b 74 24 10          	mov    0x10(%esp),%esi
10001697:	57                   	push   %edi
10001698:	8b f9                	mov    %ecx,%edi
1000169a:	39 77 14             	cmp    %esi,0x14(%edi)
1000169d:	73 05                	jae    0x100016a4
1000169f:	e8 b7 3e 00 00       	call   0x1000555b
100016a4:	8b 47 14             	mov    0x14(%edi),%eax
100016a7:	8b 5c 24 18          	mov    0x18(%esp),%ebx
100016ab:	2b c6                	sub    %esi,%eax
100016ad:	3b c3                	cmp    %ebx,%eax
100016af:	73 02                	jae    0x100016b3
100016b1:	8b d8                	mov    %eax,%ebx
100016b3:	85 db                	test   %ebx,%ebx
100016b5:	76 69                	jbe    0x10001720
100016b7:	8b 4f 18             	mov    0x18(%edi),%ecx
100016ba:	83 f9 10             	cmp    $0x10,%ecx
100016bd:	8d 6f 04             	lea    0x4(%edi),%ebp
100016c0:	72 05                	jb     0x100016c7
100016c2:	8b 55 00             	mov    0x0(%ebp),%edx
100016c5:	eb 02                	jmp    0x100016c9
100016c7:	8b d5                	mov    %ebp,%edx
100016c9:	83 f9 10             	cmp    $0x10,%ecx
100016cc:	72 05                	jb     0x100016d3
100016ce:	8b 4d 00             	mov    0x0(%ebp),%ecx
100016d1:	eb 02                	jmp    0x100016d5
100016d3:	8b cd                	mov    %ebp,%ecx
100016d5:	2b c3                	sub    %ebx,%eax
100016d7:	03 d6                	add    %esi,%edx
100016d9:	50                   	push   %eax
100016da:	03 d3                	add    %ebx,%edx
100016dc:	52                   	push   %edx
100016dd:	03 ce                	add    %esi,%ecx
100016df:	51                   	push   %ecx
100016e0:	e8 bb 3f 00 00       	call   0x100056a0
100016e5:	8b 77 14             	mov    0x14(%edi),%esi
100016e8:	2b f3                	sub    %ebx,%esi
100016ea:	83 c4 0c             	add    $0xc,%esp
100016ed:	83 fe fe             	cmp    $0xfffffffe,%esi
100016f0:	76 07                	jbe    0x100016f9
100016f2:	8b cf                	mov    %edi,%ecx
100016f4:	e8 ba 3e 00 00       	call   0x100055b3
100016f9:	8b 47 18             	mov    0x18(%edi),%eax
100016fc:	3b c6                	cmp    %esi,%eax
100016fe:	73 29                	jae    0x10001729
10001700:	8b 47 14             	mov    0x14(%edi),%eax
10001703:	50                   	push   %eax
10001704:	56                   	push   %esi
10001705:	8b cf                	mov    %edi,%ecx
10001707:	e8 e4 fc ff ff       	call   0x100013f0
1000170c:	85 f6                	test   %esi,%esi
1000170e:	76 10                	jbe    0x10001720
10001710:	83 7f 18 10          	cmpl   $0x10,0x18(%edi)
10001714:	89 77 14             	mov    %esi,0x14(%edi)
10001717:	72 03                	jb     0x1000171c
10001719:	8b 6d 00             	mov    0x0(%ebp),%ebp
1000171c:	c6 04 2e 00          	movb   $0x0,(%esi,%ebp,1)
10001720:	8b c7                	mov    %edi,%eax
10001722:	5f                   	pop    %edi
10001723:	5e                   	pop    %esi
10001724:	5d                   	pop    %ebp
10001725:	5b                   	pop    %ebx
10001726:	c2 08 00             	ret    $0x8
10001729:	85 f6                	test   %esi,%esi
1000172b:	75 e1                	jne    0x1000170e
1000172d:	83 f8 10             	cmp    $0x10,%eax
10001730:	89 77 14             	mov    %esi,0x14(%edi)
10001733:	72 03                	jb     0x10001738
10001735:	8b 6d 00             	mov    0x0(%ebp),%ebp
10001738:	8b c7                	mov    %edi,%eax
1000173a:	5f                   	pop    %edi
1000173b:	5e                   	pop    %esi
1000173c:	c6 45 00 00          	movb   $0x0,0x0(%ebp)
10001740:	5d                   	pop    %ebp
10001741:	5b                   	pop    %ebx
10001742:	c2 08 00             	ret    $0x8
10001745:	90                   	nop
10001746:	90                   	nop
10001747:	90                   	nop
10001748:	90                   	nop
10001749:	90                   	nop
1000174a:	90                   	nop
1000174b:	90                   	nop
1000174c:	90                   	nop
1000174d:	90                   	nop
1000174e:	90                   	nop
1000174f:	90                   	nop
10001750:	8b 51 08             	mov    0x8(%ecx),%edx
10001753:	53                   	push   %ebx
10001754:	56                   	push   %esi
10001755:	57                   	push   %edi
10001756:	8b 7c 24 14          	mov    0x14(%esp),%edi
1000175a:	8d 47 04             	lea    0x4(%edi),%eax
1000175d:	3b c2                	cmp    %edx,%eax
1000175f:	74 10                	je     0x10001771
10001761:	8b f7                	mov    %edi,%esi
10001763:	2b f0                	sub    %eax,%esi
10001765:	8b 18                	mov    (%eax),%ebx
10001767:	89 1c 06             	mov    %ebx,(%esi,%eax,1)
1000176a:	83 c0 04             	add    $0x4,%eax
1000176d:	3b c2                	cmp    %edx,%eax
1000176f:	75 f4                	jne    0x10001765
10001771:	83 41 08 fc          	addl   $0xfffffffc,0x8(%ecx)
10001775:	8b 44 24 10          	mov    0x10(%esp),%eax
10001779:	89 38                	mov    %edi,(%eax)
1000177b:	5f                   	pop    %edi
1000177c:	5e                   	pop    %esi
1000177d:	5b                   	pop    %ebx
1000177e:	c2 08 00             	ret    $0x8
10001781:	90                   	nop
10001782:	90                   	nop
10001783:	90                   	nop
10001784:	90                   	nop
10001785:	90                   	nop
10001786:	90                   	nop
10001787:	90                   	nop
10001788:	90                   	nop
10001789:	90                   	nop
1000178a:	90                   	nop
1000178b:	90                   	nop
1000178c:	90                   	nop
1000178d:	90                   	nop
1000178e:	90                   	nop
1000178f:	90                   	nop
10001790:	53                   	push   %ebx
10001791:	55                   	push   %ebp
10001792:	56                   	push   %esi
10001793:	8b 74 24 10          	mov    0x10(%esp),%esi
10001797:	8b 46 14             	mov    0x14(%esi),%eax
1000179a:	57                   	push   %edi
1000179b:	8b 7c 24 18          	mov    0x18(%esp),%edi
1000179f:	3b c7                	cmp    %edi,%eax
100017a1:	8b d9                	mov    %ecx,%ebx
100017a3:	73 05                	jae    0x100017aa
100017a5:	e8 b1 3d 00 00       	call   0x1000555b
100017aa:	8b 6e 14             	mov    0x14(%esi),%ebp
100017ad:	8b 44 24 1c          	mov    0x1c(%esp),%eax
100017b1:	2b ef                	sub    %edi,%ebp
100017b3:	3b c5                	cmp    %ebp,%eax
100017b5:	73 02                	jae    0x100017b9
100017b7:	8b e8                	mov    %eax,%ebp
100017b9:	3b de                	cmp    %esi,%ebx
100017bb:	8b cb                	mov    %ebx,%ecx
100017bd:	75 1d                	jne    0x100017dc
100017bf:	6a ff                	push   $0xffffffff
100017c1:	03 ef                	add    %edi,%ebp
100017c3:	55                   	push   %ebp
100017c4:	e8 c7 fe ff ff       	call   0x10001690
100017c9:	57                   	push   %edi
100017ca:	6a 00                	push   $0x0
100017cc:	8b cb                	mov    %ebx,%ecx
100017ce:	e8 bd fe ff ff       	call   0x10001690
100017d3:	5f                   	pop    %edi
100017d4:	5e                   	pop    %esi
100017d5:	5d                   	pop    %ebp
100017d6:	8b c3                	mov    %ebx,%eax
100017d8:	5b                   	pop    %ebx
100017d9:	c2 0c 00             	ret    $0xc
100017dc:	6a 01                	push   $0x1
100017de:	55                   	push   %ebp
100017df:	e8 8c fd ff ff       	call   0x10001570
100017e4:	84 c0                	test   %al,%al
100017e6:	74 45                	je     0x1000182d
100017e8:	8b 4e 18             	mov    0x18(%esi),%ecx
100017eb:	b8 10 00 00 00       	mov    $0x10,%eax
100017f0:	3b c8                	cmp    %eax,%ecx
100017f2:	72 05                	jb     0x100017f9
100017f4:	8b 76 04             	mov    0x4(%esi),%esi
100017f7:	eb 03                	jmp    0x100017fc
100017f9:	83 c6 04             	add    $0x4,%esi
100017fc:	39 43 18             	cmp    %eax,0x18(%ebx)
100017ff:	8d 43 04             	lea    0x4(%ebx),%eax
10001802:	72 04                	jb     0x10001808
10001804:	8b 10                	mov    (%eax),%edx
10001806:	eb 02                	jmp    0x1000180a
10001808:	8b d0                	mov    %eax,%edx
1000180a:	03 f7                	add    %edi,%esi
1000180c:	8b cd                	mov    %ebp,%ecx
1000180e:	8b fa                	mov    %edx,%edi
10001810:	8b d1                	mov    %ecx,%edx
10001812:	c1 e9 02             	shr    $0x2,%ecx
10001815:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
10001817:	8b ca                	mov    %edx,%ecx
10001819:	83 e1 03             	and    $0x3,%ecx
1000181c:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
1000181e:	83 7b 18 10          	cmpl   $0x10,0x18(%ebx)
10001822:	89 6b 14             	mov    %ebp,0x14(%ebx)
10001825:	72 02                	jb     0x10001829
10001827:	8b 00                	mov    (%eax),%eax
10001829:	c6 04 28 00          	movb   $0x0,(%eax,%ebp,1)
1000182d:	5f                   	pop    %edi
1000182e:	5e                   	pop    %esi
1000182f:	5d                   	pop    %ebp
10001830:	8b c3                	mov    %ebx,%eax
10001832:	5b                   	pop    %ebx
10001833:	c2 0c 00             	ret    $0xc
10001836:	90                   	nop
10001837:	90                   	nop
10001838:	90                   	nop
10001839:	90                   	nop
1000183a:	90                   	nop
1000183b:	90                   	nop
1000183c:	90                   	nop
1000183d:	90                   	nop
1000183e:	90                   	nop
1000183f:	90                   	nop
10001840:	53                   	push   %ebx
10001841:	8b d9                	mov    %ecx,%ebx
10001843:	8b 4b 18             	mov    0x18(%ebx),%ecx
10001846:	83 f9 10             	cmp    $0x10,%ecx
10001849:	55                   	push   %ebp
1000184a:	56                   	push   %esi
1000184b:	8d 6b 04             	lea    0x4(%ebx),%ebp
1000184e:	72 05                	jb     0x10001855
10001850:	8b 45 00             	mov    0x0(%ebp),%eax
10001853:	eb 02                	jmp    0x10001857
10001855:	8b c5                	mov    %ebp,%eax
10001857:	8b 74 24 10          	mov    0x10(%esp),%esi
1000185b:	3b c6                	cmp    %esi,%eax
1000185d:	77 33                	ja     0x10001892
1000185f:	83 f9 10             	cmp    $0x10,%ecx
10001862:	72 05                	jb     0x10001869
10001864:	8b 45 00             	mov    0x0(%ebp),%eax
10001867:	eb 02                	jmp    0x1000186b
10001869:	8b c5                	mov    %ebp,%eax
1000186b:	8b 53 14             	mov    0x14(%ebx),%edx
1000186e:	03 d0                	add    %eax,%edx
10001870:	3b f2                	cmp    %edx,%esi
10001872:	73 1e                	jae    0x10001892
10001874:	83 f9 10             	cmp    $0x10,%ecx
10001877:	72 03                	jb     0x1000187c
10001879:	8b 6d 00             	mov    0x0(%ebp),%ebp
1000187c:	8b 44 24 14          	mov    0x14(%esp),%eax
10001880:	50                   	push   %eax
10001881:	2b f5                	sub    %ebp,%esi
10001883:	56                   	push   %esi
10001884:	53                   	push   %ebx
10001885:	8b cb                	mov    %ebx,%ecx
10001887:	e8 04 ff ff ff       	call   0x10001790
1000188c:	5e                   	pop    %esi
1000188d:	5d                   	pop    %ebp
1000188e:	5b                   	pop    %ebx
1000188f:	c2 08 00             	ret    $0x8
10001892:	8b 4c 24 14          	mov    0x14(%esp),%ecx
10001896:	6a 01                	push   $0x1
10001898:	51                   	push   %ecx
10001899:	8b cb                	mov    %ebx,%ecx
1000189b:	e8 d0 fc ff ff       	call   0x10001570
100018a0:	84 c0                	test   %al,%al
100018a2:	74 33                	je     0x100018d7
100018a4:	83 7b 18 10          	cmpl   $0x10,0x18(%ebx)
100018a8:	57                   	push   %edi
100018a9:	72 05                	jb     0x100018b0
100018ab:	8b 7d 00             	mov    0x0(%ebp),%edi
100018ae:	eb 02                	jmp    0x100018b2
100018b0:	8b fd                	mov    %ebp,%edi
100018b2:	8b 4c 24 18          	mov    0x18(%esp),%ecx
100018b6:	8b d1                	mov    %ecx,%edx
100018b8:	c1 e9 02             	shr    $0x2,%ecx
100018bb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
100018bd:	8b ca                	mov    %edx,%ecx
100018bf:	83 e1 03             	and    $0x3,%ecx
100018c2:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
100018c4:	83 7b 18 10          	cmpl   $0x10,0x18(%ebx)
100018c8:	8b c2                	mov    %edx,%eax
100018ca:	89 43 14             	mov    %eax,0x14(%ebx)
100018cd:	5f                   	pop    %edi
100018ce:	72 03                	jb     0x100018d3
100018d0:	8b 6d 00             	mov    0x0(%ebp),%ebp
100018d3:	c6 04 28 00          	movb   $0x0,(%eax,%ebp,1)
100018d7:	5e                   	pop    %esi
100018d8:	5d                   	pop    %ebp
100018d9:	8b c3                	mov    %ebx,%eax
100018db:	5b                   	pop    %ebx
100018dc:	c2 08 00             	ret    $0x8
100018df:	90                   	nop
100018e0:	56                   	push   %esi
100018e1:	8b f1                	mov    %ecx,%esi
100018e3:	57                   	push   %edi
100018e4:	c7 06 3c c1 00 10    	movl   $0x1000c13c,(%esi)
100018ea:	8b 46 2c             	mov    0x2c(%esi),%eax
100018ed:	33 ff                	xor    %edi,%edi
100018ef:	3b c7                	cmp    %edi,%eax
100018f1:	74 09                	je     0x100018fc
100018f3:	50                   	push   %eax
100018f4:	e8 e4 40 00 00       	call   0x100059dd
100018f9:	83 c4 04             	add    $0x4,%esp
100018fc:	89 7e 2c             	mov    %edi,0x2c(%esi)
100018ff:	89 7e 30             	mov    %edi,0x30(%esi)
10001902:	89 7e 34             	mov    %edi,0x34(%esi)
10001905:	8b 46 1c             	mov    0x1c(%esi),%eax
10001908:	3b c7                	cmp    %edi,%eax
1000190a:	74 09                	je     0x10001915
1000190c:	50                   	push   %eax
1000190d:	e8 cb 40 00 00       	call   0x100059dd
10001912:	83 c4 04             	add    $0x4,%esp
10001915:	89 7e 1c             	mov    %edi,0x1c(%esi)
10001918:	89 7e 20             	mov    %edi,0x20(%esi)
1000191b:	89 7e 24             	mov    %edi,0x24(%esi)
1000191e:	5f                   	pop    %edi
1000191f:	5e                   	pop    %esi
10001920:	c3                   	ret
10001921:	90                   	nop
10001922:	90                   	nop
10001923:	90                   	nop
10001924:	90                   	nop
10001925:	90                   	nop
10001926:	90                   	nop
10001927:	90                   	nop
10001928:	90                   	nop
10001929:	90                   	nop
1000192a:	90                   	nop
1000192b:	90                   	nop
1000192c:	90                   	nop
1000192d:	90                   	nop
1000192e:	90                   	nop
1000192f:	90                   	nop
10001930:	6a ff                	push   $0xffffffff
10001932:	68 48 b1 00 10       	push   $0x1000b148
10001937:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
1000193d:	50                   	push   %eax
1000193e:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10001945:	51                   	push   %ecx
10001946:	56                   	push   %esi
10001947:	8b f1                	mov    %ecx,%esi
10001949:	89 74 24 04          	mov    %esi,0x4(%esp)
1000194d:	e8 1c 45 00 00       	call   0x10005e6e
10001952:	33 c0                	xor    %eax,%eax
10001954:	8d 4e 0c             	lea    0xc(%esi),%ecx
10001957:	c7 06 b0 c2 00 10    	movl   $0x1000c2b0,(%esi)
1000195d:	6a ff                	push   $0xffffffff
1000195f:	89 41 14             	mov    %eax,0x14(%ecx)
10001962:	c7 41 18 0f 00 00 00 	movl   $0xf,0x18(%ecx)
10001969:	50                   	push   %eax
1000196a:	89 44 24 18          	mov    %eax,0x18(%esp)
1000196e:	88 41 04             	mov    %al,0x4(%ecx)
10001971:	8b 44 24 20          	mov    0x20(%esp),%eax
10001975:	50                   	push   %eax
10001976:	e8 15 fe ff ff       	call   0x10001790
1000197b:	8b 4c 24 08          	mov    0x8(%esp),%ecx
1000197f:	8b c6                	mov    %esi,%eax
10001981:	5e                   	pop    %esi
10001982:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10001989:	83 c4 10             	add    $0x10,%esp
1000198c:	c2 04 00             	ret    $0x4
1000198f:	90                   	nop
10001990:	56                   	push   %esi
10001991:	8b f1                	mov    %ecx,%esi
10001993:	e8 a8 fc ff ff       	call   0x10001640
10001998:	f6 44 24 08 01       	testb  $0x1,0x8(%esp)
1000199d:	74 09                	je     0x100019a8
1000199f:	56                   	push   %esi
100019a0:	e8 38 40 00 00       	call   0x100059dd
100019a5:	83 c4 04             	add    $0x4,%esp
100019a8:	8b c6                	mov    %esi,%eax
100019aa:	5e                   	pop    %esi
100019ab:	c2 04 00             	ret    $0x4
100019ae:	90                   	nop
100019af:	90                   	nop
100019b0:	8b 54 24 04          	mov    0x4(%esp),%edx
100019b4:	56                   	push   %esi
100019b5:	8b f1                	mov    %ecx,%esi
100019b7:	8b c2                	mov    %edx,%eax
100019b9:	57                   	push   %edi
100019ba:	c7 46 18 0f 00 00 00 	movl   $0xf,0x18(%esi)
100019c1:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
100019c8:	c6 46 04 00          	movb   $0x0,0x4(%esi)
100019cc:	8d 78 01             	lea    0x1(%eax),%edi
100019cf:	90                   	nop
100019d0:	8a 08                	mov    (%eax),%cl
100019d2:	40                   	inc    %eax
100019d3:	84 c9                	test   %cl,%cl
100019d5:	75 f9                	jne    0x100019d0
100019d7:	2b c7                	sub    %edi,%eax
100019d9:	50                   	push   %eax
100019da:	52                   	push   %edx
100019db:	8b ce                	mov    %esi,%ecx
100019dd:	e8 5e fe ff ff       	call   0x10001840
100019e2:	5f                   	pop    %edi
100019e3:	8b c6                	mov    %esi,%eax
100019e5:	5e                   	pop    %esi
100019e6:	c2 04 00             	ret    $0x4
100019e9:	90                   	nop
100019ea:	90                   	nop
100019eb:	90                   	nop
100019ec:	90                   	nop
100019ed:	90                   	nop
100019ee:	90                   	nop
100019ef:	90                   	nop
100019f0:	6a ff                	push   $0xffffffff
100019f2:	68 28 b1 00 10       	push   $0x1000b128
100019f7:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
100019fd:	50                   	push   %eax
100019fe:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10001a05:	83 ec 44             	sub    $0x44,%esp
10001a08:	b8 50 c1 00 10       	mov    $0x1000c150,%eax  ; 0x1000c150='vector<T> too long'
10001a0d:	c7 44 24 18 0f 00 00 	movl   $0xf,0x18(%esp)
10001a14:	00 
10001a15:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
10001a1c:	00 
10001a1d:	c6 44 24 04 00       	movb   $0x0,0x4(%esp)
10001a22:	8d 50 01             	lea    0x1(%eax),%edx
10001a25:	8a 08                	mov    (%eax),%cl
10001a27:	40                   	inc    %eax
10001a28:	84 c9                	test   %cl,%cl
10001a2a:	75 f9                	jne    0x10001a25
10001a2c:	2b c2                	sub    %edx,%eax
10001a2e:	50                   	push   %eax
10001a2f:	68 50 c1 00 10       	push   $0x1000c150  ; 0x1000c150='vector<T> too long'
10001a34:	8d 4c 24 08          	lea    0x8(%esp),%ecx
10001a38:	e8 03 fe ff ff       	call   0x10001840
10001a3d:	8d 44 24 00          	lea    0x0(%esp),%eax
10001a41:	50                   	push   %eax
10001a42:	8d 4c 24 20          	lea    0x20(%esp),%ecx
10001a46:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
10001a4d:	00 
10001a4e:	e8 dd fe ff ff       	call   0x10001930
10001a53:	68 bc d4 00 10       	push   $0x1000d4bc
10001a58:	8d 4c 24 20          	lea    0x20(%esp),%ecx
10001a5c:	51                   	push   %ecx
10001a5d:	c7 44 24 24 bc c2 00 	movl   $0x1000c2bc,0x24(%esp)
10001a64:	10 
10001a65:	e8 78 3f 00 00       	call   0x100059e2
10001a6a:	cc                   	int3
10001a6b:	90                   	nop
10001a6c:	90                   	nop
10001a6d:	90                   	nop
10001a6e:	90                   	nop
10001a6f:	90                   	nop
10001a70:	6a ff                	push   $0xffffffff
10001a72:	68 48 b1 00 10       	push   $0x1000b148
10001a77:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10001a7d:	50                   	push   %eax
10001a7e:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10001a85:	51                   	push   %ecx
10001a86:	56                   	push   %esi
10001a87:	57                   	push   %edi
10001a88:	8b 7c 24 1c          	mov    0x1c(%esp),%edi
10001a8c:	8b f1                	mov    %ecx,%esi
10001a8e:	57                   	push   %edi
10001a8f:	89 74 24 0c          	mov    %esi,0xc(%esp)
10001a93:	e8 24 44 00 00       	call   0x10005ebc
10001a98:	33 c0                	xor    %eax,%eax
10001a9a:	6a ff                	push   $0xffffffff
10001a9c:	8d 4e 0c             	lea    0xc(%esi),%ecx
10001a9f:	c7 06 b0 c2 00 10    	movl   $0x1000c2b0,(%esi)
10001aa5:	50                   	push   %eax
10001aa6:	83 c7 0c             	add    $0xc,%edi
10001aa9:	c7 41 18 0f 00 00 00 	movl   $0xf,0x18(%ecx)
10001ab0:	89 41 14             	mov    %eax,0x14(%ecx)
10001ab3:	57                   	push   %edi
10001ab4:	89 44 24 20          	mov    %eax,0x20(%esp)
10001ab8:	88 41 04             	mov    %al,0x4(%ecx)
10001abb:	e8 d0 fc ff ff       	call   0x10001790
10001ac0:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
10001ac4:	5f                   	pop    %edi
10001ac5:	8b c6                	mov    %esi,%eax
10001ac7:	5e                   	pop    %esi
10001ac8:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10001acf:	83 c4 10             	add    $0x10,%esp
10001ad2:	c2 04 00             	ret    $0x4
10001ad5:	90                   	nop
10001ad6:	90                   	nop
10001ad7:	90                   	nop
10001ad8:	90                   	nop
10001ad9:	90                   	nop
10001ada:	90                   	nop
10001adb:	90                   	nop
10001adc:	90                   	nop
10001add:	90                   	nop
10001ade:	90                   	nop
10001adf:	90                   	nop
10001ae0:	8b 44 24 04          	mov    0x4(%esp),%eax
10001ae4:	56                   	push   %esi
10001ae5:	50                   	push   %eax
10001ae6:	8b f1                	mov    %ecx,%esi
10001ae8:	e8 83 ff ff ff       	call   0x10001a70
10001aed:	c7 06 bc c2 00 10    	movl   $0x1000c2bc,(%esi)
10001af3:	8b c6                	mov    %esi,%eax
10001af5:	5e                   	pop    %esi
10001af6:	c2 04 00             	ret    $0x4
10001af9:	90                   	nop
10001afa:	90                   	nop
10001afb:	90                   	nop
10001afc:	90                   	nop
10001afd:	90                   	nop
10001afe:	90                   	nop
10001aff:	90                   	nop
10001b00:	56                   	push   %esi
10001b01:	8b f1                	mov    %ecx,%esi
10001b03:	85 f6                	test   %esi,%esi
10001b05:	74 0e                	je     0x10001b15
10001b07:	e8 d4 fd ff ff       	call   0x100018e0
10001b0c:	56                   	push   %esi
10001b0d:	e8 cb 3e 00 00       	call   0x100059dd
10001b12:	83 c4 04             	add    $0x4,%esp
10001b15:	5e                   	pop    %esi
10001b16:	c3                   	ret
10001b17:	90                   	nop
10001b18:	90                   	nop
10001b19:	90                   	nop
10001b1a:	90                   	nop
10001b1b:	90                   	nop
10001b1c:	90                   	nop
10001b1d:	90                   	nop
10001b1e:	90                   	nop
10001b1f:	90                   	nop
10001b20:	55                   	push   %ebp
10001b21:	8b ec                	mov    %esp,%ebp
10001b23:	6a ff                	push   $0xffffffff
10001b25:	68 60 b1 00 10       	push   $0x1000b160
10001b2a:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10001b30:	50                   	push   %eax
10001b31:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10001b38:	83 ec 0c             	sub    $0xc,%esp
10001b3b:	8b 45 10             	mov    0x10(%ebp),%eax
10001b3e:	53                   	push   %ebx
10001b3f:	56                   	push   %esi
10001b40:	8b f1                	mov    %ecx,%esi
10001b42:	8b 08                	mov    (%eax),%ecx
10001b44:	57                   	push   %edi
10001b45:	8b 7e 04             	mov    0x4(%esi),%edi
10001b48:	85 ff                	test   %edi,%edi
10001b4a:	89 65 f0             	mov    %esp,-0x10(%ebp)
10001b4d:	89 4d 10             	mov    %ecx,0x10(%ebp)
10001b50:	75 04                	jne    0x10001b56
10001b52:	33 c0                	xor    %eax,%eax
10001b54:	eb 08                	jmp    0x10001b5e
10001b56:	8b 46 0c             	mov    0xc(%esi),%eax
10001b59:	2b c7                	sub    %edi,%eax
10001b5b:	c1 f8 02             	sar    $0x2,%eax
10001b5e:	8b 55 0c             	mov    0xc(%ebp),%edx
10001b61:	85 d2                	test   %edx,%edx
10001b63:	0f 84 41 02 00 00    	je     0x10001daa
10001b69:	85 ff                	test   %edi,%edi
10001b6b:	75 04                	jne    0x10001b71
10001b6d:	33 c9                	xor    %ecx,%ecx
10001b6f:	eb 08                	jmp    0x10001b79
10001b71:	8b 4e 08             	mov    0x8(%esi),%ecx
10001b74:	2b cf                	sub    %edi,%ecx
10001b76:	c1 f9 02             	sar    $0x2,%ecx
10001b79:	bb ff ff ff 3f       	mov    $0x3fffffff,%ebx
10001b7e:	2b d9                	sub    %ecx,%ebx
10001b80:	3b da                	cmp    %edx,%ebx
10001b82:	73 1a                	jae    0x10001b9e
10001b84:	8b ce                	mov    %esi,%ecx
10001b86:	e8 65 fe ff ff       	call   0x100019f0
10001b8b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
10001b8e:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10001b95:	5f                   	pop    %edi
10001b96:	5e                   	pop    %esi
10001b97:	5b                   	pop    %ebx
10001b98:	8b e5                	mov    %ebp,%esp
10001b9a:	5d                   	pop    %ebp
10001b9b:	c2 0c 00             	ret    $0xc
10001b9e:	85 ff                	test   %edi,%edi
10001ba0:	75 04                	jne    0x10001ba6
10001ba2:	33 c9                	xor    %ecx,%ecx
10001ba4:	eb 08                	jmp    0x10001bae
10001ba6:	8b 4e 08             	mov    0x8(%esi),%ecx
10001ba9:	2b cf                	sub    %edi,%ecx
10001bab:	c1 f9 02             	sar    $0x2,%ecx
10001bae:	03 ca                	add    %edx,%ecx
10001bb0:	3b c1                	cmp    %ecx,%eax
10001bb2:	0f 83 10 01 00 00    	jae    0x10001cc8
10001bb8:	8b c8                	mov    %eax,%ecx
10001bba:	d1 e9                	shr    $1,%ecx
10001bbc:	bb ff ff ff 3f       	mov    $0x3fffffff,%ebx
10001bc1:	2b d9                	sub    %ecx,%ebx
10001bc3:	3b d8                	cmp    %eax,%ebx
10001bc5:	73 04                	jae    0x10001bcb
10001bc7:	33 c0                	xor    %eax,%eax
10001bc9:	eb 02                	jmp    0x10001bcd
10001bcb:	03 c1                	add    %ecx,%eax
10001bcd:	85 ff                	test   %edi,%edi
10001bcf:	75 04                	jne    0x10001bd5
10001bd1:	33 c9                	xor    %ecx,%ecx
10001bd3:	eb 08                	jmp    0x10001bdd
10001bd5:	8b 4e 08             	mov    0x8(%esi),%ecx
10001bd8:	2b cf                	sub    %edi,%ecx
10001bda:	c1 f9 02             	sar    $0x2,%ecx
10001bdd:	03 ca                	add    %edx,%ecx
10001bdf:	3b c1                	cmp    %ecx,%eax
10001be1:	73 12                	jae    0x10001bf5
10001be3:	85 ff                	test   %edi,%edi
10001be5:	75 04                	jne    0x10001beb
10001be7:	33 c0                	xor    %eax,%eax
10001be9:	eb 08                	jmp    0x10001bf3
10001beb:	8b 46 08             	mov    0x8(%esi),%eax
10001bee:	2b c7                	sub    %edi,%eax
10001bf0:	c1 f8 02             	sar    $0x2,%eax
10001bf3:	03 c2                	add    %edx,%eax
10001bf5:	c1 e0 02             	shl    $0x2,%eax
10001bf8:	50                   	push   %eax
10001bf9:	89 45 ec             	mov    %eax,-0x14(%ebp)
10001bfc:	e8 0f 39 00 00       	call   0x10005510
10001c01:	8b 55 0c             	mov    0xc(%ebp),%edx
10001c04:	83 c4 04             	add    $0x4,%esp
10001c07:	52                   	push   %edx
10001c08:	8b 55 08             	mov    0x8(%ebp),%edx
10001c0b:	8b d8                	mov    %eax,%ebx
10001c0d:	8b 46 04             	mov    0x4(%esi),%eax
10001c10:	56                   	push   %esi
10001c11:	53                   	push   %ebx
10001c12:	51                   	push   %ecx
10001c13:	8b cc                	mov    %esp,%ecx
10001c15:	89 11                	mov    %edx,(%ecx)
10001c17:	51                   	push   %ecx
10001c18:	8b cc                	mov    %esp,%ecx
10001c1a:	89 5d e8             	mov    %ebx,-0x18(%ebp)
10001c1d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
10001c24:	89 01                	mov    %eax,(%ecx)
10001c26:	e8 d5 05 00 00       	call   0x10002200
10001c2b:	8b 55 0c             	mov    0xc(%ebp),%edx
10001c2e:	83 c4 14             	add    $0x14,%esp
10001c31:	8b f8                	mov    %eax,%edi
10001c33:	8b 45 0c             	mov    0xc(%ebp),%eax
10001c36:	50                   	push   %eax
10001c37:	56                   	push   %esi
10001c38:	8d 4d 10             	lea    0x10(%ebp),%ecx
10001c3b:	51                   	push   %ecx
10001c3c:	52                   	push   %edx
10001c3d:	57                   	push   %edi
10001c3e:	e8 cd f8 ff ff       	call   0x10001510
10001c43:	8b 55 0c             	mov    0xc(%ebp),%edx
10001c46:	8b 4e 08             	mov    0x8(%esi),%ecx
10001c49:	8b 45 0c             	mov    0xc(%ebp),%eax
10001c4c:	83 c4 14             	add    $0x14,%esp
10001c4f:	52                   	push   %edx
10001c50:	8d 04 87             	lea    (%edi,%eax,4),%eax
10001c53:	56                   	push   %esi
10001c54:	50                   	push   %eax
10001c55:	51                   	push   %ecx
10001c56:	8b c4                	mov    %esp,%eax
10001c58:	89 08                	mov    %ecx,(%eax)
10001c5a:	51                   	push   %ecx
10001c5b:	8b 4d 08             	mov    0x8(%ebp),%ecx
10001c5e:	8b c4                	mov    %esp,%eax
10001c60:	89 08                	mov    %ecx,(%eax)
10001c62:	e8 99 05 00 00       	call   0x10002200
10001c67:	8b 4e 04             	mov    0x4(%esi),%ecx
10001c6a:	83 c4 14             	add    $0x14,%esp
10001c6d:	85 c9                	test   %ecx,%ecx
10001c6f:	75 04                	jne    0x10001c75
10001c71:	33 c0                	xor    %eax,%eax
10001c73:	eb 08                	jmp    0x10001c7d
10001c75:	8b 46 08             	mov    0x8(%esi),%eax
10001c78:	2b c1                	sub    %ecx,%eax
10001c7a:	c1 f8 02             	sar    $0x2,%eax
10001c7d:	8b 7d 0c             	mov    0xc(%ebp),%edi
10001c80:	03 f8                	add    %eax,%edi
10001c82:	85 c9                	test   %ecx,%ecx
10001c84:	74 09                	je     0x10001c8f
10001c86:	51                   	push   %ecx
10001c87:	e8 51 3d 00 00       	call   0x100059dd
10001c8c:	83 c4 04             	add    $0x4,%esp
10001c8f:	8b 55 ec             	mov    -0x14(%ebp),%edx
10001c92:	03 d3                	add    %ebx,%edx
10001c94:	8d 04 bb             	lea    (%ebx,%edi,4),%eax
10001c97:	89 56 0c             	mov    %edx,0xc(%esi)
10001c9a:	89 46 08             	mov    %eax,0x8(%esi)
10001c9d:	89 5e 04             	mov    %ebx,0x4(%esi)
10001ca0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
10001ca3:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10001caa:	5f                   	pop    %edi
10001cab:	5e                   	pop    %esi
10001cac:	5b                   	pop    %ebx
10001cad:	8b e5                	mov    %ebp,%esp
10001caf:	5d                   	pop    %ebp
10001cb0:	c2 0c 00             	ret    $0xc
10001cb3:	8b 4d e8             	mov    -0x18(%ebp),%ecx
10001cb6:	51                   	push   %ecx
10001cb7:	e8 21 3d 00 00       	call   0x100059dd
10001cbc:	83 c4 04             	add    $0x4,%esp
10001cbf:	6a 00                	push   $0x0
10001cc1:	6a 00                	push   $0x0
10001cc3:	e8 1a 3d 00 00       	call   0x100059e2
10001cc8:	8b 5e 08             	mov    0x8(%esi),%ebx
10001ccb:	8b 7d 08             	mov    0x8(%ebp),%edi
10001cce:	8b c3                	mov    %ebx,%eax
10001cd0:	2b c7                	sub    %edi,%eax
10001cd2:	c1 f8 02             	sar    $0x2,%eax
10001cd5:	3b c2                	cmp    %edx,%eax
10001cd7:	73 61                	jae    0x10001d3a
10001cd9:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
10001ce0:	89 45 08             	mov    %eax,0x8(%ebp)
10001ce3:	03 c7                	add    %edi,%eax
10001ce5:	50                   	push   %eax
10001ce6:	51                   	push   %ecx
10001ce7:	8b c4                	mov    %esp,%eax
10001ce9:	89 65 e8             	mov    %esp,-0x18(%ebp)
10001cec:	51                   	push   %ecx
10001ced:	89 18                	mov    %ebx,(%eax)
10001cef:	8b c4                	mov    %esp,%eax
10001cf1:	8b ce                	mov    %esi,%ecx
10001cf3:	89 65 e8             	mov    %esp,-0x18(%ebp)
10001cf6:	89 38                	mov    %edi,(%eax)
10001cf8:	e8 e3 18 00 00       	call   0x100035e0
10001cfd:	8b 4e 08             	mov    0x8(%esi),%ecx
10001d00:	8b 45 0c             	mov    0xc(%ebp),%eax
10001d03:	8d 55 10             	lea    0x10(%ebp),%edx
10001d06:	52                   	push   %edx
10001d07:	8b d1                	mov    %ecx,%edx
10001d09:	2b d7                	sub    %edi,%edx
10001d0b:	c1 fa 02             	sar    $0x2,%edx
10001d0e:	2b c2                	sub    %edx,%eax
10001d10:	50                   	push   %eax
10001d11:	51                   	push   %ecx
10001d12:	8b ce                	mov    %esi,%ecx
10001d14:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%ebp)
10001d1b:	e8 f0 19 00 00       	call   0x10003710
10001d20:	8b 5e 08             	mov    0x8(%esi),%ebx
10001d23:	8b 4d 08             	mov    0x8(%ebp),%ecx
10001d26:	03 d9                	add    %ecx,%ebx
10001d28:	8d 45 10             	lea    0x10(%ebp),%eax
10001d2b:	89 5e 08             	mov    %ebx,0x8(%esi)
10001d2e:	50                   	push   %eax
10001d2f:	8b f3                	mov    %ebx,%esi
10001d31:	51                   	push   %ecx
10001d32:	8b c4                	mov    %esp,%eax
10001d34:	2b f1                	sub    %ecx,%esi
10001d36:	89 30                	mov    %esi,(%eax)
10001d38:	eb 5d                	jmp    0x10001d97
10001d3a:	53                   	push   %ebx
10001d3b:	51                   	push   %ecx
10001d3c:	8b c4                	mov    %esp,%eax
10001d3e:	89 18                	mov    %ebx,(%eax)
10001d40:	89 65 0c             	mov    %esp,0xc(%ebp)
10001d43:	51                   	push   %ecx
10001d44:	c1 e2 02             	shl    $0x2,%edx
10001d47:	8b cc                	mov    %esp,%ecx
10001d49:	8b c3                	mov    %ebx,%eax
10001d4b:	2b c2                	sub    %edx,%eax
10001d4d:	89 01                	mov    %eax,(%ecx)
10001d4f:	89 65 0c             	mov    %esp,0xc(%ebp)
10001d52:	8b ce                	mov    %esi,%ecx
10001d54:	89 55 08             	mov    %edx,0x8(%ebp)
10001d57:	89 45 0c             	mov    %eax,0xc(%ebp)
10001d5a:	e8 81 18 00 00       	call   0x100035e0
10001d5f:	51                   	push   %ecx
10001d60:	89 46 08             	mov    %eax,0x8(%esi)
10001d63:	8b c4                	mov    %esp,%eax
10001d65:	89 65 e8             	mov    %esp,-0x18(%ebp)
10001d68:	51                   	push   %ecx
10001d69:	8b 4d 0c             	mov    0xc(%ebp),%ecx
10001d6c:	89 18                	mov    %ebx,(%eax)
10001d6e:	8b c4                	mov    %esp,%eax
10001d70:	89 65 e8             	mov    %esp,-0x18(%ebp)
10001d73:	51                   	push   %ecx
10001d74:	89 08                	mov    %ecx,(%eax)
10001d76:	8b c4                	mov    %esp,%eax
10001d78:	8d 55 0c             	lea    0xc(%ebp),%edx
10001d7b:	89 65 0c             	mov    %esp,0xc(%ebp)
10001d7e:	52                   	push   %edx
10001d7f:	89 38                	mov    %edi,(%eax)
10001d81:	e8 0a 05 00 00       	call   0x10002290
10001d86:	83 c4 10             	add    $0x10,%esp
10001d89:	8d 45 10             	lea    0x10(%ebp),%eax
10001d8c:	50                   	push   %eax
10001d8d:	51                   	push   %ecx
10001d8e:	8b 4d 08             	mov    0x8(%ebp),%ecx
10001d91:	8b c4                	mov    %esp,%eax
10001d93:	03 cf                	add    %edi,%ecx
10001d95:	89 08                	mov    %ecx,(%eax)
10001d97:	89 65 0c             	mov    %esp,0xc(%ebp)
10001d9a:	51                   	push   %ecx
10001d9b:	8b c4                	mov    %esp,%eax
10001d9d:	89 38                	mov    %edi,(%eax)
10001d9f:	89 65 0c             	mov    %esp,0xc(%ebp)
10001da2:	e8 29 f6 ff ff       	call   0x100013d0
10001da7:	83 c4 0c             	add    $0xc,%esp
10001daa:	8b 4d f4             	mov    -0xc(%ebp),%ecx
10001dad:	5f                   	pop    %edi
10001dae:	5e                   	pop    %esi
10001daf:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10001db6:	5b                   	pop    %ebx
10001db7:	8b e5                	mov    %ebp,%esp
10001db9:	5d                   	pop    %ebp
10001dba:	c2 0c 00             	ret    $0xc
10001dbd:	90                   	nop
10001dbe:	90                   	nop
10001dbf:	90                   	nop
10001dc0:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10001dc6:	6a ff                	push   $0xffffffff
10001dc8:	68 7b b1 00 10       	push   $0x1000b17b
10001dcd:	50                   	push   %eax
10001dce:	8b c1                	mov    %ecx,%eax
10001dd0:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10001dd7:	33 c9                	xor    %ecx,%ecx
10001dd9:	89 48 04             	mov    %ecx,0x4(%eax)
10001ddc:	89 48 0c             	mov    %ecx,0xc(%eax)
10001ddf:	c7 00 3c c1 00 10    	movl   $0x1000c13c,(%eax)
10001de5:	89 48 10             	mov    %ecx,0x10(%eax)
10001de8:	89 48 1c             	mov    %ecx,0x1c(%eax)
10001deb:	89 48 20             	mov    %ecx,0x20(%eax)
10001dee:	89 48 24             	mov    %ecx,0x24(%eax)
10001df1:	89 48 2c             	mov    %ecx,0x2c(%eax)
10001df4:	89 48 30             	mov    %ecx,0x30(%eax)
10001df7:	89 48 34             	mov    %ecx,0x34(%eax)
10001dfa:	8b 4c 24 00          	mov    0x0(%esp),%ecx
10001dfe:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10001e05:	83 c4 0c             	add    $0xc,%esp
10001e08:	c3                   	ret
10001e09:	90                   	nop
10001e0a:	90                   	nop
10001e0b:	90                   	nop
10001e0c:	90                   	nop
10001e0d:	90                   	nop
10001e0e:	90                   	nop
10001e0f:	90                   	nop
10001e10:	56                   	push   %esi
10001e11:	8b f1                	mov    %ecx,%esi
10001e13:	8b 56 04             	mov    0x4(%esi),%edx
10001e16:	85 d2                	test   %edx,%edx
10001e18:	57                   	push   %edi
10001e19:	75 04                	jne    0x10001e1f
10001e1b:	33 c9                	xor    %ecx,%ecx
10001e1d:	eb 08                	jmp    0x10001e27
10001e1f:	8b 4e 08             	mov    0x8(%esi),%ecx
10001e22:	2b ca                	sub    %edx,%ecx
10001e24:	c1 f9 02             	sar    $0x2,%ecx
10001e27:	85 d2                	test   %edx,%edx
10001e29:	74 30                	je     0x10001e5b
10001e2b:	8b 46 0c             	mov    0xc(%esi),%eax
10001e2e:	2b c2                	sub    %edx,%eax
10001e30:	c1 f8 02             	sar    $0x2,%eax
10001e33:	3b c8                	cmp    %eax,%ecx
10001e35:	73 24                	jae    0x10001e5b
10001e37:	8b 44 24 0c          	mov    0xc(%esp),%eax
10001e3b:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
10001e3f:	8b 7e 08             	mov    0x8(%esi),%edi
10001e42:	50                   	push   %eax
10001e43:	56                   	push   %esi
10001e44:	51                   	push   %ecx
10001e45:	6a 01                	push   $0x1
10001e47:	57                   	push   %edi
10001e48:	e8 c3 f6 ff ff       	call   0x10001510
10001e4d:	83 c4 14             	add    $0x14,%esp
10001e50:	83 c7 04             	add    $0x4,%edi
10001e53:	89 7e 08             	mov    %edi,0x8(%esi)
10001e56:	5f                   	pop    %edi
10001e57:	5e                   	pop    %esi
10001e58:	c2 04 00             	ret    $0x4
10001e5b:	8b 54 24 0c          	mov    0xc(%esp),%edx
10001e5f:	8b 46 08             	mov    0x8(%esi),%eax
10001e62:	52                   	push   %edx
10001e63:	6a 01                	push   $0x1
10001e65:	51                   	push   %ecx
10001e66:	8b cc                	mov    %esp,%ecx
10001e68:	89 01                	mov    %eax,(%ecx)
10001e6a:	8b ce                	mov    %esi,%ecx
10001e6c:	e8 af fc ff ff       	call   0x10001b20
10001e71:	5f                   	pop    %edi
10001e72:	5e                   	pop    %esi
10001e73:	c2 04 00             	ret    $0x4
10001e76:	90                   	nop
10001e77:	90                   	nop
10001e78:	90                   	nop
10001e79:	90                   	nop
10001e7a:	90                   	nop
10001e7b:	90                   	nop
10001e7c:	90                   	nop
10001e7d:	90                   	nop
10001e7e:	90                   	nop
10001e7f:	90                   	nop
10001e80:	6a ff                	push   $0xffffffff
10001e82:	68 9b b1 00 10       	push   $0x1000b19b
10001e87:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10001e8d:	50                   	push   %eax
10001e8e:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10001e95:	51                   	push   %ecx
10001e96:	6a 38                	push   $0x38
10001e98:	e8 73 36 00 00       	call   0x10005510
10001e9d:	83 c4 04             	add    $0x4,%esp
10001ea0:	89 44 24 00          	mov    %eax,0x0(%esp)
10001ea4:	85 c0                	test   %eax,%eax
10001ea6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
10001ead:	00 
10001eae:	74 16                	je     0x10001ec6
10001eb0:	8b c8                	mov    %eax,%ecx
10001eb2:	e8 09 ff ff ff       	call   0x10001dc0
10001eb7:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10001ebb:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10001ec2:	83 c4 10             	add    $0x10,%esp
10001ec5:	c3                   	ret
10001ec6:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10001eca:	33 c0                	xor    %eax,%eax
10001ecc:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10001ed3:	83 c4 10             	add    $0x10,%esp
10001ed6:	c3                   	ret
10001ed7:	90                   	nop
10001ed8:	90                   	nop
10001ed9:	90                   	nop
10001eda:	90                   	nop
10001edb:	90                   	nop
10001edc:	90                   	nop
10001edd:	90                   	nop
10001ede:	90                   	nop
10001edf:	90                   	nop
10001ee0:	8d 44 24 04          	lea    0x4(%esp),%eax
10001ee4:	50                   	push   %eax
10001ee5:	83 c1 18             	add    $0x18,%ecx
10001ee8:	e8 23 ff ff ff       	call   0x10001e10
10001eed:	c2 04 00             	ret    $0x4
10001ef0:	8b 41 30             	mov    0x30(%ecx),%eax
10001ef3:	8b 51 2c             	mov    0x2c(%ecx),%edx
10001ef6:	3b d0                	cmp    %eax,%edx
10001ef8:	56                   	push   %esi
10001ef9:	57                   	push   %edi
10001efa:	74 46                	je     0x10001f42
10001efc:	8b 74 24 0c          	mov    0xc(%esp),%esi
10001f00:	39 32                	cmp    %esi,(%edx)
10001f02:	74 07                	je     0x10001f0b
10001f04:	83 c2 04             	add    $0x4,%edx
10001f07:	3b d0                	cmp    %eax,%edx
10001f09:	75 f5                	jne    0x10001f00
10001f0b:	3b d0                	cmp    %eax,%edx
10001f0d:	74 33                	je     0x10001f42
10001f0f:	8b 71 30             	mov    0x30(%ecx),%esi
10001f12:	8d 42 04             	lea    0x4(%edx),%eax
10001f15:	3b c6                	cmp    %esi,%eax
10001f17:	74 13                	je     0x10001f2c
10001f19:	2b d0                	sub    %eax,%edx
10001f1b:	eb 03                	jmp    0x10001f20
10001f1d:	8d 49 00             	lea    0x0(%ecx),%ecx
10001f20:	8b 38                	mov    (%eax),%edi
10001f22:	89 3c 02             	mov    %edi,(%edx,%eax,1)
10001f25:	83 c0 04             	add    $0x4,%eax
10001f28:	3b c6                	cmp    %esi,%eax
10001f2a:	75 f4                	jne    0x10001f20
10001f2c:	8b 71 30             	mov    0x30(%ecx),%esi
10001f2f:	83 c6 fc             	add    $0xfffffffc,%esi
10001f32:	8d 44 24 0c          	lea    0xc(%esp),%eax
10001f36:	89 71 30             	mov    %esi,0x30(%ecx)
10001f39:	50                   	push   %eax
10001f3a:	83 c1 18             	add    $0x18,%ecx
10001f3d:	e8 ce fe ff ff       	call   0x10001e10
10001f42:	5f                   	pop    %edi
10001f43:	5e                   	pop    %esi
10001f44:	c2 04 00             	ret    $0x4
10001f47:	90                   	nop
10001f48:	90                   	nop
10001f49:	90                   	nop
10001f4a:	90                   	nop
10001f4b:	90                   	nop
10001f4c:	90                   	nop
10001f4d:	90                   	nop
10001f4e:	90                   	nop
10001f4f:	90                   	nop
10001f50:	83 ec 08             	sub    $0x8,%esp
10001f53:	53                   	push   %ebx
10001f54:	56                   	push   %esi
10001f55:	57                   	push   %edi
10001f56:	8b f9                	mov    %ecx,%edi
10001f58:	8b 4f 1c             	mov    0x1c(%edi),%ecx
10001f5b:	85 c9                	test   %ecx,%ecx
10001f5d:	8d 5f 18             	lea    0x18(%edi),%ebx
10001f60:	74 0c                	je     0x10001f6e
10001f62:	8b 43 08             	mov    0x8(%ebx),%eax
10001f65:	2b c1                	sub    %ecx,%eax
10001f67:	c1 f8 02             	sar    $0x2,%eax
10001f6a:	85 c0                	test   %eax,%eax
10001f6c:	75 0a                	jne    0x10001f78
10001f6e:	83 c8 ff             	or     $0xffffffff,%eax
10001f71:	5f                   	pop    %edi
10001f72:	5e                   	pop    %esi
10001f73:	5b                   	pop    %ebx
10001f74:	83 c4 08             	add    $0x8,%esp
10001f77:	c3                   	ret
10001f78:	e8 1a 40 00 00       	call   0x10005f97
10001f7d:	8b 4b 04             	mov    0x4(%ebx),%ecx
10001f80:	85 c9                	test   %ecx,%ecx
10001f82:	75 04                	jne    0x10001f88
10001f84:	33 f6                	xor    %esi,%esi
10001f86:	eb 08                	jmp    0x10001f90
10001f88:	8b 73 08             	mov    0x8(%ebx),%esi
10001f8b:	2b f1                	sub    %ecx,%esi
10001f8d:	c1 fe 02             	sar    $0x2,%esi
10001f90:	99                   	cltd
10001f91:	f7 fe                	idiv   %esi
10001f93:	8b 4f 1c             	mov    0x1c(%edi),%ecx
10001f96:	8b 77 20             	mov    0x20(%edi),%esi
10001f99:	3b ce                	cmp    %esi,%ecx
10001f9b:	8b 04 91             	mov    (%ecx,%edx,4),%eax
10001f9e:	89 44 24 0c          	mov    %eax,0xc(%esp)
10001fa2:	74 31                	je     0x10001fd5
10001fa4:	39 01                	cmp    %eax,(%ecx)
10001fa6:	74 07                	je     0x10001faf
10001fa8:	83 c1 04             	add    $0x4,%ecx
10001fab:	3b ce                	cmp    %esi,%ecx
10001fad:	75 f5                	jne    0x10001fa4
10001faf:	3b ce                	cmp    %esi,%ecx
10001fb1:	74 22                	je     0x10001fd5
10001fb3:	51                   	push   %ecx
10001fb4:	8b c4                	mov    %esp,%eax
10001fb6:	89 08                	mov    %ecx,(%eax)
10001fb8:	8d 44 24 14          	lea    0x14(%esp),%eax
10001fbc:	50                   	push   %eax
10001fbd:	8b cb                	mov    %ebx,%ecx
10001fbf:	e8 8c f7 ff ff       	call   0x10001750
10001fc4:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
10001fc8:	51                   	push   %ecx
10001fc9:	8d 4f 28             	lea    0x28(%edi),%ecx
10001fcc:	e8 3f fe ff ff       	call   0x10001e10
10001fd1:	8b 44 24 0c          	mov    0xc(%esp),%eax
10001fd5:	5f                   	pop    %edi
10001fd6:	5e                   	pop    %esi
10001fd7:	5b                   	pop    %ebx
10001fd8:	83 c4 08             	add    $0x8,%esp
10001fdb:	c3                   	ret
10001fdc:	90                   	nop
10001fdd:	90                   	nop
10001fde:	90                   	nop
10001fdf:	90                   	nop
10001fe0:	56                   	push   %esi
10001fe1:	8b f1                	mov    %ecx,%esi
10001fe3:	8b 4e 2c             	mov    0x2c(%esi),%ecx
10001fe6:	85 c9                	test   %ecx,%ecx
10001fe8:	74 1a                	je     0x10002004
10001fea:	8b 46 30             	mov    0x30(%esi),%eax
10001fed:	2b c1                	sub    %ecx,%eax
10001fef:	c1 f8 02             	sar    $0x2,%eax
10001ff2:	85 c0                	test   %eax,%eax
10001ff4:	74 0e                	je     0x10002004
10001ff6:	8b c1                	mov    %ecx,%eax
10001ff8:	8b 00                	mov    (%eax),%eax
10001ffa:	50                   	push   %eax
10001ffb:	8b ce                	mov    %esi,%ecx
10001ffd:	e8 ee fe ff ff       	call   0x10001ef0
10002002:	eb df                	jmp    0x10001fe3
10002004:	6a 00                	push   $0x0
10002006:	e8 ae 3f 00 00       	call   0x10005fb9
1000200b:	50                   	push   %eax
1000200c:	e8 79 3f 00 00       	call   0x10005f8a
10002011:	83 c4 08             	add    $0x8,%esp
10002014:	5e                   	pop    %esi
10002015:	c3                   	ret
10002016:	90                   	nop
10002017:	90                   	nop
10002018:	90                   	nop
10002019:	90                   	nop
1000201a:	90                   	nop
1000201b:	90                   	nop
1000201c:	90                   	nop
1000201d:	90                   	nop
1000201e:	90                   	nop
1000201f:	90                   	nop
10002020:	8b 44 24 04          	mov    0x4(%esp),%eax
10002024:	3d f4 d5 ff 7b       	cmp    $0x7bffd5f4,%eax
10002029:	56                   	push   %esi
1000202a:	57                   	push   %edi
1000202b:	8b f9                	mov    %ecx,%edi
1000202d:	0f 87 1f 01 00 00    	ja     0x10002152
10002033:	0f 84 0b 01 00 00    	je     0x10002144
10002039:	3d 55 56 5b 02       	cmp    $0x25b5655,%eax
1000203e:	0f 84 da 00 00 00    	je     0x1000211e
10002044:	3d 55 b1 70 56       	cmp    $0x5670b155,%eax
10002049:	74 6f                	je     0x100020ba
1000204b:	3d c2 fe bb 58       	cmp    $0x58bbfec2,%eax
10002050:	0f 85 0a 01 00 00    	jne    0x10002160
10002056:	8b 74 24 10          	mov    0x10(%esp),%esi
1000205a:	8b 46 04             	mov    0x4(%esi),%eax
1000205d:	80 38 01             	cmpb   $0x1,(%eax)
10002060:	0f 85 5a 01 00 00    	jne    0x100021c0
10002066:	6a 00                	push   $0x0
10002068:	8b ce                	mov    %esi,%ecx
1000206a:	e8 91 f2 ff ff       	call   0x10001300
1000206f:	83 f8 21             	cmp    $0x21,%eax
10002072:	74 2e                	je     0x100020a2
10002074:	6a 00                	push   $0x0
10002076:	8b ce                	mov    %esi,%ecx
10002078:	e8 83 f2 ff ff       	call   0x10001300
1000207d:	83 f8 11             	cmp    $0x11,%eax
10002080:	74 20                	je     0x100020a2
10002082:	6a 00                	push   $0x0
10002084:	8b ce                	mov    %esi,%ecx
10002086:	e8 75 f2 ff ff       	call   0x10001300
1000208b:	83 f8 01             	cmp    $0x1,%eax
1000208e:	74 12                	je     0x100020a2
10002090:	6a 00                	push   $0x0
10002092:	8b ce                	mov    %esi,%ecx
10002094:	e8 67 f2 ff ff       	call   0x10001300
10002099:	83 f8 31             	cmp    $0x31,%eax
1000209c:	0f 85 1e 01 00 00    	jne    0x100021c0
100020a2:	6a 00                	push   $0x0
100020a4:	8b ce                	mov    %esi,%ecx
100020a6:	e8 75 f2 ff ff       	call   0x10001320
100020ab:	50                   	push   %eax
100020ac:	8b cf                	mov    %edi,%ecx
100020ae:	e8 3d fe ff ff       	call   0x10001ef0
100020b3:	5f                   	pop    %edi
100020b4:	33 c0                	xor    %eax,%eax
100020b6:	5e                   	pop    %esi
100020b7:	c2 08 00             	ret    $0x8
100020ba:	8b 74 24 10          	mov    0x10(%esp),%esi
100020be:	8b 4e 04             	mov    0x4(%esi),%ecx
100020c1:	80 39 01             	cmpb   $0x1,(%ecx)
100020c4:	0f 85 f6 00 00 00    	jne    0x100021c0
100020ca:	6a 00                	push   $0x0
100020cc:	8b ce                	mov    %esi,%ecx
100020ce:	e8 2d f2 ff ff       	call   0x10001300
100020d3:	83 f8 21             	cmp    $0x21,%eax
100020d6:	74 2e                	je     0x10002106
100020d8:	6a 00                	push   $0x0
100020da:	8b ce                	mov    %esi,%ecx
100020dc:	e8 1f f2 ff ff       	call   0x10001300
100020e1:	83 f8 11             	cmp    $0x11,%eax
100020e4:	74 20                	je     0x10002106
100020e6:	6a 00                	push   $0x0
100020e8:	8b ce                	mov    %esi,%ecx
100020ea:	e8 11 f2 ff ff       	call   0x10001300
100020ef:	83 f8 01             	cmp    $0x1,%eax
100020f2:	74 12                	je     0x10002106
100020f4:	6a 00                	push   $0x0
100020f6:	8b ce                	mov    %esi,%ecx
100020f8:	e8 03 f2 ff ff       	call   0x10001300
100020fd:	83 f8 31             	cmp    $0x31,%eax
10002100:	0f 85 ba 00 00 00    	jne    0x100021c0
10002106:	6a 00                	push   $0x0
10002108:	8b ce                	mov    %esi,%ecx
1000210a:	e8 11 f2 ff ff       	call   0x10001320
1000210f:	50                   	push   %eax
10002110:	8b cf                	mov    %edi,%ecx
10002112:	e8 c9 fd ff ff       	call   0x10001ee0
10002117:	5f                   	pop    %edi
10002118:	33 c0                	xor    %eax,%eax
1000211a:	5e                   	pop    %esi
1000211b:	c2 08 00             	ret    $0x8
1000211e:	8b 4c 24 10          	mov    0x10(%esp),%ecx
10002122:	8b 51 04             	mov    0x4(%ecx),%edx
10002125:	c6 02 00             	movb   $0x0,(%edx)
10002128:	8b 41 08             	mov    0x8(%ecx),%eax
1000212b:	68 64 c1 00 10       	push   $0x1000c164  ; 0x1000c164='dll_CPacManItemSys'
10002130:	66 c7 00 03 00       	movw   $0x3,(%eax)
10002135:	e8 e6 f0 ff ff       	call   0x10001220
1000213a:	5f                   	pop    %edi
1000213b:	b8 01 00 00 00       	mov    $0x1,%eax
10002140:	5e                   	pop    %esi
10002141:	c2 08 00             	ret    $0x8
10002144:	8b cf                	mov    %edi,%ecx
10002146:	e8 95 fe ff ff       	call   0x10001fe0
1000214b:	5f                   	pop    %edi
1000214c:	33 c0                	xor    %eax,%eax
1000214e:	5e                   	pop    %esi
1000214f:	c2 08 00             	ret    $0x8
10002152:	3d 56 75 3a 97       	cmp    $0x973a7556,%eax
10002157:	74 3a                	je     0x10002193
10002159:	3d e6 bb 72 d3       	cmp    $0xd372bbe6,%eax
1000215e:	74 0a                	je     0x1000216a
10002160:	5f                   	pop    %edi
10002161:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
10002166:	5e                   	pop    %esi
10002167:	c2 08 00             	ret    $0x8
1000216a:	8b cf                	mov    %edi,%ecx
1000216c:	e8 df fd ff ff       	call   0x10001f50
10002171:	8b 4c 24 10          	mov    0x10(%esp),%ecx
10002175:	8b 51 04             	mov    0x4(%ecx),%edx
10002178:	c6 02 00             	movb   $0x0,(%edx)
1000217b:	8b 51 08             	mov    0x8(%ecx),%edx
1000217e:	50                   	push   %eax
1000217f:	66 c7 02 03 00       	movw   $0x3,(%edx)
10002184:	e8 b7 ef ff ff       	call   0x10001140
10002189:	5f                   	pop    %edi
1000218a:	b8 01 00 00 00       	mov    $0x1,%eax
1000218f:	5e                   	pop    %esi
10002190:	c2 08 00             	ret    $0x8
10002193:	8b 4c 24 10          	mov    0x10(%esp),%ecx
10002197:	8b 41 04             	mov    0x4(%ecx),%eax
1000219a:	80 38 01             	cmpb   $0x1,(%eax)
1000219d:	75 21                	jne    0x100021c0
1000219f:	8b 01                	mov    (%ecx),%eax
100021a1:	83 c0 03             	add    $0x3,%eax
100021a4:	74 1a                	je     0x100021c0
100021a6:	0f be 00             	movsbl (%eax),%eax
100021a9:	83 f8 05             	cmp    $0x5,%eax
100021ac:	75 12                	jne    0x100021c0
100021ae:	6a 00                	push   $0x0
100021b0:	51                   	push   %ecx
100021b1:	8d 4f 10             	lea    0x10(%edi),%ecx
100021b4:	e8 e7 32 00 00       	call   0x100054a0
100021b9:	5f                   	pop    %edi
100021ba:	33 c0                	xor    %eax,%eax
100021bc:	5e                   	pop    %esi
100021bd:	c2 08 00             	ret    $0x8
100021c0:	5f                   	pop    %edi
100021c1:	83 c8 ff             	or     $0xffffffff,%eax
100021c4:	5e                   	pop    %esi
100021c5:	c2 08 00             	ret    $0x8
100021c8:	90                   	nop
100021c9:	90                   	nop
100021ca:	90                   	nop
100021cb:	90                   	nop
100021cc:	90                   	nop
100021cd:	90                   	nop
100021ce:	90                   	nop
100021cf:	90                   	nop
100021d0:	8b c1                	mov    %ecx,%eax
100021d2:	8b 4c 24 04          	mov    0x4(%esp),%ecx
100021d6:	8b 11                	mov    (%ecx),%edx
100021d8:	89 10                	mov    %edx,(%eax)
100021da:	8b 54 24 08          	mov    0x8(%esp),%edx
100021de:	56                   	push   %esi
100021df:	8b 32                	mov    (%edx),%esi
100021e1:	8d 48 04             	lea    0x4(%eax),%ecx
100021e4:	89 31                	mov    %esi,(%ecx)
100021e6:	8b 72 04             	mov    0x4(%edx),%esi
100021e9:	89 71 04             	mov    %esi,0x4(%ecx)
100021ec:	8b 52 08             	mov    0x8(%edx),%edx
100021ef:	89 51 08             	mov    %edx,0x8(%ecx)
100021f2:	5e                   	pop    %esi
100021f3:	c2 08 00             	ret    $0x8
100021f6:	90                   	nop
100021f7:	90                   	nop
100021f8:	90                   	nop
100021f9:	90                   	nop
100021fa:	90                   	nop
100021fb:	90                   	nop
100021fc:	90                   	nop
100021fd:	90                   	nop
100021fe:	90                   	nop
100021ff:	90                   	nop
10002200:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10002204:	8b 54 24 08          	mov    0x8(%esp),%edx
10002208:	3b ca                	cmp    %edx,%ecx
1000220a:	8b 44 24 0c          	mov    0xc(%esp),%eax
1000220e:	74 14                	je     0x10002224
10002210:	56                   	push   %esi
10002211:	85 c0                	test   %eax,%eax
10002213:	74 04                	je     0x10002219
10002215:	8b 31                	mov    (%ecx),%esi
10002217:	89 30                	mov    %esi,(%eax)
10002219:	83 c1 04             	add    $0x4,%ecx
1000221c:	83 c0 04             	add    $0x4,%eax
1000221f:	3b ca                	cmp    %edx,%ecx
10002221:	75 ee                	jne    0x10002211
10002223:	5e                   	pop    %esi
10002224:	c3                   	ret
10002225:	90                   	nop
10002226:	90                   	nop
10002227:	90                   	nop
10002228:	90                   	nop
10002229:	90                   	nop
1000222a:	90                   	nop
1000222b:	90                   	nop
1000222c:	90                   	nop
1000222d:	90                   	nop
1000222e:	90                   	nop
1000222f:	90                   	nop
10002230:	6a 18                	push   $0x18
10002232:	e8 d9 32 00 00       	call   0x10005510
10002237:	83 c4 04             	add    $0x4,%esp
1000223a:	85 c0                	test   %eax,%eax
1000223c:	74 02                	je     0x10002240
1000223e:	89 00                	mov    %eax,(%eax)
10002240:	8d 48 04             	lea    0x4(%eax),%ecx
10002243:	85 c9                	test   %ecx,%ecx
10002245:	74 02                	je     0x10002249
10002247:	89 01                	mov    %eax,(%ecx)
10002249:	c3                   	ret
1000224a:	90                   	nop
1000224b:	90                   	nop
1000224c:	90                   	nop
1000224d:	90                   	nop
1000224e:	90                   	nop
1000224f:	90                   	nop
10002250:	6a 18                	push   $0x18
10002252:	e8 b9 32 00 00       	call   0x10005510
10002257:	83 c4 04             	add    $0x4,%esp
1000225a:	85 c0                	test   %eax,%eax
1000225c:	74 2c                	je     0x1000228a
1000225e:	8b 54 24 08          	mov    0x8(%esp),%edx
10002262:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10002266:	89 08                	mov    %ecx,(%eax)
10002268:	89 50 04             	mov    %edx,0x4(%eax)
1000226b:	8b 54 24 0c          	mov    0xc(%esp),%edx
1000226f:	56                   	push   %esi
10002270:	8b 32                	mov    (%edx),%esi
10002272:	8d 48 08             	lea    0x8(%eax),%ecx
10002275:	89 31                	mov    %esi,(%ecx)
10002277:	8b 72 04             	mov    0x4(%edx),%esi
1000227a:	89 71 04             	mov    %esi,0x4(%ecx)
1000227d:	8b 72 08             	mov    0x8(%edx),%esi
10002280:	89 71 08             	mov    %esi,0x8(%ecx)
10002283:	8b 52 0c             	mov    0xc(%edx),%edx
10002286:	89 51 0c             	mov    %edx,0xc(%ecx)
10002289:	5e                   	pop    %esi
1000228a:	c2 0c 00             	ret    $0xc
1000228d:	90                   	nop
1000228e:	90                   	nop
1000228f:	90                   	nop
10002290:	8b 54 24 08          	mov    0x8(%esp),%edx
10002294:	8b 44 24 0c          	mov    0xc(%esp),%eax
10002298:	3b d0                	cmp    %eax,%edx
1000229a:	8b 4c 24 10          	mov    0x10(%esp),%ecx
1000229e:	56                   	push   %esi
1000229f:	74 0f                	je     0x100022b0
100022a1:	8b 70 fc             	mov    -0x4(%eax),%esi
100022a4:	83 e8 04             	sub    $0x4,%eax
100022a7:	83 e9 04             	sub    $0x4,%ecx
100022aa:	3b c2                	cmp    %edx,%eax
100022ac:	89 31                	mov    %esi,(%ecx)
100022ae:	75 f1                	jne    0x100022a1
100022b0:	8b 44 24 08          	mov    0x8(%esp),%eax
100022b4:	89 08                	mov    %ecx,(%eax)
100022b6:	5e                   	pop    %esi
100022b7:	c3                   	ret
100022b8:	90                   	nop
100022b9:	90                   	nop
100022ba:	90                   	nop
100022bb:	90                   	nop
100022bc:	90                   	nop
100022bd:	90                   	nop
100022be:	90                   	nop
100022bf:	90                   	nop
100022c0:	51                   	push   %ecx
100022c1:	56                   	push   %esi
100022c2:	8b f1                	mov    %ecx,%esi
100022c4:	8b 46 04             	mov    0x4(%esi),%eax
100022c7:	85 c0                	test   %eax,%eax
100022c9:	75 04                	jne    0x100022cf
100022cb:	33 c9                	xor    %ecx,%ecx
100022cd:	eb 02                	jmp    0x100022d1
100022cf:	8b 08                	mov    (%eax),%ecx
100022d1:	50                   	push   %eax
100022d2:	51                   	push   %ecx
100022d3:	8d 44 24 0c          	lea    0xc(%esp),%eax
100022d7:	50                   	push   %eax
100022d8:	8b ce                	mov    %esi,%ecx
100022da:	e8 71 11 00 00       	call   0x10003450
100022df:	8b 4e 04             	mov    0x4(%esi),%ecx
100022e2:	51                   	push   %ecx
100022e3:	e8 f5 36 00 00       	call   0x100059dd
100022e8:	83 c4 04             	add    $0x4,%esp
100022eb:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
100022f2:	c7 46 08 00 00 00 00 	movl   $0x0,0x8(%esi)
100022f9:	5e                   	pop    %esi
100022fa:	59                   	pop    %ecx
100022fb:	c3                   	ret
100022fc:	90                   	nop
100022fd:	90                   	nop
100022fe:	90                   	nop
100022ff:	90                   	nop
10002300:	56                   	push   %esi
10002301:	8b f1                	mov    %ecx,%esi
10002303:	8b 46 04             	mov    0x4(%esi),%eax
10002306:	85 c0                	test   %eax,%eax
10002308:	74 09                	je     0x10002313
1000230a:	50                   	push   %eax
1000230b:	e8 cd 36 00 00       	call   0x100059dd
10002310:	83 c4 04             	add    $0x4,%esp
10002313:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
1000231a:	c7 46 08 00 00 00 00 	movl   $0x0,0x8(%esi)
10002321:	c7 46 0c 00 00 00 00 	movl   $0x0,0xc(%esi)
10002328:	5e                   	pop    %esi
10002329:	c3                   	ret
1000232a:	90                   	nop
1000232b:	90                   	nop
1000232c:	90                   	nop
1000232d:	90                   	nop
1000232e:	90                   	nop
1000232f:	90                   	nop
10002330:	55                   	push   %ebp
10002331:	8b ec                	mov    %esp,%ebp
10002333:	6a ff                	push   $0xffffffff
10002335:	68 b0 b1 00 10       	push   $0x1000b1b0
1000233a:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10002340:	50                   	push   %eax
10002341:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10002348:	83 ec 08             	sub    $0x8,%esp
1000234b:	8b 45 0c             	mov    0xc(%ebp),%eax
1000234e:	53                   	push   %ebx
1000234f:	8b 5d 08             	mov    0x8(%ebp),%ebx
10002352:	56                   	push   %esi
10002353:	57                   	push   %edi
10002354:	89 65 f0             	mov    %esp,-0x10(%ebp)
10002357:	8b f1                	mov    %ecx,%esi
10002359:	8b 4d 0c             	mov    0xc(%ebp),%ecx
1000235c:	8b 7e 04             	mov    0x4(%esi),%edi
1000235f:	50                   	push   %eax
10002360:	56                   	push   %esi
10002361:	51                   	push   %ecx
10002362:	53                   	push   %ebx
10002363:	57                   	push   %edi
10002364:	89 75 ec             	mov    %esi,-0x14(%ebp)
10002367:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
1000236e:	e8 9d f1 ff ff       	call   0x10001510
10002373:	8b 4d f4             	mov    -0xc(%ebp),%ecx
10002376:	83 c4 14             	add    $0x14,%esp
10002379:	8d 14 9f             	lea    (%edi,%ebx,4),%edx
1000237c:	5f                   	pop    %edi
1000237d:	89 56 08             	mov    %edx,0x8(%esi)
10002380:	5e                   	pop    %esi
10002381:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10002388:	5b                   	pop    %ebx
10002389:	8b e5                	mov    %ebp,%esp
1000238b:	5d                   	pop    %ebp
1000238c:	c2 08 00             	ret    $0x8
1000238f:	8b 4d ec             	mov    -0x14(%ebp),%ecx
10002392:	e8 69 ff ff ff       	call   0x10002300
10002397:	6a 00                	push   $0x0
10002399:	6a 00                	push   $0x0
1000239b:	e8 42 36 00 00       	call   0x100059e2
100023a0:	cc                   	int3
100023a1:	90                   	nop
100023a2:	90                   	nop
100023a3:	90                   	nop
100023a4:	90                   	nop
100023a5:	90                   	nop
100023a6:	90                   	nop
100023a7:	90                   	nop
100023a8:	90                   	nop
100023a9:	90                   	nop
100023aa:	90                   	nop
100023ab:	90                   	nop
100023ac:	90                   	nop
100023ad:	90                   	nop
100023ae:	90                   	nop
100023af:	90                   	nop
100023b0:	51                   	push   %ecx
100023b1:	53                   	push   %ebx
100023b2:	55                   	push   %ebp
100023b3:	56                   	push   %esi
100023b4:	8b f1                	mov    %ecx,%esi
100023b6:	8d 44 24 14          	lea    0x14(%esp),%eax
100023ba:	50                   	push   %eax
100023bb:	8d 4c 24 10          	lea    0x10(%esp),%ecx
100023bf:	8d 6e 10             	lea    0x10(%esi),%ebp
100023c2:	51                   	push   %ecx
100023c3:	8b cd                	mov    %ebp,%ecx
100023c5:	e8 86 11 00 00       	call   0x10003550
100023ca:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
100023ce:	3b 5e 18             	cmp    0x18(%esi),%ebx
100023d1:	74 5f                	je     0x10002432
100023d3:	8b 46 38             	mov    0x38(%esi),%eax
100023d6:	8b 50 04             	mov    0x4(%eax),%edx
100023d9:	8b 4c 24 18          	mov    0x18(%esp),%ecx
100023dd:	c6 02 00             	movb   $0x0,(%edx)
100023e0:	8b 40 08             	mov    0x8(%eax),%eax
100023e3:	57                   	push   %edi
100023e4:	66 c7 00 03 00       	movw   $0x3,(%eax)
100023e9:	51                   	push   %ecx
100023ea:	8b 4e 38             	mov    0x38(%esi),%ecx
100023ed:	e8 4e ed ff ff       	call   0x10001140
100023f2:	8b 76 38             	mov    0x38(%esi),%esi
100023f5:	56                   	push   %esi
100023f6:	8d 7b 0c             	lea    0xc(%ebx),%edi
100023f9:	68 d7 5f ae 90       	push   $0x90ae5fd7
100023fe:	8b cf                	mov    %edi,%ecx
10002400:	e8 fb 2f 00 00       	call   0x10005400
10002405:	83 f8 01             	cmp    $0x1,%eax
10002408:	74 11                	je     0x1000241b
1000240a:	8b 57 08             	mov    0x8(%edi),%edx
1000240d:	52                   	push   %edx
1000240e:	68 78 c1 00 10       	push   $0x1000c178  ; 0x1000c178='obj( %d ) ,call func ( OnDelMe ) faild.'
10002413:	e8 18 2e 00 00       	call   0x10005230
10002418:	83 c4 08             	add    $0x8,%esp
1000241b:	53                   	push   %ebx
1000241c:	8d 44 24 1c          	lea    0x1c(%esp),%eax
10002420:	50                   	push   %eax
10002421:	8b cd                	mov    %ebp,%ecx
10002423:	e8 a8 10 00 00       	call   0x100034d0
10002428:	5f                   	pop    %edi
10002429:	5e                   	pop    %esi
1000242a:	5d                   	pop    %ebp
1000242b:	b0 01                	mov    $0x1,%al
1000242d:	5b                   	pop    %ebx
1000242e:	59                   	pop    %ecx
1000242f:	c2 08 00             	ret    $0x8
10002432:	5e                   	pop    %esi
10002433:	5d                   	pop    %ebp
10002434:	32 c0                	xor    %al,%al
10002436:	5b                   	pop    %ebx
10002437:	59                   	pop    %ecx
10002438:	c2 08 00             	ret    $0x8
1000243b:	90                   	nop
1000243c:	90                   	nop
1000243d:	90                   	nop
1000243e:	90                   	nop
1000243f:	90                   	nop
10002440:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10002446:	8b 54 24 04          	mov    0x4(%esp),%edx
1000244a:	6a ff                	push   $0xffffffff
1000244c:	68 c8 b1 00 10       	push   $0x1000b1c8
10002451:	50                   	push   %eax
10002452:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10002459:	8b 41 08             	mov    0x8(%ecx),%eax
1000245c:	83 ec 44             	sub    $0x44,%esp
1000245f:	56                   	push   %esi
10002460:	be ff ff ff 0f       	mov    $0xfffffff,%esi
10002465:	2b f0                	sub    %eax,%esi
10002467:	3b f2                	cmp    %edx,%esi
10002469:	5e                   	pop    %esi
1000246a:	73 69                	jae    0x100024d5
1000246c:	b8 a0 c1 00 10       	mov    $0x1000c1a0,%eax  ; 0x1000c1a0='list<T> too long'
10002471:	c7 44 24 18 0f 00 00 	movl   $0xf,0x18(%esp)
10002478:	00 
10002479:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
10002480:	00 
10002481:	c6 44 24 04 00       	movb   $0x0,0x4(%esp)
10002486:	8d 50 01             	lea    0x1(%eax),%edx
10002489:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
10002490:	8a 08                	mov    (%eax),%cl
10002492:	40                   	inc    %eax
10002493:	84 c9                	test   %cl,%cl
10002495:	75 f9                	jne    0x10002490
10002497:	2b c2                	sub    %edx,%eax
10002499:	50                   	push   %eax
1000249a:	68 a0 c1 00 10       	push   $0x1000c1a0  ; 0x1000c1a0='list<T> too long'
1000249f:	8d 4c 24 08          	lea    0x8(%esp),%ecx
100024a3:	e8 98 f3 ff ff       	call   0x10001840
100024a8:	8d 44 24 00          	lea    0x0(%esp),%eax
100024ac:	50                   	push   %eax
100024ad:	8d 4c 24 20          	lea    0x20(%esp),%ecx
100024b1:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
100024b8:	00 
100024b9:	e8 72 f4 ff ff       	call   0x10001930
100024be:	68 bc d4 00 10       	push   $0x1000d4bc
100024c3:	8d 4c 24 20          	lea    0x20(%esp),%ecx
100024c7:	51                   	push   %ecx
100024c8:	c7 44 24 24 bc c2 00 	movl   $0x1000c2bc,0x24(%esp)
100024cf:	10 
100024d0:	e8 0d 35 00 00       	call   0x100059e2
100024d5:	03 c2                	add    %edx,%eax
100024d7:	89 41 08             	mov    %eax,0x8(%ecx)
100024da:	8b 4c 24 44          	mov    0x44(%esp),%ecx
100024de:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
100024e5:	83 c4 50             	add    $0x50,%esp
100024e8:	c2 04 00             	ret    $0x4
100024eb:	90                   	nop
100024ec:	90                   	nop
100024ed:	90                   	nop
100024ee:	90                   	nop
100024ef:	90                   	nop
100024f0:	6a ff                	push   $0xffffffff
100024f2:	68 c8 b1 00 10       	push   $0x1000b1c8
100024f7:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
100024fd:	50                   	push   %eax
100024fe:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10002505:	83 ec 44             	sub    $0x44,%esp
10002508:	b8 50 c1 00 10       	mov    $0x1000c150,%eax  ; 0x1000c150='vector<T> too long'
1000250d:	c7 44 24 18 0f 00 00 	movl   $0xf,0x18(%esp)
10002514:	00 
10002515:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
1000251c:	00 
1000251d:	c6 44 24 04 00       	movb   $0x0,0x4(%esp)
10002522:	8d 50 01             	lea    0x1(%eax),%edx
10002525:	8a 08                	mov    (%eax),%cl
10002527:	40                   	inc    %eax
10002528:	84 c9                	test   %cl,%cl
1000252a:	75 f9                	jne    0x10002525
1000252c:	2b c2                	sub    %edx,%eax
1000252e:	50                   	push   %eax
1000252f:	68 50 c1 00 10       	push   $0x1000c150  ; 0x1000c150='vector<T> too long'
10002534:	8d 4c 24 08          	lea    0x8(%esp),%ecx
10002538:	e8 03 f3 ff ff       	call   0x10001840
1000253d:	8d 44 24 00          	lea    0x0(%esp),%eax
10002541:	50                   	push   %eax
10002542:	8d 4c 24 20          	lea    0x20(%esp),%ecx
10002546:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
1000254d:	00 
1000254e:	e8 dd f3 ff ff       	call   0x10001930
10002553:	68 bc d4 00 10       	push   $0x1000d4bc
10002558:	8d 4c 24 20          	lea    0x20(%esp),%ecx
1000255c:	51                   	push   %ecx
1000255d:	c7 44 24 24 bc c2 00 	movl   $0x1000c2bc,0x24(%esp)
10002564:	10 
10002565:	e8 78 34 00 00       	call   0x100059e2
1000256a:	cc                   	int3
1000256b:	90                   	nop
1000256c:	90                   	nop
1000256d:	90                   	nop
1000256e:	90                   	nop
1000256f:	90                   	nop
10002570:	55                   	push   %ebp
10002571:	8b ec                	mov    %esp,%ebp
10002573:	6a ff                	push   $0xffffffff
10002575:	68 e0 b1 00 10       	push   $0x1000b1e0
1000257a:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10002580:	50                   	push   %eax
10002581:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10002588:	83 ec 0c             	sub    $0xc,%esp
1000258b:	8b 45 10             	mov    0x10(%ebp),%eax
1000258e:	53                   	push   %ebx
1000258f:	56                   	push   %esi
10002590:	8b f1                	mov    %ecx,%esi
10002592:	8b 08                	mov    (%eax),%ecx
10002594:	57                   	push   %edi
10002595:	8b 7e 04             	mov    0x4(%esi),%edi
10002598:	85 ff                	test   %edi,%edi
1000259a:	89 65 f0             	mov    %esp,-0x10(%ebp)
1000259d:	89 4d 10             	mov    %ecx,0x10(%ebp)
100025a0:	75 04                	jne    0x100025a6
100025a2:	33 c0                	xor    %eax,%eax
100025a4:	eb 08                	jmp    0x100025ae
100025a6:	8b 46 0c             	mov    0xc(%esi),%eax
100025a9:	2b c7                	sub    %edi,%eax
100025ab:	c1 f8 02             	sar    $0x2,%eax
100025ae:	8b 55 0c             	mov    0xc(%ebp),%edx
100025b1:	85 d2                	test   %edx,%edx
100025b3:	0f 84 41 02 00 00    	je     0x100027fa
100025b9:	85 ff                	test   %edi,%edi
100025bb:	75 04                	jne    0x100025c1
100025bd:	33 c9                	xor    %ecx,%ecx
100025bf:	eb 08                	jmp    0x100025c9
100025c1:	8b 4e 08             	mov    0x8(%esi),%ecx
100025c4:	2b cf                	sub    %edi,%ecx
100025c6:	c1 f9 02             	sar    $0x2,%ecx
100025c9:	bb ff ff ff 3f       	mov    $0x3fffffff,%ebx
100025ce:	2b d9                	sub    %ecx,%ebx
100025d0:	3b da                	cmp    %edx,%ebx
100025d2:	73 1a                	jae    0x100025ee
100025d4:	8b ce                	mov    %esi,%ecx
100025d6:	e8 15 ff ff ff       	call   0x100024f0
100025db:	8b 4d f4             	mov    -0xc(%ebp),%ecx
100025de:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
100025e5:	5f                   	pop    %edi
100025e6:	5e                   	pop    %esi
100025e7:	5b                   	pop    %ebx
100025e8:	8b e5                	mov    %ebp,%esp
100025ea:	5d                   	pop    %ebp
100025eb:	c2 0c 00             	ret    $0xc
100025ee:	85 ff                	test   %edi,%edi
100025f0:	75 04                	jne    0x100025f6
100025f2:	33 c9                	xor    %ecx,%ecx
100025f4:	eb 08                	jmp    0x100025fe
100025f6:	8b 4e 08             	mov    0x8(%esi),%ecx
100025f9:	2b cf                	sub    %edi,%ecx
100025fb:	c1 f9 02             	sar    $0x2,%ecx
100025fe:	03 ca                	add    %edx,%ecx
10002600:	3b c1                	cmp    %ecx,%eax
10002602:	0f 83 10 01 00 00    	jae    0x10002718
10002608:	8b c8                	mov    %eax,%ecx
1000260a:	d1 e9                	shr    $1,%ecx
1000260c:	bb ff ff ff 3f       	mov    $0x3fffffff,%ebx
10002611:	2b d9                	sub    %ecx,%ebx
10002613:	3b d8                	cmp    %eax,%ebx
10002615:	73 04                	jae    0x1000261b
10002617:	33 c0                	xor    %eax,%eax
10002619:	eb 02                	jmp    0x1000261d
1000261b:	03 c1                	add    %ecx,%eax
1000261d:	85 ff                	test   %edi,%edi
1000261f:	75 04                	jne    0x10002625
10002621:	33 c9                	xor    %ecx,%ecx
10002623:	eb 08                	jmp    0x1000262d
10002625:	8b 4e 08             	mov    0x8(%esi),%ecx
10002628:	2b cf                	sub    %edi,%ecx
1000262a:	c1 f9 02             	sar    $0x2,%ecx
1000262d:	03 ca                	add    %edx,%ecx
1000262f:	3b c1                	cmp    %ecx,%eax
10002631:	73 12                	jae    0x10002645
10002633:	85 ff                	test   %edi,%edi
10002635:	75 04                	jne    0x1000263b
10002637:	33 c0                	xor    %eax,%eax
10002639:	eb 08                	jmp    0x10002643
1000263b:	8b 46 08             	mov    0x8(%esi),%eax
1000263e:	2b c7                	sub    %edi,%eax
10002640:	c1 f8 02             	sar    $0x2,%eax
10002643:	03 c2                	add    %edx,%eax
10002645:	c1 e0 02             	shl    $0x2,%eax
10002648:	50                   	push   %eax
10002649:	89 45 ec             	mov    %eax,-0x14(%ebp)
1000264c:	e8 bf 2e 00 00       	call   0x10005510
10002651:	8b 55 0c             	mov    0xc(%ebp),%edx
10002654:	83 c4 04             	add    $0x4,%esp
10002657:	52                   	push   %edx
10002658:	8b 55 08             	mov    0x8(%ebp),%edx
1000265b:	8b d8                	mov    %eax,%ebx
1000265d:	8b 46 04             	mov    0x4(%esi),%eax
10002660:	56                   	push   %esi
10002661:	53                   	push   %ebx
10002662:	51                   	push   %ecx
10002663:	8b cc                	mov    %esp,%ecx
10002665:	89 11                	mov    %edx,(%ecx)
10002667:	51                   	push   %ecx
10002668:	8b cc                	mov    %esp,%ecx
1000266a:	89 5d e8             	mov    %ebx,-0x18(%ebp)
1000266d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
10002674:	89 01                	mov    %eax,(%ecx)
10002676:	e8 85 fb ff ff       	call   0x10002200
1000267b:	8b 55 0c             	mov    0xc(%ebp),%edx
1000267e:	83 c4 14             	add    $0x14,%esp
10002681:	8b f8                	mov    %eax,%edi
10002683:	8b 45 0c             	mov    0xc(%ebp),%eax
10002686:	50                   	push   %eax
10002687:	56                   	push   %esi
10002688:	8d 4d 10             	lea    0x10(%ebp),%ecx
1000268b:	51                   	push   %ecx
1000268c:	52                   	push   %edx
1000268d:	57                   	push   %edi
1000268e:	e8 7d ee ff ff       	call   0x10001510
10002693:	8b 55 0c             	mov    0xc(%ebp),%edx
10002696:	8b 4e 08             	mov    0x8(%esi),%ecx
10002699:	8b 45 0c             	mov    0xc(%ebp),%eax
1000269c:	83 c4 14             	add    $0x14,%esp
1000269f:	52                   	push   %edx
100026a0:	8d 04 87             	lea    (%edi,%eax,4),%eax
100026a3:	56                   	push   %esi
100026a4:	50                   	push   %eax
100026a5:	51                   	push   %ecx
100026a6:	8b c4                	mov    %esp,%eax
100026a8:	89 08                	mov    %ecx,(%eax)
100026aa:	51                   	push   %ecx
100026ab:	8b 4d 08             	mov    0x8(%ebp),%ecx
100026ae:	8b c4                	mov    %esp,%eax
100026b0:	89 08                	mov    %ecx,(%eax)
100026b2:	e8 49 fb ff ff       	call   0x10002200
100026b7:	8b 4e 04             	mov    0x4(%esi),%ecx
100026ba:	83 c4 14             	add    $0x14,%esp
100026bd:	85 c9                	test   %ecx,%ecx
100026bf:	75 04                	jne    0x100026c5
100026c1:	33 c0                	xor    %eax,%eax
100026c3:	eb 08                	jmp    0x100026cd
100026c5:	8b 46 08             	mov    0x8(%esi),%eax
100026c8:	2b c1                	sub    %ecx,%eax
100026ca:	c1 f8 02             	sar    $0x2,%eax
100026cd:	8b 7d 0c             	mov    0xc(%ebp),%edi
100026d0:	03 f8                	add    %eax,%edi
100026d2:	85 c9                	test   %ecx,%ecx
100026d4:	74 09                	je     0x100026df
100026d6:	51                   	push   %ecx
100026d7:	e8 01 33 00 00       	call   0x100059dd
100026dc:	83 c4 04             	add    $0x4,%esp
100026df:	8b 55 ec             	mov    -0x14(%ebp),%edx
100026e2:	03 d3                	add    %ebx,%edx
100026e4:	8d 04 bb             	lea    (%ebx,%edi,4),%eax
100026e7:	89 56 0c             	mov    %edx,0xc(%esi)
100026ea:	89 46 08             	mov    %eax,0x8(%esi)
100026ed:	89 5e 04             	mov    %ebx,0x4(%esi)
100026f0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
100026f3:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
100026fa:	5f                   	pop    %edi
100026fb:	5e                   	pop    %esi
100026fc:	5b                   	pop    %ebx
100026fd:	8b e5                	mov    %ebp,%esp
100026ff:	5d                   	pop    %ebp
10002700:	c2 0c 00             	ret    $0xc
10002703:	8b 4d e8             	mov    -0x18(%ebp),%ecx
10002706:	51                   	push   %ecx
10002707:	e8 d1 32 00 00       	call   0x100059dd
1000270c:	83 c4 04             	add    $0x4,%esp
1000270f:	6a 00                	push   $0x0
10002711:	6a 00                	push   $0x0
10002713:	e8 ca 32 00 00       	call   0x100059e2
10002718:	8b 5e 08             	mov    0x8(%esi),%ebx
1000271b:	8b 7d 08             	mov    0x8(%ebp),%edi
1000271e:	8b c3                	mov    %ebx,%eax
10002720:	2b c7                	sub    %edi,%eax
10002722:	c1 f8 02             	sar    $0x2,%eax
10002725:	3b c2                	cmp    %edx,%eax
10002727:	73 61                	jae    0x1000278a
10002729:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
10002730:	89 45 08             	mov    %eax,0x8(%ebp)
10002733:	03 c7                	add    %edi,%eax
10002735:	50                   	push   %eax
10002736:	51                   	push   %ecx
10002737:	8b c4                	mov    %esp,%eax
10002739:	89 65 e8             	mov    %esp,-0x18(%ebp)
1000273c:	51                   	push   %ecx
1000273d:	89 18                	mov    %ebx,(%eax)
1000273f:	8b c4                	mov    %esp,%eax
10002741:	8b ce                	mov    %esi,%ecx
10002743:	89 65 e8             	mov    %esp,-0x18(%ebp)
10002746:	89 38                	mov    %edi,(%eax)
10002748:	e8 93 0e 00 00       	call   0x100035e0
1000274d:	8b 4e 08             	mov    0x8(%esi),%ecx
10002750:	8b 45 0c             	mov    0xc(%ebp),%eax
10002753:	8d 55 10             	lea    0x10(%ebp),%edx
10002756:	52                   	push   %edx
10002757:	8b d1                	mov    %ecx,%edx
10002759:	2b d7                	sub    %edi,%edx
1000275b:	c1 fa 02             	sar    $0x2,%edx
1000275e:	2b c2                	sub    %edx,%eax
10002760:	50                   	push   %eax
10002761:	51                   	push   %ecx
10002762:	8b ce                	mov    %esi,%ecx
10002764:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%ebp)
1000276b:	e8 a0 0f 00 00       	call   0x10003710
10002770:	8b 5e 08             	mov    0x8(%esi),%ebx
10002773:	8b 4d 08             	mov    0x8(%ebp),%ecx
10002776:	03 d9                	add    %ecx,%ebx
10002778:	8d 45 10             	lea    0x10(%ebp),%eax
1000277b:	89 5e 08             	mov    %ebx,0x8(%esi)
1000277e:	50                   	push   %eax
1000277f:	8b f3                	mov    %ebx,%esi
10002781:	51                   	push   %ecx
10002782:	8b c4                	mov    %esp,%eax
10002784:	2b f1                	sub    %ecx,%esi
10002786:	89 30                	mov    %esi,(%eax)
10002788:	eb 5d                	jmp    0x100027e7
1000278a:	53                   	push   %ebx
1000278b:	51                   	push   %ecx
1000278c:	8b c4                	mov    %esp,%eax
1000278e:	89 18                	mov    %ebx,(%eax)
10002790:	89 65 0c             	mov    %esp,0xc(%ebp)
10002793:	51                   	push   %ecx
10002794:	c1 e2 02             	shl    $0x2,%edx
10002797:	8b cc                	mov    %esp,%ecx
10002799:	8b c3                	mov    %ebx,%eax
1000279b:	2b c2                	sub    %edx,%eax
1000279d:	89 01                	mov    %eax,(%ecx)
1000279f:	89 65 0c             	mov    %esp,0xc(%ebp)
100027a2:	8b ce                	mov    %esi,%ecx
100027a4:	89 55 08             	mov    %edx,0x8(%ebp)
100027a7:	89 45 0c             	mov    %eax,0xc(%ebp)
100027aa:	e8 31 0e 00 00       	call   0x100035e0
100027af:	51                   	push   %ecx
100027b0:	89 46 08             	mov    %eax,0x8(%esi)
100027b3:	8b c4                	mov    %esp,%eax
100027b5:	89 65 e8             	mov    %esp,-0x18(%ebp)
100027b8:	51                   	push   %ecx
100027b9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
100027bc:	89 18                	mov    %ebx,(%eax)
100027be:	8b c4                	mov    %esp,%eax
100027c0:	89 65 e8             	mov    %esp,-0x18(%ebp)
100027c3:	51                   	push   %ecx
100027c4:	89 08                	mov    %ecx,(%eax)
100027c6:	8b c4                	mov    %esp,%eax
100027c8:	8d 55 0c             	lea    0xc(%ebp),%edx
100027cb:	89 65 0c             	mov    %esp,0xc(%ebp)
100027ce:	52                   	push   %edx
100027cf:	89 38                	mov    %edi,(%eax)
100027d1:	e8 ba fa ff ff       	call   0x10002290
100027d6:	83 c4 10             	add    $0x10,%esp
100027d9:	8d 45 10             	lea    0x10(%ebp),%eax
100027dc:	50                   	push   %eax
100027dd:	51                   	push   %ecx
100027de:	8b 4d 08             	mov    0x8(%ebp),%ecx
100027e1:	8b c4                	mov    %esp,%eax
100027e3:	03 cf                	add    %edi,%ecx
100027e5:	89 08                	mov    %ecx,(%eax)
100027e7:	89 65 0c             	mov    %esp,0xc(%ebp)
100027ea:	51                   	push   %ecx
100027eb:	8b c4                	mov    %esp,%eax
100027ed:	89 38                	mov    %edi,(%eax)
100027ef:	89 65 0c             	mov    %esp,0xc(%ebp)
100027f2:	e8 d9 eb ff ff       	call   0x100013d0
100027f7:	83 c4 0c             	add    $0xc,%esp
100027fa:	8b 4d f4             	mov    -0xc(%ebp),%ecx
100027fd:	5f                   	pop    %edi
100027fe:	5e                   	pop    %esi
100027ff:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10002806:	5b                   	pop    %ebx
10002807:	8b e5                	mov    %ebp,%esp
10002809:	5d                   	pop    %ebp
1000280a:	c2 0c 00             	ret    $0xc
1000280d:	90                   	nop
1000280e:	90                   	nop
1000280f:	90                   	nop
10002810:	56                   	push   %esi
10002811:	8b 71 04             	mov    0x4(%ecx),%esi
10002814:	85 f6                	test   %esi,%esi
10002816:	57                   	push   %edi
10002817:	75 04                	jne    0x1000281d
10002819:	33 c0                	xor    %eax,%eax
1000281b:	eb 08                	jmp    0x10002825
1000281d:	8b 41 08             	mov    0x8(%ecx),%eax
10002820:	2b c6                	sub    %esi,%eax
10002822:	c1 f8 02             	sar    $0x2,%eax
10002825:	8b 54 24 0c          	mov    0xc(%esp),%edx
10002829:	3b c2                	cmp    %edx,%eax
1000282b:	73 2a                	jae    0x10002857
1000282d:	85 f6                	test   %esi,%esi
1000282f:	75 04                	jne    0x10002835
10002831:	33 c0                	xor    %eax,%eax
10002833:	eb 08                	jmp    0x1000283d
10002835:	8b 41 08             	mov    0x8(%ecx),%eax
10002838:	2b c6                	sub    %esi,%eax
1000283a:	c1 f8 02             	sar    $0x2,%eax
1000283d:	2b d0                	sub    %eax,%edx
1000283f:	8d 74 24 10          	lea    0x10(%esp),%esi
10002843:	56                   	push   %esi
10002844:	52                   	push   %edx
10002845:	8b 51 08             	mov    0x8(%ecx),%edx
10002848:	51                   	push   %ecx
10002849:	8b c4                	mov    %esp,%eax
1000284b:	89 10                	mov    %edx,(%eax)
1000284d:	e8 1e fd ff ff       	call   0x10002570
10002852:	5f                   	pop    %edi
10002853:	5e                   	pop    %esi
10002854:	c2 08 00             	ret    $0x8
10002857:	85 f6                	test   %esi,%esi
10002859:	74 28                	je     0x10002883
1000285b:	8b 79 08             	mov    0x8(%ecx),%edi
1000285e:	8b c7                	mov    %edi,%eax
10002860:	2b c6                	sub    %esi,%eax
10002862:	c1 f8 02             	sar    $0x2,%eax
10002865:	3b d0                	cmp    %eax,%edx
10002867:	73 1a                	jae    0x10002883
10002869:	51                   	push   %ecx
1000286a:	8b c4                	mov    %esp,%eax
1000286c:	89 38                	mov    %edi,(%eax)
1000286e:	8b 41 04             	mov    0x4(%ecx),%eax
10002871:	51                   	push   %ecx
10002872:	8d 04 90             	lea    (%eax,%edx,4),%eax
10002875:	8b f4                	mov    %esp,%esi
10002877:	8d 54 24 14          	lea    0x14(%esp),%edx
1000287b:	52                   	push   %edx
1000287c:	89 06                	mov    %eax,(%esi)
1000287e:	e8 5d 11 00 00       	call   0x100039e0
10002883:	5f                   	pop    %edi
10002884:	5e                   	pop    %esi
10002885:	c2 08 00             	ret    $0x8
10002888:	90                   	nop
10002889:	90                   	nop
1000288a:	90                   	nop
1000288b:	90                   	nop
1000288c:	90                   	nop
1000288d:	90                   	nop
1000288e:	90                   	nop
1000288f:	90                   	nop
10002890:	8b 44 24 08          	mov    0x8(%esp),%eax
10002894:	8b 10                	mov    (%eax),%edx
10002896:	56                   	push   %esi
10002897:	8b 71 04             	mov    0x4(%ecx),%esi
1000289a:	89 54 24 0c          	mov    %edx,0xc(%esp)
1000289e:	8b 51 08             	mov    0x8(%ecx),%edx
100028a1:	3b f2                	cmp    %edx,%esi
100028a3:	57                   	push   %edi
100028a4:	74 1b                	je     0x100028c1
100028a6:	3b d2                	cmp    %edx,%edx
100028a8:	8b c2                	mov    %edx,%eax
100028aa:	74 12                	je     0x100028be
100028ac:	8d 64 24 00          	lea    0x0(%esp),%esp
100028b0:	8b 38                	mov    (%eax),%edi
100028b2:	89 3e                	mov    %edi,(%esi)
100028b4:	83 c0 04             	add    $0x4,%eax
100028b7:	83 c6 04             	add    $0x4,%esi
100028ba:	3b c2                	cmp    %edx,%eax
100028bc:	75 f2                	jne    0x100028b0
100028be:	89 71 08             	mov    %esi,0x8(%ecx)
100028c1:	8b 41 04             	mov    0x4(%ecx),%eax
100028c4:	8d 54 24 10          	lea    0x10(%esp),%edx
100028c8:	52                   	push   %edx
100028c9:	8b 54 24 10          	mov    0x10(%esp),%edx
100028cd:	52                   	push   %edx
100028ce:	51                   	push   %ecx
100028cf:	8b d4                	mov    %esp,%edx
100028d1:	89 02                	mov    %eax,(%edx)
100028d3:	e8 98 fc ff ff       	call   0x10002570
100028d8:	5f                   	pop    %edi
100028d9:	5e                   	pop    %esi
100028da:	c2 08 00             	ret    $0x8
100028dd:	90                   	nop
100028de:	90                   	nop
100028df:	90                   	nop
100028e0:	6a ff                	push   $0xffffffff
100028e2:	68 fb b1 00 10       	push   $0x1000b1fb
100028e7:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
100028ed:	50                   	push   %eax
100028ee:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
100028f5:	51                   	push   %ecx
100028f6:	8b 44 24 14          	mov    0x14(%esp),%eax
100028fa:	56                   	push   %esi
100028fb:	8b f1                	mov    %ecx,%esi
100028fd:	8a 08                	mov    (%eax),%cl
100028ff:	57                   	push   %edi
10002900:	88 0e                	mov    %cl,(%esi)
10002902:	8d 7e 04             	lea    0x4(%esi),%edi
10002905:	8b cf                	mov    %edi,%ecx
10002907:	89 74 24 08          	mov    %esi,0x8(%esp)
1000290b:	e8 20 f9 ff ff       	call   0x10002230
10002910:	89 47 04             	mov    %eax,0x4(%edi)
10002913:	33 c0                	xor    %eax,%eax
10002915:	89 47 08             	mov    %eax,0x8(%edi)
10002918:	8b 56 08             	mov    0x8(%esi),%edx
1000291b:	8d 7e 10             	lea    0x10(%esi),%edi
1000291e:	6a 24                	push   $0x24
10002920:	89 44 24 18          	mov    %eax,0x18(%esp)
10002924:	89 54 24 20          	mov    %edx,0x20(%esp)
10002928:	89 47 04             	mov    %eax,0x4(%edi)
1000292b:	89 47 08             	mov    %eax,0x8(%edi)
1000292e:	89 47 0c             	mov    %eax,0xc(%edi)
10002931:	e8 da 2b 00 00       	call   0x10005510
10002936:	89 47 04             	mov    %eax,0x4(%edi)
10002939:	89 47 08             	mov    %eax,0x8(%edi)
1000293c:	83 c0 24             	add    $0x24,%eax
1000293f:	83 c4 04             	add    $0x4,%esp
10002942:	89 47 0c             	mov    %eax,0xc(%edi)
10002945:	8d 44 24 1c          	lea    0x1c(%esp),%eax
10002949:	50                   	push   %eax
1000294a:	6a 09                	push   $0x9
1000294c:	8b cf                	mov    %edi,%ecx
1000294e:	e8 dd f9 ff ff       	call   0x10002330
10002953:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
10002957:	b8 01 00 00 00       	mov    $0x1,%eax
1000295c:	89 46 20             	mov    %eax,0x20(%esi)
1000295f:	89 46 24             	mov    %eax,0x24(%esi)
10002962:	5f                   	pop    %edi
10002963:	8b c6                	mov    %esi,%eax
10002965:	5e                   	pop    %esi
10002966:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
1000296d:	83 c4 10             	add    $0x10,%esp
10002970:	c2 08 00             	ret    $0x8
10002973:	90                   	nop
10002974:	90                   	nop
10002975:	90                   	nop
10002976:	90                   	nop
10002977:	90                   	nop
10002978:	90                   	nop
10002979:	90                   	nop
1000297a:	90                   	nop
1000297b:	90                   	nop
1000297c:	90                   	nop
1000297d:	90                   	nop
1000297e:	90                   	nop
1000297f:	90                   	nop
10002980:	6a ff                	push   $0xffffffff
10002982:	68 3b b2 00 10       	push   $0x1000b23b
10002987:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
1000298d:	50                   	push   %eax
1000298e:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10002995:	83 ec 08             	sub    $0x8,%esp
10002998:	56                   	push   %esi
10002999:	57                   	push   %edi
1000299a:	8b f9                	mov    %ecx,%edi
1000299c:	8d 44 24 0b          	lea    0xb(%esp),%eax
100029a0:	50                   	push   %eax
100029a1:	8d 54 24 0f          	lea    0xf(%esp),%edx
100029a5:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
100029ac:	8d 4f 10             	lea    0x10(%edi),%ecx
100029af:	52                   	push   %edx
100029b0:	89 7c 24 14          	mov    %edi,0x14(%esp)
100029b4:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
100029bb:	c7 07 b4 c1 00 10    	movl   $0x1000c1b4,(%edi)
100029c1:	e8 1a ff ff ff       	call   0x100028e0
100029c6:	6a 10                	push   $0x10
100029c8:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
100029cf:	00 
100029d0:	e8 3b 2b 00 00       	call   0x10005510
100029d5:	8b f0                	mov    %eax,%esi
100029d7:	83 c4 04             	add    $0x4,%esp
100029da:	85 f6                	test   %esi,%esi
100029dc:	74 40                	je     0x10002a1e
100029de:	68 00 04 00 00       	push   $0x400
100029e3:	6a 02                	push   $0x2
100029e5:	ff 15 0c c0 00 10    	call   *0x1000c00c  ; 0x1000c00c=KERNEL32.dll!GlobalAlloc
100029eb:	50                   	push   %eax
100029ec:	89 46 0c             	mov    %eax,0xc(%esi)
100029ef:	ff 15 08 c0 00 10    	call   *0x1000c008  ; 0x1000c008=KERNEL32.dll!GlobalLock
100029f5:	89 06                	mov    %eax,(%esi)
100029f7:	89 46 04             	mov    %eax,0x4(%esi)
100029fa:	c6 00 00             	movb   $0x0,(%eax)
100029fd:	8b 06                	mov    (%esi),%eax
100029ff:	40                   	inc    %eax
10002a00:	89 46 08             	mov    %eax,0x8(%esi)
10002a03:	66 c7 00 03 00       	movw   $0x3,(%eax)
10002a08:	89 77 38             	mov    %esi,0x38(%edi)
10002a0b:	8b c7                	mov    %edi,%eax
10002a0d:	5f                   	pop    %edi
10002a0e:	5e                   	pop    %esi
10002a0f:	8b 4c 24 08          	mov    0x8(%esp),%ecx
10002a13:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10002a1a:	83 c4 14             	add    $0x14,%esp
10002a1d:	c3                   	ret
10002a1e:	8b 4c 24 10          	mov    0x10(%esp),%ecx
10002a22:	33 c0                	xor    %eax,%eax
10002a24:	89 47 38             	mov    %eax,0x38(%edi)
10002a27:	8b c7                	mov    %edi,%eax
10002a29:	5f                   	pop    %edi
10002a2a:	5e                   	pop    %esi
10002a2b:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10002a32:	83 c4 14             	add    $0x14,%esp
10002a35:	c3                   	ret
10002a36:	90                   	nop
10002a37:	90                   	nop
10002a38:	90                   	nop
10002a39:	90                   	nop
10002a3a:	90                   	nop
10002a3b:	90                   	nop
10002a3c:	90                   	nop
10002a3d:	90                   	nop
10002a3e:	90                   	nop
10002a3f:	90                   	nop
10002a40:	51                   	push   %ecx
10002a41:	56                   	push   %esi
10002a42:	8b f1                	mov    %ecx,%esi
10002a44:	8b 46 18             	mov    0x18(%esi),%eax
10002a47:	85 c0                	test   %eax,%eax
10002a49:	8d 4e 14             	lea    0x14(%esi),%ecx
10002a4c:	75 04                	jne    0x10002a52
10002a4e:	33 d2                	xor    %edx,%edx
10002a50:	eb 02                	jmp    0x10002a54
10002a52:	8b 10                	mov    (%eax),%edx
10002a54:	50                   	push   %eax
10002a55:	52                   	push   %edx
10002a56:	8d 44 24 0c          	lea    0xc(%esp),%eax
10002a5a:	50                   	push   %eax
10002a5b:	e8 f0 09 00 00       	call   0x10003450
10002a60:	8b 4e 18             	mov    0x18(%esi),%ecx
10002a63:	8d 54 24 04          	lea    0x4(%esp),%edx
10002a67:	52                   	push   %edx
10002a68:	89 4c 24 08          	mov    %ecx,0x8(%esp)
10002a6c:	6a 09                	push   $0x9
10002a6e:	8d 4e 20             	lea    0x20(%esi),%ecx
10002a71:	e8 1a fe ff ff       	call   0x10002890
10002a76:	b8 01 00 00 00       	mov    $0x1,%eax
10002a7b:	89 46 30             	mov    %eax,0x30(%esi)
10002a7e:	89 46 34             	mov    %eax,0x34(%esi)
10002a81:	5e                   	pop    %esi
10002a82:	59                   	pop    %ecx
10002a83:	c3                   	ret
10002a84:	90                   	nop
10002a85:	90                   	nop
10002a86:	90                   	nop
10002a87:	90                   	nop
10002a88:	90                   	nop
10002a89:	90                   	nop
10002a8a:	90                   	nop
10002a8b:	90                   	nop
10002a8c:	90                   	nop
10002a8d:	90                   	nop
10002a8e:	90                   	nop
10002a8f:	90                   	nop
10002a90:	83 ec 08             	sub    $0x8,%esp
10002a93:	53                   	push   %ebx
10002a94:	55                   	push   %ebp
10002a95:	56                   	push   %esi
10002a96:	8b f1                	mov    %ecx,%esi
10002a98:	8b 46 0c             	mov    0xc(%esi),%eax
10002a9b:	57                   	push   %edi
10002a9c:	8b 7e 24             	mov    0x24(%esi),%edi
10002a9f:	c1 e8 02             	shr    $0x2,%eax
10002aa2:	3b f8                	cmp    %eax,%edi
10002aa4:	0f 87 52 01 00 00    	ja     0x10002bfc
10002aaa:	8b 56 14             	mov    0x14(%esi),%edx
10002aad:	85 d2                	test   %edx,%edx
10002aaf:	8d 4e 10             	lea    0x10(%esi),%ecx
10002ab2:	75 04                	jne    0x10002ab8
10002ab4:	33 c0                	xor    %eax,%eax
10002ab6:	eb 08                	jmp    0x10002ac0
10002ab8:	8b 41 08             	mov    0x8(%ecx),%eax
10002abb:	2b c2                	sub    %edx,%eax
10002abd:	c1 f8 02             	sar    $0x2,%eax
10002ac0:	48                   	dec    %eax
10002ac1:	3b c7                	cmp    %edi,%eax
10002ac3:	77 29                	ja     0x10002aee
10002ac5:	8b 51 04             	mov    0x4(%ecx),%edx
10002ac8:	85 d2                	test   %edx,%edx
10002aca:	75 04                	jne    0x10002ad0
10002acc:	33 c0                	xor    %eax,%eax
10002ace:	eb 08                	jmp    0x10002ad8
10002ad0:	8b 41 08             	mov    0x8(%ecx),%eax
10002ad3:	2b c2                	sub    %edx,%eax
10002ad5:	c1 f8 02             	sar    $0x2,%eax
10002ad8:	8b 56 08             	mov    0x8(%esi),%edx
10002adb:	8d 44 00 fd          	lea    -0x3(%eax,%eax,1),%eax
10002adf:	89 46 20             	mov    %eax,0x20(%esi)
10002ae2:	52                   	push   %edx
10002ae3:	83 c0 02             	add    $0x2,%eax
10002ae6:	50                   	push   %eax
10002ae7:	e8 24 fd ff ff       	call   0x10002810
10002aec:	eb 0e                	jmp    0x10002afc
10002aee:	8b 46 20             	mov    0x20(%esi),%eax
10002af1:	3b c7                	cmp    %edi,%eax
10002af3:	73 07                	jae    0x10002afc
10002af5:	8d 4c 00 01          	lea    0x1(%eax,%eax,1),%ecx
10002af9:	89 4e 20             	mov    %ecx,0x20(%esi)
10002afc:	8b 46 20             	mov    0x20(%esi),%eax
10002aff:	8b 56 24             	mov    0x24(%esi),%edx
10002b02:	8b 4e 14             	mov    0x14(%esi),%ecx
10002b05:	d1 e8                	shr    $1,%eax
10002b07:	2b d0                	sub    %eax,%edx
10002b09:	4a                   	dec    %edx
10002b0a:	8b 3c 91             	mov    (%ecx,%edx,4),%edi
10002b0d:	8d 04 91             	lea    (%ecx,%edx,4),%eax
10002b10:	3b 78 04             	cmp    0x4(%eax),%edi
10002b13:	89 54 24 10          	mov    %edx,0x10(%esp)
10002b17:	0f 84 dc 00 00 00    	je     0x10002bf9
10002b1d:	8d 49 00             	lea    0x0(%ecx),%ecx
10002b20:	8b 47 08             	mov    0x8(%edi),%eax
10002b23:	23 46 20             	and    0x20(%esi),%eax
10002b26:	3b c2                	cmp    %edx,%eax
10002b28:	75 07                	jne    0x10002b31
10002b2a:	8b 3f                	mov    (%edi),%edi
10002b2c:	e9 bb 00 00 00       	jmp    0x10002bec
10002b31:	8b 46 24             	mov    0x24(%esi),%eax
10002b34:	3b d0                	cmp    %eax,%edx
10002b36:	73 1d                	jae    0x10002b55
10002b38:	eb 06                	jmp    0x10002b40
10002b3a:	8d 9b 00 00 00 00    	lea    0x0(%ebx),%ebx
10002b40:	8b 4e 14             	mov    0x14(%esi),%ecx
10002b43:	8b 1c 81             	mov    (%ecx,%eax,4),%ebx
10002b46:	3b 5e 08             	cmp    0x8(%esi),%ebx
10002b49:	8d 0c 81             	lea    (%ecx,%eax,4),%ecx
10002b4c:	75 07                	jne    0x10002b55
10002b4e:	48                   	dec    %eax
10002b4f:	3b d0                	cmp    %eax,%edx
10002b51:	89 39                	mov    %edi,(%ecx)
10002b53:	72 eb                	jb     0x10002b40
10002b55:	8b 07                	mov    (%edi),%eax
10002b57:	3b 46 08             	cmp    0x8(%esi),%eax
10002b5a:	89 44 24 14          	mov    %eax,0x14(%esp)
10002b5e:	0f 84 95 00 00 00    	je     0x10002bf9
10002b64:	8b 4e 14             	mov    0x14(%esi),%ecx
10002b67:	3b 3c 91             	cmp    (%ecx,%edx,4),%edi
10002b6a:	8b c2                	mov    %edx,%eax
10002b6c:	75 1f                	jne    0x10002b8d
10002b6e:	8b ff                	mov    %edi,%edi
10002b70:	85 c0                	test   %eax,%eax
10002b72:	8b 4e 14             	mov    0x14(%esi),%ecx
10002b75:	8b 1c 81             	mov    (%ecx,%eax,4),%ebx
10002b78:	8b 1b                	mov    (%ebx),%ebx
10002b7a:	8d 0c 81             	lea    (%ecx,%eax,4),%ecx
10002b7d:	89 19                	mov    %ebx,(%ecx)
10002b7f:	74 0c                	je     0x10002b8d
10002b81:	8b 4e 14             	mov    0x14(%esi),%ecx
10002b84:	8b 5c 81 fc          	mov    -0x4(%ecx,%eax,4),%ebx
10002b88:	48                   	dec    %eax
10002b89:	3b fb                	cmp    %ebx,%edi
10002b8b:	74 e3                	je     0x10002b70
10002b8d:	8b 46 08             	mov    0x8(%esi),%eax
10002b90:	3b f8                	cmp    %eax,%edi
10002b92:	8b 5e 08             	mov    0x8(%esi),%ebx
10002b95:	8d 4e 04             	lea    0x4(%esi),%ecx
10002b98:	74 41                	je     0x10002bdb
10002b9a:	3b df                	cmp    %edi,%ebx
10002b9c:	74 3d                	je     0x10002bdb
10002b9e:	8b 2f                	mov    (%edi),%ebp
10002ba0:	3b dd                	cmp    %ebp,%ebx
10002ba2:	74 37                	je     0x10002bdb
10002ba4:	3b c9                	cmp    %ecx,%ecx
10002ba6:	74 12                	je     0x10002bba
10002ba8:	6a 01                	push   $0x1
10002baa:	e8 91 f8 ff ff       	call   0x10002440
10002baf:	8b 46 0c             	mov    0xc(%esi),%eax
10002bb2:	8b 54 24 10          	mov    0x10(%esp),%edx
10002bb6:	48                   	dec    %eax
10002bb7:	89 46 0c             	mov    %eax,0xc(%esi)
10002bba:	8b 47 04             	mov    0x4(%edi),%eax
10002bbd:	89 28                	mov    %ebp,(%eax)
10002bbf:	8b 4d 04             	mov    0x4(%ebp),%ecx
10002bc2:	89 19                	mov    %ebx,(%ecx)
10002bc4:	8b 43 04             	mov    0x4(%ebx),%eax
10002bc7:	89 38                	mov    %edi,(%eax)
10002bc9:	8b 4d 04             	mov    0x4(%ebp),%ecx
10002bcc:	8b 43 04             	mov    0x4(%ebx),%eax
10002bcf:	89 4b 04             	mov    %ecx,0x4(%ebx)
10002bd2:	8b 4f 04             	mov    0x4(%edi),%ecx
10002bd5:	89 4d 04             	mov    %ecx,0x4(%ebp)
10002bd8:	89 47 04             	mov    %eax,0x4(%edi)
10002bdb:	8b 46 24             	mov    0x24(%esi),%eax
10002bde:	8b 4e 14             	mov    0x14(%esi),%ecx
10002be1:	8b 5e 08             	mov    0x8(%esi),%ebx
10002be4:	8b 7c 24 14          	mov    0x14(%esp),%edi
10002be8:	89 5c 81 04          	mov    %ebx,0x4(%ecx,%eax,4)
10002bec:	8b 46 14             	mov    0x14(%esi),%eax
10002bef:	3b 7c 90 04          	cmp    0x4(%eax,%edx,4),%edi
10002bf3:	0f 85 27 ff ff ff    	jne    0x10002b20
10002bf9:	ff 46 24             	incl   0x24(%esi)
10002bfc:	8b 6c 24 20          	mov    0x20(%esp),%ebp
10002c00:	8b 55 00             	mov    0x0(%ebp),%edx
10002c03:	8b 4e 20             	mov    0x20(%esi),%ecx
10002c06:	8b 7e 24             	mov    0x24(%esi),%edi
10002c09:	8b c2                	mov    %edx,%eax
10002c0b:	23 c1                	and    %ecx,%eax
10002c0d:	3b f8                	cmp    %eax,%edi
10002c0f:	77 09                	ja     0x10002c1a
10002c11:	d1 e9                	shr    $1,%ecx
10002c13:	83 cf ff             	or     $0xffffffff,%edi
10002c16:	2b f9                	sub    %ecx,%edi
10002c18:	03 c7                	add    %edi,%eax
10002c1a:	8b 4e 14             	mov    0x14(%esi),%ecx
10002c1d:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
10002c24:	8b 7c 19 04          	mov    0x4(%ecx,%ebx,1),%edi
10002c28:	89 44 24 20          	mov    %eax,0x20(%esp)
10002c2c:	8d 04 19             	lea    (%ecx,%ebx,1),%eax
10002c2f:	3b 38                	cmp    (%eax),%edi
10002c31:	74 10                	je     0x10002c43
10002c33:	8b 7f 04             	mov    0x4(%edi),%edi
10002c36:	39 57 08             	cmp    %edx,0x8(%edi)
10002c39:	7e 6b                	jle    0x10002ca6
10002c3b:	8b 46 14             	mov    0x14(%esi),%eax
10002c3e:	3b 3c 03             	cmp    (%ebx,%eax,1),%edi
10002c41:	75 f0                	jne    0x10002c33
10002c43:	8b 57 04             	mov    0x4(%edi),%edx
10002c46:	55                   	push   %ebp
10002c47:	52                   	push   %edx
10002c48:	8d 4e 04             	lea    0x4(%esi),%ecx
10002c4b:	57                   	push   %edi
10002c4c:	e8 ff f5 ff ff       	call   0x10002250
10002c51:	6a 01                	push   $0x1
10002c53:	8d 4e 04             	lea    0x4(%esi),%ecx
10002c56:	8b e8                	mov    %eax,%ebp
10002c58:	e8 e3 f7 ff ff       	call   0x10002440
10002c5d:	89 6f 04             	mov    %ebp,0x4(%edi)
10002c60:	8b 45 04             	mov    0x4(%ebp),%eax
10002c63:	89 28                	mov    %ebp,(%eax)
10002c65:	8b 56 14             	mov    0x14(%esi),%edx
10002c68:	3b 3c 13             	cmp    (%ebx,%edx,1),%edi
10002c6b:	8b 4f 04             	mov    0x4(%edi),%ecx
10002c6e:	75 22                	jne    0x10002c92
10002c70:	8b 46 14             	mov    0x14(%esi),%eax
10002c73:	89 0c 03             	mov    %ecx,(%ebx,%eax,1)
10002c76:	8b 44 24 20          	mov    0x20(%esp),%eax
10002c7a:	85 c0                	test   %eax,%eax
10002c7c:	74 14                	je     0x10002c92
10002c7e:	8b 56 14             	mov    0x14(%esi),%edx
10002c81:	48                   	dec    %eax
10002c82:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
10002c89:	89 44 24 20          	mov    %eax,0x20(%esp)
10002c8d:	3b 3c 13             	cmp    (%ebx,%edx,1),%edi
10002c90:	74 de                	je     0x10002c70
10002c92:	8b 44 24 1c          	mov    0x1c(%esp),%eax
10002c96:	5f                   	pop    %edi
10002c97:	5e                   	pop    %esi
10002c98:	5d                   	pop    %ebp
10002c99:	89 08                	mov    %ecx,(%eax)
10002c9b:	c6 40 04 01          	movb   $0x1,0x4(%eax)
10002c9f:	5b                   	pop    %ebx
10002ca0:	83 c4 08             	add    $0x8,%esp
10002ca3:	c2 08 00             	ret    $0x8
10002ca6:	7d 04                	jge    0x10002cac
10002ca8:	8b 3f                	mov    (%edi),%edi
10002caa:	eb 97                	jmp    0x10002c43
10002cac:	8b 44 24 1c          	mov    0x1c(%esp),%eax
10002cb0:	89 38                	mov    %edi,(%eax)
10002cb2:	5f                   	pop    %edi
10002cb3:	5e                   	pop    %esi
10002cb4:	5d                   	pop    %ebp
10002cb5:	c6 40 04 00          	movb   $0x0,0x4(%eax)
10002cb9:	5b                   	pop    %ebx
10002cba:	83 c4 08             	add    $0x8,%esp
10002cbd:	c2 08 00             	ret    $0x8
10002cc0:	6a ff                	push   $0xffffffff
10002cc2:	68 1b b2 00 10       	push   $0x1000b21b
10002cc7:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10002ccd:	50                   	push   %eax
10002cce:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10002cd5:	51                   	push   %ecx
10002cd6:	6a 3c                	push   $0x3c
10002cd8:	e8 33 28 00 00       	call   0x10005510
10002cdd:	83 c4 04             	add    $0x4,%esp
10002ce0:	89 44 24 00          	mov    %eax,0x0(%esp)
10002ce4:	85 c0                	test   %eax,%eax
10002ce6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
10002ced:	00 
10002cee:	74 16                	je     0x10002d06
10002cf0:	8b c8                	mov    %eax,%ecx
10002cf2:	e8 89 fc ff ff       	call   0x10002980
10002cf7:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10002cfb:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10002d02:	83 c4 10             	add    $0x10,%esp
10002d05:	c3                   	ret
10002d06:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10002d0a:	33 c0                	xor    %eax,%eax
10002d0c:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10002d13:	83 c4 10             	add    $0x10,%esp
10002d16:	c3                   	ret
10002d17:	90                   	nop
10002d18:	90                   	nop
10002d19:	90                   	nop
10002d1a:	90                   	nop
10002d1b:	90                   	nop
10002d1c:	90                   	nop
10002d1d:	90                   	nop
10002d1e:	90                   	nop
10002d1f:	90                   	nop
10002d20:	6a ff                	push   $0xffffffff
10002d22:	68 3b b2 00 10       	push   $0x1000b23b
10002d27:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10002d2d:	50                   	push   %eax
10002d2e:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10002d35:	51                   	push   %ecx
10002d36:	56                   	push   %esi
10002d37:	8b f1                	mov    %ecx,%esi
10002d39:	57                   	push   %edi
10002d3a:	89 74 24 08          	mov    %esi,0x8(%esp)
10002d3e:	c7 06 b4 c1 00 10    	movl   $0x1000c1b4,(%esi)
10002d44:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
10002d4b:	00 
10002d4c:	e8 ef fc ff ff       	call   0x10002a40
10002d51:	8b 7e 38             	mov    0x38(%esi),%edi
10002d54:	85 ff                	test   %edi,%edi
10002d56:	74 1d                	je     0x10002d75
10002d58:	8b 47 0c             	mov    0xc(%edi),%eax
10002d5b:	50                   	push   %eax
10002d5c:	ff 15 04 c0 00 10    	call   *0x1000c004  ; 0x1000c004=KERNEL32.dll!GlobalUnlock
10002d62:	8b 4f 0c             	mov    0xc(%edi),%ecx
10002d65:	51                   	push   %ecx
10002d66:	ff 15 00 c0 00 10    	call   *0x1000c000  ; 0x1000c000=KERNEL32.dll!GlobalFree
10002d6c:	57                   	push   %edi
10002d6d:	e8 6b 2c 00 00       	call   0x100059dd
10002d72:	83 c4 04             	add    $0x4,%esp
10002d75:	8d 4e 10             	lea    0x10(%esi),%ecx
10002d78:	e8 f3 0e 00 00       	call   0x10003c70
10002d7d:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
10002d81:	5f                   	pop    %edi
10002d82:	5e                   	pop    %esi
10002d83:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10002d8a:	83 c4 10             	add    $0x10,%esp
10002d8d:	c3                   	ret
10002d8e:	90                   	nop
10002d8f:	90                   	nop
10002d90:	83 ec 24             	sub    $0x24,%esp
10002d93:	56                   	push   %esi
10002d94:	8b f1                	mov    %ecx,%esi
10002d96:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
10002d9a:	8d 44 24 0c          	lea    0xc(%esp),%eax
10002d9e:	50                   	push   %eax
10002d9f:	51                   	push   %ecx
10002da0:	8d 4c 24 20          	lea    0x20(%esp),%ecx
10002da4:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
10002dab:	00 
10002dac:	e8 1f f4 ff ff       	call   0x100021d0
10002db1:	50                   	push   %eax
10002db2:	8d 54 24 08          	lea    0x8(%esp),%edx
10002db6:	52                   	push   %edx
10002db7:	8b ce                	mov    %esi,%ecx
10002db9:	e8 d2 fc ff ff       	call   0x10002a90
10002dbe:	8b 00                	mov    (%eax),%eax
10002dc0:	83 c0 0c             	add    $0xc,%eax
10002dc3:	5e                   	pop    %esi
10002dc4:	83 c4 24             	add    $0x24,%esp
10002dc7:	c2 04 00             	ret    $0x4
10002dca:	90                   	nop
10002dcb:	90                   	nop
10002dcc:	90                   	nop
10002dcd:	90                   	nop
10002dce:	90                   	nop
10002dcf:	90                   	nop
10002dd0:	83 ec 1c             	sub    $0x1c,%esp
10002dd3:	56                   	push   %esi
10002dd4:	57                   	push   %edi
10002dd5:	8b f9                	mov    %ecx,%edi
10002dd7:	8d 44 24 28          	lea    0x28(%esp),%eax
10002ddb:	50                   	push   %eax
10002ddc:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
10002de0:	8d 77 10             	lea    0x10(%edi),%esi
10002de3:	51                   	push   %ecx
10002de4:	8b ce                	mov    %esi,%ecx
10002de6:	e8 65 07 00 00       	call   0x10003550
10002deb:	8b 54 24 08          	mov    0x8(%esp),%edx
10002def:	3b 57 18             	cmp    0x18(%edi),%edx
10002df2:	75 54                	jne    0x10002e48
10002df4:	8b 44 24 28          	mov    0x28(%esp),%eax
10002df8:	8d 4c 24 08          	lea    0x8(%esp),%ecx
10002dfc:	51                   	push   %ecx
10002dfd:	8d 54 24 2c          	lea    0x2c(%esp),%edx
10002e01:	52                   	push   %edx
10002e02:	8d 4c 24 1c          	lea    0x1c(%esp),%ecx
10002e06:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
10002e0d:	00 
10002e0e:	89 44 24 18          	mov    %eax,0x18(%esp)
10002e12:	e8 b9 f3 ff ff       	call   0x100021d0
10002e17:	50                   	push   %eax
10002e18:	8d 44 24 0c          	lea    0xc(%esp),%eax
10002e1c:	50                   	push   %eax
10002e1d:	8b ce                	mov    %esi,%ecx
10002e1f:	e8 6c fc ff ff       	call   0x10002a90
10002e24:	8d 4c 24 28          	lea    0x28(%esp),%ecx
10002e28:	51                   	push   %ecx
10002e29:	8b ce                	mov    %esi,%ecx
10002e2b:	e8 60 ff ff ff       	call   0x10002d90
10002e30:	8b 54 24 2c          	mov    0x2c(%esp),%edx
10002e34:	6a 01                	push   $0x1
10002e36:	52                   	push   %edx
10002e37:	8b c8                	mov    %eax,%ecx
10002e39:	e8 62 26 00 00       	call   0x100054a0
10002e3e:	5f                   	pop    %edi
10002e3f:	b0 01                	mov    $0x1,%al
10002e41:	5e                   	pop    %esi
10002e42:	83 c4 1c             	add    $0x1c,%esp
10002e45:	c2 08 00             	ret    $0x8
10002e48:	5f                   	pop    %edi
10002e49:	32 c0                	xor    %al,%al
10002e4b:	5e                   	pop    %esi
10002e4c:	83 c4 1c             	add    $0x1c,%esp
10002e4f:	c2 08 00             	ret    $0x8
10002e52:	90                   	nop
10002e53:	90                   	nop
10002e54:	90                   	nop
10002e55:	90                   	nop
10002e56:	90                   	nop
10002e57:	90                   	nop
10002e58:	90                   	nop
10002e59:	90                   	nop
10002e5a:	90                   	nop
10002e5b:	90                   	nop
10002e5c:	90                   	nop
10002e5d:	90                   	nop
10002e5e:	90                   	nop
10002e5f:	90                   	nop
10002e60:	56                   	push   %esi
10002e61:	8b f1                	mov    %ecx,%esi
10002e63:	85 f6                	test   %esi,%esi
10002e65:	74 0e                	je     0x10002e75
10002e67:	e8 b4 fe ff ff       	call   0x10002d20
10002e6c:	56                   	push   %esi
10002e6d:	e8 6b 2b 00 00       	call   0x100059dd
10002e72:	83 c4 04             	add    $0x4,%esp
10002e75:	5e                   	pop    %esi
10002e76:	c3                   	ret
10002e77:	90                   	nop
10002e78:	90                   	nop
10002e79:	90                   	nop
10002e7a:	90                   	nop
10002e7b:	90                   	nop
10002e7c:	90                   	nop
10002e7d:	90                   	nop
10002e7e:	90                   	nop
10002e7f:	90                   	nop
10002e80:	8b 44 24 04          	mov    0x4(%esp),%eax
10002e84:	3d 6f d4 4c e3       	cmp    $0xe34cd46f,%eax
10002e89:	53                   	push   %ebx
10002e8a:	56                   	push   %esi
10002e8b:	8b d9                	mov    %ecx,%ebx
10002e8d:	0f 87 2c 01 00 00    	ja     0x10002fbf
10002e93:	0f 84 06 01 00 00    	je     0x10002f9f
10002e99:	3d 55 56 5b 02       	cmp    $0x25b5655,%eax
10002e9e:	0f 84 d5 00 00 00    	je     0x10002f79
10002ea4:	3d 49 ad 5b b2       	cmp    $0xb25bad49,%eax
10002ea9:	0f 85 17 01 00 00    	jne    0x10002fc6
10002eaf:	8b 74 24 10          	mov    0x10(%esp),%esi
10002eb3:	8b 46 04             	mov    0x4(%esi),%eax
10002eb6:	80 38 02             	cmpb   $0x2,(%eax)
10002eb9:	0f 85 a4 01 00 00    	jne    0x10003063
10002ebf:	6a 00                	push   $0x0
10002ec1:	8b ce                	mov    %esi,%ecx
10002ec3:	e8 38 e4 ff ff       	call   0x10001300
10002ec8:	83 f8 21             	cmp    $0x21,%eax
10002ecb:	74 2e                	je     0x10002efb
10002ecd:	6a 00                	push   $0x0
10002ecf:	8b ce                	mov    %esi,%ecx
10002ed1:	e8 2a e4 ff ff       	call   0x10001300
10002ed6:	83 f8 11             	cmp    $0x11,%eax
10002ed9:	74 20                	je     0x10002efb
10002edb:	6a 00                	push   $0x0
10002edd:	8b ce                	mov    %esi,%ecx
10002edf:	e8 1c e4 ff ff       	call   0x10001300
10002ee4:	83 f8 01             	cmp    $0x1,%eax
10002ee7:	74 12                	je     0x10002efb
10002ee9:	6a 00                	push   $0x0
10002eeb:	8b ce                	mov    %esi,%ecx
10002eed:	e8 0e e4 ff ff       	call   0x10001300
10002ef2:	83 f8 31             	cmp    $0x31,%eax
10002ef5:	0f 85 68 01 00 00    	jne    0x10003063
10002efb:	6a 01                	push   $0x1
10002efd:	8b ce                	mov    %esi,%ecx
10002eff:	e8 fc e3 ff ff       	call   0x10001300
10002f04:	83 f8 21             	cmp    $0x21,%eax
10002f07:	74 2e                	je     0x10002f37
10002f09:	6a 01                	push   $0x1
10002f0b:	8b ce                	mov    %esi,%ecx
10002f0d:	e8 ee e3 ff ff       	call   0x10001300
10002f12:	83 f8 11             	cmp    $0x11,%eax
10002f15:	74 20                	je     0x10002f37
10002f17:	6a 01                	push   $0x1
10002f19:	8b ce                	mov    %esi,%ecx
10002f1b:	e8 e0 e3 ff ff       	call   0x10001300
10002f20:	83 f8 01             	cmp    $0x1,%eax
10002f23:	74 12                	je     0x10002f37
10002f25:	6a 01                	push   $0x1
10002f27:	8b ce                	mov    %esi,%ecx
10002f29:	e8 d2 e3 ff ff       	call   0x10001300
10002f2e:	83 f8 31             	cmp    $0x31,%eax
10002f31:	0f 85 2c 01 00 00    	jne    0x10003063
10002f37:	57                   	push   %edi
10002f38:	6a 00                	push   $0x0
10002f3a:	8b ce                	mov    %esi,%ecx
10002f3c:	e8 df e3 ff ff       	call   0x10001320
10002f41:	6a 01                	push   $0x1
10002f43:	8b ce                	mov    %esi,%ecx
10002f45:	8b f8                	mov    %eax,%edi
10002f47:	e8 d4 e3 ff ff       	call   0x10001320
10002f4c:	50                   	push   %eax
10002f4d:	57                   	push   %edi
10002f4e:	8b cb                	mov    %ebx,%ecx
10002f50:	e8 5b f4 ff ff       	call   0x100023b0
10002f55:	8b 4e 04             	mov    0x4(%esi),%ecx
10002f58:	c6 01 00             	movb   $0x0,(%ecx)
10002f5b:	8b 56 08             	mov    0x8(%esi),%edx
10002f5e:	0f b6 c0             	movzbl %al,%eax
10002f61:	50                   	push   %eax
10002f62:	8b ce                	mov    %esi,%ecx
10002f64:	66 c7 02 03 00       	movw   $0x3,(%edx)
10002f69:	e8 d2 e1 ff ff       	call   0x10001140
10002f6e:	5f                   	pop    %edi
10002f6f:	5e                   	pop    %esi
10002f70:	b8 01 00 00 00       	mov    $0x1,%eax
10002f75:	5b                   	pop    %ebx
10002f76:	c2 08 00             	ret    $0x8
10002f79:	8b 4c 24 10          	mov    0x10(%esp),%ecx
10002f7d:	8b 51 04             	mov    0x4(%ecx),%edx
10002f80:	c6 02 00             	movb   $0x0,(%edx)
10002f83:	8b 41 08             	mov    0x8(%ecx),%eax
10002f86:	68 c8 c1 00 10       	push   $0x1000c1c8  ; 0x1000c1c8='dll_CPacManCoinSys'
10002f8b:	66 c7 00 03 00       	movw   $0x3,(%eax)
10002f90:	e8 8b e2 ff ff       	call   0x10001220
10002f95:	5e                   	pop    %esi
10002f96:	b8 01 00 00 00       	mov    $0x1,%eax
10002f9b:	5b                   	pop    %ebx
10002f9c:	c2 08 00             	ret    $0x8
10002f9f:	8b cb                	mov    %ebx,%ecx
10002fa1:	e8 9a fa ff ff       	call   0x10002a40
10002fa6:	8b 44 24 10          	mov    0x10(%esp),%eax
10002faa:	8b 48 04             	mov    0x4(%eax),%ecx
10002fad:	c6 01 00             	movb   $0x0,(%ecx)
10002fb0:	8b 50 08             	mov    0x8(%eax),%edx
10002fb3:	5e                   	pop    %esi
10002fb4:	66 c7 02 03 00       	movw   $0x3,(%edx)
10002fb9:	33 c0                	xor    %eax,%eax
10002fbb:	5b                   	pop    %ebx
10002fbc:	c2 08 00             	ret    $0x8
10002fbf:	3d 9d ce 62 ee       	cmp    $0xee62ce9d,%eax
10002fc4:	74 0a                	je     0x10002fd0
10002fc6:	5e                   	pop    %esi
10002fc7:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
10002fcc:	5b                   	pop    %ebx
10002fcd:	c2 08 00             	ret    $0x8
10002fd0:	8b 74 24 10          	mov    0x10(%esp),%esi
10002fd4:	8b 46 04             	mov    0x4(%esi),%eax
10002fd7:	80 38 02             	cmpb   $0x2,(%eax)
10002fda:	0f 85 83 00 00 00    	jne    0x10003063
10002fe0:	8b 06                	mov    (%esi),%eax
10002fe2:	83 c0 03             	add    $0x3,%eax
10002fe5:	85 c0                	test   %eax,%eax
10002fe7:	74 14                	je     0x10002ffd
10002fe9:	0f be 08             	movsbl (%eax),%ecx
10002fec:	83 f9 21             	cmp    $0x21,%ecx
10002fef:	74 28                	je     0x10003019
10002ff1:	85 c0                	test   %eax,%eax
10002ff3:	74 08                	je     0x10002ffd
10002ff5:	0f be 00             	movsbl (%eax),%eax
10002ff8:	83 f8 11             	cmp    $0x11,%eax
10002ffb:	74 1c                	je     0x10003019
10002ffd:	6a 00                	push   $0x0
10002fff:	8b ce                	mov    %esi,%ecx
10003001:	e8 fa e2 ff ff       	call   0x10001300
10003006:	83 f8 01             	cmp    $0x1,%eax
10003009:	74 0e                	je     0x10003019
1000300b:	6a 00                	push   $0x0
1000300d:	8b ce                	mov    %esi,%ecx
1000300f:	e8 ec e2 ff ff       	call   0x10001300
10003014:	83 f8 31             	cmp    $0x31,%eax
10003017:	75 4a                	jne    0x10003063
10003019:	6a 01                	push   $0x1
1000301b:	8b ce                	mov    %esi,%ecx
1000301d:	e8 5e e0 ff ff       	call   0x10001080
10003022:	85 c0                	test   %eax,%eax
10003024:	74 3d                	je     0x10003063
10003026:	0f be 00             	movsbl (%eax),%eax
10003029:	83 f8 05             	cmp    $0x5,%eax
1000302c:	75 35                	jne    0x10003063
1000302e:	6a 00                	push   $0x0
10003030:	8b ce                	mov    %esi,%ecx
10003032:	e8 e9 e2 ff ff       	call   0x10001320
10003037:	56                   	push   %esi
10003038:	50                   	push   %eax
10003039:	8b cb                	mov    %ebx,%ecx
1000303b:	e8 90 fd ff ff       	call   0x10002dd0
10003040:	8b 4e 04             	mov    0x4(%esi),%ecx
10003043:	c6 01 00             	movb   $0x0,(%ecx)
10003046:	8b 56 08             	mov    0x8(%esi),%edx
10003049:	0f b6 c0             	movzbl %al,%eax
1000304c:	50                   	push   %eax
1000304d:	8b ce                	mov    %esi,%ecx
1000304f:	66 c7 02 03 00       	movw   $0x3,(%edx)
10003054:	e8 e7 e0 ff ff       	call   0x10001140
10003059:	5e                   	pop    %esi
1000305a:	b8 01 00 00 00       	mov    $0x1,%eax
1000305f:	5b                   	pop    %ebx
10003060:	c2 08 00             	ret    $0x8
10003063:	5e                   	pop    %esi
10003064:	83 c8 ff             	or     $0xffffffff,%eax
10003067:	5b                   	pop    %ebx
10003068:	c2 08 00             	ret    $0x8
1000306b:	90                   	nop
1000306c:	90                   	nop
1000306d:	90                   	nop
1000306e:	90                   	nop
1000306f:	90                   	nop
10003070:	8b 44 24 04          	mov    0x4(%esp),%eax
10003074:	50                   	push   %eax
10003075:	e8 06 e0 ff ff       	call   0x10001080
1000307a:	8a 08                	mov    (%eax),%cl
1000307c:	80 f9 02             	cmp    $0x2,%cl
1000307f:	75 06                	jne    0x10003087
10003081:	83 c0 05             	add    $0x5,%eax
10003084:	c2 04 00             	ret    $0x4
10003087:	80 f9 22             	cmp    $0x22,%cl
1000308a:	75 06                	jne    0x10003092
1000308c:	83 c0 02             	add    $0x2,%eax
1000308f:	c2 04 00             	ret    $0x4
10003092:	80 f9 12             	cmp    $0x12,%cl
10003095:	75 04                	jne    0x1000309b
10003097:	40                   	inc    %eax
10003098:	c2 04 00             	ret    $0x4
1000309b:	33 c0                	xor    %eax,%eax
1000309d:	c2 04 00             	ret    $0x4
100030a0:	83 ec 14             	sub    $0x14,%esp
100030a3:	53                   	push   %ebx
100030a4:	8b 59 28             	mov    0x28(%ecx),%ebx
100030a7:	55                   	push   %ebp
100030a8:	56                   	push   %esi
100030a9:	57                   	push   %edi
100030aa:	33 f6                	xor    %esi,%esi
100030ac:	8d b9 68 0d 00 00    	lea    0xd68(%ecx),%edi
100030b2:	8b 47 10             	mov    0x10(%edi),%eax
100030b5:	8b 91 04 04 00 00    	mov    0x404(%ecx),%edx
100030bb:	2b c3                	sub    %ebx,%eax
100030bd:	03 c2                	add    %edx,%eax
100030bf:	99                   	cltd
100030c0:	8b e8                	mov    %eax,%ebp
100030c2:	8b 81 00 04 00 00    	mov    0x400(%ecx),%eax
100030c8:	33 ea                	xor    %edx,%ebp
100030ca:	2b ea                	sub    %edx,%ebp
100030cc:	2b 41 24             	sub    0x24(%ecx),%eax
100030cf:	03 07                	add    (%edi),%eax
100030d1:	99                   	cltd
100030d2:	33 c2                	xor    %edx,%eax
100030d4:	2b c2                	sub    %edx,%eax
100030d6:	03 e8                	add    %eax,%ebp
100030d8:	89 6c b4 14          	mov    %ebp,0x14(%esp,%esi,4)
100030dc:	46                   	inc    %esi
100030dd:	83 c7 04             	add    $0x4,%edi
100030e0:	83 fe 04             	cmp    $0x4,%esi
100030e3:	7c cd                	jl     0x100030b2
100030e5:	8b 5c 24 14          	mov    0x14(%esp),%ebx
100030e9:	ba 1f 00 00 00       	mov    $0x1f,%edx
100030ee:	3b da                	cmp    %edx,%ebx
100030f0:	7f 09                	jg     0x100030fb
100030f2:	b8 01 00 00 00       	mov    $0x1,%eax
100030f7:	8b d3                	mov    %ebx,%edx
100030f9:	eb 04                	jmp    0x100030ff
100030fb:	8b 44 24 14          	mov    0x14(%esp),%eax
100030ff:	8b 6c 24 18          	mov    0x18(%esp),%ebp
10003103:	3b ea                	cmp    %edx,%ebp
10003105:	7f 07                	jg     0x1000310e
10003107:	b8 02 00 00 00       	mov    $0x2,%eax
1000310c:	8b d5                	mov    %ebp,%edx
1000310e:	8b 74 24 1c          	mov    0x1c(%esp),%esi
10003112:	3b f2                	cmp    %edx,%esi
10003114:	7f 07                	jg     0x1000311d
10003116:	b8 03 00 00 00       	mov    $0x3,%eax
1000311b:	8b d6                	mov    %esi,%edx
1000311d:	39 54 24 20          	cmp    %edx,0x20(%esp)
10003121:	7f 05                	jg     0x10003128
10003123:	b8 04 00 00 00       	mov    $0x4,%eax
10003128:	8b 91 fc 03 00 00    	mov    0x3fc(%ecx),%edx
1000312e:	8a 8c 0a 08 04 00 00 	mov    0x408(%edx,%ecx,1),%cl
10003135:	84 c9                	test   %cl,%cl
10003137:	0f 84 80 01 00 00    	je     0x100032bd
1000313d:	8d 70 ff             	lea    -0x1(%eax),%esi
10003140:	85 f6                	test   %esi,%esi
10003142:	ba 1f 00 00 00       	mov    $0x1f,%edx
10003147:	74 0d                	je     0x10003156
10003149:	3b da                	cmp    %edx,%ebx
1000314b:	7f 09                	jg     0x10003156
1000314d:	bf 01 00 00 00       	mov    $0x1,%edi
10003152:	8b d3                	mov    %ebx,%edx
10003154:	eb 04                	jmp    0x1000315a
10003156:	8b 7c 24 18          	mov    0x18(%esp),%edi
1000315a:	83 fe 01             	cmp    $0x1,%esi
1000315d:	74 0b                	je     0x1000316a
1000315f:	3b ea                	cmp    %edx,%ebp
10003161:	7f 07                	jg     0x1000316a
10003163:	bf 02 00 00 00       	mov    $0x2,%edi
10003168:	8b d5                	mov    %ebp,%edx
1000316a:	83 fe 02             	cmp    $0x2,%esi
1000316d:	74 13                	je     0x10003182
1000316f:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
10003173:	3b ea                	cmp    %edx,%ebp
10003175:	7f 07                	jg     0x1000317e
10003177:	bf 03 00 00 00       	mov    $0x3,%edi
1000317c:	8b d5                	mov    %ebp,%edx
1000317e:	8b 6c 24 18          	mov    0x18(%esp),%ebp
10003182:	83 fe 03             	cmp    $0x3,%esi
10003185:	74 0f                	je     0x10003196
10003187:	39 54 24 20          	cmp    %edx,0x20(%esp)
1000318b:	8b 6c 24 18          	mov    0x18(%esp),%ebp
1000318f:	7f 05                	jg     0x10003196
10003191:	bf 04 00 00 00       	mov    $0x4,%edi
10003196:	0f be c9             	movsbl %cl,%ecx
10003199:	3b c8                	cmp    %eax,%ecx
1000319b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
1000319f:	75 0a                	jne    0x100031ab
100031a1:	8b c7                	mov    %edi,%eax
100031a3:	5f                   	pop    %edi
100031a4:	5e                   	pop    %esi
100031a5:	5d                   	pop    %ebp
100031a6:	5b                   	pop    %ebx
100031a7:	83 c4 14             	add    $0x14,%esp
100031aa:	c3                   	ret
100031ab:	85 f6                	test   %esi,%esi
100031ad:	b9 1f 00 00 00       	mov    $0x1f,%ecx
100031b2:	74 14                	je     0x100031c8
100031b4:	8d 47 ff             	lea    -0x1(%edi),%eax
100031b7:	85 c0                	test   %eax,%eax
100031b9:	74 0d                	je     0x100031c8
100031bb:	3b d9                	cmp    %ecx,%ebx
100031bd:	7f 09                	jg     0x100031c8
100031bf:	ba 01 00 00 00       	mov    $0x1,%edx
100031c4:	8b cb                	mov    %ebx,%ecx
100031c6:	eb 04                	jmp    0x100031cc
100031c8:	8b 54 24 1c          	mov    0x1c(%esp),%edx
100031cc:	83 fe 01             	cmp    $0x1,%esi
100031cf:	74 13                	je     0x100031e4
100031d1:	8d 47 ff             	lea    -0x1(%edi),%eax
100031d4:	83 f8 01             	cmp    $0x1,%eax
100031d7:	74 0b                	je     0x100031e4
100031d9:	3b e9                	cmp    %ecx,%ebp
100031db:	7f 07                	jg     0x100031e4
100031dd:	ba 02 00 00 00       	mov    $0x2,%edx
100031e2:	8b cd                	mov    %ebp,%ecx
100031e4:	83 fe 02             	cmp    $0x2,%esi
100031e7:	74 17                	je     0x10003200
100031e9:	8d 47 ff             	lea    -0x1(%edi),%eax
100031ec:	83 f8 02             	cmp    $0x2,%eax
100031ef:	74 0f                	je     0x10003200
100031f1:	8b 44 24 1c          	mov    0x1c(%esp),%eax
100031f5:	3b c1                	cmp    %ecx,%eax
100031f7:	7f 07                	jg     0x10003200
100031f9:	ba 03 00 00 00       	mov    $0x3,%edx
100031fe:	8b c8                	mov    %eax,%ecx
10003200:	83 fe 03             	cmp    $0x3,%esi
10003203:	74 13                	je     0x10003218
10003205:	8d 47 ff             	lea    -0x1(%edi),%eax
10003208:	83 f8 03             	cmp    $0x3,%eax
1000320b:	74 0b                	je     0x10003218
1000320d:	39 4c 24 20          	cmp    %ecx,0x20(%esp)
10003211:	7f 05                	jg     0x10003218
10003213:	ba 04 00 00 00       	mov    $0x4,%edx
10003218:	39 7c 24 10          	cmp    %edi,0x10(%esp)
1000321c:	75 0a                	jne    0x10003228
1000321e:	5f                   	pop    %edi
1000321f:	5e                   	pop    %esi
10003220:	5d                   	pop    %ebp
10003221:	8b c2                	mov    %edx,%eax
10003223:	5b                   	pop    %ebx
10003224:	83 c4 14             	add    $0x14,%esp
10003227:	c3                   	ret
10003228:	85 f6                	test   %esi,%esi
1000322a:	b9 1f 00 00 00       	mov    $0x1f,%ecx
1000322f:	74 1b                	je     0x1000324c
10003231:	8d 47 ff             	lea    -0x1(%edi),%eax
10003234:	85 c0                	test   %eax,%eax
10003236:	74 14                	je     0x1000324c
10003238:	8d 42 ff             	lea    -0x1(%edx),%eax
1000323b:	85 c0                	test   %eax,%eax
1000323d:	74 0d                	je     0x1000324c
1000323f:	3b d9                	cmp    %ecx,%ebx
10003241:	7f 09                	jg     0x1000324c
10003243:	b8 01 00 00 00       	mov    $0x1,%eax
10003248:	8b cb                	mov    %ebx,%ecx
1000324a:	eb 04                	jmp    0x10003250
1000324c:	8b 44 24 20          	mov    0x20(%esp),%eax
10003250:	83 fe 01             	cmp    $0x1,%esi
10003253:	74 1b                	je     0x10003270
10003255:	8d 5f ff             	lea    -0x1(%edi),%ebx
10003258:	83 fb 01             	cmp    $0x1,%ebx
1000325b:	74 13                	je     0x10003270
1000325d:	8d 5a ff             	lea    -0x1(%edx),%ebx
10003260:	83 fb 01             	cmp    $0x1,%ebx
10003263:	74 0b                	je     0x10003270
10003265:	3b e9                	cmp    %ecx,%ebp
10003267:	7f 07                	jg     0x10003270
10003269:	b8 02 00 00 00       	mov    $0x2,%eax
1000326e:	8b cd                	mov    %ebp,%ecx
10003270:	83 fe 02             	cmp    $0x2,%esi
10003273:	74 1f                	je     0x10003294
10003275:	8d 5f ff             	lea    -0x1(%edi),%ebx
10003278:	83 fb 02             	cmp    $0x2,%ebx
1000327b:	74 17                	je     0x10003294
1000327d:	8d 5a ff             	lea    -0x1(%edx),%ebx
10003280:	83 fb 02             	cmp    $0x2,%ebx
10003283:	74 0f                	je     0x10003294
10003285:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
10003289:	3b d9                	cmp    %ecx,%ebx
1000328b:	7f 07                	jg     0x10003294
1000328d:	b8 03 00 00 00       	mov    $0x3,%eax
10003292:	8b cb                	mov    %ebx,%ecx
10003294:	83 fe 03             	cmp    $0x3,%esi
10003297:	74 19                	je     0x100032b2
10003299:	4f                   	dec    %edi
1000329a:	83 ff 03             	cmp    $0x3,%edi
1000329d:	74 13                	je     0x100032b2
1000329f:	8d 72 ff             	lea    -0x1(%edx),%esi
100032a2:	83 fe 03             	cmp    $0x3,%esi
100032a5:	74 0b                	je     0x100032b2
100032a7:	39 4c 24 20          	cmp    %ecx,0x20(%esp)
100032ab:	7f 05                	jg     0x100032b2
100032ad:	b8 04 00 00 00       	mov    $0x4,%eax
100032b2:	39 54 24 10          	cmp    %edx,0x10(%esp)
100032b6:	74 05                	je     0x100032bd
100032b8:	b8 05 00 00 00       	mov    $0x5,%eax
100032bd:	5f                   	pop    %edi
100032be:	5e                   	pop    %esi
100032bf:	5d                   	pop    %ebp
100032c0:	5b                   	pop    %ebx
100032c1:	83 c4 14             	add    $0x14,%esp
100032c4:	c3                   	ret
100032c5:	90                   	nop
100032c6:	90                   	nop
100032c7:	90                   	nop
100032c8:	90                   	nop
100032c9:	90                   	nop
100032ca:	90                   	nop
100032cb:	90                   	nop
100032cc:	90                   	nop
100032cd:	90                   	nop
100032ce:	90                   	nop
100032cf:	90                   	nop
100032d0:	8b 81 fc 03 00 00    	mov    0x3fc(%ecx),%eax
100032d6:	0f be 94 01 07 04 00 	movsbl 0x407(%ecx,%eax,1),%edx
100032dd:	00 
100032de:	8b 94 91 64 0d 00 00 	mov    0xd64(%ecx,%edx,4),%edx
100032e5:	8d 84 01 07 04 00 00 	lea    0x407(%ecx,%eax,1),%eax
100032ec:	56                   	push   %esi
100032ed:	8b b1 00 04 00 00    	mov    0x400(%ecx),%esi
100032f3:	2b f2                	sub    %edx,%esi
100032f5:	89 b1 00 04 00 00    	mov    %esi,0x400(%ecx)
100032fb:	0f be 00             	movsbl (%eax),%eax
100032fe:	8b 94 81 74 0d 00 00 	mov    0xd74(%ecx,%eax,4),%edx
10003305:	8b 81 04 04 00 00    	mov    0x404(%ecx),%eax
1000330b:	2b c2                	sub    %edx,%eax
1000330d:	89 81 04 04 00 00    	mov    %eax,0x404(%ecx)
10003313:	6b c0 0f             	imul   $0xf,%eax,%eax
10003316:	8b d6                	mov    %esi,%edx
10003318:	03 c2                	add    %edx,%eax
1000331a:	32 d2                	xor    %dl,%dl
1000331c:	88 94 08 08 03 00 00 	mov    %dl,0x308(%eax,%ecx,1)
10003323:	8b 81 fc 03 00 00    	mov    0x3fc(%ecx),%eax
10003329:	88 94 01 08 04 00 00 	mov    %dl,0x408(%ecx,%eax,1)
10003330:	ff 89 fc 03 00 00    	decl   0x3fc(%ecx)
10003336:	5e                   	pop    %esi
10003337:	c3                   	ret
10003338:	90                   	nop
10003339:	90                   	nop
1000333a:	90                   	nop
1000333b:	90                   	nop
1000333c:	90                   	nop
1000333d:	90                   	nop
1000333e:	90                   	nop
1000333f:	90                   	nop
10003340:	8d 41 2c             	lea    0x2c(%ecx),%eax
10003343:	c3                   	ret
10003344:	90                   	nop
10003345:	90                   	nop
10003346:	90                   	nop
10003347:	90                   	nop
10003348:	90                   	nop
10003349:	90                   	nop
1000334a:	90                   	nop
1000334b:	90                   	nop
1000334c:	90                   	nop
1000334d:	90                   	nop
1000334e:	90                   	nop
1000334f:	90                   	nop
10003350:	51                   	push   %ecx
10003351:	8b 44 24 10          	mov    0x10(%esp),%eax
10003355:	85 c0                	test   %eax,%eax
10003357:	53                   	push   %ebx
10003358:	55                   	push   %ebp
10003359:	56                   	push   %esi
1000335a:	57                   	push   %edi
1000335b:	8b f9                	mov    %ecx,%edi
1000335d:	89 7c 24 10          	mov    %edi,0x10(%esp)
10003361:	76 4f                	jbe    0x100033b2
10003363:	8b 57 14             	mov    0x14(%edi),%edx
10003366:	8b 74 24 1c          	mov    0x1c(%esp),%esi
1000336a:	3b f2                	cmp    %edx,%esi
1000336c:	73 44                	jae    0x100033b2
1000336e:	8b 4f 18             	mov    0x18(%edi),%ecx
10003371:	83 c7 04             	add    $0x4,%edi
10003374:	83 f9 10             	cmp    $0x10,%ecx
10003377:	72 04                	jb     0x1000337d
10003379:	8b 07                	mov    (%edi),%eax
1000337b:	eb 02                	jmp    0x1000337f
1000337d:	8b c7                	mov    %edi,%eax
1000337f:	83 f9 10             	cmp    $0x10,%ecx
10003382:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
10003385:	72 04                	jb     0x1000338b
10003387:	8b 07                	mov    (%edi),%eax
10003389:	eb 02                	jmp    0x1000338d
1000338b:	8b c7                	mov    %edi,%eax
1000338d:	03 f0                	add    %eax,%esi
1000338f:	3b f3                	cmp    %ebx,%esi
10003391:	73 1f                	jae    0x100033b2
10003393:	8b 6c 24 18          	mov    0x18(%esp),%ebp
10003397:	8b 44 24 20          	mov    0x20(%esp),%eax
1000339b:	0f be 0e             	movsbl (%esi),%ecx
1000339e:	50                   	push   %eax
1000339f:	51                   	push   %ecx
100033a0:	55                   	push   %ebp
100033a1:	e8 5a 2c 00 00       	call   0x10006000
100033a6:	83 c4 0c             	add    $0xc,%esp
100033a9:	85 c0                	test   %eax,%eax
100033ab:	75 10                	jne    0x100033bd
100033ad:	46                   	inc    %esi
100033ae:	3b f3                	cmp    %ebx,%esi
100033b0:	72 e5                	jb     0x10003397
100033b2:	5f                   	pop    %edi
100033b3:	5e                   	pop    %esi
100033b4:	5d                   	pop    %ebp
100033b5:	83 c8 ff             	or     $0xffffffff,%eax
100033b8:	5b                   	pop    %ebx
100033b9:	59                   	pop    %ecx
100033ba:	c2 0c 00             	ret    $0xc
100033bd:	8b 54 24 10          	mov    0x10(%esp),%edx
100033c1:	83 7a 18 10          	cmpl   $0x10,0x18(%edx)
100033c5:	72 02                	jb     0x100033c9
100033c7:	8b 3f                	mov    (%edi),%edi
100033c9:	8b c6                	mov    %esi,%eax
100033cb:	2b c7                	sub    %edi,%eax
100033cd:	5f                   	pop    %edi
100033ce:	5e                   	pop    %esi
100033cf:	5d                   	pop    %ebp
100033d0:	5b                   	pop    %ebx
100033d1:	59                   	pop    %ecx
100033d2:	c2 0c 00             	ret    $0xc
100033d5:	90                   	nop
100033d6:	90                   	nop
100033d7:	90                   	nop
100033d8:	90                   	nop
100033d9:	90                   	nop
100033da:	90                   	nop
100033db:	90                   	nop
100033dc:	90                   	nop
100033dd:	90                   	nop
100033de:	90                   	nop
100033df:	90                   	nop
100033e0:	6a 0c                	push   $0xc
100033e2:	e8 29 21 00 00       	call   0x10005510
100033e7:	83 c4 04             	add    $0x4,%esp
100033ea:	85 c0                	test   %eax,%eax
100033ec:	74 02                	je     0x100033f0
100033ee:	89 00                	mov    %eax,(%eax)
100033f0:	8d 48 04             	lea    0x4(%eax),%ecx
100033f3:	85 c9                	test   %ecx,%ecx
100033f5:	74 02                	je     0x100033f9
100033f7:	89 01                	mov    %eax,(%ecx)
100033f9:	c3                   	ret
100033fa:	90                   	nop
100033fb:	90                   	nop
100033fc:	90                   	nop
100033fd:	90                   	nop
100033fe:	90                   	nop
100033ff:	90                   	nop
10003400:	6a 0c                	push   $0xc
10003402:	e8 09 21 00 00       	call   0x10005510
10003407:	83 c4 04             	add    $0x4,%esp
1000340a:	85 c0                	test   %eax,%eax
1000340c:	74 16                	je     0x10003424
1000340e:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10003412:	8b 54 24 08          	mov    0x8(%esp),%edx
10003416:	89 08                	mov    %ecx,(%eax)
10003418:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
1000341c:	89 50 04             	mov    %edx,0x4(%eax)
1000341f:	8b 11                	mov    (%ecx),%edx
10003421:	89 50 08             	mov    %edx,0x8(%eax)
10003424:	c2 0c 00             	ret    $0xc
10003427:	90                   	nop
10003428:	90                   	nop
10003429:	90                   	nop
1000342a:	90                   	nop
1000342b:	90                   	nop
1000342c:	90                   	nop
1000342d:	90                   	nop
1000342e:	90                   	nop
1000342f:	90                   	nop
10003430:	6a 10                	push   $0x10
10003432:	e8 d9 20 00 00       	call   0x10005510
10003437:	83 c4 04             	add    $0x4,%esp
1000343a:	85 c0                	test   %eax,%eax
1000343c:	74 02                	je     0x10003440
1000343e:	89 00                	mov    %eax,(%eax)
10003440:	8d 48 04             	lea    0x4(%eax),%ecx
10003443:	85 c9                	test   %ecx,%ecx
10003445:	74 02                	je     0x10003449
10003447:	89 01                	mov    %eax,(%ecx)
10003449:	c3                   	ret
1000344a:	90                   	nop
1000344b:	90                   	nop
1000344c:	90                   	nop
1000344d:	90                   	nop
1000344e:	90                   	nop
1000344f:	90                   	nop
10003450:	53                   	push   %ebx
10003451:	8b 5c 24 10          	mov    0x10(%esp),%ebx
10003455:	56                   	push   %esi
10003456:	8b 74 24 10          	mov    0x10(%esp),%esi
1000345a:	3b f3                	cmp    %ebx,%esi
1000345c:	57                   	push   %edi
1000345d:	8b f9                	mov    %ecx,%edi
1000345f:	74 2e                	je     0x1000348f
10003461:	8b 4f 04             	mov    0x4(%edi),%ecx
10003464:	8b c6                	mov    %esi,%eax
10003466:	3b c1                	cmp    %ecx,%eax
10003468:	8b 36                	mov    (%esi),%esi
1000346a:	74 1f                	je     0x1000348b
1000346c:	8b 48 04             	mov    0x4(%eax),%ecx
1000346f:	8b 10                	mov    (%eax),%edx
10003471:	89 11                	mov    %edx,(%ecx)
10003473:	8b 08                	mov    (%eax),%ecx
10003475:	8b 50 04             	mov    0x4(%eax),%edx
10003478:	50                   	push   %eax
10003479:	89 51 04             	mov    %edx,0x4(%ecx)
1000347c:	e8 5c 25 00 00       	call   0x100059dd
10003481:	8b 47 08             	mov    0x8(%edi),%eax
10003484:	83 c4 04             	add    $0x4,%esp
10003487:	48                   	dec    %eax
10003488:	89 47 08             	mov    %eax,0x8(%edi)
1000348b:	3b f3                	cmp    %ebx,%esi
1000348d:	75 d2                	jne    0x10003461
1000348f:	8b 44 24 10          	mov    0x10(%esp),%eax
10003493:	5f                   	pop    %edi
10003494:	89 30                	mov    %esi,(%eax)
10003496:	5e                   	pop    %esi
10003497:	5b                   	pop    %ebx
10003498:	c2 0c 00             	ret    $0xc
1000349b:	90                   	nop
1000349c:	90                   	nop
1000349d:	90                   	nop
1000349e:	90                   	nop
1000349f:	90                   	nop
100034a0:	6a 10                	push   $0x10
100034a2:	e8 69 20 00 00       	call   0x10005510
100034a7:	83 c4 04             	add    $0x4,%esp
100034aa:	85 c0                	test   %eax,%eax
100034ac:	74 1c                	je     0x100034ca
100034ae:	8b 4c 24 04          	mov    0x4(%esp),%ecx
100034b2:	8b 54 24 08          	mov    0x8(%esp),%edx
100034b6:	89 08                	mov    %ecx,(%eax)
100034b8:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
100034bc:	89 50 04             	mov    %edx,0x4(%eax)
100034bf:	8b 11                	mov    (%ecx),%edx
100034c1:	89 50 08             	mov    %edx,0x8(%eax)
100034c4:	8b 49 04             	mov    0x4(%ecx),%ecx
100034c7:	89 48 0c             	mov    %ecx,0xc(%eax)
100034ca:	c2 0c 00             	ret    $0xc
100034cd:	90                   	nop
100034ce:	90                   	nop
100034cf:	90                   	nop
100034d0:	8b 54 24 08          	mov    0x8(%esp),%edx
100034d4:	56                   	push   %esi
100034d5:	8b 72 08             	mov    0x8(%edx),%esi
100034d8:	57                   	push   %edi
100034d9:	8b f9                	mov    %ecx,%edi
100034db:	8b 47 20             	mov    0x20(%edi),%eax
100034de:	8b 4f 24             	mov    0x24(%edi),%ecx
100034e1:	23 f0                	and    %eax,%esi
100034e3:	3b ce                	cmp    %esi,%ecx
100034e5:	77 09                	ja     0x100034f0
100034e7:	d1 e8                	shr    $1,%eax
100034e9:	83 c9 ff             	or     $0xffffffff,%ecx
100034ec:	2b c8                	sub    %eax,%ecx
100034ee:	03 f1                	add    %ecx,%esi
100034f0:	8b 47 14             	mov    0x14(%edi),%eax
100034f3:	8d 0c b5 00 00 00 00 	lea    0x0(,%esi,4),%ecx
100034fa:	53                   	push   %ebx
100034fb:	3b 14 01             	cmp    (%ecx,%eax,1),%edx
100034fe:	75 1c                	jne    0x1000351c
10003500:	85 f6                	test   %esi,%esi
10003502:	8b 1c 01             	mov    (%ecx,%eax,1),%ebx
10003505:	8b 1b                	mov    (%ebx),%ebx
10003507:	89 1c 01             	mov    %ebx,(%ecx,%eax,1)
1000350a:	74 10                	je     0x1000351c
1000350c:	8b 47 14             	mov    0x14(%edi),%eax
1000350f:	4e                   	dec    %esi
10003510:	8d 0c b5 00 00 00 00 	lea    0x0(,%esi,4),%ecx
10003517:	3b 14 01             	cmp    (%ecx,%eax,1),%edx
1000351a:	74 e4                	je     0x10003500
1000351c:	3b 57 08             	cmp    0x8(%edi),%edx
1000351f:	8b 32                	mov    (%edx),%esi
10003521:	5b                   	pop    %ebx
10003522:	74 1d                	je     0x10003541
10003524:	8b 42 04             	mov    0x4(%edx),%eax
10003527:	89 30                	mov    %esi,(%eax)
10003529:	8b 0a                	mov    (%edx),%ecx
1000352b:	8b 42 04             	mov    0x4(%edx),%eax
1000352e:	52                   	push   %edx
1000352f:	89 41 04             	mov    %eax,0x4(%ecx)
10003532:	e8 a6 24 00 00       	call   0x100059dd
10003537:	8b 47 0c             	mov    0xc(%edi),%eax
1000353a:	83 c4 04             	add    $0x4,%esp
1000353d:	48                   	dec    %eax
1000353e:	89 47 0c             	mov    %eax,0xc(%edi)
10003541:	8b 44 24 0c          	mov    0xc(%esp),%eax
10003545:	5f                   	pop    %edi
10003546:	89 30                	mov    %esi,(%eax)
10003548:	5e                   	pop    %esi
10003549:	c2 08 00             	ret    $0x8
1000354c:	90                   	nop
1000354d:	90                   	nop
1000354e:	90                   	nop
1000354f:	90                   	nop
10003550:	51                   	push   %ecx
10003551:	8b 44 24 0c          	mov    0xc(%esp),%eax
10003555:	8b 51 20             	mov    0x20(%ecx),%edx
10003558:	56                   	push   %esi
10003559:	8b 30                	mov    (%eax),%esi
1000355b:	8b c6                	mov    %esi,%eax
1000355d:	57                   	push   %edi
1000355e:	8b 79 24             	mov    0x24(%ecx),%edi
10003561:	23 c2                	and    %edx,%eax
10003563:	3b f8                	cmp    %eax,%edi
10003565:	77 09                	ja     0x10003570
10003567:	d1 ea                	shr    $1,%edx
10003569:	83 cf ff             	or     $0xffffffff,%edi
1000356c:	2b fa                	sub    %edx,%edi
1000356e:	03 c7                	add    %edi,%eax
10003570:	8b 51 14             	mov    0x14(%ecx),%edx
10003573:	8d 14 82             	lea    (%edx,%eax,4),%edx
10003576:	8b 02                	mov    (%edx),%eax
10003578:	8b 52 04             	mov    0x4(%edx),%edx
1000357b:	3b c2                	cmp    %edx,%eax
1000357d:	89 44 24 14          	mov    %eax,0x14(%esp)
10003581:	74 0f                	je     0x10003592
10003583:	39 70 08             	cmp    %esi,0x8(%eax)
10003586:	7d 19                	jge    0x100035a1
10003588:	8b 00                	mov    (%eax),%eax
1000358a:	3b c2                	cmp    %edx,%eax
1000358c:	75 f5                	jne    0x10003583
1000358e:	89 44 24 14          	mov    %eax,0x14(%esp)
10003592:	8b 51 08             	mov    0x8(%ecx),%edx
10003595:	8b 44 24 10          	mov    0x10(%esp),%eax
10003599:	5f                   	pop    %edi
1000359a:	89 10                	mov    %edx,(%eax)
1000359c:	5e                   	pop    %esi
1000359d:	59                   	pop    %ecx
1000359e:	c2 08 00             	ret    $0x8
100035a1:	3b 70 08             	cmp    0x8(%eax),%esi
100035a4:	89 44 24 14          	mov    %eax,0x14(%esp)
100035a8:	7d 19                	jge    0x100035c3
100035aa:	8b 41 08             	mov    0x8(%ecx),%eax
100035ad:	89 44 24 08          	mov    %eax,0x8(%esp)
100035b1:	8d 44 24 08          	lea    0x8(%esp),%eax
100035b5:	8b 08                	mov    (%eax),%ecx
100035b7:	8b 44 24 10          	mov    0x10(%esp),%eax
100035bb:	5f                   	pop    %edi
100035bc:	89 08                	mov    %ecx,(%eax)
100035be:	5e                   	pop    %esi
100035bf:	59                   	pop    %ecx
100035c0:	c2 08 00             	ret    $0x8
100035c3:	8d 44 24 14          	lea    0x14(%esp),%eax
100035c7:	8b 08                	mov    (%eax),%ecx
100035c9:	8b 44 24 10          	mov    0x10(%esp),%eax
100035cd:	5f                   	pop    %edi
100035ce:	89 08                	mov    %ecx,(%eax)
100035d0:	5e                   	pop    %esi
100035d1:	59                   	pop    %ecx
100035d2:	c2 08 00             	ret    $0x8
100035d5:	90                   	nop
100035d6:	90                   	nop
100035d7:	90                   	nop
100035d8:	90                   	nop
100035d9:	90                   	nop
100035da:	90                   	nop
100035db:	90                   	nop
100035dc:	90                   	nop
100035dd:	90                   	nop
100035de:	90                   	nop
100035df:	90                   	nop
100035e0:	8b 44 24 0c          	mov    0xc(%esp),%eax
100035e4:	8b 54 24 08          	mov    0x8(%esp),%edx
100035e8:	50                   	push   %eax
100035e9:	51                   	push   %ecx
100035ea:	8b 4c 24 14          	mov    0x14(%esp),%ecx
100035ee:	51                   	push   %ecx
100035ef:	51                   	push   %ecx
100035f0:	8b c4                	mov    %esp,%eax
100035f2:	51                   	push   %ecx
100035f3:	8b 4c 24 18          	mov    0x18(%esp),%ecx
100035f7:	89 10                	mov    %edx,(%eax)
100035f9:	8b c4                	mov    %esp,%eax
100035fb:	89 08                	mov    %ecx,(%eax)
100035fd:	e8 fe eb ff ff       	call   0x10002200
10003602:	83 c4 14             	add    $0x14,%esp
10003605:	c2 0c 00             	ret    $0xc
10003608:	90                   	nop
10003609:	90                   	nop
1000360a:	90                   	nop
1000360b:	90                   	nop
1000360c:	90                   	nop
1000360d:	90                   	nop
1000360e:	90                   	nop
1000360f:	90                   	nop
10003610:	51                   	push   %ecx
10003611:	8b 81 00 03 00 00    	mov    0x300(%ecx),%eax
10003617:	85 c0                	test   %eax,%eax
10003619:	56                   	push   %esi
1000361a:	8d b1 fc 02 00 00    	lea    0x2fc(%ecx),%esi
10003620:	75 04                	jne    0x10003626
10003622:	33 c9                	xor    %ecx,%ecx
10003624:	eb 02                	jmp    0x10003628
10003626:	8b 08                	mov    (%eax),%ecx
10003628:	50                   	push   %eax
10003629:	51                   	push   %ecx
1000362a:	8d 44 24 0c          	lea    0xc(%esp),%eax
1000362e:	50                   	push   %eax
1000362f:	8b ce                	mov    %esi,%ecx
10003631:	e8 1a fe ff ff       	call   0x10003450
10003636:	8b 4e 04             	mov    0x4(%esi),%ecx
10003639:	51                   	push   %ecx
1000363a:	e8 9e 23 00 00       	call   0x100059dd
1000363f:	83 c4 04             	add    $0x4,%esp
10003642:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
10003649:	c7 46 08 00 00 00 00 	movl   $0x0,0x8(%esi)
10003650:	5e                   	pop    %esi
10003651:	59                   	pop    %ecx
10003652:	c3                   	ret
10003653:	90                   	nop
10003654:	90                   	nop
10003655:	90                   	nop
10003656:	90                   	nop
10003657:	90                   	nop
10003658:	90                   	nop
10003659:	90                   	nop
1000365a:	90                   	nop
1000365b:	90                   	nop
1000365c:	90                   	nop
1000365d:	90                   	nop
1000365e:	90                   	nop
1000365f:	90                   	nop
10003660:	56                   	push   %esi
10003661:	8b f1                	mov    %ecx,%esi
10003663:	8b 8e 04 03 00 00    	mov    0x304(%esi),%ecx
10003669:	83 c8 ff             	or     $0xffffffff,%eax
1000366c:	85 c9                	test   %ecx,%ecx
1000366e:	57                   	push   %edi
1000366f:	74 51                	je     0x100036c2
10003671:	8a 4e 1c             	mov    0x1c(%esi),%cl
10003674:	84 c9                	test   %cl,%cl
10003676:	75 4a                	jne    0x100036c2
10003678:	8b 86 00 03 00 00    	mov    0x300(%esi),%eax
1000367e:	85 c0                	test   %eax,%eax
10003680:	74 02                	je     0x10003684
10003682:	8b 00                	mov    (%eax),%eax
10003684:	8b 8e 00 03 00 00    	mov    0x300(%esi),%ecx
1000368a:	85 c9                	test   %ecx,%ecx
1000368c:	8b 78 08             	mov    0x8(%eax),%edi
1000368f:	75 04                	jne    0x10003695
10003691:	33 c0                	xor    %eax,%eax
10003693:	eb 02                	jmp    0x10003697
10003695:	8b 01                	mov    (%ecx),%eax
10003697:	3b c1                	cmp    %ecx,%eax
10003699:	74 25                	je     0x100036c0
1000369b:	8b 48 04             	mov    0x4(%eax),%ecx
1000369e:	8b 10                	mov    (%eax),%edx
100036a0:	89 11                	mov    %edx,(%ecx)
100036a2:	8b 08                	mov    (%eax),%ecx
100036a4:	8b 50 04             	mov    0x4(%eax),%edx
100036a7:	50                   	push   %eax
100036a8:	89 51 04             	mov    %edx,0x4(%ecx)
100036ab:	e8 2d 23 00 00       	call   0x100059dd
100036b0:	8b 86 04 03 00 00    	mov    0x304(%esi),%eax
100036b6:	83 c4 04             	add    $0x4,%esp
100036b9:	48                   	dec    %eax
100036ba:	89 86 04 03 00 00    	mov    %eax,0x304(%esi)
100036c0:	8b c7                	mov    %edi,%eax
100036c2:	5f                   	pop    %edi
100036c3:	5e                   	pop    %esi
100036c4:	c3                   	ret
100036c5:	90                   	nop
100036c6:	90                   	nop
100036c7:	90                   	nop
100036c8:	90                   	nop
100036c9:	90                   	nop
100036ca:	90                   	nop
100036cb:	90                   	nop
100036cc:	90                   	nop
100036cd:	90                   	nop
100036ce:	90                   	nop
100036cf:	90                   	nop
100036d0:	51                   	push   %ecx
100036d1:	56                   	push   %esi
100036d2:	8b f1                	mov    %ecx,%esi
100036d4:	8b 86 00 03 00 00    	mov    0x300(%esi),%eax
100036da:	85 c0                	test   %eax,%eax
100036dc:	8d 8e fc 02 00 00    	lea    0x2fc(%esi),%ecx
100036e2:	57                   	push   %edi
100036e3:	75 04                	jne    0x100036e9
100036e5:	33 d2                	xor    %edx,%edx
100036e7:	eb 02                	jmp    0x100036eb
100036e9:	8b 10                	mov    (%eax),%edx
100036eb:	50                   	push   %eax
100036ec:	52                   	push   %edx
100036ed:	8d 44 24 10          	lea    0x10(%esp),%eax
100036f1:	50                   	push   %eax
100036f2:	e8 59 fd ff ff       	call   0x10003450
100036f7:	8d 7e 2c             	lea    0x2c(%esi),%edi
100036fa:	b9 b4 00 00 00       	mov    $0xb4,%ecx
100036ff:	33 c0                	xor    %eax,%eax
10003701:	f3 ab                	rep stos %eax,%es:(%edi)
10003703:	5f                   	pop    %edi
10003704:	5e                   	pop    %esi
10003705:	59                   	pop    %ecx
10003706:	c3                   	ret
10003707:	90                   	nop
10003708:	90                   	nop
10003709:	90                   	nop
1000370a:	90                   	nop
1000370b:	90                   	nop
1000370c:	90                   	nop
1000370d:	90                   	nop
1000370e:	90                   	nop
1000370f:	90                   	nop
10003710:	8b 44 24 0c          	mov    0xc(%esp),%eax
10003714:	56                   	push   %esi
10003715:	8b 74 24 0c          	mov    0xc(%esp),%esi
10003719:	57                   	push   %edi
1000371a:	8b 7c 24 0c          	mov    0xc(%esp),%edi
1000371e:	50                   	push   %eax
1000371f:	51                   	push   %ecx
10003720:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
10003724:	51                   	push   %ecx
10003725:	56                   	push   %esi
10003726:	57                   	push   %edi
10003727:	e8 e4 dd ff ff       	call   0x10001510
1000372c:	83 c4 14             	add    $0x14,%esp
1000372f:	8d 04 b7             	lea    (%edi,%esi,4),%eax
10003732:	5f                   	pop    %edi
10003733:	5e                   	pop    %esi
10003734:	c2 0c 00             	ret    $0xc
10003737:	90                   	nop
10003738:	90                   	nop
10003739:	90                   	nop
1000373a:	90                   	nop
1000373b:	90                   	nop
1000373c:	90                   	nop
1000373d:	90                   	nop
1000373e:	90                   	nop
1000373f:	90                   	nop
10003740:	51                   	push   %ecx
10003741:	56                   	push   %esi
10003742:	8b f1                	mov    %ecx,%esi
10003744:	8d 44 24 0c          	lea    0xc(%esp),%eax
10003748:	50                   	push   %eax
10003749:	8d 4c 24 08          	lea    0x8(%esp),%ecx
1000374d:	51                   	push   %ecx
1000374e:	8d 4e 10             	lea    0x10(%esi),%ecx
10003751:	e8 fa fd ff ff       	call   0x10003550
10003756:	8b 4e 18             	mov    0x18(%esi),%ecx
10003759:	8b 44 24 04          	mov    0x4(%esp),%eax
1000375d:	3b c1                	cmp    %ecx,%eax
1000375f:	5e                   	pop    %esi
10003760:	74 0d                	je     0x1000376f
10003762:	8b 48 0c             	mov    0xc(%eax),%ecx
10003765:	85 c9                	test   %ecx,%ecx
10003767:	75 06                	jne    0x1000376f
10003769:	b0 01                	mov    $0x1,%al
1000376b:	59                   	pop    %ecx
1000376c:	c2 04 00             	ret    $0x4
1000376f:	32 c0                	xor    %al,%al
10003771:	59                   	pop    %ecx
10003772:	c2 04 00             	ret    $0x4
10003775:	90                   	nop
10003776:	90                   	nop
10003777:	90                   	nop
10003778:	90                   	nop
10003779:	90                   	nop
1000377a:	90                   	nop
1000377b:	90                   	nop
1000377c:	90                   	nop
1000377d:	90                   	nop
1000377e:	90                   	nop
1000377f:	90                   	nop
10003780:	51                   	push   %ecx
10003781:	56                   	push   %esi
10003782:	57                   	push   %edi
10003783:	8b f1                	mov    %ecx,%esi
10003785:	8d 44 24 10          	lea    0x10(%esp),%eax
10003789:	50                   	push   %eax
1000378a:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
1000378e:	51                   	push   %ecx
1000378f:	8d 4e 38             	lea    0x38(%esi),%ecx
10003792:	83 cf ff             	or     $0xffffffff,%edi
10003795:	e8 b6 fd ff ff       	call   0x10003550
1000379a:	8b 44 24 08          	mov    0x8(%esp),%eax
1000379e:	3b 46 40             	cmp    0x40(%esi),%eax
100037a1:	74 0e                	je     0x100037b1
100037a3:	8b 48 0c             	mov    0xc(%eax),%ecx
100037a6:	e8 b5 fe ff ff       	call   0x10003660
100037ab:	5f                   	pop    %edi
100037ac:	5e                   	pop    %esi
100037ad:	59                   	pop    %ecx
100037ae:	c2 04 00             	ret    $0x4
100037b1:	8b c7                	mov    %edi,%eax
100037b3:	5f                   	pop    %edi
100037b4:	5e                   	pop    %esi
100037b5:	59                   	pop    %ecx
100037b6:	c2 04 00             	ret    $0x4
100037b9:	90                   	nop
100037ba:	90                   	nop
100037bb:	90                   	nop
100037bc:	90                   	nop
100037bd:	90                   	nop
100037be:	90                   	nop
100037bf:	90                   	nop
100037c0:	51                   	push   %ecx
100037c1:	56                   	push   %esi
100037c2:	57                   	push   %edi
100037c3:	8b f1                	mov    %ecx,%esi
100037c5:	8d 44 24 10          	lea    0x10(%esp),%eax
100037c9:	50                   	push   %eax
100037ca:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
100037ce:	51                   	push   %ecx
100037cf:	8d 4e 38             	lea    0x38(%esi),%ecx
100037d2:	33 ff                	xor    %edi,%edi
100037d4:	e8 77 fd ff ff       	call   0x10003550
100037d9:	8b 44 24 08          	mov    0x8(%esp),%eax
100037dd:	3b 46 40             	cmp    0x40(%esi),%eax
100037e0:	74 0e                	je     0x100037f0
100037e2:	8b 48 0c             	mov    0xc(%eax),%ecx
100037e5:	e8 56 fb ff ff       	call   0x10003340
100037ea:	5f                   	pop    %edi
100037eb:	5e                   	pop    %esi
100037ec:	59                   	pop    %ecx
100037ed:	c2 04 00             	ret    $0x4
100037f0:	8b c7                	mov    %edi,%eax
100037f2:	5f                   	pop    %edi
100037f3:	5e                   	pop    %esi
100037f4:	59                   	pop    %ecx
100037f5:	c2 04 00             	ret    $0x4
100037f8:	90                   	nop
100037f9:	90                   	nop
100037fa:	90                   	nop
100037fb:	90                   	nop
100037fc:	90                   	nop
100037fd:	90                   	nop
100037fe:	90                   	nop
100037ff:	90                   	nop
10003800:	51                   	push   %ecx
10003801:	56                   	push   %esi
10003802:	8b f1                	mov    %ecx,%esi
10003804:	8d 44 24 0c          	lea    0xc(%esp),%eax
10003808:	50                   	push   %eax
10003809:	8d 4c 24 08          	lea    0x8(%esp),%ecx
1000380d:	51                   	push   %ecx
1000380e:	8d 4e 38             	lea    0x38(%esi),%ecx
10003811:	e8 3a fd ff ff       	call   0x10003550
10003816:	8b 4e 40             	mov    0x40(%esi),%ecx
10003819:	8b 44 24 04          	mov    0x4(%esp),%eax
1000381d:	3b c1                	cmp    %ecx,%eax
1000381f:	5e                   	pop    %esi
10003820:	74 08                	je     0x1000382a
10003822:	8b 48 0c             	mov    0xc(%eax),%ecx
10003825:	e8 a6 fe ff ff       	call   0x100036d0
1000382a:	59                   	pop    %ecx
1000382b:	c2 04 00             	ret    $0x4
1000382e:	90                   	nop
1000382f:	90                   	nop
10003830:	56                   	push   %esi
10003831:	57                   	push   %edi
10003832:	8b 7c 24 0c          	mov    0xc(%esp),%edi
10003836:	8b f1                	mov    %ecx,%esi
10003838:	8b 4e 0c             	mov    0xc(%esi),%ecx
1000383b:	57                   	push   %edi
1000383c:	e8 ff fe ff ff       	call   0x10003740
10003841:	84 c0                	test   %al,%al
10003843:	74 10                	je     0x10003855
10003845:	8b c7                	mov    %edi,%eax
10003847:	99                   	cltd
10003848:	b9 0f 00 00 00       	mov    $0xf,%ecx
1000384d:	f7 f9                	idiv   %ecx
1000384f:	89 56 14             	mov    %edx,0x14(%esi)
10003852:	89 46 18             	mov    %eax,0x18(%esi)
10003855:	5f                   	pop    %edi
10003856:	5e                   	pop    %esi
10003857:	c2 04 00             	ret    $0x4
1000385a:	90                   	nop
1000385b:	90                   	nop
1000385c:	90                   	nop
1000385d:	90                   	nop
1000385e:	90                   	nop
1000385f:	90                   	nop
10003860:	56                   	push   %esi
10003861:	57                   	push   %edi
10003862:	8b f9                	mov    %ecx,%edi
10003864:	8b 47 08             	mov    0x8(%edi),%eax
10003867:	8b 48 04             	mov    0x4(%eax),%ecx
1000386a:	c6 01 00             	movb   $0x0,(%ecx)
1000386d:	8b 50 08             	mov    0x8(%eax),%edx
10003870:	66 c7 02 03 00       	movw   $0x3,(%edx)
10003875:	8b 47 08             	mov    0x8(%edi),%eax
10003878:	50                   	push   %eax
10003879:	68 25 32 03 d8       	push   $0xd8033225
1000387e:	8b cf                	mov    %edi,%ecx
10003880:	e8 7b 1b 00 00       	call   0x10005400
10003885:	83 f8 01             	cmp    $0x1,%eax
10003888:	0f 85 a3 00 00 00    	jne    0x10003931
1000388e:	8b 77 08             	mov    0x8(%edi),%esi
10003891:	8b 4e 04             	mov    0x4(%esi),%ecx
10003894:	80 39 01             	cmpb   $0x1,(%ecx)
10003897:	0f 85 80 00 00 00    	jne    0x1000391d
1000389d:	8b d1                	mov    %ecx,%edx
1000389f:	80 3a 00             	cmpb   $0x0,(%edx)
100038a2:	76 11                	jbe    0x100038b5
100038a4:	8b 06                	mov    (%esi),%eax
100038a6:	83 c0 03             	add    $0x3,%eax
100038a9:	85 c0                	test   %eax,%eax
100038ab:	74 08                	je     0x100038b5
100038ad:	0f be 00             	movsbl (%eax),%eax
100038b0:	83 f8 21             	cmp    $0x21,%eax
100038b3:	74 54                	je     0x10003909
100038b5:	8b 46 04             	mov    0x4(%esi),%eax
100038b8:	80 38 00             	cmpb   $0x0,(%eax)
100038bb:	76 11                	jbe    0x100038ce
100038bd:	8b 06                	mov    (%esi),%eax
100038bf:	83 c0 03             	add    $0x3,%eax
100038c2:	85 c0                	test   %eax,%eax
100038c4:	74 08                	je     0x100038ce
100038c6:	0f be 00             	movsbl (%eax),%eax
100038c9:	83 f8 11             	cmp    $0x11,%eax
100038cc:	74 3b                	je     0x10003909
100038ce:	8b 4e 04             	mov    0x4(%esi),%ecx
100038d1:	80 39 00             	cmpb   $0x0,(%ecx)
100038d4:	76 11                	jbe    0x100038e7
100038d6:	8b 06                	mov    (%esi),%eax
100038d8:	83 c0 03             	add    $0x3,%eax
100038db:	85 c0                	test   %eax,%eax
100038dd:	74 08                	je     0x100038e7
100038df:	0f be 00             	movsbl (%eax),%eax
100038e2:	83 f8 01             	cmp    $0x1,%eax
100038e5:	74 22                	je     0x10003909
100038e7:	6a 00                	push   $0x0
100038e9:	8b ce                	mov    %esi,%ecx
100038eb:	e8 10 da ff ff       	call   0x10001300
100038f0:	83 f8 31             	cmp    $0x31,%eax
100038f3:	74 14                	je     0x10003909
100038f5:	8b 57 10             	mov    0x10(%edi),%edx
100038f8:	52                   	push   %edx
100038f9:	68 04 c2 00 10       	push   $0x1000c204  ; 0x1000c204='Monster( %d ) ,call func ( GetPos ) faild.Err pAgv '
100038fe:	e8 2d 19 00 00       	call   0x10005230
10003903:	83 c4 08             	add    $0x8,%esp
10003906:	5f                   	pop    %edi
10003907:	5e                   	pop    %esi
10003908:	c3                   	ret
10003909:	6a 00                	push   $0x0
1000390b:	8b ce                	mov    %esi,%ecx
1000390d:	e8 0e da ff ff       	call   0x10001320
10003912:	50                   	push   %eax
10003913:	8b cf                	mov    %edi,%ecx
10003915:	e8 16 ff ff ff       	call   0x10003830
1000391a:	5f                   	pop    %edi
1000391b:	5e                   	pop    %esi
1000391c:	c3                   	ret
1000391d:	8b 47 10             	mov    0x10(%edi),%eax
10003920:	50                   	push   %eax
10003921:	68 04 c2 00 10       	push   $0x1000c204  ; 0x1000c204='Monster( %d ) ,call func ( GetPos ) faild.Err pAgv '
10003926:	e8 05 19 00 00       	call   0x10005230
1000392b:	83 c4 08             	add    $0x8,%esp
1000392e:	5f                   	pop    %edi
1000392f:	5e                   	pop    %esi
10003930:	c3                   	ret
10003931:	8b 4f 10             	mov    0x10(%edi),%ecx
10003934:	51                   	push   %ecx
10003935:	68 dc c1 00 10       	push   $0x1000c1dc  ; 0x1000c1dc='obj( %d ) ,call func ( GetPos ) faild.'
1000393a:	e8 f1 18 00 00       	call   0x10005230
1000393f:	83 c4 08             	add    $0x8,%esp
10003942:	5f                   	pop    %edi
10003943:	5e                   	pop    %esi
10003944:	c3                   	ret
10003945:	90                   	nop
10003946:	90                   	nop
10003947:	90                   	nop
10003948:	90                   	nop
10003949:	90                   	nop
1000394a:	90                   	nop
1000394b:	90                   	nop
1000394c:	90                   	nop
1000394d:	90                   	nop
1000394e:	90                   	nop
1000394f:	90                   	nop
10003950:	53                   	push   %ebx
10003951:	55                   	push   %ebp
10003952:	56                   	push   %esi
10003953:	8b f1                	mov    %ecx,%esi
10003955:	8b 86 fc 03 00 00    	mov    0x3fc(%esi),%eax
1000395b:	0f be 84 30 08 04 00 	movsbl 0x408(%eax,%esi,1),%eax
10003962:	00 
10003963:	8b 96 00 04 00 00    	mov    0x400(%esi),%edx
10003969:	8b 9c 86 74 0d 00 00 	mov    0xd74(%esi,%eax,4),%ebx
10003970:	8b 8e 04 04 00 00    	mov    0x404(%esi),%ecx
10003976:	57                   	push   %edi
10003977:	8b bc 86 64 0d 00 00 	mov    0xd64(%esi,%eax,4),%edi
1000397e:	03 fa                	add    %edx,%edi
10003980:	03 d9                	add    %ecx,%ebx
10003982:	83 ff 0f             	cmp    $0xf,%edi
10003985:	7d 47                	jge    0x100039ce
10003987:	85 ff                	test   %edi,%edi
10003989:	7c 43                	jl     0x100039ce
1000398b:	83 fb 10             	cmp    $0x10,%ebx
1000398e:	7d 3e                	jge    0x100039ce
10003990:	85 db                	test   %ebx,%ebx
10003992:	7c 3a                	jl     0x100039ce
10003994:	8b cb                	mov    %ebx,%ecx
10003996:	6b c9 0f             	imul   $0xf,%ecx,%ecx
10003999:	8d 2c 39             	lea    (%ecx,%edi,1),%ebp
1000399c:	8a 84 2e 08 03 00 00 	mov    0x308(%esi,%ebp,1),%al
100039a3:	84 c0                	test   %al,%al
100039a5:	75 27                	jne    0x100039ce
100039a7:	8b 4e 0c             	mov    0xc(%esi),%ecx
100039aa:	55                   	push   %ebp
100039ab:	e8 90 fd ff ff       	call   0x10003740
100039b0:	84 c0                	test   %al,%al
100039b2:	74 1a                	je     0x100039ce
100039b4:	89 be 00 04 00 00    	mov    %edi,0x400(%esi)
100039ba:	89 9e 04 04 00 00    	mov    %ebx,0x404(%esi)
100039c0:	5f                   	pop    %edi
100039c1:	b0 01                	mov    $0x1,%al
100039c3:	88 84 2e 08 03 00 00 	mov    %al,0x308(%esi,%ebp,1)
100039ca:	5e                   	pop    %esi
100039cb:	5d                   	pop    %ebp
100039cc:	5b                   	pop    %ebx
100039cd:	c3                   	ret
100039ce:	5f                   	pop    %edi
100039cf:	5e                   	pop    %esi
100039d0:	5d                   	pop    %ebp
100039d1:	32 c0                	xor    %al,%al
100039d3:	5b                   	pop    %ebx
100039d4:	c3                   	ret
100039d5:	90                   	nop
100039d6:	90                   	nop
100039d7:	90                   	nop
100039d8:	90                   	nop
100039d9:	90                   	nop
100039da:	90                   	nop
100039db:	90                   	nop
100039dc:	90                   	nop
100039dd:	90                   	nop
100039de:	90                   	nop
100039df:	90                   	nop
100039e0:	8b 44 24 0c          	mov    0xc(%esp),%eax
100039e4:	53                   	push   %ebx
100039e5:	56                   	push   %esi
100039e6:	57                   	push   %edi
100039e7:	8b 7c 24 14          	mov    0x14(%esp),%edi
100039eb:	3b f8                	cmp    %eax,%edi
100039ed:	74 1a                	je     0x10003a09
100039ef:	8b 71 08             	mov    0x8(%ecx),%esi
100039f2:	3b c6                	cmp    %esi,%eax
100039f4:	8b d7                	mov    %edi,%edx
100039f6:	74 0e                	je     0x10003a06
100039f8:	8b 18                	mov    (%eax),%ebx
100039fa:	89 1a                	mov    %ebx,(%edx)
100039fc:	83 c0 04             	add    $0x4,%eax
100039ff:	83 c2 04             	add    $0x4,%edx
10003a02:	3b c6                	cmp    %esi,%eax
10003a04:	75 f2                	jne    0x100039f8
10003a06:	89 51 08             	mov    %edx,0x8(%ecx)
10003a09:	8b 44 24 10          	mov    0x10(%esp),%eax
10003a0d:	89 38                	mov    %edi,(%eax)
10003a0f:	5f                   	pop    %edi
10003a10:	5e                   	pop    %esi
10003a11:	5b                   	pop    %ebx
10003a12:	c2 0c 00             	ret    $0xc
10003a15:	90                   	nop
10003a16:	90                   	nop
10003a17:	90                   	nop
10003a18:	90                   	nop
10003a19:	90                   	nop
10003a1a:	90                   	nop
10003a1b:	90                   	nop
10003a1c:	90                   	nop
10003a1d:	90                   	nop
10003a1e:	90                   	nop
10003a1f:	90                   	nop
10003a20:	55                   	push   %ebp
10003a21:	8b ec                	mov    %esp,%ebp
10003a23:	6a ff                	push   $0xffffffff
10003a25:	68 50 b2 00 10       	push   $0x1000b250
10003a2a:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10003a30:	50                   	push   %eax
10003a31:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10003a38:	83 ec 08             	sub    $0x8,%esp
10003a3b:	8b 45 0c             	mov    0xc(%ebp),%eax
10003a3e:	53                   	push   %ebx
10003a3f:	8b 5d 08             	mov    0x8(%ebp),%ebx
10003a42:	56                   	push   %esi
10003a43:	57                   	push   %edi
10003a44:	89 65 f0             	mov    %esp,-0x10(%ebp)
10003a47:	8b f1                	mov    %ecx,%esi
10003a49:	8b 4d 0c             	mov    0xc(%ebp),%ecx
10003a4c:	8b 7e 04             	mov    0x4(%esi),%edi
10003a4f:	50                   	push   %eax
10003a50:	56                   	push   %esi
10003a51:	51                   	push   %ecx
10003a52:	53                   	push   %ebx
10003a53:	57                   	push   %edi
10003a54:	89 75 ec             	mov    %esi,-0x14(%ebp)
10003a57:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
10003a5e:	e8 ad da ff ff       	call   0x10001510
10003a63:	8b 4d f4             	mov    -0xc(%ebp),%ecx
10003a66:	83 c4 14             	add    $0x14,%esp
10003a69:	8d 14 9f             	lea    (%edi,%ebx,4),%edx
10003a6c:	5f                   	pop    %edi
10003a6d:	89 56 08             	mov    %edx,0x8(%esi)
10003a70:	5e                   	pop    %esi
10003a71:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10003a78:	5b                   	pop    %ebx
10003a79:	8b e5                	mov    %ebp,%esp
10003a7b:	5d                   	pop    %ebp
10003a7c:	c2 08 00             	ret    $0x8
10003a7f:	8b 4d ec             	mov    -0x14(%ebp),%ecx
10003a82:	e8 79 e8 ff ff       	call   0x10002300
10003a87:	6a 00                	push   $0x0
10003a89:	6a 00                	push   $0x0
10003a8b:	e8 52 1f 00 00       	call   0x100059e2
10003a90:	cc                   	int3
10003a91:	90                   	nop
10003a92:	90                   	nop
10003a93:	90                   	nop
10003a94:	90                   	nop
10003a95:	90                   	nop
10003a96:	90                   	nop
10003a97:	90                   	nop
10003a98:	90                   	nop
10003a99:	90                   	nop
10003a9a:	90                   	nop
10003a9b:	90                   	nop
10003a9c:	90                   	nop
10003a9d:	90                   	nop
10003a9e:	90                   	nop
10003a9f:	90                   	nop
10003aa0:	56                   	push   %esi
10003aa1:	57                   	push   %edi
10003aa2:	8b f9                	mov    %ecx,%edi
10003aa4:	8b 47 40             	mov    0x40(%edi),%eax
10003aa7:	85 c0                	test   %eax,%eax
10003aa9:	75 04                	jne    0x10003aaf
10003aab:	33 f6                	xor    %esi,%esi
10003aad:	eb 02                	jmp    0x10003ab1
10003aaf:	8b 30                	mov    (%eax),%esi
10003ab1:	3b 77 40             	cmp    0x40(%edi),%esi
10003ab4:	74 0f                	je     0x10003ac5
10003ab6:	8b 4e 0c             	mov    0xc(%esi),%ecx
10003ab9:	e8 a2 fd ff ff       	call   0x10003860
10003abe:	8b 36                	mov    (%esi),%esi
10003ac0:	3b 77 40             	cmp    0x40(%edi),%esi
10003ac3:	75 f1                	jne    0x10003ab6
10003ac5:	5f                   	pop    %edi
10003ac6:	5e                   	pop    %esi
10003ac7:	c3                   	ret
10003ac8:	90                   	nop
10003ac9:	90                   	nop
10003aca:	90                   	nop
10003acb:	90                   	nop
10003acc:	90                   	nop
10003acd:	90                   	nop
10003ace:	90                   	nop
10003acf:	90                   	nop
10003ad0:	51                   	push   %ecx
10003ad1:	56                   	push   %esi
10003ad2:	8b f1                	mov    %ecx,%esi
10003ad4:	8d 44 24 0c          	lea    0xc(%esp),%eax
10003ad8:	50                   	push   %eax
10003ad9:	8d 4c 24 08          	lea    0x8(%esp),%ecx
10003add:	51                   	push   %ecx
10003ade:	8d 4e 38             	lea    0x38(%esi),%ecx
10003ae1:	e8 6a fa ff ff       	call   0x10003550
10003ae6:	8b 4e 40             	mov    0x40(%esi),%ecx
10003ae9:	8b 44 24 04          	mov    0x4(%esp),%eax
10003aed:	3b c1                	cmp    %ecx,%eax
10003aef:	5e                   	pop    %esi
10003af0:	74 0d                	je     0x10003aff
10003af2:	8b 54 24 0c          	mov    0xc(%esp),%edx
10003af6:	8b 48 0c             	mov    0xc(%eax),%ecx
10003af9:	52                   	push   %edx
10003afa:	e8 31 fd ff ff       	call   0x10003830
10003aff:	59                   	pop    %ecx
10003b00:	c2 08 00             	ret    $0x8
10003b03:	90                   	nop
10003b04:	90                   	nop
10003b05:	90                   	nop
10003b06:	90                   	nop
10003b07:	90                   	nop
10003b08:	90                   	nop
10003b09:	90                   	nop
10003b0a:	90                   	nop
10003b0b:	90                   	nop
10003b0c:	90                   	nop
10003b0d:	90                   	nop
10003b0e:	90                   	nop
10003b0f:	90                   	nop
10003b10:	6a ff                	push   $0xffffffff
10003b12:	68 6e b2 00 10       	push   $0x1000b26e
10003b17:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10003b1d:	50                   	push   %eax
10003b1e:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10003b25:	51                   	push   %ecx
10003b26:	8b 44 24 1c          	mov    0x1c(%esp),%eax
10003b2a:	53                   	push   %ebx
10003b2b:	56                   	push   %esi
10003b2c:	8b f1                	mov    %ecx,%esi
10003b2e:	57                   	push   %edi
10003b2f:	8d be fc 02 00 00    	lea    0x2fc(%esi),%edi
10003b35:	33 db                	xor    %ebx,%ebx
10003b37:	8b cf                	mov    %edi,%ecx
10003b39:	89 74 24 0c          	mov    %esi,0xc(%esp)
10003b3d:	89 1e                	mov    %ebx,(%esi)
10003b3f:	89 46 0c             	mov    %eax,0xc(%esi)
10003b42:	e8 99 f8 ff ff       	call   0x100033e0
10003b47:	89 47 04             	mov    %eax,0x4(%edi)
10003b4a:	89 5f 08             	mov    %ebx,0x8(%edi)
10003b4d:	8b 4c 24 20          	mov    0x20(%esp),%ecx
10003b51:	89 4e 10             	mov    %ecx,0x10(%esi)
10003b54:	83 c9 ff             	or     $0xffffffff,%ecx
10003b57:	b8 01 00 00 00       	mov    $0x1,%eax
10003b5c:	89 8e 68 0d 00 00    	mov    %ecx,0xd68(%esi)
10003b62:	89 86 70 0d 00 00    	mov    %eax,0xd70(%esi)
10003b68:	89 8e 7c 0d 00 00    	mov    %ecx,0xd7c(%esi)
10003b6e:	89 86 84 0d 00 00    	mov    %eax,0xd84(%esi)
10003b74:	b9 07 00 00 00       	mov    $0x7,%ecx
10003b79:	b8 06 00 00 00       	mov    $0x6,%eax
10003b7e:	89 8e 00 04 00 00    	mov    %ecx,0x400(%esi)
10003b84:	89 86 04 04 00 00    	mov    %eax,0x404(%esi)
10003b8a:	89 4e 14             	mov    %ecx,0x14(%esi)
10003b8d:	89 46 18             	mov    %eax,0x18(%esi)
10003b90:	33 c0                	xor    %eax,%eax
10003b92:	88 5e 1c             	mov    %bl,0x1c(%esi)
10003b95:	89 9e 6c 0d 00 00    	mov    %ebx,0xd6c(%esi)
10003b9b:	89 9e 74 0d 00 00    	mov    %ebx,0xd74(%esi)
10003ba1:	89 9e 78 0d 00 00    	mov    %ebx,0xd78(%esi)
10003ba7:	89 9e 80 0d 00 00    	mov    %ebx,0xd80(%esi)
10003bad:	b9 b4 00 00 00       	mov    $0xb4,%ecx
10003bb2:	8d 7e 2c             	lea    0x2c(%esi),%edi
10003bb5:	6a 10                	push   $0x10
10003bb7:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
10003bbb:	f3 ab                	rep stos %eax,%es:(%edi)
10003bbd:	e8 4e 19 00 00       	call   0x10005510
10003bc2:	8b f8                	mov    %eax,%edi
10003bc4:	83 c4 04             	add    $0x4,%esp
10003bc7:	3b fb                	cmp    %ebx,%edi
10003bc9:	74 2b                	je     0x10003bf6
10003bcb:	68 00 04 00 00       	push   $0x400
10003bd0:	6a 02                	push   $0x2
10003bd2:	ff 15 0c c0 00 10    	call   *0x1000c00c  ; 0x1000c00c=KERNEL32.dll!GlobalAlloc
10003bd8:	50                   	push   %eax
10003bd9:	89 47 0c             	mov    %eax,0xc(%edi)
10003bdc:	ff 15 08 c0 00 10    	call   *0x1000c008  ; 0x1000c008=KERNEL32.dll!GlobalLock
10003be2:	89 07                	mov    %eax,(%edi)
10003be4:	89 47 04             	mov    %eax,0x4(%edi)
10003be7:	88 18                	mov    %bl,(%eax)
10003be9:	8b 07                	mov    (%edi),%eax
10003beb:	40                   	inc    %eax
10003bec:	89 47 08             	mov    %eax,0x8(%edi)
10003bef:	66 c7 00 03 00       	movw   $0x3,(%eax)
10003bf4:	eb 02                	jmp    0x10003bf8
10003bf6:	33 ff                	xor    %edi,%edi
10003bf8:	8b 54 24 24          	mov    0x24(%esp),%edx
10003bfc:	52                   	push   %edx
10003bfd:	8b ce                	mov    %esi,%ecx
10003bff:	89 7e 08             	mov    %edi,0x8(%esi)
10003c02:	e8 29 fc ff ff       	call   0x10003830
10003c07:	8b 4c 24 10          	mov    0x10(%esp),%ecx
10003c0b:	5f                   	pop    %edi
10003c0c:	8b c6                	mov    %esi,%eax
10003c0e:	5e                   	pop    %esi
10003c0f:	5b                   	pop    %ebx
10003c10:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10003c17:	83 c4 10             	add    $0x10,%esp
10003c1a:	c2 0c 00             	ret    $0xc
10003c1d:	90                   	nop
10003c1e:	90                   	nop
10003c1f:	90                   	nop
10003c20:	e8 7b fe ff ff       	call   0x10003aa0
10003c25:	c2 04 00             	ret    $0x4
10003c28:	90                   	nop
10003c29:	90                   	nop
10003c2a:	90                   	nop
10003c2b:	90                   	nop
10003c2c:	90                   	nop
10003c2d:	90                   	nop
10003c2e:	90                   	nop
10003c2f:	90                   	nop
10003c30:	51                   	push   %ecx
10003c31:	8b 54 24 0c          	mov    0xc(%esp),%edx
10003c35:	56                   	push   %esi
10003c36:	8b 74 24 0c          	mov    0xc(%esp),%esi
10003c3a:	33 c0                	xor    %eax,%eax
10003c3c:	89 46 14             	mov    %eax,0x14(%esi)
10003c3f:	c7 46 18 0f 00 00 00 	movl   $0xf,0x18(%esi)
10003c46:	89 44 24 04          	mov    %eax,0x4(%esp)
10003c4a:	88 46 04             	mov    %al,0x4(%esi)
10003c4d:	8b 44 24 14          	mov    0x14(%esp),%eax
10003c51:	50                   	push   %eax
10003c52:	52                   	push   %edx
10003c53:	51                   	push   %ecx
10003c54:	8b ce                	mov    %esi,%ecx
10003c56:	e8 35 db ff ff       	call   0x10001790
10003c5b:	8b c6                	mov    %esi,%eax
10003c5d:	5e                   	pop    %esi
10003c5e:	59                   	pop    %ecx
10003c5f:	c2 0c 00             	ret    $0xc
10003c62:	90                   	nop
10003c63:	90                   	nop
10003c64:	90                   	nop
10003c65:	90                   	nop
10003c66:	90                   	nop
10003c67:	90                   	nop
10003c68:	90                   	nop
10003c69:	90                   	nop
10003c6a:	90                   	nop
10003c6b:	90                   	nop
10003c6c:	90                   	nop
10003c6d:	90                   	nop
10003c6e:	90                   	nop
10003c6f:	90                   	nop
10003c70:	51                   	push   %ecx
10003c71:	56                   	push   %esi
10003c72:	8b f1                	mov    %ecx,%esi
10003c74:	8b 46 14             	mov    0x14(%esi),%eax
10003c77:	57                   	push   %edi
10003c78:	33 ff                	xor    %edi,%edi
10003c7a:	3b c7                	cmp    %edi,%eax
10003c7c:	74 09                	je     0x10003c87
10003c7e:	50                   	push   %eax
10003c7f:	e8 59 1d 00 00       	call   0x100059dd
10003c84:	83 c4 04             	add    $0x4,%esp
10003c87:	89 7e 14             	mov    %edi,0x14(%esi)
10003c8a:	89 7e 18             	mov    %edi,0x18(%esi)
10003c8d:	89 7e 1c             	mov    %edi,0x1c(%esi)
10003c90:	8b 46 08             	mov    0x8(%esi),%eax
10003c93:	83 c6 04             	add    $0x4,%esi
10003c96:	3b c7                	cmp    %edi,%eax
10003c98:	75 04                	jne    0x10003c9e
10003c9a:	33 c9                	xor    %ecx,%ecx
10003c9c:	eb 02                	jmp    0x10003ca0
10003c9e:	8b 08                	mov    (%eax),%ecx
10003ca0:	50                   	push   %eax
10003ca1:	51                   	push   %ecx
10003ca2:	8d 44 24 10          	lea    0x10(%esp),%eax
10003ca6:	50                   	push   %eax
10003ca7:	8b ce                	mov    %esi,%ecx
10003ca9:	e8 a2 f7 ff ff       	call   0x10003450
10003cae:	8b 4e 04             	mov    0x4(%esi),%ecx
10003cb1:	51                   	push   %ecx
10003cb2:	e8 26 1d 00 00       	call   0x100059dd
10003cb7:	83 c4 04             	add    $0x4,%esp
10003cba:	89 7e 04             	mov    %edi,0x4(%esi)
10003cbd:	89 7e 08             	mov    %edi,0x8(%esi)
10003cc0:	5f                   	pop    %edi
10003cc1:	5e                   	pop    %esi
10003cc2:	59                   	pop    %ecx
10003cc3:	c3                   	ret
10003cc4:	90                   	nop
10003cc5:	90                   	nop
10003cc6:	90                   	nop
10003cc7:	90                   	nop
10003cc8:	90                   	nop
10003cc9:	90                   	nop
10003cca:	90                   	nop
10003ccb:	90                   	nop
10003ccc:	90                   	nop
10003ccd:	90                   	nop
10003cce:	90                   	nop
10003ccf:	90                   	nop
10003cd0:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10003cd6:	8b 54 24 04          	mov    0x4(%esp),%edx
10003cda:	6a ff                	push   $0xffffffff
10003cdc:	68 88 b2 00 10       	push   $0x1000b288
10003ce1:	50                   	push   %eax
10003ce2:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10003ce9:	8b 41 08             	mov    0x8(%ecx),%eax
10003cec:	83 ec 44             	sub    $0x44,%esp
10003cef:	56                   	push   %esi
10003cf0:	be ff ff ff 3f       	mov    $0x3fffffff,%esi
10003cf5:	2b f0                	sub    %eax,%esi
10003cf7:	3b f2                	cmp    %edx,%esi
10003cf9:	5e                   	pop    %esi
10003cfa:	73 69                	jae    0x10003d65
10003cfc:	b8 a0 c1 00 10       	mov    $0x1000c1a0,%eax  ; 0x1000c1a0='list<T> too long'
10003d01:	c7 44 24 18 0f 00 00 	movl   $0xf,0x18(%esp)
10003d08:	00 
10003d09:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
10003d10:	00 
10003d11:	c6 44 24 04 00       	movb   $0x0,0x4(%esp)
10003d16:	8d 50 01             	lea    0x1(%eax),%edx
10003d19:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
10003d20:	8a 08                	mov    (%eax),%cl
10003d22:	40                   	inc    %eax
10003d23:	84 c9                	test   %cl,%cl
10003d25:	75 f9                	jne    0x10003d20
10003d27:	2b c2                	sub    %edx,%eax
10003d29:	50                   	push   %eax
10003d2a:	68 a0 c1 00 10       	push   $0x1000c1a0  ; 0x1000c1a0='list<T> too long'
10003d2f:	8d 4c 24 08          	lea    0x8(%esp),%ecx
10003d33:	e8 08 db ff ff       	call   0x10001840
10003d38:	8d 44 24 00          	lea    0x0(%esp),%eax
10003d3c:	50                   	push   %eax
10003d3d:	8d 4c 24 20          	lea    0x20(%esp),%ecx
10003d41:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
10003d48:	00 
10003d49:	e8 e2 db ff ff       	call   0x10001930
10003d4e:	68 bc d4 00 10       	push   $0x1000d4bc
10003d53:	8d 4c 24 20          	lea    0x20(%esp),%ecx
10003d57:	51                   	push   %ecx
10003d58:	c7 44 24 24 bc c2 00 	movl   $0x1000c2bc,0x24(%esp)
10003d5f:	10 
10003d60:	e8 7d 1c 00 00       	call   0x100059e2
10003d65:	03 c2                	add    %edx,%eax
10003d67:	89 41 08             	mov    %eax,0x8(%ecx)
10003d6a:	8b 4c 24 44          	mov    0x44(%esp),%ecx
10003d6e:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10003d75:	83 c4 50             	add    $0x50,%esp
10003d78:	c2 04 00             	ret    $0x4
10003d7b:	90                   	nop
10003d7c:	90                   	nop
10003d7d:	90                   	nop
10003d7e:	90                   	nop
10003d7f:	90                   	nop
10003d80:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10003d86:	8b 54 24 04          	mov    0x4(%esp),%edx
10003d8a:	6a ff                	push   $0xffffffff
10003d8c:	68 88 b2 00 10       	push   $0x1000b288
10003d91:	50                   	push   %eax
10003d92:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10003d99:	8b 41 08             	mov    0x8(%ecx),%eax
10003d9c:	83 ec 44             	sub    $0x44,%esp
10003d9f:	56                   	push   %esi
10003da0:	be ff ff ff 1f       	mov    $0x1fffffff,%esi
10003da5:	2b f0                	sub    %eax,%esi
10003da7:	3b f2                	cmp    %edx,%esi
10003da9:	5e                   	pop    %esi
10003daa:	73 69                	jae    0x10003e15
10003dac:	b8 a0 c1 00 10       	mov    $0x1000c1a0,%eax  ; 0x1000c1a0='list<T> too long'
10003db1:	c7 44 24 18 0f 00 00 	movl   $0xf,0x18(%esp)
10003db8:	00 
10003db9:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
10003dc0:	00 
10003dc1:	c6 44 24 04 00       	movb   $0x0,0x4(%esp)
10003dc6:	8d 50 01             	lea    0x1(%eax),%edx
10003dc9:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
10003dd0:	8a 08                	mov    (%eax),%cl
10003dd2:	40                   	inc    %eax
10003dd3:	84 c9                	test   %cl,%cl
10003dd5:	75 f9                	jne    0x10003dd0
10003dd7:	2b c2                	sub    %edx,%eax
10003dd9:	50                   	push   %eax
10003dda:	68 a0 c1 00 10       	push   $0x1000c1a0  ; 0x1000c1a0='list<T> too long'
10003ddf:	8d 4c 24 08          	lea    0x8(%esp),%ecx
10003de3:	e8 58 da ff ff       	call   0x10001840
10003de8:	8d 44 24 00          	lea    0x0(%esp),%eax
10003dec:	50                   	push   %eax
10003ded:	8d 4c 24 20          	lea    0x20(%esp),%ecx
10003df1:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
10003df8:	00 
10003df9:	e8 32 db ff ff       	call   0x10001930
10003dfe:	68 bc d4 00 10       	push   $0x1000d4bc
10003e03:	8d 4c 24 20          	lea    0x20(%esp),%ecx
10003e07:	51                   	push   %ecx
10003e08:	c7 44 24 24 bc c2 00 	movl   $0x1000c2bc,0x24(%esp)
10003e0f:	10 
10003e10:	e8 cd 1b 00 00       	call   0x100059e2
10003e15:	03 c2                	add    %edx,%eax
10003e17:	89 41 08             	mov    %eax,0x8(%ecx)
10003e1a:	8b 4c 24 44          	mov    0x44(%esp),%ecx
10003e1e:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10003e25:	83 c4 50             	add    $0x50,%esp
10003e28:	c2 04 00             	ret    $0x4
10003e2b:	90                   	nop
10003e2c:	90                   	nop
10003e2d:	90                   	nop
10003e2e:	90                   	nop
10003e2f:	90                   	nop
10003e30:	6a ff                	push   $0xffffffff
10003e32:	68 88 b2 00 10       	push   $0x1000b288
10003e37:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10003e3d:	50                   	push   %eax
10003e3e:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10003e45:	83 ec 44             	sub    $0x44,%esp
10003e48:	b8 50 c1 00 10       	mov    $0x1000c150,%eax  ; 0x1000c150='vector<T> too long'
10003e4d:	c7 44 24 18 0f 00 00 	movl   $0xf,0x18(%esp)
10003e54:	00 
10003e55:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
10003e5c:	00 
10003e5d:	c6 44 24 04 00       	movb   $0x0,0x4(%esp)
10003e62:	8d 50 01             	lea    0x1(%eax),%edx
10003e65:	8a 08                	mov    (%eax),%cl
10003e67:	40                   	inc    %eax
10003e68:	84 c9                	test   %cl,%cl
10003e6a:	75 f9                	jne    0x10003e65
10003e6c:	2b c2                	sub    %edx,%eax
10003e6e:	50                   	push   %eax
10003e6f:	68 50 c1 00 10       	push   $0x1000c150  ; 0x1000c150='vector<T> too long'
10003e74:	8d 4c 24 08          	lea    0x8(%esp),%ecx
10003e78:	e8 c3 d9 ff ff       	call   0x10001840
10003e7d:	8d 44 24 00          	lea    0x0(%esp),%eax
10003e81:	50                   	push   %eax
10003e82:	8d 4c 24 20          	lea    0x20(%esp),%ecx
10003e86:	c7 44 24 50 00 00 00 	movl   $0x0,0x50(%esp)
10003e8d:	00 
10003e8e:	e8 9d da ff ff       	call   0x10001930
10003e93:	68 bc d4 00 10       	push   $0x1000d4bc
10003e98:	8d 4c 24 20          	lea    0x20(%esp),%ecx
10003e9c:	51                   	push   %ecx
10003e9d:	c7 44 24 24 bc c2 00 	movl   $0x1000c2bc,0x24(%esp)
10003ea4:	10 
10003ea5:	e8 38 1b 00 00       	call   0x100059e2
10003eaa:	cc                   	int3
10003eab:	90                   	nop
10003eac:	90                   	nop
10003ead:	90                   	nop
10003eae:	90                   	nop
10003eaf:	90                   	nop
10003eb0:	e9 bb fd ff ff       	jmp    0x10003c70
10003eb5:	90                   	nop
10003eb6:	90                   	nop
10003eb7:	90                   	nop
10003eb8:	90                   	nop
10003eb9:	90                   	nop
10003eba:	90                   	nop
10003ebb:	90                   	nop
10003ebc:	90                   	nop
10003ebd:	90                   	nop
10003ebe:	90                   	nop
10003ebf:	90                   	nop
10003ec0:	51                   	push   %ecx
10003ec1:	53                   	push   %ebx
10003ec2:	8b d9                	mov    %ecx,%ebx
10003ec4:	8b 43 44             	mov    0x44(%ebx),%eax
10003ec7:	85 c0                	test   %eax,%eax
10003ec9:	c7 03 38 c2 00 10    	movl   $0x1000c238,(%ebx)
10003ecf:	74 41                	je     0x10003f12
10003ed1:	55                   	push   %ebp
10003ed2:	56                   	push   %esi
10003ed3:	57                   	push   %edi
10003ed4:	8d 6b 38             	lea    0x38(%ebx),%ebp
10003ed7:	8b 43 40             	mov    0x40(%ebx),%eax
10003eda:	85 c0                	test   %eax,%eax
10003edc:	75 04                	jne    0x10003ee2
10003ede:	33 f6                	xor    %esi,%esi
10003ee0:	eb 02                	jmp    0x10003ee4
10003ee2:	8b 30                	mov    (%eax),%esi
10003ee4:	8b 7e 0c             	mov    0xc(%esi),%edi
10003ee7:	85 ff                	test   %edi,%edi
10003ee9:	74 10                	je     0x10003efb
10003eeb:	8b cf                	mov    %edi,%ecx
10003eed:	e8 1e f7 ff ff       	call   0x10003610
10003ef2:	57                   	push   %edi
10003ef3:	e8 e5 1a 00 00       	call   0x100059dd
10003ef8:	83 c4 04             	add    $0x4,%esp
10003efb:	56                   	push   %esi
10003efc:	8d 44 24 14          	lea    0x14(%esp),%eax
10003f00:	50                   	push   %eax
10003f01:	8b cd                	mov    %ebp,%ecx
10003f03:	e8 c8 f5 ff ff       	call   0x100034d0
10003f08:	8b 43 44             	mov    0x44(%ebx),%eax
10003f0b:	85 c0                	test   %eax,%eax
10003f0d:	75 c8                	jne    0x10003ed7
10003f0f:	5f                   	pop    %edi
10003f10:	5e                   	pop    %esi
10003f11:	5d                   	pop    %ebp
10003f12:	8d 4b 38             	lea    0x38(%ebx),%ecx
10003f15:	e8 56 fd ff ff       	call   0x10003c70
10003f1a:	8d 4b 10             	lea    0x10(%ebx),%ecx
10003f1d:	e8 4e fd ff ff       	call   0x10003c70
10003f22:	5b                   	pop    %ebx
10003f23:	59                   	pop    %ecx
10003f24:	c3                   	ret
10003f25:	90                   	nop
10003f26:	90                   	nop
10003f27:	90                   	nop
10003f28:	90                   	nop
10003f29:	90                   	nop
10003f2a:	90                   	nop
10003f2b:	90                   	nop
10003f2c:	90                   	nop
10003f2d:	90                   	nop
10003f2e:	90                   	nop
10003f2f:	90                   	nop
10003f30:	55                   	push   %ebp
10003f31:	8b ec                	mov    %esp,%ebp
10003f33:	6a ff                	push   $0xffffffff
10003f35:	68 a0 b2 00 10       	push   $0x1000b2a0
10003f3a:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10003f40:	50                   	push   %eax
10003f41:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10003f48:	83 ec 0c             	sub    $0xc,%esp
10003f4b:	8b 45 10             	mov    0x10(%ebp),%eax
10003f4e:	53                   	push   %ebx
10003f4f:	56                   	push   %esi
10003f50:	8b f1                	mov    %ecx,%esi
10003f52:	8b 08                	mov    (%eax),%ecx
10003f54:	57                   	push   %edi
10003f55:	8b 7e 04             	mov    0x4(%esi),%edi
10003f58:	85 ff                	test   %edi,%edi
10003f5a:	89 65 f0             	mov    %esp,-0x10(%ebp)
10003f5d:	89 4d 10             	mov    %ecx,0x10(%ebp)
10003f60:	75 04                	jne    0x10003f66
10003f62:	33 c0                	xor    %eax,%eax
10003f64:	eb 08                	jmp    0x10003f6e
10003f66:	8b 46 0c             	mov    0xc(%esi),%eax
10003f69:	2b c7                	sub    %edi,%eax
10003f6b:	c1 f8 02             	sar    $0x2,%eax
10003f6e:	8b 55 0c             	mov    0xc(%ebp),%edx
10003f71:	85 d2                	test   %edx,%edx
10003f73:	0f 84 41 02 00 00    	je     0x100041ba
10003f79:	85 ff                	test   %edi,%edi
10003f7b:	75 04                	jne    0x10003f81
10003f7d:	33 c9                	xor    %ecx,%ecx
10003f7f:	eb 08                	jmp    0x10003f89
10003f81:	8b 4e 08             	mov    0x8(%esi),%ecx
10003f84:	2b cf                	sub    %edi,%ecx
10003f86:	c1 f9 02             	sar    $0x2,%ecx
10003f89:	bb ff ff ff 3f       	mov    $0x3fffffff,%ebx
10003f8e:	2b d9                	sub    %ecx,%ebx
10003f90:	3b da                	cmp    %edx,%ebx
10003f92:	73 1a                	jae    0x10003fae
10003f94:	8b ce                	mov    %esi,%ecx
10003f96:	e8 95 fe ff ff       	call   0x10003e30
10003f9b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
10003f9e:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10003fa5:	5f                   	pop    %edi
10003fa6:	5e                   	pop    %esi
10003fa7:	5b                   	pop    %ebx
10003fa8:	8b e5                	mov    %ebp,%esp
10003faa:	5d                   	pop    %ebp
10003fab:	c2 0c 00             	ret    $0xc
10003fae:	85 ff                	test   %edi,%edi
10003fb0:	75 04                	jne    0x10003fb6
10003fb2:	33 c9                	xor    %ecx,%ecx
10003fb4:	eb 08                	jmp    0x10003fbe
10003fb6:	8b 4e 08             	mov    0x8(%esi),%ecx
10003fb9:	2b cf                	sub    %edi,%ecx
10003fbb:	c1 f9 02             	sar    $0x2,%ecx
10003fbe:	03 ca                	add    %edx,%ecx
10003fc0:	3b c1                	cmp    %ecx,%eax
10003fc2:	0f 83 10 01 00 00    	jae    0x100040d8
10003fc8:	8b c8                	mov    %eax,%ecx
10003fca:	d1 e9                	shr    $1,%ecx
10003fcc:	bb ff ff ff 3f       	mov    $0x3fffffff,%ebx
10003fd1:	2b d9                	sub    %ecx,%ebx
10003fd3:	3b d8                	cmp    %eax,%ebx
10003fd5:	73 04                	jae    0x10003fdb
10003fd7:	33 c0                	xor    %eax,%eax
10003fd9:	eb 02                	jmp    0x10003fdd
10003fdb:	03 c1                	add    %ecx,%eax
10003fdd:	85 ff                	test   %edi,%edi
10003fdf:	75 04                	jne    0x10003fe5
10003fe1:	33 c9                	xor    %ecx,%ecx
10003fe3:	eb 08                	jmp    0x10003fed
10003fe5:	8b 4e 08             	mov    0x8(%esi),%ecx
10003fe8:	2b cf                	sub    %edi,%ecx
10003fea:	c1 f9 02             	sar    $0x2,%ecx
10003fed:	03 ca                	add    %edx,%ecx
10003fef:	3b c1                	cmp    %ecx,%eax
10003ff1:	73 12                	jae    0x10004005
10003ff3:	85 ff                	test   %edi,%edi
10003ff5:	75 04                	jne    0x10003ffb
10003ff7:	33 c0                	xor    %eax,%eax
10003ff9:	eb 08                	jmp    0x10004003
10003ffb:	8b 46 08             	mov    0x8(%esi),%eax
10003ffe:	2b c7                	sub    %edi,%eax
10004000:	c1 f8 02             	sar    $0x2,%eax
10004003:	03 c2                	add    %edx,%eax
10004005:	c1 e0 02             	shl    $0x2,%eax
10004008:	50                   	push   %eax
10004009:	89 45 ec             	mov    %eax,-0x14(%ebp)
1000400c:	e8 ff 14 00 00       	call   0x10005510
10004011:	8b 55 0c             	mov    0xc(%ebp),%edx
10004014:	83 c4 04             	add    $0x4,%esp
10004017:	52                   	push   %edx
10004018:	8b 55 08             	mov    0x8(%ebp),%edx
1000401b:	8b d8                	mov    %eax,%ebx
1000401d:	8b 46 04             	mov    0x4(%esi),%eax
10004020:	56                   	push   %esi
10004021:	53                   	push   %ebx
10004022:	51                   	push   %ecx
10004023:	8b cc                	mov    %esp,%ecx
10004025:	89 11                	mov    %edx,(%ecx)
10004027:	51                   	push   %ecx
10004028:	8b cc                	mov    %esp,%ecx
1000402a:	89 5d e8             	mov    %ebx,-0x18(%ebp)
1000402d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
10004034:	89 01                	mov    %eax,(%ecx)
10004036:	e8 c5 e1 ff ff       	call   0x10002200
1000403b:	8b 55 0c             	mov    0xc(%ebp),%edx
1000403e:	83 c4 14             	add    $0x14,%esp
10004041:	8b f8                	mov    %eax,%edi
10004043:	8b 45 0c             	mov    0xc(%ebp),%eax
10004046:	50                   	push   %eax
10004047:	56                   	push   %esi
10004048:	8d 4d 10             	lea    0x10(%ebp),%ecx
1000404b:	51                   	push   %ecx
1000404c:	52                   	push   %edx
1000404d:	57                   	push   %edi
1000404e:	e8 bd d4 ff ff       	call   0x10001510
10004053:	8b 55 0c             	mov    0xc(%ebp),%edx
10004056:	8b 4e 08             	mov    0x8(%esi),%ecx
10004059:	8b 45 0c             	mov    0xc(%ebp),%eax
1000405c:	83 c4 14             	add    $0x14,%esp
1000405f:	52                   	push   %edx
10004060:	8d 04 87             	lea    (%edi,%eax,4),%eax
10004063:	56                   	push   %esi
10004064:	50                   	push   %eax
10004065:	51                   	push   %ecx
10004066:	8b c4                	mov    %esp,%eax
10004068:	89 08                	mov    %ecx,(%eax)
1000406a:	51                   	push   %ecx
1000406b:	8b 4d 08             	mov    0x8(%ebp),%ecx
1000406e:	8b c4                	mov    %esp,%eax
10004070:	89 08                	mov    %ecx,(%eax)
10004072:	e8 89 e1 ff ff       	call   0x10002200
10004077:	8b 4e 04             	mov    0x4(%esi),%ecx
1000407a:	83 c4 14             	add    $0x14,%esp
1000407d:	85 c9                	test   %ecx,%ecx
1000407f:	75 04                	jne    0x10004085
10004081:	33 c0                	xor    %eax,%eax
10004083:	eb 08                	jmp    0x1000408d
10004085:	8b 46 08             	mov    0x8(%esi),%eax
10004088:	2b c1                	sub    %ecx,%eax
1000408a:	c1 f8 02             	sar    $0x2,%eax
1000408d:	8b 7d 0c             	mov    0xc(%ebp),%edi
10004090:	03 f8                	add    %eax,%edi
10004092:	85 c9                	test   %ecx,%ecx
10004094:	74 09                	je     0x1000409f
10004096:	51                   	push   %ecx
10004097:	e8 41 19 00 00       	call   0x100059dd
1000409c:	83 c4 04             	add    $0x4,%esp
1000409f:	8b 55 ec             	mov    -0x14(%ebp),%edx
100040a2:	03 d3                	add    %ebx,%edx
100040a4:	8d 04 bb             	lea    (%ebx,%edi,4),%eax
100040a7:	89 56 0c             	mov    %edx,0xc(%esi)
100040aa:	89 46 08             	mov    %eax,0x8(%esi)
100040ad:	89 5e 04             	mov    %ebx,0x4(%esi)
100040b0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
100040b3:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
100040ba:	5f                   	pop    %edi
100040bb:	5e                   	pop    %esi
100040bc:	5b                   	pop    %ebx
100040bd:	8b e5                	mov    %ebp,%esp
100040bf:	5d                   	pop    %ebp
100040c0:	c2 0c 00             	ret    $0xc
100040c3:	8b 4d e8             	mov    -0x18(%ebp),%ecx
100040c6:	51                   	push   %ecx
100040c7:	e8 11 19 00 00       	call   0x100059dd
100040cc:	83 c4 04             	add    $0x4,%esp
100040cf:	6a 00                	push   $0x0
100040d1:	6a 00                	push   $0x0
100040d3:	e8 0a 19 00 00       	call   0x100059e2
100040d8:	8b 5e 08             	mov    0x8(%esi),%ebx
100040db:	8b 7d 08             	mov    0x8(%ebp),%edi
100040de:	8b c3                	mov    %ebx,%eax
100040e0:	2b c7                	sub    %edi,%eax
100040e2:	c1 f8 02             	sar    $0x2,%eax
100040e5:	3b c2                	cmp    %edx,%eax
100040e7:	73 61                	jae    0x1000414a
100040e9:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
100040f0:	89 45 08             	mov    %eax,0x8(%ebp)
100040f3:	03 c7                	add    %edi,%eax
100040f5:	50                   	push   %eax
100040f6:	51                   	push   %ecx
100040f7:	8b c4                	mov    %esp,%eax
100040f9:	89 65 e8             	mov    %esp,-0x18(%ebp)
100040fc:	51                   	push   %ecx
100040fd:	89 18                	mov    %ebx,(%eax)
100040ff:	8b c4                	mov    %esp,%eax
10004101:	8b ce                	mov    %esi,%ecx
10004103:	89 65 e8             	mov    %esp,-0x18(%ebp)
10004106:	89 38                	mov    %edi,(%eax)
10004108:	e8 d3 f4 ff ff       	call   0x100035e0
1000410d:	8b 4e 08             	mov    0x8(%esi),%ecx
10004110:	8b 45 0c             	mov    0xc(%ebp),%eax
10004113:	8d 55 10             	lea    0x10(%ebp),%edx
10004116:	52                   	push   %edx
10004117:	8b d1                	mov    %ecx,%edx
10004119:	2b d7                	sub    %edi,%edx
1000411b:	c1 fa 02             	sar    $0x2,%edx
1000411e:	2b c2                	sub    %edx,%eax
10004120:	50                   	push   %eax
10004121:	51                   	push   %ecx
10004122:	8b ce                	mov    %esi,%ecx
10004124:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%ebp)
1000412b:	e8 e0 f5 ff ff       	call   0x10003710
10004130:	8b 5e 08             	mov    0x8(%esi),%ebx
10004133:	8b 4d 08             	mov    0x8(%ebp),%ecx
10004136:	03 d9                	add    %ecx,%ebx
10004138:	8d 45 10             	lea    0x10(%ebp),%eax
1000413b:	89 5e 08             	mov    %ebx,0x8(%esi)
1000413e:	50                   	push   %eax
1000413f:	8b f3                	mov    %ebx,%esi
10004141:	51                   	push   %ecx
10004142:	8b c4                	mov    %esp,%eax
10004144:	2b f1                	sub    %ecx,%esi
10004146:	89 30                	mov    %esi,(%eax)
10004148:	eb 5d                	jmp    0x100041a7
1000414a:	53                   	push   %ebx
1000414b:	51                   	push   %ecx
1000414c:	8b c4                	mov    %esp,%eax
1000414e:	89 18                	mov    %ebx,(%eax)
10004150:	89 65 0c             	mov    %esp,0xc(%ebp)
10004153:	51                   	push   %ecx
10004154:	c1 e2 02             	shl    $0x2,%edx
10004157:	8b cc                	mov    %esp,%ecx
10004159:	8b c3                	mov    %ebx,%eax
1000415b:	2b c2                	sub    %edx,%eax
1000415d:	89 01                	mov    %eax,(%ecx)
1000415f:	89 65 0c             	mov    %esp,0xc(%ebp)
10004162:	8b ce                	mov    %esi,%ecx
10004164:	89 55 08             	mov    %edx,0x8(%ebp)
10004167:	89 45 0c             	mov    %eax,0xc(%ebp)
1000416a:	e8 71 f4 ff ff       	call   0x100035e0
1000416f:	51                   	push   %ecx
10004170:	89 46 08             	mov    %eax,0x8(%esi)
10004173:	8b c4                	mov    %esp,%eax
10004175:	89 65 e8             	mov    %esp,-0x18(%ebp)
10004178:	51                   	push   %ecx
10004179:	8b 4d 0c             	mov    0xc(%ebp),%ecx
1000417c:	89 18                	mov    %ebx,(%eax)
1000417e:	8b c4                	mov    %esp,%eax
10004180:	89 65 e8             	mov    %esp,-0x18(%ebp)
10004183:	51                   	push   %ecx
10004184:	89 08                	mov    %ecx,(%eax)
10004186:	8b c4                	mov    %esp,%eax
10004188:	8d 55 0c             	lea    0xc(%ebp),%edx
1000418b:	89 65 0c             	mov    %esp,0xc(%ebp)
1000418e:	52                   	push   %edx
1000418f:	89 38                	mov    %edi,(%eax)
10004191:	e8 fa e0 ff ff       	call   0x10002290
10004196:	83 c4 10             	add    $0x10,%esp
10004199:	8d 45 10             	lea    0x10(%ebp),%eax
1000419c:	50                   	push   %eax
1000419d:	51                   	push   %ecx
1000419e:	8b 4d 08             	mov    0x8(%ebp),%ecx
100041a1:	8b c4                	mov    %esp,%eax
100041a3:	03 cf                	add    %edi,%ecx
100041a5:	89 08                	mov    %ecx,(%eax)
100041a7:	89 65 0c             	mov    %esp,0xc(%ebp)
100041aa:	51                   	push   %ecx
100041ab:	8b c4                	mov    %esp,%eax
100041ad:	89 38                	mov    %edi,(%eax)
100041af:	89 65 0c             	mov    %esp,0xc(%ebp)
100041b2:	e8 19 d2 ff ff       	call   0x100013d0
100041b7:	83 c4 0c             	add    $0xc,%esp
100041ba:	8b 4d f4             	mov    -0xc(%ebp),%ecx
100041bd:	5f                   	pop    %edi
100041be:	5e                   	pop    %esi
100041bf:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
100041c6:	5b                   	pop    %ebx
100041c7:	8b e5                	mov    %ebp,%esp
100041c9:	5d                   	pop    %ebp
100041ca:	c2 0c 00             	ret    $0xc
100041cd:	90                   	nop
100041ce:	90                   	nop
100041cf:	90                   	nop
100041d0:	56                   	push   %esi
100041d1:	8b 71 04             	mov    0x4(%ecx),%esi
100041d4:	85 f6                	test   %esi,%esi
100041d6:	57                   	push   %edi
100041d7:	75 04                	jne    0x100041dd
100041d9:	33 c0                	xor    %eax,%eax
100041db:	eb 08                	jmp    0x100041e5
100041dd:	8b 41 08             	mov    0x8(%ecx),%eax
100041e0:	2b c6                	sub    %esi,%eax
100041e2:	c1 f8 02             	sar    $0x2,%eax
100041e5:	8b 54 24 0c          	mov    0xc(%esp),%edx
100041e9:	3b c2                	cmp    %edx,%eax
100041eb:	73 2a                	jae    0x10004217
100041ed:	85 f6                	test   %esi,%esi
100041ef:	75 04                	jne    0x100041f5
100041f1:	33 c0                	xor    %eax,%eax
100041f3:	eb 08                	jmp    0x100041fd
100041f5:	8b 41 08             	mov    0x8(%ecx),%eax
100041f8:	2b c6                	sub    %esi,%eax
100041fa:	c1 f8 02             	sar    $0x2,%eax
100041fd:	2b d0                	sub    %eax,%edx
100041ff:	8d 74 24 10          	lea    0x10(%esp),%esi
10004203:	56                   	push   %esi
10004204:	52                   	push   %edx
10004205:	8b 51 08             	mov    0x8(%ecx),%edx
10004208:	51                   	push   %ecx
10004209:	8b c4                	mov    %esp,%eax
1000420b:	89 10                	mov    %edx,(%eax)
1000420d:	e8 1e fd ff ff       	call   0x10003f30
10004212:	5f                   	pop    %edi
10004213:	5e                   	pop    %esi
10004214:	c2 08 00             	ret    $0x8
10004217:	85 f6                	test   %esi,%esi
10004219:	74 28                	je     0x10004243
1000421b:	8b 79 08             	mov    0x8(%ecx),%edi
1000421e:	8b c7                	mov    %edi,%eax
10004220:	2b c6                	sub    %esi,%eax
10004222:	c1 f8 02             	sar    $0x2,%eax
10004225:	3b d0                	cmp    %eax,%edx
10004227:	73 1a                	jae    0x10004243
10004229:	51                   	push   %ecx
1000422a:	8b c4                	mov    %esp,%eax
1000422c:	89 38                	mov    %edi,(%eax)
1000422e:	8b 41 04             	mov    0x4(%ecx),%eax
10004231:	51                   	push   %ecx
10004232:	8d 04 90             	lea    (%eax,%edx,4),%eax
10004235:	8b f4                	mov    %esp,%esi
10004237:	8d 54 24 14          	lea    0x14(%esp),%edx
1000423b:	52                   	push   %edx
1000423c:	89 06                	mov    %eax,(%esi)
1000423e:	e8 9d f7 ff ff       	call   0x100039e0
10004243:	5f                   	pop    %edi
10004244:	5e                   	pop    %esi
10004245:	c2 08 00             	ret    $0x8
10004248:	90                   	nop
10004249:	90                   	nop
1000424a:	90                   	nop
1000424b:	90                   	nop
1000424c:	90                   	nop
1000424d:	90                   	nop
1000424e:	90                   	nop
1000424f:	90                   	nop
10004250:	56                   	push   %esi
10004251:	8b f1                	mov    %ecx,%esi
10004253:	85 f6                	test   %esi,%esi
10004255:	74 0e                	je     0x10004265
10004257:	e8 64 fc ff ff       	call   0x10003ec0
1000425c:	56                   	push   %esi
1000425d:	e8 7b 17 00 00       	call   0x100059dd
10004262:	83 c4 04             	add    $0x4,%esp
10004265:	5e                   	pop    %esi
10004266:	c3                   	ret
10004267:	90                   	nop
10004268:	90                   	nop
10004269:	90                   	nop
1000426a:	90                   	nop
1000426b:	90                   	nop
1000426c:	90                   	nop
1000426d:	90                   	nop
1000426e:	90                   	nop
1000426f:	90                   	nop
10004270:	83 ec 18             	sub    $0x18,%esp
10004273:	57                   	push   %edi
10004274:	8b f9                	mov    %ecx,%edi
10004276:	8b 87 00 04 00 00    	mov    0x400(%edi),%eax
1000427c:	3b 47 24             	cmp    0x24(%edi),%eax
1000427f:	0f 85 69 01 00 00    	jne    0x100043ee
10004285:	8b 8f 04 04 00 00    	mov    0x404(%edi),%ecx
1000428b:	3b 4f 28             	cmp    0x28(%edi),%ecx
1000428e:	0f 85 5a 01 00 00    	jne    0x100043ee
10004294:	8b 97 fc 03 00 00    	mov    0x3fc(%edi),%edx
1000429a:	8b 4f 14             	mov    0x14(%edi),%ecx
1000429d:	53                   	push   %ebx
1000429e:	55                   	push   %ebp
1000429f:	33 c0                	xor    %eax,%eax
100042a1:	3b d0                	cmp    %eax,%edx
100042a3:	56                   	push   %esi
100042a4:	8b 77 18             	mov    0x18(%edi),%esi
100042a7:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
100042ab:	89 74 24 14          	mov    %esi,0x14(%esp)
100042af:	89 44 24 10          	mov    %eax,0x10(%esp)
100042b3:	0f 8c d6 00 00 00    	jl     0x1000438f
100042b9:	bb f8 fb ff ff       	mov    $0xfffffbf8,%ebx
100042be:	8d 97 08 04 00 00    	lea    0x408(%edi),%edx
100042c4:	2b df                	sub    %edi,%ebx
100042c6:	89 54 24 20          	mov    %edx,0x20(%esp)
100042ca:	89 5c 24 24          	mov    %ebx,0x24(%esp)
100042ce:	8b ff                	mov    %edi,%edi
100042d0:	0f be 12             	movsbl (%edx),%edx
100042d3:	3b c2                	cmp    %edx,%eax
100042d5:	74 7a                	je     0x10004351
100042d7:	8b af 00 03 00 00    	mov    0x300(%edi),%ebp
100042dd:	6b f6 0f             	imul   $0xf,%esi,%esi
100042e0:	8d 9f fc 02 00 00    	lea    0x2fc(%edi),%ebx
100042e6:	03 f1                	add    %ecx,%esi
100042e8:	8b 4d 04             	mov    0x4(%ebp),%ecx
100042eb:	8d 44 24 18          	lea    0x18(%esp),%eax
100042ef:	50                   	push   %eax
100042f0:	51                   	push   %ecx
100042f1:	55                   	push   %ebp
100042f2:	8b cb                	mov    %ebx,%ecx
100042f4:	89 74 24 24          	mov    %esi,0x24(%esp)
100042f8:	e8 03 f1 ff ff       	call   0x10003400
100042fd:	6a 01                	push   $0x1
100042ff:	8b cb                	mov    %ebx,%ecx
10004301:	89 44 24 1c          	mov    %eax,0x1c(%esp)
10004305:	e8 c6 f9 ff ff       	call   0x10003cd0
1000430a:	8b 44 24 18          	mov    0x18(%esp),%eax
1000430e:	89 45 04             	mov    %eax,0x4(%ebp)
10004311:	8b 50 04             	mov    0x4(%eax),%edx
10004314:	89 02                	mov    %eax,(%edx)
10004316:	8b 44 24 10          	mov    0x10(%esp),%eax
1000431a:	56                   	push   %esi
1000431b:	8d 4c 38 2c          	lea    0x2c(%eax,%edi,1),%ecx
1000431f:	68 4c c2 00 10       	push   $0x1000c24c
10004324:	51                   	push   %ecx
10004325:	ff 15 08 c1 00 10    	call   *0x1000c108  ; 0x1000c108=USER32.dll!wsprintfA
1000432b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
1000432f:	83 c4 0c             	add    $0xc,%esp
10004332:	83 fe 0a             	cmp    $0xa,%esi
10004335:	7d 05                	jge    0x1000433c
10004337:	83 c0 02             	add    $0x2,%eax
1000433a:	eb 0d                	jmp    0x10004349
1000433c:	83 fe 64             	cmp    $0x64,%esi
1000433f:	7d 05                	jge    0x10004346
10004341:	83 c0 03             	add    $0x3,%eax
10004344:	eb 03                	jmp    0x10004349
10004346:	83 c0 04             	add    $0x4,%eax
10004349:	8b 74 24 14          	mov    0x14(%esp),%esi
1000434d:	89 44 24 10          	mov    %eax,0x10(%esp)
10004351:	8b 54 24 20          	mov    0x20(%esp),%edx
10004355:	0f be 02             	movsbl (%edx),%eax
10004358:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
1000435c:	8b 9c 87 64 0d 00 00 	mov    0xd64(%edi,%eax,4),%ebx
10004363:	8b ac 87 74 0d 00 00 	mov    0xd74(%edi,%eax,4),%ebp
1000436a:	03 cb                	add    %ebx,%ecx
1000436c:	8b 5c 24 24          	mov    0x24(%esp),%ebx
10004370:	03 f5                	add    %ebp,%esi
10004372:	8b af fc 03 00 00    	mov    0x3fc(%edi),%ebp
10004378:	42                   	inc    %edx
10004379:	03 da                	add    %edx,%ebx
1000437b:	3b dd                	cmp    %ebp,%ebx
1000437d:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
10004381:	89 74 24 14          	mov    %esi,0x14(%esp)
10004385:	89 54 24 20          	mov    %edx,0x20(%esp)
10004389:	0f 8e 41 ff ff ff    	jle    0x100042d0
1000438f:	8b af 00 03 00 00    	mov    0x300(%edi),%ebp
10004395:	6b f6 0f             	imul   $0xf,%esi,%esi
10004398:	8b 45 04             	mov    0x4(%ebp),%eax
1000439b:	8d 9f fc 02 00 00    	lea    0x2fc(%edi),%ebx
100043a1:	8d 54 24 18          	lea    0x18(%esp),%edx
100043a5:	52                   	push   %edx
100043a6:	03 f1                	add    %ecx,%esi
100043a8:	50                   	push   %eax
100043a9:	55                   	push   %ebp
100043aa:	8b cb                	mov    %ebx,%ecx
100043ac:	89 74 24 24          	mov    %esi,0x24(%esp)
100043b0:	e8 4b f0 ff ff       	call   0x10003400
100043b5:	6a 01                	push   $0x1
100043b7:	8b cb                	mov    %ebx,%ecx
100043b9:	8b f0                	mov    %eax,%esi
100043bb:	e8 10 f9 ff ff       	call   0x10003cd0
100043c0:	8b 54 24 18          	mov    0x18(%esp),%edx
100043c4:	8b 44 24 10          	mov    0x10(%esp),%eax
100043c8:	89 75 04             	mov    %esi,0x4(%ebp)
100043cb:	8b 4e 04             	mov    0x4(%esi),%ecx
100043ce:	52                   	push   %edx
100043cf:	89 31                	mov    %esi,(%ecx)
100043d1:	8d 4c 38 2c          	lea    0x2c(%eax,%edi,1),%ecx
100043d5:	68 4c c2 00 10       	push   $0x1000c24c
100043da:	51                   	push   %ecx
100043db:	ff 15 08 c1 00 10    	call   *0x1000c108  ; 0x1000c108=USER32.dll!wsprintfA
100043e1:	83 c4 0c             	add    $0xc,%esp
100043e4:	5e                   	pop    %esi
100043e5:	5d                   	pop    %ebp
100043e6:	c6 87 f8 03 00 00 01 	movb   $0x1,0x3f8(%edi)
100043ed:	5b                   	pop    %ebx
100043ee:	5f                   	pop    %edi
100043ef:	83 c4 18             	add    $0x18,%esp
100043f2:	c3                   	ret
100043f3:	90                   	nop
100043f4:	90                   	nop
100043f5:	90                   	nop
100043f6:	90                   	nop
100043f7:	90                   	nop
100043f8:	90                   	nop
100043f9:	90                   	nop
100043fa:	90                   	nop
100043fb:	90                   	nop
100043fc:	90                   	nop
100043fd:	90                   	nop
100043fe:	90                   	nop
100043ff:	90                   	nop
10004400:	6a ff                	push   $0xffffffff
10004402:	68 c0 b2 00 10       	push   $0x1000b2c0
10004407:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
1000440d:	50                   	push   %eax
1000440e:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10004415:	83 ec 40             	sub    $0x40,%esp
10004418:	a1 30 f1 00 10       	mov    0x1000f130,%eax
1000441d:	33 44 24 4c          	xor    0x4c(%esp),%eax
10004421:	53                   	push   %ebx
10004422:	55                   	push   %ebp
10004423:	56                   	push   %esi
10004424:	8b f1                	mov    %ecx,%esi
10004426:	57                   	push   %edi
10004427:	89 44 24 4c          	mov    %eax,0x4c(%esp)
1000442b:	89 74 24 10          	mov    %esi,0x10(%esp)
1000442f:	e8 9c f2 ff ff       	call   0x100036d0
10004434:	8b 54 24 60          	mov    0x60(%esp),%edx
10004438:	8b ce                	mov    %esi,%ecx
1000443a:	2b ca                	sub    %edx,%ecx
1000443c:	8b c2                	mov    %edx,%eax
1000443e:	8d 79 2c             	lea    0x2c(%ecx),%edi
10004441:	8a 08                	mov    (%eax),%cl
10004443:	88 0c 07             	mov    %cl,(%edi,%eax,1)
10004446:	40                   	inc    %eax
10004447:	84 c9                	test   %cl,%cl
10004449:	75 f6                	jne    0x10004441
1000444b:	33 ff                	xor    %edi,%edi
1000444d:	8b c2                	mov    %edx,%eax
1000444f:	c7 44 24 48 0f 00 00 	movl   $0xf,0x48(%esp)
10004456:	00 
10004457:	89 7c 24 44          	mov    %edi,0x44(%esp)
1000445b:	c6 44 24 34 00       	movb   $0x0,0x34(%esp)
10004460:	8d 58 01             	lea    0x1(%eax),%ebx
10004463:	8a 08                	mov    (%eax),%cl
10004465:	40                   	inc    %eax
10004466:	84 c9                	test   %cl,%cl
10004468:	75 f9                	jne    0x10004463
1000446a:	2b c3                	sub    %ebx,%eax
1000446c:	50                   	push   %eax
1000446d:	52                   	push   %edx
1000446e:	8d 4c 24 38          	lea    0x38(%esp),%ecx
10004472:	e8 c9 d3 ff ff       	call   0x10001840
10004477:	89 7c 24 58          	mov    %edi,0x58(%esp)
1000447b:	eb 03                	jmp    0x10004480
1000447d:	8d 49 00             	lea    0x0(%ecx),%ecx
10004480:	b8 50 c2 00 10       	mov    $0x1000c250,%eax
10004485:	8d 50 01             	lea    0x1(%eax),%edx
10004488:	8a 08                	mov    (%eax),%cl
1000448a:	40                   	inc    %eax
1000448b:	84 c9                	test   %cl,%cl
1000448d:	75 f9                	jne    0x10004488
1000448f:	2b c2                	sub    %edx,%eax
10004491:	50                   	push   %eax
10004492:	57                   	push   %edi
10004493:	68 50 c2 00 10       	push   $0x1000c250
10004498:	8d 4c 24 3c          	lea    0x3c(%esp),%ecx
1000449c:	e8 af ee ff ff       	call   0x10003350
100044a1:	8b d8                	mov    %eax,%ebx
100044a3:	83 fb ff             	cmp    $0xffffffff,%ebx
100044a6:	0f 84 9f 00 00 00    	je     0x1000454b
100044ac:	8b d3                	mov    %ebx,%edx
100044ae:	2b d7                	sub    %edi,%edx
100044b0:	52                   	push   %edx
100044b1:	57                   	push   %edi
100044b2:	8d 44 24 1c          	lea    0x1c(%esp),%eax
100044b6:	50                   	push   %eax
100044b7:	8d 4c 24 3c          	lea    0x3c(%esp),%ecx
100044bb:	e8 70 f7 ff ff       	call   0x10003c30
100044c0:	83 7c 24 2c 10       	cmpl   $0x10,0x2c(%esp)
100044c5:	8b 44 24 18          	mov    0x18(%esp),%eax
100044c9:	c6 44 24 58 01       	movb   $0x1,0x58(%esp)
100044ce:	73 04                	jae    0x100044d4
100044d0:	8d 44 24 18          	lea    0x18(%esp),%eax
100044d4:	50                   	push   %eax
100044d5:	e8 5b 1c 00 00       	call   0x10006135
100044da:	8b be 00 03 00 00    	mov    0x300(%esi),%edi
100044e0:	8b 57 04             	mov    0x4(%edi),%edx
100044e3:	83 c4 04             	add    $0x4,%esp
100044e6:	81 c6 fc 02 00 00    	add    $0x2fc,%esi
100044ec:	8d 4c 24 60          	lea    0x60(%esp),%ecx
100044f0:	51                   	push   %ecx
100044f1:	52                   	push   %edx
100044f2:	57                   	push   %edi
100044f3:	8b ce                	mov    %esi,%ecx
100044f5:	89 44 24 6c          	mov    %eax,0x6c(%esp)
100044f9:	e8 02 ef ff ff       	call   0x10003400
100044fe:	6a 01                	push   $0x1
10004500:	8b ce                	mov    %esi,%ecx
10004502:	8b e8                	mov    %eax,%ebp
10004504:	e8 c7 f7 ff ff       	call   0x10003cd0
10004509:	89 6f 04             	mov    %ebp,0x4(%edi)
1000450c:	8b 45 04             	mov    0x4(%ebp),%eax
1000450f:	89 28                	mov    %ebp,(%eax)
10004511:	83 7c 24 2c 10       	cmpl   $0x10,0x2c(%esp)
10004516:	8d 7b 01             	lea    0x1(%ebx),%edi
10004519:	c6 44 24 58 00       	movb   $0x0,0x58(%esp)
1000451e:	72 0d                	jb     0x1000452d
10004520:	8b 44 24 18          	mov    0x18(%esp),%eax
10004524:	50                   	push   %eax
10004525:	e8 b3 14 00 00       	call   0x100059dd
1000452a:	83 c4 04             	add    $0x4,%esp
1000452d:	8b 74 24 10          	mov    0x10(%esp),%esi
10004531:	c7 44 24 2c 0f 00 00 	movl   $0xf,0x2c(%esp)
10004538:	00 
10004539:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
10004540:	00 
10004541:	c6 44 24 18 00       	movb   $0x0,0x18(%esp)
10004546:	e9 35 ff ff ff       	jmp    0x10004480
1000454b:	83 7c 24 48 10       	cmpl   $0x10,0x48(%esp)
10004550:	5f                   	pop    %edi
10004551:	5e                   	pop    %esi
10004552:	5d                   	pop    %ebp
10004553:	5b                   	pop    %ebx
10004554:	72 0d                	jb     0x10004563
10004556:	8b 4c 24 24          	mov    0x24(%esp),%ecx
1000455a:	51                   	push   %ecx
1000455b:	e8 7d 14 00 00       	call   0x100059dd
10004560:	83 c4 04             	add    $0x4,%esp
10004563:	8b 4c 24 40          	mov    0x40(%esp),%ecx
10004567:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
1000456e:	8b 4c 24 3c          	mov    0x3c(%esp),%ecx
10004572:	33 4c 24 4c          	xor    0x4c(%esp),%ecx
10004576:	e8 f0 1b 00 00       	call   0x1000616b
1000457b:	83 c4 4c             	add    $0x4c,%esp
1000457e:	c2 04 00             	ret    $0x4
10004581:	90                   	nop
10004582:	90                   	nop
10004583:	90                   	nop
10004584:	90                   	nop
10004585:	90                   	nop
10004586:	90                   	nop
10004587:	90                   	nop
10004588:	90                   	nop
10004589:	90                   	nop
1000458a:	90                   	nop
1000458b:	90                   	nop
1000458c:	90                   	nop
1000458d:	90                   	nop
1000458e:	90                   	nop
1000458f:	90                   	nop
10004590:	6a ff                	push   $0xffffffff
10004592:	68 db b2 00 10       	push   $0x1000b2db
10004597:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
1000459d:	50                   	push   %eax
1000459e:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
100045a5:	51                   	push   %ecx
100045a6:	8b 44 24 14          	mov    0x14(%esp),%eax
100045aa:	56                   	push   %esi
100045ab:	8b f1                	mov    %ecx,%esi
100045ad:	8a 08                	mov    (%eax),%cl
100045af:	57                   	push   %edi
100045b0:	88 0e                	mov    %cl,(%esi)
100045b2:	8d 7e 04             	lea    0x4(%esi),%edi
100045b5:	8b cf                	mov    %edi,%ecx
100045b7:	89 74 24 08          	mov    %esi,0x8(%esp)
100045bb:	e8 70 ee ff ff       	call   0x10003430
100045c0:	89 47 04             	mov    %eax,0x4(%edi)
100045c3:	33 c0                	xor    %eax,%eax
100045c5:	89 47 08             	mov    %eax,0x8(%edi)
100045c8:	8b 56 08             	mov    0x8(%esi),%edx
100045cb:	8d 7e 10             	lea    0x10(%esi),%edi
100045ce:	6a 24                	push   $0x24
100045d0:	89 44 24 18          	mov    %eax,0x18(%esp)
100045d4:	89 54 24 20          	mov    %edx,0x20(%esp)
100045d8:	89 47 04             	mov    %eax,0x4(%edi)
100045db:	89 47 08             	mov    %eax,0x8(%edi)
100045de:	89 47 0c             	mov    %eax,0xc(%edi)
100045e1:	e8 2a 0f 00 00       	call   0x10005510
100045e6:	89 47 04             	mov    %eax,0x4(%edi)
100045e9:	89 47 08             	mov    %eax,0x8(%edi)
100045ec:	83 c0 24             	add    $0x24,%eax
100045ef:	83 c4 04             	add    $0x4,%esp
100045f2:	89 47 0c             	mov    %eax,0xc(%edi)
100045f5:	8d 44 24 1c          	lea    0x1c(%esp),%eax
100045f9:	50                   	push   %eax
100045fa:	6a 09                	push   $0x9
100045fc:	8b cf                	mov    %edi,%ecx
100045fe:	e8 1d f4 ff ff       	call   0x10003a20
10004603:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
10004607:	b8 01 00 00 00       	mov    $0x1,%eax
1000460c:	89 46 20             	mov    %eax,0x20(%esi)
1000460f:	89 46 24             	mov    %eax,0x24(%esi)
10004612:	5f                   	pop    %edi
10004613:	8b c6                	mov    %esi,%eax
10004615:	5e                   	pop    %esi
10004616:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
1000461d:	83 c4 10             	add    $0x10,%esp
10004620:	c2 08 00             	ret    $0x8
10004623:	90                   	nop
10004624:	90                   	nop
10004625:	90                   	nop
10004626:	90                   	nop
10004627:	90                   	nop
10004628:	90                   	nop
10004629:	90                   	nop
1000462a:	90                   	nop
1000462b:	90                   	nop
1000462c:	90                   	nop
1000462d:	90                   	nop
1000462e:	90                   	nop
1000462f:	90                   	nop
10004630:	51                   	push   %ecx
10004631:	56                   	push   %esi
10004632:	8b f1                	mov    %ecx,%esi
10004634:	8d 44 24 0c          	lea    0xc(%esp),%eax
10004638:	50                   	push   %eax
10004639:	8d 4c 24 08          	lea    0x8(%esp),%ecx
1000463d:	51                   	push   %ecx
1000463e:	8d 4e 38             	lea    0x38(%esi),%ecx
10004641:	e8 0a ef ff ff       	call   0x10003550
10004646:	8b 4e 40             	mov    0x40(%esi),%ecx
10004649:	8b 44 24 04          	mov    0x4(%esp),%eax
1000464d:	3b c1                	cmp    %ecx,%eax
1000464f:	5e                   	pop    %esi
10004650:	74 0d                	je     0x1000465f
10004652:	8b 54 24 0c          	mov    0xc(%esp),%edx
10004656:	8b 48 0c             	mov    0xc(%eax),%ecx
10004659:	52                   	push   %edx
1000465a:	e8 a1 fd ff ff       	call   0x10004400
1000465f:	59                   	pop    %ecx
10004660:	c2 08 00             	ret    $0x8
10004663:	90                   	nop
10004664:	90                   	nop
10004665:	90                   	nop
10004666:	90                   	nop
10004667:	90                   	nop
10004668:	90                   	nop
10004669:	90                   	nop
1000466a:	90                   	nop
1000466b:	90                   	nop
1000466c:	90                   	nop
1000466d:	90                   	nop
1000466e:	90                   	nop
1000466f:	90                   	nop
10004670:	56                   	push   %esi
10004671:	57                   	push   %edi
10004672:	8b 7c 24 0c          	mov    0xc(%esp),%edi
10004676:	8b f1                	mov    %ecx,%esi
10004678:	8b 4e 0c             	mov    0xc(%esi),%ecx
1000467b:	57                   	push   %edi
1000467c:	e8 bf f0 ff ff       	call   0x10003740
10004681:	84 c0                	test   %al,%al
10004683:	0f 84 05 01 00 00    	je     0x1000478e
10004689:	8b 4e 18             	mov    0x18(%esi),%ecx
1000468c:	8b 46 14             	mov    0x14(%esi),%eax
1000468f:	53                   	push   %ebx
10004690:	89 8e 04 04 00 00    	mov    %ecx,0x404(%esi)
10004696:	b3 01                	mov    $0x1,%bl
10004698:	8b ce                	mov    %esi,%ecx
1000469a:	89 86 00 04 00 00    	mov    %eax,0x400(%esi)
100046a0:	88 5e 1c             	mov    %bl,0x1c(%esi)
100046a3:	89 7e 20             	mov    %edi,0x20(%esi)
100046a6:	e8 25 f0 ff ff       	call   0x100036d0
100046ab:	33 c0                	xor    %eax,%eax
100046ad:	c6 86 f8 03 00 00 00 	movb   $0x0,0x3f8(%esi)
100046b4:	c7 86 fc 03 00 00 ff 	movl   $0xffffffff,0x3fc(%esi)
100046bb:	ff ff ff 
100046be:	b9 3c 00 00 00       	mov    $0x3c,%ecx
100046c3:	8d be 08 03 00 00    	lea    0x308(%esi),%edi
100046c9:	f3 ab                	rep stos %eax,%es:(%edi)
100046cb:	b9 58 02 00 00       	mov    $0x258,%ecx
100046d0:	8d be 08 04 00 00    	lea    0x408(%esi),%edi
100046d6:	f3 ab                	rep stos %eax,%es:(%edi)
100046d8:	8b 46 20             	mov    0x20(%esi),%eax
100046db:	99                   	cltd
100046dc:	b9 0f 00 00 00       	mov    $0xf,%ecx
100046e1:	f7 f9                	idiv   %ecx
100046e3:	8b 8e 00 04 00 00    	mov    0x400(%esi),%ecx
100046e9:	89 56 24             	mov    %edx,0x24(%esi)
100046ec:	8b 96 04 04 00 00    	mov    0x404(%esi),%edx
100046f2:	6b d2 0f             	imul   $0xf,%edx,%edx
100046f5:	03 d1                	add    %ecx,%edx
100046f7:	89 46 28             	mov    %eax,0x28(%esi)
100046fa:	88 9c 32 08 03 00 00 	mov    %bl,0x308(%edx,%esi,1)
10004701:	8a 86 f8 03 00 00    	mov    0x3f8(%esi),%al
10004707:	84 c0                	test   %al,%al
10004709:	0f 85 7a 00 00 00    	jne    0x10004789
1000470f:	90                   	nop
10004710:	ff 86 fc 03 00 00    	incl   0x3fc(%esi)
10004716:	c6 86 f9 03 00 00 00 	movb   $0x0,0x3f9(%esi)
1000471d:	8d 49 00             	lea    0x0(%ecx),%ecx
10004720:	8b ce                	mov    %esi,%ecx
10004722:	e8 79 e9 ff ff       	call   0x100030a0
10004727:	8b 8e fc 03 00 00    	mov    0x3fc(%esi),%ecx
1000472d:	88 84 0e 08 04 00 00 	mov    %al,0x408(%esi,%ecx,1)
10004734:	8b ce                	mov    %esi,%ecx
10004736:	e8 15 f2 ff ff       	call   0x10003950
1000473b:	84 c0                	test   %al,%al
1000473d:	74 09                	je     0x10004748
1000473f:	8b ce                	mov    %esi,%ecx
10004741:	e8 2a fb ff ff       	call   0x10004270
10004746:	eb 27                	jmp    0x1000476f
10004748:	8b 96 fc 03 00 00    	mov    0x3fc(%esi),%edx
1000474e:	80 bc 16 08 04 00 00 	cmpb   $0x4,0x408(%esi,%edx,1)
10004755:	04 
10004756:	7e 07                	jle    0x1000475f
10004758:	8b ce                	mov    %esi,%ecx
1000475a:	e8 71 eb ff ff       	call   0x100032d0
1000475f:	8b 86 fc 03 00 00    	mov    0x3fc(%esi),%eax
10004765:	85 c0                	test   %eax,%eax
10004767:	7d 0c                	jge    0x10004775
10004769:	88 9e f8 03 00 00    	mov    %bl,0x3f8(%esi)
1000476f:	88 9e f9 03 00 00    	mov    %bl,0x3f9(%esi)
10004775:	8a 86 f9 03 00 00    	mov    0x3f9(%esi),%al
1000477b:	84 c0                	test   %al,%al
1000477d:	74 a1                	je     0x10004720
1000477f:	8a 86 f8 03 00 00    	mov    0x3f8(%esi),%al
10004785:	84 c0                	test   %al,%al
10004787:	74 87                	je     0x10004710
10004789:	c6 46 1c 00          	movb   $0x0,0x1c(%esi)
1000478d:	5b                   	pop    %ebx
1000478e:	5f                   	pop    %edi
1000478f:	5e                   	pop    %esi
10004790:	c2 04 00             	ret    $0x4
10004793:	90                   	nop
10004794:	90                   	nop
10004795:	90                   	nop
10004796:	90                   	nop
10004797:	90                   	nop
10004798:	90                   	nop
10004799:	90                   	nop
1000479a:	90                   	nop
1000479b:	90                   	nop
1000479c:	90                   	nop
1000479d:	90                   	nop
1000479e:	90                   	nop
1000479f:	90                   	nop
100047a0:	6a ff                	push   $0xffffffff
100047a2:	68 fb b2 00 10       	push   $0x1000b2fb
100047a7:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
100047ad:	50                   	push   %eax
100047ae:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
100047b5:	83 ec 08             	sub    $0x8,%esp
100047b8:	56                   	push   %esi
100047b9:	8b f1                	mov    %ecx,%esi
100047bb:	8d 44 24 07          	lea    0x7(%esp),%eax
100047bf:	50                   	push   %eax
100047c0:	8d 54 24 0b          	lea    0xb(%esp),%edx
100047c4:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
100047cb:	8d 4e 10             	lea    0x10(%esi),%ecx
100047ce:	52                   	push   %edx
100047cf:	89 74 24 10          	mov    %esi,0x10(%esp)
100047d3:	c7 46 0c 00 00 00 00 	movl   $0x0,0xc(%esi)
100047da:	c7 06 38 c2 00 10    	movl   $0x1000c238,(%esi)
100047e0:	e8 ab fd ff ff       	call   0x10004590
100047e5:	8d 44 24 07          	lea    0x7(%esp),%eax
100047e9:	50                   	push   %eax
100047ea:	8d 4c 24 0b          	lea    0xb(%esp),%ecx
100047ee:	51                   	push   %ecx
100047ef:	8d 4e 38             	lea    0x38(%esi),%ecx
100047f2:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
100047f9:	00 
100047fa:	e8 91 fd ff ff       	call   0x10004590
100047ff:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
10004803:	8b c6                	mov    %esi,%eax
10004805:	5e                   	pop    %esi
10004806:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
1000480d:	83 c4 14             	add    $0x14,%esp
10004810:	c3                   	ret
10004811:	90                   	nop
10004812:	90                   	nop
10004813:	90                   	nop
10004814:	90                   	nop
10004815:	90                   	nop
10004816:	90                   	nop
10004817:	90                   	nop
10004818:	90                   	nop
10004819:	90                   	nop
1000481a:	90                   	nop
1000481b:	90                   	nop
1000481c:	90                   	nop
1000481d:	90                   	nop
1000481e:	90                   	nop
1000481f:	90                   	nop
10004820:	51                   	push   %ecx
10004821:	56                   	push   %esi
10004822:	8b f1                	mov    %ecx,%esi
10004824:	8d 44 24 0c          	lea    0xc(%esp),%eax
10004828:	50                   	push   %eax
10004829:	8d 4c 24 08          	lea    0x8(%esp),%ecx
1000482d:	51                   	push   %ecx
1000482e:	8d 4e 38             	lea    0x38(%esi),%ecx
10004831:	e8 1a ed ff ff       	call   0x10003550
10004836:	8b 4e 40             	mov    0x40(%esi),%ecx
10004839:	8b 44 24 04          	mov    0x4(%esp),%eax
1000483d:	3b c1                	cmp    %ecx,%eax
1000483f:	5e                   	pop    %esi
10004840:	74 0d                	je     0x1000484f
10004842:	8b 54 24 0c          	mov    0xc(%esp),%edx
10004846:	8b 48 0c             	mov    0xc(%eax),%ecx
10004849:	52                   	push   %edx
1000484a:	e8 21 fe ff ff       	call   0x10004670
1000484f:	59                   	pop    %ecx
10004850:	c2 08 00             	ret    $0x8
10004853:	90                   	nop
10004854:	90                   	nop
10004855:	90                   	nop
10004856:	90                   	nop
10004857:	90                   	nop
10004858:	90                   	nop
10004859:	90                   	nop
1000485a:	90                   	nop
1000485b:	90                   	nop
1000485c:	90                   	nop
1000485d:	90                   	nop
1000485e:	90                   	nop
1000485f:	90                   	nop
10004860:	83 ec 08             	sub    $0x8,%esp
10004863:	53                   	push   %ebx
10004864:	55                   	push   %ebp
10004865:	56                   	push   %esi
10004866:	8b f1                	mov    %ecx,%esi
10004868:	8b 46 0c             	mov    0xc(%esi),%eax
1000486b:	57                   	push   %edi
1000486c:	8b 7e 24             	mov    0x24(%esi),%edi
1000486f:	c1 e8 02             	shr    $0x2,%eax
10004872:	3b f8                	cmp    %eax,%edi
10004874:	0f 87 52 01 00 00    	ja     0x100049cc
1000487a:	8b 56 14             	mov    0x14(%esi),%edx
1000487d:	85 d2                	test   %edx,%edx
1000487f:	8d 4e 10             	lea    0x10(%esi),%ecx
10004882:	75 04                	jne    0x10004888
10004884:	33 c0                	xor    %eax,%eax
10004886:	eb 08                	jmp    0x10004890
10004888:	8b 41 08             	mov    0x8(%ecx),%eax
1000488b:	2b c2                	sub    %edx,%eax
1000488d:	c1 f8 02             	sar    $0x2,%eax
10004890:	48                   	dec    %eax
10004891:	3b c7                	cmp    %edi,%eax
10004893:	77 29                	ja     0x100048be
10004895:	8b 51 04             	mov    0x4(%ecx),%edx
10004898:	85 d2                	test   %edx,%edx
1000489a:	75 04                	jne    0x100048a0
1000489c:	33 c0                	xor    %eax,%eax
1000489e:	eb 08                	jmp    0x100048a8
100048a0:	8b 41 08             	mov    0x8(%ecx),%eax
100048a3:	2b c2                	sub    %edx,%eax
100048a5:	c1 f8 02             	sar    $0x2,%eax
100048a8:	8b 56 08             	mov    0x8(%esi),%edx
100048ab:	8d 44 00 fd          	lea    -0x3(%eax,%eax,1),%eax
100048af:	89 46 20             	mov    %eax,0x20(%esi)
100048b2:	52                   	push   %edx
100048b3:	83 c0 02             	add    $0x2,%eax
100048b6:	50                   	push   %eax
100048b7:	e8 14 f9 ff ff       	call   0x100041d0
100048bc:	eb 0e                	jmp    0x100048cc
100048be:	8b 46 20             	mov    0x20(%esi),%eax
100048c1:	3b c7                	cmp    %edi,%eax
100048c3:	73 07                	jae    0x100048cc
100048c5:	8d 4c 00 01          	lea    0x1(%eax,%eax,1),%ecx
100048c9:	89 4e 20             	mov    %ecx,0x20(%esi)
100048cc:	8b 46 20             	mov    0x20(%esi),%eax
100048cf:	8b 56 24             	mov    0x24(%esi),%edx
100048d2:	8b 4e 14             	mov    0x14(%esi),%ecx
100048d5:	d1 e8                	shr    $1,%eax
100048d7:	2b d0                	sub    %eax,%edx
100048d9:	4a                   	dec    %edx
100048da:	8b 3c 91             	mov    (%ecx,%edx,4),%edi
100048dd:	8d 04 91             	lea    (%ecx,%edx,4),%eax
100048e0:	3b 78 04             	cmp    0x4(%eax),%edi
100048e3:	89 54 24 10          	mov    %edx,0x10(%esp)
100048e7:	0f 84 dc 00 00 00    	je     0x100049c9
100048ed:	8d 49 00             	lea    0x0(%ecx),%ecx
100048f0:	8b 47 08             	mov    0x8(%edi),%eax
100048f3:	23 46 20             	and    0x20(%esi),%eax
100048f6:	3b c2                	cmp    %edx,%eax
100048f8:	75 07                	jne    0x10004901
100048fa:	8b 3f                	mov    (%edi),%edi
100048fc:	e9 bb 00 00 00       	jmp    0x100049bc
10004901:	8b 46 24             	mov    0x24(%esi),%eax
10004904:	3b d0                	cmp    %eax,%edx
10004906:	73 1d                	jae    0x10004925
10004908:	eb 06                	jmp    0x10004910
1000490a:	8d 9b 00 00 00 00    	lea    0x0(%ebx),%ebx
10004910:	8b 4e 14             	mov    0x14(%esi),%ecx
10004913:	8b 1c 81             	mov    (%ecx,%eax,4),%ebx
10004916:	3b 5e 08             	cmp    0x8(%esi),%ebx
10004919:	8d 0c 81             	lea    (%ecx,%eax,4),%ecx
1000491c:	75 07                	jne    0x10004925
1000491e:	48                   	dec    %eax
1000491f:	3b d0                	cmp    %eax,%edx
10004921:	89 39                	mov    %edi,(%ecx)
10004923:	72 eb                	jb     0x10004910
10004925:	8b 07                	mov    (%edi),%eax
10004927:	3b 46 08             	cmp    0x8(%esi),%eax
1000492a:	89 44 24 14          	mov    %eax,0x14(%esp)
1000492e:	0f 84 95 00 00 00    	je     0x100049c9
10004934:	8b 4e 14             	mov    0x14(%esi),%ecx
10004937:	3b 3c 91             	cmp    (%ecx,%edx,4),%edi
1000493a:	8b c2                	mov    %edx,%eax
1000493c:	75 1f                	jne    0x1000495d
1000493e:	8b ff                	mov    %edi,%edi
10004940:	85 c0                	test   %eax,%eax
10004942:	8b 4e 14             	mov    0x14(%esi),%ecx
10004945:	8b 1c 81             	mov    (%ecx,%eax,4),%ebx
10004948:	8b 1b                	mov    (%ebx),%ebx
1000494a:	8d 0c 81             	lea    (%ecx,%eax,4),%ecx
1000494d:	89 19                	mov    %ebx,(%ecx)
1000494f:	74 0c                	je     0x1000495d
10004951:	8b 4e 14             	mov    0x14(%esi),%ecx
10004954:	8b 5c 81 fc          	mov    -0x4(%ecx,%eax,4),%ebx
10004958:	48                   	dec    %eax
10004959:	3b fb                	cmp    %ebx,%edi
1000495b:	74 e3                	je     0x10004940
1000495d:	8b 46 08             	mov    0x8(%esi),%eax
10004960:	3b f8                	cmp    %eax,%edi
10004962:	8b 5e 08             	mov    0x8(%esi),%ebx
10004965:	8d 4e 04             	lea    0x4(%esi),%ecx
10004968:	74 41                	je     0x100049ab
1000496a:	3b df                	cmp    %edi,%ebx
1000496c:	74 3d                	je     0x100049ab
1000496e:	8b 2f                	mov    (%edi),%ebp
10004970:	3b dd                	cmp    %ebp,%ebx
10004972:	74 37                	je     0x100049ab
10004974:	3b c9                	cmp    %ecx,%ecx
10004976:	74 12                	je     0x1000498a
10004978:	6a 01                	push   $0x1
1000497a:	e8 01 f4 ff ff       	call   0x10003d80
1000497f:	8b 46 0c             	mov    0xc(%esi),%eax
10004982:	8b 54 24 10          	mov    0x10(%esp),%edx
10004986:	48                   	dec    %eax
10004987:	89 46 0c             	mov    %eax,0xc(%esi)
1000498a:	8b 47 04             	mov    0x4(%edi),%eax
1000498d:	89 28                	mov    %ebp,(%eax)
1000498f:	8b 4d 04             	mov    0x4(%ebp),%ecx
10004992:	89 19                	mov    %ebx,(%ecx)
10004994:	8b 43 04             	mov    0x4(%ebx),%eax
10004997:	89 38                	mov    %edi,(%eax)
10004999:	8b 4d 04             	mov    0x4(%ebp),%ecx
1000499c:	8b 43 04             	mov    0x4(%ebx),%eax
1000499f:	89 4b 04             	mov    %ecx,0x4(%ebx)
100049a2:	8b 4f 04             	mov    0x4(%edi),%ecx
100049a5:	89 4d 04             	mov    %ecx,0x4(%ebp)
100049a8:	89 47 04             	mov    %eax,0x4(%edi)
100049ab:	8b 46 24             	mov    0x24(%esi),%eax
100049ae:	8b 4e 14             	mov    0x14(%esi),%ecx
100049b1:	8b 5e 08             	mov    0x8(%esi),%ebx
100049b4:	8b 7c 24 14          	mov    0x14(%esp),%edi
100049b8:	89 5c 81 04          	mov    %ebx,0x4(%ecx,%eax,4)
100049bc:	8b 46 14             	mov    0x14(%esi),%eax
100049bf:	3b 7c 90 04          	cmp    0x4(%eax,%edx,4),%edi
100049c3:	0f 85 27 ff ff ff    	jne    0x100048f0
100049c9:	ff 46 24             	incl   0x24(%esi)
100049cc:	8b 6c 24 20          	mov    0x20(%esp),%ebp
100049d0:	8b 55 00             	mov    0x0(%ebp),%edx
100049d3:	8b 4e 20             	mov    0x20(%esi),%ecx
100049d6:	8b 7e 24             	mov    0x24(%esi),%edi
100049d9:	8b c2                	mov    %edx,%eax
100049db:	23 c1                	and    %ecx,%eax
100049dd:	3b f8                	cmp    %eax,%edi
100049df:	77 09                	ja     0x100049ea
100049e1:	d1 e9                	shr    $1,%ecx
100049e3:	83 cf ff             	or     $0xffffffff,%edi
100049e6:	2b f9                	sub    %ecx,%edi
100049e8:	03 c7                	add    %edi,%eax
100049ea:	8b 4e 14             	mov    0x14(%esi),%ecx
100049ed:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
100049f4:	8b 7c 19 04          	mov    0x4(%ecx,%ebx,1),%edi
100049f8:	89 44 24 20          	mov    %eax,0x20(%esp)
100049fc:	8d 04 19             	lea    (%ecx,%ebx,1),%eax
100049ff:	3b 38                	cmp    (%eax),%edi
10004a01:	74 10                	je     0x10004a13
10004a03:	8b 7f 04             	mov    0x4(%edi),%edi
10004a06:	39 57 08             	cmp    %edx,0x8(%edi)
10004a09:	7e 6b                	jle    0x10004a76
10004a0b:	8b 46 14             	mov    0x14(%esi),%eax
10004a0e:	3b 3c 03             	cmp    (%ebx,%eax,1),%edi
10004a11:	75 f0                	jne    0x10004a03
10004a13:	8b 57 04             	mov    0x4(%edi),%edx
10004a16:	55                   	push   %ebp
10004a17:	52                   	push   %edx
10004a18:	8d 4e 04             	lea    0x4(%esi),%ecx
10004a1b:	57                   	push   %edi
10004a1c:	e8 7f ea ff ff       	call   0x100034a0
10004a21:	6a 01                	push   $0x1
10004a23:	8d 4e 04             	lea    0x4(%esi),%ecx
10004a26:	8b e8                	mov    %eax,%ebp
10004a28:	e8 53 f3 ff ff       	call   0x10003d80
10004a2d:	89 6f 04             	mov    %ebp,0x4(%edi)
10004a30:	8b 45 04             	mov    0x4(%ebp),%eax
10004a33:	89 28                	mov    %ebp,(%eax)
10004a35:	8b 56 14             	mov    0x14(%esi),%edx
10004a38:	3b 3c 13             	cmp    (%ebx,%edx,1),%edi
10004a3b:	8b 4f 04             	mov    0x4(%edi),%ecx
10004a3e:	75 22                	jne    0x10004a62
10004a40:	8b 46 14             	mov    0x14(%esi),%eax
10004a43:	89 0c 03             	mov    %ecx,(%ebx,%eax,1)
10004a46:	8b 44 24 20          	mov    0x20(%esp),%eax
10004a4a:	85 c0                	test   %eax,%eax
10004a4c:	74 14                	je     0x10004a62
10004a4e:	8b 56 14             	mov    0x14(%esi),%edx
10004a51:	48                   	dec    %eax
10004a52:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
10004a59:	89 44 24 20          	mov    %eax,0x20(%esp)
10004a5d:	3b 3c 13             	cmp    (%ebx,%edx,1),%edi
10004a60:	74 de                	je     0x10004a40
10004a62:	8b 44 24 1c          	mov    0x1c(%esp),%eax
10004a66:	5f                   	pop    %edi
10004a67:	5e                   	pop    %esi
10004a68:	5d                   	pop    %ebp
10004a69:	89 08                	mov    %ecx,(%eax)
10004a6b:	c6 40 04 01          	movb   $0x1,0x4(%eax)
10004a6f:	5b                   	pop    %ebx
10004a70:	83 c4 08             	add    $0x8,%esp
10004a73:	c2 08 00             	ret    $0x8
10004a76:	7d 04                	jge    0x10004a7c
10004a78:	8b 3f                	mov    (%edi),%edi
10004a7a:	eb 97                	jmp    0x10004a13
10004a7c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
10004a80:	89 38                	mov    %edi,(%eax)
10004a82:	5f                   	pop    %edi
10004a83:	5e                   	pop    %esi
10004a84:	5d                   	pop    %ebp
10004a85:	c6 40 04 00          	movb   $0x0,0x4(%eax)
10004a89:	5b                   	pop    %ebx
10004a8a:	83 c4 08             	add    $0x8,%esp
10004a8d:	c2 08 00             	ret    $0x8
10004a90:	6a ff                	push   $0xffffffff
10004a92:	68 1b b3 00 10       	push   $0x1000b31b
10004a97:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10004a9d:	50                   	push   %eax
10004a9e:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10004aa5:	51                   	push   %ecx
10004aa6:	6a 60                	push   $0x60
10004aa8:	e8 63 0a 00 00       	call   0x10005510
10004aad:	83 c4 04             	add    $0x4,%esp
10004ab0:	89 44 24 00          	mov    %eax,0x0(%esp)
10004ab4:	85 c0                	test   %eax,%eax
10004ab6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
10004abd:	00 
10004abe:	74 16                	je     0x10004ad6
10004ac0:	8b c8                	mov    %eax,%ecx
10004ac2:	e8 d9 fc ff ff       	call   0x100047a0
10004ac7:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10004acb:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10004ad2:	83 c4 10             	add    $0x10,%esp
10004ad5:	c3                   	ret
10004ad6:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10004ada:	33 c0                	xor    %eax,%eax
10004adc:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10004ae3:	83 c4 10             	add    $0x10,%esp
10004ae6:	c3                   	ret
10004ae7:	90                   	nop
10004ae8:	90                   	nop
10004ae9:	90                   	nop
10004aea:	90                   	nop
10004aeb:	90                   	nop
10004aec:	90                   	nop
10004aed:	90                   	nop
10004aee:	90                   	nop
10004aef:	90                   	nop
10004af0:	83 ec 10             	sub    $0x10,%esp
10004af3:	8b 44 24 14          	mov    0x14(%esp),%eax
10004af7:	8b 54 24 18          	mov    0x18(%esp),%edx
10004afb:	89 44 24 00          	mov    %eax,0x0(%esp)
10004aff:	8d 44 24 00          	lea    0x0(%esp),%eax
10004b03:	89 54 24 04          	mov    %edx,0x4(%esp)
10004b07:	50                   	push   %eax
10004b08:	8d 54 24 0c          	lea    0xc(%esp),%edx
10004b0c:	52                   	push   %edx
10004b0d:	83 c1 10             	add    $0x10,%ecx
10004b10:	e8 4b fd ff ff       	call   0x10004860
10004b15:	83 c4 10             	add    $0x10,%esp
10004b18:	c2 08 00             	ret    $0x8
10004b1b:	90                   	nop
10004b1c:	90                   	nop
10004b1d:	90                   	nop
10004b1e:	90                   	nop
10004b1f:	90                   	nop
10004b20:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10004b26:	6a ff                	push   $0xffffffff
10004b28:	68 3b b3 00 10       	push   $0x1000b33b
10004b2d:	50                   	push   %eax
10004b2e:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10004b35:	83 ec 10             	sub    $0x10,%esp
10004b38:	53                   	push   %ebx
10004b39:	56                   	push   %esi
10004b3a:	8b f1                	mov    %ecx,%esi
10004b3c:	8d 44 24 28          	lea    0x28(%esp),%eax
10004b40:	50                   	push   %eax
10004b41:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
10004b45:	8d 5e 38             	lea    0x38(%esi),%ebx
10004b48:	51                   	push   %ecx
10004b49:	8b cb                	mov    %ebx,%ecx
10004b4b:	e8 00 ea ff ff       	call   0x10003550
10004b50:	8b 46 40             	mov    0x40(%esi),%eax
10004b53:	39 44 24 08          	cmp    %eax,0x8(%esp)
10004b57:	75 7b                	jne    0x10004bd4
10004b59:	57                   	push   %edi
10004b5a:	68 88 0d 00 00       	push   $0xd88
10004b5f:	e8 ac 09 00 00       	call   0x10005510
10004b64:	83 c4 04             	add    $0x4,%esp
10004b67:	89 44 24 0c          	mov    %eax,0xc(%esp)
10004b6b:	85 c0                	test   %eax,%eax
10004b6d:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
10004b71:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
10004b78:	00 
10004b79:	74 12                	je     0x10004b8d
10004b7b:	8b 54 24 30          	mov    0x30(%esp),%edx
10004b7f:	56                   	push   %esi
10004b80:	52                   	push   %edx
10004b81:	57                   	push   %edi
10004b82:	8b c8                	mov    %eax,%ecx
10004b84:	e8 87 ef ff ff       	call   0x10003b10
10004b89:	8b f0                	mov    %eax,%esi
10004b8b:	eb 02                	jmp    0x10004b8f
10004b8d:	33 f6                	xor    %esi,%esi
10004b8f:	8b 44 24 34          	mov    0x34(%esp),%eax
10004b93:	6a 02                	push   $0x2
10004b95:	50                   	push   %eax
10004b96:	8b ce                	mov    %esi,%ecx
10004b98:	c7 44 24 2c ff ff ff 	movl   $0xffffffff,0x2c(%esp)
10004b9f:	ff 
10004ba0:	e8 fb 08 00 00       	call   0x100054a0
10004ba5:	8d 4c 24 0c          	lea    0xc(%esp),%ecx
10004ba9:	51                   	push   %ecx
10004baa:	8d 54 24 18          	lea    0x18(%esp),%edx
10004bae:	52                   	push   %edx
10004baf:	8b cb                	mov    %ebx,%ecx
10004bb1:	89 7c 24 14          	mov    %edi,0x14(%esp)
10004bb5:	89 74 24 18          	mov    %esi,0x18(%esp)
10004bb9:	e8 a2 fc ff ff       	call   0x10004860
10004bbe:	5f                   	pop    %edi
10004bbf:	5e                   	pop    %esi
10004bc0:	b0 01                	mov    $0x1,%al
10004bc2:	5b                   	pop    %ebx
10004bc3:	8b 4c 24 10          	mov    0x10(%esp),%ecx
10004bc7:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10004bce:	83 c4 1c             	add    $0x1c,%esp
10004bd1:	c2 0c 00             	ret    $0xc
10004bd4:	8b 4c 24 18          	mov    0x18(%esp),%ecx
10004bd8:	5e                   	pop    %esi
10004bd9:	32 c0                	xor    %al,%al
10004bdb:	5b                   	pop    %ebx
10004bdc:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10004be3:	83 c4 1c             	add    $0x1c,%esp
10004be6:	c2 0c 00             	ret    $0xc
10004be9:	90                   	nop
10004bea:	90                   	nop
10004beb:	90                   	nop
10004bec:	90                   	nop
10004bed:	90                   	nop
10004bee:	90                   	nop
10004bef:	90                   	nop
10004bf0:	8b 44 24 04          	mov    0x4(%esp),%eax
10004bf4:	3d 01 21 18 78       	cmp    $0x78182101,%eax
10004bf9:	53                   	push   %ebx
10004bfa:	56                   	push   %esi
10004bfb:	57                   	push   %edi
10004bfc:	8b d9                	mov    %ecx,%ebx
10004bfe:	0f 87 c6 03 00 00    	ja     0x10004fca
10004c04:	0f 84 41 03 00 00    	je     0x10004f4b
10004c0a:	3d 43 df 50 45       	cmp    $0x4550df43,%eax
10004c0f:	0f 87 ca 01 00 00    	ja     0x10004ddf
10004c15:	0f 84 e8 00 00 00    	je     0x10004d03
10004c1b:	3d 55 56 5b 02       	cmp    $0x25b5655,%eax
10004c20:	0f 84 b6 00 00 00    	je     0x10004cdc
10004c26:	3d 31 bf 39 0a       	cmp    $0xa39bf31,%eax
10004c2b:	0f 85 22 05 00 00    	jne    0x10005153
10004c31:	8b 74 24 14          	mov    0x14(%esp),%esi
10004c35:	8b 46 04             	mov    0x4(%esi),%eax
10004c38:	80 38 02             	cmpb   $0x2,(%eax)
10004c3b:	0f 85 ba 05 00 00    	jne    0x100051fb
10004c41:	6a 00                	push   $0x0
10004c43:	8b ce                	mov    %esi,%ecx
10004c45:	e8 b6 c6 ff ff       	call   0x10001300
10004c4a:	83 f8 21             	cmp    $0x21,%eax
10004c4d:	74 2e                	je     0x10004c7d
10004c4f:	6a 00                	push   $0x0
10004c51:	8b ce                	mov    %esi,%ecx
10004c53:	e8 a8 c6 ff ff       	call   0x10001300
10004c58:	83 f8 11             	cmp    $0x11,%eax
10004c5b:	74 20                	je     0x10004c7d
10004c5d:	6a 00                	push   $0x0
10004c5f:	8b ce                	mov    %esi,%ecx
10004c61:	e8 9a c6 ff ff       	call   0x10001300
10004c66:	83 f8 01             	cmp    $0x1,%eax
10004c69:	74 12                	je     0x10004c7d
10004c6b:	6a 00                	push   $0x0
10004c6d:	8b ce                	mov    %esi,%ecx
10004c6f:	e8 8c c6 ff ff       	call   0x10001300
10004c74:	83 f8 31             	cmp    $0x31,%eax
10004c77:	0f 85 7e 05 00 00    	jne    0x100051fb
10004c7d:	6a 01                	push   $0x1
10004c7f:	8b ce                	mov    %esi,%ecx
10004c81:	e8 7a c6 ff ff       	call   0x10001300
10004c86:	83 f8 21             	cmp    $0x21,%eax
10004c89:	74 2e                	je     0x10004cb9
10004c8b:	6a 01                	push   $0x1
10004c8d:	8b ce                	mov    %esi,%ecx
10004c8f:	e8 6c c6 ff ff       	call   0x10001300
10004c94:	83 f8 11             	cmp    $0x11,%eax
10004c97:	74 20                	je     0x10004cb9
10004c99:	6a 01                	push   $0x1
10004c9b:	8b ce                	mov    %esi,%ecx
10004c9d:	e8 5e c6 ff ff       	call   0x10001300
10004ca2:	83 f8 01             	cmp    $0x1,%eax
10004ca5:	74 12                	je     0x10004cb9
10004ca7:	6a 01                	push   $0x1
10004ca9:	8b ce                	mov    %esi,%ecx
10004cab:	e8 50 c6 ff ff       	call   0x10001300
10004cb0:	83 f8 31             	cmp    $0x31,%eax
10004cb3:	0f 85 42 05 00 00    	jne    0x100051fb
10004cb9:	6a 01                	push   $0x1
10004cbb:	8b ce                	mov    %esi,%ecx
10004cbd:	e8 5e c6 ff ff       	call   0x10001320
10004cc2:	50                   	push   %eax
10004cc3:	6a 00                	push   $0x0
10004cc5:	8b ce                	mov    %esi,%ecx
10004cc7:	e8 54 c6 ff ff       	call   0x10001320
10004ccc:	50                   	push   %eax
10004ccd:	8b cb                	mov    %ebx,%ecx
10004ccf:	e8 fc ed ff ff       	call   0x10003ad0
10004cd4:	5f                   	pop    %edi
10004cd5:	5e                   	pop    %esi
10004cd6:	33 c0                	xor    %eax,%eax
10004cd8:	5b                   	pop    %ebx
10004cd9:	c2 08 00             	ret    $0x8
10004cdc:	8b 4c 24 14          	mov    0x14(%esp),%ecx
10004ce0:	8b 51 04             	mov    0x4(%ecx),%edx
10004ce3:	c6 02 00             	movb   $0x0,(%edx)
10004ce6:	8b 41 08             	mov    0x8(%ecx),%eax
10004ce9:	68 54 c2 00 10       	push   $0x1000c254  ; 0x1000c254='dll_CPacManMapSys'
10004cee:	66 c7 00 03 00       	movw   $0x3,(%eax)
10004cf3:	e8 28 c5 ff ff       	call   0x10001220
10004cf8:	5f                   	pop    %edi
10004cf9:	5e                   	pop    %esi
10004cfa:	b8 01 00 00 00       	mov    $0x1,%eax
10004cff:	5b                   	pop    %ebx
10004d00:	c2 08 00             	ret    $0x8
10004d03:	8b 74 24 14          	mov    0x14(%esp),%esi
10004d07:	8b 4e 04             	mov    0x4(%esi),%ecx
10004d0a:	80 39 03             	cmpb   $0x3,(%ecx)
10004d0d:	0f 85 e8 04 00 00    	jne    0x100051fb
10004d13:	6a 00                	push   $0x0
10004d15:	8b ce                	mov    %esi,%ecx
10004d17:	e8 e4 c5 ff ff       	call   0x10001300
10004d1c:	83 f8 21             	cmp    $0x21,%eax
10004d1f:	74 2e                	je     0x10004d4f
10004d21:	6a 00                	push   $0x0
10004d23:	8b ce                	mov    %esi,%ecx
10004d25:	e8 d6 c5 ff ff       	call   0x10001300
10004d2a:	83 f8 11             	cmp    $0x11,%eax
10004d2d:	74 20                	je     0x10004d4f
10004d2f:	6a 00                	push   $0x0
10004d31:	8b ce                	mov    %esi,%ecx
10004d33:	e8 c8 c5 ff ff       	call   0x10001300
10004d38:	83 f8 01             	cmp    $0x1,%eax
10004d3b:	74 12                	je     0x10004d4f
10004d3d:	6a 00                	push   $0x0
10004d3f:	8b ce                	mov    %esi,%ecx
10004d41:	e8 ba c5 ff ff       	call   0x10001300
10004d46:	83 f8 31             	cmp    $0x31,%eax
10004d49:	0f 85 ac 04 00 00    	jne    0x100051fb
10004d4f:	6a 01                	push   $0x1
10004d51:	8b ce                	mov    %esi,%ecx
10004d53:	e8 a8 c5 ff ff       	call   0x10001300
10004d58:	83 f8 21             	cmp    $0x21,%eax
10004d5b:	74 2e                	je     0x10004d8b
10004d5d:	6a 01                	push   $0x1
10004d5f:	8b ce                	mov    %esi,%ecx
10004d61:	e8 9a c5 ff ff       	call   0x10001300
10004d66:	83 f8 11             	cmp    $0x11,%eax
10004d69:	74 20                	je     0x10004d8b
10004d6b:	6a 01                	push   $0x1
10004d6d:	8b ce                	mov    %esi,%ecx
10004d6f:	e8 8c c5 ff ff       	call   0x10001300
10004d74:	83 f8 01             	cmp    $0x1,%eax
10004d77:	74 12                	je     0x10004d8b
10004d79:	6a 01                	push   $0x1
10004d7b:	8b ce                	mov    %esi,%ecx
10004d7d:	e8 7e c5 ff ff       	call   0x10001300
10004d82:	83 f8 31             	cmp    $0x31,%eax
10004d85:	0f 85 70 04 00 00    	jne    0x100051fb
10004d8b:	6a 02                	push   $0x2
10004d8d:	8b ce                	mov    %esi,%ecx
10004d8f:	e8 6c c5 ff ff       	call   0x10001300
10004d94:	83 f8 05             	cmp    $0x5,%eax
10004d97:	0f 85 5e 04 00 00    	jne    0x100051fb
10004d9d:	6a 00                	push   $0x0
10004d9f:	8b ce                	mov    %esi,%ecx
10004da1:	e8 7a c5 ff ff       	call   0x10001320
10004da6:	6a 01                	push   $0x1
10004da8:	8b ce                	mov    %esi,%ecx
10004daa:	8b f8                	mov    %eax,%edi
10004dac:	e8 6f c5 ff ff       	call   0x10001320
10004db1:	56                   	push   %esi
10004db2:	50                   	push   %eax
10004db3:	57                   	push   %edi
10004db4:	8b cb                	mov    %ebx,%ecx
10004db6:	e8 65 fd ff ff       	call   0x10004b20
10004dbb:	8b 56 04             	mov    0x4(%esi),%edx
10004dbe:	c6 02 00             	movb   $0x0,(%edx)
10004dc1:	8b 4e 08             	mov    0x8(%esi),%ecx
10004dc4:	0f b6 d0             	movzbl %al,%edx
10004dc7:	66 c7 01 03 00       	movw   $0x3,(%ecx)
10004dcc:	52                   	push   %edx
10004dcd:	8b ce                	mov    %esi,%ecx
10004dcf:	e8 6c c3 ff ff       	call   0x10001140
10004dd4:	5f                   	pop    %edi
10004dd5:	5e                   	pop    %esi
10004dd6:	b8 01 00 00 00       	mov    $0x1,%eax
10004ddb:	5b                   	pop    %ebx
10004ddc:	c2 08 00             	ret    $0x8
10004ddf:	3d d8 71 78 66       	cmp    $0x667871d8,%eax
10004de4:	0f 84 b6 00 00 00    	je     0x10004ea0
10004dea:	3d ed af 74 71       	cmp    $0x7174afed,%eax
10004def:	0f 85 5e 03 00 00    	jne    0x10005153
10004df5:	8b 74 24 14          	mov    0x14(%esp),%esi
10004df9:	8b 46 04             	mov    0x4(%esi),%eax
10004dfc:	80 38 02             	cmpb   $0x2,(%eax)
10004dff:	0f 85 f6 03 00 00    	jne    0x100051fb
10004e05:	6a 00                	push   $0x0
10004e07:	8b ce                	mov    %esi,%ecx
10004e09:	e8 f2 c4 ff ff       	call   0x10001300
10004e0e:	83 f8 21             	cmp    $0x21,%eax
10004e11:	74 2e                	je     0x10004e41
10004e13:	6a 00                	push   $0x0
10004e15:	8b ce                	mov    %esi,%ecx
10004e17:	e8 e4 c4 ff ff       	call   0x10001300
10004e1c:	83 f8 11             	cmp    $0x11,%eax
10004e1f:	74 20                	je     0x10004e41
10004e21:	6a 00                	push   $0x0
10004e23:	8b ce                	mov    %esi,%ecx
10004e25:	e8 d6 c4 ff ff       	call   0x10001300
10004e2a:	83 f8 01             	cmp    $0x1,%eax
10004e2d:	74 12                	je     0x10004e41
10004e2f:	6a 00                	push   $0x0
10004e31:	8b ce                	mov    %esi,%ecx
10004e33:	e8 c8 c4 ff ff       	call   0x10001300
10004e38:	83 f8 31             	cmp    $0x31,%eax
10004e3b:	0f 85 ba 03 00 00    	jne    0x100051fb
10004e41:	6a 01                	push   $0x1
10004e43:	8b ce                	mov    %esi,%ecx
10004e45:	e8 b6 c4 ff ff       	call   0x10001300
10004e4a:	83 f8 21             	cmp    $0x21,%eax
10004e4d:	74 2e                	je     0x10004e7d
10004e4f:	6a 01                	push   $0x1
10004e51:	8b ce                	mov    %esi,%ecx
10004e53:	e8 a8 c4 ff ff       	call   0x10001300
10004e58:	83 f8 11             	cmp    $0x11,%eax
10004e5b:	74 20                	je     0x10004e7d
10004e5d:	6a 01                	push   $0x1
10004e5f:	8b ce                	mov    %esi,%ecx
10004e61:	e8 9a c4 ff ff       	call   0x10001300
10004e66:	83 f8 01             	cmp    $0x1,%eax
10004e69:	74 12                	je     0x10004e7d
10004e6b:	6a 01                	push   $0x1
10004e6d:	8b ce                	mov    %esi,%ecx
10004e6f:	e8 8c c4 ff ff       	call   0x10001300
10004e74:	83 f8 31             	cmp    $0x31,%eax
10004e77:	0f 85 7e 03 00 00    	jne    0x100051fb
10004e7d:	6a 01                	push   $0x1
10004e7f:	8b ce                	mov    %esi,%ecx
10004e81:	e8 9a c4 ff ff       	call   0x10001320
10004e86:	50                   	push   %eax
10004e87:	6a 00                	push   $0x0
10004e89:	8b ce                	mov    %esi,%ecx
10004e8b:	e8 90 c4 ff ff       	call   0x10001320
10004e90:	50                   	push   %eax
10004e91:	8b cb                	mov    %ebx,%ecx
10004e93:	e8 88 f9 ff ff       	call   0x10004820
10004e98:	5f                   	pop    %edi
10004e99:	5e                   	pop    %esi
10004e9a:	33 c0                	xor    %eax,%eax
10004e9c:	5b                   	pop    %ebx
10004e9d:	c2 08 00             	ret    $0x8
10004ea0:	8b 74 24 14          	mov    0x14(%esp),%esi
10004ea4:	8b 4e 04             	mov    0x4(%esi),%ecx
10004ea7:	80 39 02             	cmpb   $0x2,(%ecx)
10004eaa:	0f 85 4b 03 00 00    	jne    0x100051fb
10004eb0:	6a 00                	push   $0x0
10004eb2:	8b ce                	mov    %esi,%ecx
10004eb4:	e8 47 c4 ff ff       	call   0x10001300
10004eb9:	83 f8 21             	cmp    $0x21,%eax
10004ebc:	74 2e                	je     0x10004eec
10004ebe:	6a 00                	push   $0x0
10004ec0:	8b ce                	mov    %esi,%ecx
10004ec2:	e8 39 c4 ff ff       	call   0x10001300
10004ec7:	83 f8 11             	cmp    $0x11,%eax
10004eca:	74 20                	je     0x10004eec
10004ecc:	6a 00                	push   $0x0
10004ece:	8b ce                	mov    %esi,%ecx
10004ed0:	e8 2b c4 ff ff       	call   0x10001300
10004ed5:	83 f8 01             	cmp    $0x1,%eax
10004ed8:	74 12                	je     0x10004eec
10004eda:	6a 00                	push   $0x0
10004edc:	8b ce                	mov    %esi,%ecx
10004ede:	e8 1d c4 ff ff       	call   0x10001300
10004ee3:	83 f8 31             	cmp    $0x31,%eax
10004ee6:	0f 85 0f 03 00 00    	jne    0x100051fb
10004eec:	6a 01                	push   $0x1
10004eee:	8b ce                	mov    %esi,%ecx
10004ef0:	e8 0b c4 ff ff       	call   0x10001300
10004ef5:	83 f8 21             	cmp    $0x21,%eax
10004ef8:	74 2e                	je     0x10004f28
10004efa:	6a 01                	push   $0x1
10004efc:	8b ce                	mov    %esi,%ecx
10004efe:	e8 fd c3 ff ff       	call   0x10001300
10004f03:	83 f8 11             	cmp    $0x11,%eax
10004f06:	74 20                	je     0x10004f28
10004f08:	6a 01                	push   $0x1
10004f0a:	8b ce                	mov    %esi,%ecx
10004f0c:	e8 ef c3 ff ff       	call   0x10001300
10004f11:	83 f8 01             	cmp    $0x1,%eax
10004f14:	74 12                	je     0x10004f28
10004f16:	6a 01                	push   $0x1
10004f18:	8b ce                	mov    %esi,%ecx
10004f1a:	e8 e1 c3 ff ff       	call   0x10001300
10004f1f:	83 f8 31             	cmp    $0x31,%eax
10004f22:	0f 85 d3 02 00 00    	jne    0x100051fb
10004f28:	6a 01                	push   $0x1
10004f2a:	8b ce                	mov    %esi,%ecx
10004f2c:	e8 ef c3 ff ff       	call   0x10001320
10004f31:	50                   	push   %eax
10004f32:	6a 00                	push   $0x0
10004f34:	8b ce                	mov    %esi,%ecx
10004f36:	e8 e5 c3 ff ff       	call   0x10001320
10004f3b:	50                   	push   %eax
10004f3c:	8b cb                	mov    %ebx,%ecx
10004f3e:	e8 ad fb ff ff       	call   0x10004af0
10004f43:	5f                   	pop    %edi
10004f44:	5e                   	pop    %esi
10004f45:	33 c0                	xor    %eax,%eax
10004f47:	5b                   	pop    %ebx
10004f48:	c2 08 00             	ret    $0x8
10004f4b:	8b 74 24 14          	mov    0x14(%esp),%esi
10004f4f:	8b 56 04             	mov    0x4(%esi),%edx
10004f52:	80 3a 01             	cmpb   $0x1,(%edx)
10004f55:	0f 85 a0 02 00 00    	jne    0x100051fb
10004f5b:	8b 06                	mov    (%esi),%eax
10004f5d:	83 c0 03             	add    $0x3,%eax
10004f60:	85 c0                	test   %eax,%eax
10004f62:	74 14                	je     0x10004f78
10004f64:	0f be 08             	movsbl (%eax),%ecx
10004f67:	83 f9 21             	cmp    $0x21,%ecx
10004f6a:	74 2c                	je     0x10004f98
10004f6c:	85 c0                	test   %eax,%eax
10004f6e:	74 08                	je     0x10004f78
10004f70:	0f be 00             	movsbl (%eax),%eax
10004f73:	83 f8 11             	cmp    $0x11,%eax
10004f76:	74 20                	je     0x10004f98
10004f78:	6a 00                	push   $0x0
10004f7a:	8b ce                	mov    %esi,%ecx
10004f7c:	e8 7f c3 ff ff       	call   0x10001300
10004f81:	83 f8 01             	cmp    $0x1,%eax
10004f84:	74 12                	je     0x10004f98
10004f86:	6a 00                	push   $0x0
10004f88:	8b ce                	mov    %esi,%ecx
10004f8a:	e8 71 c3 ff ff       	call   0x10001300
10004f8f:	83 f8 31             	cmp    $0x31,%eax
10004f92:	0f 85 63 02 00 00    	jne    0x100051fb
10004f98:	6a 00                	push   $0x0
10004f9a:	8b ce                	mov    %esi,%ecx
10004f9c:	e8 7f c3 ff ff       	call   0x10001320
10004fa1:	50                   	push   %eax
10004fa2:	8b cb                	mov    %ebx,%ecx
10004fa4:	e8 d7 e7 ff ff       	call   0x10003780
10004fa9:	8b 4e 04             	mov    0x4(%esi),%ecx
10004fac:	c6 01 00             	movb   $0x0,(%ecx)
10004faf:	8b 56 08             	mov    0x8(%esi),%edx
10004fb2:	50                   	push   %eax
10004fb3:	8b ce                	mov    %esi,%ecx
10004fb5:	66 c7 02 03 00       	movw   $0x3,(%edx)
10004fba:	e8 81 c1 ff ff       	call   0x10001140
10004fbf:	5f                   	pop    %edi
10004fc0:	5e                   	pop    %esi
10004fc1:	b8 01 00 00 00       	mov    $0x1,%eax
10004fc6:	5b                   	pop    %ebx
10004fc7:	c2 08 00             	ret    $0x8
10004fca:	3d 1d d6 09 bc       	cmp    $0xbc09d61d,%eax
10004fcf:	0f 87 77 01 00 00    	ja     0x1000514c
10004fd5:	0f 84 dc 00 00 00    	je     0x100050b7
10004fdb:	3d 94 8a 57 a8       	cmp    $0xa8578a94,%eax
10004fe0:	74 70                	je     0x10005052
10004fe2:	3d 46 4d 2c ac       	cmp    $0xac2c4d46,%eax
10004fe7:	0f 85 66 01 00 00    	jne    0x10005153
10004fed:	8b 74 24 14          	mov    0x14(%esp),%esi
10004ff1:	8b 46 04             	mov    0x4(%esi),%eax
10004ff4:	80 38 01             	cmpb   $0x1,(%eax)
10004ff7:	0f 85 fe 01 00 00    	jne    0x100051fb
10004ffd:	6a 00                	push   $0x0
10004fff:	8b ce                	mov    %esi,%ecx
10005001:	e8 fa c2 ff ff       	call   0x10001300
10005006:	83 f8 21             	cmp    $0x21,%eax
10005009:	74 2e                	je     0x10005039
1000500b:	6a 00                	push   $0x0
1000500d:	8b ce                	mov    %esi,%ecx
1000500f:	e8 ec c2 ff ff       	call   0x10001300
10005014:	83 f8 11             	cmp    $0x11,%eax
10005017:	74 20                	je     0x10005039
10005019:	6a 00                	push   $0x0
1000501b:	8b ce                	mov    %esi,%ecx
1000501d:	e8 de c2 ff ff       	call   0x10001300
10005022:	83 f8 01             	cmp    $0x1,%eax
10005025:	74 12                	je     0x10005039
10005027:	6a 00                	push   $0x0
10005029:	8b ce                	mov    %esi,%ecx
1000502b:	e8 d0 c2 ff ff       	call   0x10001300
10005030:	83 f8 31             	cmp    $0x31,%eax
10005033:	0f 85 c2 01 00 00    	jne    0x100051fb
10005039:	6a 00                	push   $0x0
1000503b:	8b ce                	mov    %esi,%ecx
1000503d:	e8 de c2 ff ff       	call   0x10001320
10005042:	50                   	push   %eax
10005043:	8b cb                	mov    %ebx,%ecx
10005045:	e8 b6 e7 ff ff       	call   0x10003800
1000504a:	5f                   	pop    %edi
1000504b:	5e                   	pop    %esi
1000504c:	33 c0                	xor    %eax,%eax
1000504e:	5b                   	pop    %ebx
1000504f:	c2 08 00             	ret    $0x8
10005052:	8b 74 24 14          	mov    0x14(%esp),%esi
10005056:	8b 7e 04             	mov    0x4(%esi),%edi
10005059:	80 3f 01             	cmpb   $0x1,(%edi)
1000505c:	0f 85 99 01 00 00    	jne    0x100051fb
10005062:	6a 00                	push   $0x0
10005064:	8b ce                	mov    %esi,%ecx
10005066:	e8 95 c2 ff ff       	call   0x10001300
1000506b:	83 f8 21             	cmp    $0x21,%eax
1000506e:	74 2e                	je     0x1000509e
10005070:	6a 00                	push   $0x0
10005072:	8b ce                	mov    %esi,%ecx
10005074:	e8 87 c2 ff ff       	call   0x10001300
10005079:	83 f8 11             	cmp    $0x11,%eax
1000507c:	74 20                	je     0x1000509e
1000507e:	6a 00                	push   $0x0
10005080:	8b ce                	mov    %esi,%ecx
10005082:	e8 79 c2 ff ff       	call   0x10001300
10005087:	83 f8 01             	cmp    $0x1,%eax
1000508a:	74 12                	je     0x1000509e
1000508c:	6a 00                	push   $0x0
1000508e:	8b ce                	mov    %esi,%ecx
10005090:	e8 6b c2 ff ff       	call   0x10001300
10005095:	83 f8 31             	cmp    $0x31,%eax
10005098:	0f 85 5d 01 00 00    	jne    0x100051fb
1000509e:	6a 00                	push   $0x0
100050a0:	8b ce                	mov    %esi,%ecx
100050a2:	e8 79 c2 ff ff       	call   0x10001320
100050a7:	50                   	push   %eax
100050a8:	8b cb                	mov    %ebx,%ecx
100050aa:	e8 91 e6 ff ff       	call   0x10003740
100050af:	c6 07 00             	movb   $0x0,(%edi)
100050b2:	e9 0a fd ff ff       	jmp    0x10004dc1
100050b7:	8b 74 24 14          	mov    0x14(%esp),%esi
100050bb:	8b 7e 04             	mov    0x4(%esi),%edi
100050be:	80 3f 01             	cmpb   $0x1,(%edi)
100050c1:	0f 85 34 01 00 00    	jne    0x100051fb
100050c7:	8b 06                	mov    (%esi),%eax
100050c9:	83 c0 03             	add    $0x3,%eax
100050cc:	74 08                	je     0x100050d6
100050ce:	0f be 00             	movsbl (%eax),%eax
100050d1:	83 f8 21             	cmp    $0x21,%eax
100050d4:	74 2e                	je     0x10005104
100050d6:	6a 00                	push   $0x0
100050d8:	8b ce                	mov    %esi,%ecx
100050da:	e8 21 c2 ff ff       	call   0x10001300
100050df:	83 f8 11             	cmp    $0x11,%eax
100050e2:	74 20                	je     0x10005104
100050e4:	6a 00                	push   $0x0
100050e6:	8b ce                	mov    %esi,%ecx
100050e8:	e8 13 c2 ff ff       	call   0x10001300
100050ed:	83 f8 01             	cmp    $0x1,%eax
100050f0:	74 12                	je     0x10005104
100050f2:	6a 00                	push   $0x0
100050f4:	8b ce                	mov    %esi,%ecx
100050f6:	e8 05 c2 ff ff       	call   0x10001300
100050fb:	83 f8 31             	cmp    $0x31,%eax
100050fe:	0f 85 f7 00 00 00    	jne    0x100051fb
10005104:	6a 00                	push   $0x0
10005106:	8b ce                	mov    %esi,%ecx
10005108:	e8 13 c2 ff ff       	call   0x10001320
1000510d:	50                   	push   %eax
1000510e:	8b cb                	mov    %ebx,%ecx
10005110:	e8 ab e6 ff ff       	call   0x100037c0
10005115:	85 c0                	test   %eax,%eax
10005117:	c6 07 00             	movb   $0x0,(%edi)
1000511a:	8b 4e 08             	mov    0x8(%esi),%ecx
1000511d:	66 c7 01 03 00       	movw   $0x3,(%ecx)
10005122:	8b ce                	mov    %esi,%ecx
10005124:	74 11                	je     0x10005137
10005126:	50                   	push   %eax
10005127:	e8 f4 c0 ff ff       	call   0x10001220
1000512c:	5f                   	pop    %edi
1000512d:	5e                   	pop    %esi
1000512e:	b8 01 00 00 00       	mov    $0x1,%eax
10005133:	5b                   	pop    %ebx
10005134:	c2 08 00             	ret    $0x8
10005137:	68 52 c2 00 10       	push   $0x1000c252
1000513c:	e8 df c0 ff ff       	call   0x10001220
10005141:	5f                   	pop    %edi
10005142:	5e                   	pop    %esi
10005143:	b8 01 00 00 00       	mov    $0x1,%eax
10005148:	5b                   	pop    %ebx
10005149:	c2 08 00             	ret    $0x8
1000514c:	3d 34 d9 6c f2       	cmp    $0xf26cd934,%eax
10005151:	74 0b                	je     0x1000515e
10005153:	5f                   	pop    %edi
10005154:	5e                   	pop    %esi
10005155:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
1000515a:	5b                   	pop    %ebx
1000515b:	c2 08 00             	ret    $0x8
1000515e:	8b 74 24 14          	mov    0x14(%esp),%esi
10005162:	8b 56 04             	mov    0x4(%esi),%edx
10005165:	80 3a 02             	cmpb   $0x2,(%edx)
10005168:	0f 85 8d 00 00 00    	jne    0x100051fb
1000516e:	8b 06                	mov    (%esi),%eax
10005170:	83 c0 03             	add    $0x3,%eax
10005173:	74 08                	je     0x1000517d
10005175:	0f be 00             	movsbl (%eax),%eax
10005178:	83 f8 21             	cmp    $0x21,%eax
1000517b:	74 2a                	je     0x100051a7
1000517d:	6a 00                	push   $0x0
1000517f:	8b ce                	mov    %esi,%ecx
10005181:	e8 7a c1 ff ff       	call   0x10001300
10005186:	83 f8 11             	cmp    $0x11,%eax
10005189:	74 1c                	je     0x100051a7
1000518b:	6a 00                	push   $0x0
1000518d:	8b ce                	mov    %esi,%ecx
1000518f:	e8 6c c1 ff ff       	call   0x10001300
10005194:	83 f8 01             	cmp    $0x1,%eax
10005197:	74 0e                	je     0x100051a7
10005199:	6a 00                	push   $0x0
1000519b:	8b ce                	mov    %esi,%ecx
1000519d:	e8 5e c1 ff ff       	call   0x10001300
100051a2:	83 f8 31             	cmp    $0x31,%eax
100051a5:	75 54                	jne    0x100051fb
100051a7:	6a 01                	push   $0x1
100051a9:	8b ce                	mov    %esi,%ecx
100051ab:	e8 d0 be ff ff       	call   0x10001080
100051b0:	85 c0                	test   %eax,%eax
100051b2:	74 08                	je     0x100051bc
100051b4:	0f be 00             	movsbl (%eax),%eax
100051b7:	83 f8 02             	cmp    $0x2,%eax
100051ba:	74 1c                	je     0x100051d8
100051bc:	6a 01                	push   $0x1
100051be:	8b ce                	mov    %esi,%ecx
100051c0:	e8 3b c1 ff ff       	call   0x10001300
100051c5:	83 f8 12             	cmp    $0x12,%eax
100051c8:	74 0e                	je     0x100051d8
100051ca:	6a 01                	push   $0x1
100051cc:	8b ce                	mov    %esi,%ecx
100051ce:	e8 2d c1 ff ff       	call   0x10001300
100051d3:	83 f8 22             	cmp    $0x22,%eax
100051d6:	75 23                	jne    0x100051fb
100051d8:	6a 01                	push   $0x1
100051da:	8b ce                	mov    %esi,%ecx
100051dc:	e8 8f de ff ff       	call   0x10003070
100051e1:	50                   	push   %eax
100051e2:	6a 00                	push   $0x0
100051e4:	8b ce                	mov    %esi,%ecx
100051e6:	e8 35 c1 ff ff       	call   0x10001320
100051eb:	50                   	push   %eax
100051ec:	8b cb                	mov    %ebx,%ecx
100051ee:	e8 3d f4 ff ff       	call   0x10004630
100051f3:	5f                   	pop    %edi
100051f4:	5e                   	pop    %esi
100051f5:	33 c0                	xor    %eax,%eax
100051f7:	5b                   	pop    %ebx
100051f8:	c2 08 00             	ret    $0x8
100051fb:	5f                   	pop    %edi
100051fc:	5e                   	pop    %esi
100051fd:	83 c8 ff             	or     $0xffffffff,%eax
10005200:	5b                   	pop    %ebx
10005201:	c2 08 00             	ret    $0x8
10005204:	90                   	nop
10005205:	90                   	nop
10005206:	90                   	nop
10005207:	90                   	nop
10005208:	90                   	nop
10005209:	90                   	nop
1000520a:	90                   	nop
1000520b:	90                   	nop
1000520c:	90                   	nop
1000520d:	90                   	nop
1000520e:	90                   	nop
1000520f:	90                   	nop
10005210:	8b 44 24 08          	mov    0x8(%esp),%eax
10005214:	85 c0                	test   %eax,%eax
10005216:	76 0e                	jbe    0x10005226
10005218:	83 f8 02             	cmp    $0x2,%eax
1000521b:	77 09                	ja     0x10005226
1000521d:	8b 44 24 04          	mov    0x4(%esp),%eax
10005221:	a3 00 fb 00 10       	mov    %eax,0x1000fb00
10005226:	b8 01 00 00 00       	mov    $0x1,%eax
1000522b:	c2 0c 00             	ret    $0xc
1000522e:	90                   	nop
1000522f:	90                   	nop
10005230:	b8 a4 1f 00 00       	mov    $0x1fa4,%eax
10005235:	e8 46 0f 00 00       	call   0x10006180
1000523a:	a1 30 f1 00 10       	mov    0x1000f130,%eax
1000523f:	33 84 24 a4 1f 00 00 	xor    0x1fa4(%esp),%eax
10005246:	89 84 24 a0 1f 00 00 	mov    %eax,0x1fa0(%esp)
1000524d:	a1 04 fb 00 10       	mov    0x1000fb04,%eax
10005252:	85 c0                	test   %eax,%eax
10005254:	74 2e                	je     0x10005284
10005256:	8b 8c 24 a8 1f 00 00 	mov    0x1fa8(%esp),%ecx
1000525d:	8d 84 24 ac 1f 00 00 	lea    0x1fac(%esp),%eax
10005264:	50                   	push   %eax
10005265:	51                   	push   %ecx
10005266:	8d 54 24 08          	lea    0x8(%esp),%edx
1000526a:	52                   	push   %edx
1000526b:	ff 15 0c c1 00 10    	call   *0x1000c10c  ; 0x1000c10c=USER32.dll!wvsprintfA
10005271:	8d 44 24 00          	lea    0x0(%esp),%eax
10005275:	50                   	push   %eax
10005276:	68 ff 00 ff 00       	push   $0xff00ff
1000527b:	ff 15 04 fb 00 10    	call   *0x1000fb04
10005281:	83 c4 08             	add    $0x8,%esp
10005284:	8b 8c 24 a0 1f 00 00 	mov    0x1fa0(%esp),%ecx
1000528b:	33 8c 24 a4 1f 00 00 	xor    0x1fa4(%esp),%ecx
10005292:	81 c4 a4 1f 00 00    	add    $0x1fa4,%esp
10005298:	e9 ce 0e 00 00       	jmp    0x1000616b
1000529d:	90                   	nop
1000529e:	90                   	nop
1000529f:	90                   	nop
100052a0:	53                   	push   %ebx
100052a1:	8b 1d 08 fc 00 10    	mov    0x1000fc08,%ebx
100052a7:	85 db                	test   %ebx,%ebx
100052a9:	56                   	push   %esi
100052aa:	57                   	push   %edi
100052ab:	7e 17                	jle    0x100052c4
100052ad:	bf 08 fb 00 10       	mov    $0x1000fb08,%edi
100052b2:	4f                   	dec    %edi
100052b3:	8a 47 01             	mov    0x1(%edi),%al
100052b6:	47                   	inc    %edi
100052b7:	84 c0                	test   %al,%al
100052b9:	75 f8                	jne    0x100052b3
100052bb:	66 a1 50 c2 00 10    	mov    0x1000c250,%ax
100052c1:	66 89 07             	mov    %ax,(%edi)
100052c4:	8b 44 24 14          	mov    0x14(%esp),%eax
100052c8:	8b d0                	mov    %eax,%edx
100052ca:	8d 9b 00 00 00 00    	lea    0x0(%ebx),%ebx
100052d0:	8a 08                	mov    (%eax),%cl
100052d2:	40                   	inc    %eax
100052d3:	84 c9                	test   %cl,%cl
100052d5:	75 f9                	jne    0x100052d0
100052d7:	bf 08 fb 00 10       	mov    $0x1000fb08,%edi
100052dc:	2b c2                	sub    %edx,%eax
100052de:	4f                   	dec    %edi
100052df:	90                   	nop
100052e0:	8a 4f 01             	mov    0x1(%edi),%cl
100052e3:	47                   	inc    %edi
100052e4:	84 c9                	test   %cl,%cl
100052e6:	75 f8                	jne    0x100052e0
100052e8:	8b c8                	mov    %eax,%ecx
100052ea:	c1 e9 02             	shr    $0x2,%ecx
100052ed:	8b f2                	mov    %edx,%esi
100052ef:	8b 54 24 18          	mov    0x18(%esp),%edx
100052f3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
100052f5:	8b c8                	mov    %eax,%ecx
100052f7:	83 e1 03             	and    $0x3,%ecx
100052fa:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
100052fc:	8b 4c 24 10          	mov    0x10(%esp),%ecx
10005300:	89 0c 9d 80 fa 00 10 	mov    %ecx,0x1000fa80(,%ebx,4)
10005307:	89 14 9d 00 fa 00 10 	mov    %edx,0x1000fa00(,%ebx,4)
1000530e:	5f                   	pop    %edi
1000530f:	43                   	inc    %ebx
10005310:	5e                   	pop    %esi
10005311:	89 1d 08 fc 00 10    	mov    %ebx,0x1000fc08
10005317:	5b                   	pop    %ebx
10005318:	c3                   	ret
10005319:	90                   	nop
1000531a:	90                   	nop
1000531b:	90                   	nop
1000531c:	90                   	nop
1000531d:	90                   	nop
1000531e:	90                   	nop
1000531f:	90                   	nop
10005320:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10005324:	8b 01                	mov    (%ecx),%eax
10005326:	ff 20                	jmp    *(%eax)
10005328:	90                   	nop
10005329:	90                   	nop
1000532a:	90                   	nop
1000532b:	90                   	nop
1000532c:	90                   	nop
1000532d:	90                   	nop
1000532e:	90                   	nop
1000532f:	90                   	nop
10005330:	8b 54 24 0c          	mov    0xc(%esp),%edx
10005334:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10005338:	8b 01                	mov    (%ecx),%eax
1000533a:	52                   	push   %edx
1000533b:	8b 54 24 0c          	mov    0xc(%esp),%edx
1000533f:	52                   	push   %edx
10005340:	ff 50 08             	call   *0x8(%eax)
10005343:	c3                   	ret
10005344:	90                   	nop
10005345:	90                   	nop
10005346:	90                   	nop
10005347:	90                   	nop
10005348:	90                   	nop
10005349:	90                   	nop
1000534a:	90                   	nop
1000534b:	90                   	nop
1000534c:	90                   	nop
1000534d:	90                   	nop
1000534e:	90                   	nop
1000534f:	90                   	nop
10005350:	8b 54 24 18          	mov    0x18(%esp),%edx
10005354:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10005358:	8b 01                	mov    (%ecx),%eax
1000535a:	52                   	push   %edx
1000535b:	8b 54 24 18          	mov    0x18(%esp),%edx
1000535f:	52                   	push   %edx
10005360:	8b 54 24 18          	mov    0x18(%esp),%edx
10005364:	52                   	push   %edx
10005365:	8b 54 24 18          	mov    0x18(%esp),%edx
10005369:	52                   	push   %edx
1000536a:	ff 50 10             	call   *0x10(%eax)
1000536d:	c3                   	ret
1000536e:	90                   	nop
1000536f:	90                   	nop
10005370:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10005374:	8b 54 24 08          	mov    0x8(%esp),%edx
10005378:	8b 01                	mov    (%ecx),%eax
1000537a:	52                   	push   %edx
1000537b:	ff 50 0c             	call   *0xc(%eax)
1000537e:	c3                   	ret
1000537f:	90                   	nop
10005380:	68 80 1e 00 10       	push   $0x10001e80
10005385:	68 9c c2 00 10       	push   $0x1000c29c  ; 0x1000c29c='CPacManItemSys'
1000538a:	68 5e 39 42 e7       	push   $0xe742395e
1000538f:	e8 0c ff ff ff       	call   0x100052a0
10005394:	68 90 4a 00 10       	push   $0x10004a90
10005399:	68 8c c2 00 10       	push   $0x1000c28c  ; 0x1000c28c='CPacManMapSys'
1000539e:	68 a2 a5 63 67       	push   $0x6763a5a2
100053a3:	e8 f8 fe ff ff       	call   0x100052a0
100053a8:	68 c0 2c 00 10       	push   $0x10002cc0
100053ad:	68 7c c2 00 10       	push   $0x1000c27c  ; 0x1000c27c='CPacManCoinSys'
100053b2:	68 bc 50 4f 6b       	push   $0x6b4f50bc
100053b7:	e8 e4 fe ff ff       	call   0x100052a0
100053bc:	83 c4 24             	add    $0x24,%esp
100053bf:	c3                   	ret
; export GetPlugHead
100053c0:	b8 98 f0 00 10       	mov    $0x1000f098,%eax
100053c5:	c3                   	ret
100053c6:	90                   	nop
100053c7:	90                   	nop
100053c8:	90                   	nop
100053c9:	90                   	nop
100053ca:	90                   	nop
100053cb:	90                   	nop
100053cc:	90                   	nop
100053cd:	90                   	nop
100053ce:	90                   	nop
100053cf:	90                   	nop
; export GetUserClassInfo
100053d0:	83 3d 08 fc 00 10 01 	cmpl   $0x1,0x1000fc08
100053d7:	7d 05                	jge    0x100053de
100053d9:	e8 a2 ff ff ff       	call   0x10005380
100053de:	8b 54 24 08          	mov    0x8(%esp),%edx
100053e2:	b8 08 fb 00 10       	mov    $0x1000fb08,%eax
100053e7:	2b d0                	sub    %eax,%edx
100053e9:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
100053f0:	8a 08                	mov    (%eax),%cl
100053f2:	88 0c 02             	mov    %cl,(%edx,%eax,1)
100053f5:	40                   	inc    %eax
100053f6:	84 c9                	test   %cl,%cl
100053f8:	75 f6                	jne    0x100053f0
100053fa:	b8 c8 00 00 00       	mov    $0xc8,%eax
100053ff:	c3                   	ret
10005400:	a1 b8 f0 00 10       	mov    0x1000f0b8,%eax
10005405:	85 c0                	test   %eax,%eax
10005407:	75 08                	jne    0x10005411
10005409:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
1000540e:	c2 08 00             	ret    $0x8
10005411:	8b 54 24 08          	mov    0x8(%esp),%edx
10005415:	52                   	push   %edx
10005416:	8b 54 24 08          	mov    0x8(%esp),%edx
1000541a:	52                   	push   %edx
1000541b:	8b 51 04             	mov    0x4(%ecx),%edx
1000541e:	8b 09                	mov    (%ecx),%ecx
10005420:	52                   	push   %edx
10005421:	51                   	push   %ecx
10005422:	ff d0                	call   *%eax
10005424:	83 c4 10             	add    $0x10,%esp
10005427:	c2 08 00             	ret    $0x8
1000542a:	90                   	nop
1000542b:	90                   	nop
1000542c:	90                   	nop
1000542d:	90                   	nop
1000542e:	90                   	nop
1000542f:	90                   	nop
10005430:	33 c0                	xor    %eax,%eax
10005432:	c2 10 00             	ret    $0x10
10005435:	90                   	nop
10005436:	90                   	nop
10005437:	90                   	nop
10005438:	90                   	nop
10005439:	90                   	nop
1000543a:	90                   	nop
1000543b:	90                   	nop
1000543c:	90                   	nop
1000543d:	90                   	nop
1000543e:	90                   	nop
1000543f:	90                   	nop
10005440:	8b 4c 24 08          	mov    0x8(%esp),%ecx
10005444:	8b 44 24 0c          	mov    0xc(%esp),%eax
10005448:	89 0d 0c fc 00 10    	mov    %ecx,0x1000fc0c
1000544e:	8b 0d 08 fc 00 10    	mov    0x1000fc08,%ecx
10005454:	a3 04 fb 00 10       	mov    %eax,0x1000fb04
10005459:	33 c0                	xor    %eax,%eax
1000545b:	85 c9                	test   %ecx,%ecx
1000545d:	56                   	push   %esi
1000545e:	7e 12                	jle    0x10005472
10005460:	8b 54 24 14          	mov    0x14(%esp),%edx
10005464:	39 14 85 80 fa 00 10 	cmp    %edx,0x1000fa80(,%eax,4)
1000546b:	74 09                	je     0x10005476
1000546d:	40                   	inc    %eax
1000546e:	3b c1                	cmp    %ecx,%eax
10005470:	7c f2                	jl     0x10005464
10005472:	33 c0                	xor    %eax,%eax
10005474:	5e                   	pop    %esi
10005475:	c3                   	ret
10005476:	ff 14 85 00 fa 00 10 	call   *0x1000fa00(,%eax,4)
1000547d:	8b 54 24 08          	mov    0x8(%esp),%edx
10005481:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
10005485:	8b f0                	mov    %eax,%esi
10005487:	8b 44 24 18          	mov    0x18(%esp),%eax
1000548b:	89 56 0c             	mov    %edx,0xc(%esi)
1000548e:	89 4e 08             	mov    %ecx,0x8(%esi)
10005491:	89 46 04             	mov    %eax,0x4(%esi)
10005494:	8b 16                	mov    (%esi),%edx
10005496:	8b ce                	mov    %esi,%ecx
10005498:	ff 52 04             	call   *0x4(%edx)
1000549b:	8b c6                	mov    %esi,%eax
1000549d:	5e                   	pop    %esi
1000549e:	c3                   	ret
1000549f:	90                   	nop
100054a0:	53                   	push   %ebx
100054a1:	56                   	push   %esi
100054a2:	8b 74 24 0c          	mov    0xc(%esp),%esi
100054a6:	85 f6                	test   %esi,%esi
100054a8:	57                   	push   %edi
100054a9:	8b d9                	mov    %ecx,%ebx
100054ab:	74 4e                	je     0x100054fb
100054ad:	8b 46 04             	mov    0x4(%esi),%eax
100054b0:	0f b6 08             	movzbl (%eax),%ecx
100054b3:	8b 7c 24 14          	mov    0x14(%esp),%edi
100054b7:	3b cf                	cmp    %edi,%ecx
100054b9:	7e 40                	jle    0x100054fb
100054bb:	57                   	push   %edi
100054bc:	8b ce                	mov    %esi,%ecx
100054be:	e8 bd bb ff ff       	call   0x10001080
100054c3:	85 c0                	test   %eax,%eax
100054c5:	74 34                	je     0x100054fb
100054c7:	0f be 00             	movsbl (%eax),%eax
100054ca:	83 f8 05             	cmp    $0x5,%eax
100054cd:	75 2c                	jne    0x100054fb
100054cf:	57                   	push   %edi
100054d0:	8b ce                	mov    %esi,%ecx
100054d2:	e8 a9 bb ff ff       	call   0x10001080
100054d7:	80 38 05             	cmpb   $0x5,(%eax)
100054da:	74 0c                	je     0x100054e8
100054dc:	5f                   	pop    %edi
100054dd:	33 c0                	xor    %eax,%eax
100054df:	89 03                	mov    %eax,(%ebx)
100054e1:	5e                   	pop    %esi
100054e2:	b0 01                	mov    $0x1,%al
100054e4:	5b                   	pop    %ebx
100054e5:	c2 08 00             	ret    $0x8
100054e8:	8b 50 05             	mov    0x5(%eax),%edx
100054eb:	89 53 04             	mov    %edx,0x4(%ebx)
100054ee:	8b 40 01             	mov    0x1(%eax),%eax
100054f1:	5f                   	pop    %edi
100054f2:	89 03                	mov    %eax,(%ebx)
100054f4:	5e                   	pop    %esi
100054f5:	b0 01                	mov    $0x1,%al
100054f7:	5b                   	pop    %ebx
100054f8:	c2 08 00             	ret    $0x8
100054fb:	5f                   	pop    %edi
100054fc:	5e                   	pop    %esi
100054fd:	32 c0                	xor    %al,%al
100054ff:	5b                   	pop    %ebx
10005500:	c2 08 00             	ret    $0x8
10005503:	90                   	nop
10005504:	90                   	nop
10005505:	90                   	nop
10005506:	90                   	nop
10005507:	90                   	nop
10005508:	90                   	nop
10005509:	90                   	nop
1000550a:	90                   	nop
1000550b:	90                   	nop
1000550c:	90                   	nop
1000550d:	90                   	nop
1000550e:	90                   	nop
1000550f:	90                   	nop
10005510:	56                   	push   %esi
10005511:	8b 74 24 08          	mov    0x8(%esp),%esi
10005515:	eb 10                	jmp    0x10005527
10005517:	56                   	push   %esi
10005518:	e8 a7 0f 00 00       	call   0x100064c4
1000551d:	85 c0                	test   %eax,%eax
1000551f:	59                   	pop    %ecx
10005520:	75 05                	jne    0x10005527
10005522:	e8 0b 01 00 00       	call   0x10005632
10005527:	56                   	push   %esi
10005528:	e8 85 0f 00 00       	call   0x100064b2
1000552d:	85 c0                	test   %eax,%eax
1000552f:	59                   	pop    %ecx
10005530:	74 e5                	je     0x10005517
10005532:	5e                   	pop    %esi
10005533:	c3                   	ret
10005534:	56                   	push   %esi
10005535:	8b f1                	mov    %ecx,%esi
10005537:	e8 14 00 00 00       	call   0x10005550
1000553c:	f6 44 24 08 01       	testb  $0x1,0x8(%esp)
10005541:	74 07                	je     0x1000554a
10005543:	56                   	push   %esi
10005544:	e8 94 04 00 00       	call   0x100059dd
10005549:	59                   	pop    %ecx
1000554a:	8b c6                	mov    %esi,%eax
1000554c:	5e                   	pop    %esi
1000554d:	c2 04 00             	ret    $0x4
10005550:	c7 01 c8 c2 00 10    	movl   $0x1000c2c8,(%ecx)
10005556:	e9 e5 c0 ff ff       	jmp    0x10001640
1000555b:	b8 4d b3 00 10       	mov    $0x1000b34d,%eax
10005560:	e8 4b 13 00 00       	call   0x100068b0
10005565:	83 ec 44             	sub    $0x44,%esp
10005568:	68 d0 c2 00 10       	push   $0x1000c2d0  ; 0x1000c2d0='invalid string position'
1000556d:	8d 4d d8             	lea    -0x28(%ebp),%ecx
10005570:	e8 3b c4 ff ff       	call   0x100019b0
10005575:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
10005579:	8d 45 d8             	lea    -0x28(%ebp),%eax
1000557c:	50                   	push   %eax
1000557d:	8d 4d b0             	lea    -0x50(%ebp),%ecx
10005580:	e8 ab c3 ff ff       	call   0x10001930
10005585:	68 48 d9 00 10       	push   $0x1000d948
1000558a:	8d 45 b0             	lea    -0x50(%ebp),%eax
1000558d:	50                   	push   %eax
1000558e:	c7 45 b0 c8 c2 00 10 	movl   $0x1000c2c8,-0x50(%ebp)
10005595:	e8 48 04 00 00       	call   0x100059e2
1000559a:	cc                   	int3
1000559b:	56                   	push   %esi
1000559c:	ff 74 24 08          	push   0x8(%esp)
100055a0:	8b f1                	mov    %ecx,%esi
100055a2:	e8 c9 c4 ff ff       	call   0x10001a70
100055a7:	c7 06 c8 c2 00 10    	movl   $0x1000c2c8,(%esi)
100055ad:	8b c6                	mov    %esi,%eax
100055af:	5e                   	pop    %esi
100055b0:	c2 04 00             	ret    $0x4
100055b3:	b8 4d b3 00 10       	mov    $0x1000b34d,%eax
100055b8:	e8 f3 12 00 00       	call   0x100068b0
100055bd:	83 ec 44             	sub    $0x44,%esp
100055c0:	68 e8 c2 00 10       	push   $0x1000c2e8  ; 0x1000c2e8='string too long'
100055c5:	8d 4d d8             	lea    -0x28(%ebp),%ecx
100055c8:	e8 e3 c3 ff ff       	call   0x100019b0
100055cd:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
100055d1:	8d 45 d8             	lea    -0x28(%ebp),%eax
100055d4:	50                   	push   %eax
100055d5:	8d 4d b0             	lea    -0x50(%ebp),%ecx
100055d8:	e8 53 c3 ff ff       	call   0x10001930
100055dd:	68 bc d4 00 10       	push   $0x1000d4bc
100055e2:	8d 45 b0             	lea    -0x50(%ebp),%eax
100055e5:	50                   	push   %eax
100055e6:	c7 45 b0 bc c2 00 10 	movl   $0x1000c2bc,-0x50(%ebp)
100055ed:	e8 f0 03 00 00       	call   0x100059e2
100055f2:	cc                   	int3
100055f3:	c7 01 fc c2 00 10    	movl   $0x1000c2fc,(%ecx)
100055f9:	e9 08 09 00 00       	jmp    0x10005f06
100055fe:	56                   	push   %esi
100055ff:	8b f1                	mov    %ecx,%esi
10005601:	e8 ed ff ff ff       	call   0x100055f3
10005606:	f6 44 24 08 01       	testb  $0x1,0x8(%esp)
1000560b:	74 07                	je     0x10005614
1000560d:	56                   	push   %esi
1000560e:	e8 ca 03 00 00       	call   0x100059dd
10005613:	59                   	pop    %ecx
10005614:	8b c6                	mov    %esi,%eax
10005616:	5e                   	pop    %esi
10005617:	c2 04 00             	ret    $0x4
1000561a:	56                   	push   %esi
1000561b:	ff 74 24 08          	push   0x8(%esp)
1000561f:	8b f1                	mov    %ecx,%esi
10005621:	e8 96 08 00 00       	call   0x10005ebc
10005626:	c7 06 fc c2 00 10    	movl   $0x1000c2fc,(%esi)
1000562c:	8b c6                	mov    %esi,%eax
1000562e:	5e                   	pop    %esi
1000562f:	c2 04 00             	ret    $0x4
10005632:	55                   	push   %ebp
10005633:	8b ec                	mov    %esp,%ebp
10005635:	83 ec 10             	sub    $0x10,%esp
10005638:	f6 05 1c fc 00 10 01 	testb  $0x1,0x1000fc1c
1000563f:	56                   	push   %esi
10005640:	be fc c2 00 10       	mov    $0x1000c2fc,%esi
10005645:	75 2d                	jne    0x10005674
10005647:	83 0d 1c fc 00 10 01 	orl    $0x1,0x1000fc1c
1000564e:	8d 45 fc             	lea    -0x4(%ebp),%eax
10005651:	50                   	push   %eax
10005652:	b9 10 fc 00 10       	mov    $0x1000fc10,%ecx
10005657:	c7 45 fc 04 c3 00 10 	movl   $0x1000c304,-0x4(%ebp)  ; 0x1000c304='bad allocation'
1000565e:	e8 1c 08 00 00       	call   0x10005e7f
10005663:	68 57 b3 00 10       	push   $0x1000b357
10005668:	89 35 10 fc 00 10    	mov    %esi,0x1000fc10
1000566e:	e8 3c 13 00 00       	call   0x100069af
10005673:	59                   	pop    %ecx
10005674:	68 10 fc 00 10       	push   $0x1000fc10
10005679:	8d 4d f0             	lea    -0x10(%ebp),%ecx
1000567c:	e8 3b 08 00 00       	call   0x10005ebc
10005681:	68 a4 d9 00 10       	push   $0x1000d9a4
10005686:	8d 45 f0             	lea    -0x10(%ebp),%eax
10005689:	50                   	push   %eax
1000568a:	89 75 f0             	mov    %esi,-0x10(%ebp)
1000568d:	e8 50 03 00 00       	call   0x100059e2
10005692:	cc                   	int3
10005693:	cc                   	int3
10005694:	cc                   	int3
10005695:	cc                   	int3
10005696:	cc                   	int3
10005697:	cc                   	int3
10005698:	cc                   	int3
10005699:	cc                   	int3
1000569a:	cc                   	int3
1000569b:	cc                   	int3
1000569c:	cc                   	int3
1000569d:	cc                   	int3
1000569e:	cc                   	int3
1000569f:	cc                   	int3
100056a0:	55                   	push   %ebp
100056a1:	8b ec                	mov    %esp,%ebp
100056a3:	57                   	push   %edi
100056a4:	56                   	push   %esi
100056a5:	8b 75 0c             	mov    0xc(%ebp),%esi
100056a8:	8b 4d 10             	mov    0x10(%ebp),%ecx
100056ab:	8b 7d 08             	mov    0x8(%ebp),%edi
100056ae:	8b c1                	mov    %ecx,%eax
100056b0:	8b d1                	mov    %ecx,%edx
100056b2:	03 c6                	add    %esi,%eax
100056b4:	3b fe                	cmp    %esi,%edi
100056b6:	76 08                	jbe    0x100056c0
100056b8:	3b f8                	cmp    %eax,%edi
100056ba:	0f 82 7c 01 00 00    	jb     0x1000583c
100056c0:	f7 c7 03 00 00 00    	test   $0x3,%edi
100056c6:	75 14                	jne    0x100056dc
100056c8:	c1 e9 02             	shr    $0x2,%ecx
100056cb:	83 e2 03             	and    $0x3,%edx
100056ce:	83 f9 08             	cmp    $0x8,%ecx
100056d1:	72 29                	jb     0x100056fc
100056d3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
100056d5:	ff 24 95 ec 57 00 10 	jmp    *0x100057ec(,%edx,4)
100056dc:	8b c7                	mov    %edi,%eax
100056de:	ba 03 00 00 00       	mov    $0x3,%edx
100056e3:	83 e9 04             	sub    $0x4,%ecx
100056e6:	72 0c                	jb     0x100056f4
100056e8:	83 e0 03             	and    $0x3,%eax
100056eb:	03 c8                	add    %eax,%ecx
100056ed:	ff 24 85 00 57 00 10 	jmp    *0x10005700(,%eax,4)
100056f4:	ff 24 8d fc 57 00 10 	jmp    *0x100057fc(,%ecx,4)
100056fb:	90                   	nop
100056fc:	ff 24 8d 80 57 00 10 	jmp    *0x10005780(,%ecx,4)
10005703:	90                   	nop
10005704:	10 57 00             	adc    %dl,0x0(%edi)
10005707:	10 3c 57             	adc    %bh,(%edi,%edx,2)
1000570a:	00 10                	add    %dl,(%eax)
1000570c:	60                   	pusha
1000570d:	57                   	push   %edi
1000570e:	00 10                	add    %dl,(%eax)
10005710:	23 d1                	and    %ecx,%edx
10005712:	8a 06                	mov    (%esi),%al
10005714:	88 07                	mov    %al,(%edi)
10005716:	8a 46 01             	mov    0x1(%esi),%al
10005719:	88 47 01             	mov    %al,0x1(%edi)
1000571c:	8a 46 02             	mov    0x2(%esi),%al
1000571f:	c1 e9 02             	shr    $0x2,%ecx
10005722:	88 47 02             	mov    %al,0x2(%edi)
10005725:	83 c6 03             	add    $0x3,%esi
10005728:	83 c7 03             	add    $0x3,%edi
1000572b:	83 f9 08             	cmp    $0x8,%ecx
1000572e:	72 cc                	jb     0x100056fc
10005730:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
10005732:	ff 24 95 ec 57 00 10 	jmp    *0x100057ec(,%edx,4)
10005739:	8d 49 00             	lea    0x0(%ecx),%ecx
1000573c:	23 d1                	and    %ecx,%edx
1000573e:	8a 06                	mov    (%esi),%al
10005740:	88 07                	mov    %al,(%edi)
10005742:	8a 46 01             	mov    0x1(%esi),%al
10005745:	c1 e9 02             	shr    $0x2,%ecx
10005748:	88 47 01             	mov    %al,0x1(%edi)
1000574b:	83 c6 02             	add    $0x2,%esi
1000574e:	83 c7 02             	add    $0x2,%edi
10005751:	83 f9 08             	cmp    $0x8,%ecx
10005754:	72 a6                	jb     0x100056fc
10005756:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
10005758:	ff 24 95 ec 57 00 10 	jmp    *0x100057ec(,%edx,4)
1000575f:	90                   	nop
10005760:	23 d1                	and    %ecx,%edx
10005762:	8a 06                	mov    (%esi),%al
10005764:	88 07                	mov    %al,(%edi)
10005766:	83 c6 01             	add    $0x1,%esi
10005769:	c1 e9 02             	shr    $0x2,%ecx
1000576c:	83 c7 01             	add    $0x1,%edi
1000576f:	83 f9 08             	cmp    $0x8,%ecx
10005772:	72 88                	jb     0x100056fc
10005774:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
10005776:	ff 24 95 ec 57 00 10 	jmp    *0x100057ec(,%edx,4)
1000577d:	8d 49 00             	lea    0x0(%ecx),%ecx
10005780:	e3 57                	jecxz  0x100057d9
10005782:	00 10                	add    %dl,(%eax)
10005784:	d0 57 00             	rclb   $1,0x0(%edi)
10005787:	10 c8                	adc    %cl,%al
10005789:	57                   	push   %edi
1000578a:	00 10                	add    %dl,(%eax)
1000578c:	c0 57 00 10          	rclb   $0x10,0x0(%edi)
10005790:	b8 57 00 10 b0       	mov    $0xb0100057,%eax
10005795:	57                   	push   %edi
10005796:	00 10                	add    %dl,(%eax)
10005798:	a8 57                	test   $0x57,%al
1000579a:	00 10                	add    %dl,(%eax)
1000579c:	a0 57 00 10 8b       	mov    0x8b100057,%al
100057a1:	44                   	inc    %esp
100057a2:	8e e4                	mov    %esp,%fs
100057a4:	89 44 8f e4          	mov    %eax,-0x1c(%edi,%ecx,4)
100057a8:	8b 44 8e e8          	mov    -0x18(%esi,%ecx,4),%eax
100057ac:	89 44 8f e8          	mov    %eax,-0x18(%edi,%ecx,4)
100057b0:	8b 44 8e ec          	mov    -0x14(%esi,%ecx,4),%eax
100057b4:	89 44 8f ec          	mov    %eax,-0x14(%edi,%ecx,4)
100057b8:	8b 44 8e f0          	mov    -0x10(%esi,%ecx,4),%eax
100057bc:	89 44 8f f0          	mov    %eax,-0x10(%edi,%ecx,4)
100057c0:	8b 44 8e f4          	mov    -0xc(%esi,%ecx,4),%eax
100057c4:	89 44 8f f4          	mov    %eax,-0xc(%edi,%ecx,4)
100057c8:	8b 44 8e f8          	mov    -0x8(%esi,%ecx,4),%eax
100057cc:	89 44 8f f8          	mov    %eax,-0x8(%edi,%ecx,4)
100057d0:	8b 44 8e fc          	mov    -0x4(%esi,%ecx,4),%eax
100057d4:	89 44 8f fc          	mov    %eax,-0x4(%edi,%ecx,4)
100057d8:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
100057df:	03 f0                	add    %eax,%esi
100057e1:	03 f8                	add    %eax,%edi
100057e3:	ff 24 95 ec 57 00 10 	jmp    *0x100057ec(,%edx,4)
100057ea:	8b ff                	mov    %edi,%edi
100057ec:	fc                   	cld
100057ed:	57                   	push   %edi
100057ee:	00 10                	add    %dl,(%eax)
100057f0:	04 58                	add    $0x58,%al
100057f2:	00 10                	add    %dl,(%eax)
100057f4:	10 58 00             	adc    %bl,0x0(%eax)
100057f7:	10 24 58             	adc    %ah,(%eax,%ebx,2)
100057fa:	00 10                	add    %dl,(%eax)
100057fc:	8b 45 08             	mov    0x8(%ebp),%eax
100057ff:	5e                   	pop    %esi
10005800:	5f                   	pop    %edi
10005801:	c9                   	leave
10005802:	c3                   	ret
10005803:	90                   	nop
10005804:	8a 06                	mov    (%esi),%al
10005806:	88 07                	mov    %al,(%edi)
10005808:	8b 45 08             	mov    0x8(%ebp),%eax
1000580b:	5e                   	pop    %esi
1000580c:	5f                   	pop    %edi
1000580d:	c9                   	leave
1000580e:	c3                   	ret
1000580f:	90                   	nop
10005810:	8a 06                	mov    (%esi),%al
10005812:	88 07                	mov    %al,(%edi)
10005814:	8a 46 01             	mov    0x1(%esi),%al
10005817:	88 47 01             	mov    %al,0x1(%edi)
1000581a:	8b 45 08             	mov    0x8(%ebp),%eax
1000581d:	5e                   	pop    %esi
1000581e:	5f                   	pop    %edi
1000581f:	c9                   	leave
10005820:	c3                   	ret
10005821:	8d 49 00             	lea    0x0(%ecx),%ecx
10005824:	8a 06                	mov    (%esi),%al
10005826:	88 07                	mov    %al,(%edi)
10005828:	8a 46 01             	mov    0x1(%esi),%al
1000582b:	88 47 01             	mov    %al,0x1(%edi)
1000582e:	8a 46 02             	mov    0x2(%esi),%al
10005831:	88 47 02             	mov    %al,0x2(%edi)
10005834:	8b 45 08             	mov    0x8(%ebp),%eax
10005837:	5e                   	pop    %esi
10005838:	5f                   	pop    %edi
10005839:	c9                   	leave
1000583a:	c3                   	ret
1000583b:	90                   	nop
1000583c:	8d 74 31 fc          	lea    -0x4(%ecx,%esi,1),%esi
10005840:	8d 7c 39 fc          	lea    -0x4(%ecx,%edi,1),%edi
10005844:	f7 c7 03 00 00 00    	test   $0x3,%edi
1000584a:	75 24                	jne    0x10005870
1000584c:	c1 e9 02             	shr    $0x2,%ecx
1000584f:	83 e2 03             	and    $0x3,%edx
10005852:	83 f9 08             	cmp    $0x8,%ecx
10005855:	72 0d                	jb     0x10005864
10005857:	fd                   	std
10005858:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
1000585a:	fc                   	cld
1000585b:	ff 24 95 88 59 00 10 	jmp    *0x10005988(,%edx,4)
10005862:	8b ff                	mov    %edi,%edi
10005864:	f7 d9                	neg    %ecx
10005866:	ff 24 8d 38 59 00 10 	jmp    *0x10005938(,%ecx,4)
1000586d:	8d 49 00             	lea    0x0(%ecx),%ecx
10005870:	8b c7                	mov    %edi,%eax
10005872:	ba 03 00 00 00       	mov    $0x3,%edx
10005877:	83 f9 04             	cmp    $0x4,%ecx
1000587a:	72 0c                	jb     0x10005888
1000587c:	83 e0 03             	and    $0x3,%eax
1000587f:	2b c8                	sub    %eax,%ecx
10005881:	ff 24 85 8c 58 00 10 	jmp    *0x1000588c(,%eax,4)
10005888:	ff 24 8d 88 59 00 10 	jmp    *0x10005988(,%ecx,4)
1000588f:	90                   	nop
10005890:	9c                   	pushf
10005891:	58                   	pop    %eax
10005892:	00 10                	add    %dl,(%eax)
10005894:	c0 58 00 10          	rcrb   $0x10,0x0(%eax)
10005898:	e8 58 00 10 8a       	call   0x9a1058f5
1000589d:	46                   	inc    %esi
1000589e:	03 23                	add    (%ebx),%esp
100058a0:	d1 88 47 03 83 ee    	rorl   $1,-0x117cfcb9(%eax)
100058a6:	01 c1                	add    %eax,%ecx
100058a8:	e9 02 83 ef 01       	jmp    0x11efdbaf
100058ad:	83 f9 08             	cmp    $0x8,%ecx
100058b0:	72 b2                	jb     0x10005864
100058b2:	fd                   	std
100058b3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
100058b5:	fc                   	cld
100058b6:	ff 24 95 88 59 00 10 	jmp    *0x10005988(,%edx,4)
100058bd:	8d 49 00             	lea    0x0(%ecx),%ecx
100058c0:	8a 46 03             	mov    0x3(%esi),%al
100058c3:	23 d1                	and    %ecx,%edx
100058c5:	88 47 03             	mov    %al,0x3(%edi)
100058c8:	8a 46 02             	mov    0x2(%esi),%al
100058cb:	c1 e9 02             	shr    $0x2,%ecx
100058ce:	88 47 02             	mov    %al,0x2(%edi)
100058d1:	83 ee 02             	sub    $0x2,%esi
100058d4:	83 ef 02             	sub    $0x2,%edi
100058d7:	83 f9 08             	cmp    $0x8,%ecx
100058da:	72 88                	jb     0x10005864
100058dc:	fd                   	std
100058dd:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
100058df:	fc                   	cld
100058e0:	ff 24 95 88 59 00 10 	jmp    *0x10005988(,%edx,4)
100058e7:	90                   	nop
100058e8:	8a 46 03             	mov    0x3(%esi),%al
100058eb:	23 d1                	and    %ecx,%edx
100058ed:	88 47 03             	mov    %al,0x3(%edi)
100058f0:	8a 46 02             	mov    0x2(%esi),%al
100058f3:	88 47 02             	mov    %al,0x2(%edi)
100058f6:	8a 46 01             	mov    0x1(%esi),%al
100058f9:	c1 e9 02             	shr    $0x2,%ecx
100058fc:	88 47 01             	mov    %al,0x1(%edi)
100058ff:	83 ee 03             	sub    $0x3,%esi
10005902:	83 ef 03             	sub    $0x3,%edi
10005905:	83 f9 08             	cmp    $0x8,%ecx
10005908:	0f 82 56 ff ff ff    	jb     0x10005864
1000590e:	fd                   	std
1000590f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
10005911:	fc                   	cld
10005912:	ff 24 95 88 59 00 10 	jmp    *0x10005988(,%edx,4)
10005919:	8d 49 00             	lea    0x0(%ecx),%ecx
1000591c:	3c 59                	cmp    $0x59,%al
1000591e:	00 10                	add    %dl,(%eax)
10005920:	44                   	inc    %esp
10005921:	59                   	pop    %ecx
10005922:	00 10                	add    %dl,(%eax)
10005924:	4c                   	dec    %esp
10005925:	59                   	pop    %ecx
10005926:	00 10                	add    %dl,(%eax)
10005928:	54                   	push   %esp
10005929:	59                   	pop    %ecx
1000592a:	00 10                	add    %dl,(%eax)
1000592c:	5c                   	pop    %esp
1000592d:	59                   	pop    %ecx
1000592e:	00 10                	add    %dl,(%eax)
10005930:	64 59                	fs pop %ecx
10005932:	00 10                	add    %dl,(%eax)
10005934:	6c                   	insb   (%dx),%es:(%edi)
10005935:	59                   	pop    %ecx
10005936:	00 10                	add    %dl,(%eax)
10005938:	7f 59                	jg     0x10005993
1000593a:	00 10                	add    %dl,(%eax)
1000593c:	8b 44 8e 1c          	mov    0x1c(%esi,%ecx,4),%eax
10005940:	89 44 8f 1c          	mov    %eax,0x1c(%edi,%ecx,4)
10005944:	8b 44 8e 18          	mov    0x18(%esi,%ecx,4),%eax
10005948:	89 44 8f 18          	mov    %eax,0x18(%edi,%ecx,4)
1000594c:	8b 44 8e 14          	mov    0x14(%esi,%ecx,4),%eax
10005950:	89 44 8f 14          	mov    %eax,0x14(%edi,%ecx,4)
10005954:	8b 44 8e 10          	mov    0x10(%esi,%ecx,4),%eax
10005958:	89 44 8f 10          	mov    %eax,0x10(%edi,%ecx,4)
1000595c:	8b 44 8e 0c          	mov    0xc(%esi,%ecx,4),%eax
10005960:	89 44 8f 0c          	mov    %eax,0xc(%edi,%ecx,4)
10005964:	8b 44 8e 08          	mov    0x8(%esi,%ecx,4),%eax
10005968:	89 44 8f 08          	mov    %eax,0x8(%edi,%ecx,4)
1000596c:	8b 44 8e 04          	mov    0x4(%esi,%ecx,4),%eax
10005970:	89 44 8f 04          	mov    %eax,0x4(%edi,%ecx,4)
10005974:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
1000597b:	03 f0                	add    %eax,%esi
1000597d:	03 f8                	add    %eax,%edi
1000597f:	ff 24 95 88 59 00 10 	jmp    *0x10005988(,%edx,4)
10005986:	8b ff                	mov    %edi,%edi
10005988:	98                   	cwtl
10005989:	59                   	pop    %ecx
1000598a:	00 10                	add    %dl,(%eax)
1000598c:	a0 59 00 10 b0       	mov    0xb0100059,%al
10005991:	59                   	pop    %ecx
10005992:	00 10                	add    %dl,(%eax)
10005994:	c4 59 00             	les    0x0(%ecx),%ebx
10005997:	10 8b 45 08 5e 5f    	adc    %cl,0x5f5e0845(%ebx)
1000599d:	c9                   	leave
1000599e:	c3                   	ret
1000599f:	90                   	nop
100059a0:	8a 46 03             	mov    0x3(%esi),%al
100059a3:	88 47 03             	mov    %al,0x3(%edi)
100059a6:	8b 45 08             	mov    0x8(%ebp),%eax
100059a9:	5e                   	pop    %esi
100059aa:	5f                   	pop    %edi
100059ab:	c9                   	leave
100059ac:	c3                   	ret
100059ad:	8d 49 00             	lea    0x0(%ecx),%ecx
100059b0:	8a 46 03             	mov    0x3(%esi),%al
100059b3:	88 47 03             	mov    %al,0x3(%edi)
100059b6:	8a 46 02             	mov    0x2(%esi),%al
100059b9:	88 47 02             	mov    %al,0x2(%edi)
100059bc:	8b 45 08             	mov    0x8(%ebp),%eax
100059bf:	5e                   	pop    %esi
100059c0:	5f                   	pop    %edi
100059c1:	c9                   	leave
100059c2:	c3                   	ret
100059c3:	90                   	nop
100059c4:	8a 46 03             	mov    0x3(%esi),%al
100059c7:	88 47 03             	mov    %al,0x3(%edi)
100059ca:	8a 46 02             	mov    0x2(%esi),%al
100059cd:	88 47 02             	mov    %al,0x2(%edi)
100059d0:	8a 46 01             	mov    0x1(%esi),%al
100059d3:	88 47 01             	mov    %al,0x1(%edi)
100059d6:	8b 45 08             	mov    0x8(%ebp),%eax
100059d9:	5e                   	pop    %esi
100059da:	5f                   	pop    %edi
100059db:	c9                   	leave
100059dc:	c3                   	ret
100059dd:	e9 df 0f 00 00       	jmp    0x100069c1
100059e2:	55                   	push   %ebp
100059e3:	8b ec                	mov    %esp,%ebp
100059e5:	83 ec 20             	sub    $0x20,%esp
100059e8:	8b 45 08             	mov    0x8(%ebp),%eax
100059eb:	56                   	push   %esi
100059ec:	57                   	push   %edi
100059ed:	6a 08                	push   $0x8
100059ef:	59                   	pop    %ecx
100059f0:	be 14 c3 00 10       	mov    $0x1000c314,%esi
100059f5:	8d 7d e0             	lea    -0x20(%ebp),%edi
100059f8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
100059fa:	89 45 f8             	mov    %eax,-0x8(%ebp)
100059fd:	8b 45 0c             	mov    0xc(%ebp),%eax
10005a00:	89 45 fc             	mov    %eax,-0x4(%ebp)
10005a03:	8d 45 f4             	lea    -0xc(%ebp),%eax
10005a06:	50                   	push   %eax
10005a07:	ff 75 f0             	push   -0x10(%ebp)
10005a0a:	ff 75 e4             	push   -0x1c(%ebp)
10005a0d:	ff 75 e0             	push   -0x20(%ebp)
10005a10:	ff 15 14 c0 00 10    	call   *0x1000c014  ; 0x1000c014=KERNEL32.dll!RaiseException
10005a16:	5f                   	pop    %edi
10005a17:	5e                   	pop    %esi
10005a18:	c9                   	leave
10005a19:	c2 08 00             	ret    $0x8
10005a1c:	55                   	push   %ebp
10005a1d:	8b ec                	mov    %esp,%ebp
10005a1f:	51                   	push   %ecx
10005a20:	53                   	push   %ebx
10005a21:	8b 45 0c             	mov    0xc(%ebp),%eax
10005a24:	83 c0 0c             	add    $0xc,%eax
10005a27:	89 45 fc             	mov    %eax,-0x4(%ebp)
10005a2a:	64 8b 1d 00 00 00 00 	mov    %fs:0x0,%ebx
10005a31:	8b 03                	mov    (%ebx),%eax
10005a33:	64 a3 00 00 00 00    	mov    %eax,%fs:0x0
10005a39:	8b 45 08             	mov    0x8(%ebp),%eax
10005a3c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
10005a3f:	8b 63 fc             	mov    -0x4(%ebx),%esp
10005a42:	8b 6d fc             	mov    -0x4(%ebp),%ebp
10005a45:	ff e0                	jmp    *%eax
10005a47:	5b                   	pop    %ebx
10005a48:	c9                   	leave
10005a49:	c2 08 00             	ret    $0x8
10005a4c:	58                   	pop    %eax
10005a4d:	59                   	pop    %ecx
10005a4e:	87 04 24             	xchg   %eax,(%esp)
10005a51:	ff e0                	jmp    *%eax
10005a53:	55                   	push   %ebp
10005a54:	8b ec                	mov    %esp,%ebp
10005a56:	51                   	push   %ecx
10005a57:	51                   	push   %ecx
10005a58:	53                   	push   %ebx
10005a59:	56                   	push   %esi
10005a5a:	57                   	push   %edi
10005a5b:	64 8b 35 00 00 00 00 	mov    %fs:0x0,%esi
10005a62:	89 75 fc             	mov    %esi,-0x4(%ebp)
10005a65:	c7 45 f8 7c 5a 00 10 	movl   $0x10005a7c,-0x8(%ebp)
10005a6c:	6a 00                	push   $0x0
10005a6e:	ff 75 0c             	push   0xc(%ebp)
10005a71:	ff 75 f8             	push   -0x8(%ebp)
10005a74:	ff 75 08             	push   0x8(%ebp)
10005a77:	e8 82 56 00 00       	call   0x1000b0fe
10005a7c:	8b 45 0c             	mov    0xc(%ebp),%eax
10005a7f:	8b 40 04             	mov    0x4(%eax),%eax
10005a82:	83 e0 fd             	and    $0xfffffffd,%eax
10005a85:	8b 4d 0c             	mov    0xc(%ebp),%ecx
10005a88:	89 41 04             	mov    %eax,0x4(%ecx)
10005a8b:	64 8b 3d 00 00 00 00 	mov    %fs:0x0,%edi
10005a92:	8b 5d fc             	mov    -0x4(%ebp),%ebx
10005a95:	89 3b                	mov    %edi,(%ebx)
10005a97:	64 89 1d 00 00 00 00 	mov    %ebx,%fs:0x0
10005a9e:	5f                   	pop    %edi
10005a9f:	5e                   	pop    %esi
10005aa0:	5b                   	pop    %ebx
10005aa1:	c9                   	leave
10005aa2:	c2 08 00             	ret    $0x8
10005aa5:	55                   	push   %ebp
10005aa6:	8b ec                	mov    %esp,%ebp
10005aa8:	83 ec 04             	sub    $0x4,%esp
10005aab:	53                   	push   %ebx
10005aac:	56                   	push   %esi
10005aad:	57                   	push   %edi
10005aae:	fc                   	cld
10005aaf:	89 45 fc             	mov    %eax,-0x4(%ebp)
10005ab2:	33 c0                	xor    %eax,%eax
10005ab4:	50                   	push   %eax
10005ab5:	50                   	push   %eax
10005ab6:	50                   	push   %eax
10005ab7:	ff 75 fc             	push   -0x4(%ebp)
10005aba:	ff 75 14             	push   0x14(%ebp)
10005abd:	ff 75 10             	push   0x10(%ebp)
10005ac0:	ff 75 0c             	push   0xc(%ebp)
10005ac3:	ff 75 08             	push   0x8(%ebp)
10005ac6:	e8 96 17 00 00       	call   0x10007261
10005acb:	83 c4 20             	add    $0x20,%esp
10005ace:	89 45 fc             	mov    %eax,-0x4(%ebp)
10005ad1:	5f                   	pop    %edi
10005ad2:	5e                   	pop    %esi
10005ad3:	5b                   	pop    %ebx
10005ad4:	8b 45 fc             	mov    -0x4(%ebp),%eax
10005ad7:	8b e5                	mov    %ebp,%esp
10005ad9:	5d                   	pop    %ebp
10005ada:	c3                   	ret
10005adb:	fc                   	cld
10005adc:	8b 44 24 08          	mov    0x8(%esp),%eax
10005ae0:	6a 00                	push   $0x0
10005ae2:	50                   	push   %eax
10005ae3:	ff 70 10             	push   0x10(%eax)
10005ae6:	ff 70 08             	push   0x8(%eax)
10005ae9:	6a 00                	push   $0x0
10005aeb:	ff 74 24 20          	push   0x20(%esp)
10005aef:	ff 70 0c             	push   0xc(%eax)
10005af2:	ff 74 24 20          	push   0x20(%esp)
10005af6:	e8 66 17 00 00       	call   0x10007261
10005afb:	83 c4 20             	add    $0x20,%esp
10005afe:	c3                   	ret
10005aff:	55                   	push   %ebp
10005b00:	8b ec                	mov    %esp,%ebp
10005b02:	53                   	push   %ebx
10005b03:	fc                   	cld
10005b04:	8b 45 08             	mov    0x8(%ebp),%eax
10005b07:	8b 40 04             	mov    0x4(%eax),%eax
10005b0a:	83 e0 66             	and    $0x66,%eax
10005b0d:	85 c0                	test   %eax,%eax
10005b0f:	74 0f                	je     0x10005b20
10005b11:	8b 45 0c             	mov    0xc(%ebp),%eax
10005b14:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
10005b1b:	33 c0                	xor    %eax,%eax
10005b1d:	40                   	inc    %eax
10005b1e:	eb 4d                	jmp    0x10005b6d
10005b20:	6a 01                	push   $0x1
10005b22:	8b 45 0c             	mov    0xc(%ebp),%eax
10005b25:	ff 70 14             	push   0x14(%eax)
10005b28:	8b 45 0c             	mov    0xc(%ebp),%eax
10005b2b:	ff 70 10             	push   0x10(%eax)
10005b2e:	8b 45 0c             	mov    0xc(%ebp),%eax
10005b31:	ff 70 08             	push   0x8(%eax)
10005b34:	6a 00                	push   $0x0
10005b36:	ff 75 10             	push   0x10(%ebp)
10005b39:	8b 45 0c             	mov    0xc(%ebp),%eax
10005b3c:	ff 70 0c             	push   0xc(%eax)
10005b3f:	ff 75 08             	push   0x8(%ebp)
10005b42:	e8 1a 17 00 00       	call   0x10007261
10005b47:	83 c4 20             	add    $0x20,%esp
10005b4a:	8b 45 0c             	mov    0xc(%ebp),%eax
10005b4d:	83 78 24 00          	cmpl   $0x0,0x24(%eax)
10005b51:	75 0b                	jne    0x10005b5e
10005b53:	ff 75 08             	push   0x8(%ebp)
10005b56:	ff 75 0c             	push   0xc(%ebp)
10005b59:	e8 f5 fe ff ff       	call   0x10005a53
10005b5e:	8b 5d 0c             	mov    0xc(%ebp),%ebx
10005b61:	8b 63 1c             	mov    0x1c(%ebx),%esp
10005b64:	8b 6b 20             	mov    0x20(%ebx),%ebp
10005b67:	ff 63 18             	jmp    *0x18(%ebx)
10005b6a:	33 c0                	xor    %eax,%eax
10005b6c:	40                   	inc    %eax
10005b6d:	5b                   	pop    %ebx
10005b6e:	5d                   	pop    %ebp
10005b6f:	c3                   	ret
10005b70:	55                   	push   %ebp
10005b71:	8b ec                	mov    %esp,%ebp
10005b73:	51                   	push   %ecx
10005b74:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
10005b78:	53                   	push   %ebx
10005b79:	56                   	push   %esi
10005b7a:	57                   	push   %edi
10005b7b:	8b 7d 08             	mov    0x8(%ebp),%edi
10005b7e:	8b 77 0c             	mov    0xc(%edi),%esi
10005b81:	8b 5f 10             	mov    0x10(%edi),%ebx
10005b84:	8b c6                	mov    %esi,%eax
10005b86:	89 45 fc             	mov    %eax,-0x4(%ebp)
10005b89:	89 75 08             	mov    %esi,0x8(%ebp)
10005b8c:	7c 38                	jl     0x10005bc6
10005b8e:	83 fe ff             	cmp    $0xffffffff,%esi
10005b91:	75 05                	jne    0x10005b98
10005b93:	e8 a0 17 00 00       	call   0x10007338
10005b98:	8b 4d 10             	mov    0x10(%ebp),%ecx
10005b9b:	4e                   	dec    %esi
10005b9c:	8d 04 b6             	lea    (%esi,%esi,4),%eax
10005b9f:	8d 04 83             	lea    (%ebx,%eax,4),%eax
10005ba2:	39 48 04             	cmp    %ecx,0x4(%eax)
10005ba5:	7d 05                	jge    0x10005bac
10005ba7:	3b 48 08             	cmp    0x8(%eax),%ecx
10005baa:	7e 05                	jle    0x10005bb1
10005bac:	83 fe ff             	cmp    $0xffffffff,%esi
10005baf:	75 0c                	jne    0x10005bbd
10005bb1:	8b 45 08             	mov    0x8(%ebp),%eax
10005bb4:	ff 4d 0c             	decl   0xc(%ebp)
10005bb7:	89 45 fc             	mov    %eax,-0x4(%ebp)
10005bba:	89 75 08             	mov    %esi,0x8(%ebp)
10005bbd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
10005bc1:	7d cb                	jge    0x10005b8e
10005bc3:	8b 45 fc             	mov    -0x4(%ebp),%eax
10005bc6:	8b 4d 14             	mov    0x14(%ebp),%ecx
10005bc9:	46                   	inc    %esi
10005bca:	89 31                	mov    %esi,(%ecx)
10005bcc:	8b 4d 18             	mov    0x18(%ebp),%ecx
10005bcf:	89 01                	mov    %eax,(%ecx)
10005bd1:	3b 47 0c             	cmp    0xc(%edi),%eax
10005bd4:	77 04                	ja     0x10005bda
10005bd6:	3b f0                	cmp    %eax,%esi
10005bd8:	76 05                	jbe    0x10005bdf
10005bda:	e8 59 17 00 00       	call   0x10007338
10005bdf:	5f                   	pop    %edi
10005be0:	8d 04 b6             	lea    (%esi,%esi,4),%eax
10005be3:	5e                   	pop    %esi
10005be4:	8d 04 83             	lea    (%ebx,%eax,4),%eax
10005be7:	5b                   	pop    %ebx
10005be8:	c9                   	leave
10005be9:	c3                   	ret
10005bea:	8b 44 24 08          	mov    0x8(%esp),%eax
10005bee:	56                   	push   %esi
10005bef:	8b 74 24 08          	mov    0x8(%esp),%esi
10005bf3:	89 06                	mov    %eax,(%esi)
10005bf5:	e8 9c 17 00 00       	call   0x10007396
10005bfa:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
10005c00:	89 46 04             	mov    %eax,0x4(%esi)
10005c03:	e8 8e 17 00 00       	call   0x10007396
10005c08:	89 b0 84 00 00 00    	mov    %esi,0x84(%eax)
10005c0e:	8b c6                	mov    %esi,%eax
10005c10:	5e                   	pop    %esi
10005c11:	c3                   	ret
10005c12:	e8 7f 17 00 00       	call   0x10007396
10005c17:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
10005c1d:	eb 0b                	jmp    0x10005c2a
10005c1f:	8b 08                	mov    (%eax),%ecx
10005c21:	3b 4c 24 04          	cmp    0x4(%esp),%ecx
10005c25:	74 09                	je     0x10005c30
10005c27:	8b 40 04             	mov    0x4(%eax),%eax
10005c2a:	85 c0                	test   %eax,%eax
10005c2c:	75 f1                	jne    0x10005c1f
10005c2e:	40                   	inc    %eax
10005c2f:	c3                   	ret
10005c30:	33 c0                	xor    %eax,%eax
10005c32:	c3                   	ret
10005c33:	56                   	push   %esi
10005c34:	e8 5d 17 00 00       	call   0x10007396
10005c39:	8b 74 24 08          	mov    0x8(%esp),%esi
10005c3d:	3b b0 84 00 00 00    	cmp    0x84(%eax),%esi
10005c43:	75 10                	jne    0x10005c55
10005c45:	e8 4c 17 00 00       	call   0x10007396
10005c4a:	8b 4e 04             	mov    0x4(%esi),%ecx
10005c4d:	89 88 84 00 00 00    	mov    %ecx,0x84(%eax)
10005c53:	5e                   	pop    %esi
10005c54:	c3                   	ret
10005c55:	e8 3c 17 00 00       	call   0x10007396
10005c5a:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
10005c60:	eb 09                	jmp    0x10005c6b
10005c62:	8b 48 04             	mov    0x4(%eax),%ecx
10005c65:	3b f1                	cmp    %ecx,%esi
10005c67:	74 0e                	je     0x10005c77
10005c69:	8b c1                	mov    %ecx,%eax
10005c6b:	83 78 04 00          	cmpl   $0x0,0x4(%eax)
10005c6f:	75 f1                	jne    0x10005c62
10005c71:	5e                   	pop    %esi
10005c72:	e9 c1 16 00 00       	jmp    0x10007338
10005c77:	8b 4e 04             	mov    0x4(%esi),%ecx
10005c7a:	89 48 04             	mov    %ecx,0x4(%eax)
10005c7d:	5e                   	pop    %esi
10005c7e:	c3                   	ret
10005c7f:	55                   	push   %ebp
10005c80:	8b ec                	mov    %esp,%ebp
10005c82:	83 ec 14             	sub    $0x14,%esp
10005c85:	8b 45 0c             	mov    0xc(%ebp),%eax
10005c88:	83 65 ec 00          	andl   $0x0,-0x14(%ebp)
10005c8c:	8b 4d 08             	mov    0x8(%ebp),%ecx
10005c8f:	89 45 f4             	mov    %eax,-0xc(%ebp)
10005c92:	8b 45 14             	mov    0x14(%ebp),%eax
10005c95:	40                   	inc    %eax
10005c96:	c7 45 f0 db 5a 00 10 	movl   $0x10005adb,-0x10(%ebp)
10005c9d:	89 4d f8             	mov    %ecx,-0x8(%ebp)
10005ca0:	89 45 fc             	mov    %eax,-0x4(%ebp)
10005ca3:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10005ca9:	89 45 ec             	mov    %eax,-0x14(%ebp)
10005cac:	8d 45 ec             	lea    -0x14(%ebp),%eax
10005caf:	64 a3 00 00 00 00    	mov    %eax,%fs:0x0
10005cb5:	ff 75 18             	push   0x18(%ebp)
10005cb8:	51                   	push   %ecx
10005cb9:	ff 75 10             	push   0x10(%ebp)
10005cbc:	e8 2f 19 00 00       	call   0x100075f0
10005cc1:	8b c8                	mov    %eax,%ecx
10005cc3:	8b 45 ec             	mov    -0x14(%ebp),%eax
10005cc6:	64 a3 00 00 00 00    	mov    %eax,%fs:0x0
10005ccc:	8b c1                	mov    %ecx,%eax
10005cce:	c9                   	leave
10005ccf:	c3                   	ret
10005cd0:	55                   	push   %ebp
10005cd1:	8b ec                	mov    %esp,%ebp
10005cd3:	83 ec 34             	sub    $0x34,%esp
10005cd6:	53                   	push   %ebx
10005cd7:	83 65 d8 00          	andl   $0x0,-0x28(%ebp)
10005cdb:	c7 45 dc ff 5a 00 10 	movl   $0x10005aff,-0x24(%ebp)
10005ce2:	8b 45 18             	mov    0x18(%ebp),%eax
10005ce5:	89 45 e0             	mov    %eax,-0x20(%ebp)
10005ce8:	8b 45 0c             	mov    0xc(%ebp),%eax
10005ceb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
10005cee:	8b 45 1c             	mov    0x1c(%ebp),%eax
10005cf1:	89 45 e8             	mov    %eax,-0x18(%ebp)
10005cf4:	8b 45 20             	mov    0x20(%ebp),%eax
10005cf7:	89 45 ec             	mov    %eax,-0x14(%ebp)
10005cfa:	83 65 f0 00          	andl   $0x0,-0x10(%ebp)
10005cfe:	83 65 f4 00          	andl   $0x0,-0xc(%ebp)
10005d02:	83 65 f8 00          	andl   $0x0,-0x8(%ebp)
10005d06:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
10005d0a:	c7 45 f0 53 5d 00 10 	movl   $0x10005d53,-0x10(%ebp)
10005d11:	89 65 f4             	mov    %esp,-0xc(%ebp)
10005d14:	89 6d f8             	mov    %ebp,-0x8(%ebp)
10005d17:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10005d1d:	89 45 d8             	mov    %eax,-0x28(%ebp)
10005d20:	8d 45 d8             	lea    -0x28(%ebp),%eax
10005d23:	64 a3 00 00 00 00    	mov    %eax,%fs:0x0
10005d29:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
10005d30:	8b 45 08             	mov    0x8(%ebp),%eax
10005d33:	89 45 d0             	mov    %eax,-0x30(%ebp)
10005d36:	8b 45 10             	mov    0x10(%ebp),%eax
10005d39:	89 45 d4             	mov    %eax,-0x2c(%ebp)
10005d3c:	8d 45 d0             	lea    -0x30(%ebp),%eax
10005d3f:	50                   	push   %eax
10005d40:	8b 45 08             	mov    0x8(%ebp),%eax
10005d43:	ff 30                	push   (%eax)
10005d45:	e8 4c 16 00 00       	call   0x10007396
10005d4a:	ff 50 74             	call   *0x74(%eax)
10005d4d:	59                   	pop    %ecx
10005d4e:	59                   	pop    %ecx
10005d4f:	83 65 cc 00          	andl   $0x0,-0x34(%ebp)
10005d53:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
10005d57:	74 17                	je     0x10005d70
10005d59:	64 8b 1d 00 00 00 00 	mov    %fs:0x0,%ebx
10005d60:	8b 03                	mov    (%ebx),%eax
10005d62:	8b 5d d8             	mov    -0x28(%ebp),%ebx
10005d65:	89 03                	mov    %eax,(%ebx)
10005d67:	64 89 1d 00 00 00 00 	mov    %ebx,%fs:0x0
10005d6e:	eb 09                	jmp    0x10005d79
10005d70:	8b 45 d8             	mov    -0x28(%ebp),%eax
10005d73:	64 a3 00 00 00 00    	mov    %eax,%fs:0x0
10005d79:	8b 45 cc             	mov    -0x34(%ebp),%eax
10005d7c:	5b                   	pop    %ebx
10005d7d:	c9                   	leave
10005d7e:	c3                   	ret
10005d7f:	cc                   	int3
10005d80:	55                   	push   %ebp
10005d81:	8b ec                	mov    %esp,%ebp
10005d83:	53                   	push   %ebx
10005d84:	56                   	push   %esi
10005d85:	57                   	push   %edi
10005d86:	55                   	push   %ebp
10005d87:	6a 00                	push   $0x0
10005d89:	6a 00                	push   $0x0
10005d8b:	68 98 5d 00 10       	push   $0x10005d98
10005d90:	ff 75 08             	push   0x8(%ebp)
10005d93:	e8 66 53 00 00       	call   0x1000b0fe
10005d98:	5d                   	pop    %ebp
10005d99:	5f                   	pop    %edi
10005d9a:	5e                   	pop    %esi
10005d9b:	5b                   	pop    %ebx
10005d9c:	8b e5                	mov    %ebp,%esp
10005d9e:	5d                   	pop    %ebp
10005d9f:	c3                   	ret
10005da0:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10005da4:	f7 41 04 06 00 00 00 	testl  $0x6,0x4(%ecx)
10005dab:	b8 01 00 00 00       	mov    $0x1,%eax
10005db0:	74 0f                	je     0x10005dc1
10005db2:	8b 44 24 08          	mov    0x8(%esp),%eax
10005db6:	8b 54 24 10          	mov    0x10(%esp),%edx
10005dba:	89 02                	mov    %eax,(%edx)
10005dbc:	b8 03 00 00 00       	mov    $0x3,%eax
10005dc1:	c3                   	ret
10005dc2:	53                   	push   %ebx
10005dc3:	56                   	push   %esi
10005dc4:	57                   	push   %edi
10005dc5:	8b 44 24 10          	mov    0x10(%esp),%eax
10005dc9:	50                   	push   %eax
10005dca:	6a fe                	push   $0xfffffffe
10005dcc:	68 a0 5d 00 10       	push   $0x10005da0
10005dd1:	64 ff 35 00 00 00 00 	push   %fs:0x0
10005dd8:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
10005ddf:	8b 44 24 20          	mov    0x20(%esp),%eax
10005de3:	8b 58 08             	mov    0x8(%eax),%ebx
10005de6:	8b 70 0c             	mov    0xc(%eax),%esi
10005de9:	83 fe ff             	cmp    $0xffffffff,%esi
10005dec:	74 2e                	je     0x10005e1c
10005dee:	3b 74 24 24          	cmp    0x24(%esp),%esi
10005df2:	74 28                	je     0x10005e1c
10005df4:	8d 34 76             	lea    (%esi,%esi,2),%esi
10005df7:	8b 0c b3             	mov    (%ebx,%esi,4),%ecx
10005dfa:	89 4c 24 08          	mov    %ecx,0x8(%esp)
10005dfe:	89 48 0c             	mov    %ecx,0xc(%eax)
10005e01:	83 7c b3 04 00       	cmpl   $0x0,0x4(%ebx,%esi,4)
10005e06:	75 12                	jne    0x10005e1a
10005e08:	68 01 01 00 00       	push   $0x101
10005e0d:	8b 44 b3 08          	mov    0x8(%ebx,%esi,4),%eax
10005e11:	e8 40 00 00 00       	call   0x10005e56
10005e16:	ff 54 b3 08          	call   *0x8(%ebx,%esi,4)
10005e1a:	eb c3                	jmp    0x10005ddf
10005e1c:	64 8f 05 00 00 00 00 	pop    %fs:0x0
10005e23:	83 c4 0c             	add    $0xc,%esp
10005e26:	5f                   	pop    %edi
10005e27:	5e                   	pop    %esi
10005e28:	5b                   	pop    %ebx
10005e29:	c3                   	ret
10005e2a:	33 c0                	xor    %eax,%eax
10005e2c:	64 8b 0d 00 00 00 00 	mov    %fs:0x0,%ecx
10005e33:	81 79 04 a0 5d 00 10 	cmpl   $0x10005da0,0x4(%ecx)
10005e3a:	75 10                	jne    0x10005e4c
10005e3c:	8b 51 0c             	mov    0xc(%ecx),%edx
10005e3f:	8b 52 0c             	mov    0xc(%edx),%edx
10005e42:	39 51 08             	cmp    %edx,0x8(%ecx)
10005e45:	75 05                	jne    0x10005e4c
10005e47:	b8 01 00 00 00       	mov    $0x1,%eax
10005e4c:	c3                   	ret
10005e4d:	53                   	push   %ebx
10005e4e:	51                   	push   %ecx
10005e4f:	bb 04 f1 00 10       	mov    $0x1000f104,%ebx
10005e54:	eb 0a                	jmp    0x10005e60
10005e56:	53                   	push   %ebx
10005e57:	51                   	push   %ecx
10005e58:	bb 04 f1 00 10       	mov    $0x1000f104,%ebx
10005e5d:	8b 4d 08             	mov    0x8(%ebp),%ecx
10005e60:	89 4b 08             	mov    %ecx,0x8(%ebx)
10005e63:	89 43 04             	mov    %eax,0x4(%ebx)
10005e66:	89 6b 0c             	mov    %ebp,0xc(%ebx)
10005e69:	59                   	pop    %ecx
10005e6a:	5b                   	pop    %ebx
10005e6b:	c2 04 00             	ret    $0x4
10005e6e:	8b c1                	mov    %ecx,%eax
10005e70:	83 60 04 00          	andl   $0x0,0x4(%eax)
10005e74:	83 60 08 00          	andl   $0x0,0x8(%eax)
10005e78:	c7 00 38 c3 00 10    	movl   $0x1000c338,(%eax)
10005e7e:	c3                   	ret
10005e7f:	56                   	push   %esi
10005e80:	57                   	push   %edi
10005e81:	8b 7c 24 0c          	mov    0xc(%esp),%edi
10005e85:	8b f1                	mov    %ecx,%esi
10005e87:	c7 06 38 c3 00 10    	movl   $0x1000c338,(%esi)
10005e8d:	ff 37                	push   (%edi)
10005e8f:	e8 4c 06 00 00       	call   0x100064e0
10005e94:	40                   	inc    %eax
10005e95:	50                   	push   %eax
10005e96:	e8 17 06 00 00       	call   0x100064b2
10005e9b:	85 c0                	test   %eax,%eax
10005e9d:	59                   	pop    %ecx
10005e9e:	59                   	pop    %ecx
10005e9f:	89 46 04             	mov    %eax,0x4(%esi)
10005ea2:	74 0a                	je     0x10005eae
10005ea4:	ff 37                	push   (%edi)
10005ea6:	50                   	push   %eax
10005ea7:	e8 94 17 00 00       	call   0x10007640
10005eac:	59                   	pop    %ecx
10005ead:	59                   	pop    %ecx
10005eae:	5f                   	pop    %edi
10005eaf:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
10005eb6:	8b c6                	mov    %esi,%eax
10005eb8:	5e                   	pop    %esi
10005eb9:	c2 04 00             	ret    $0x4
10005ebc:	56                   	push   %esi
10005ebd:	8b f1                	mov    %ecx,%esi
10005ebf:	57                   	push   %edi
10005ec0:	8b 7c 24 0c          	mov    0xc(%esp),%edi
10005ec4:	c7 06 38 c3 00 10    	movl   $0x1000c338,(%esi)
10005eca:	8b 47 08             	mov    0x8(%edi),%eax
10005ecd:	85 c0                	test   %eax,%eax
10005ecf:	89 46 08             	mov    %eax,0x8(%esi)
10005ed2:	74 25                	je     0x10005ef9
10005ed4:	ff 77 04             	push   0x4(%edi)
10005ed7:	e8 04 06 00 00       	call   0x100064e0
10005edc:	40                   	inc    %eax
10005edd:	50                   	push   %eax
10005ede:	e8 cf 05 00 00       	call   0x100064b2
10005ee3:	85 c0                	test   %eax,%eax
10005ee5:	59                   	pop    %ecx
10005ee6:	59                   	pop    %ecx
10005ee7:	89 46 04             	mov    %eax,0x4(%esi)
10005eea:	74 13                	je     0x10005eff
10005eec:	ff 77 04             	push   0x4(%edi)
10005eef:	50                   	push   %eax
10005ef0:	e8 4b 17 00 00       	call   0x10007640
10005ef5:	59                   	pop    %ecx
10005ef6:	59                   	pop    %ecx
10005ef7:	eb 06                	jmp    0x10005eff
10005ef9:	8b 47 04             	mov    0x4(%edi),%eax
10005efc:	89 46 04             	mov    %eax,0x4(%esi)
10005eff:	5f                   	pop    %edi
10005f00:	8b c6                	mov    %esi,%eax
10005f02:	5e                   	pop    %esi
10005f03:	c2 04 00             	ret    $0x4
10005f06:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
10005f0a:	c7 01 38 c3 00 10    	movl   $0x1000c338,(%ecx)
10005f10:	74 09                	je     0x10005f1b
10005f12:	ff 71 04             	push   0x4(%ecx)
10005f15:	e8 a7 0a 00 00       	call   0x100069c1
10005f1a:	59                   	pop    %ecx
10005f1b:	c3                   	ret
10005f1c:	8b 41 04             	mov    0x4(%ecx),%eax
10005f1f:	85 c0                	test   %eax,%eax
10005f21:	75 05                	jne    0x10005f28
10005f23:	b8 40 c3 00 10       	mov    $0x1000c340,%eax  ; 0x1000c340='Unknown exception'
10005f28:	c3                   	ret
10005f29:	56                   	push   %esi
10005f2a:	8b f1                	mov    %ecx,%esi
10005f2c:	e8 d5 ff ff ff       	call   0x10005f06
10005f31:	f6 44 24 08 01       	testb  $0x1,0x8(%esp)
10005f36:	74 07                	je     0x10005f3f
10005f38:	56                   	push   %esi
10005f39:	e8 9f fa ff ff       	call   0x100059dd
10005f3e:	59                   	pop    %ecx
10005f3f:	8b c6                	mov    %esi,%eax
10005f41:	5e                   	pop    %esi
10005f42:	c2 04 00             	ret    $0x4
10005f45:	56                   	push   %esi
10005f46:	8b f1                	mov    %ecx,%esi
10005f48:	6a 0e                	push   $0xe
10005f4a:	c7 06 58 c3 00 10    	movl   $0x1000c358,(%esi)
10005f50:	e8 15 19 00 00       	call   0x1000786a
10005f55:	8b 76 04             	mov    0x4(%esi),%esi
10005f58:	85 f6                	test   %esi,%esi
10005f5a:	59                   	pop    %ecx
10005f5b:	74 07                	je     0x10005f64
10005f5d:	56                   	push   %esi
10005f5e:	e8 5e 0a 00 00       	call   0x100069c1
10005f63:	59                   	pop    %ecx
10005f64:	6a 0e                	push   $0xe
10005f66:	e8 6b 18 00 00       	call   0x100077d6
10005f6b:	59                   	pop    %ecx
10005f6c:	5e                   	pop    %esi
10005f6d:	c3                   	ret
10005f6e:	56                   	push   %esi
10005f6f:	8b f1                	mov    %ecx,%esi
10005f71:	e8 cf ff ff ff       	call   0x10005f45
10005f76:	f6 44 24 08 01       	testb  $0x1,0x8(%esp)
10005f7b:	74 07                	je     0x10005f84
10005f7d:	56                   	push   %esi
10005f7e:	e8 5a fa ff ff       	call   0x100059dd
10005f83:	59                   	pop    %ecx
10005f84:	8b c6                	mov    %esi,%eax
10005f86:	5e                   	pop    %esi
10005f87:	c2 04 00             	ret    $0x4
10005f8a:	e8 07 14 00 00       	call   0x10007396
10005f8f:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10005f93:	89 48 14             	mov    %ecx,0x14(%eax)
10005f96:	c3                   	ret
10005f97:	e8 fa 13 00 00       	call   0x10007396
10005f9c:	8b 48 14             	mov    0x14(%eax),%ecx
10005f9f:	69 c9 fd 43 03 00    	imul   $0x343fd,%ecx,%ecx
10005fa5:	81 c1 c3 9e 26 00    	add    $0x269ec3,%ecx
10005fab:	89 48 14             	mov    %ecx,0x14(%eax)
10005fae:	8b c1                	mov    %ecx,%eax
10005fb0:	c1 e8 10             	shr    $0x10,%eax
10005fb3:	25 ff 7f 00 00       	and    $0x7fff,%eax
10005fb8:	c3                   	ret
10005fb9:	55                   	push   %ebp
10005fba:	8b ec                	mov    %esp,%ebp
10005fbc:	51                   	push   %ecx
10005fbd:	51                   	push   %ecx
10005fbe:	8d 45 f8             	lea    -0x8(%ebp),%eax
10005fc1:	50                   	push   %eax
10005fc2:	ff 15 1c c0 00 10    	call   *0x1000c01c  ; 0x1000c01c=KERNEL32.dll!GetSystemTimeAsFileTime
10005fc8:	8b 45 f8             	mov    -0x8(%ebp),%eax
10005fcb:	8b 4d fc             	mov    -0x4(%ebp),%ecx
10005fce:	6a 00                	push   $0x0
10005fd0:	05 00 80 c1 2a       	add    $0x2ac18000,%eax
10005fd5:	68 80 96 98 00       	push   $0x989680
10005fda:	81 d1 21 4e 62 fe    	adc    $0xfe624e21,%ecx
10005fe0:	51                   	push   %ecx
10005fe1:	50                   	push   %eax
10005fe2:	e8 49 19 00 00       	call   0x10007930
10005fe7:	8b 4d 08             	mov    0x8(%ebp),%ecx
10005fea:	85 c9                	test   %ecx,%ecx
10005fec:	74 02                	je     0x10005ff0
10005fee:	89 01                	mov    %eax,(%ecx)
10005ff0:	c9                   	leave
10005ff1:	c3                   	ret
10005ff2:	cc                   	int3
10005ff3:	cc                   	int3
10005ff4:	cc                   	int3
10005ff5:	cc                   	int3
10005ff6:	cc                   	int3
10005ff7:	cc                   	int3
10005ff8:	cc                   	int3
10005ff9:	cc                   	int3
10005ffa:	cc                   	int3
10005ffb:	cc                   	int3
10005ffc:	cc                   	int3
10005ffd:	cc                   	int3
10005ffe:	cc                   	int3
10005fff:	cc                   	int3
10006000:	8b 44 24 0c          	mov    0xc(%esp),%eax
10006004:	53                   	push   %ebx
10006005:	85 c0                	test   %eax,%eax
10006007:	74 52                	je     0x1000605b
10006009:	8b 54 24 08          	mov    0x8(%esp),%edx
1000600d:	33 db                	xor    %ebx,%ebx
1000600f:	8a 5c 24 0c          	mov    0xc(%esp),%bl
10006013:	f7 c2 03 00 00 00    	test   $0x3,%edx
10006019:	74 16                	je     0x10006031
1000601b:	8a 0a                	mov    (%edx),%cl
1000601d:	83 c2 01             	add    $0x1,%edx
10006020:	32 cb                	xor    %bl,%cl
10006022:	74 72                	je     0x10006096
10006024:	83 e8 01             	sub    $0x1,%eax
10006027:	74 32                	je     0x1000605b
10006029:	f7 c2 03 00 00 00    	test   $0x3,%edx
1000602f:	75 ea                	jne    0x1000601b
10006031:	83 e8 04             	sub    $0x4,%eax
10006034:	72 12                	jb     0x10006048
10006036:	57                   	push   %edi
10006037:	8b fb                	mov    %ebx,%edi
10006039:	c1 e3 08             	shl    $0x8,%ebx
1000603c:	03 df                	add    %edi,%ebx
1000603e:	8b fb                	mov    %ebx,%edi
10006040:	c1 e3 10             	shl    $0x10,%ebx
10006043:	03 df                	add    %edi,%ebx
10006045:	eb 1b                	jmp    0x10006062
10006047:	5f                   	pop    %edi
10006048:	83 c0 04             	add    $0x4,%eax
1000604b:	74 0e                	je     0x1000605b
1000604d:	8a 0a                	mov    (%edx),%cl
1000604f:	83 c2 01             	add    $0x1,%edx
10006052:	32 cb                	xor    %bl,%cl
10006054:	74 40                	je     0x10006096
10006056:	83 e8 01             	sub    $0x1,%eax
10006059:	75 f2                	jne    0x1000604d
1000605b:	5b                   	pop    %ebx
1000605c:	c3                   	ret
1000605d:	83 e8 04             	sub    $0x4,%eax
10006060:	72 e5                	jb     0x10006047
10006062:	8b 0a                	mov    (%edx),%ecx
10006064:	33 cb                	xor    %ebx,%ecx
10006066:	bf ff fe fe 7e       	mov    $0x7efefeff,%edi
1000606b:	03 f9                	add    %ecx,%edi
1000606d:	83 f1 ff             	xor    $0xffffffff,%ecx
10006070:	33 cf                	xor    %edi,%ecx
10006072:	83 c2 04             	add    $0x4,%edx
10006075:	81 e1 00 01 01 81    	and    $0x81010100,%ecx
1000607b:	74 e0                	je     0x1000605d
1000607d:	8b 4a fc             	mov    -0x4(%edx),%ecx
10006080:	32 cb                	xor    %bl,%cl
10006082:	74 23                	je     0x100060a7
10006084:	32 eb                	xor    %bl,%ch
10006086:	74 19                	je     0x100060a1
10006088:	c1 e9 10             	shr    $0x10,%ecx
1000608b:	32 cb                	xor    %bl,%cl
1000608d:	74 0c                	je     0x1000609b
1000608f:	32 eb                	xor    %bl,%ch
10006091:	74 02                	je     0x10006095
10006093:	eb c8                	jmp    0x1000605d
10006095:	5f                   	pop    %edi
10006096:	8d 42 ff             	lea    -0x1(%edx),%eax
10006099:	5b                   	pop    %ebx
1000609a:	c3                   	ret
1000609b:	8d 42 fe             	lea    -0x2(%edx),%eax
1000609e:	5f                   	pop    %edi
1000609f:	5b                   	pop    %ebx
100060a0:	c3                   	ret
100060a1:	8d 42 fd             	lea    -0x3(%edx),%eax
100060a4:	5f                   	pop    %edi
100060a5:	5b                   	pop    %ebx
100060a6:	c3                   	ret
100060a7:	8d 42 fc             	lea    -0x4(%edx),%eax
100060aa:	5f                   	pop    %edi
100060ab:	5b                   	pop    %ebx
100060ac:	c3                   	ret
100060ad:	56                   	push   %esi
100060ae:	57                   	push   %edi
100060af:	e8 e2 12 00 00       	call   0x10007396
100060b4:	8b 78 64             	mov    0x64(%eax),%edi
100060b7:	3b 3d dc f2 00 10    	cmp    0x1000f2dc,%edi
100060bd:	74 07                	je     0x100060c6
100060bf:	e8 d7 1a 00 00       	call   0x10007b9b
100060c4:	8b f8                	mov    %eax,%edi
100060c6:	8b 74 24 0c          	mov    0xc(%esp),%esi
100060ca:	83 7f 28 01          	cmpl   $0x1,0x28(%edi)
100060ce:	0f b6 06             	movzbl (%esi),%eax
100060d1:	7e 0e                	jle    0x100060e1
100060d3:	6a 08                	push   $0x8
100060d5:	50                   	push   %eax
100060d6:	57                   	push   %edi
100060d7:	e8 bc 18 00 00       	call   0x10007998
100060dc:	83 c4 0c             	add    $0xc,%esp
100060df:	eb 0a                	jmp    0x100060eb
100060e1:	8b 4f 48             	mov    0x48(%edi),%ecx
100060e4:	0f b6 04 41          	movzbl (%ecx,%eax,2),%eax
100060e8:	83 e0 08             	and    $0x8,%eax
100060eb:	85 c0                	test   %eax,%eax
100060ed:	74 03                	je     0x100060f2
100060ef:	46                   	inc    %esi
100060f0:	eb d8                	jmp    0x100060ca
100060f2:	0f b6 0e             	movzbl (%esi),%ecx
100060f5:	46                   	inc    %esi
100060f6:	83 f9 2d             	cmp    $0x2d,%ecx
100060f9:	8b d1                	mov    %ecx,%edx
100060fb:	74 05                	je     0x10006102
100060fd:	83 f9 2b             	cmp    $0x2b,%ecx
10006100:	75 04                	jne    0x10006106
10006102:	0f b6 0e             	movzbl (%esi),%ecx
10006105:	46                   	inc    %esi
10006106:	33 c0                	xor    %eax,%eax
10006108:	83 f9 30             	cmp    $0x30,%ecx
1000610b:	7c 0a                	jl     0x10006117
1000610d:	83 f9 39             	cmp    $0x39,%ecx
10006110:	7f 05                	jg     0x10006117
10006112:	83 e9 30             	sub    $0x30,%ecx
10006115:	eb 03                	jmp    0x1000611a
10006117:	83 c9 ff             	or     $0xffffffff,%ecx
1000611a:	83 f9 ff             	cmp    $0xffffffff,%ecx
1000611d:	74 0c                	je     0x1000612b
1000611f:	8d 04 80             	lea    (%eax,%eax,4),%eax
10006122:	8d 04 41             	lea    (%ecx,%eax,2),%eax
10006125:	0f b6 0e             	movzbl (%esi),%ecx
10006128:	46                   	inc    %esi
10006129:	eb dd                	jmp    0x10006108
1000612b:	83 fa 2d             	cmp    $0x2d,%edx
1000612e:	5f                   	pop    %edi
1000612f:	5e                   	pop    %esi
10006130:	75 02                	jne    0x10006134
10006132:	f7 d8                	neg    %eax
10006134:	c3                   	ret
10006135:	e9 73 ff ff ff       	jmp    0x100060ad
1000613a:	6a 08                	push   $0x8
1000613c:	68 60 c3 00 10       	push   $0x1000c360
10006141:	e8 6e 1c 00 00       	call   0x10007db4
10006146:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
1000614a:	6a 00                	push   $0x0
1000614c:	6a 01                	push   $0x1
1000614e:	e8 17 1b 00 00       	call   0x10007c6a
10006153:	59                   	pop    %ecx
10006154:	59                   	pop    %ecx
10006155:	eb 07                	jmp    0x1000615e
10006157:	33 c0                	xor    %eax,%eax
10006159:	40                   	inc    %eax
1000615a:	c3                   	ret
1000615b:	8b 65 e8             	mov    -0x18(%ebp),%esp
1000615e:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
10006162:	6a 03                	push   $0x3
10006164:	ff 15 20 c0 00 10    	call   *0x1000c020  ; 0x1000c020=KERNEL32.dll!ExitProcess
1000616a:	cc                   	int3
1000616b:	3b 0d 30 f1 00 10    	cmp    0x1000f130,%ecx
10006171:	75 01                	jne    0x10006174
10006173:	c3                   	ret
10006174:	e9 c1 ff ff ff       	jmp    0x1000613a
10006179:	cc                   	int3
1000617a:	cc                   	int3
1000617b:	cc                   	int3
1000617c:	cc                   	int3
1000617d:	cc                   	int3
1000617e:	cc                   	int3
1000617f:	cc                   	int3
10006180:	3d 00 10 00 00       	cmp    $0x1000,%eax
10006185:	73 0e                	jae    0x10006195
10006187:	f7 d8                	neg    %eax
10006189:	03 c4                	add    %esp,%eax
1000618b:	83 c0 04             	add    $0x4,%eax
1000618e:	85 00                	test   %eax,(%eax)
10006190:	94                   	xchg   %eax,%esp
10006191:	8b 00                	mov    (%eax),%eax
10006193:	50                   	push   %eax
10006194:	c3                   	ret
10006195:	51                   	push   %ecx
10006196:	8d 4c 24 08          	lea    0x8(%esp),%ecx
1000619a:	81 e9 00 10 00 00    	sub    $0x1000,%ecx
100061a0:	2d 00 10 00 00       	sub    $0x1000,%eax
100061a5:	85 01                	test   %eax,(%ecx)
100061a7:	3d 00 10 00 00       	cmp    $0x1000,%eax
100061ac:	73 ec                	jae    0x1000619a
100061ae:	2b c8                	sub    %eax,%ecx
100061b0:	8b c4                	mov    %esp,%eax
100061b2:	85 01                	test   %eax,(%ecx)
100061b4:	8b e1                	mov    %ecx,%esp
100061b6:	8b 08                	mov    (%eax),%ecx
100061b8:	8b 40 04             	mov    0x4(%eax),%eax
100061bb:	50                   	push   %eax
100061bc:	c3                   	ret
100061bd:	55                   	push   %ebp
100061be:	8b ec                	mov    %esp,%ebp
100061c0:	8b 45 0c             	mov    0xc(%ebp),%eax
100061c3:	83 f8 01             	cmp    $0x1,%eax
100061c6:	56                   	push   %esi
100061c7:	0f 85 dd 00 00 00    	jne    0x100062aa
100061cd:	b8 94 00 00 00       	mov    $0x94,%eax
100061d2:	e8 a9 ff ff ff       	call   0x10006180
100061d7:	8b f4                	mov    %esp,%esi
100061d9:	56                   	push   %esi
100061da:	c7 06 94 00 00 00    	movl   $0x94,(%esi)
100061e0:	ff 15 30 c0 00 10    	call   *0x1000c030  ; 0x1000c030=KERNEL32.dll!GetVersionExA
100061e6:	85 c0                	test   %eax,%eax
100061e8:	0f 84 31 01 00 00    	je     0x1000631f
100061ee:	8b 4e 10             	mov    0x10(%esi),%ecx
100061f1:	89 0d a4 fd 00 10    	mov    %ecx,0x1000fda4
100061f7:	8b 46 04             	mov    0x4(%esi),%eax
100061fa:	a3 b0 fd 00 10       	mov    %eax,0x1000fdb0
100061ff:	8b 56 08             	mov    0x8(%esi),%edx
10006202:	89 15 b4 fd 00 10    	mov    %edx,0x1000fdb4
10006208:	8b 76 0c             	mov    0xc(%esi),%esi
1000620b:	81 e6 ff 7f 00 00    	and    $0x7fff,%esi
10006211:	83 f9 02             	cmp    $0x2,%ecx
10006214:	89 35 a8 fd 00 10    	mov    %esi,0x1000fda8
1000621a:	74 0c                	je     0x10006228
1000621c:	81 ce 00 80 00 00    	or     $0x8000,%esi
10006222:	89 35 a8 fd 00 10    	mov    %esi,0x1000fda8
10006228:	c1 e0 08             	shl    $0x8,%eax
1000622b:	03 c2                	add    %edx,%eax
1000622d:	6a 01                	push   $0x1
1000622f:	a3 ac fd 00 10       	mov    %eax,0x1000fdac
10006234:	e8 ff 24 00 00       	call   0x10008738
10006239:	85 c0                	test   %eax,%eax
1000623b:	59                   	pop    %ecx
1000623c:	0f 84 dd 00 00 00    	je     0x1000631f
10006242:	e8 2b 13 00 00       	call   0x10007572
10006247:	85 c0                	test   %eax,%eax
10006249:	75 0a                	jne    0x10006255
1000624b:	e8 39 25 00 00       	call   0x10008789
10006250:	e9 ca 00 00 00       	jmp    0x1000631f
10006255:	e8 3c 24 00 00       	call   0x10008696
1000625a:	ff 15 2c c0 00 10    	call   *0x1000c02c  ; 0x1000c02c=KERNEL32.dll!GetCommandLineA
10006260:	a3 14 04 01 10       	mov    %eax,0x10010414
10006265:	e8 0a 23 00 00       	call   0x10008574
1000626a:	a3 24 fc 00 10       	mov    %eax,0x1000fc24
1000626f:	e8 e1 1d 00 00       	call   0x10008055
10006274:	85 c0                	test   %eax,%eax
10006276:	7c 2b                	jl     0x100062a3
10006278:	e8 55 22 00 00       	call   0x100084d2
1000627d:	85 c0                	test   %eax,%eax
1000627f:	7c 1d                	jl     0x1000629e
10006281:	e8 19 20 00 00       	call   0x1000829f
10006286:	85 c0                	test   %eax,%eax
10006288:	7c 14                	jl     0x1000629e
1000628a:	e8 b3 1b 00 00       	call   0x10007e42
1000628f:	85 c0                	test   %eax,%eax
10006291:	75 0b                	jne    0x1000629e
10006293:	ff 05 20 fc 00 10    	incl   0x1000fc20
10006299:	e9 92 00 00 00       	jmp    0x10006330
1000629e:	e8 b0 1f 00 00       	call   0x10008253
100062a3:	e8 bd 10 00 00       	call   0x10007365
100062a8:	eb a1                	jmp    0x1000624b
100062aa:	85 c0                	test   %eax,%eax
100062ac:	75 2c                	jne    0x100062da
100062ae:	39 05 20 fc 00 10    	cmp    %eax,0x1000fc20
100062b4:	7e 69                	jle    0x1000631f
100062b6:	ff 0d 20 fc 00 10    	decl   0x1000fc20
100062bc:	39 05 e0 fd 00 10    	cmp    %eax,0x1000fde0
100062c2:	75 05                	jne    0x100062c9
100062c4:	e8 c2 1c 00 00       	call   0x10007f8b
100062c9:	e8 85 1f 00 00       	call   0x10008253
100062ce:	e8 92 10 00 00       	call   0x10007365
100062d3:	e8 b1 24 00 00       	call   0x10008789
100062d8:	eb 56                	jmp    0x10006330
100062da:	83 f8 02             	cmp    $0x2,%eax
100062dd:	75 44                	jne    0x10006323
100062df:	68 88 00 00 00       	push   $0x88
100062e4:	6a 01                	push   $0x1
100062e6:	e8 af 1c 00 00       	call   0x10007f9a
100062eb:	8b f0                	mov    %eax,%esi
100062ed:	85 f6                	test   %esi,%esi
100062ef:	59                   	pop    %ecx
100062f0:	59                   	pop    %ecx
100062f1:	74 2c                	je     0x1000631f
100062f3:	56                   	push   %esi
100062f4:	ff 35 58 f1 00 10    	push   0x1000f158
100062fa:	ff 15 28 c0 00 10    	call   *0x1000c028  ; 0x1000c028=KERNEL32.dll!TlsSetValue
10006300:	85 c0                	test   %eax,%eax
10006302:	56                   	push   %esi
10006303:	74 14                	je     0x10006319
10006305:	e8 79 10 00 00       	call   0x10007383
1000630a:	59                   	pop    %ecx
1000630b:	ff 15 24 c0 00 10    	call   *0x1000c024  ; 0x1000c024=KERNEL32.dll!GetCurrentThreadId
10006311:	83 4e 04 ff          	orl    $0xffffffff,0x4(%esi)
10006315:	89 06                	mov    %eax,(%esi)
10006317:	eb 17                	jmp    0x10006330
10006319:	e8 a3 06 00 00       	call   0x100069c1
1000631e:	59                   	pop    %ecx
1000631f:	33 c0                	xor    %eax,%eax
10006321:	eb 10                	jmp    0x10006333
10006323:	83 f8 03             	cmp    $0x3,%eax
10006326:	75 08                	jne    0x10006330
10006328:	6a 00                	push   $0x0
1000632a:	e8 d8 10 00 00       	call   0x10007407
1000632f:	59                   	pop    %ecx
10006330:	33 c0                	xor    %eax,%eax
10006332:	40                   	inc    %eax
10006333:	8d 65 fc             	lea    -0x4(%ebp),%esp
10006336:	5e                   	pop    %esi
10006337:	5d                   	pop    %ebp
10006338:	c2 0c 00             	ret    $0xc
1000633b:	55                   	push   %ebp
1000633c:	8b ec                	mov    %esp,%ebp
1000633e:	53                   	push   %ebx
1000633f:	8b 5d 08             	mov    0x8(%ebp),%ebx
10006342:	56                   	push   %esi
10006343:	8b 75 0c             	mov    0xc(%ebp),%esi
10006346:	85 f6                	test   %esi,%esi
10006348:	57                   	push   %edi
10006349:	8b 7d 10             	mov    0x10(%ebp),%edi
1000634c:	75 09                	jne    0x10006357
1000634e:	83 3d 20 fc 00 10 00 	cmpl   $0x0,0x1000fc20
10006355:	eb 26                	jmp    0x1000637d
10006357:	83 fe 01             	cmp    $0x1,%esi
1000635a:	74 05                	je     0x10006361
1000635c:	83 fe 02             	cmp    $0x2,%esi
1000635f:	75 22                	jne    0x10006383
10006361:	a1 18 04 01 10       	mov    0x10010418,%eax
10006366:	85 c0                	test   %eax,%eax
10006368:	74 09                	je     0x10006373
1000636a:	57                   	push   %edi
1000636b:	56                   	push   %esi
1000636c:	53                   	push   %ebx
1000636d:	ff d0                	call   *%eax
1000636f:	85 c0                	test   %eax,%eax
10006371:	74 0c                	je     0x1000637f
10006373:	57                   	push   %edi
10006374:	56                   	push   %esi
10006375:	53                   	push   %ebx
10006376:	e8 42 fe ff ff       	call   0x100061bd
1000637b:	85 c0                	test   %eax,%eax
1000637d:	75 04                	jne    0x10006383
1000637f:	33 c0                	xor    %eax,%eax
10006381:	eb 4e                	jmp    0x100063d1
10006383:	57                   	push   %edi
10006384:	56                   	push   %esi
10006385:	53                   	push   %ebx
10006386:	e8 85 ee ff ff       	call   0x10005210
1000638b:	83 fe 01             	cmp    $0x1,%esi
1000638e:	89 45 0c             	mov    %eax,0xc(%ebp)
10006391:	75 0c                	jne    0x1000639f
10006393:	85 c0                	test   %eax,%eax
10006395:	75 37                	jne    0x100063ce
10006397:	57                   	push   %edi
10006398:	50                   	push   %eax
10006399:	53                   	push   %ebx
1000639a:	e8 1e fe ff ff       	call   0x100061bd
1000639f:	85 f6                	test   %esi,%esi
100063a1:	74 05                	je     0x100063a8
100063a3:	83 fe 03             	cmp    $0x3,%esi
100063a6:	75 26                	jne    0x100063ce
100063a8:	57                   	push   %edi
100063a9:	56                   	push   %esi
100063aa:	53                   	push   %ebx
100063ab:	e8 0d fe ff ff       	call   0x100061bd
100063b0:	85 c0                	test   %eax,%eax
100063b2:	75 03                	jne    0x100063b7
100063b4:	21 45 0c             	and    %eax,0xc(%ebp)
100063b7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
100063bb:	74 11                	je     0x100063ce
100063bd:	a1 18 04 01 10       	mov    0x10010418,%eax
100063c2:	85 c0                	test   %eax,%eax
100063c4:	74 08                	je     0x100063ce
100063c6:	57                   	push   %edi
100063c7:	56                   	push   %esi
100063c8:	53                   	push   %ebx
100063c9:	ff d0                	call   *%eax
100063cb:	89 45 0c             	mov    %eax,0xc(%ebp)
100063ce:	8b 45 0c             	mov    0xc(%ebp),%eax
100063d1:	5f                   	pop    %edi
100063d2:	5e                   	pop    %esi
100063d3:	5b                   	pop    %ebx
100063d4:	5d                   	pop    %ebp
100063d5:	c2 0c 00             	ret    $0xc
100063d8:	a1 2c fc 00 10       	mov    0x1000fc2c,%eax
100063dd:	83 f8 01             	cmp    $0x1,%eax
100063e0:	74 0d                	je     0x100063ef
100063e2:	85 c0                	test   %eax,%eax
100063e4:	75 0e                	jne    0x100063f4
100063e6:	83 3d 30 fc 00 10 01 	cmpl   $0x1,0x1000fc30
100063ed:	75 05                	jne    0x100063f4
100063ef:	e8 8b 25 00 00       	call   0x1000897f
100063f4:	ff 74 24 04          	push   0x4(%esp)
100063f8:	e8 0b 24 00 00       	call   0x10008808
100063fd:	68 ff 00 00 00       	push   $0xff
10006402:	ff 15 40 f1 00 10    	call   *0x1000f140
10006408:	59                   	pop    %ecx
10006409:	59                   	pop    %ecx
1000640a:	c3                   	ret
1000640b:	6a 0c                	push   $0xc
1000640d:	68 70 c3 00 10       	push   $0x1000c370
10006412:	e8 9d 19 00 00       	call   0x10007db4
10006417:	8b 75 08             	mov    0x8(%ebp),%esi
1000641a:	83 3d e0 02 01 10 03 	cmpl   $0x3,0x100102e0
10006421:	75 2e                	jne    0x10006451
10006423:	3b 35 cc 02 01 10    	cmp    0x100102cc,%esi
10006429:	77 26                	ja     0x10006451
1000642b:	6a 04                	push   $0x4
1000642d:	e8 38 14 00 00       	call   0x1000786a
10006432:	59                   	pop    %ecx
10006433:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
10006437:	56                   	push   %esi
10006438:	e8 a2 2d 00 00       	call   0x100091df
1000643d:	59                   	pop    %ecx
1000643e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
10006441:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
10006445:	e8 33 00 00 00       	call   0x1000647d
1000644a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
1000644d:	85 c0                	test   %eax,%eax
1000644f:	75 23                	jne    0x10006474
10006451:	85 f6                	test   %esi,%esi
10006453:	75 01                	jne    0x10006456
10006455:	46                   	inc    %esi
10006456:	83 3d e0 02 01 10 01 	cmpl   $0x1,0x100102e0
1000645d:	74 06                	je     0x10006465
1000645f:	83 c6 0f             	add    $0xf,%esi
10006462:	83 e6 f0             	and    $0xfffffff0,%esi
10006465:	56                   	push   %esi
10006466:	6a 00                	push   $0x0
10006468:	ff 35 dc 02 01 10    	push   0x100102dc
1000646e:	ff 15 34 c0 00 10    	call   *0x1000c034  ; 0x1000c034=KERNEL32.dll!HeapAlloc
10006474:	e8 76 19 00 00       	call   0x10007def
10006479:	c3                   	ret
1000647a:	8b 75 08             	mov    0x8(%ebp),%esi
1000647d:	6a 04                	push   $0x4
1000647f:	e8 52 13 00 00       	call   0x100077d6
10006484:	59                   	pop    %ecx
10006485:	c3                   	ret
10006486:	83 7c 24 04 e0       	cmpl   $0xffffffe0,0x4(%esp)
1000648b:	77 22                	ja     0x100064af
1000648d:	ff 74 24 04          	push   0x4(%esp)
10006491:	e8 75 ff ff ff       	call   0x1000640b
10006496:	85 c0                	test   %eax,%eax
10006498:	59                   	pop    %ecx
10006499:	75 16                	jne    0x100064b1
1000649b:	39 44 24 08          	cmp    %eax,0x8(%esp)
1000649f:	74 10                	je     0x100064b1
100064a1:	ff 74 24 04          	push   0x4(%esp)
100064a5:	e8 1a 00 00 00       	call   0x100064c4
100064aa:	85 c0                	test   %eax,%eax
100064ac:	59                   	pop    %ecx
100064ad:	75 de                	jne    0x1000648d
100064af:	33 c0                	xor    %eax,%eax
100064b1:	c3                   	ret
100064b2:	ff 35 f8 fe 00 10    	push   0x1000fef8
100064b8:	ff 74 24 08          	push   0x8(%esp)
100064bc:	e8 c5 ff ff ff       	call   0x10006486
100064c1:	59                   	pop    %ecx
100064c2:	59                   	pop    %ecx
100064c3:	c3                   	ret
100064c4:	a1 34 fc 00 10       	mov    0x1000fc34,%eax
100064c9:	85 c0                	test   %eax,%eax
100064cb:	74 0f                	je     0x100064dc
100064cd:	ff 74 24 04          	push   0x4(%esp)
100064d1:	ff d0                	call   *%eax
100064d3:	85 c0                	test   %eax,%eax
100064d5:	59                   	pop    %ecx
100064d6:	74 04                	je     0x100064dc
100064d8:	33 c0                	xor    %eax,%eax
100064da:	40                   	inc    %eax
100064db:	c3                   	ret
100064dc:	33 c0                	xor    %eax,%eax
100064de:	c3                   	ret
100064df:	cc                   	int3
100064e0:	8b 4c 24 04          	mov    0x4(%esp),%ecx
100064e4:	f7 c1 03 00 00 00    	test   $0x3,%ecx
100064ea:	74 24                	je     0x10006510
100064ec:	8a 01                	mov    (%ecx),%al
100064ee:	83 c1 01             	add    $0x1,%ecx
100064f1:	84 c0                	test   %al,%al
100064f3:	74 4e                	je     0x10006543
100064f5:	f7 c1 03 00 00 00    	test   $0x3,%ecx
100064fb:	75 ef                	jne    0x100064ec
100064fd:	05 00 00 00 00       	add    $0x0,%eax
10006502:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
10006509:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
10006510:	8b 01                	mov    (%ecx),%eax
10006512:	ba ff fe fe 7e       	mov    $0x7efefeff,%edx
10006517:	03 d0                	add    %eax,%edx
10006519:	83 f0 ff             	xor    $0xffffffff,%eax
1000651c:	33 c2                	xor    %edx,%eax
1000651e:	83 c1 04             	add    $0x4,%ecx
10006521:	a9 00 01 01 81       	test   $0x81010100,%eax
10006526:	74 e8                	je     0x10006510
10006528:	8b 41 fc             	mov    -0x4(%ecx),%eax
1000652b:	84 c0                	test   %al,%al
1000652d:	74 32                	je     0x10006561
1000652f:	84 e4                	test   %ah,%ah
10006531:	74 24                	je     0x10006557
10006533:	a9 00 00 ff 00       	test   $0xff0000,%eax
10006538:	74 13                	je     0x1000654d
1000653a:	a9 00 00 00 ff       	test   $0xff000000,%eax
1000653f:	74 02                	je     0x10006543
10006541:	eb cd                	jmp    0x10006510
10006543:	8d 41 ff             	lea    -0x1(%ecx),%eax
10006546:	8b 4c 24 04          	mov    0x4(%esp),%ecx
1000654a:	2b c1                	sub    %ecx,%eax
1000654c:	c3                   	ret
1000654d:	8d 41 fe             	lea    -0x2(%ecx),%eax
10006550:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10006554:	2b c1                	sub    %ecx,%eax
10006556:	c3                   	ret
10006557:	8d 41 fd             	lea    -0x3(%ecx),%eax
1000655a:	8b 4c 24 04          	mov    0x4(%esp),%ecx
1000655e:	2b c1                	sub    %ecx,%eax
10006560:	c3                   	ret
10006561:	8d 41 fc             	lea    -0x4(%ecx),%eax
10006564:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10006568:	2b c1                	sub    %ecx,%eax
1000656a:	c3                   	ret
1000656b:	cc                   	int3
1000656c:	cc                   	int3
1000656d:	cc                   	int3
1000656e:	cc                   	int3
1000656f:	cc                   	int3
10006570:	55                   	push   %ebp
10006571:	8b ec                	mov    %esp,%ebp
10006573:	57                   	push   %edi
10006574:	56                   	push   %esi
10006575:	8b 75 0c             	mov    0xc(%ebp),%esi
10006578:	8b 4d 10             	mov    0x10(%ebp),%ecx
1000657b:	8b 7d 08             	mov    0x8(%ebp),%edi
1000657e:	8b c1                	mov    %ecx,%eax
10006580:	8b d1                	mov    %ecx,%edx
10006582:	03 c6                	add    %esi,%eax
10006584:	3b fe                	cmp    %esi,%edi
10006586:	76 08                	jbe    0x10006590
10006588:	3b f8                	cmp    %eax,%edi
1000658a:	0f 82 7c 01 00 00    	jb     0x1000670c
10006590:	f7 c7 03 00 00 00    	test   $0x3,%edi
10006596:	75 14                	jne    0x100065ac
10006598:	c1 e9 02             	shr    $0x2,%ecx
1000659b:	83 e2 03             	and    $0x3,%edx
1000659e:	83 f9 08             	cmp    $0x8,%ecx
100065a1:	72 29                	jb     0x100065cc
100065a3:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
100065a5:	ff 24 95 bc 66 00 10 	jmp    *0x100066bc(,%edx,4)
100065ac:	8b c7                	mov    %edi,%eax
100065ae:	ba 03 00 00 00       	mov    $0x3,%edx
100065b3:	83 e9 04             	sub    $0x4,%ecx
100065b6:	72 0c                	jb     0x100065c4
100065b8:	83 e0 03             	and    $0x3,%eax
100065bb:	03 c8                	add    %eax,%ecx
100065bd:	ff 24 85 d0 65 00 10 	jmp    *0x100065d0(,%eax,4)
100065c4:	ff 24 8d cc 66 00 10 	jmp    *0x100066cc(,%ecx,4)
100065cb:	90                   	nop
100065cc:	ff 24 8d 50 66 00 10 	jmp    *0x10006650(,%ecx,4)
100065d3:	90                   	nop
100065d4:	e0 65                	loopne 0x1000663b
100065d6:	00 10                	add    %dl,(%eax)
100065d8:	0c 66                	or     $0x66,%al
100065da:	00 10                	add    %dl,(%eax)
100065dc:	30 66 00             	xor    %ah,0x0(%esi)
100065df:	10 23                	adc    %ah,(%ebx)
100065e1:	d1 8a 06 88 07 8a    	rorl   $1,-0x75f877fa(%edx)
100065e7:	46                   	inc    %esi
100065e8:	01 88 47 01 8a 46    	add    %ecx,0x468a0147(%eax)
100065ee:	02 c1                	add    %cl,%al
100065f0:	e9 02 88 47 02       	jmp    0x1247edf7
100065f5:	83 c6 03             	add    $0x3,%esi
100065f8:	83 c7 03             	add    $0x3,%edi
100065fb:	83 f9 08             	cmp    $0x8,%ecx
100065fe:	72 cc                	jb     0x100065cc
10006600:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
10006602:	ff 24 95 bc 66 00 10 	jmp    *0x100066bc(,%edx,4)
10006609:	8d 49 00             	lea    0x0(%ecx),%ecx
1000660c:	23 d1                	and    %ecx,%edx
1000660e:	8a 06                	mov    (%esi),%al
10006610:	88 07                	mov    %al,(%edi)
10006612:	8a 46 01             	mov    0x1(%esi),%al
10006615:	c1 e9 02             	shr    $0x2,%ecx
10006618:	88 47 01             	mov    %al,0x1(%edi)
1000661b:	83 c6 02             	add    $0x2,%esi
1000661e:	83 c7 02             	add    $0x2,%edi
10006621:	83 f9 08             	cmp    $0x8,%ecx
10006624:	72 a6                	jb     0x100065cc
10006626:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
10006628:	ff 24 95 bc 66 00 10 	jmp    *0x100066bc(,%edx,4)
1000662f:	90                   	nop
10006630:	23 d1                	and    %ecx,%edx
10006632:	8a 06                	mov    (%esi),%al
10006634:	88 07                	mov    %al,(%edi)
10006636:	83 c6 01             	add    $0x1,%esi
10006639:	c1 e9 02             	shr    $0x2,%ecx
1000663c:	83 c7 01             	add    $0x1,%edi
1000663f:	83 f9 08             	cmp    $0x8,%ecx
10006642:	72 88                	jb     0x100065cc
10006644:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
10006646:	ff 24 95 bc 66 00 10 	jmp    *0x100066bc(,%edx,4)
1000664d:	8d 49 00             	lea    0x0(%ecx),%ecx
10006650:	b3 66                	mov    $0x66,%bl
10006652:	00 10                	add    %dl,(%eax)
10006654:	a0 66 00 10 98       	mov    0x98100066,%al
10006659:	66 00 10             	data16 add %dl,(%eax)
1000665c:	90                   	nop
1000665d:	66 00 10             	data16 add %dl,(%eax)
10006660:	88 66 00             	mov    %ah,0x0(%esi)
10006663:	10 80 66 00 10 78    	adc    %al,0x78100066(%eax)
10006669:	66 00 10             	data16 add %dl,(%eax)
1000666c:	70 66                	jo     0x100066d4
1000666e:	00 10                	add    %dl,(%eax)
10006670:	8b 44 8e e4          	mov    -0x1c(%esi,%ecx,4),%eax
10006674:	89 44 8f e4          	mov    %eax,-0x1c(%edi,%ecx,4)
10006678:	8b 44 8e e8          	mov    -0x18(%esi,%ecx,4),%eax
1000667c:	89 44 8f e8          	mov    %eax,-0x18(%edi,%ecx,4)
10006680:	8b 44 8e ec          	mov    -0x14(%esi,%ecx,4),%eax
10006684:	89 44 8f ec          	mov    %eax,-0x14(%edi,%ecx,4)
10006688:	8b 44 8e f0          	mov    -0x10(%esi,%ecx,4),%eax
1000668c:	89 44 8f f0          	mov    %eax,-0x10(%edi,%ecx,4)
10006690:	8b 44 8e f4          	mov    -0xc(%esi,%ecx,4),%eax
10006694:	89 44 8f f4          	mov    %eax,-0xc(%edi,%ecx,4)
10006698:	8b 44 8e f8          	mov    -0x8(%esi,%ecx,4),%eax
1000669c:	89 44 8f f8          	mov    %eax,-0x8(%edi,%ecx,4)
100066a0:	8b 44 8e fc          	mov    -0x4(%esi,%ecx,4),%eax
100066a4:	89 44 8f fc          	mov    %eax,-0x4(%edi,%ecx,4)
100066a8:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
100066af:	03 f0                	add    %eax,%esi
100066b1:	03 f8                	add    %eax,%edi
100066b3:	ff 24 95 bc 66 00 10 	jmp    *0x100066bc(,%edx,4)
100066ba:	8b ff                	mov    %edi,%edi
100066bc:	cc                   	int3
100066bd:	66 00 10             	data16 add %dl,(%eax)
100066c0:	d4 66                	aam    $0x66
100066c2:	00 10                	add    %dl,(%eax)
100066c4:	e0 66                	loopne 0x1000672c
100066c6:	00 10                	add    %dl,(%eax)
100066c8:	f4                   	hlt
100066c9:	66 00 10             	data16 add %dl,(%eax)
100066cc:	8b 45 08             	mov    0x8(%ebp),%eax
100066cf:	5e                   	pop    %esi
100066d0:	5f                   	pop    %edi
100066d1:	c9                   	leave
100066d2:	c3                   	ret
100066d3:	90                   	nop
100066d4:	8a 06                	mov    (%esi),%al
100066d6:	88 07                	mov    %al,(%edi)
100066d8:	8b 45 08             	mov    0x8(%ebp),%eax
100066db:	5e                   	pop    %esi
100066dc:	5f                   	pop    %edi
100066dd:	c9                   	leave
100066de:	c3                   	ret
100066df:	90                   	nop
100066e0:	8a 06                	mov    (%esi),%al
100066e2:	88 07                	mov    %al,(%edi)
100066e4:	8a 46 01             	mov    0x1(%esi),%al
100066e7:	88 47 01             	mov    %al,0x1(%edi)
100066ea:	8b 45 08             	mov    0x8(%ebp),%eax
100066ed:	5e                   	pop    %esi
100066ee:	5f                   	pop    %edi
100066ef:	c9                   	leave
100066f0:	c3                   	ret
100066f1:	8d 49 00             	lea    0x0(%ecx),%ecx
100066f4:	8a 06                	mov    (%esi),%al
100066f6:	88 07                	mov    %al,(%edi)
100066f8:	8a 46 01             	mov    0x1(%esi),%al
100066fb:	88 47 01             	mov    %al,0x1(%edi)
100066fe:	8a 46 02             	mov    0x2(%esi),%al
10006701:	88 47 02             	mov    %al,0x2(%edi)
10006704:	8b 45 08             	mov    0x8(%ebp),%eax
10006707:	5e                   	pop    %esi
10006708:	5f                   	pop    %edi
10006709:	c9                   	leave
1000670a:	c3                   	ret
1000670b:	90                   	nop
1000670c:	8d 74 31 fc          	lea    -0x4(%ecx,%esi,1),%esi
10006710:	8d 7c 39 fc          	lea    -0x4(%ecx,%edi,1),%edi
10006714:	f7 c7 03 00 00 00    	test   $0x3,%edi
1000671a:	75 24                	jne    0x10006740
1000671c:	c1 e9 02             	shr    $0x2,%ecx
1000671f:	83 e2 03             	and    $0x3,%edx
10006722:	83 f9 08             	cmp    $0x8,%ecx
10006725:	72 0d                	jb     0x10006734
10006727:	fd                   	std
10006728:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
1000672a:	fc                   	cld
1000672b:	ff 24 95 58 68 00 10 	jmp    *0x10006858(,%edx,4)
10006732:	8b ff                	mov    %edi,%edi
10006734:	f7 d9                	neg    %ecx
10006736:	ff 24 8d 08 68 00 10 	jmp    *0x10006808(,%ecx,4)
1000673d:	8d 49 00             	lea    0x0(%ecx),%ecx
10006740:	8b c7                	mov    %edi,%eax
10006742:	ba 03 00 00 00       	mov    $0x3,%edx
10006747:	83 f9 04             	cmp    $0x4,%ecx
1000674a:	72 0c                	jb     0x10006758
1000674c:	83 e0 03             	and    $0x3,%eax
1000674f:	2b c8                	sub    %eax,%ecx
10006751:	ff 24 85 5c 67 00 10 	jmp    *0x1000675c(,%eax,4)
10006758:	ff 24 8d 58 68 00 10 	jmp    *0x10006858(,%ecx,4)
1000675f:	90                   	nop
10006760:	6c                   	insb   (%dx),%es:(%edi)
10006761:	67 00 10             	add    %dl,(%bx,%si)
10006764:	90                   	nop
10006765:	67 00 10             	add    %dl,(%bx,%si)
10006768:	b8 67 00 10 8a       	mov    $0x8a100067,%eax
1000676d:	46                   	inc    %esi
1000676e:	03 23                	add    (%ebx),%esp
10006770:	d1 88 47 03 83 ee    	rorl   $1,-0x117cfcb9(%eax)
10006776:	01 c1                	add    %eax,%ecx
10006778:	e9 02 83 ef 01       	jmp    0x11efea7f
1000677d:	83 f9 08             	cmp    $0x8,%ecx
10006780:	72 b2                	jb     0x10006734
10006782:	fd                   	std
10006783:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
10006785:	fc                   	cld
10006786:	ff 24 95 58 68 00 10 	jmp    *0x10006858(,%edx,4)
1000678d:	8d 49 00             	lea    0x0(%ecx),%ecx
10006790:	8a 46 03             	mov    0x3(%esi),%al
10006793:	23 d1                	and    %ecx,%edx
10006795:	88 47 03             	mov    %al,0x3(%edi)
10006798:	8a 46 02             	mov    0x2(%esi),%al
1000679b:	c1 e9 02             	shr    $0x2,%ecx
1000679e:	88 47 02             	mov    %al,0x2(%edi)
100067a1:	83 ee 02             	sub    $0x2,%esi
100067a4:	83 ef 02             	sub    $0x2,%edi
100067a7:	83 f9 08             	cmp    $0x8,%ecx
100067aa:	72 88                	jb     0x10006734
100067ac:	fd                   	std
100067ad:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
100067af:	fc                   	cld
100067b0:	ff 24 95 58 68 00 10 	jmp    *0x10006858(,%edx,4)
100067b7:	90                   	nop
100067b8:	8a 46 03             	mov    0x3(%esi),%al
100067bb:	23 d1                	and    %ecx,%edx
100067bd:	88 47 03             	mov    %al,0x3(%edi)
100067c0:	8a 46 02             	mov    0x2(%esi),%al
100067c3:	88 47 02             	mov    %al,0x2(%edi)
100067c6:	8a 46 01             	mov    0x1(%esi),%al
100067c9:	c1 e9 02             	shr    $0x2,%ecx
100067cc:	88 47 01             	mov    %al,0x1(%edi)
100067cf:	83 ee 03             	sub    $0x3,%esi
100067d2:	83 ef 03             	sub    $0x3,%edi
100067d5:	83 f9 08             	cmp    $0x8,%ecx
100067d8:	0f 82 56 ff ff ff    	jb     0x10006734
100067de:	fd                   	std
100067df:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
100067e1:	fc                   	cld
100067e2:	ff 24 95 58 68 00 10 	jmp    *0x10006858(,%edx,4)
100067e9:	8d 49 00             	lea    0x0(%ecx),%ecx
100067ec:	0c 68                	or     $0x68,%al
100067ee:	00 10                	add    %dl,(%eax)
100067f0:	14 68                	adc    $0x68,%al
100067f2:	00 10                	add    %dl,(%eax)
100067f4:	1c 68                	sbb    $0x68,%al
100067f6:	00 10                	add    %dl,(%eax)
100067f8:	24 68                	and    $0x68,%al
100067fa:	00 10                	add    %dl,(%eax)
100067fc:	2c 68                	sub    $0x68,%al
100067fe:	00 10                	add    %dl,(%eax)
10006800:	34 68                	xor    $0x68,%al
10006802:	00 10                	add    %dl,(%eax)
10006804:	3c 68                	cmp    $0x68,%al
10006806:	00 10                	add    %dl,(%eax)
10006808:	4f                   	dec    %edi
10006809:	68 00 10 8b 44       	push   $0x448b1000
1000680e:	8e 1c 89             	mov    (%ecx,%ecx,4),%ds
10006811:	44                   	inc    %esp
10006812:	8f                   	(bad)
10006813:	1c 8b                	sbb    $0x8b,%al
10006815:	44                   	inc    %esp
10006816:	8e 18                	mov    (%eax),%ds
10006818:	89 44 8f 18          	mov    %eax,0x18(%edi,%ecx,4)
1000681c:	8b 44 8e 14          	mov    0x14(%esi,%ecx,4),%eax
10006820:	89 44 8f 14          	mov    %eax,0x14(%edi,%ecx,4)
10006824:	8b 44 8e 10          	mov    0x10(%esi,%ecx,4),%eax
10006828:	89 44 8f 10          	mov    %eax,0x10(%edi,%ecx,4)
1000682c:	8b 44 8e 0c          	mov    0xc(%esi,%ecx,4),%eax
10006830:	89 44 8f 0c          	mov    %eax,0xc(%edi,%ecx,4)
10006834:	8b 44 8e 08          	mov    0x8(%esi,%ecx,4),%eax
10006838:	89 44 8f 08          	mov    %eax,0x8(%edi,%ecx,4)
1000683c:	8b 44 8e 04          	mov    0x4(%esi,%ecx,4),%eax
10006840:	89 44 8f 04          	mov    %eax,0x4(%edi,%ecx,4)
10006844:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
1000684b:	03 f0                	add    %eax,%esi
1000684d:	03 f8                	add    %eax,%edi
1000684f:	ff 24 95 58 68 00 10 	jmp    *0x10006858(,%edx,4)
10006856:	8b ff                	mov    %edi,%edi
10006858:	68 68 00 10 70       	push   $0x70100068
1000685d:	68 00 10 80 68       	push   $0x68801000
10006862:	00 10                	add    %dl,(%eax)
10006864:	94                   	xchg   %eax,%esp
10006865:	68 00 10 8b 45       	push   $0x458b1000
1000686a:	08 5e 5f             	or     %bl,0x5f(%esi)
1000686d:	c9                   	leave
1000686e:	c3                   	ret
1000686f:	90                   	nop
10006870:	8a 46 03             	mov    0x3(%esi),%al
10006873:	88 47 03             	mov    %al,0x3(%edi)
10006876:	8b 45 08             	mov    0x8(%ebp),%eax
10006879:	5e                   	pop    %esi
1000687a:	5f                   	pop    %edi
1000687b:	c9                   	leave
1000687c:	c3                   	ret
1000687d:	8d 49 00             	lea    0x0(%ecx),%ecx
10006880:	8a 46 03             	mov    0x3(%esi),%al
10006883:	88 47 03             	mov    %al,0x3(%edi)
10006886:	8a 46 02             	mov    0x2(%esi),%al
10006889:	88 47 02             	mov    %al,0x2(%edi)
1000688c:	8b 45 08             	mov    0x8(%ebp),%eax
1000688f:	5e                   	pop    %esi
10006890:	5f                   	pop    %edi
10006891:	c9                   	leave
10006892:	c3                   	ret
10006893:	90                   	nop
10006894:	8a 46 03             	mov    0x3(%esi),%al
10006897:	88 47 03             	mov    %al,0x3(%edi)
1000689a:	8a 46 02             	mov    0x2(%esi),%al
1000689d:	88 47 02             	mov    %al,0x2(%edi)
100068a0:	8a 46 01             	mov    0x1(%esi),%al
100068a3:	88 47 01             	mov    %al,0x1(%edi)
100068a6:	8b 45 08             	mov    0x8(%ebp),%eax
100068a9:	5e                   	pop    %esi
100068aa:	5f                   	pop    %edi
100068ab:	c9                   	leave
100068ac:	c3                   	ret
100068ad:	cc                   	int3
100068ae:	cc                   	int3
100068af:	cc                   	int3
100068b0:	6a ff                	push   $0xffffffff
100068b2:	50                   	push   %eax
100068b3:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
100068b9:	50                   	push   %eax
100068ba:	8b 44 24 0c          	mov    0xc(%esp),%eax
100068be:	64 89 25 00 00 00 00 	mov    %esp,%fs:0x0
100068c5:	89 6c 24 0c          	mov    %ebp,0xc(%esp)
100068c9:	8d 6c 24 0c          	lea    0xc(%esp),%ebp
100068cd:	50                   	push   %eax
100068ce:	c3                   	ret
100068cf:	56                   	push   %esi
100068d0:	ff 35 08 04 01 10    	push   0x10010408
100068d6:	e8 ad 2d 00 00       	call   0x10009688
100068db:	59                   	pop    %ecx
100068dc:	8b 0d 04 04 01 10    	mov    0x10010404,%ecx
100068e2:	8b f0                	mov    %eax,%esi
100068e4:	a1 08 04 01 10       	mov    0x10010408,%eax
100068e9:	8b d1                	mov    %ecx,%edx
100068eb:	2b d0                	sub    %eax,%edx
100068ed:	83 c2 04             	add    $0x4,%edx
100068f0:	3b f2                	cmp    %edx,%esi
100068f2:	73 4e                	jae    0x10006942
100068f4:	b9 00 08 00 00       	mov    $0x800,%ecx
100068f9:	3b f1                	cmp    %ecx,%esi
100068fb:	73 02                	jae    0x100068ff
100068fd:	8b ce                	mov    %esi,%ecx
100068ff:	03 ce                	add    %esi,%ecx
10006901:	51                   	push   %ecx
10006902:	50                   	push   %eax
10006903:	e8 d3 2b 00 00       	call   0x100094db
10006908:	85 c0                	test   %eax,%eax
1000690a:	59                   	pop    %ecx
1000690b:	59                   	pop    %ecx
1000690c:	75 17                	jne    0x10006925
1000690e:	83 c6 10             	add    $0x10,%esi
10006911:	56                   	push   %esi
10006912:	ff 35 08 04 01 10    	push   0x10010408
10006918:	e8 be 2b 00 00       	call   0x100094db
1000691d:	85 c0                	test   %eax,%eax
1000691f:	59                   	pop    %ecx
10006920:	59                   	pop    %ecx
10006921:	75 02                	jne    0x10006925
10006923:	5e                   	pop    %esi
10006924:	c3                   	ret
10006925:	8b 0d 04 04 01 10    	mov    0x10010404,%ecx
1000692b:	2b 0d 08 04 01 10    	sub    0x10010408,%ecx
10006931:	a3 08 04 01 10       	mov    %eax,0x10010408
10006936:	c1 f9 02             	sar    $0x2,%ecx
10006939:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
1000693c:	89 0d 04 04 01 10    	mov    %ecx,0x10010404
10006942:	89 39                	mov    %edi,(%ecx)
10006944:	83 05 04 04 01 10 04 	addl   $0x4,0x10010404
1000694b:	8b c7                	mov    %edi,%eax
1000694d:	5e                   	pop    %esi
1000694e:	c3                   	ret
1000694f:	68 80 00 00 00       	push   $0x80
10006954:	e8 59 fb ff ff       	call   0x100064b2
10006959:	85 c0                	test   %eax,%eax
1000695b:	59                   	pop    %ecx
1000695c:	a3 08 04 01 10       	mov    %eax,0x10010408
10006961:	75 04                	jne    0x10006967
10006963:	6a 18                	push   $0x18
10006965:	58                   	pop    %eax
10006966:	c3                   	ret
10006967:	83 20 00             	andl   $0x0,(%eax)
1000696a:	a1 08 04 01 10       	mov    0x10010408,%eax
1000696f:	a3 04 04 01 10       	mov    %eax,0x10010404
10006974:	33 c0                	xor    %eax,%eax
10006976:	c3                   	ret
10006977:	6a 0c                	push   $0xc
10006979:	68 80 c3 00 10       	push   $0x1000c380
1000697e:	e8 31 14 00 00       	call   0x10007db4
10006983:	e8 a8 14 00 00       	call   0x10007e30
10006988:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
1000698c:	8b 7d 08             	mov    0x8(%ebp),%edi
1000698f:	e8 3b ff ff ff       	call   0x100068cf
10006994:	89 45 e4             	mov    %eax,-0x1c(%ebp)
10006997:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
1000699b:	e8 09 00 00 00       	call   0x100069a9
100069a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
100069a3:	e8 47 14 00 00       	call   0x10007def
100069a8:	c3                   	ret
100069a9:	e8 8b 14 00 00       	call   0x10007e39
100069ae:	c3                   	ret
100069af:	ff 74 24 04          	push   0x4(%esp)
100069b3:	e8 bf ff ff ff       	call   0x10006977
100069b8:	f7 d8                	neg    %eax
100069ba:	1b c0                	sbb    %eax,%eax
100069bc:	f7 d8                	neg    %eax
100069be:	59                   	pop    %ecx
100069bf:	48                   	dec    %eax
100069c0:	c3                   	ret
100069c1:	6a 0c                	push   $0xc
100069c3:	68 90 c3 00 10       	push   $0x1000c390
100069c8:	e8 e7 13 00 00       	call   0x10007db4
100069cd:	8b 75 08             	mov    0x8(%ebp),%esi
100069d0:	85 f6                	test   %esi,%esi
100069d2:	74 58                	je     0x10006a2c
100069d4:	83 3d e0 02 01 10 03 	cmpl   $0x3,0x100102e0
100069db:	75 40                	jne    0x10006a1d
100069dd:	6a 04                	push   $0x4
100069df:	e8 86 0e 00 00       	call   0x1000786a
100069e4:	59                   	pop    %ecx
100069e5:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
100069e9:	56                   	push   %esi
100069ea:	e8 11 20 00 00       	call   0x10008a00
100069ef:	59                   	pop    %ecx
100069f0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
100069f3:	85 c0                	test   %eax,%eax
100069f5:	74 09                	je     0x10006a00
100069f7:	56                   	push   %esi
100069f8:	50                   	push   %eax
100069f9:	e8 2d 20 00 00       	call   0x10008a2b
100069fe:	59                   	pop    %ecx
100069ff:	59                   	pop    %ecx
10006a00:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
10006a04:	e8 0b 00 00 00       	call   0x10006a14
10006a09:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
10006a0d:	75 1d                	jne    0x10006a2c
10006a0f:	ff 75 08             	push   0x8(%ebp)
10006a12:	eb 0a                	jmp    0x10006a1e
10006a14:	6a 04                	push   $0x4
10006a16:	e8 bb 0d 00 00       	call   0x100077d6
10006a1b:	59                   	pop    %ecx
10006a1c:	c3                   	ret
10006a1d:	56                   	push   %esi
10006a1e:	6a 00                	push   $0x0
10006a20:	ff 35 dc 02 01 10    	push   0x100102dc
10006a26:	ff 15 38 c0 00 10    	call   *0x1000c038  ; 0x1000c038=KERNEL32.dll!HeapFree
10006a2c:	e8 be 13 00 00       	call   0x10007def
10006a31:	c3                   	ret
10006a32:	56                   	push   %esi
10006a33:	8b 74 24 08          	mov    0x8(%esp),%esi
10006a37:	8b 06                	mov    (%esi),%eax
10006a39:	81 38 63 73 6d e0    	cmpl   $0xe06d7363,(%eax)
10006a3f:	75 14                	jne    0x10006a55
10006a41:	83 78 10 03          	cmpl   $0x3,0x10(%eax)
10006a45:	75 0e                	jne    0x10006a55
10006a47:	81 78 14 20 05 93 19 	cmpl   $0x19930520,0x14(%eax)
10006a4e:	75 05                	jne    0x10006a55
10006a50:	e8 ae 08 00 00       	call   0x10007303
10006a55:	a1 38 fc 00 10       	mov    0x1000fc38,%eax
10006a5a:	85 c0                	test   %eax,%eax
10006a5c:	74 14                	je     0x10006a72
10006a5e:	50                   	push   %eax
10006a5f:	e8 d2 2c 00 00       	call   0x10009736
10006a64:	85 c0                	test   %eax,%eax
10006a66:	59                   	pop    %ecx
10006a67:	74 09                	je     0x10006a72
10006a69:	56                   	push   %esi
10006a6a:	ff 15 38 fc 00 10    	call   *0x1000fc38
10006a70:	eb 02                	jmp    0x10006a74
10006a72:	33 c0                	xor    %eax,%eax
10006a74:	5e                   	pop    %esi
10006a75:	c2 04 00             	ret    $0x4
10006a78:	68 32 6a 00 10       	push   $0x10006a32
10006a7d:	ff 15 3c c0 00 10    	call   *0x1000c03c  ; 0x1000c03c=KERNEL32.dll!SetUnhandledExceptionFilter
10006a83:	a3 38 fc 00 10       	mov    %eax,0x1000fc38
10006a88:	33 c0                	xor    %eax,%eax
10006a8a:	c3                   	ret
10006a8b:	ff 35 38 fc 00 10    	push   0x1000fc38
10006a91:	ff 15 3c c0 00 10    	call   *0x1000c03c  ; 0x1000c03c=KERNEL32.dll!SetUnhandledExceptionFilter
10006a97:	c3                   	ret
10006a98:	8b 46 04             	mov    0x4(%esi),%eax
10006a9b:	85 c0                	test   %eax,%eax
10006a9d:	74 44                	je     0x10006ae3
10006a9f:	8d 50 08             	lea    0x8(%eax),%edx
10006aa2:	80 3a 00             	cmpb   $0x0,(%edx)
10006aa5:	74 3c                	je     0x10006ae3
10006aa7:	8b 4f 04             	mov    0x4(%edi),%ecx
10006aaa:	3b c1                	cmp    %ecx,%eax
10006aac:	74 10                	je     0x10006abe
10006aae:	83 c1 08             	add    $0x8,%ecx
10006ab1:	51                   	push   %ecx
10006ab2:	52                   	push   %edx
10006ab3:	e8 e8 0d 00 00       	call   0x100078a0
10006ab8:	85 c0                	test   %eax,%eax
10006aba:	59                   	pop    %ecx
10006abb:	59                   	pop    %ecx
10006abc:	75 22                	jne    0x10006ae0
10006abe:	f6 07 02             	testb  $0x2,(%edi)
10006ac1:	74 05                	je     0x10006ac8
10006ac3:	f6 06 08             	testb  $0x8,(%esi)
10006ac6:	74 18                	je     0x10006ae0
10006ac8:	8b 44 24 04          	mov    0x4(%esp),%eax
10006acc:	8b 00                	mov    (%eax),%eax
10006ace:	a8 01                	test   $0x1,%al
10006ad0:	74 05                	je     0x10006ad7
10006ad2:	f6 06 01             	testb  $0x1,(%esi)
10006ad5:	74 09                	je     0x10006ae0
10006ad7:	a8 02                	test   $0x2,%al
10006ad9:	74 08                	je     0x10006ae3
10006adb:	f6 06 02             	testb  $0x2,(%esi)
10006ade:	75 03                	jne    0x10006ae3
10006ae0:	33 c0                	xor    %eax,%eax
10006ae2:	c3                   	ret
10006ae3:	33 c0                	xor    %eax,%eax
10006ae5:	40                   	inc    %eax
10006ae6:	c3                   	ret
10006ae7:	8b 00                	mov    (%eax),%eax
10006ae9:	81 38 63 73 6d e0    	cmpl   $0xe06d7363,(%eax)
10006aef:	74 03                	je     0x10006af4
10006af1:	33 c0                	xor    %eax,%eax
10006af3:	c3                   	ret
10006af4:	e8 9d 08 00 00       	call   0x10007396
10006af9:	83 a0 80 00 00 00 00 	andl   $0x0,0x80(%eax)
10006b00:	e9 fe 07 00 00       	jmp    0x10007303
10006b05:	6a 10                	push   $0x10
10006b07:	68 a0 c3 00 10       	push   $0x1000c3a0
10006b0c:	e8 a3 12 00 00       	call   0x10007db4
10006b11:	8b 5d 08             	mov    0x8(%ebp),%ebx
10006b14:	8b 73 08             	mov    0x8(%ebx),%esi
10006b17:	89 75 e4             	mov    %esi,-0x1c(%ebp)
10006b1a:	e8 77 08 00 00       	call   0x10007396
10006b1f:	05 80 00 00 00       	add    $0x80,%eax
10006b24:	ff 00                	incl   (%eax)
10006b26:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
10006b2a:	8b 7d 10             	mov    0x10(%ebp),%edi
10006b2d:	3b 75 14             	cmp    0x14(%ebp),%esi
10006b30:	74 64                	je     0x10006b96
10006b32:	83 fe ff             	cmp    $0xffffffff,%esi
10006b35:	7e 05                	jle    0x10006b3c
10006b37:	3b 77 04             	cmp    0x4(%edi),%esi
10006b3a:	7c 05                	jl     0x10006b41
10006b3c:	e8 f7 07 00 00       	call   0x10007338
10006b41:	8b c6                	mov    %esi,%eax
10006b43:	c1 e0 03             	shl    $0x3,%eax
10006b46:	8b 4f 08             	mov    0x8(%edi),%ecx
10006b49:	03 c8                	add    %eax,%ecx
10006b4b:	8b 31                	mov    (%ecx),%esi
10006b4d:	89 75 e0             	mov    %esi,-0x20(%ebp)
10006b50:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
10006b57:	83 79 04 00          	cmpl   $0x0,0x4(%ecx)
10006b5b:	74 15                	je     0x10006b72
10006b5d:	89 73 08             	mov    %esi,0x8(%ebx)
10006b60:	68 03 01 00 00       	push   $0x103
10006b65:	53                   	push   %ebx
10006b66:	8b 4f 08             	mov    0x8(%edi),%ecx
10006b69:	ff 74 01 04          	push   0x4(%ecx,%eax,1)
10006b6d:	e8 7e 0a 00 00       	call   0x100075f0
10006b72:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
10006b76:	eb 19                	jmp    0x10006b91
10006b78:	8b 45 ec             	mov    -0x14(%ebp),%eax
10006b7b:	e8 67 ff ff ff       	call   0x10006ae7
10006b80:	c3                   	ret
10006b81:	8b 65 e8             	mov    -0x18(%ebp),%esp
10006b84:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
10006b88:	8b 7d 10             	mov    0x10(%ebp),%edi
10006b8b:	8b 5d 08             	mov    0x8(%ebp),%ebx
10006b8e:	8b 75 e0             	mov    -0x20(%ebp),%esi
10006b91:	89 75 e4             	mov    %esi,-0x1c(%ebp)
10006b94:	eb 97                	jmp    0x10006b2d
10006b96:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
10006b9a:	e8 19 00 00 00       	call   0x10006bb8
10006b9f:	3b 75 14             	cmp    0x14(%ebp),%esi
10006ba2:	74 05                	je     0x10006ba9
10006ba4:	e8 8f 07 00 00       	call   0x10007338
10006ba9:	89 73 08             	mov    %esi,0x8(%ebx)
10006bac:	e8 3e 12 00 00       	call   0x10007def
10006bb1:	c3                   	ret
10006bb2:	8b 5d 08             	mov    0x8(%ebp),%ebx
10006bb5:	8b 75 e4             	mov    -0x1c(%ebp),%esi
10006bb8:	e8 d9 07 00 00       	call   0x10007396
10006bbd:	83 b8 80 00 00 00 00 	cmpl   $0x0,0x80(%eax)
10006bc4:	7e 0c                	jle    0x10006bd2
10006bc6:	e8 cb 07 00 00       	call   0x10007396
10006bcb:	05 80 00 00 00       	add    $0x80,%eax
10006bd0:	ff 08                	decl   (%eax)
10006bd2:	c3                   	ret
10006bd3:	6a 08                	push   $0x8
10006bd5:	68 b8 c3 00 10       	push   $0x1000c3b8
10006bda:	e8 d5 11 00 00       	call   0x10007db4
10006bdf:	8b 45 08             	mov    0x8(%ebp),%eax
10006be2:	85 c0                	test   %eax,%eax
10006be4:	74 1b                	je     0x10006c01
10006be6:	8b 48 1c             	mov    0x1c(%eax),%ecx
10006be9:	8b 49 04             	mov    0x4(%ecx),%ecx
10006bec:	85 c9                	test   %ecx,%ecx
10006bee:	74 11                	je     0x10006c01
10006bf0:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
10006bf4:	51                   	push   %ecx
10006bf5:	ff 70 18             	push   0x18(%eax)
10006bf8:	e8 4f ee ff ff       	call   0x10005a4c
10006bfd:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
10006c01:	e8 e9 11 00 00       	call   0x10007def
10006c06:	c3                   	ret
10006c07:	33 c0                	xor    %eax,%eax
10006c09:	38 45 0c             	cmp    %al,0xc(%ebp)
10006c0c:	0f 95 c0             	setne  %al
10006c0f:	c3                   	ret
10006c10:	8b 65 e8             	mov    -0x18(%ebp),%esp
10006c13:	e9 eb 06 00 00       	jmp    0x10007303
10006c18:	8b 51 04             	mov    0x4(%ecx),%edx
10006c1b:	56                   	push   %esi
10006c1c:	8b f0                	mov    %eax,%esi
10006c1e:	8b 01                	mov    (%ecx),%eax
10006c20:	03 c6                	add    %esi,%eax
10006c22:	85 d2                	test   %edx,%edx
10006c24:	7c 0d                	jl     0x10006c33
10006c26:	8b 49 08             	mov    0x8(%ecx),%ecx
10006c29:	8b 34 32             	mov    (%edx,%esi,1),%esi
10006c2c:	8b 0c 0e             	mov    (%esi,%ecx,1),%ecx
10006c2f:	03 ca                	add    %edx,%ecx
10006c31:	03 c1                	add    %ecx,%eax
10006c33:	5e                   	pop    %esi
10006c34:	c3                   	ret
10006c35:	6a 40                	push   $0x40
10006c37:	68 c8 c3 00 10       	push   $0x1000c3c8
10006c3c:	e8 73 11 00 00       	call   0x10007db4
10006c41:	8b d9                	mov    %ecx,%ebx
10006c43:	8b 7d 0c             	mov    0xc(%ebp),%edi
10006c46:	8b 75 08             	mov    0x8(%ebp),%esi
10006c49:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
10006c4c:	83 65 e0 00          	andl   $0x0,-0x20(%ebp)
10006c50:	8b 47 fc             	mov    -0x4(%edi),%eax
10006c53:	89 45 dc             	mov    %eax,-0x24(%ebp)
10006c56:	ff 76 18             	push   0x18(%esi)
10006c59:	8d 45 d4             	lea    -0x2c(%ebp),%eax
10006c5c:	50                   	push   %eax
10006c5d:	e8 88 ef ff ff       	call   0x10005bea
10006c62:	59                   	pop    %ecx
10006c63:	59                   	pop    %ecx
10006c64:	89 45 d0             	mov    %eax,-0x30(%ebp)
10006c67:	e8 2a 07 00 00       	call   0x10007396
10006c6c:	8b 40 78             	mov    0x78(%eax),%eax
10006c6f:	89 45 cc             	mov    %eax,-0x34(%ebp)
10006c72:	e8 1f 07 00 00       	call   0x10007396
10006c77:	8b 40 7c             	mov    0x7c(%eax),%eax
10006c7a:	89 45 c8             	mov    %eax,-0x38(%ebp)
10006c7d:	e8 14 07 00 00       	call   0x10007396
10006c82:	89 70 78             	mov    %esi,0x78(%eax)
10006c85:	e8 0c 07 00 00       	call   0x10007396
10006c8a:	8b 4d 10             	mov    0x10(%ebp),%ecx
10006c8d:	89 48 7c             	mov    %ecx,0x7c(%eax)
10006c90:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
10006c94:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
10006c9b:	ff 75 1c             	push   0x1c(%ebp)
10006c9e:	ff 75 18             	push   0x18(%ebp)
10006ca1:	53                   	push   %ebx
10006ca2:	ff 75 14             	push   0x14(%ebp)
10006ca5:	57                   	push   %edi
10006ca6:	e8 d4 ef ff ff       	call   0x10005c7f
10006cab:	83 c4 14             	add    $0x14,%esp
10006cae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
10006cb1:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
10006cb5:	e9 a3 00 00 00       	jmp    0x10006d5d
10006cba:	8b 45 ec             	mov    -0x14(%ebp),%eax
10006cbd:	8b 00                	mov    (%eax),%eax
10006cbf:	89 45 c4             	mov    %eax,-0x3c(%ebp)
10006cc2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
10006cc5:	81 38 63 73 6d e0    	cmpl   $0xe06d7363,(%eax)
10006ccb:	75 25                	jne    0x10006cf2
10006ccd:	8b 45 c4             	mov    -0x3c(%ebp),%eax
10006cd0:	83 78 10 03          	cmpl   $0x3,0x10(%eax)
10006cd4:	75 1c                	jne    0x10006cf2
10006cd6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
10006cd9:	81 78 14 20 05 93 19 	cmpl   $0x19930520,0x14(%eax)
10006ce0:	75 10                	jne    0x10006cf2
10006ce2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
10006ce5:	83 78 1c 00          	cmpl   $0x0,0x1c(%eax)
10006ce9:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
10006cf0:	74 07                	je     0x10006cf9
10006cf2:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
10006cf9:	8b 45 c0             	mov    -0x40(%ebp),%eax
10006cfc:	c3                   	ret
10006cfd:	8b 65 e8             	mov    -0x18(%ebp),%esp
10006d00:	8b 4d 14             	mov    0x14(%ebp),%ecx
10006d03:	8b 41 08             	mov    0x8(%ecx),%eax
10006d06:	89 45 bc             	mov    %eax,-0x44(%ebp)
10006d09:	8b 7d 0c             	mov    0xc(%ebp),%edi
10006d0c:	8b 47 08             	mov    0x8(%edi),%eax
10006d0f:	89 45 b8             	mov    %eax,-0x48(%ebp)
10006d12:	8b 51 10             	mov    0x10(%ecx),%edx
10006d15:	89 55 b4             	mov    %edx,-0x4c(%ebp)
10006d18:	33 d2                	xor    %edx,%edx
10006d1a:	89 55 b0             	mov    %edx,-0x50(%ebp)
10006d1d:	3b 51 0c             	cmp    0xc(%ecx),%edx
10006d20:	73 24                	jae    0x10006d46
10006d22:	8d 34 92             	lea    (%edx,%edx,4),%esi
10006d25:	8b 5d b4             	mov    -0x4c(%ebp),%ebx
10006d28:	8d 34 b3             	lea    (%ebx,%esi,4),%esi
10006d2b:	8b 5e 04             	mov    0x4(%esi),%ebx
10006d2e:	3b c3                	cmp    %ebx,%eax
10006d30:	7e 3d                	jle    0x10006d6f
10006d32:	3b 46 08             	cmp    0x8(%esi),%eax
10006d35:	7f 38                	jg     0x10006d6f
10006d37:	8d 43 01             	lea    0x1(%ebx),%eax
10006d3a:	89 45 b8             	mov    %eax,-0x48(%ebp)
10006d3d:	8b 55 bc             	mov    -0x44(%ebp),%edx
10006d40:	8b 04 c2             	mov    (%edx,%eax,8),%eax
10006d43:	89 45 b8             	mov    %eax,-0x48(%ebp)
10006d46:	50                   	push   %eax
10006d47:	51                   	push   %ecx
10006d48:	33 f6                	xor    %esi,%esi
10006d4a:	56                   	push   %esi
10006d4b:	57                   	push   %edi
10006d4c:	e8 b4 fd ff ff       	call   0x10006b05
10006d51:	83 c4 10             	add    $0x10,%esp
10006d54:	89 75 e4             	mov    %esi,-0x1c(%ebp)
10006d57:	89 75 fc             	mov    %esi,-0x4(%ebp)
10006d5a:	8b 75 08             	mov    0x8(%ebp),%esi
10006d5d:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
10006d61:	e8 12 00 00 00       	call   0x10006d78
10006d66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
10006d69:	e8 81 10 00 00       	call   0x10007def
10006d6e:	c3                   	ret
10006d6f:	42                   	inc    %edx
10006d70:	eb a8                	jmp    0x10006d1a
10006d72:	8b 7d 0c             	mov    0xc(%ebp),%edi
10006d75:	8b 75 08             	mov    0x8(%ebp),%esi
10006d78:	8b 45 dc             	mov    -0x24(%ebp),%eax
10006d7b:	89 47 fc             	mov    %eax,-0x4(%edi)
10006d7e:	ff 75 d0             	push   -0x30(%ebp)
10006d81:	e8 ad ee ff ff       	call   0x10005c33
10006d86:	59                   	pop    %ecx
10006d87:	e8 0a 06 00 00       	call   0x10007396
10006d8c:	8b 4d cc             	mov    -0x34(%ebp),%ecx
10006d8f:	89 48 78             	mov    %ecx,0x78(%eax)
10006d92:	e8 ff 05 00 00       	call   0x10007396
10006d97:	8b 4d c8             	mov    -0x38(%ebp),%ecx
10006d9a:	89 48 7c             	mov    %ecx,0x7c(%eax)
10006d9d:	81 3e 63 73 6d e0    	cmpl   $0xe06d7363,(%esi)
10006da3:	75 36                	jne    0x10006ddb
10006da5:	83 7e 10 03          	cmpl   $0x3,0x10(%esi)
10006da9:	75 30                	jne    0x10006ddb
10006dab:	81 7e 14 20 05 93 19 	cmpl   $0x19930520,0x14(%esi)
10006db2:	75 27                	jne    0x10006ddb
10006db4:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
10006db8:	75 21                	jne    0x10006ddb
10006dba:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
10006dbe:	74 1b                	je     0x10006ddb
10006dc0:	ff 76 18             	push   0x18(%esi)
10006dc3:	e8 4a ee ff ff       	call   0x10005c12
10006dc8:	59                   	pop    %ecx
10006dc9:	85 c0                	test   %eax,%eax
10006dcb:	74 0e                	je     0x10006ddb
10006dcd:	e8 58 f0 ff ff       	call   0x10005e2a
10006dd2:	50                   	push   %eax
10006dd3:	56                   	push   %esi
10006dd4:	e8 fa fd ff ff       	call   0x10006bd3
10006dd9:	59                   	pop    %ecx
10006dda:	59                   	pop    %ecx
10006ddb:	c3                   	ret
10006ddc:	6a 08                	push   $0x8
10006dde:	68 e0 c3 00 10       	push   $0x1000c3e0
10006de3:	e8 cc 0f 00 00       	call   0x10007db4
10006de8:	8b f1                	mov    %ecx,%esi
10006dea:	8b 45 0c             	mov    0xc(%ebp),%eax
10006ded:	8b fa                	mov    %edx,%edi
10006def:	8b 5d 08             	mov    0x8(%ebp),%ebx
10006df2:	8b 48 04             	mov    0x4(%eax),%ecx
10006df5:	85 c9                	test   %ecx,%ecx
10006df7:	0f 84 49 01 00 00    	je     0x10006f46
10006dfd:	80 79 08 00          	cmpb   $0x0,0x8(%ecx)
10006e01:	0f 84 3f 01 00 00    	je     0x10006f46
10006e07:	8b 48 08             	mov    0x8(%eax),%ecx
10006e0a:	85 c9                	test   %ecx,%ecx
10006e0c:	75 0a                	jne    0x10006e18
10006e0e:	f6 40 03 80          	testb  $0x80,0x3(%eax)
10006e12:	0f 84 2e 01 00 00    	je     0x10006f46
10006e18:	8b 00                	mov    (%eax),%eax
10006e1a:	85 c0                	test   %eax,%eax
10006e1c:	78 04                	js     0x10006e22
10006e1e:	8d 7c 39 0c          	lea    0xc(%ecx,%edi,1),%edi
10006e22:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
10006e26:	6a 01                	push   $0x1
10006e28:	ff 73 18             	push   0x18(%ebx)
10006e2b:	a8 08                	test   $0x8,%al
10006e2d:	74 35                	je     0x10006e64
10006e2f:	e8 ca 28 00 00       	call   0x100096fe
10006e34:	59                   	pop    %ecx
10006e35:	59                   	pop    %ecx
10006e36:	85 c0                	test   %eax,%eax
10006e38:	0f 84 ff 00 00 00    	je     0x10006f3d
10006e3e:	6a 01                	push   $0x1
10006e40:	57                   	push   %edi
10006e41:	e8 d4 28 00 00       	call   0x1000971a
10006e46:	59                   	pop    %ecx
10006e47:	59                   	pop    %ecx
10006e48:	85 c0                	test   %eax,%eax
10006e4a:	0f 84 ed 00 00 00    	je     0x10006f3d
10006e50:	8b 43 18             	mov    0x18(%ebx),%eax
10006e53:	89 07                	mov    %eax,(%edi)
10006e55:	8d 4e 08             	lea    0x8(%esi),%ecx
10006e58:	e8 bb fd ff ff       	call   0x10006c18
10006e5d:	89 07                	mov    %eax,(%edi)
10006e5f:	e9 de 00 00 00       	jmp    0x10006f42
10006e64:	f6 06 01             	testb  $0x1,(%esi)
10006e67:	74 46                	je     0x10006eaf
10006e69:	e8 90 28 00 00       	call   0x100096fe
10006e6e:	59                   	pop    %ecx
10006e6f:	59                   	pop    %ecx
10006e70:	85 c0                	test   %eax,%eax
10006e72:	0f 84 c5 00 00 00    	je     0x10006f3d
10006e78:	6a 01                	push   $0x1
10006e7a:	57                   	push   %edi
10006e7b:	e8 9a 28 00 00       	call   0x1000971a
10006e80:	59                   	pop    %ecx
10006e81:	59                   	pop    %ecx
10006e82:	85 c0                	test   %eax,%eax
10006e84:	0f 84 b3 00 00 00    	je     0x10006f3d
10006e8a:	ff 76 14             	push   0x14(%esi)
10006e8d:	ff 73 18             	push   0x18(%ebx)
10006e90:	57                   	push   %edi
10006e91:	e8 0a e8 ff ff       	call   0x100056a0
10006e96:	83 c4 0c             	add    $0xc,%esp
10006e99:	83 7e 14 04          	cmpl   $0x4,0x14(%esi)
10006e9d:	0f 85 9f 00 00 00    	jne    0x10006f42
10006ea3:	8b 07                	mov    (%edi),%eax
10006ea5:	85 c0                	test   %eax,%eax
10006ea7:	0f 84 95 00 00 00    	je     0x10006f42
10006ead:	eb a6                	jmp    0x10006e55
10006eaf:	83 7e 18 00          	cmpl   $0x0,0x18(%esi)
10006eb3:	75 33                	jne    0x10006ee8
10006eb5:	e8 44 28 00 00       	call   0x100096fe
10006eba:	59                   	pop    %ecx
10006ebb:	59                   	pop    %ecx
10006ebc:	85 c0                	test   %eax,%eax
10006ebe:	74 7d                	je     0x10006f3d
10006ec0:	6a 01                	push   $0x1
10006ec2:	57                   	push   %edi
10006ec3:	e8 52 28 00 00       	call   0x1000971a
10006ec8:	59                   	pop    %ecx
10006ec9:	59                   	pop    %ecx
10006eca:	85 c0                	test   %eax,%eax
10006ecc:	74 6f                	je     0x10006f3d
10006ece:	ff 76 14             	push   0x14(%esi)
10006ed1:	8d 4e 08             	lea    0x8(%esi),%ecx
10006ed4:	8b 43 18             	mov    0x18(%ebx),%eax
10006ed7:	e8 3c fd ff ff       	call   0x10006c18
10006edc:	50                   	push   %eax
10006edd:	57                   	push   %edi
10006ede:	e8 bd e7 ff ff       	call   0x100056a0
10006ee3:	83 c4 0c             	add    $0xc,%esp
10006ee6:	eb 5a                	jmp    0x10006f42
10006ee8:	e8 11 28 00 00       	call   0x100096fe
10006eed:	59                   	pop    %ecx
10006eee:	59                   	pop    %ecx
10006eef:	85 c0                	test   %eax,%eax
10006ef1:	74 4a                	je     0x10006f3d
10006ef3:	6a 01                	push   $0x1
10006ef5:	57                   	push   %edi
10006ef6:	e8 1f 28 00 00       	call   0x1000971a
10006efb:	59                   	pop    %ecx
10006efc:	59                   	pop    %ecx
10006efd:	85 c0                	test   %eax,%eax
10006eff:	74 3c                	je     0x10006f3d
10006f01:	ff 76 18             	push   0x18(%esi)
10006f04:	e8 2d 28 00 00       	call   0x10009736
10006f09:	59                   	pop    %ecx
10006f0a:	85 c0                	test   %eax,%eax
10006f0c:	74 2f                	je     0x10006f3d
10006f0e:	8b 43 18             	mov    0x18(%ebx),%eax
10006f11:	8d 4e 08             	lea    0x8(%esi),%ecx
10006f14:	f6 06 04             	testb  $0x4,(%esi)
10006f17:	74 13                	je     0x10006f2c
10006f19:	6a 01                	push   $0x1
10006f1b:	e8 f8 fc ff ff       	call   0x10006c18
10006f20:	50                   	push   %eax
10006f21:	ff 76 18             	push   0x18(%esi)
10006f24:	57                   	push   %edi
10006f25:	e8 22 eb ff ff       	call   0x10005a4c
10006f2a:	eb 16                	jmp    0x10006f42
10006f2c:	e8 e7 fc ff ff       	call   0x10006c18
10006f31:	50                   	push   %eax
10006f32:	ff 76 18             	push   0x18(%esi)
10006f35:	57                   	push   %edi
10006f36:	e8 11 eb ff ff       	call   0x10005a4c
10006f3b:	eb 05                	jmp    0x10006f42
10006f3d:	e8 f6 03 00 00       	call   0x10007338
10006f42:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
10006f46:	e8 a4 0e 00 00       	call   0x10007def
10006f4b:	c3                   	ret
10006f4c:	33 c0                	xor    %eax,%eax
10006f4e:	40                   	inc    %eax
10006f4f:	c3                   	ret
10006f50:	8b 65 e8             	mov    -0x18(%ebp),%esp
10006f53:	e9 ab 03 00 00       	jmp    0x10007303
10006f58:	55                   	push   %ebp
10006f59:	8b ec                	mov    %esp,%ebp
10006f5b:	85 c9                	test   %ecx,%ecx
10006f5d:	74 0d                	je     0x10006f6c
10006f5f:	53                   	push   %ebx
10006f60:	ff 75 08             	push   0x8(%ebp)
10006f63:	8b d6                	mov    %esi,%edx
10006f65:	e8 72 fe ff ff       	call   0x10006ddc
10006f6a:	59                   	pop    %ecx
10006f6b:	59                   	pop    %ecx
10006f6c:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
10006f70:	ff 75 08             	push   0x8(%ebp)
10006f73:	75 03                	jne    0x10006f78
10006f75:	56                   	push   %esi
10006f76:	eb 03                	jmp    0x10006f7b
10006f78:	ff 75 1c             	push   0x1c(%ebp)
10006f7b:	e8 d3 ea ff ff       	call   0x10005a53
10006f80:	ff 37                	push   (%edi)
10006f82:	ff 75 14             	push   0x14(%ebp)
10006f85:	ff 75 10             	push   0x10(%ebp)
10006f88:	56                   	push   %esi
10006f89:	e8 77 fb ff ff       	call   0x10006b05
10006f8e:	8b 47 04             	mov    0x4(%edi),%eax
10006f91:	68 00 01 00 00       	push   $0x100
10006f96:	ff 75 18             	push   0x18(%ebp)
10006f99:	40                   	inc    %eax
10006f9a:	ff 75 14             	push   0x14(%ebp)
10006f9d:	89 46 08             	mov    %eax,0x8(%esi)
10006fa0:	ff 75 0c             	push   0xc(%ebp)
10006fa3:	8b 4b 0c             	mov    0xc(%ebx),%ecx
10006fa6:	56                   	push   %esi
10006fa7:	ff 75 08             	push   0x8(%ebp)
10006faa:	e8 86 fc ff ff       	call   0x10006c35
10006faf:	83 c4 28             	add    $0x28,%esp
10006fb2:	85 c0                	test   %eax,%eax
10006fb4:	74 07                	je     0x10006fbd
10006fb6:	56                   	push   %esi
10006fb7:	50                   	push   %eax
10006fb8:	e8 5f ea ff ff       	call   0x10005a1c
10006fbd:	5d                   	pop    %ebp
10006fbe:	c3                   	ret
10006fbf:	55                   	push   %ebp
10006fc0:	8b ec                	mov    %esp,%ebp
10006fc2:	51                   	push   %ecx
10006fc3:	51                   	push   %ecx
10006fc4:	56                   	push   %esi
10006fc5:	8b 75 08             	mov    0x8(%ebp),%esi
10006fc8:	81 3e 03 00 00 80    	cmpl   $0x80000003,(%esi)
10006fce:	0f 84 a8 00 00 00    	je     0x1000707c
10006fd4:	e8 bd 03 00 00       	call   0x10007396
10006fd9:	83 78 74 00          	cmpl   $0x0,0x74(%eax)
10006fdd:	74 1f                	je     0x10006ffe
10006fdf:	ff 75 24             	push   0x24(%ebp)
10006fe2:	ff 75 20             	push   0x20(%ebp)
10006fe5:	ff 75 18             	push   0x18(%ebp)
10006fe8:	ff 75 14             	push   0x14(%ebp)
10006feb:	ff 75 10             	push   0x10(%ebp)
10006fee:	ff 75 0c             	push   0xc(%ebp)
10006ff1:	56                   	push   %esi
10006ff2:	e8 d9 ec ff ff       	call   0x10005cd0
10006ff7:	83 c4 1c             	add    $0x1c,%esp
10006ffa:	85 c0                	test   %eax,%eax
10006ffc:	75 7e                	jne    0x1000707c
10006ffe:	8b 75 1c             	mov    0x1c(%ebp),%esi
10007001:	57                   	push   %edi
10007002:	8d 45 f8             	lea    -0x8(%ebp),%eax
10007005:	50                   	push   %eax
10007006:	8d 45 fc             	lea    -0x4(%ebp),%eax
10007009:	50                   	push   %eax
1000700a:	56                   	push   %esi
1000700b:	ff 75 20             	push   0x20(%ebp)
1000700e:	ff 75 18             	push   0x18(%ebp)
10007011:	e8 5a eb ff ff       	call   0x10005b70
10007016:	8b f8                	mov    %eax,%edi
10007018:	8b 45 fc             	mov    -0x4(%ebp),%eax
1000701b:	83 c4 14             	add    $0x14,%esp
1000701e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
10007021:	73 58                	jae    0x1000707b
10007023:	53                   	push   %ebx
10007024:	3b 37                	cmp    (%edi),%esi
10007026:	7c 44                	jl     0x1000706c
10007028:	3b 77 04             	cmp    0x4(%edi),%esi
1000702b:	7f 3f                	jg     0x1000706c
1000702d:	8b 47 0c             	mov    0xc(%edi),%eax
10007030:	8b 4f 10             	mov    0x10(%edi),%ecx
10007033:	c1 e0 04             	shl    $0x4,%eax
10007036:	03 c1                	add    %ecx,%eax
10007038:	8b 48 f4             	mov    -0xc(%eax),%ecx
1000703b:	85 c9                	test   %ecx,%ecx
1000703d:	74 06                	je     0x10007045
1000703f:	80 79 08 00          	cmpb   $0x0,0x8(%ecx)
10007043:	75 27                	jne    0x1000706c
10007045:	8b 75 0c             	mov    0xc(%ebp),%esi
10007048:	6a 01                	push   $0x1
1000704a:	ff 75 24             	push   0x24(%ebp)
1000704d:	8d 58 f0             	lea    -0x10(%eax),%ebx
10007050:	ff 75 20             	push   0x20(%ebp)
10007053:	33 c9                	xor    %ecx,%ecx
10007055:	ff 75 18             	push   0x18(%ebp)
10007058:	ff 75 14             	push   0x14(%ebp)
1000705b:	ff 75 10             	push   0x10(%ebp)
1000705e:	ff 75 08             	push   0x8(%ebp)
10007061:	e8 f2 fe ff ff       	call   0x10006f58
10007066:	8b 75 1c             	mov    0x1c(%ebp),%esi
10007069:	83 c4 1c             	add    $0x1c,%esp
1000706c:	ff 45 fc             	incl   -0x4(%ebp)
1000706f:	8b 45 fc             	mov    -0x4(%ebp),%eax
10007072:	83 c7 14             	add    $0x14,%edi
10007075:	3b 45 f8             	cmp    -0x8(%ebp),%eax
10007078:	72 aa                	jb     0x10007024
1000707a:	5b                   	pop    %ebx
1000707b:	5f                   	pop    %edi
1000707c:	5e                   	pop    %esi
1000707d:	c9                   	leave
1000707e:	c3                   	ret
1000707f:	55                   	push   %ebp
10007080:	8b ec                	mov    %esp,%ebp
10007082:	83 ec 24             	sub    $0x24,%esp
10007085:	8b 45 0c             	mov    0xc(%ebp),%eax
10007088:	8b 40 08             	mov    0x8(%eax),%eax
1000708b:	80 65 e4 00          	andb   $0x0,-0x1c(%ebp)
1000708f:	83 f8 ff             	cmp    $0xffffffff,%eax
10007092:	89 45 e8             	mov    %eax,-0x18(%ebp)
10007095:	7c 08                	jl     0x1000709f
10007097:	8b 4d 18             	mov    0x18(%ebp),%ecx
1000709a:	3b 41 04             	cmp    0x4(%ecx),%eax
1000709d:	7c 05                	jl     0x100070a4
1000709f:	e8 94 02 00 00       	call   0x10007338
100070a4:	53                   	push   %ebx
100070a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
100070a8:	81 3b 63 73 6d e0    	cmpl   $0xe06d7363,(%ebx)
100070ae:	56                   	push   %esi
100070af:	57                   	push   %edi
100070b0:	0f 85 80 01 00 00    	jne    0x10007236
100070b6:	83 7b 10 03          	cmpl   $0x3,0x10(%ebx)
100070ba:	bf 20 05 93 19       	mov    $0x19930520,%edi
100070bf:	75 6f                	jne    0x10007130
100070c1:	39 7b 14             	cmp    %edi,0x14(%ebx)
100070c4:	75 6a                	jne    0x10007130
100070c6:	83 7b 1c 00          	cmpl   $0x0,0x1c(%ebx)
100070ca:	75 64                	jne    0x10007130
100070cc:	e8 c5 02 00 00       	call   0x10007396
100070d1:	83 78 78 00          	cmpl   $0x0,0x78(%eax)
100070d5:	0f 84 53 01 00 00    	je     0x1000722e
100070db:	e8 b6 02 00 00       	call   0x10007396
100070e0:	8b 70 78             	mov    0x78(%eax),%esi
100070e3:	89 75 08             	mov    %esi,0x8(%ebp)
100070e6:	e8 ab 02 00 00       	call   0x10007396
100070eb:	8b 40 7c             	mov    0x7c(%eax),%eax
100070ee:	6a 01                	push   $0x1
100070f0:	56                   	push   %esi
100070f1:	89 45 10             	mov    %eax,0x10(%ebp)
100070f4:	c6 45 e4 01          	movb   $0x1,-0x1c(%ebp)
100070f8:	e8 01 26 00 00       	call   0x100096fe
100070fd:	85 c0                	test   %eax,%eax
100070ff:	59                   	pop    %ecx
10007100:	59                   	pop    %ecx
10007101:	75 05                	jne    0x10007108
10007103:	e8 30 02 00 00       	call   0x10007338
10007108:	81 3e 63 73 6d e0    	cmpl   $0xe06d7363,(%esi)
1000710e:	0f 85 1f 01 00 00    	jne    0x10007233
10007114:	8b 45 08             	mov    0x8(%ebp),%eax
10007117:	83 78 10 03          	cmpl   $0x3,0x10(%eax)
1000711b:	75 10                	jne    0x1000712d
1000711d:	39 78 14             	cmp    %edi,0x14(%eax)
10007120:	75 0b                	jne    0x1000712d
10007122:	83 78 1c 00          	cmpl   $0x0,0x1c(%eax)
10007126:	75 05                	jne    0x1000712d
10007128:	e8 0b 02 00 00       	call   0x10007338
1000712d:	8b 5d 08             	mov    0x8(%ebp),%ebx
10007130:	81 3b 63 73 6d e0    	cmpl   $0xe06d7363,(%ebx)
10007136:	0f 85 fa 00 00 00    	jne    0x10007236
1000713c:	83 7b 10 03          	cmpl   $0x3,0x10(%ebx)
10007140:	0f 85 f0 00 00 00    	jne    0x10007236
10007146:	39 7b 14             	cmp    %edi,0x14(%ebx)
10007149:	0f 85 e7 00 00 00    	jne    0x10007236
1000714f:	8b 75 e8             	mov    -0x18(%ebp),%esi
10007152:	8d 45 e0             	lea    -0x20(%ebp),%eax
10007155:	50                   	push   %eax
10007156:	8d 45 f8             	lea    -0x8(%ebp),%eax
10007159:	50                   	push   %eax
1000715a:	56                   	push   %esi
1000715b:	ff 75 20             	push   0x20(%ebp)
1000715e:	ff 75 18             	push   0x18(%ebp)
10007161:	e8 0a ea ff ff       	call   0x10005b70
10007166:	8b 4d f8             	mov    -0x8(%ebp),%ecx
10007169:	83 c4 14             	add    $0x14,%esp
1000716c:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
1000716f:	89 45 fc             	mov    %eax,-0x4(%ebp)
10007172:	0f 83 a6 00 00 00    	jae    0x1000721e
10007178:	eb 03                	jmp    0x1000717d
1000717a:	8b 75 e8             	mov    -0x18(%ebp),%esi
1000717d:	39 30                	cmp    %esi,(%eax)
1000717f:	0f 8f 84 00 00 00    	jg     0x10007209
10007185:	3b 70 04             	cmp    0x4(%eax),%esi
10007188:	7f 7f                	jg     0x10007209
1000718a:	8b 48 0c             	mov    0xc(%eax),%ecx
1000718d:	85 c9                	test   %ecx,%ecx
1000718f:	8b 70 10             	mov    0x10(%eax),%esi
10007192:	89 4d ec             	mov    %ecx,-0x14(%ebp)
10007195:	7e 72                	jle    0x10007209
10007197:	8b 4b 1c             	mov    0x1c(%ebx),%ecx
1000719a:	8b 49 0c             	mov    0xc(%ecx),%ecx
1000719d:	8d 51 04             	lea    0x4(%ecx),%edx
100071a0:	8b 09                	mov    (%ecx),%ecx
100071a2:	85 c9                	test   %ecx,%ecx
100071a4:	89 55 f4             	mov    %edx,-0xc(%ebp)
100071a7:	89 4d f0             	mov    %ecx,-0x10(%ebp)
100071aa:	7e 24                	jle    0x100071d0
100071ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
100071af:	8b 38                	mov    (%eax),%edi
100071b1:	ff 73 1c             	push   0x1c(%ebx)
100071b4:	89 7d dc             	mov    %edi,-0x24(%ebp)
100071b7:	e8 dc f8 ff ff       	call   0x10006a98
100071bc:	85 c0                	test   %eax,%eax
100071be:	59                   	pop    %ecx
100071bf:	75 1d                	jne    0x100071de
100071c1:	ff 4d f0             	decl   -0x10(%ebp)
100071c4:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
100071c8:	39 45 f0             	cmp    %eax,-0x10(%ebp)
100071cb:	7f df                	jg     0x100071ac
100071cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
100071d0:	ff 4d ec             	decl   -0x14(%ebp)
100071d3:	83 c6 10             	add    $0x10,%esi
100071d6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
100071da:	7f bb                	jg     0x10007197
100071dc:	eb 2b                	jmp    0x10007209
100071de:	ff 75 e4             	push   -0x1c(%ebp)
100071e1:	8b 7d fc             	mov    -0x4(%ebp),%edi
100071e4:	ff 75 24             	push   0x24(%ebp)
100071e7:	8b 4d dc             	mov    -0x24(%ebp),%ecx
100071ea:	ff 75 20             	push   0x20(%ebp)
100071ed:	ff 75 18             	push   0x18(%ebp)
100071f0:	ff 75 14             	push   0x14(%ebp)
100071f3:	ff 75 10             	push   0x10(%ebp)
100071f6:	53                   	push   %ebx
100071f7:	8b de                	mov    %esi,%ebx
100071f9:	8b 75 0c             	mov    0xc(%ebp),%esi
100071fc:	e8 57 fd ff ff       	call   0x10006f58
10007201:	8b 5d 08             	mov    0x8(%ebp),%ebx
10007204:	83 c4 1c             	add    $0x1c,%esp
10007207:	8b c7                	mov    %edi,%eax
10007209:	ff 45 f8             	incl   -0x8(%ebp)
1000720c:	8b 4d f8             	mov    -0x8(%ebp),%ecx
1000720f:	83 c0 14             	add    $0x14,%eax
10007212:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
10007215:	89 45 fc             	mov    %eax,-0x4(%ebp)
10007218:	0f 82 5c ff ff ff    	jb     0x1000717a
1000721e:	80 7d 1c 00          	cmpb   $0x0,0x1c(%ebp)
10007222:	74 0a                	je     0x1000722e
10007224:	6a 01                	push   $0x1
10007226:	53                   	push   %ebx
10007227:	e8 a7 f9 ff ff       	call   0x10006bd3
1000722c:	59                   	pop    %ecx
1000722d:	59                   	pop    %ecx
1000722e:	5f                   	pop    %edi
1000722f:	5e                   	pop    %esi
10007230:	5b                   	pop    %ebx
10007231:	c9                   	leave
10007232:	c3                   	ret
10007233:	8b 5d 08             	mov    0x8(%ebp),%ebx
10007236:	80 7d 1c 00          	cmpb   $0x0,0x1c(%ebp)
1000723a:	75 20                	jne    0x1000725c
1000723c:	ff 75 24             	push   0x24(%ebp)
1000723f:	ff 75 20             	push   0x20(%ebp)
10007242:	ff 75 e8             	push   -0x18(%ebp)
10007245:	ff 75 18             	push   0x18(%ebp)
10007248:	ff 75 14             	push   0x14(%ebp)
1000724b:	ff 75 10             	push   0x10(%ebp)
1000724e:	ff 75 0c             	push   0xc(%ebp)
10007251:	53                   	push   %ebx
10007252:	e8 68 fd ff ff       	call   0x10006fbf
10007257:	83 c4 20             	add    $0x20,%esp
1000725a:	eb d2                	jmp    0x1000722e
1000725c:	e9 a2 00 00 00       	jmp    0x10007303
10007261:	55                   	push   %ebp
10007262:	8b ec                	mov    %esp,%ebp
10007264:	56                   	push   %esi
10007265:	8b 75 18             	mov    0x18(%ebp),%esi
10007268:	8b 06                	mov    (%esi),%eax
1000726a:	57                   	push   %edi
1000726b:	25 ff ff ff 1f       	and    $0x1fffffff,%eax
10007270:	bf 20 05 93 19       	mov    $0x19930520,%edi
10007275:	3b c7                	cmp    %edi,%eax
10007277:	74 05                	je     0x1000727e
10007279:	e8 ba 00 00 00       	call   0x10007338
1000727e:	8b 45 08             	mov    0x8(%ebp),%eax
10007281:	f6 40 04 66          	testb  $0x66,0x4(%eax)
10007285:	74 1f                	je     0x100072a6
10007287:	83 7e 04 00          	cmpl   $0x0,0x4(%esi)
1000728b:	74 6f                	je     0x100072fc
1000728d:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
10007291:	75 69                	jne    0x100072fc
10007293:	6a ff                	push   $0xffffffff
10007295:	56                   	push   %esi
10007296:	ff 75 14             	push   0x14(%ebp)
10007299:	ff 75 0c             	push   0xc(%ebp)
1000729c:	e8 64 f8 ff ff       	call   0x10006b05
100072a1:	83 c4 10             	add    $0x10,%esp
100072a4:	eb 56                	jmp    0x100072fc
100072a6:	83 7e 0c 00          	cmpl   $0x0,0xc(%esi)
100072aa:	74 50                	je     0x100072fc
100072ac:	81 38 63 73 6d e0    	cmpl   $0xe06d7363,(%eax)
100072b2:	75 2c                	jne    0x100072e0
100072b4:	39 78 14             	cmp    %edi,0x14(%eax)
100072b7:	76 27                	jbe    0x100072e0
100072b9:	8b 48 1c             	mov    0x1c(%eax),%ecx
100072bc:	8b 49 08             	mov    0x8(%ecx),%ecx
100072bf:	85 c9                	test   %ecx,%ecx
100072c1:	74 1d                	je     0x100072e0
100072c3:	0f b6 55 24          	movzbl 0x24(%ebp),%edx
100072c7:	52                   	push   %edx
100072c8:	ff 75 20             	push   0x20(%ebp)
100072cb:	ff 75 1c             	push   0x1c(%ebp)
100072ce:	56                   	push   %esi
100072cf:	ff 75 14             	push   0x14(%ebp)
100072d2:	ff 75 10             	push   0x10(%ebp)
100072d5:	ff 75 0c             	push   0xc(%ebp)
100072d8:	50                   	push   %eax
100072d9:	ff d1                	call   *%ecx
100072db:	83 c4 20             	add    $0x20,%esp
100072de:	eb 1f                	jmp    0x100072ff
100072e0:	ff 75 20             	push   0x20(%ebp)
100072e3:	ff 75 1c             	push   0x1c(%ebp)
100072e6:	ff 75 24             	push   0x24(%ebp)
100072e9:	56                   	push   %esi
100072ea:	ff 75 14             	push   0x14(%ebp)
100072ed:	ff 75 10             	push   0x10(%ebp)
100072f0:	ff 75 0c             	push   0xc(%ebp)
100072f3:	50                   	push   %eax
100072f4:	e8 86 fd ff ff       	call   0x1000707f
100072f9:	83 c4 20             	add    $0x20,%esp
100072fc:	33 c0                	xor    %eax,%eax
100072fe:	40                   	inc    %eax
100072ff:	5f                   	pop    %edi
10007300:	5e                   	pop    %esi
10007301:	5d                   	pop    %ebp
10007302:	c3                   	ret
10007303:	6a 08                	push   $0x8
10007305:	68 f0 c3 00 10       	push   $0x1000c3f0
1000730a:	e8 a5 0a 00 00       	call   0x10007db4
1000730f:	e8 82 00 00 00       	call   0x10007396
10007314:	83 78 6c 00          	cmpl   $0x0,0x6c(%eax)
10007318:	74 19                	je     0x10007333
1000731a:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
1000731e:	e8 73 00 00 00       	call   0x10007396
10007323:	ff 50 6c             	call   *0x6c(%eax)
10007326:	eb 07                	jmp    0x1000732f
10007328:	33 c0                	xor    %eax,%eax
1000732a:	40                   	inc    %eax
1000732b:	c3                   	ret
1000732c:	8b 65 e8             	mov    -0x18(%ebp),%esp
1000732f:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
10007333:	e9 16 24 00 00       	jmp    0x1000974e
10007338:	6a 08                	push   $0x8
1000733a:	68 00 c4 00 10       	push   $0x1000c400
1000733f:	e8 70 0a 00 00       	call   0x10007db4
10007344:	a1 54 f1 00 10       	mov    0x1000f154,%eax
10007349:	85 c0                	test   %eax,%eax
1000734b:	74 13                	je     0x10007360
1000734d:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
10007351:	ff d0                	call   *%eax
10007353:	eb 07                	jmp    0x1000735c
10007355:	33 c0                	xor    %eax,%eax
10007357:	40                   	inc    %eax
10007358:	c3                   	ret
10007359:	8b 65 e8             	mov    -0x18(%ebp),%esp
1000735c:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
10007360:	e9 9e ff ff ff       	jmp    0x10007303
10007365:	e8 17 04 00 00       	call   0x10007781
1000736a:	a1 58 f1 00 10       	mov    0x1000f158,%eax
1000736f:	83 f8 ff             	cmp    $0xffffffff,%eax
10007372:	74 0e                	je     0x10007382
10007374:	50                   	push   %eax
10007375:	ff 15 40 c0 00 10    	call   *0x1000c040  ; 0x1000c040=KERNEL32.dll!TlsFree
1000737b:	83 0d 58 f1 00 10 ff 	orl    $0xffffffff,0x1000f158
10007382:	c3                   	ret
10007383:	8b 44 24 04          	mov    0x4(%esp),%eax
10007387:	c7 40 54 d8 f4 00 10 	movl   $0x1000f4d8,0x54(%eax)
1000738e:	c7 40 14 01 00 00 00 	movl   $0x1,0x14(%eax)
10007395:	c3                   	ret
10007396:	53                   	push   %ebx
10007397:	56                   	push   %esi
10007398:	ff 15 4c c0 00 10    	call   *0x1000c04c  ; 0x1000c04c=KERNEL32.dll!GetLastError
1000739e:	ff 35 58 f1 00 10    	push   0x1000f158
100073a4:	8b d8                	mov    %eax,%ebx
100073a6:	ff 15 48 c0 00 10    	call   *0x1000c048  ; 0x1000c048=KERNEL32.dll!TlsGetValue
100073ac:	8b f0                	mov    %eax,%esi
100073ae:	85 f6                	test   %esi,%esi
100073b0:	75 49                	jne    0x100073fb
100073b2:	68 88 00 00 00       	push   $0x88
100073b7:	6a 01                	push   $0x1
100073b9:	e8 dc 0b 00 00       	call   0x10007f9a
100073be:	8b f0                	mov    %eax,%esi
100073c0:	85 f6                	test   %esi,%esi
100073c2:	59                   	pop    %ecx
100073c3:	59                   	pop    %ecx
100073c4:	74 2d                	je     0x100073f3
100073c6:	56                   	push   %esi
100073c7:	ff 35 58 f1 00 10    	push   0x1000f158
100073cd:	ff 15 28 c0 00 10    	call   *0x1000c028  ; 0x1000c028=KERNEL32.dll!TlsSetValue
100073d3:	85 c0                	test   %eax,%eax
100073d5:	74 1c                	je     0x100073f3
100073d7:	c7 46 54 d8 f4 00 10 	movl   $0x1000f4d8,0x54(%esi)
100073de:	c7 46 14 01 00 00 00 	movl   $0x1,0x14(%esi)
100073e5:	ff 15 24 c0 00 10    	call   *0x1000c024  ; 0x1000c024=KERNEL32.dll!GetCurrentThreadId
100073eb:	83 4e 04 ff          	orl    $0xffffffff,0x4(%esi)
100073ef:	89 06                	mov    %eax,(%esi)
100073f1:	eb 08                	jmp    0x100073fb
100073f3:	6a 10                	push   $0x10
100073f5:	e8 de ef ff ff       	call   0x100063d8
100073fa:	59                   	pop    %ecx
100073fb:	53                   	push   %ebx
100073fc:	ff 15 44 c0 00 10    	call   *0x1000c044  ; 0x1000c044=KERNEL32.dll!SetLastError
10007402:	8b c6                	mov    %esi,%eax
10007404:	5e                   	pop    %esi
10007405:	5b                   	pop    %ebx
10007406:	c3                   	ret
10007407:	6a 10                	push   $0x10
10007409:	68 10 c4 00 10       	push   $0x1000c410
1000740e:	e8 a1 09 00 00       	call   0x10007db4
10007413:	a1 58 f1 00 10       	mov    0x1000f158,%eax
10007418:	83 f8 ff             	cmp    $0xffffffff,%eax
1000741b:	0f 84 33 01 00 00    	je     0x10007554
10007421:	8b 75 08             	mov    0x8(%ebp),%esi
10007424:	85 f6                	test   %esi,%esi
10007426:	75 14                	jne    0x1000743c
10007428:	50                   	push   %eax
10007429:	ff 15 48 c0 00 10    	call   *0x1000c048  ; 0x1000c048=KERNEL32.dll!TlsGetValue
1000742f:	8b f0                	mov    %eax,%esi
10007431:	89 75 08             	mov    %esi,0x8(%ebp)
10007434:	85 f6                	test   %esi,%esi
10007436:	0f 84 0a 01 00 00    	je     0x10007546
1000743c:	8b 46 24             	mov    0x24(%esi),%eax
1000743f:	85 c0                	test   %eax,%eax
10007441:	74 07                	je     0x1000744a
10007443:	50                   	push   %eax
10007444:	e8 78 f5 ff ff       	call   0x100069c1
10007449:	59                   	pop    %ecx
1000744a:	8b 46 2c             	mov    0x2c(%esi),%eax
1000744d:	85 c0                	test   %eax,%eax
1000744f:	74 07                	je     0x10007458
10007451:	50                   	push   %eax
10007452:	e8 6a f5 ff ff       	call   0x100069c1
10007457:	59                   	pop    %ecx
10007458:	8b 46 34             	mov    0x34(%esi),%eax
1000745b:	85 c0                	test   %eax,%eax
1000745d:	74 07                	je     0x10007466
1000745f:	50                   	push   %eax
10007460:	e8 5c f5 ff ff       	call   0x100069c1
10007465:	59                   	pop    %ecx
10007466:	8b 46 3c             	mov    0x3c(%esi),%eax
10007469:	85 c0                	test   %eax,%eax
1000746b:	74 07                	je     0x10007474
1000746d:	50                   	push   %eax
1000746e:	e8 4e f5 ff ff       	call   0x100069c1
10007473:	59                   	pop    %ecx
10007474:	8b 46 44             	mov    0x44(%esi),%eax
10007477:	85 c0                	test   %eax,%eax
10007479:	74 07                	je     0x10007482
1000747b:	50                   	push   %eax
1000747c:	e8 40 f5 ff ff       	call   0x100069c1
10007481:	59                   	pop    %ecx
10007482:	8b 46 48             	mov    0x48(%esi),%eax
10007485:	85 c0                	test   %eax,%eax
10007487:	74 07                	je     0x10007490
10007489:	50                   	push   %eax
1000748a:	e8 32 f5 ff ff       	call   0x100069c1
1000748f:	59                   	pop    %ecx
10007490:	8b 46 54             	mov    0x54(%esi),%eax
10007493:	3d d8 f4 00 10       	cmp    $0x1000f4d8,%eax
10007498:	74 07                	je     0x100074a1
1000749a:	50                   	push   %eax
1000749b:	e8 21 f5 ff ff       	call   0x100069c1
100074a0:	59                   	pop    %ecx
100074a1:	6a 0d                	push   $0xd
100074a3:	e8 c2 03 00 00       	call   0x1000786a
100074a8:	59                   	pop    %ecx
100074a9:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
100074ad:	8b 46 60             	mov    0x60(%esi),%eax
100074b0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
100074b3:	85 c0                	test   %eax,%eax
100074b5:	74 13                	je     0x100074ca
100074b7:	ff 08                	decl   (%eax)
100074b9:	75 0f                	jne    0x100074ca
100074bb:	3b 05 84 00 01 10    	cmp    0x10010084,%eax
100074c1:	74 07                	je     0x100074ca
100074c3:	50                   	push   %eax
100074c4:	e8 f8 f4 ff ff       	call   0x100069c1
100074c9:	59                   	pop    %ecx
100074ca:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
100074ce:	e8 8a 00 00 00       	call   0x1000755d
100074d3:	6a 0c                	push   $0xc
100074d5:	e8 90 03 00 00       	call   0x1000786a
100074da:	59                   	pop    %ecx
100074db:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
100074e2:	8b 46 64             	mov    0x64(%esi),%eax
100074e5:	89 45 e0             	mov    %eax,-0x20(%ebp)
100074e8:	85 c0                	test   %eax,%eax
100074ea:	74 4a                	je     0x10007536
100074ec:	ff 08                	decl   (%eax)
100074ee:	8b 48 2c             	mov    0x2c(%eax),%ecx
100074f1:	85 c9                	test   %ecx,%ecx
100074f3:	74 02                	je     0x100074f7
100074f5:	ff 09                	decl   (%ecx)
100074f7:	8b 48 34             	mov    0x34(%eax),%ecx
100074fa:	85 c9                	test   %ecx,%ecx
100074fc:	74 02                	je     0x10007500
100074fe:	ff 09                	decl   (%ecx)
10007500:	8b 48 30             	mov    0x30(%eax),%ecx
10007503:	85 c9                	test   %ecx,%ecx
10007505:	74 02                	je     0x10007509
10007507:	ff 09                	decl   (%ecx)
10007509:	8b 48 40             	mov    0x40(%eax),%ecx
1000750c:	85 c9                	test   %ecx,%ecx
1000750e:	74 02                	je     0x10007512
10007510:	ff 09                	decl   (%ecx)
10007512:	8b 48 4c             	mov    0x4c(%eax),%ecx
10007515:	ff 89 b4 00 00 00    	decl   0xb4(%ecx)
1000751b:	3b 05 dc f2 00 10    	cmp    0x1000f2dc,%eax
10007521:	74 13                	je     0x10007536
10007523:	3d 88 f2 00 10       	cmp    $0x1000f288,%eax
10007528:	74 0c                	je     0x10007536
1000752a:	83 38 00             	cmpl   $0x0,(%eax)
1000752d:	75 07                	jne    0x10007536
1000752f:	50                   	push   %eax
10007530:	e8 da 04 00 00       	call   0x10007a0f
10007535:	59                   	pop    %ecx
10007536:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
1000753a:	e8 2a 00 00 00       	call   0x10007569
1000753f:	56                   	push   %esi
10007540:	e8 7c f4 ff ff       	call   0x100069c1
10007545:	59                   	pop    %ecx
10007546:	6a 00                	push   $0x0
10007548:	ff 35 58 f1 00 10    	push   0x1000f158
1000754e:	ff 15 28 c0 00 10    	call   *0x1000c028  ; 0x1000c028=KERNEL32.dll!TlsSetValue
10007554:	e8 96 08 00 00       	call   0x10007def
10007559:	c3                   	ret
1000755a:	8b 75 08             	mov    0x8(%ebp),%esi
1000755d:	6a 0d                	push   $0xd
1000755f:	e8 72 02 00 00       	call   0x100077d6
10007564:	59                   	pop    %ecx
10007565:	c3                   	ret
10007566:	8b 75 08             	mov    0x8(%ebp),%esi
10007569:	6a 0c                	push   $0xc
1000756b:	e8 66 02 00 00       	call   0x100077d6
10007570:	59                   	pop    %ecx
10007571:	c3                   	ret
10007572:	e8 c1 01 00 00       	call   0x10007738
10007577:	85 c0                	test   %eax,%eax
10007579:	74 10                	je     0x1000758b
1000757b:	ff 15 50 c0 00 10    	call   *0x1000c050  ; 0x1000c050=KERNEL32.dll!TlsAlloc
10007581:	83 f8 ff             	cmp    $0xffffffff,%eax
10007584:	a3 58 f1 00 10       	mov    %eax,0x1000f158
10007589:	75 08                	jne    0x10007593
1000758b:	e8 d5 fd ff ff       	call   0x10007365
10007590:	33 c0                	xor    %eax,%eax
10007592:	c3                   	ret
10007593:	56                   	push   %esi
10007594:	68 88 00 00 00       	push   $0x88
10007599:	6a 01                	push   $0x1
1000759b:	e8 fa 09 00 00       	call   0x10007f9a
100075a0:	8b f0                	mov    %eax,%esi
100075a2:	85 f6                	test   %esi,%esi
100075a4:	59                   	pop    %ecx
100075a5:	59                   	pop    %ecx
100075a6:	74 30                	je     0x100075d8
100075a8:	56                   	push   %esi
100075a9:	ff 35 58 f1 00 10    	push   0x1000f158
100075af:	ff 15 28 c0 00 10    	call   *0x1000c028  ; 0x1000c028=KERNEL32.dll!TlsSetValue
100075b5:	85 c0                	test   %eax,%eax
100075b7:	74 1f                	je     0x100075d8
100075b9:	c7 46 54 d8 f4 00 10 	movl   $0x1000f4d8,0x54(%esi)
100075c0:	c7 46 14 01 00 00 00 	movl   $0x1,0x14(%esi)
100075c7:	ff 15 24 c0 00 10    	call   *0x1000c024  ; 0x1000c024=KERNEL32.dll!GetCurrentThreadId
100075cd:	83 4e 04 ff          	orl    $0xffffffff,0x4(%esi)
100075d1:	89 06                	mov    %eax,(%esi)
100075d3:	33 c0                	xor    %eax,%eax
100075d5:	40                   	inc    %eax
100075d6:	5e                   	pop    %esi
100075d7:	c3                   	ret
100075d8:	e8 88 fd ff ff       	call   0x10007365
100075dd:	33 c0                	xor    %eax,%eax
100075df:	5e                   	pop    %esi
100075e0:	c3                   	ret
100075e1:	cc                   	int3
100075e2:	cc                   	int3
100075e3:	cc                   	int3
100075e4:	cc                   	int3
100075e5:	cc                   	int3
100075e6:	cc                   	int3
100075e7:	cc                   	int3
100075e8:	cc                   	int3
100075e9:	cc                   	int3
100075ea:	cc                   	int3
100075eb:	cc                   	int3
100075ec:	cc                   	int3
100075ed:	cc                   	int3
100075ee:	cc                   	int3
100075ef:	cc                   	int3
100075f0:	55                   	push   %ebp
100075f1:	8b ec                	mov    %esp,%ebp
100075f3:	83 ec 04             	sub    $0x4,%esp
100075f6:	53                   	push   %ebx
100075f7:	51                   	push   %ecx
100075f8:	8b 45 0c             	mov    0xc(%ebp),%eax
100075fb:	83 c0 0c             	add    $0xc,%eax
100075fe:	89 45 fc             	mov    %eax,-0x4(%ebp)
10007601:	8b 45 08             	mov    0x8(%ebp),%eax
10007604:	55                   	push   %ebp
10007605:	ff 75 10             	push   0x10(%ebp)
10007608:	8b 4d 10             	mov    0x10(%ebp),%ecx
1000760b:	8b 6d fc             	mov    -0x4(%ebp),%ebp
1000760e:	e8 3a e8 ff ff       	call   0x10005e4d
10007613:	56                   	push   %esi
10007614:	57                   	push   %edi
10007615:	ff d0                	call   *%eax
10007617:	5f                   	pop    %edi
10007618:	5e                   	pop    %esi
10007619:	8b dd                	mov    %ebp,%ebx
1000761b:	5d                   	pop    %ebp
1000761c:	8b 4d 10             	mov    0x10(%ebp),%ecx
1000761f:	55                   	push   %ebp
10007620:	8b eb                	mov    %ebx,%ebp
10007622:	81 f9 00 01 00 00    	cmp    $0x100,%ecx
10007628:	75 05                	jne    0x1000762f
1000762a:	b9 02 00 00 00       	mov    $0x2,%ecx
1000762f:	51                   	push   %ecx
10007630:	e8 18 e8 ff ff       	call   0x10005e4d
10007635:	5d                   	pop    %ebp
10007636:	59                   	pop    %ecx
10007637:	5b                   	pop    %ebx
10007638:	c9                   	leave
10007639:	c2 0c 00             	ret    $0xc
1000763c:	cc                   	int3
1000763d:	cc                   	int3
1000763e:	cc                   	int3
1000763f:	cc                   	int3
10007640:	57                   	push   %edi
10007641:	8b 7c 24 08          	mov    0x8(%esp),%edi
10007645:	eb 6e                	jmp    0x100076b5
10007647:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
1000764e:	8b ff                	mov    %edi,%edi
10007650:	8b 4c 24 04          	mov    0x4(%esp),%ecx
10007654:	57                   	push   %edi
10007655:	f7 c1 03 00 00 00    	test   $0x3,%ecx
1000765b:	74 13                	je     0x10007670
1000765d:	8a 01                	mov    (%ecx),%al
1000765f:	83 c1 01             	add    $0x1,%ecx
10007662:	84 c0                	test   %al,%al
10007664:	74 3d                	je     0x100076a3
10007666:	f7 c1 03 00 00 00    	test   $0x3,%ecx
1000766c:	75 ef                	jne    0x1000765d
1000766e:	8b ff                	mov    %edi,%edi
10007670:	8b 01                	mov    (%ecx),%eax
10007672:	ba ff fe fe 7e       	mov    $0x7efefeff,%edx
10007677:	03 d0                	add    %eax,%edx
10007679:	83 f0 ff             	xor    $0xffffffff,%eax
1000767c:	33 c2                	xor    %edx,%eax
1000767e:	83 c1 04             	add    $0x4,%ecx
10007681:	a9 00 01 01 81       	test   $0x81010100,%eax
10007686:	74 e8                	je     0x10007670
10007688:	8b 41 fc             	mov    -0x4(%ecx),%eax
1000768b:	84 c0                	test   %al,%al
1000768d:	74 23                	je     0x100076b2
1000768f:	84 e4                	test   %ah,%ah
10007691:	74 1a                	je     0x100076ad
10007693:	a9 00 00 ff 00       	test   $0xff0000,%eax
10007698:	74 0e                	je     0x100076a8
1000769a:	a9 00 00 00 ff       	test   $0xff000000,%eax
1000769f:	74 02                	je     0x100076a3
100076a1:	eb cd                	jmp    0x10007670
100076a3:	8d 79 ff             	lea    -0x1(%ecx),%edi
100076a6:	eb 0d                	jmp    0x100076b5
100076a8:	8d 79 fe             	lea    -0x2(%ecx),%edi
100076ab:	eb 08                	jmp    0x100076b5
100076ad:	8d 79 fd             	lea    -0x3(%ecx),%edi
100076b0:	eb 03                	jmp    0x100076b5
100076b2:	8d 79 fc             	lea    -0x4(%ecx),%edi
100076b5:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
100076b9:	f7 c1 03 00 00 00    	test   $0x3,%ecx
100076bf:	74 1d                	je     0x100076de
100076c1:	8a 11                	mov    (%ecx),%dl
100076c3:	83 c1 01             	add    $0x1,%ecx
100076c6:	84 d2                	test   %dl,%dl
100076c8:	74 66                	je     0x10007730
100076ca:	88 17                	mov    %dl,(%edi)
100076cc:	83 c7 01             	add    $0x1,%edi
100076cf:	f7 c1 03 00 00 00    	test   $0x3,%ecx
100076d5:	75 ea                	jne    0x100076c1
100076d7:	eb 05                	jmp    0x100076de
100076d9:	89 17                	mov    %edx,(%edi)
100076db:	83 c7 04             	add    $0x4,%edi
100076de:	ba ff fe fe 7e       	mov    $0x7efefeff,%edx
100076e3:	8b 01                	mov    (%ecx),%eax
100076e5:	03 d0                	add    %eax,%edx
100076e7:	83 f0 ff             	xor    $0xffffffff,%eax
100076ea:	33 c2                	xor    %edx,%eax
100076ec:	8b 11                	mov    (%ecx),%edx
100076ee:	83 c1 04             	add    $0x4,%ecx
100076f1:	a9 00 01 01 81       	test   $0x81010100,%eax
100076f6:	74 e1                	je     0x100076d9
100076f8:	84 d2                	test   %dl,%dl
100076fa:	74 34                	je     0x10007730
100076fc:	84 f6                	test   %dh,%dh
100076fe:	74 27                	je     0x10007727
10007700:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
10007706:	74 12                	je     0x1000771a
10007708:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
1000770e:	74 02                	je     0x10007712
10007710:	eb c7                	jmp    0x100076d9
10007712:	89 17                	mov    %edx,(%edi)
10007714:	8b 44 24 08          	mov    0x8(%esp),%eax
10007718:	5f                   	pop    %edi
10007719:	c3                   	ret
1000771a:	66 89 17             	mov    %dx,(%edi)
1000771d:	8b 44 24 08          	mov    0x8(%esp),%eax
10007721:	c6 47 02 00          	movb   $0x0,0x2(%edi)
10007725:	5f                   	pop    %edi
10007726:	c3                   	ret
10007727:	66 89 17             	mov    %dx,(%edi)
1000772a:	8b 44 24 08          	mov    0x8(%esp),%eax
1000772e:	5f                   	pop    %edi
1000772f:	c3                   	ret
10007730:	88 17                	mov    %dl,(%edi)
10007732:	8b 44 24 08          	mov    0x8(%esp),%eax
10007736:	5f                   	pop    %edi
10007737:	c3                   	ret
10007738:	56                   	push   %esi
10007739:	57                   	push   %edi
1000773a:	33 f6                	xor    %esi,%esi
1000773c:	bf 40 fc 00 10       	mov    $0x1000fc40,%edi
10007741:	83 3c f5 64 f1 00 10 	cmpl   $0x1,0x1000f164(,%esi,8)
10007748:	01 
10007749:	75 1e                	jne    0x10007769
1000774b:	8d 04 f5 60 f1 00 10 	lea    0x1000f160(,%esi,8),%eax
10007752:	89 38                	mov    %edi,(%eax)
10007754:	68 a0 0f 00 00       	push   $0xfa0
10007759:	ff 30                	push   (%eax)
1000775b:	83 c7 18             	add    $0x18,%edi
1000775e:	e8 01 25 00 00       	call   0x10009c64
10007763:	85 c0                	test   %eax,%eax
10007765:	59                   	pop    %ecx
10007766:	59                   	pop    %ecx
10007767:	74 0c                	je     0x10007775
10007769:	46                   	inc    %esi
1000776a:	83 fe 24             	cmp    $0x24,%esi
1000776d:	7c d2                	jl     0x10007741
1000776f:	33 c0                	xor    %eax,%eax
10007771:	40                   	inc    %eax
10007772:	5f                   	pop    %edi
10007773:	5e                   	pop    %esi
10007774:	c3                   	ret
10007775:	83 24 f5 60 f1 00 10 	andl   $0x0,0x1000f160(,%esi,8)
1000777c:	00 
1000777d:	33 c0                	xor    %eax,%eax
1000777f:	eb f1                	jmp    0x10007772
10007781:	53                   	push   %ebx
10007782:	8b 1d 54 c0 00 10    	mov    0x1000c054,%ebx  ; 0x1000c054=KERNEL32.dll!DeleteCriticalSection
10007788:	56                   	push   %esi
10007789:	be 60 f1 00 10       	mov    $0x1000f160,%esi
1000778e:	57                   	push   %edi
1000778f:	8b 3e                	mov    (%esi),%edi
10007791:	85 ff                	test   %edi,%edi
10007793:	74 13                	je     0x100077a8
10007795:	83 7e 04 01          	cmpl   $0x1,0x4(%esi)
10007799:	74 0d                	je     0x100077a8
1000779b:	57                   	push   %edi
1000779c:	ff d3                	call   *%ebx
1000779e:	57                   	push   %edi
1000779f:	e8 1d f2 ff ff       	call   0x100069c1
100077a4:	83 26 00             	andl   $0x0,(%esi)
100077a7:	59                   	pop    %ecx
100077a8:	83 c6 08             	add    $0x8,%esi
100077ab:	81 fe 80 f2 00 10    	cmp    $0x1000f280,%esi
100077b1:	7c dc                	jl     0x1000778f
100077b3:	be 60 f1 00 10       	mov    $0x1000f160,%esi
100077b8:	5f                   	pop    %edi
100077b9:	8b 06                	mov    (%esi),%eax
100077bb:	85 c0                	test   %eax,%eax
100077bd:	74 09                	je     0x100077c8
100077bf:	83 7e 04 01          	cmpl   $0x1,0x4(%esi)
100077c3:	75 03                	jne    0x100077c8
100077c5:	50                   	push   %eax
100077c6:	ff d3                	call   *%ebx
100077c8:	83 c6 08             	add    $0x8,%esi
100077cb:	81 fe 80 f2 00 10    	cmp    $0x1000f280,%esi
100077d1:	7c e6                	jl     0x100077b9
100077d3:	5e                   	pop    %esi
100077d4:	5b                   	pop    %ebx
100077d5:	c3                   	ret
100077d6:	55                   	push   %ebp
100077d7:	8b ec                	mov    %esp,%ebp
100077d9:	8b 45 08             	mov    0x8(%ebp),%eax
100077dc:	ff 34 c5 60 f1 00 10 	push   0x1000f160(,%eax,8)
100077e3:	ff 15 58 c0 00 10    	call   *0x1000c058  ; 0x1000c058=KERNEL32.dll!LeaveCriticalSection
100077e9:	5d                   	pop    %ebp
100077ea:	c3                   	ret
100077eb:	55                   	push   %ebp
100077ec:	8b ec                	mov    %esp,%ebp
100077ee:	56                   	push   %esi
100077ef:	8b 75 08             	mov    0x8(%ebp),%esi
100077f2:	8d 34 f5 60 f1 00 10 	lea    0x1000f160(,%esi,8),%esi
100077f9:	83 3e 00             	cmpl   $0x0,(%esi)
100077fc:	74 05                	je     0x10007803
100077fe:	33 c0                	xor    %eax,%eax
10007800:	40                   	inc    %eax
10007801:	eb 64                	jmp    0x10007867
10007803:	57                   	push   %edi
10007804:	6a 18                	push   $0x18
10007806:	e8 a7 ec ff ff       	call   0x100064b2
1000780b:	8b f8                	mov    %eax,%edi
1000780d:	85 ff                	test   %edi,%edi
1000780f:	59                   	pop    %ecx
10007810:	75 0f                	jne    0x10007821
10007812:	e8 d8 24 00 00       	call   0x10009cef
10007817:	c7 00 0c 00 00 00    	movl   $0xc,(%eax)
1000781d:	33 c0                	xor    %eax,%eax
1000781f:	eb 45                	jmp    0x10007866
10007821:	6a 0a                	push   $0xa
10007823:	e8 42 00 00 00       	call   0x1000786a
10007828:	83 3e 00             	cmpl   $0x0,(%esi)
1000782b:	59                   	pop    %ecx
1000782c:	75 26                	jne    0x10007854
1000782e:	68 a0 0f 00 00       	push   $0xfa0
10007833:	57                   	push   %edi
10007834:	e8 2b 24 00 00       	call   0x10009c64
10007839:	85 c0                	test   %eax,%eax
1000783b:	59                   	pop    %ecx
1000783c:	59                   	pop    %ecx
1000783d:	75 11                	jne    0x10007850
1000783f:	57                   	push   %edi
10007840:	e8 7c f1 ff ff       	call   0x100069c1
10007845:	6a 0a                	push   $0xa
10007847:	e8 8a ff ff ff       	call   0x100077d6
1000784c:	59                   	pop    %ecx
1000784d:	59                   	pop    %ecx
1000784e:	eb c2                	jmp    0x10007812
10007850:	89 3e                	mov    %edi,(%esi)
10007852:	eb 07                	jmp    0x1000785b
10007854:	57                   	push   %edi
10007855:	e8 67 f1 ff ff       	call   0x100069c1
1000785a:	59                   	pop    %ecx
1000785b:	6a 0a                	push   $0xa
1000785d:	e8 74 ff ff ff       	call   0x100077d6
10007862:	33 c0                	xor    %eax,%eax
10007864:	59                   	pop    %ecx
10007865:	40                   	inc    %eax
10007866:	5f                   	pop    %edi
10007867:	5e                   	pop    %esi
10007868:	5d                   	pop    %ebp
10007869:	c3                   	ret
1000786a:	55                   	push   %ebp
1000786b:	8b ec                	mov    %esp,%ebp
1000786d:	8b 45 08             	mov    0x8(%ebp),%eax
10007870:	56                   	push   %esi
10007871:	8d 34 c5 60 f1 00 10 	lea    0x1000f160(,%eax,8),%esi
10007878:	83 3e 00             	cmpl   $0x0,(%esi)
1000787b:	75 13                	jne    0x10007890
1000787d:	50                   	push   %eax
1000787e:	e8 68 ff ff ff       	call   0x100077eb
10007883:	85 c0                	test   %eax,%eax
10007885:	59                   	pop    %ecx
10007886:	75 08                	jne    0x10007890
10007888:	6a 11                	push   $0x11
1000788a:	e8 49 eb ff ff       	call   0x100063d8
1000788f:	59                   	pop    %ecx
10007890:	ff 36                	push   (%esi)
10007892:	ff 15 5c c0 00 10    	call   *0x1000c05c  ; 0x1000c05c=KERNEL32.dll!EnterCriticalSection
10007898:	5e                   	pop    %esi
10007899:	5d                   	pop    %ebp
1000789a:	c3                   	ret
1000789b:	cc                   	int3
1000789c:	cc                   	int3
1000789d:	cc                   	int3
1000789e:	cc                   	int3
1000789f:	cc                   	int3
100078a0:	8b 54 24 04          	mov    0x4(%esp),%edx
100078a4:	8b 4c 24 08          	mov    0x8(%esp),%ecx
100078a8:	f7 c2 03 00 00 00    	test   $0x3,%edx
100078ae:	75 3c                	jne    0x100078ec
100078b0:	8b 02                	mov    (%edx),%eax
100078b2:	3a 01                	cmp    (%ecx),%al
100078b4:	75 2e                	jne    0x100078e4
100078b6:	0a c0                	or     %al,%al
100078b8:	74 26                	je     0x100078e0
100078ba:	3a 61 01             	cmp    0x1(%ecx),%ah
100078bd:	75 25                	jne    0x100078e4
100078bf:	0a e4                	or     %ah,%ah
100078c1:	74 1d                	je     0x100078e0
100078c3:	c1 e8 10             	shr    $0x10,%eax
100078c6:	3a 41 02             	cmp    0x2(%ecx),%al
100078c9:	75 19                	jne    0x100078e4
100078cb:	0a c0                	or     %al,%al
100078cd:	74 11                	je     0x100078e0
100078cf:	3a 61 03             	cmp    0x3(%ecx),%ah
100078d2:	75 10                	jne    0x100078e4
100078d4:	83 c1 04             	add    $0x4,%ecx
100078d7:	83 c2 04             	add    $0x4,%edx
100078da:	0a e4                	or     %ah,%ah
100078dc:	75 d2                	jne    0x100078b0
100078de:	8b ff                	mov    %edi,%edi
100078e0:	33 c0                	xor    %eax,%eax
100078e2:	c3                   	ret
100078e3:	90                   	nop
100078e4:	1b c0                	sbb    %eax,%eax
100078e6:	d1 e0                	shl    $1,%eax
100078e8:	83 c0 01             	add    $0x1,%eax
100078eb:	c3                   	ret
100078ec:	f7 c2 01 00 00 00    	test   $0x1,%edx
100078f2:	74 18                	je     0x1000790c
100078f4:	8a 02                	mov    (%edx),%al
100078f6:	83 c2 01             	add    $0x1,%edx
100078f9:	3a 01                	cmp    (%ecx),%al
100078fb:	75 e7                	jne    0x100078e4
100078fd:	83 c1 01             	add    $0x1,%ecx
10007900:	0a c0                	or     %al,%al
10007902:	74 dc                	je     0x100078e0
10007904:	f7 c2 02 00 00 00    	test   $0x2,%edx
1000790a:	74 a4                	je     0x100078b0
1000790c:	66 8b 02             	mov    (%edx),%ax
1000790f:	83 c2 02             	add    $0x2,%edx
10007912:	3a 01                	cmp    (%ecx),%al
10007914:	75 ce                	jne    0x100078e4
10007916:	0a c0                	or     %al,%al
10007918:	74 c6                	je     0x100078e0
1000791a:	3a 61 01             	cmp    0x1(%ecx),%ah
1000791d:	75 c5                	jne    0x100078e4
1000791f:	0a e4                	or     %ah,%ah
10007921:	74 bd                	je     0x100078e0
10007923:	83 c1 02             	add    $0x2,%ecx
10007926:	eb 88                	jmp    0x100078b0
10007928:	cc                   	int3
10007929:	cc                   	int3
1000792a:	cc                   	int3
1000792b:	cc                   	int3
1000792c:	cc                   	int3
1000792d:	cc                   	int3
1000792e:	cc                   	int3
1000792f:	cc                   	int3
10007930:	53                   	push   %ebx
10007931:	56                   	push   %esi
10007932:	8b 44 24 18          	mov    0x18(%esp),%eax
10007936:	0b c0                	or     %eax,%eax
10007938:	75 18                	jne    0x10007952
1000793a:	8b 4c 24 14          	mov    0x14(%esp),%ecx
1000793e:	8b 44 24 10          	mov    0x10(%esp),%eax
10007942:	33 d2                	xor    %edx,%edx
10007944:	f7 f1                	div    %ecx
10007946:	8b d8                	mov    %eax,%ebx
10007948:	8b 44 24 0c          	mov    0xc(%esp),%eax
1000794c:	f7 f1                	div    %ecx
1000794e:	8b d3                	mov    %ebx,%edx
10007950:	eb 41                	jmp    0x10007993
10007952:	8b c8                	mov    %eax,%ecx
10007954:	8b 5c 24 14          	mov    0x14(%esp),%ebx
10007958:	8b 54 24 10          	mov    0x10(%esp),%edx
1000795c:	8b 44 24 0c          	mov    0xc(%esp),%eax
10007960:	d1 e9                	shr    $1,%ecx
10007962:	d1 db                	rcr    $1,%ebx
10007964:	d1 ea                	shr    $1,%edx
10007966:	d1 d8                	rcr    $1,%eax
10007968:	0b c9                	or     %ecx,%ecx
1000796a:	75 f4                	jne    0x10007960
1000796c:	f7 f3                	div    %ebx
1000796e:	8b f0                	mov    %eax,%esi
10007970:	f7 64 24 18          	mull   0x18(%esp)
10007974:	8b c8                	mov    %eax,%ecx
10007976:	8b 44 24 14          	mov    0x14(%esp),%eax
1000797a:	f7 e6                	mul    %esi
1000797c:	03 d1                	add    %ecx,%edx
1000797e:	72 0e                	jb     0x1000798e
10007980:	3b 54 24 10          	cmp    0x10(%esp),%edx
10007984:	77 08                	ja     0x1000798e
10007986:	72 07                	jb     0x1000798f
10007988:	3b 44 24 0c          	cmp    0xc(%esp),%eax
1000798c:	76 01                	jbe    0x1000798f
1000798e:	4e                   	dec    %esi
1000798f:	33 d2                	xor    %edx,%edx
10007991:	8b c6                	mov    %esi,%eax
10007993:	5e                   	pop    %esi
10007994:	5b                   	pop    %ebx
10007995:	c2 10 00             	ret    $0x10
10007998:	55                   	push   %ebp
10007999:	8b ec                	mov    %esp,%ebp
1000799b:	51                   	push   %ecx
1000799c:	8b 45 0c             	mov    0xc(%ebp),%eax
1000799f:	8d 48 01             	lea    0x1(%eax),%ecx
100079a2:	81 f9 00 01 00 00    	cmp    $0x100,%ecx
100079a8:	8b 4d 08             	mov    0x8(%ebp),%ecx
100079ab:	77 09                	ja     0x100079b6
100079ad:	8b 49 48             	mov    0x48(%ecx),%ecx
100079b0:	0f b7 04 41          	movzwl (%ecx,%eax,2),%eax
100079b4:	eb 54                	jmp    0x10007a0a
100079b6:	56                   	push   %esi
100079b7:	8b d0                	mov    %eax,%edx
100079b9:	c1 fa 08             	sar    $0x8,%edx
100079bc:	57                   	push   %edi
100079bd:	8b 79 48             	mov    0x48(%ecx),%edi
100079c0:	0f b6 f2             	movzbl %dl,%esi
100079c3:	f6 44 77 01 80       	testb  $0x80,0x1(%edi,%esi,2)
100079c8:	5f                   	pop    %edi
100079c9:	5e                   	pop    %esi
100079ca:	74 0f                	je     0x100079db
100079cc:	80 65 fe 00          	andb   $0x0,-0x2(%ebp)
100079d0:	6a 02                	push   $0x2
100079d2:	88 45 fd             	mov    %al,-0x3(%ebp)
100079d5:	88 55 fc             	mov    %dl,-0x4(%ebp)
100079d8:	58                   	pop    %eax
100079d9:	eb 0a                	jmp    0x100079e5
100079db:	80 65 fd 00          	andb   $0x0,-0x3(%ebp)
100079df:	88 45 fc             	mov    %al,-0x4(%ebp)
100079e2:	33 c0                	xor    %eax,%eax
100079e4:	40                   	inc    %eax
100079e5:	6a 01                	push   $0x1
100079e7:	ff 71 14             	push   0x14(%ecx)
100079ea:	ff 71 04             	push   0x4(%ecx)
100079ed:	8d 4d 0e             	lea    0xe(%ebp),%ecx
100079f0:	51                   	push   %ecx
100079f1:	50                   	push   %eax
100079f2:	8d 45 fc             	lea    -0x4(%ebp),%eax
100079f5:	50                   	push   %eax
100079f6:	6a 01                	push   $0x1
100079f8:	e8 fb 22 00 00       	call   0x10009cf8
100079fd:	83 c4 1c             	add    $0x1c,%esp
10007a00:	85 c0                	test   %eax,%eax
10007a02:	75 02                	jne    0x10007a06
10007a04:	c9                   	leave
10007a05:	c3                   	ret
10007a06:	0f b7 45 0e          	movzwl 0xe(%ebp),%eax
10007a0a:	23 45 10             	and    0x10(%ebp),%eax
10007a0d:	c9                   	leave
10007a0e:	c3                   	ret
10007a0f:	56                   	push   %esi
10007a10:	8b 74 24 08          	mov    0x8(%esp),%esi
10007a14:	8b 46 3c             	mov    0x3c(%esi),%eax
10007a17:	57                   	push   %edi
10007a18:	33 ff                	xor    %edi,%edi
10007a1a:	3b 05 10 ff 00 10    	cmp    0x1000ff10,%eax
10007a20:	74 63                	je     0x10007a85
10007a22:	3b c7                	cmp    %edi,%eax
10007a24:	74 5f                	je     0x10007a85
10007a26:	8b 46 2c             	mov    0x2c(%esi),%eax
10007a29:	39 38                	cmp    %edi,(%eax)
10007a2b:	75 58                	jne    0x10007a85
10007a2d:	8b 46 34             	mov    0x34(%esi),%eax
10007a30:	3b c7                	cmp    %edi,%eax
10007a32:	74 1c                	je     0x10007a50
10007a34:	39 38                	cmp    %edi,(%eax)
10007a36:	75 18                	jne    0x10007a50
10007a38:	3b 05 78 00 01 10    	cmp    0x10010078,%eax
10007a3e:	74 10                	je     0x10007a50
10007a40:	50                   	push   %eax
10007a41:	e8 7b ef ff ff       	call   0x100069c1
10007a46:	ff 76 3c             	push   0x3c(%esi)
10007a49:	e8 53 26 00 00       	call   0x1000a0a1
10007a4e:	59                   	pop    %ecx
10007a4f:	59                   	pop    %ecx
10007a50:	8b 46 30             	mov    0x30(%esi),%eax
10007a53:	3b c7                	cmp    %edi,%eax
10007a55:	74 1c                	je     0x10007a73
10007a57:	39 38                	cmp    %edi,(%eax)
10007a59:	75 18                	jne    0x10007a73
10007a5b:	3b 05 7c 00 01 10    	cmp    0x1001007c,%eax
10007a61:	74 10                	je     0x10007a73
10007a63:	50                   	push   %eax
10007a64:	e8 58 ef ff ff       	call   0x100069c1
10007a69:	ff 76 3c             	push   0x3c(%esi)
10007a6c:	e8 d1 25 00 00       	call   0x1000a042
10007a71:	59                   	pop    %ecx
10007a72:	59                   	pop    %ecx
10007a73:	ff 76 2c             	push   0x2c(%esi)
10007a76:	e8 46 ef ff ff       	call   0x100069c1
10007a7b:	ff 76 3c             	push   0x3c(%esi)
10007a7e:	e8 3e ef ff ff       	call   0x100069c1
10007a83:	59                   	pop    %ecx
10007a84:	59                   	pop    %ecx
10007a85:	8b 46 40             	mov    0x40(%esi),%eax
10007a88:	3b 05 74 00 01 10    	cmp    0x10010074,%eax
10007a8e:	74 18                	je     0x10007aa8
10007a90:	3b c7                	cmp    %edi,%eax
10007a92:	74 14                	je     0x10007aa8
10007a94:	39 38                	cmp    %edi,(%eax)
10007a96:	75 10                	jne    0x10007aa8
10007a98:	50                   	push   %eax
10007a99:	e8 23 ef ff ff       	call   0x100069c1
10007a9e:	ff 76 44             	push   0x44(%esi)
10007aa1:	e8 1b ef ff ff       	call   0x100069c1
10007aa6:	59                   	pop    %ecx
10007aa7:	59                   	pop    %ecx
10007aa8:	8b 46 50             	mov    0x50(%esi),%eax
10007aab:	3b 05 0c ff 00 10    	cmp    0x1000ff0c,%eax
10007ab1:	74 1c                	je     0x10007acf
10007ab3:	3b c7                	cmp    %edi,%eax
10007ab5:	74 18                	je     0x10007acf
10007ab7:	39 b8 b4 00 00 00    	cmp    %edi,0xb4(%eax)
10007abd:	75 10                	jne    0x10007acf
10007abf:	50                   	push   %eax
10007ac0:	e8 ed 23 00 00       	call   0x10009eb2
10007ac5:	ff 76 50             	push   0x50(%esi)
10007ac8:	e8 f4 ee ff ff       	call   0x100069c1
10007acd:	59                   	pop    %ecx
10007ace:	59                   	pop    %ecx
10007acf:	56                   	push   %esi
10007ad0:	e8 ec ee ff ff       	call   0x100069c1
10007ad5:	59                   	pop    %ecx
10007ad6:	5f                   	pop    %edi
10007ad7:	5e                   	pop    %esi
10007ad8:	c3                   	ret
10007ad9:	56                   	push   %esi
10007ada:	e8 b7 f8 ff ff       	call   0x10007396
10007adf:	8b f0                	mov    %eax,%esi
10007ae1:	8b 46 64             	mov    0x64(%esi),%eax
10007ae4:	3b 05 dc f2 00 10    	cmp    0x1000f2dc,%eax
10007aea:	0f 84 a6 00 00 00    	je     0x10007b96
10007af0:	85 c0                	test   %eax,%eax
10007af2:	74 2f                	je     0x10007b23
10007af4:	8b 48 2c             	mov    0x2c(%eax),%ecx
10007af7:	ff 08                	decl   (%eax)
10007af9:	85 c9                	test   %ecx,%ecx
10007afb:	74 02                	je     0x10007aff
10007afd:	ff 09                	decl   (%ecx)
10007aff:	8b 48 34             	mov    0x34(%eax),%ecx
10007b02:	85 c9                	test   %ecx,%ecx
10007b04:	74 02                	je     0x10007b08
10007b06:	ff 09                	decl   (%ecx)
10007b08:	8b 48 30             	mov    0x30(%eax),%ecx
10007b0b:	85 c9                	test   %ecx,%ecx
10007b0d:	74 02                	je     0x10007b11
10007b0f:	ff 09                	decl   (%ecx)
10007b11:	8b 48 40             	mov    0x40(%eax),%ecx
10007b14:	85 c9                	test   %ecx,%ecx
10007b16:	74 02                	je     0x10007b1a
10007b18:	ff 09                	decl   (%ecx)
10007b1a:	8b 48 4c             	mov    0x4c(%eax),%ecx
10007b1d:	ff 89 b4 00 00 00    	decl   0xb4(%ecx)
10007b23:	8b 0d dc f2 00 10    	mov    0x1000f2dc,%ecx
10007b29:	89 4e 64             	mov    %ecx,0x64(%esi)
10007b2c:	8b 0d dc f2 00 10    	mov    0x1000f2dc,%ecx
10007b32:	ff 01                	incl   (%ecx)
10007b34:	8b 0d dc f2 00 10    	mov    0x1000f2dc,%ecx
10007b3a:	8b 49 2c             	mov    0x2c(%ecx),%ecx
10007b3d:	85 c9                	test   %ecx,%ecx
10007b3f:	74 02                	je     0x10007b43
10007b41:	ff 01                	incl   (%ecx)
10007b43:	8b 0d dc f2 00 10    	mov    0x1000f2dc,%ecx
10007b49:	8b 49 34             	mov    0x34(%ecx),%ecx
10007b4c:	85 c9                	test   %ecx,%ecx
10007b4e:	74 02                	je     0x10007b52
10007b50:	ff 01                	incl   (%ecx)
10007b52:	8b 0d dc f2 00 10    	mov    0x1000f2dc,%ecx
10007b58:	8b 49 30             	mov    0x30(%ecx),%ecx
10007b5b:	85 c9                	test   %ecx,%ecx
10007b5d:	74 02                	je     0x10007b61
10007b5f:	ff 01                	incl   (%ecx)
10007b61:	8b 0d dc f2 00 10    	mov    0x1000f2dc,%ecx
10007b67:	8b 49 40             	mov    0x40(%ecx),%ecx
10007b6a:	85 c9                	test   %ecx,%ecx
10007b6c:	74 02                	je     0x10007b70
10007b6e:	ff 01                	incl   (%ecx)
10007b70:	8b 0d dc f2 00 10    	mov    0x1000f2dc,%ecx
10007b76:	8b 49 4c             	mov    0x4c(%ecx),%ecx
10007b79:	ff 81 b4 00 00 00    	incl   0xb4(%ecx)
10007b7f:	85 c0                	test   %eax,%eax
10007b81:	74 13                	je     0x10007b96
10007b83:	83 38 00             	cmpl   $0x0,(%eax)
10007b86:	75 0e                	jne    0x10007b96
10007b88:	3d 88 f2 00 10       	cmp    $0x1000f288,%eax
10007b8d:	74 07                	je     0x10007b96
10007b8f:	50                   	push   %eax
10007b90:	e8 7a fe ff ff       	call   0x10007a0f
10007b95:	59                   	pop    %ecx
10007b96:	8b 46 64             	mov    0x64(%esi),%eax
10007b99:	5e                   	pop    %esi
10007b9a:	c3                   	ret
10007b9b:	6a 0c                	push   $0xc
10007b9d:	68 a8 c5 00 10       	push   $0x1000c5a8
10007ba2:	e8 0d 02 00 00       	call   0x10007db4
10007ba7:	6a 0c                	push   $0xc
10007ba9:	e8 bc fc ff ff       	call   0x1000786a
10007bae:	59                   	pop    %ecx
10007baf:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
10007bb3:	e8 21 ff ff ff       	call   0x10007ad9
10007bb8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
10007bbb:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
10007bbf:	e8 09 00 00 00       	call   0x10007bcd
10007bc4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
10007bc7:	e8 23 02 00 00       	call   0x10007def
10007bcc:	c3                   	ret
10007bcd:	6a 0c                	push   $0xc
10007bcf:	e8 02 fc ff ff       	call   0x100077d6
10007bd4:	59                   	pop    %ecx
10007bd5:	c3                   	ret
10007bd6:	cc                   	int3
10007bd7:	cc                   	int3
10007bd8:	cc                   	int3
10007bd9:	cc                   	int3
10007bda:	cc                   	int3
10007bdb:	cc                   	int3
10007bdc:	cc                   	int3
10007bdd:	cc                   	int3
10007bde:	cc                   	int3
10007bdf:	cc                   	int3
10007be0:	8b 44 24 08          	mov    0x8(%esp),%eax
10007be4:	8b 4c 24 10          	mov    0x10(%esp),%ecx
10007be8:	0b c8                	or     %eax,%ecx
10007bea:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
10007bee:	75 09                	jne    0x10007bf9
10007bf0:	8b 44 24 04          	mov    0x4(%esp),%eax
10007bf4:	f7 e1                	mul    %ecx
10007bf6:	c2 10 00             	ret    $0x10
10007bf9:	53                   	push   %ebx
10007bfa:	f7 e1                	mul    %ecx
10007bfc:	8b d8                	mov    %eax,%ebx
10007bfe:	8b 44 24 08          	mov    0x8(%esp),%eax
10007c02:	f7 64 24 14          	mull   0x14(%esp)
10007c06:	03 d8                	add    %eax,%ebx
10007c08:	8b 44 24 08          	mov    0x8(%esp),%eax
10007c0c:	f7 e1                	mul    %ecx
10007c0e:	03 d3                	add    %ebx,%edx
10007c10:	5b                   	pop    %ebx
10007c11:	c2 10 00             	ret    $0x10
10007c14:	55                   	push   %ebp
10007c15:	8b ec                	mov    %esp,%ebp
10007c17:	83 ec 10             	sub    $0x10,%esp
10007c1a:	56                   	push   %esi
10007c1b:	8d 45 f8             	lea    -0x8(%ebp),%eax
10007c1e:	50                   	push   %eax
10007c1f:	ff 15 1c c0 00 10    	call   *0x1000c01c  ; 0x1000c01c=KERNEL32.dll!GetSystemTimeAsFileTime
10007c25:	8b 75 fc             	mov    -0x4(%ebp),%esi
10007c28:	33 75 f8             	xor    -0x8(%ebp),%esi
10007c2b:	ff 15 68 c0 00 10    	call   *0x1000c068  ; 0x1000c068=KERNEL32.dll!GetCurrentProcessId
10007c31:	33 f0                	xor    %eax,%esi
10007c33:	ff 15 24 c0 00 10    	call   *0x1000c024  ; 0x1000c024=KERNEL32.dll!GetCurrentThreadId
10007c39:	33 f0                	xor    %eax,%esi
10007c3b:	ff 15 64 c0 00 10    	call   *0x1000c064  ; 0x1000c064=KERNEL32.dll!GetTickCount
10007c41:	33 f0                	xor    %eax,%esi
10007c43:	8d 45 f0             	lea    -0x10(%ebp),%eax
10007c46:	50                   	push   %eax
10007c47:	ff 15 60 c0 00 10    	call   *0x1000c060  ; 0x1000c060=KERNEL32.dll!QueryPerformanceCounter
10007c4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
10007c50:	33 45 f0             	xor    -0x10(%ebp),%eax
10007c53:	33 f0                	xor    %eax,%esi
10007c55:	89 35 30 f1 00 10    	mov    %esi,0x1000f130
10007c5b:	75 0a                	jne    0x10007c67
10007c5d:	c7 05 30 f1 00 10 4e 	movl   $0xbb40e64e,0x1000f130
10007c64:	e6 40 bb 
10007c67:	5e                   	pop    %esi
10007c68:	c9                   	leave
10007c69:	c3                   	ret
10007c6a:	68 18 01 00 00       	push   $0x118
10007c6f:	68 a0 c7 00 10       	push   $0x1000c7a0
10007c74:	e8 3b 01 00 00       	call   0x10007db4
10007c79:	a1 30 f1 00 10       	mov    0x1000f130,%eax
10007c7e:	33 45 04             	xor    0x4(%ebp),%eax
10007c81:	89 45 e4             	mov    %eax,-0x1c(%ebp)
10007c84:	a1 9c fd 00 10       	mov    0x1000fd9c,%eax
10007c89:	33 c9                	xor    %ecx,%ecx
10007c8b:	3b c1                	cmp    %ecx,%eax
10007c8d:	74 1f                	je     0x10007cae
10007c8f:	89 4d fc             	mov    %ecx,-0x4(%ebp)
10007c92:	ff 75 0c             	push   0xc(%ebp)
10007c95:	ff 75 08             	push   0x8(%ebp)
10007c98:	ff d0                	call   *%eax
10007c9a:	59                   	pop    %ecx
10007c9b:	59                   	pop    %ecx
10007c9c:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
10007ca0:	e9 07 01 00 00       	jmp    0x10007dac
10007ca5:	33 c0                	xor    %eax,%eax
10007ca7:	40                   	inc    %eax
10007ca8:	c3                   	ret
10007ca9:	8b 65 e8             	mov    -0x18(%ebp),%esp
10007cac:	eb ee                	jmp    0x10007c9c
10007cae:	8b 45 08             	mov    0x8(%ebp),%eax
10007cb1:	48                   	dec    %eax
10007cb2:	74 13                	je     0x10007cc7
10007cb4:	bf 7c c7 00 10       	mov    $0x1000c77c,%edi  ; 0x1000c77c='Unknown security failure detected!'
10007cb9:	c7 45 e0 c8 c6 00 10 	movl   $0x1000c6c8,-0x20(%ebp)  ; 0x1000c6c8='A security error of unknown cause has been detected which has'
10007cc0:	be d4 00 00 00       	mov    $0xd4,%esi
10007cc5:	eb 11                	jmp    0x10007cd8
10007cc7:	bf a8 c6 00 10       	mov    $0x1000c6a8,%edi  ; 0x1000c6a8='Buffer overrun detected!'
10007ccc:	c7 45 e0 08 c6 00 10 	movl   $0x1000c608,-0x20(%ebp)  ; 0x1000c608="A buffer overrun has been detected which has corrupted the program's"
10007cd3:	be b9 00 00 00       	mov    $0xb9,%esi
10007cd8:	88 4d dc             	mov    %cl,-0x24(%ebp)
10007cdb:	68 04 01 00 00       	push   $0x104
10007ce0:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
10007ce6:	50                   	push   %eax
10007ce7:	51                   	push   %ecx
10007ce8:	ff 15 6c c0 00 10    	call   *0x1000c06c  ; 0x1000c06c=KERNEL32.dll!GetModuleFileNameA
10007cee:	85 c0                	test   %eax,%eax
10007cf0:	75 13                	jne    0x10007d05
10007cf2:	68 f0 c5 00 10       	push   $0x1000c5f0  ; 0x1000c5f0='<program name unknown>'
10007cf7:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
10007cfd:	50                   	push   %eax
10007cfe:	e8 3d f9 ff ff       	call   0x10007640
10007d03:	59                   	pop    %ecx
10007d04:	59                   	pop    %ecx
10007d05:	8d 9d d8 fe ff ff    	lea    -0x128(%ebp),%ebx
10007d0b:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
10007d11:	50                   	push   %eax
10007d12:	e8 c9 e7 ff ff       	call   0x100064e0
10007d17:	59                   	pop    %ecx
10007d18:	83 c0 0b             	add    $0xb,%eax
10007d1b:	83 f8 3c             	cmp    $0x3c,%eax
10007d1e:	76 29                	jbe    0x10007d49
10007d20:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
10007d26:	50                   	push   %eax
10007d27:	e8 b4 e7 ff ff       	call   0x100064e0
10007d2c:	8b d8                	mov    %eax,%ebx
10007d2e:	8d 85 d8 fe ff ff    	lea    -0x128(%ebp),%eax
10007d34:	83 e8 31             	sub    $0x31,%eax
10007d37:	03 d8                	add    %eax,%ebx
10007d39:	6a 03                	push   $0x3
10007d3b:	68 ec c5 00 10       	push   $0x1000c5ec
10007d40:	53                   	push   %ebx
10007d41:	e8 8a 24 00 00       	call   0x1000a1d0
10007d46:	83 c4 10             	add    $0x10,%esp
10007d49:	53                   	push   %ebx
10007d4a:	e8 91 e7 ff ff       	call   0x100064e0
10007d4f:	59                   	pop    %ecx
10007d50:	8d 44 30 0c          	lea    0xc(%eax,%esi,1),%eax
10007d54:	83 c0 03             	add    $0x3,%eax
10007d57:	83 e0 fc             	and    $0xfffffffc,%eax
10007d5a:	e8 21 e4 ff ff       	call   0x10006180
10007d5f:	89 65 e8             	mov    %esp,-0x18(%ebp)
10007d62:	8b f4                	mov    %esp,%esi
10007d64:	57                   	push   %edi
10007d65:	56                   	push   %esi
10007d66:	e8 d5 f8 ff ff       	call   0x10007640
10007d6b:	bf e8 c5 00 10       	mov    $0x1000c5e8,%edi
10007d70:	57                   	push   %edi
10007d71:	56                   	push   %esi
10007d72:	e8 d9 f8 ff ff       	call   0x10007650
10007d77:	68 dc c5 00 10       	push   $0x1000c5dc  ; 0x1000c5dc='Program: '
10007d7c:	56                   	push   %esi
10007d7d:	e8 ce f8 ff ff       	call   0x10007650
10007d82:	53                   	push   %ebx
10007d83:	56                   	push   %esi
10007d84:	e8 c7 f8 ff ff       	call   0x10007650
10007d89:	57                   	push   %edi
10007d8a:	56                   	push   %esi
10007d8b:	e8 c0 f8 ff ff       	call   0x10007650
10007d90:	ff 75 e0             	push   -0x20(%ebp)
10007d93:	56                   	push   %esi
10007d94:	e8 b7 f8 ff ff       	call   0x10007650
10007d99:	68 10 20 01 00       	push   $0x12010
10007d9e:	68 b4 c5 00 10       	push   $0x1000c5b4  ; 0x1000c5b4='Microsoft Visual C++ Runtime Library'
10007da3:	56                   	push   %esi
10007da4:	e8 f7 26 00 00       	call   0x1000a4a0
10007da9:	83 c4 3c             	add    $0x3c,%esp
10007dac:	6a 03                	push   $0x3
10007dae:	e8 c7 01 00 00       	call   0x10007f7a
10007db3:	cc                   	int3
10007db4:	68 a4 a5 00 10       	push   $0x1000a5a4
10007db9:	64 a1 00 00 00 00    	mov    %fs:0x0,%eax
10007dbf:	50                   	push   %eax
10007dc0:	8b 44 24 10          	mov    0x10(%esp),%eax
10007dc4:	89 6c 24 10          	mov    %ebp,0x10(%esp)
10007dc8:	8d 6c 24 10          	lea    0x10(%esp),%ebp
10007dcc:	2b e0                	sub    %eax,%esp
10007dce:	53                   	push   %ebx
10007dcf:	56                   	push   %esi
10007dd0:	57                   	push   %edi
10007dd1:	8b 45 f8             	mov    -0x8(%ebp),%eax
10007dd4:	89 65 e8             	mov    %esp,-0x18(%ebp)
10007dd7:	50                   	push   %eax
10007dd8:	8b 45 fc             	mov    -0x4(%ebp),%eax
10007ddb:	c7 45 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%ebp)
10007de2:	89 45 f8             	mov    %eax,-0x8(%ebp)
10007de5:	8d 45 f0             	lea    -0x10(%ebp),%eax
10007de8:	64 a3 00 00 00 00    	mov    %eax,%fs:0x0
10007dee:	c3                   	ret
10007def:	8b 4d f0             	mov    -0x10(%ebp),%ecx
10007df2:	64 89 0d 00 00 00 00 	mov    %ecx,%fs:0x0
10007df9:	59                   	pop    %ecx
10007dfa:	5f                   	pop    %edi
10007dfb:	5e                   	pop    %esi
10007dfc:	5b                   	pop    %ebx
10007dfd:	c9                   	leave
10007dfe:	51                   	push   %ecx
10007dff:	c3                   	ret
10007e00:	68 bc c7 00 10       	push   $0x1000c7bc  ; 0x1000c7bc='mscoree.dll'
10007e05:	ff 15 74 c0 00 10    	call   *0x1000c074  ; 0x1000c074=KERNEL32.dll!GetModuleHandleA
10007e0b:	85 c0                	test   %eax,%eax
10007e0d:	74 16                	je     0x10007e25
10007e0f:	68 ac c7 00 10       	push   $0x1000c7ac  ; 0x1000c7ac='CorExitProcess'
10007e14:	50                   	push   %eax
10007e15:	ff 15 70 c0 00 10    	call   *0x1000c070  ; 0x1000c070=KERNEL32.dll!GetProcAddress
10007e1b:	85 c0                	test   %eax,%eax
10007e1d:	74 06                	je     0x10007e25
10007e1f:	ff 74 24 04          	push   0x4(%esp)
10007e23:	ff d0                	call   *%eax
10007e25:	ff 74 24 04          	push   0x4(%esp)
10007e29:	ff 15 20 c0 00 10    	call   *0x1000c020  ; 0x1000c020=KERNEL32.dll!ExitProcess
10007e2f:	cc                   	int3
10007e30:	6a 08                	push   $0x8
10007e32:	e8 33 fa ff ff       	call   0x1000786a
10007e37:	59                   	pop    %ecx
10007e38:	c3                   	ret
10007e39:	6a 08                	push   $0x8
10007e3b:	e8 96 f9 ff ff       	call   0x100077d6
10007e40:	59                   	pop    %ecx
10007e41:	c3                   	ret
10007e42:	a1 10 04 01 10       	mov    0x10010410,%eax
10007e47:	85 c0                	test   %eax,%eax
10007e49:	74 02                	je     0x10007e4d
10007e4b:	ff d0                	call   *%eax
10007e4d:	56                   	push   %esi
10007e4e:	57                   	push   %edi
10007e4f:	b9 0c f0 00 10       	mov    $0x1000f00c,%ecx
10007e54:	bf 1c f0 00 10       	mov    $0x1000f01c,%edi
10007e59:	33 c0                	xor    %eax,%eax
10007e5b:	3b cf                	cmp    %edi,%ecx
10007e5d:	8b f1                	mov    %ecx,%esi
10007e5f:	73 17                	jae    0x10007e78
10007e61:	85 c0                	test   %eax,%eax
10007e63:	75 3f                	jne    0x10007ea4
10007e65:	8b 0e                	mov    (%esi),%ecx
10007e67:	85 c9                	test   %ecx,%ecx
10007e69:	74 02                	je     0x10007e6d
10007e6b:	ff d1                	call   *%ecx
10007e6d:	83 c6 04             	add    $0x4,%esi
10007e70:	3b f7                	cmp    %edi,%esi
10007e72:	72 ed                	jb     0x10007e61
10007e74:	85 c0                	test   %eax,%eax
10007e76:	75 2c                	jne    0x10007ea4
10007e78:	68 da 86 00 10       	push   $0x100086da
10007e7d:	e8 2d eb ff ff       	call   0x100069af
10007e82:	be 00 f0 00 10       	mov    $0x1000f000,%esi
10007e87:	8b c6                	mov    %esi,%eax
10007e89:	bf 08 f0 00 10       	mov    $0x1000f008,%edi
10007e8e:	3b c7                	cmp    %edi,%eax
10007e90:	59                   	pop    %ecx
10007e91:	73 0f                	jae    0x10007ea2
10007e93:	8b 06                	mov    (%esi),%eax
10007e95:	85 c0                	test   %eax,%eax
10007e97:	74 02                	je     0x10007e9b
10007e99:	ff d0                	call   *%eax
10007e9b:	83 c6 04             	add    $0x4,%esi
10007e9e:	3b f7                	cmp    %edi,%esi
10007ea0:	72 f1                	jb     0x10007e93
10007ea2:	33 c0                	xor    %eax,%eax
10007ea4:	5f                   	pop    %edi
10007ea5:	5e                   	pop    %esi
10007ea6:	c3                   	ret
10007ea7:	55                   	push   %ebp
10007ea8:	8b ec                	mov    %esp,%ebp
10007eaa:	56                   	push   %esi
10007eab:	57                   	push   %edi
10007eac:	6a 08                	push   $0x8
10007eae:	e8 b7 f9 ff ff       	call   0x1000786a
10007eb3:	33 f6                	xor    %esi,%esi
10007eb5:	46                   	inc    %esi
10007eb6:	39 35 e4 fd 00 10    	cmp    %esi,0x1000fde4
10007ebc:	59                   	pop    %ecx
10007ebd:	75 10                	jne    0x10007ecf
10007ebf:	ff 75 08             	push   0x8(%ebp)
10007ec2:	ff 15 7c c0 00 10    	call   *0x1000c07c  ; 0x1000c07c=KERNEL32.dll!GetCurrentProcess
10007ec8:	50                   	push   %eax
10007ec9:	ff 15 78 c0 00 10    	call   *0x1000c078  ; 0x1000c078=KERNEL32.dll!TerminateProcess
10007ecf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
10007ed3:	8a 45 10             	mov    0x10(%ebp),%al
10007ed6:	89 35 e0 fd 00 10    	mov    %esi,0x1000fde0
10007edc:	a2 dc fd 00 10       	mov    %al,0x1000fddc
10007ee1:	75 52                	jne    0x10007f35
10007ee3:	8b 0d 08 04 01 10    	mov    0x10010408,%ecx
10007ee9:	85 c9                	test   %ecx,%ecx
10007eeb:	74 29                	je     0x10007f16
10007eed:	a1 04 04 01 10       	mov    0x10010404,%eax
10007ef2:	83 e8 04             	sub    $0x4,%eax
10007ef5:	3b c1                	cmp    %ecx,%eax
10007ef7:	eb 16                	jmp    0x10007f0f
10007ef9:	8b 00                	mov    (%eax),%eax
10007efb:	85 c0                	test   %eax,%eax
10007efd:	74 02                	je     0x10007f01
10007eff:	ff d0                	call   *%eax
10007f01:	a1 04 04 01 10       	mov    0x10010404,%eax
10007f06:	83 e8 04             	sub    $0x4,%eax
10007f09:	3b 05 08 04 01 10    	cmp    0x10010408,%eax
10007f0f:	a3 04 04 01 10       	mov    %eax,0x10010404
10007f14:	73 e3                	jae    0x10007ef9
10007f16:	b8 20 f0 00 10       	mov    $0x1000f020,%eax
10007f1b:	be 24 f0 00 10       	mov    $0x1000f024,%esi
10007f20:	3b c6                	cmp    %esi,%eax
10007f22:	8b f8                	mov    %eax,%edi
10007f24:	73 0f                	jae    0x10007f35
10007f26:	8b 07                	mov    (%edi),%eax
10007f28:	85 c0                	test   %eax,%eax
10007f2a:	74 02                	je     0x10007f2e
10007f2c:	ff d0                	call   *%eax
10007f2e:	83 c7 04             	add    $0x4,%edi
10007f31:	3b fe                	cmp    %esi,%edi
10007f33:	72 f1                	jb     0x10007f26
10007f35:	b8 28 f0 00 10       	mov    $0x1000f028,%eax
10007f3a:	be 30 f0 00 10       	mov    $0x1000f030,%esi
10007f3f:	3b c6                	cmp    %esi,%eax
10007f41:	8b f8                	mov    %eax,%edi
10007f43:	73 0f                	jae    0x10007f54
10007f45:	8b 07                	mov    (%edi),%eax
10007f47:	85 c0                	test   %eax,%eax
10007f49:	74 02                	je     0x10007f4d
10007f4b:	ff d0                	call   *%eax
10007f4d:	83 c7 04             	add    $0x4,%edi
10007f50:	3b fe                	cmp    %esi,%edi
10007f52:	72 f1                	jb     0x10007f45
10007f54:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
10007f58:	5f                   	pop    %edi
10007f59:	5e                   	pop    %esi
10007f5a:	74 09                	je     0x10007f65
10007f5c:	6a 08                	push   $0x8
10007f5e:	e8 73 f8 ff ff       	call   0x100077d6
10007f63:	eb 12                	jmp    0x10007f77
10007f65:	ff 75 08             	push   0x8(%ebp)
10007f68:	c7 05 e4 fd 00 10 01 	movl   $0x1,0x1000fde4
10007f6f:	00 00 00 
10007f72:	e8 89 fe ff ff       	call   0x10007e00
10007f77:	59                   	pop    %ecx
10007f78:	5d                   	pop    %ebp
10007f79:	c3                   	ret
10007f7a:	6a 00                	push   $0x0
10007f7c:	6a 01                	push   $0x1
10007f7e:	ff 74 24 0c          	push   0xc(%esp)
10007f82:	e8 20 ff ff ff       	call   0x10007ea7
10007f87:	83 c4 0c             	add    $0xc,%esp
10007f8a:	c3                   	ret
10007f8b:	6a 01                	push   $0x1
10007f8d:	6a 00                	push   $0x0
10007f8f:	6a 00                	push   $0x0
10007f91:	e8 11 ff ff ff       	call   0x10007ea7
10007f96:	83 c4 0c             	add    $0xc,%esp
10007f99:	c3                   	ret
10007f9a:	6a 10                	push   $0x10
10007f9c:	68 c8 c7 00 10       	push   $0x1000c7c8
10007fa1:	e8 0e fe ff ff       	call   0x10007db4
10007fa6:	8b 75 08             	mov    0x8(%ebp),%esi
10007fa9:	0f af 75 0c          	imul   0xc(%ebp),%esi
10007fad:	89 75 e4             	mov    %esi,-0x1c(%ebp)
10007fb0:	85 f6                	test   %esi,%esi
10007fb2:	75 01                	jne    0x10007fb5
10007fb4:	46                   	inc    %esi
10007fb5:	33 ff                	xor    %edi,%edi
10007fb7:	89 7d e0             	mov    %edi,-0x20(%ebp)
10007fba:	83 fe e0             	cmp    $0xffffffe0,%esi
10007fbd:	77 65                	ja     0x10008024
10007fbf:	83 3d e0 02 01 10 03 	cmpl   $0x3,0x100102e0
10007fc6:	75 47                	jne    0x1000800f
10007fc8:	83 c6 0f             	add    $0xf,%esi
10007fcb:	83 e6 f0             	and    $0xfffffff0,%esi
10007fce:	89 75 0c             	mov    %esi,0xc(%ebp)
10007fd1:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
10007fd4:	3b 1d cc 02 01 10    	cmp    0x100102cc,%ebx
10007fda:	77 33                	ja     0x1000800f
10007fdc:	6a 04                	push   $0x4
10007fde:	e8 87 f8 ff ff       	call   0x1000786a
10007fe3:	59                   	pop    %ecx
10007fe4:	21 7d fc             	and    %edi,-0x4(%ebp)
10007fe7:	53                   	push   %ebx
10007fe8:	e8 f2 11 00 00       	call   0x100091df
10007fed:	59                   	pop    %ecx
10007fee:	89 45 e0             	mov    %eax,-0x20(%ebp)
10007ff1:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
10007ff5:	e8 4a 00 00 00       	call   0x10008044
10007ffa:	8b 7d e0             	mov    -0x20(%ebp),%edi
10007ffd:	85 ff                	test   %edi,%edi
10007fff:	74 12                	je     0x10008013
10008001:	ff 75 e4             	push   -0x1c(%ebp)
10008004:	6a 00                	push   $0x0
10008006:	57                   	push   %edi
10008007:	e8 f4 22 00 00       	call   0x1000a300
1000800c:	83 c4 0c             	add    $0xc,%esp
1000800f:	85 ff                	test   %edi,%edi
10008011:	75 3a                	jne    0x1000804d
10008013:	56                   	push   %esi
10008014:	6a 08                	push   $0x8
10008016:	ff 35 dc 02 01 10    	push   0x100102dc
1000801c:	ff 15 34 c0 00 10    	call   *0x1000c034  ; 0x1000c034=KERNEL32.dll!HeapAlloc
10008022:	8b f8                	mov    %eax,%edi
10008024:	85 ff                	test   %edi,%edi
10008026:	75 25                	jne    0x1000804d
10008028:	39 3d f8 fe 00 10    	cmp    %edi,0x1000fef8
1000802e:	74 1d                	je     0x1000804d
10008030:	56                   	push   %esi
10008031:	e8 8e e4 ff ff       	call   0x100064c4
10008036:	59                   	pop    %ecx
10008037:	85 c0                	test   %eax,%eax
10008039:	0f 85 76 ff ff ff    	jne    0x10007fb5
1000803f:	eb 0e                	jmp    0x1000804f
10008041:	8b 75 0c             	mov    0xc(%ebp),%esi
10008044:	6a 04                	push   $0x4
10008046:	e8 8b f7 ff ff       	call   0x100077d6
1000804b:	59                   	pop    %ecx
1000804c:	c3                   	ret
1000804d:	8b c7                	mov    %edi,%eax
1000804f:	e8 9b fd ff ff       	call   0x10007def
10008054:	c3                   	ret
10008055:	83 ec 48             	sub    $0x48,%esp
10008058:	53                   	push   %ebx
10008059:	bb 80 04 00 00       	mov    $0x480,%ebx
1000805e:	53                   	push   %ebx
1000805f:	e8 4e e4 ff ff       	call   0x100064b2
10008064:	85 c0                	test   %eax,%eax
10008066:	59                   	pop    %ecx
10008067:	75 08                	jne    0x10008071
10008069:	83 c8 ff             	or     $0xffffffff,%eax
1000806c:	e9 dd 01 00 00       	jmp    0x1000824e
10008071:	a3 00 03 01 10       	mov    %eax,0x10010300
10008076:	c7 05 e4 02 01 10 20 	movl   $0x20,0x100102e4
1000807d:	00 00 00 
10008080:	8d 88 80 04 00 00    	lea    0x480(%eax),%ecx
10008086:	eb 1e                	jmp    0x100080a6
10008088:	80 60 04 00          	andb   $0x0,0x4(%eax)
1000808c:	83 08 ff             	orl    $0xffffffff,(%eax)
1000808f:	83 60 08 00          	andl   $0x0,0x8(%eax)
10008093:	c6 40 05 0a          	movb   $0xa,0x5(%eax)
10008097:	8b 0d 00 03 01 10    	mov    0x10010300,%ecx
1000809d:	83 c0 24             	add    $0x24,%eax
100080a0:	81 c1 80 04 00 00    	add    $0x480,%ecx
100080a6:	3b c1                	cmp    %ecx,%eax
100080a8:	72 de                	jb     0x10008088
100080aa:	55                   	push   %ebp
100080ab:	56                   	push   %esi
100080ac:	57                   	push   %edi
100080ad:	8d 44 24 14          	lea    0x14(%esp),%eax
100080b1:	50                   	push   %eax
100080b2:	ff 15 8c c0 00 10    	call   *0x1000c08c  ; 0x1000c08c=KERNEL32.dll!GetStartupInfoA
100080b8:	66 83 7c 24 46 00    	cmpw   $0x0,0x46(%esp)
100080be:	0f 84 e9 00 00 00    	je     0x100081ad
100080c4:	8b 44 24 48          	mov    0x48(%esp),%eax
100080c8:	85 c0                	test   %eax,%eax
100080ca:	0f 84 dd 00 00 00    	je     0x100081ad
100080d0:	8b 38                	mov    (%eax),%edi
100080d2:	8d 68 04             	lea    0x4(%eax),%ebp
100080d5:	8d 04 2f             	lea    (%edi,%ebp,1),%eax
100080d8:	89 44 24 10          	mov    %eax,0x10(%esp)
100080dc:	b8 00 08 00 00       	mov    $0x800,%eax
100080e1:	3b f8                	cmp    %eax,%edi
100080e3:	7c 02                	jl     0x100080e7
100080e5:	8b f8                	mov    %eax,%edi
100080e7:	39 3d e4 02 01 10    	cmp    %edi,0x100102e4
100080ed:	7d 4e                	jge    0x1000813d
100080ef:	be 04 03 01 10       	mov    $0x10010304,%esi
100080f4:	53                   	push   %ebx
100080f5:	e8 b8 e3 ff ff       	call   0x100064b2
100080fa:	85 c0                	test   %eax,%eax
100080fc:	59                   	pop    %ecx
100080fd:	74 38                	je     0x10008137
100080ff:	83 05 e4 02 01 10 20 	addl   $0x20,0x100102e4
10008106:	89 06                	mov    %eax,(%esi)
10008108:	8d 88 80 04 00 00    	lea    0x480(%eax),%ecx
1000810e:	eb 16                	jmp    0x10008126
10008110:	80 60 04 00          	andb   $0x0,0x4(%eax)
10008114:	83 08 ff             	orl    $0xffffffff,(%eax)
10008117:	83 60 08 00          	andl   $0x0,0x8(%eax)
1000811b:	c6 40 05 0a          	movb   $0xa,0x5(%eax)
1000811f:	8b 0e                	mov    (%esi),%ecx
10008121:	83 c0 24             	add    $0x24,%eax
10008124:	03 cb                	add    %ebx,%ecx
10008126:	3b c1                	cmp    %ecx,%eax
10008128:	72 e6                	jb     0x10008110
1000812a:	83 c6 04             	add    $0x4,%esi
1000812d:	39 3d e4 02 01 10    	cmp    %edi,0x100102e4
10008133:	7c bf                	jl     0x100080f4
10008135:	eb 06                	jmp    0x1000813d
10008137:	8b 3d e4 02 01 10    	mov    0x100102e4,%edi
1000813d:	33 db                	xor    %ebx,%ebx
1000813f:	85 ff                	test   %edi,%edi
10008141:	7e 6a                	jle    0x100081ad
10008143:	8b 44 24 10          	mov    0x10(%esp),%eax
10008147:	8b 00                	mov    (%eax),%eax
10008149:	83 f8 ff             	cmp    $0xffffffff,%eax
1000814c:	74 54                	je     0x100081a2
1000814e:	8a 4d 00             	mov    0x0(%ebp),%cl
10008151:	f6 c1 01             	test   $0x1,%cl
10008154:	74 4c                	je     0x100081a2
10008156:	f6 c1 08             	test   $0x8,%cl
10008159:	75 0b                	jne    0x10008166
1000815b:	50                   	push   %eax
1000815c:	ff 15 88 c0 00 10    	call   *0x1000c088  ; 0x1000c088=KERNEL32.dll!GetFileType
10008162:	85 c0                	test   %eax,%eax
10008164:	74 3c                	je     0x100081a2
10008166:	8b cb                	mov    %ebx,%ecx
10008168:	8b c3                	mov    %ebx,%eax
1000816a:	83 e0 1f             	and    $0x1f,%eax
1000816d:	8d 04 c0             	lea    (%eax,%eax,8),%eax
10008170:	c1 f9 05             	sar    $0x5,%ecx
10008173:	8b 0c 8d 00 03 01 10 	mov    0x10010300(,%ecx,4),%ecx
1000817a:	8d 34 81             	lea    (%ecx,%eax,4),%esi
1000817d:	8b 44 24 10          	mov    0x10(%esp),%eax
10008181:	8b 00                	mov    (%eax),%eax
10008183:	89 06                	mov    %eax,(%esi)
10008185:	8a 45 00             	mov    0x0(%ebp),%al
10008188:	88 46 04             	mov    %al,0x4(%esi)
1000818b:	8d 46 0c             	lea    0xc(%esi),%eax
1000818e:	68 a0 0f 00 00       	push   $0xfa0
10008193:	50                   	push   %eax
10008194:	e8 cb 1a 00 00       	call   0x10009c64
10008199:	85 c0                	test   %eax,%eax
1000819b:	59                   	pop    %ecx
1000819c:	59                   	pop    %ecx
1000819d:	74 2e                	je     0x100081cd
1000819f:	ff 46 08             	incl   0x8(%esi)
100081a2:	83 44 24 10 04       	addl   $0x4,0x10(%esp)
100081a7:	43                   	inc    %ebx
100081a8:	45                   	inc    %ebp
100081a9:	3b df                	cmp    %edi,%ebx
100081ab:	7c 96                	jl     0x10008143
100081ad:	33 db                	xor    %ebx,%ebx
100081af:	8b 0d 00 03 01 10    	mov    0x10010300,%ecx
100081b5:	8d 04 db             	lea    (%ebx,%ebx,8),%eax
100081b8:	8d 34 81             	lea    (%ecx,%eax,4),%esi
100081bb:	83 3e ff             	cmpl   $0xffffffff,(%esi)
100081be:	75 6f                	jne    0x1000822f
100081c0:	85 db                	test   %ebx,%ebx
100081c2:	c6 46 04 81          	movb   $0x81,0x4(%esi)
100081c6:	75 0a                	jne    0x100081d2
100081c8:	6a f6                	push   $0xfffffff6
100081ca:	58                   	pop    %eax
100081cb:	eb 0f                	jmp    0x100081dc
100081cd:	83 c8 ff             	or     $0xffffffff,%eax
100081d0:	eb 79                	jmp    0x1000824b
100081d2:	8b c3                	mov    %ebx,%eax
100081d4:	48                   	dec    %eax
100081d5:	f7 d8                	neg    %eax
100081d7:	1b c0                	sbb    %eax,%eax
100081d9:	83 c0 f5             	add    $0xfffffff5,%eax
100081dc:	50                   	push   %eax
100081dd:	ff 15 84 c0 00 10    	call   *0x1000c084  ; 0x1000c084=KERNEL32.dll!GetStdHandle
100081e3:	8b f8                	mov    %eax,%edi
100081e5:	83 ff ff             	cmp    $0xffffffff,%edi
100081e8:	74 3f                	je     0x10008229
100081ea:	57                   	push   %edi
100081eb:	ff 15 88 c0 00 10    	call   *0x1000c088  ; 0x1000c088=KERNEL32.dll!GetFileType
100081f1:	85 c0                	test   %eax,%eax
100081f3:	74 34                	je     0x10008229
100081f5:	25 ff 00 00 00       	and    $0xff,%eax
100081fa:	83 f8 02             	cmp    $0x2,%eax
100081fd:	89 3e                	mov    %edi,(%esi)
100081ff:	75 06                	jne    0x10008207
10008201:	80 4e 04 40          	orb    $0x40,0x4(%esi)
10008205:	eb 09                	jmp    0x10008210
10008207:	83 f8 03             	cmp    $0x3,%eax
1000820a:	75 04                	jne    0x10008210
1000820c:	80 4e 04 08          	orb    $0x8,0x4(%esi)
10008210:	8d 46 0c             	lea    0xc(%esi),%eax
10008213:	68 a0 0f 00 00       	push   $0xfa0
10008218:	50                   	push   %eax
10008219:	e8 46 1a 00 00       	call   0x10009c64
1000821e:	85 c0                	test   %eax,%eax
10008220:	59                   	pop    %ecx
10008221:	59                   	pop    %ecx
10008222:	74 a9                	je     0x100081cd
10008224:	ff 46 08             	incl   0x8(%esi)
10008227:	eb 0a                	jmp    0x10008233
10008229:	80 4e 04 40          	orb    $0x40,0x4(%esi)
1000822d:	eb 04                	jmp    0x10008233
1000822f:	80 4e 04 80          	orb    $0x80,0x4(%esi)
10008233:	43                   	inc    %ebx
10008234:	83 fb 03             	cmp    $0x3,%ebx
10008237:	0f 8c 72 ff ff ff    	jl     0x100081af
1000823d:	ff 35 e4 02 01 10    	push   0x100102e4
10008243:	ff 15 80 c0 00 10    	call   *0x1000c080  ; 0x1000c080=KERNEL32.dll!SetHandleCount
10008249:	33 c0                	xor    %eax,%eax
1000824b:	5f                   	pop    %edi
1000824c:	5e                   	pop    %esi
1000824d:	5d                   	pop    %ebp
1000824e:	5b                   	pop    %ebx
1000824f:	83 c4 48             	add    $0x48,%esp
10008252:	c3                   	ret
10008253:	56                   	push   %esi
10008254:	57                   	push   %edi
10008255:	be 00 03 01 10       	mov    $0x10010300,%esi
1000825a:	8b 3e                	mov    (%esi),%edi
1000825c:	85 ff                	test   %edi,%edi
1000825e:	74 31                	je     0x10008291
10008260:	8d 87 80 04 00 00    	lea    0x480(%edi),%eax
10008266:	eb 1a                	jmp    0x10008282
10008268:	83 7f 08 00          	cmpl   $0x0,0x8(%edi)
1000826c:	74 0a                	je     0x10008278
1000826e:	8d 47 0c             	lea    0xc(%edi),%eax
10008271:	50                   	push   %eax
10008272:	ff 15 54 c0 00 10    	call   *0x1000c054  ; 0x1000c054=KERNEL32.dll!DeleteCriticalSection
10008278:	8b 06                	mov    (%esi),%eax
1000827a:	83 c7 24             	add    $0x24,%edi
1000827d:	05 80 04 00 00       	add    $0x480,%eax
10008282:	3b f8                	cmp    %eax,%edi
10008284:	72 e2                	jb     0x10008268
10008286:	ff 36                	push   (%esi)
10008288:	e8 34 e7 ff ff       	call   0x100069c1
1000828d:	83 26 00             	andl   $0x0,(%esi)
10008290:	59                   	pop    %ecx
10008291:	83 c6 04             	add    $0x4,%esi
10008294:	81 fe 00 04 01 10    	cmp    $0x10010400,%esi
1000829a:	7c be                	jl     0x1000825a
1000829c:	5f                   	pop    %edi
1000829d:	5e                   	pop    %esi
1000829e:	c3                   	ret
1000829f:	53                   	push   %ebx
100082a0:	33 db                	xor    %ebx,%ebx
100082a2:	39 1d 0c 04 01 10    	cmp    %ebx,0x1001040c
100082a8:	56                   	push   %esi
100082a9:	57                   	push   %edi
100082aa:	75 05                	jne    0x100082b1
100082ac:	e8 85 19 00 00       	call   0x10009c36
100082b1:	8b 35 24 fc 00 10    	mov    0x1000fc24,%esi
100082b7:	33 ff                	xor    %edi,%edi
100082b9:	3b f3                	cmp    %ebx,%esi
100082bb:	75 12                	jne    0x100082cf
100082bd:	eb 30                	jmp    0x100082ef
100082bf:	3c 3d                	cmp    $0x3d,%al
100082c1:	74 01                	je     0x100082c4
100082c3:	47                   	inc    %edi
100082c4:	56                   	push   %esi
100082c5:	e8 16 e2 ff ff       	call   0x100064e0
100082ca:	59                   	pop    %ecx
100082cb:	8d 74 06 01          	lea    0x1(%esi,%eax,1),%esi
100082cf:	8a 06                	mov    (%esi),%al
100082d1:	3a c3                	cmp    %bl,%al
100082d3:	75 ea                	jne    0x100082bf
100082d5:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
100082dc:	50                   	push   %eax
100082dd:	e8 d0 e1 ff ff       	call   0x100064b2
100082e2:	8b f8                	mov    %eax,%edi
100082e4:	3b fb                	cmp    %ebx,%edi
100082e6:	59                   	pop    %ecx
100082e7:	89 3d c4 fd 00 10    	mov    %edi,0x1000fdc4
100082ed:	75 05                	jne    0x100082f4
100082ef:	83 c8 ff             	or     $0xffffffff,%eax
100082f2:	eb 58                	jmp    0x1000834c
100082f4:	8b 35 24 fc 00 10    	mov    0x1000fc24,%esi
100082fa:	55                   	push   %ebp
100082fb:	eb 2a                	jmp    0x10008327
100082fd:	56                   	push   %esi
100082fe:	e8 dd e1 ff ff       	call   0x100064e0
10008303:	8b e8                	mov    %eax,%ebp
10008305:	45                   	inc    %ebp
10008306:	80 3e 3d             	cmpb   $0x3d,(%esi)
10008309:	59                   	pop    %ecx
1000830a:	74 19                	je     0x10008325
1000830c:	55                   	push   %ebp
1000830d:	e8 a0 e1 ff ff       	call   0x100064b2
10008312:	3b c3                	cmp    %ebx,%eax
10008314:	59                   	pop    %ecx
10008315:	89 07                	mov    %eax,(%edi)
10008317:	74 37                	je     0x10008350
10008319:	56                   	push   %esi
1000831a:	50                   	push   %eax
1000831b:	e8 20 f3 ff ff       	call   0x10007640
10008320:	59                   	pop    %ecx
10008321:	59                   	pop    %ecx
10008322:	83 c7 04             	add    $0x4,%edi
10008325:	03 f5                	add    %ebp,%esi
10008327:	38 1e                	cmp    %bl,(%esi)
10008329:	75 d2                	jne    0x100082fd
1000832b:	ff 35 24 fc 00 10    	push   0x1000fc24
10008331:	e8 8b e6 ff ff       	call   0x100069c1
10008336:	89 1d 24 fc 00 10    	mov    %ebx,0x1000fc24
1000833c:	89 1f                	mov    %ebx,(%edi)
1000833e:	c7 05 00 04 01 10 01 	movl   $0x1,0x10010400
10008345:	00 00 00 
10008348:	33 c0                	xor    %eax,%eax
1000834a:	59                   	pop    %ecx
1000834b:	5d                   	pop    %ebp
1000834c:	5f                   	pop    %edi
1000834d:	5e                   	pop    %esi
1000834e:	5b                   	pop    %ebx
1000834f:	c3                   	ret
10008350:	ff 35 c4 fd 00 10    	push   0x1000fdc4
10008356:	e8 66 e6 ff ff       	call   0x100069c1
1000835b:	89 1d c4 fd 00 10    	mov    %ebx,0x1000fdc4
10008361:	83 c8 ff             	or     $0xffffffff,%eax
10008364:	eb e4                	jmp    0x1000834a
10008366:	55                   	push   %ebp
10008367:	8b ec                	mov    %esp,%ebp
10008369:	51                   	push   %ecx
1000836a:	53                   	push   %ebx
1000836b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
1000836e:	33 d2                	xor    %edx,%edx
10008370:	39 55 08             	cmp    %edx,0x8(%ebp)
10008373:	57                   	push   %edi
10008374:	89 16                	mov    %edx,(%esi)
10008376:	8b f9                	mov    %ecx,%edi
10008378:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
1000837e:	74 09                	je     0x10008389
10008380:	8b 4d 08             	mov    0x8(%ebp),%ecx
10008383:	83 45 08 04          	addl   $0x4,0x8(%ebp)
10008387:	89 39                	mov    %edi,(%ecx)
10008389:	80 38 22             	cmpb   $0x22,(%eax)
1000838c:	75 0e                	jne    0x1000839c
1000838e:	33 c9                	xor    %ecx,%ecx
10008390:	85 d2                	test   %edx,%edx
10008392:	0f 94 c1             	sete   %cl
10008395:	40                   	inc    %eax
10008396:	8b d1                	mov    %ecx,%edx
10008398:	b1 22                	mov    $0x22,%cl
1000839a:	eb 2d                	jmp    0x100083c9
1000839c:	ff 06                	incl   (%esi)
1000839e:	85 ff                	test   %edi,%edi
100083a0:	74 05                	je     0x100083a7
100083a2:	8a 08                	mov    (%eax),%cl
100083a4:	88 0f                	mov    %cl,(%edi)
100083a6:	47                   	inc    %edi
100083a7:	8a 08                	mov    (%eax),%cl
100083a9:	0f b6 d9             	movzbl %cl,%ebx
100083ac:	40                   	inc    %eax
100083ad:	f6 83 a1 00 01 10 04 	testb  $0x4,0x100100a1(%ebx)
100083b4:	74 0c                	je     0x100083c2
100083b6:	ff 06                	incl   (%esi)
100083b8:	85 ff                	test   %edi,%edi
100083ba:	74 05                	je     0x100083c1
100083bc:	8a 18                	mov    (%eax),%bl
100083be:	88 1f                	mov    %bl,(%edi)
100083c0:	47                   	inc    %edi
100083c1:	40                   	inc    %eax
100083c2:	84 c9                	test   %cl,%cl
100083c4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
100083c7:	74 32                	je     0x100083fb
100083c9:	85 d2                	test   %edx,%edx
100083cb:	75 bc                	jne    0x10008389
100083cd:	80 f9 20             	cmp    $0x20,%cl
100083d0:	74 05                	je     0x100083d7
100083d2:	80 f9 09             	cmp    $0x9,%cl
100083d5:	75 b2                	jne    0x10008389
100083d7:	85 ff                	test   %edi,%edi
100083d9:	74 04                	je     0x100083df
100083db:	80 67 ff 00          	andb   $0x0,-0x1(%edi)
100083df:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
100083e3:	80 38 00             	cmpb   $0x0,(%eax)
100083e6:	0f 84 d6 00 00 00    	je     0x100084c2
100083ec:	8a 08                	mov    (%eax),%cl
100083ee:	80 f9 20             	cmp    $0x20,%cl
100083f1:	74 05                	je     0x100083f8
100083f3:	80 f9 09             	cmp    $0x9,%cl
100083f6:	75 06                	jne    0x100083fe
100083f8:	40                   	inc    %eax
100083f9:	eb f1                	jmp    0x100083ec
100083fb:	48                   	dec    %eax
100083fc:	eb e1                	jmp    0x100083df
100083fe:	80 38 00             	cmpb   $0x0,(%eax)
10008401:	0f 84 bb 00 00 00    	je     0x100084c2
10008407:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
1000840b:	74 09                	je     0x10008416
1000840d:	8b 4d 08             	mov    0x8(%ebp),%ecx
10008410:	83 45 08 04          	addl   $0x4,0x8(%ebp)
10008414:	89 39                	mov    %edi,(%ecx)
10008416:	ff 03                	incl   (%ebx)
10008418:	33 db                	xor    %ebx,%ebx
1000841a:	43                   	inc    %ebx
1000841b:	33 d2                	xor    %edx,%edx
1000841d:	eb 02                	jmp    0x10008421
1000841f:	40                   	inc    %eax
10008420:	42                   	inc    %edx
10008421:	80 38 5c             	cmpb   $0x5c,(%eax)
10008424:	74 f9                	je     0x1000841f
10008426:	80 38 22             	cmpb   $0x22,(%eax)
10008429:	75 26                	jne    0x10008451
1000842b:	f6 c2 01             	test   $0x1,%dl
1000842e:	75 1f                	jne    0x1000844f
10008430:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
10008434:	74 0c                	je     0x10008442
10008436:	8d 48 01             	lea    0x1(%eax),%ecx
10008439:	80 39 22             	cmpb   $0x22,(%ecx)
1000843c:	75 04                	jne    0x10008442
1000843e:	8b c1                	mov    %ecx,%eax
10008440:	eb 02                	jmp    0x10008444
10008442:	33 db                	xor    %ebx,%ebx
10008444:	33 c9                	xor    %ecx,%ecx
10008446:	39 4d fc             	cmp    %ecx,-0x4(%ebp)
10008449:	0f 94 c1             	sete   %cl
1000844c:	89 4d fc             	mov    %ecx,-0x4(%ebp)
1000844f:	d1 ea                	shr    $1,%edx
10008451:	85 d2                	test   %edx,%edx
10008453:	74 0d                	je     0x10008462
10008455:	85 ff                	test   %edi,%edi
10008457:	74 04                	je     0x1000845d
10008459:	c6 07 5c             	movb   $0x5c,(%edi)
1000845c:	47                   	inc    %edi
1000845d:	ff 06                	incl   (%esi)
1000845f:	4a                   	dec    %edx
10008460:	75 f3                	jne    0x10008455
10008462:	8a 08                	mov    (%eax),%cl
10008464:	84 c9                	test   %cl,%cl
10008466:	74 48                	je     0x100084b0
10008468:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
1000846c:	75 0a                	jne    0x10008478
1000846e:	80 f9 20             	cmp    $0x20,%cl
10008471:	74 3d                	je     0x100084b0
10008473:	80 f9 09             	cmp    $0x9,%cl
10008476:	74 38                	je     0x100084b0
10008478:	85 db                	test   %ebx,%ebx
1000847a:	74 2e                	je     0x100084aa
1000847c:	85 ff                	test   %edi,%edi
1000847e:	74 19                	je     0x10008499
10008480:	0f b6 d1             	movzbl %cl,%edx
10008483:	f6 82 a1 00 01 10 04 	testb  $0x4,0x100100a1(%edx)
1000848a:	74 06                	je     0x10008492
1000848c:	88 0f                	mov    %cl,(%edi)
1000848e:	47                   	inc    %edi
1000848f:	40                   	inc    %eax
10008490:	ff 06                	incl   (%esi)
10008492:	8a 08                	mov    (%eax),%cl
10008494:	88 0f                	mov    %cl,(%edi)
10008496:	47                   	inc    %edi
10008497:	eb 0f                	jmp    0x100084a8
10008499:	0f b6 c9             	movzbl %cl,%ecx
1000849c:	f6 81 a1 00 01 10 04 	testb  $0x4,0x100100a1(%ecx)
100084a3:	74 03                	je     0x100084a8
100084a5:	40                   	inc    %eax
100084a6:	ff 06                	incl   (%esi)
100084a8:	ff 06                	incl   (%esi)
100084aa:	40                   	inc    %eax
100084ab:	e9 68 ff ff ff       	jmp    0x10008418
100084b0:	85 ff                	test   %edi,%edi
100084b2:	74 04                	je     0x100084b8
100084b4:	80 27 00             	andb   $0x0,(%edi)
100084b7:	47                   	inc    %edi
100084b8:	ff 06                	incl   (%esi)
100084ba:	8b 5d 0c             	mov    0xc(%ebp),%ebx
100084bd:	e9 21 ff ff ff       	jmp    0x100083e3
100084c2:	8b 45 08             	mov    0x8(%ebp),%eax
100084c5:	85 c0                	test   %eax,%eax
100084c7:	74 03                	je     0x100084cc
100084c9:	83 20 00             	andl   $0x0,(%eax)
100084cc:	ff 03                	incl   (%ebx)
100084ce:	5f                   	pop    %edi
100084cf:	5b                   	pop    %ebx
100084d0:	c9                   	leave
100084d1:	c3                   	ret
100084d2:	55                   	push   %ebp
100084d3:	8b ec                	mov    %esp,%ebp
100084d5:	51                   	push   %ecx
100084d6:	51                   	push   %ecx
100084d7:	53                   	push   %ebx
100084d8:	56                   	push   %esi
100084d9:	57                   	push   %edi
100084da:	33 ff                	xor    %edi,%edi
100084dc:	39 3d 0c 04 01 10    	cmp    %edi,0x1001040c
100084e2:	75 05                	jne    0x100084e9
100084e4:	e8 4d 17 00 00       	call   0x10009c36
100084e9:	80 25 ec fe 00 10 00 	andb   $0x0,0x1000feec
100084f0:	68 04 01 00 00       	push   $0x104
100084f5:	be e8 fd 00 10       	mov    $0x1000fde8,%esi
100084fa:	56                   	push   %esi
100084fb:	57                   	push   %edi
100084fc:	ff 15 6c c0 00 10    	call   *0x1000c06c  ; 0x1000c06c=KERNEL32.dll!GetModuleFileNameA
10008502:	a1 14 04 01 10       	mov    0x10010414,%eax
10008507:	3b c7                	cmp    %edi,%eax
10008509:	89 35 d4 fd 00 10    	mov    %esi,0x1000fdd4
1000850f:	74 07                	je     0x10008518
10008511:	80 38 00             	cmpb   $0x0,(%eax)
10008514:	8b d8                	mov    %eax,%ebx
10008516:	75 02                	jne    0x1000851a
10008518:	8b de                	mov    %esi,%ebx
1000851a:	8d 45 fc             	lea    -0x4(%ebp),%eax
1000851d:	50                   	push   %eax
1000851e:	57                   	push   %edi
1000851f:	8d 75 f8             	lea    -0x8(%ebp),%esi
10008522:	33 c9                	xor    %ecx,%ecx
10008524:	8b c3                	mov    %ebx,%eax
10008526:	e8 3b fe ff ff       	call   0x10008366
1000852b:	8b 75 fc             	mov    -0x4(%ebp),%esi
1000852e:	8b 45 f8             	mov    -0x8(%ebp),%eax
10008531:	c1 e6 02             	shl    $0x2,%esi
10008534:	03 c6                	add    %esi,%eax
10008536:	50                   	push   %eax
10008537:	e8 76 df ff ff       	call   0x100064b2
1000853c:	8b f8                	mov    %eax,%edi
1000853e:	83 c4 0c             	add    $0xc,%esp
10008541:	85 ff                	test   %edi,%edi
10008543:	75 05                	jne    0x1000854a
10008545:	83 c8 ff             	or     $0xffffffff,%eax
10008548:	eb 25                	jmp    0x1000856f
1000854a:	8d 45 fc             	lea    -0x4(%ebp),%eax
1000854d:	50                   	push   %eax
1000854e:	8d 0c 3e             	lea    (%esi,%edi,1),%ecx
10008551:	57                   	push   %edi
10008552:	8d 75 f8             	lea    -0x8(%ebp),%esi
10008555:	8b c3                	mov    %ebx,%eax
10008557:	e8 0a fe ff ff       	call   0x10008366
1000855c:	8b 45 fc             	mov    -0x4(%ebp),%eax
1000855f:	48                   	dec    %eax
10008560:	59                   	pop    %ecx
10008561:	a3 b8 fd 00 10       	mov    %eax,0x1000fdb8
10008566:	59                   	pop    %ecx
10008567:	89 3d bc fd 00 10    	mov    %edi,0x1000fdbc
1000856d:	33 c0                	xor    %eax,%eax
1000856f:	5f                   	pop    %edi
10008570:	5e                   	pop    %esi
10008571:	5b                   	pop    %ebx
10008572:	c9                   	leave
10008573:	c3                   	ret
10008574:	51                   	push   %ecx
10008575:	51                   	push   %ecx
10008576:	a1 f0 fe 00 10       	mov    0x1000fef0,%eax
1000857b:	53                   	push   %ebx
1000857c:	55                   	push   %ebp
1000857d:	56                   	push   %esi
1000857e:	57                   	push   %edi
1000857f:	8b 3d a0 c0 00 10    	mov    0x1000c0a0,%edi  ; 0x1000c0a0=KERNEL32.dll!GetEnvironmentStringsW
10008585:	33 db                	xor    %ebx,%ebx
10008587:	33 f6                	xor    %esi,%esi
10008589:	3b c3                	cmp    %ebx,%eax
1000858b:	6a 02                	push   $0x2
1000858d:	5d                   	pop    %ebp
1000858e:	75 2d                	jne    0x100085bd
10008590:	ff d7                	call   *%edi
10008592:	8b f0                	mov    %eax,%esi
10008594:	3b f3                	cmp    %ebx,%esi
10008596:	74 0c                	je     0x100085a4
10008598:	c7 05 f0 fe 00 10 01 	movl   $0x1,0x1000fef0
1000859f:	00 00 00 
100085a2:	eb 1e                	jmp    0x100085c2
100085a4:	ff 15 4c c0 00 10    	call   *0x1000c04c  ; 0x1000c04c=KERNEL32.dll!GetLastError
100085aa:	83 f8 78             	cmp    $0x78,%eax
100085ad:	75 09                	jne    0x100085b8
100085af:	8b c5                	mov    %ebp,%eax
100085b1:	a3 f0 fe 00 10       	mov    %eax,0x1000fef0
100085b6:	eb 05                	jmp    0x100085bd
100085b8:	a1 f0 fe 00 10       	mov    0x1000fef0,%eax
100085bd:	83 f8 01             	cmp    $0x1,%eax
100085c0:	75 7d                	jne    0x1000863f
100085c2:	3b f3                	cmp    %ebx,%esi
100085c4:	75 08                	jne    0x100085ce
100085c6:	ff d7                	call   *%edi
100085c8:	8b f0                	mov    %eax,%esi
100085ca:	3b f3                	cmp    %ebx,%esi
100085cc:	74 79                	je     0x10008647
100085ce:	66 39 1e             	cmp    %bx,(%esi)
100085d1:	8b c6                	mov    %esi,%eax
100085d3:	74 0e                	je     0x100085e3
100085d5:	03 c5                	add    %ebp,%eax
100085d7:	66 39 18             	cmp    %bx,(%eax)
100085da:	75 f9                	jne    0x100085d5
100085dc:	03 c5                	add    %ebp,%eax
100085de:	66 39 18             	cmp    %bx,(%eax)
100085e1:	75 f2                	jne    0x100085d5
100085e3:	8b 3d 9c c0 00 10    	mov    0x1000c09c,%edi  ; 0x1000c09c=KERNEL32.dll!WideCharToMultiByte
100085e9:	53                   	push   %ebx
100085ea:	53                   	push   %ebx
100085eb:	53                   	push   %ebx
100085ec:	2b c6                	sub    %esi,%eax
100085ee:	53                   	push   %ebx
100085ef:	d1 f8                	sar    $1,%eax
100085f1:	40                   	inc    %eax
100085f2:	50                   	push   %eax
100085f3:	56                   	push   %esi
100085f4:	53                   	push   %ebx
100085f5:	53                   	push   %ebx
100085f6:	89 44 24 34          	mov    %eax,0x34(%esp)
100085fa:	ff d7                	call   *%edi
100085fc:	8b e8                	mov    %eax,%ebp
100085fe:	3b eb                	cmp    %ebx,%ebp
10008600:	74 32                	je     0x10008634
10008602:	55                   	push   %ebp
10008603:	e8 aa de ff ff       	call   0x100064b2
10008608:	3b c3                	cmp    %ebx,%eax
1000860a:	59                   	pop    %ecx
1000860b:	89 44 24 10          	mov    %eax,0x10(%esp)
1000860f:	74 23                	je     0x10008634
10008611:	53                   	push   %ebx
10008612:	53                   	push   %ebx
10008613:	55                   	push   %ebp
10008614:	50                   	push   %eax
10008615:	ff 74 24 24          	push   0x24(%esp)
10008619:	56                   	push   %esi
1000861a:	53                   	push   %ebx
1000861b:	53                   	push   %ebx
1000861c:	ff d7                	call   *%edi
1000861e:	85 c0                	test   %eax,%eax
10008620:	75 0e                	jne    0x10008630
10008622:	ff 74 24 10          	push   0x10(%esp)
10008626:	e8 96 e3 ff ff       	call   0x100069c1
1000862b:	59                   	pop    %ecx
1000862c:	89 5c 24 10          	mov    %ebx,0x10(%esp)
10008630:	8b 5c 24 10          	mov    0x10(%esp),%ebx
10008634:	56                   	push   %esi
10008635:	ff 15 98 c0 00 10    	call   *0x1000c098  ; 0x1000c098=KERNEL32.dll!FreeEnvironmentStringsW
1000863b:	8b c3                	mov    %ebx,%eax
1000863d:	eb 50                	jmp    0x1000868f
1000863f:	3b c5                	cmp    %ebp,%eax
10008641:	74 08                	je     0x1000864b
10008643:	3b c3                	cmp    %ebx,%eax
10008645:	74 04                	je     0x1000864b
10008647:	33 c0                	xor    %eax,%eax
10008649:	eb 44                	jmp    0x1000868f
1000864b:	ff 15 94 c0 00 10    	call   *0x1000c094  ; 0x1000c094=KERNEL32.dll!GetEnvironmentStrings
10008651:	8b f0                	mov    %eax,%esi
10008653:	3b f3                	cmp    %ebx,%esi
10008655:	74 f0                	je     0x10008647
10008657:	38 1e                	cmp    %bl,(%esi)
10008659:	74 0a                	je     0x10008665
1000865b:	40                   	inc    %eax
1000865c:	38 18                	cmp    %bl,(%eax)
1000865e:	75 fb                	jne    0x1000865b
10008660:	40                   	inc    %eax
10008661:	38 18                	cmp    %bl,(%eax)
10008663:	75 f6                	jne    0x1000865b
10008665:	2b c6                	sub    %esi,%eax
10008667:	40                   	inc    %eax
10008668:	8b e8                	mov    %eax,%ebp
1000866a:	55                   	push   %ebp
1000866b:	e8 42 de ff ff       	call   0x100064b2
10008670:	8b f8                	mov    %eax,%edi
10008672:	3b fb                	cmp    %ebx,%edi
10008674:	59                   	pop    %ecx
10008675:	75 04                	jne    0x1000867b
10008677:	33 ff                	xor    %edi,%edi
10008679:	eb 0b                	jmp    0x10008686
1000867b:	55                   	push   %ebp
1000867c:	56                   	push   %esi
1000867d:	57                   	push   %edi
1000867e:	e8 ed de ff ff       	call   0x10006570
10008683:	83 c4 0c             	add    $0xc,%esp
10008686:	56                   	push   %esi
10008687:	ff 15 90 c0 00 10    	call   *0x1000c090  ; 0x1000c090=KERNEL32.dll!FreeEnvironmentStringsA
1000868d:	8b c7                	mov    %edi,%eax
1000868f:	5f                   	pop    %edi
10008690:	5e                   	pop    %esi
10008691:	5d                   	pop    %ebp
10008692:	5b                   	pop    %ebx
10008693:	59                   	pop    %ecx
10008694:	59                   	pop    %ecx
10008695:	c3                   	ret
10008696:	6a 0c                	push   $0xc
10008698:	68 d8 c7 00 10       	push   $0x1000c7d8
1000869d:	e8 12 f7 ff ff       	call   0x10007db4
100086a2:	c7 45 e4 c8 d3 00 10 	movl   $0x1000d3c8,-0x1c(%ebp)
100086a9:	81 7d e4 c8 d3 00 10 	cmpl   $0x1000d3c8,-0x1c(%ebp)
100086b0:	73 22                	jae    0x100086d4
100086b2:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
100086b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
100086b9:	8b 00                	mov    (%eax),%eax
100086bb:	85 c0                	test   %eax,%eax
100086bd:	74 0b                	je     0x100086ca
100086bf:	ff d0                	call   *%eax
100086c1:	eb 07                	jmp    0x100086ca
100086c3:	33 c0                	xor    %eax,%eax
100086c5:	40                   	inc    %eax
100086c6:	c3                   	ret
100086c7:	8b 65 e8             	mov    -0x18(%ebp),%esp
100086ca:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
100086ce:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
100086d2:	eb d5                	jmp    0x100086a9
100086d4:	e8 16 f7 ff ff       	call   0x10007def
100086d9:	c3                   	ret
100086da:	6a 0c                	push   $0xc
100086dc:	68 e8 c7 00 10       	push   $0x1000c7e8
100086e1:	e8 ce f6 ff ff       	call   0x10007db4
100086e6:	c7 45 e4 d0 d3 00 10 	movl   $0x1000d3d0,-0x1c(%ebp)
100086ed:	81 7d e4 d0 d3 00 10 	cmpl   $0x1000d3d0,-0x1c(%ebp)
100086f4:	73 22                	jae    0x10008718
100086f6:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
100086fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
100086fd:	8b 00                	mov    (%eax),%eax
100086ff:	85 c0                	test   %eax,%eax
10008701:	74 0b                	je     0x1000870e
10008703:	ff d0                	call   *%eax
10008705:	eb 07                	jmp    0x1000870e
10008707:	33 c0                	xor    %eax,%eax
10008709:	40                   	inc    %eax
1000870a:	c3                   	ret
1000870b:	8b 65 e8             	mov    -0x18(%ebp),%esp
1000870e:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
10008712:	83 45 e4 04          	addl   $0x4,-0x1c(%ebp)
10008716:	eb d5                	jmp    0x100086ed
10008718:	e8 d2 f6 ff ff       	call   0x10007def
1000871d:	c3                   	ret
1000871e:	83 3d a4 fd 00 10 02 	cmpl   $0x2,0x1000fda4
10008725:	75 0d                	jne    0x10008734
10008727:	83 3d b0 fd 00 10 05 	cmpl   $0x5,0x1000fdb0
1000872e:	72 04                	jb     0x10008734
10008730:	33 c0                	xor    %eax,%eax
10008732:	40                   	inc    %eax
10008733:	c3                   	ret
10008734:	6a 03                	push   $0x3
10008736:	58                   	pop    %eax
10008737:	c3                   	ret
10008738:	33 c0                	xor    %eax,%eax
1000873a:	39 44 24 04          	cmp    %eax,0x4(%esp)
1000873e:	6a 00                	push   $0x0
10008740:	0f 94 c0             	sete   %al
10008743:	68 00 10 00 00       	push   $0x1000
10008748:	50                   	push   %eax
10008749:	ff 15 a8 c0 00 10    	call   *0x1000c0a8  ; 0x1000c0a8=KERNEL32.dll!HeapCreate
1000874f:	85 c0                	test   %eax,%eax
10008751:	a3 dc 02 01 10       	mov    %eax,0x100102dc
10008756:	74 2a                	je     0x10008782
10008758:	e8 c1 ff ff ff       	call   0x1000871e
1000875d:	83 f8 03             	cmp    $0x3,%eax
10008760:	a3 e0 02 01 10       	mov    %eax,0x100102e0
10008765:	75 1e                	jne    0x10008785
10008767:	68 f8 03 00 00       	push   $0x3f8
1000876c:	e8 47 02 00 00       	call   0x100089b8
10008771:	85 c0                	test   %eax,%eax
10008773:	59                   	pop    %ecx
10008774:	75 0f                	jne    0x10008785
10008776:	ff 35 dc 02 01 10    	push   0x100102dc
1000877c:	ff 15 a4 c0 00 10    	call   *0x1000c0a4  ; 0x1000c0a4=KERNEL32.dll!HeapDestroy
10008782:	33 c0                	xor    %eax,%eax
10008784:	c3                   	ret
10008785:	33 c0                	xor    %eax,%eax
10008787:	40                   	inc    %eax
10008788:	c3                   	ret
10008789:	83 3d e0 02 01 10 03 	cmpl   $0x3,0x100102e0
10008790:	75 69                	jne    0x100087fb
10008792:	53                   	push   %ebx
10008793:	33 db                	xor    %ebx,%ebx
10008795:	39 1d c4 02 01 10    	cmp    %ebx,0x100102c4
1000879b:	55                   	push   %ebp
1000879c:	8b 2d 38 c0 00 10    	mov    0x1000c038,%ebp  ; 0x1000c038=KERNEL32.dll!HeapFree
100087a2:	7e 45                	jle    0x100087e9
100087a4:	56                   	push   %esi
100087a5:	8b 35 c8 02 01 10    	mov    0x100102c8,%esi
100087ab:	57                   	push   %edi
100087ac:	8b 3d ac c0 00 10    	mov    0x1000c0ac,%edi  ; 0x1000c0ac=KERNEL32.dll!VirtualFree
100087b2:	83 c6 0c             	add    $0xc,%esi
100087b5:	68 00 40 00 00       	push   $0x4000
100087ba:	68 00 00 10 00       	push   $0x100000
100087bf:	ff 36                	push   (%esi)
100087c1:	ff d7                	call   *%edi
100087c3:	68 00 80 00 00       	push   $0x8000
100087c8:	6a 00                	push   $0x0
100087ca:	ff 36                	push   (%esi)
100087cc:	ff d7                	call   *%edi
100087ce:	ff 76 04             	push   0x4(%esi)
100087d1:	6a 00                	push   $0x0
100087d3:	ff 35 dc 02 01 10    	push   0x100102dc
100087d9:	ff d5                	call   *%ebp
100087db:	83 c6 14             	add    $0x14,%esi
100087de:	43                   	inc    %ebx
100087df:	3b 1d c4 02 01 10    	cmp    0x100102c4,%ebx
100087e5:	7c ce                	jl     0x100087b5
100087e7:	5f                   	pop    %edi
100087e8:	5e                   	pop    %esi
100087e9:	ff 35 c8 02 01 10    	push   0x100102c8
100087ef:	6a 00                	push   $0x0
100087f1:	ff 35 dc 02 01 10    	push   0x100102dc
100087f7:	ff d5                	call   *%ebp
100087f9:	5d                   	pop    %ebp
100087fa:	5b                   	pop    %ebx
100087fb:	ff 35 dc 02 01 10    	push   0x100102dc
10008801:	ff 15 a4 c0 00 10    	call   *0x1000c0a4  ; 0x1000c0a4=KERNEL32.dll!HeapDestroy
10008807:	c3                   	ret
10008808:	55                   	push   %ebp
10008809:	8b ec                	mov    %esp,%ebp
1000880b:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
10008811:	a1 30 f1 00 10       	mov    0x1000f130,%eax
10008816:	33 45 04             	xor    0x4(%ebp),%eax
10008819:	8b 4d 08             	mov    0x8(%ebp),%ecx
1000881c:	53                   	push   %ebx
1000881d:	56                   	push   %esi
1000881e:	89 45 fc             	mov    %eax,-0x4(%ebp)
10008821:	33 d2                	xor    %edx,%edx
10008823:	57                   	push   %edi
10008824:	33 c0                	xor    %eax,%eax
10008826:	3b 0c c5 48 f4 00 10 	cmp    0x1000f448(,%eax,8),%ecx
1000882d:	74 06                	je     0x10008835
1000882f:	40                   	inc    %eax
10008830:	83 f8 12             	cmp    $0x12,%eax
10008833:	72 f1                	jb     0x10008826
10008835:	8b f0                	mov    %eax,%esi
10008837:	c1 e6 03             	shl    $0x3,%esi
1000883a:	3b 8e 48 f4 00 10    	cmp    0x1000f448(%esi),%ecx
10008840:	0f 85 23 01 00 00    	jne    0x10008969
10008846:	a1 2c fc 00 10       	mov    0x1000fc2c,%eax
1000884b:	83 f8 01             	cmp    $0x1,%eax
1000884e:	0f 84 f0 00 00 00    	je     0x10008944
10008854:	3b c2                	cmp    %edx,%eax
10008856:	75 0d                	jne    0x10008865
10008858:	83 3d 30 fc 00 10 01 	cmpl   $0x1,0x1000fc30
1000885f:	0f 84 df 00 00 00    	je     0x10008944
10008865:	81 f9 fc 00 00 00    	cmp    $0xfc,%ecx
1000886b:	0f 84 f8 00 00 00    	je     0x10008969
10008871:	68 04 01 00 00       	push   $0x104
10008876:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
1000887c:	50                   	push   %eax
1000887d:	52                   	push   %edx
1000887e:	88 55 f8             	mov    %dl,-0x8(%ebp)
10008881:	ff 15 6c c0 00 10    	call   *0x1000c06c  ; 0x1000c06c=KERNEL32.dll!GetModuleFileNameA
10008887:	85 c0                	test   %eax,%eax
10008889:	75 13                	jne    0x1000889e
1000888b:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
10008891:	68 f0 c5 00 10       	push   $0x1000c5f0  ; 0x1000c5f0='<program name unknown>'
10008896:	50                   	push   %eax
10008897:	e8 a4 ed ff ff       	call   0x10007640
1000889c:	59                   	pop    %ecx
1000889d:	59                   	pop    %ecx
1000889e:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
100088a4:	50                   	push   %eax
100088a5:	8d bd f4 fe ff ff    	lea    -0x10c(%ebp),%edi
100088ab:	e8 30 dc ff ff       	call   0x100064e0
100088b0:	40                   	inc    %eax
100088b1:	83 f8 3c             	cmp    $0x3c,%eax
100088b4:	59                   	pop    %ecx
100088b5:	76 29                	jbe    0x100088e0
100088b7:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
100088bd:	50                   	push   %eax
100088be:	e8 1d dc ff ff       	call   0x100064e0
100088c3:	8b f8                	mov    %eax,%edi
100088c5:	8d 85 f4 fe ff ff    	lea    -0x10c(%ebp),%eax
100088cb:	83 e8 3b             	sub    $0x3b,%eax
100088ce:	6a 03                	push   $0x3
100088d0:	03 f8                	add    %eax,%edi
100088d2:	68 ec c5 00 10       	push   $0x1000c5ec
100088d7:	57                   	push   %edi
100088d8:	e8 f3 18 00 00       	call   0x1000a1d0
100088dd:	83 c4 10             	add    $0x10,%esp
100088e0:	57                   	push   %edi
100088e1:	e8 fa db ff ff       	call   0x100064e0
100088e6:	ff b6 4c f4 00 10    	push   0x1000f44c(%esi)
100088ec:	8b d8                	mov    %eax,%ebx
100088ee:	e8 ed db ff ff       	call   0x100064e0
100088f3:	8d 44 03 1c          	lea    0x1c(%ebx,%eax,1),%eax
100088f7:	59                   	pop    %ecx
100088f8:	83 c0 03             	add    $0x3,%eax
100088fb:	59                   	pop    %ecx
100088fc:	83 e0 fc             	and    $0xfffffffc,%eax
100088ff:	e8 7c d8 ff ff       	call   0x10006180
10008904:	8b dc                	mov    %esp,%ebx
10008906:	68 f8 ca 00 10       	push   $0x1000caf8  ; 0x1000caf8='Runtime Error!'
1000890b:	53                   	push   %ebx
1000890c:	e8 2f ed ff ff       	call   0x10007640
10008911:	57                   	push   %edi
10008912:	53                   	push   %ebx
10008913:	e8 38 ed ff ff       	call   0x10007650
10008918:	68 e8 c5 00 10       	push   $0x1000c5e8
1000891d:	53                   	push   %ebx
1000891e:	e8 2d ed ff ff       	call   0x10007650
10008923:	ff b6 4c f4 00 10    	push   0x1000f44c(%esi)
10008929:	53                   	push   %ebx
1000892a:	e8 21 ed ff ff       	call   0x10007650
1000892f:	68 10 20 01 00       	push   $0x12010
10008934:	68 b4 c5 00 10       	push   $0x1000c5b4  ; 0x1000c5b4='Microsoft Visual C++ Runtime Library'
10008939:	53                   	push   %ebx
1000893a:	e8 61 1b 00 00       	call   0x1000a4a0
1000893f:	83 c4 2c             	add    $0x2c,%esp
10008942:	eb 25                	jmp    0x10008969
10008944:	52                   	push   %edx
10008945:	8d 45 08             	lea    0x8(%ebp),%eax
10008948:	50                   	push   %eax
10008949:	8d b6 4c f4 00 10    	lea    0x1000f44c(%esi),%esi
1000894f:	ff 36                	push   (%esi)
10008951:	e8 8a db ff ff       	call   0x100064e0
10008956:	59                   	pop    %ecx
10008957:	50                   	push   %eax
10008958:	ff 36                	push   (%esi)
1000895a:	6a f4                	push   $0xfffffff4
1000895c:	ff 15 84 c0 00 10    	call   *0x1000c084  ; 0x1000c084=KERNEL32.dll!GetStdHandle
10008962:	50                   	push   %eax
10008963:	ff 15 b0 c0 00 10    	call   *0x1000c0b0  ; 0x1000c0b0=KERNEL32.dll!WriteFile
10008969:	8d a5 e8 fe ff ff    	lea    -0x118(%ebp),%esp
1000896f:	8b 4d fc             	mov    -0x4(%ebp),%ecx
10008972:	33 4d 04             	xor    0x4(%ebp),%ecx
10008975:	e8 f1 d7 ff ff       	call   0x1000616b
1000897a:	5f                   	pop    %edi
1000897b:	5e                   	pop    %esi
1000897c:	5b                   	pop    %ebx
1000897d:	c9                   	leave
1000897e:	c3                   	ret
1000897f:	a1 2c fc 00 10       	mov    0x1000fc2c,%eax
10008984:	83 f8 01             	cmp    $0x1,%eax
10008987:	74 0d                	je     0x10008996
10008989:	85 c0                	test   %eax,%eax
1000898b:	75 2a                	jne    0x100089b7
1000898d:	83 3d 30 fc 00 10 01 	cmpl   $0x1,0x1000fc30
10008994:	75 21                	jne    0x100089b7
10008996:	68 fc 00 00 00       	push   $0xfc
1000899b:	e8 68 fe ff ff       	call   0x10008808
100089a0:	a1 f4 fe 00 10       	mov    0x1000fef4,%eax
100089a5:	85 c0                	test   %eax,%eax
100089a7:	59                   	pop    %ecx
100089a8:	74 02                	je     0x100089ac
100089aa:	ff d0                	call   *%eax
100089ac:	68 ff 00 00 00       	push   $0xff
100089b1:	e8 52 fe ff ff       	call   0x10008808
100089b6:	59                   	pop    %ecx
100089b7:	c3                   	ret
100089b8:	68 40 01 00 00       	push   $0x140
100089bd:	6a 00                	push   $0x0
100089bf:	ff 35 dc 02 01 10    	push   0x100102dc
100089c5:	ff 15 34 c0 00 10    	call   *0x1000c034  ; 0x1000c034=KERNEL32.dll!HeapAlloc
100089cb:	85 c0                	test   %eax,%eax
100089cd:	a3 c8 02 01 10       	mov    %eax,0x100102c8
100089d2:	75 01                	jne    0x100089d5
100089d4:	c3                   	ret
100089d5:	8b 4c 24 04          	mov    0x4(%esp),%ecx
100089d9:	83 25 c0 02 01 10 00 	andl   $0x0,0x100102c0
100089e0:	83 25 c4 02 01 10 00 	andl   $0x0,0x100102c4
100089e7:	a3 d0 02 01 10       	mov    %eax,0x100102d0
100089ec:	33 c0                	xor    %eax,%eax
100089ee:	89 0d cc 02 01 10    	mov    %ecx,0x100102cc
100089f4:	c7 05 d4 02 01 10 10 	movl   $0x10,0x100102d4
100089fb:	00 00 00 
100089fe:	40                   	inc    %eax
100089ff:	c3                   	ret
10008a00:	a1 c4 02 01 10       	mov    0x100102c4,%eax
10008a05:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
10008a08:	a1 c8 02 01 10       	mov    0x100102c8,%eax
10008a0d:	8d 0c 88             	lea    (%eax,%ecx,4),%ecx
10008a10:	eb 12                	jmp    0x10008a24
10008a12:	8b 54 24 04          	mov    0x4(%esp),%edx
10008a16:	2b 50 0c             	sub    0xc(%eax),%edx
10008a19:	81 fa 00 00 10 00    	cmp    $0x100000,%edx
10008a1f:	72 09                	jb     0x10008a2a
10008a21:	83 c0 14             	add    $0x14,%eax
10008a24:	3b c1                	cmp    %ecx,%eax
10008a26:	72 ea                	jb     0x10008a12
10008a28:	33 c0                	xor    %eax,%eax
10008a2a:	c3                   	ret
10008a2b:	55                   	push   %ebp
10008a2c:	8b ec                	mov    %esp,%ebp
10008a2e:	83 ec 10             	sub    $0x10,%esp
10008a31:	8b 4d 08             	mov    0x8(%ebp),%ecx
10008a34:	8b 41 10             	mov    0x10(%ecx),%eax
10008a37:	56                   	push   %esi
10008a38:	8b 75 0c             	mov    0xc(%ebp),%esi
10008a3b:	57                   	push   %edi
10008a3c:	8b fe                	mov    %esi,%edi
10008a3e:	2b 79 0c             	sub    0xc(%ecx),%edi
10008a41:	83 c6 fc             	add    $0xfffffffc,%esi
10008a44:	c1 ef 0f             	shr    $0xf,%edi
10008a47:	8b cf                	mov    %edi,%ecx
10008a49:	69 c9 04 02 00 00    	imul   $0x204,%ecx,%ecx
10008a4f:	8d 8c 01 44 01 00 00 	lea    0x144(%ecx,%eax,1),%ecx
10008a56:	89 4d f0             	mov    %ecx,-0x10(%ebp)
10008a59:	8b 0e                	mov    (%esi),%ecx
10008a5b:	49                   	dec    %ecx
10008a5c:	f6 c1 01             	test   $0x1,%cl
10008a5f:	89 4d fc             	mov    %ecx,-0x4(%ebp)
10008a62:	0f 85 d7 02 00 00    	jne    0x10008d3f
10008a68:	53                   	push   %ebx
10008a69:	8d 1c 31             	lea    (%ecx,%esi,1),%ebx
10008a6c:	8b 13                	mov    (%ebx),%edx
10008a6e:	89 55 f4             	mov    %edx,-0xc(%ebp)
10008a71:	8b 56 fc             	mov    -0x4(%esi),%edx
10008a74:	89 55 f8             	mov    %edx,-0x8(%ebp)
10008a77:	8b 55 f4             	mov    -0xc(%ebp),%edx
10008a7a:	f6 c2 01             	test   $0x1,%dl
10008a7d:	89 5d 0c             	mov    %ebx,0xc(%ebp)
10008a80:	75 74                	jne    0x10008af6
10008a82:	c1 fa 04             	sar    $0x4,%edx
10008a85:	4a                   	dec    %edx
10008a86:	83 fa 3f             	cmp    $0x3f,%edx
10008a89:	76 03                	jbe    0x10008a8e
10008a8b:	6a 3f                	push   $0x3f
10008a8d:	5a                   	pop    %edx
10008a8e:	8b 4b 04             	mov    0x4(%ebx),%ecx
10008a91:	3b 4b 08             	cmp    0x8(%ebx),%ecx
10008a94:	75 42                	jne    0x10008ad8
10008a96:	83 fa 20             	cmp    $0x20,%edx
10008a99:	bb 00 00 00 80       	mov    $0x80000000,%ebx
10008a9e:	73 19                	jae    0x10008ab9
10008aa0:	8b ca                	mov    %edx,%ecx
10008aa2:	d3 eb                	shr    %cl,%ebx
10008aa4:	8d 4c 02 04          	lea    0x4(%edx,%eax,1),%ecx
10008aa8:	f7 d3                	not    %ebx
10008aaa:	21 5c b8 44          	and    %ebx,0x44(%eax,%edi,4)
10008aae:	fe 09                	decb   (%ecx)
10008ab0:	75 23                	jne    0x10008ad5
10008ab2:	8b 4d 08             	mov    0x8(%ebp),%ecx
10008ab5:	21 19                	and    %ebx,(%ecx)
10008ab7:	eb 1c                	jmp    0x10008ad5
10008ab9:	8d 4a e0             	lea    -0x20(%edx),%ecx
10008abc:	d3 eb                	shr    %cl,%ebx
10008abe:	8d 4c 02 04          	lea    0x4(%edx,%eax,1),%ecx
10008ac2:	f7 d3                	not    %ebx
10008ac4:	21 9c b8 c4 00 00 00 	and    %ebx,0xc4(%eax,%edi,4)
10008acb:	fe 09                	decb   (%ecx)
10008acd:	75 06                	jne    0x10008ad5
10008acf:	8b 4d 08             	mov    0x8(%ebp),%ecx
10008ad2:	21 59 04             	and    %ebx,0x4(%ecx)
10008ad5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
10008ad8:	8b 53 08             	mov    0x8(%ebx),%edx
10008adb:	8b 5b 04             	mov    0x4(%ebx),%ebx
10008ade:	8b 4d fc             	mov    -0x4(%ebp),%ecx
10008ae1:	03 4d f4             	add    -0xc(%ebp),%ecx
10008ae4:	89 5a 04             	mov    %ebx,0x4(%edx)
10008ae7:	8b 55 0c             	mov    0xc(%ebp),%edx
10008aea:	8b 5a 04             	mov    0x4(%edx),%ebx
10008aed:	8b 52 08             	mov    0x8(%edx),%edx
10008af0:	89 53 08             	mov    %edx,0x8(%ebx)
10008af3:	89 4d fc             	mov    %ecx,-0x4(%ebp)
10008af6:	8b d1                	mov    %ecx,%edx
10008af8:	c1 fa 04             	sar    $0x4,%edx
10008afb:	4a                   	dec    %edx
10008afc:	83 fa 3f             	cmp    $0x3f,%edx
10008aff:	76 03                	jbe    0x10008b04
10008b01:	6a 3f                	push   $0x3f
10008b03:	5a                   	pop    %edx
10008b04:	8b 5d f8             	mov    -0x8(%ebp),%ebx
10008b07:	83 e3 01             	and    $0x1,%ebx
10008b0a:	89 5d f4             	mov    %ebx,-0xc(%ebp)
10008b0d:	0f 85 8f 00 00 00    	jne    0x10008ba2
10008b13:	2b 75 f8             	sub    -0x8(%ebp),%esi
10008b16:	8b 5d f8             	mov    -0x8(%ebp),%ebx
10008b19:	c1 fb 04             	sar    $0x4,%ebx
10008b1c:	6a 3f                	push   $0x3f
10008b1e:	89 75 0c             	mov    %esi,0xc(%ebp)
10008b21:	4b                   	dec    %ebx
10008b22:	5e                   	pop    %esi
10008b23:	3b de                	cmp    %esi,%ebx
10008b25:	76 02                	jbe    0x10008b29
10008b27:	8b de                	mov    %esi,%ebx
10008b29:	03 4d f8             	add    -0x8(%ebp),%ecx
10008b2c:	8b d1                	mov    %ecx,%edx
10008b2e:	c1 fa 04             	sar    $0x4,%edx
10008b31:	4a                   	dec    %edx
10008b32:	3b d6                	cmp    %esi,%edx
10008b34:	89 4d fc             	mov    %ecx,-0x4(%ebp)
10008b37:	76 02                	jbe    0x10008b3b
10008b39:	8b d6                	mov    %esi,%edx
10008b3b:	3b da                	cmp    %edx,%ebx
10008b3d:	74 5e                	je     0x10008b9d
10008b3f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
10008b42:	8b 71 04             	mov    0x4(%ecx),%esi
10008b45:	3b 71 08             	cmp    0x8(%ecx),%esi
10008b48:	75 3b                	jne    0x10008b85
10008b4a:	83 fb 20             	cmp    $0x20,%ebx
10008b4d:	be 00 00 00 80       	mov    $0x80000000,%esi
10008b52:	73 17                	jae    0x10008b6b
10008b54:	8b cb                	mov    %ebx,%ecx
10008b56:	d3 ee                	shr    %cl,%esi
10008b58:	f7 d6                	not    %esi
10008b5a:	21 74 b8 44          	and    %esi,0x44(%eax,%edi,4)
10008b5e:	fe 4c 03 04          	decb   0x4(%ebx,%eax,1)
10008b62:	75 21                	jne    0x10008b85
10008b64:	8b 4d 08             	mov    0x8(%ebp),%ecx
10008b67:	21 31                	and    %esi,(%ecx)
10008b69:	eb 1a                	jmp    0x10008b85
10008b6b:	8d 4b e0             	lea    -0x20(%ebx),%ecx
10008b6e:	d3 ee                	shr    %cl,%esi
10008b70:	f7 d6                	not    %esi
10008b72:	21 b4 b8 c4 00 00 00 	and    %esi,0xc4(%eax,%edi,4)
10008b79:	fe 4c 03 04          	decb   0x4(%ebx,%eax,1)
10008b7d:	75 06                	jne    0x10008b85
10008b7f:	8b 4d 08             	mov    0x8(%ebp),%ecx
10008b82:	21 71 04             	and    %esi,0x4(%ecx)
10008b85:	8b 4d 0c             	mov    0xc(%ebp),%ecx
10008b88:	8b 71 08             	mov    0x8(%ecx),%esi
10008b8b:	8b 49 04             	mov    0x4(%ecx),%ecx
10008b8e:	89 4e 04             	mov    %ecx,0x4(%esi)
10008b91:	8b 4d 0c             	mov    0xc(%ebp),%ecx
10008b94:	8b 71 04             	mov    0x4(%ecx),%esi
10008b97:	8b 49 08             	mov    0x8(%ecx),%ecx
10008b9a:	89 4e 08             	mov    %ecx,0x8(%esi)
10008b9d:	8b 75 0c             	mov    0xc(%ebp),%esi
10008ba0:	eb 03                	jmp    0x10008ba5
10008ba2:	8b 5d 08             	mov    0x8(%ebp),%ebx
10008ba5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
10008ba9:	75 08                	jne    0x10008bb3
10008bab:	3b da                	cmp    %edx,%ebx
10008bad:	0f 84 80 00 00 00    	je     0x10008c33
10008bb3:	8b 4d f0             	mov    -0x10(%ebp),%ecx
10008bb6:	8d 0c d1             	lea    (%ecx,%edx,8),%ecx
10008bb9:	8b 59 04             	mov    0x4(%ecx),%ebx
10008bbc:	89 4e 08             	mov    %ecx,0x8(%esi)
10008bbf:	89 5e 04             	mov    %ebx,0x4(%esi)
10008bc2:	89 71 04             	mov    %esi,0x4(%ecx)
10008bc5:	8b 4e 04             	mov    0x4(%esi),%ecx
10008bc8:	89 71 08             	mov    %esi,0x8(%ecx)
10008bcb:	8b 4e 04             	mov    0x4(%esi),%ecx
10008bce:	3b 4e 08             	cmp    0x8(%esi),%ecx
10008bd1:	75 60                	jne    0x10008c33
10008bd3:	8a 4c 02 04          	mov    0x4(%edx,%eax,1),%cl
10008bd7:	88 4d 0f             	mov    %cl,0xf(%ebp)
10008bda:	fe c1                	inc    %cl
10008bdc:	83 fa 20             	cmp    $0x20,%edx
10008bdf:	88 4c 02 04          	mov    %cl,0x4(%edx,%eax,1)
10008be3:	73 25                	jae    0x10008c0a
10008be5:	80 7d 0f 00          	cmpb   $0x0,0xf(%ebp)
10008be9:	75 0e                	jne    0x10008bf9
10008beb:	8b ca                	mov    %edx,%ecx
10008bed:	bb 00 00 00 80       	mov    $0x80000000,%ebx
10008bf2:	d3 eb                	shr    %cl,%ebx
10008bf4:	8b 4d 08             	mov    0x8(%ebp),%ecx
10008bf7:	09 19                	or     %ebx,(%ecx)
10008bf9:	bb 00 00 00 80       	mov    $0x80000000,%ebx
10008bfe:	8b ca                	mov    %edx,%ecx
10008c00:	d3 eb                	shr    %cl,%ebx
10008c02:	8d 44 b8 44          	lea    0x44(%eax,%edi,4),%eax
10008c06:	09 18                	or     %ebx,(%eax)
10008c08:	eb 29                	jmp    0x10008c33
10008c0a:	80 7d 0f 00          	cmpb   $0x0,0xf(%ebp)
10008c0e:	75 10                	jne    0x10008c20
10008c10:	8d 4a e0             	lea    -0x20(%edx),%ecx
10008c13:	bb 00 00 00 80       	mov    $0x80000000,%ebx
10008c18:	d3 eb                	shr    %cl,%ebx
10008c1a:	8b 4d 08             	mov    0x8(%ebp),%ecx
10008c1d:	09 59 04             	or     %ebx,0x4(%ecx)
10008c20:	8d 4a e0             	lea    -0x20(%edx),%ecx
10008c23:	ba 00 00 00 80       	mov    $0x80000000,%edx
10008c28:	d3 ea                	shr    %cl,%edx
10008c2a:	8d 84 b8 c4 00 00 00 	lea    0xc4(%eax,%edi,4),%eax
10008c31:	09 10                	or     %edx,(%eax)
10008c33:	8b 45 fc             	mov    -0x4(%ebp),%eax
10008c36:	89 06                	mov    %eax,(%esi)
10008c38:	89 44 30 fc          	mov    %eax,-0x4(%eax,%esi,1)
10008c3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
10008c3f:	ff 08                	decl   (%eax)
10008c41:	0f 85 f7 00 00 00    	jne    0x10008d3e
10008c47:	a1 c0 02 01 10       	mov    0x100102c0,%eax
10008c4c:	85 c0                	test   %eax,%eax
10008c4e:	0f 84 dc 00 00 00    	je     0x10008d30
10008c54:	8b 0d d8 02 01 10    	mov    0x100102d8,%ecx
10008c5a:	8b 35 ac c0 00 10    	mov    0x1000c0ac,%esi  ; 0x1000c0ac=KERNEL32.dll!VirtualFree
10008c60:	68 00 40 00 00       	push   $0x4000
10008c65:	c1 e1 0f             	shl    $0xf,%ecx
10008c68:	03 48 0c             	add    0xc(%eax),%ecx
10008c6b:	bb 00 80 00 00       	mov    $0x8000,%ebx
10008c70:	53                   	push   %ebx
10008c71:	51                   	push   %ecx
10008c72:	ff d6                	call   *%esi
10008c74:	8b 0d d8 02 01 10    	mov    0x100102d8,%ecx
10008c7a:	a1 c0 02 01 10       	mov    0x100102c0,%eax
10008c7f:	ba 00 00 00 80       	mov    $0x80000000,%edx
10008c84:	d3 ea                	shr    %cl,%edx
10008c86:	09 50 08             	or     %edx,0x8(%eax)
10008c89:	a1 c0 02 01 10       	mov    0x100102c0,%eax
10008c8e:	8b 40 10             	mov    0x10(%eax),%eax
10008c91:	8b 0d d8 02 01 10    	mov    0x100102d8,%ecx
10008c97:	83 a4 88 c4 00 00 00 	andl   $0x0,0xc4(%eax,%ecx,4)
10008c9e:	00 
10008c9f:	a1 c0 02 01 10       	mov    0x100102c0,%eax
10008ca4:	8b 40 10             	mov    0x10(%eax),%eax
10008ca7:	fe 48 43             	decb   0x43(%eax)
10008caa:	a1 c0 02 01 10       	mov    0x100102c0,%eax
10008caf:	8b 48 10             	mov    0x10(%eax),%ecx
10008cb2:	80 79 43 00          	cmpb   $0x0,0x43(%ecx)
10008cb6:	75 09                	jne    0x10008cc1
10008cb8:	83 60 04 fe          	andl   $0xfffffffe,0x4(%eax)
10008cbc:	a1 c0 02 01 10       	mov    0x100102c0,%eax
10008cc1:	83 78 08 ff          	cmpl   $0xffffffff,0x8(%eax)
10008cc5:	75 69                	jne    0x10008d30
10008cc7:	53                   	push   %ebx
10008cc8:	6a 00                	push   $0x0
10008cca:	ff 70 0c             	push   0xc(%eax)
10008ccd:	ff d6                	call   *%esi
10008ccf:	a1 c0 02 01 10       	mov    0x100102c0,%eax
10008cd4:	ff 70 10             	push   0x10(%eax)
10008cd7:	6a 00                	push   $0x0
10008cd9:	ff 35 dc 02 01 10    	push   0x100102dc
10008cdf:	ff 15 38 c0 00 10    	call   *0x1000c038  ; 0x1000c038=KERNEL32.dll!HeapFree
10008ce5:	a1 c4 02 01 10       	mov    0x100102c4,%eax
10008cea:	8b 15 c8 02 01 10    	mov    0x100102c8,%edx
10008cf0:	8d 04 80             	lea    (%eax,%eax,4),%eax
10008cf3:	c1 e0 02             	shl    $0x2,%eax
10008cf6:	8b c8                	mov    %eax,%ecx
10008cf8:	a1 c0 02 01 10       	mov    0x100102c0,%eax
10008cfd:	2b c8                	sub    %eax,%ecx
10008cff:	8d 4c 11 ec          	lea    -0x14(%ecx,%edx,1),%ecx
10008d03:	51                   	push   %ecx
10008d04:	8d 48 14             	lea    0x14(%eax),%ecx
10008d07:	51                   	push   %ecx
10008d08:	50                   	push   %eax
10008d09:	e8 92 c9 ff ff       	call   0x100056a0
10008d0e:	8b 45 08             	mov    0x8(%ebp),%eax
10008d11:	83 c4 0c             	add    $0xc,%esp
10008d14:	ff 0d c4 02 01 10    	decl   0x100102c4
10008d1a:	3b 05 c0 02 01 10    	cmp    0x100102c0,%eax
10008d20:	76 04                	jbe    0x10008d26
10008d22:	83 6d 08 14          	subl   $0x14,0x8(%ebp)
10008d26:	a1 c8 02 01 10       	mov    0x100102c8,%eax
10008d2b:	a3 d0 02 01 10       	mov    %eax,0x100102d0
10008d30:	8b 45 08             	mov    0x8(%ebp),%eax
10008d33:	a3 c0 02 01 10       	mov    %eax,0x100102c0
10008d38:	89 3d d8 02 01 10    	mov    %edi,0x100102d8
10008d3e:	5b                   	pop    %ebx
10008d3f:	5f                   	pop    %edi
10008d40:	5e                   	pop    %esi
10008d41:	c9                   	leave
10008d42:	c3                   	ret
10008d43:	a1 c4 02 01 10       	mov    0x100102c4,%eax
10008d48:	8b 0d d4 02 01 10    	mov    0x100102d4,%ecx
10008d4e:	57                   	push   %edi
10008d4f:	33 ff                	xor    %edi,%edi
10008d51:	3b c1                	cmp    %ecx,%eax
10008d53:	75 34                	jne    0x10008d89
10008d55:	8d 44 89 50          	lea    0x50(%ecx,%ecx,4),%eax
10008d59:	c1 e0 02             	shl    $0x2,%eax
10008d5c:	50                   	push   %eax
10008d5d:	ff 35 c8 02 01 10    	push   0x100102c8
10008d63:	57                   	push   %edi
10008d64:	ff 35 dc 02 01 10    	push   0x100102dc
10008d6a:	ff 15 b8 c0 00 10    	call   *0x1000c0b8  ; 0x1000c0b8=KERNEL32.dll!HeapReAlloc
10008d70:	3b c7                	cmp    %edi,%eax
10008d72:	75 04                	jne    0x10008d78
10008d74:	33 c0                	xor    %eax,%eax
10008d76:	5f                   	pop    %edi
10008d77:	c3                   	ret
10008d78:	83 05 d4 02 01 10 10 	addl   $0x10,0x100102d4
10008d7f:	a3 c8 02 01 10       	mov    %eax,0x100102c8
10008d84:	a1 c4 02 01 10       	mov    0x100102c4,%eax
10008d89:	8b 0d c8 02 01 10    	mov    0x100102c8,%ecx
10008d8f:	56                   	push   %esi
10008d90:	68 c4 41 00 00       	push   $0x41c4
10008d95:	6a 08                	push   $0x8
10008d97:	ff 35 dc 02 01 10    	push   0x100102dc
10008d9d:	8d 04 80             	lea    (%eax,%eax,4),%eax
10008da0:	8d 34 81             	lea    (%ecx,%eax,4),%esi
10008da3:	ff 15 34 c0 00 10    	call   *0x1000c034  ; 0x1000c034=KERNEL32.dll!HeapAlloc
10008da9:	3b c7                	cmp    %edi,%eax
10008dab:	89 46 10             	mov    %eax,0x10(%esi)
10008dae:	75 04                	jne    0x10008db4
10008db0:	33 c0                	xor    %eax,%eax
10008db2:	eb 43                	jmp    0x10008df7
10008db4:	6a 04                	push   $0x4
10008db6:	68 00 20 00 00       	push   $0x2000
10008dbb:	68 00 00 10 00       	push   $0x100000
10008dc0:	57                   	push   %edi
10008dc1:	ff 15 b4 c0 00 10    	call   *0x1000c0b4  ; 0x1000c0b4=KERNEL32.dll!VirtualAlloc
10008dc7:	3b c7                	cmp    %edi,%eax
10008dc9:	89 46 0c             	mov    %eax,0xc(%esi)
10008dcc:	75 12                	jne    0x10008de0
10008dce:	ff 76 10             	push   0x10(%esi)
10008dd1:	57                   	push   %edi
10008dd2:	ff 35 dc 02 01 10    	push   0x100102dc
10008dd8:	ff 15 38 c0 00 10    	call   *0x1000c038  ; 0x1000c038=KERNEL32.dll!HeapFree
10008dde:	eb d0                	jmp    0x10008db0
10008de0:	83 4e 08 ff          	orl    $0xffffffff,0x8(%esi)
10008de4:	89 3e                	mov    %edi,(%esi)
10008de6:	89 7e 04             	mov    %edi,0x4(%esi)
10008de9:	ff 05 c4 02 01 10    	incl   0x100102c4
10008def:	8b 46 10             	mov    0x10(%esi),%eax
10008df2:	83 08 ff             	orl    $0xffffffff,(%eax)
10008df5:	8b c6                	mov    %esi,%eax
10008df7:	5e                   	pop    %esi
10008df8:	5f                   	pop    %edi
10008df9:	c3                   	ret
10008dfa:	55                   	push   %ebp
10008dfb:	8b ec                	mov    %esp,%ebp
10008dfd:	51                   	push   %ecx
10008dfe:	51                   	push   %ecx
10008dff:	8b 4d 08             	mov    0x8(%ebp),%ecx
10008e02:	8b 41 08             	mov    0x8(%ecx),%eax
10008e05:	53                   	push   %ebx
10008e06:	56                   	push   %esi
10008e07:	8b 71 10             	mov    0x10(%ecx),%esi
10008e0a:	57                   	push   %edi
10008e0b:	33 db                	xor    %ebx,%ebx
10008e0d:	eb 03                	jmp    0x10008e12
10008e0f:	d1 e0                	shl    $1,%eax
10008e11:	43                   	inc    %ebx
10008e12:	85 c0                	test   %eax,%eax
10008e14:	7d f9                	jge    0x10008e0f
10008e16:	8b c3                	mov    %ebx,%eax
10008e18:	69 c0 04 02 00 00    	imul   $0x204,%eax,%eax
10008e1e:	8d 84 30 44 01 00 00 	lea    0x144(%eax,%esi,1),%eax
10008e25:	6a 3f                	push   $0x3f
10008e27:	89 45 f8             	mov    %eax,-0x8(%ebp)
10008e2a:	5a                   	pop    %edx
10008e2b:	89 40 08             	mov    %eax,0x8(%eax)
10008e2e:	89 40 04             	mov    %eax,0x4(%eax)
10008e31:	83 c0 08             	add    $0x8,%eax
10008e34:	4a                   	dec    %edx
10008e35:	75 f4                	jne    0x10008e2b
10008e37:	6a 04                	push   $0x4
10008e39:	8b fb                	mov    %ebx,%edi
10008e3b:	68 00 10 00 00       	push   $0x1000
10008e40:	c1 e7 0f             	shl    $0xf,%edi
10008e43:	03 79 0c             	add    0xc(%ecx),%edi
10008e46:	68 00 80 00 00       	push   $0x8000
10008e4b:	57                   	push   %edi
10008e4c:	ff 15 b4 c0 00 10    	call   *0x1000c0b4  ; 0x1000c0b4=KERNEL32.dll!VirtualAlloc
10008e52:	85 c0                	test   %eax,%eax
10008e54:	75 08                	jne    0x10008e5e
10008e56:	83 c8 ff             	or     $0xffffffff,%eax
10008e59:	e9 9d 00 00 00       	jmp    0x10008efb
10008e5e:	8d 97 00 70 00 00    	lea    0x7000(%edi),%edx
10008e64:	3b fa                	cmp    %edx,%edi
10008e66:	89 55 fc             	mov    %edx,-0x4(%ebp)
10008e69:	77 43                	ja     0x10008eae
10008e6b:	8b ca                	mov    %edx,%ecx
10008e6d:	2b cf                	sub    %edi,%ecx
10008e6f:	c1 e9 0c             	shr    $0xc,%ecx
10008e72:	8d 47 10             	lea    0x10(%edi),%eax
10008e75:	41                   	inc    %ecx
10008e76:	83 48 f8 ff          	orl    $0xffffffff,-0x8(%eax)
10008e7a:	83 88 ec 0f 00 00 ff 	orl    $0xffffffff,0xfec(%eax)
10008e81:	8d 90 fc 0f 00 00    	lea    0xffc(%eax),%edx
10008e87:	89 10                	mov    %edx,(%eax)
10008e89:	8d 90 fc ef ff ff    	lea    -0x1004(%eax),%edx
10008e8f:	c7 40 fc f0 0f 00 00 	movl   $0xff0,-0x4(%eax)
10008e96:	89 50 04             	mov    %edx,0x4(%eax)
10008e99:	c7 80 e8 0f 00 00 f0 	movl   $0xff0,0xfe8(%eax)
10008ea0:	0f 00 00 
10008ea3:	05 00 10 00 00       	add    $0x1000,%eax
10008ea8:	49                   	dec    %ecx
10008ea9:	75 cb                	jne    0x10008e76
10008eab:	8b 55 fc             	mov    -0x4(%ebp),%edx
10008eae:	8b 45 f8             	mov    -0x8(%ebp),%eax
10008eb1:	05 f8 01 00 00       	add    $0x1f8,%eax
10008eb6:	8d 4f 0c             	lea    0xc(%edi),%ecx
10008eb9:	89 48 04             	mov    %ecx,0x4(%eax)
10008ebc:	89 41 08             	mov    %eax,0x8(%ecx)
10008ebf:	8d 4a 0c             	lea    0xc(%edx),%ecx
10008ec2:	89 48 08             	mov    %ecx,0x8(%eax)
10008ec5:	89 41 04             	mov    %eax,0x4(%ecx)
10008ec8:	83 64 9e 44 00       	andl   $0x0,0x44(%esi,%ebx,4)
10008ecd:	33 ff                	xor    %edi,%edi
10008ecf:	47                   	inc    %edi
10008ed0:	89 bc 9e c4 00 00 00 	mov    %edi,0xc4(%esi,%ebx,4)
10008ed7:	8a 46 43             	mov    0x43(%esi),%al
10008eda:	8a c8                	mov    %al,%cl
10008edc:	fe c1                	inc    %cl
10008ede:	84 c0                	test   %al,%al
10008ee0:	8b 45 08             	mov    0x8(%ebp),%eax
10008ee3:	88 4e 43             	mov    %cl,0x43(%esi)
10008ee6:	75 03                	jne    0x10008eeb
10008ee8:	09 78 04             	or     %edi,0x4(%eax)
10008eeb:	ba 00 00 00 80       	mov    $0x80000000,%edx
10008ef0:	8b cb                	mov    %ebx,%ecx
10008ef2:	d3 ea                	shr    %cl,%edx
10008ef4:	f7 d2                	not    %edx
10008ef6:	21 50 08             	and    %edx,0x8(%eax)
10008ef9:	8b c3                	mov    %ebx,%eax
10008efb:	5f                   	pop    %edi
10008efc:	5e                   	pop    %esi
10008efd:	5b                   	pop    %ebx
10008efe:	c9                   	leave
10008eff:	c3                   	ret
10008f00:	55                   	push   %ebp
10008f01:	8b ec                	mov    %esp,%ebp
10008f03:	83 ec 0c             	sub    $0xc,%esp
10008f06:	8b 4d 08             	mov    0x8(%ebp),%ecx
10008f09:	8b 41 10             	mov    0x10(%ecx),%eax
10008f0c:	53                   	push   %ebx
10008f0d:	56                   	push   %esi
10008f0e:	8b 75 10             	mov    0x10(%ebp),%esi
10008f11:	57                   	push   %edi
10008f12:	8b 7d 0c             	mov    0xc(%ebp),%edi
10008f15:	8b d7                	mov    %edi,%edx
10008f17:	2b 51 0c             	sub    0xc(%ecx),%edx
10008f1a:	83 c6 17             	add    $0x17,%esi
10008f1d:	c1 ea 0f             	shr    $0xf,%edx
10008f20:	8b ca                	mov    %edx,%ecx
10008f22:	69 c9 04 02 00 00    	imul   $0x204,%ecx,%ecx
10008f28:	8d 8c 01 44 01 00 00 	lea    0x144(%ecx,%eax,1),%ecx
10008f2f:	89 4d f4             	mov    %ecx,-0xc(%ebp)
10008f32:	8b 4f fc             	mov    -0x4(%edi),%ecx
10008f35:	83 e6 f0             	and    $0xfffffff0,%esi
10008f38:	49                   	dec    %ecx
10008f39:	3b f1                	cmp    %ecx,%esi
10008f3b:	8d 7c 39 fc          	lea    -0x4(%ecx,%edi,1),%edi
10008f3f:	8b 1f                	mov    (%edi),%ebx
10008f41:	89 4d 10             	mov    %ecx,0x10(%ebp)
10008f44:	89 5d fc             	mov    %ebx,-0x4(%ebp)
10008f47:	0f 8e 55 01 00 00    	jle    0x100090a2
10008f4d:	f6 c3 01             	test   $0x1,%bl
10008f50:	0f 85 45 01 00 00    	jne    0x1000909b
10008f56:	03 d9                	add    %ecx,%ebx
10008f58:	3b f3                	cmp    %ebx,%esi
10008f5a:	0f 8f 3b 01 00 00    	jg     0x1000909b
10008f60:	8b 4d fc             	mov    -0x4(%ebp),%ecx
10008f63:	c1 f9 04             	sar    $0x4,%ecx
10008f66:	49                   	dec    %ecx
10008f67:	83 f9 3f             	cmp    $0x3f,%ecx
10008f6a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
10008f6d:	76 06                	jbe    0x10008f75
10008f6f:	6a 3f                	push   $0x3f
10008f71:	59                   	pop    %ecx
10008f72:	89 4d f8             	mov    %ecx,-0x8(%ebp)
10008f75:	8b 5f 04             	mov    0x4(%edi),%ebx
10008f78:	3b 5f 08             	cmp    0x8(%edi),%ebx
10008f7b:	75 43                	jne    0x10008fc0
10008f7d:	83 f9 20             	cmp    $0x20,%ecx
10008f80:	bb 00 00 00 80       	mov    $0x80000000,%ebx
10008f85:	73 1a                	jae    0x10008fa1
10008f87:	d3 eb                	shr    %cl,%ebx
10008f89:	8b 4d f8             	mov    -0x8(%ebp),%ecx
10008f8c:	8d 4c 01 04          	lea    0x4(%ecx,%eax,1),%ecx
10008f90:	f7 d3                	not    %ebx
10008f92:	21 5c 90 44          	and    %ebx,0x44(%eax,%edx,4)
10008f96:	fe 09                	decb   (%ecx)
10008f98:	75 26                	jne    0x10008fc0
10008f9a:	8b 4d 08             	mov    0x8(%ebp),%ecx
10008f9d:	21 19                	and    %ebx,(%ecx)
10008f9f:	eb 1f                	jmp    0x10008fc0
10008fa1:	83 c1 e0             	add    $0xffffffe0,%ecx
10008fa4:	d3 eb                	shr    %cl,%ebx
10008fa6:	8b 4d f8             	mov    -0x8(%ebp),%ecx
10008fa9:	8d 4c 01 04          	lea    0x4(%ecx,%eax,1),%ecx
10008fad:	f7 d3                	not    %ebx
10008faf:	21 9c 90 c4 00 00 00 	and    %ebx,0xc4(%eax,%edx,4)
10008fb6:	fe 09                	decb   (%ecx)
10008fb8:	75 06                	jne    0x10008fc0
10008fba:	8b 4d 08             	mov    0x8(%ebp),%ecx
10008fbd:	21 59 04             	and    %ebx,0x4(%ecx)
10008fc0:	8b 4f 08             	mov    0x8(%edi),%ecx
10008fc3:	8b 5f 04             	mov    0x4(%edi),%ebx
10008fc6:	89 59 04             	mov    %ebx,0x4(%ecx)
10008fc9:	8b 4f 04             	mov    0x4(%edi),%ecx
10008fcc:	8b 7f 08             	mov    0x8(%edi),%edi
10008fcf:	89 79 08             	mov    %edi,0x8(%ecx)
10008fd2:	8b 4d 10             	mov    0x10(%ebp),%ecx
10008fd5:	2b ce                	sub    %esi,%ecx
10008fd7:	01 4d fc             	add    %ecx,-0x4(%ebp)
10008fda:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
10008fde:	0f 8e a5 00 00 00    	jle    0x10009089
10008fe4:	8b 7d fc             	mov    -0x4(%ebp),%edi
10008fe7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
10008fea:	c1 ff 04             	sar    $0x4,%edi
10008fed:	4f                   	dec    %edi
10008fee:	83 ff 3f             	cmp    $0x3f,%edi
10008ff1:	8d 4c 31 fc          	lea    -0x4(%ecx,%esi,1),%ecx
10008ff5:	76 03                	jbe    0x10008ffa
10008ff7:	6a 3f                	push   $0x3f
10008ff9:	5f                   	pop    %edi
10008ffa:	8b 5d f4             	mov    -0xc(%ebp),%ebx
10008ffd:	8d 1c fb             	lea    (%ebx,%edi,8),%ebx
10009000:	89 5d 10             	mov    %ebx,0x10(%ebp)
10009003:	8b 5b 04             	mov    0x4(%ebx),%ebx
10009006:	89 59 04             	mov    %ebx,0x4(%ecx)
10009009:	8b 5d 10             	mov    0x10(%ebp),%ebx
1000900c:	89 59 08             	mov    %ebx,0x8(%ecx)
1000900f:	89 4b 04             	mov    %ecx,0x4(%ebx)
10009012:	8b 59 04             	mov    0x4(%ecx),%ebx
10009015:	89 4b 08             	mov    %ecx,0x8(%ebx)
10009018:	8b 59 04             	mov    0x4(%ecx),%ebx
1000901b:	3b 59 08             	cmp    0x8(%ecx),%ebx
1000901e:	75 57                	jne    0x10009077
10009020:	8a 4c 07 04          	mov    0x4(%edi,%eax,1),%cl
10009024:	88 4d 13             	mov    %cl,0x13(%ebp)
10009027:	fe c1                	inc    %cl
10009029:	83 ff 20             	cmp    $0x20,%edi
1000902c:	88 4c 07 04          	mov    %cl,0x4(%edi,%eax,1)
10009030:	73 1c                	jae    0x1000904e
10009032:	80 7d 13 00          	cmpb   $0x0,0x13(%ebp)
10009036:	75 0e                	jne    0x10009046
10009038:	8b cf                	mov    %edi,%ecx
1000903a:	bb 00 00 00 80       	mov    $0x80000000,%ebx
1000903f:	d3 eb                	shr    %cl,%ebx
10009041:	8b 4d 08             	mov    0x8(%ebp),%ecx
10009044:	09 19                	or     %ebx,(%ecx)
10009046:	8d 44 90 44          	lea    0x44(%eax,%edx,4),%eax
1000904a:	8b cf                	mov    %edi,%ecx
1000904c:	eb 20                	jmp    0x1000906e
1000904e:	80 7d 13 00          	cmpb   $0x0,0x13(%ebp)
10009052:	75 10                	jne    0x10009064
10009054:	8d 4f e0             	lea    -0x20(%edi),%ecx
10009057:	bb 00 00 00 80       	mov    $0x80000000,%ebx
1000905c:	d3 eb                	shr    %cl,%ebx
1000905e:	8b 4d 08             	mov    0x8(%ebp),%ecx
10009061:	09 59 04             	or     %ebx,0x4(%ecx)
10009064:	8d 84 90 c4 00 00 00 	lea    0xc4(%eax,%edx,4),%eax
1000906b:	8d 4f e0             	lea    -0x20(%edi),%ecx
1000906e:	ba 00 00 00 80       	mov    $0x80000000,%edx
10009073:	d3 ea                	shr    %cl,%edx
10009075:	09 10                	or     %edx,(%eax)
10009077:	8b 55 0c             	mov    0xc(%ebp),%edx
1000907a:	8b 4d fc             	mov    -0x4(%ebp),%ecx
1000907d:	8d 44 32 fc          	lea    -0x4(%edx,%esi,1),%eax
10009081:	89 08                	mov    %ecx,(%eax)
10009083:	89 4c 01 fc          	mov    %ecx,-0x4(%ecx,%eax,1)
10009087:	eb 03                	jmp    0x1000908c
10009089:	8b 55 0c             	mov    0xc(%ebp),%edx
1000908c:	8d 46 01             	lea    0x1(%esi),%eax
1000908f:	89 42 fc             	mov    %eax,-0x4(%edx)
10009092:	89 44 32 f8          	mov    %eax,-0x8(%edx,%esi,1)
10009096:	e9 3c 01 00 00       	jmp    0x100091d7
1000909b:	33 c0                	xor    %eax,%eax
1000909d:	e9 38 01 00 00       	jmp    0x100091da
100090a2:	0f 8d 2f 01 00 00    	jge    0x100091d7
100090a8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
100090ab:	29 75 10             	sub    %esi,0x10(%ebp)
100090ae:	8d 4e 01             	lea    0x1(%esi),%ecx
100090b1:	89 4b fc             	mov    %ecx,-0x4(%ebx)
100090b4:	8d 5c 33 fc          	lea    -0x4(%ebx,%esi,1),%ebx
100090b8:	8b 75 10             	mov    0x10(%ebp),%esi
100090bb:	c1 fe 04             	sar    $0x4,%esi
100090be:	4e                   	dec    %esi
100090bf:	83 fe 3f             	cmp    $0x3f,%esi
100090c2:	89 5d 0c             	mov    %ebx,0xc(%ebp)
100090c5:	89 4b fc             	mov    %ecx,-0x4(%ebx)
100090c8:	76 03                	jbe    0x100090cd
100090ca:	6a 3f                	push   $0x3f
100090cc:	5e                   	pop    %esi
100090cd:	f6 45 fc 01          	testb  $0x1,-0x4(%ebp)
100090d1:	0f 85 80 00 00 00    	jne    0x10009157
100090d7:	8b 75 fc             	mov    -0x4(%ebp),%esi
100090da:	c1 fe 04             	sar    $0x4,%esi
100090dd:	4e                   	dec    %esi
100090de:	83 fe 3f             	cmp    $0x3f,%esi
100090e1:	76 03                	jbe    0x100090e6
100090e3:	6a 3f                	push   $0x3f
100090e5:	5e                   	pop    %esi
100090e6:	8b 4f 04             	mov    0x4(%edi),%ecx
100090e9:	3b 4f 08             	cmp    0x8(%edi),%ecx
100090ec:	75 42                	jne    0x10009130
100090ee:	83 fe 20             	cmp    $0x20,%esi
100090f1:	bb 00 00 00 80       	mov    $0x80000000,%ebx
100090f6:	73 19                	jae    0x10009111
100090f8:	8b ce                	mov    %esi,%ecx
100090fa:	d3 eb                	shr    %cl,%ebx
100090fc:	8d 74 06 04          	lea    0x4(%esi,%eax,1),%esi
10009100:	f7 d3                	not    %ebx
10009102:	21 5c 90 44          	and    %ebx,0x44(%eax,%edx,4)
10009106:	fe 0e                	decb   (%esi)
10009108:	75 23                	jne    0x1000912d
1000910a:	8b 4d 08             	mov    0x8(%ebp),%ecx
1000910d:	21 19                	and    %ebx,(%ecx)
1000910f:	eb 1c                	jmp    0x1000912d
10009111:	8d 4e e0             	lea    -0x20(%esi),%ecx
10009114:	d3 eb                	shr    %cl,%ebx
10009116:	8d 4c 06 04          	lea    0x4(%esi,%eax,1),%ecx
1000911a:	f7 d3                	not    %ebx
1000911c:	21 9c 90 c4 00 00 00 	and    %ebx,0xc4(%eax,%edx,4)
10009123:	fe 09                	decb   (%ecx)
10009125:	75 06                	jne    0x1000912d
10009127:	8b 4d 08             	mov    0x8(%ebp),%ecx
1000912a:	21 59 04             	and    %ebx,0x4(%ecx)
1000912d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
10009130:	8b 4f 08             	mov    0x8(%edi),%ecx
10009133:	8b 77 04             	mov    0x4(%edi),%esi
10009136:	89 71 04             	mov    %esi,0x4(%ecx)
10009139:	8b 77 08             	mov    0x8(%edi),%esi
1000913c:	8b 4f 04             	mov    0x4(%edi),%ecx
1000913f:	89 71 08             	mov    %esi,0x8(%ecx)
10009142:	8b 75 10             	mov    0x10(%ebp),%esi
10009145:	03 75 fc             	add    -0x4(%ebp),%esi
10009148:	89 75 10             	mov    %esi,0x10(%ebp)
1000914b:	c1 fe 04             	sar    $0x4,%esi
1000914e:	4e                   	dec    %esi
1000914f:	83 fe 3f             	cmp    $0x3f,%esi
10009152:	76 03                	jbe    0x10009157
10009154:	6a 3f                	push   $0x3f
10009156:	5e                   	pop    %esi
10009157:	8b 4d f4             	mov    -0xc(%ebp),%ecx
1000915a:	8d 0c f1             	lea    (%ecx,%esi,8),%ecx
1000915d:	8b 79 04             	mov    0x4(%ecx),%edi
10009160:	89 4b 08             	mov    %ecx,0x8(%ebx)
10009163:	89 7b 04             	mov    %edi,0x4(%ebx)
10009166:	89 59 04             	mov    %ebx,0x4(%ecx)
10009169:	8b 4b 04             	mov    0x4(%ebx),%ecx
1000916c:	89 59 08             	mov    %ebx,0x8(%ecx)
1000916f:	8b 4b 04             	mov    0x4(%ebx),%ecx
10009172:	3b 4b 08             	cmp    0x8(%ebx),%ecx
10009175:	75 57                	jne    0x100091ce
10009177:	8a 4c 06 04          	mov    0x4(%esi,%eax,1),%cl
1000917b:	88 4d 0f             	mov    %cl,0xf(%ebp)
1000917e:	fe c1                	inc    %cl
10009180:	83 fe 20             	cmp    $0x20,%esi
10009183:	88 4c 06 04          	mov    %cl,0x4(%esi,%eax,1)
10009187:	73 1c                	jae    0x100091a5
10009189:	80 7d 0f 00          	cmpb   $0x0,0xf(%ebp)
1000918d:	75 0e                	jne    0x1000919d
1000918f:	8b ce                	mov    %esi,%ecx
10009191:	bf 00 00 00 80       	mov    $0x80000000,%edi
10009196:	d3 ef                	shr    %cl,%edi
10009198:	8b 4d 08             	mov    0x8(%ebp),%ecx
1000919b:	09 39                	or     %edi,(%ecx)
1000919d:	8d 44 90 44          	lea    0x44(%eax,%edx,4),%eax
100091a1:	8b ce                	mov    %esi,%ecx
100091a3:	eb 20                	jmp    0x100091c5
100091a5:	80 7d 0f 00          	cmpb   $0x0,0xf(%ebp)
100091a9:	75 10                	jne    0x100091bb
100091ab:	8d 4e e0             	lea    -0x20(%esi),%ecx
100091ae:	bf 00 00 00 80       	mov    $0x80000000,%edi
100091b3:	d3 ef                	shr    %cl,%edi
100091b5:	8b 4d 08             	mov    0x8(%ebp),%ecx
100091b8:	09 79 04             	or     %edi,0x4(%ecx)
100091bb:	8d 84 90 c4 00 00 00 	lea    0xc4(%eax,%edx,4),%eax
100091c2:	8d 4e e0             	lea    -0x20(%esi),%ecx
100091c5:	ba 00 00 00 80       	mov    $0x80000000,%edx
100091ca:	d3 ea                	shr    %cl,%edx
100091cc:	09 10                	or     %edx,(%eax)
100091ce:	8b 45 10             	mov    0x10(%ebp),%eax
100091d1:	89 03                	mov    %eax,(%ebx)
100091d3:	89 44 18 fc          	mov    %eax,-0x4(%eax,%ebx,1)
100091d7:	33 c0                	xor    %eax,%eax
100091d9:	40                   	inc    %eax
100091da:	5f                   	pop    %edi
100091db:	5e                   	pop    %esi
100091dc:	5b                   	pop    %ebx
100091dd:	c9                   	leave
100091de:	c3                   	ret
100091df:	55                   	push   %ebp
100091e0:	8b ec                	mov    %esp,%ebp
100091e2:	83 ec 14             	sub    $0x14,%esp
100091e5:	8b 4d 08             	mov    0x8(%ebp),%ecx
100091e8:	a1 c4 02 01 10       	mov    0x100102c4,%eax
100091ed:	8b 15 c8 02 01 10    	mov    0x100102c8,%edx
100091f3:	83 c1 17             	add    $0x17,%ecx
100091f6:	83 e1 f0             	and    $0xfffffff0,%ecx
100091f9:	53                   	push   %ebx
100091fa:	89 4d f0             	mov    %ecx,-0x10(%ebp)
100091fd:	c1 f9 04             	sar    $0x4,%ecx
10009200:	56                   	push   %esi
10009201:	8d 04 80             	lea    (%eax,%eax,4),%eax
10009204:	57                   	push   %edi
10009205:	49                   	dec    %ecx
10009206:	83 f9 20             	cmp    $0x20,%ecx
10009209:	8d 3c 82             	lea    (%edx,%eax,4),%edi
1000920c:	89 7d fc             	mov    %edi,-0x4(%ebp)
1000920f:	7d 0b                	jge    0x1000921c
10009211:	83 ce ff             	or     $0xffffffff,%esi
10009214:	d3 ee                	shr    %cl,%esi
10009216:	83 4d f8 ff          	orl    $0xffffffff,-0x8(%ebp)
1000921a:	eb 0d                	jmp    0x10009229
1000921c:	83 c1 e0             	add    $0xffffffe0,%ecx
1000921f:	83 c8 ff             	or     $0xffffffff,%eax
10009222:	33 f6                	xor    %esi,%esi
10009224:	d3 e8                	shr    %cl,%eax
10009226:	89 45 f8             	mov    %eax,-0x8(%ebp)
10009229:	a1 d0 02 01 10       	mov    0x100102d0,%eax
1000922e:	8b d8                	mov    %eax,%ebx
10009230:	89 75 f4             	mov    %esi,-0xc(%ebp)
10009233:	3b df                	cmp    %edi,%ebx
10009235:	eb 14                	jmp    0x1000924b
10009237:	8b 4b 04             	mov    0x4(%ebx),%ecx
1000923a:	8b 3b                	mov    (%ebx),%edi
1000923c:	23 4d f8             	and    -0x8(%ebp),%ecx
1000923f:	23 fe                	and    %esi,%edi
10009241:	0b cf                	or     %edi,%ecx
10009243:	75 0b                	jne    0x10009250
10009245:	83 c3 14             	add    $0x14,%ebx
10009248:	3b 5d fc             	cmp    -0x4(%ebp),%ebx
1000924b:	89 5d 08             	mov    %ebx,0x8(%ebp)
1000924e:	72 e7                	jb     0x10009237
10009250:	3b 5d fc             	cmp    -0x4(%ebp),%ebx
10009253:	75 24                	jne    0x10009279
10009255:	8b da                	mov    %edx,%ebx
10009257:	eb 11                	jmp    0x1000926a
10009259:	8b 4b 04             	mov    0x4(%ebx),%ecx
1000925c:	8b 3b                	mov    (%ebx),%edi
1000925e:	23 4d f8             	and    -0x8(%ebp),%ecx
10009261:	23 fe                	and    %esi,%edi
10009263:	0b cf                	or     %edi,%ecx
10009265:	75 0a                	jne    0x10009271
10009267:	83 c3 14             	add    $0x14,%ebx
1000926a:	3b d8                	cmp    %eax,%ebx
1000926c:	89 5d 08             	mov    %ebx,0x8(%ebp)
1000926f:	72 e8                	jb     0x10009259
10009271:	3b d8                	cmp    %eax,%ebx
10009273:	0f 84 94 00 00 00    	je     0x1000930d
10009279:	89 1d d0 02 01 10    	mov    %ebx,0x100102d0
1000927f:	8b 43 10             	mov    0x10(%ebx),%eax
10009282:	8b 10                	mov    (%eax),%edx
10009284:	83 fa ff             	cmp    $0xffffffff,%edx
10009287:	89 55 fc             	mov    %edx,-0x4(%ebp)
1000928a:	74 14                	je     0x100092a0
1000928c:	8b 8c 90 c4 00 00 00 	mov    0xc4(%eax,%edx,4),%ecx
10009293:	8b 7c 90 44          	mov    0x44(%eax,%edx,4),%edi
10009297:	23 4d f8             	and    -0x8(%ebp),%ecx
1000929a:	23 fe                	and    %esi,%edi
1000929c:	0b cf                	or     %edi,%ecx
1000929e:	75 36                	jne    0x100092d6
100092a0:	8b 90 c4 00 00 00    	mov    0xc4(%eax),%edx
100092a6:	23 55 f8             	and    -0x8(%ebp),%edx
100092a9:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
100092ad:	8d 48 44             	lea    0x44(%eax),%ecx
100092b0:	8b 31                	mov    (%ecx),%esi
100092b2:	23 75 f4             	and    -0xc(%ebp),%esi
100092b5:	0b d6                	or     %esi,%edx
100092b7:	8b 75 f4             	mov    -0xc(%ebp),%esi
100092ba:	75 17                	jne    0x100092d3
100092bc:	8b 91 84 00 00 00    	mov    0x84(%ecx),%edx
100092c2:	23 55 f8             	and    -0x8(%ebp),%edx
100092c5:	ff 45 fc             	incl   -0x4(%ebp)
100092c8:	83 c1 04             	add    $0x4,%ecx
100092cb:	8b 39                	mov    (%ecx),%edi
100092cd:	23 fe                	and    %esi,%edi
100092cf:	0b d7                	or     %edi,%edx
100092d1:	74 e9                	je     0x100092bc
100092d3:	8b 55 fc             	mov    -0x4(%ebp),%edx
100092d6:	8b ca                	mov    %edx,%ecx
100092d8:	69 c9 04 02 00 00    	imul   $0x204,%ecx,%ecx
100092de:	8d 8c 01 44 01 00 00 	lea    0x144(%ecx,%eax,1),%ecx
100092e5:	89 4d f4             	mov    %ecx,-0xc(%ebp)
100092e8:	8b 4c 90 44          	mov    0x44(%eax,%edx,4),%ecx
100092ec:	33 ff                	xor    %edi,%edi
100092ee:	23 ce                	and    %esi,%ecx
100092f0:	75 6d                	jne    0x1000935f
100092f2:	8b 8c 90 c4 00 00 00 	mov    0xc4(%eax,%edx,4),%ecx
100092f9:	23 4d f8             	and    -0x8(%ebp),%ecx
100092fc:	6a 20                	push   $0x20
100092fe:	5f                   	pop    %edi
100092ff:	eb 5e                	jmp    0x1000935f
10009301:	83 7b 08 00          	cmpl   $0x0,0x8(%ebx)
10009305:	75 0b                	jne    0x10009312
10009307:	83 c3 14             	add    $0x14,%ebx
1000930a:	89 5d 08             	mov    %ebx,0x8(%ebp)
1000930d:	3b 5d fc             	cmp    -0x4(%ebp),%ebx
10009310:	72 ef                	jb     0x10009301
10009312:	3b 5d fc             	cmp    -0x4(%ebp),%ebx
10009315:	75 26                	jne    0x1000933d
10009317:	8b da                	mov    %edx,%ebx
10009319:	eb 09                	jmp    0x10009324
1000931b:	83 7b 08 00          	cmpl   $0x0,0x8(%ebx)
1000931f:	75 0a                	jne    0x1000932b
10009321:	83 c3 14             	add    $0x14,%ebx
10009324:	3b d8                	cmp    %eax,%ebx
10009326:	89 5d 08             	mov    %ebx,0x8(%ebp)
10009329:	72 f0                	jb     0x1000931b
1000932b:	3b d8                	cmp    %eax,%ebx
1000932d:	75 0e                	jne    0x1000933d
1000932f:	e8 0f fa ff ff       	call   0x10008d43
10009334:	8b d8                	mov    %eax,%ebx
10009336:	85 db                	test   %ebx,%ebx
10009338:	89 5d 08             	mov    %ebx,0x8(%ebp)
1000933b:	74 18                	je     0x10009355
1000933d:	53                   	push   %ebx
1000933e:	e8 b7 fa ff ff       	call   0x10008dfa
10009343:	59                   	pop    %ecx
10009344:	8b 4b 10             	mov    0x10(%ebx),%ecx
10009347:	89 01                	mov    %eax,(%ecx)
10009349:	8b 43 10             	mov    0x10(%ebx),%eax
1000934c:	83 38 ff             	cmpl   $0xffffffff,(%eax)
1000934f:	0f 85 24 ff ff ff    	jne    0x10009279
10009355:	33 c0                	xor    %eax,%eax
10009357:	e9 7a 01 00 00       	jmp    0x100094d6
1000935c:	d1 e1                	shl    $1,%ecx
1000935e:	47                   	inc    %edi
1000935f:	85 c9                	test   %ecx,%ecx
10009361:	7d f9                	jge    0x1000935c
10009363:	8b 4d f4             	mov    -0xc(%ebp),%ecx
10009366:	8b 54 f9 04          	mov    0x4(%ecx,%edi,8),%edx
1000936a:	8b 0a                	mov    (%edx),%ecx
1000936c:	2b 4d f0             	sub    -0x10(%ebp),%ecx
1000936f:	8b f1                	mov    %ecx,%esi
10009371:	c1 fe 04             	sar    $0x4,%esi
10009374:	4e                   	dec    %esi
10009375:	83 fe 3f             	cmp    $0x3f,%esi
10009378:	89 4d f8             	mov    %ecx,-0x8(%ebp)
1000937b:	7e 03                	jle    0x10009380
1000937d:	6a 3f                	push   $0x3f
1000937f:	5e                   	pop    %esi
10009380:	3b f7                	cmp    %edi,%esi
10009382:	0f 84 01 01 00 00    	je     0x10009489
10009388:	8b 4a 04             	mov    0x4(%edx),%ecx
1000938b:	3b 4a 08             	cmp    0x8(%edx),%ecx
1000938e:	75 5c                	jne    0x100093ec
10009390:	83 ff 20             	cmp    $0x20,%edi
10009393:	bb 00 00 00 80       	mov    $0x80000000,%ebx
10009398:	7d 26                	jge    0x100093c0
1000939a:	8b cf                	mov    %edi,%ecx
1000939c:	d3 eb                	shr    %cl,%ebx
1000939e:	8b 4d fc             	mov    -0x4(%ebp),%ecx
100093a1:	8d 7c 38 04          	lea    0x4(%eax,%edi,1),%edi
100093a5:	f7 d3                	not    %ebx
100093a7:	89 5d ec             	mov    %ebx,-0x14(%ebp)
100093aa:	23 5c 88 44          	and    0x44(%eax,%ecx,4),%ebx
100093ae:	89 5c 88 44          	mov    %ebx,0x44(%eax,%ecx,4)
100093b2:	fe 0f                	decb   (%edi)
100093b4:	75 33                	jne    0x100093e9
100093b6:	8b 4d ec             	mov    -0x14(%ebp),%ecx
100093b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
100093bc:	21 0b                	and    %ecx,(%ebx)
100093be:	eb 2c                	jmp    0x100093ec
100093c0:	8d 4f e0             	lea    -0x20(%edi),%ecx
100093c3:	d3 eb                	shr    %cl,%ebx
100093c5:	8b 4d fc             	mov    -0x4(%ebp),%ecx
100093c8:	8d 8c 88 c4 00 00 00 	lea    0xc4(%eax,%ecx,4),%ecx
100093cf:	8d 7c 38 04          	lea    0x4(%eax,%edi,1),%edi
100093d3:	f7 d3                	not    %ebx
100093d5:	21 19                	and    %ebx,(%ecx)
100093d7:	fe 0f                	decb   (%edi)
100093d9:	89 5d ec             	mov    %ebx,-0x14(%ebp)
100093dc:	75 0b                	jne    0x100093e9
100093de:	8b 5d 08             	mov    0x8(%ebp),%ebx
100093e1:	8b 4d ec             	mov    -0x14(%ebp),%ecx
100093e4:	21 4b 04             	and    %ecx,0x4(%ebx)
100093e7:	eb 03                	jmp    0x100093ec
100093e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
100093ec:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
100093f0:	8b 4a 08             	mov    0x8(%edx),%ecx
100093f3:	8b 7a 04             	mov    0x4(%edx),%edi
100093f6:	89 79 04             	mov    %edi,0x4(%ecx)
100093f9:	8b 4a 04             	mov    0x4(%edx),%ecx
100093fc:	8b 7a 08             	mov    0x8(%edx),%edi
100093ff:	89 79 08             	mov    %edi,0x8(%ecx)
10009402:	0f 84 8d 00 00 00    	je     0x10009495
10009408:	8b 4d f4             	mov    -0xc(%ebp),%ecx
1000940b:	8d 0c f1             	lea    (%ecx,%esi,8),%ecx
1000940e:	8b 79 04             	mov    0x4(%ecx),%edi
10009411:	89 4a 08             	mov    %ecx,0x8(%edx)
10009414:	89 7a 04             	mov    %edi,0x4(%edx)
10009417:	89 51 04             	mov    %edx,0x4(%ecx)
1000941a:	8b 4a 04             	mov    0x4(%edx),%ecx
1000941d:	89 51 08             	mov    %edx,0x8(%ecx)
10009420:	8b 4a 04             	mov    0x4(%edx),%ecx
10009423:	3b 4a 08             	cmp    0x8(%edx),%ecx
10009426:	75 5e                	jne    0x10009486
10009428:	8a 4c 06 04          	mov    0x4(%esi,%eax,1),%cl
1000942c:	88 4d 0b             	mov    %cl,0xb(%ebp)
1000942f:	fe c1                	inc    %cl
10009431:	83 fe 20             	cmp    $0x20,%esi
10009434:	88 4c 06 04          	mov    %cl,0x4(%esi,%eax,1)
10009438:	7d 23                	jge    0x1000945d
1000943a:	80 7d 0b 00          	cmpb   $0x0,0xb(%ebp)
1000943e:	75 0b                	jne    0x1000944b
10009440:	bf 00 00 00 80       	mov    $0x80000000,%edi
10009445:	8b ce                	mov    %esi,%ecx
10009447:	d3 ef                	shr    %cl,%edi
10009449:	09 3b                	or     %edi,(%ebx)
1000944b:	8b ce                	mov    %esi,%ecx
1000944d:	bf 00 00 00 80       	mov    $0x80000000,%edi
10009452:	d3 ef                	shr    %cl,%edi
10009454:	8b 4d fc             	mov    -0x4(%ebp),%ecx
10009457:	09 7c 88 44          	or     %edi,0x44(%eax,%ecx,4)
1000945b:	eb 29                	jmp    0x10009486
1000945d:	80 7d 0b 00          	cmpb   $0x0,0xb(%ebp)
10009461:	75 0d                	jne    0x10009470
10009463:	8d 4e e0             	lea    -0x20(%esi),%ecx
10009466:	bf 00 00 00 80       	mov    $0x80000000,%edi
1000946b:	d3 ef                	shr    %cl,%edi
1000946d:	09 7b 04             	or     %edi,0x4(%ebx)
10009470:	8b 4d fc             	mov    -0x4(%ebp),%ecx
10009473:	8d bc 88 c4 00 00 00 	lea    0xc4(%eax,%ecx,4),%edi
1000947a:	8d 4e e0             	lea    -0x20(%esi),%ecx
1000947d:	be 00 00 00 80       	mov    $0x80000000,%esi
10009482:	d3 ee                	shr    %cl,%esi
10009484:	09 37                	or     %esi,(%edi)
10009486:	8b 4d f8             	mov    -0x8(%ebp),%ecx
10009489:	85 c9                	test   %ecx,%ecx
1000948b:	74 0b                	je     0x10009498
1000948d:	89 0a                	mov    %ecx,(%edx)
1000948f:	89 4c 11 fc          	mov    %ecx,-0x4(%ecx,%edx,1)
10009493:	eb 03                	jmp    0x10009498
10009495:	8b 4d f8             	mov    -0x8(%ebp),%ecx
10009498:	8b 75 f0             	mov    -0x10(%ebp),%esi
1000949b:	03 d1                	add    %ecx,%edx
1000949d:	8d 4e 01             	lea    0x1(%esi),%ecx
100094a0:	89 0a                	mov    %ecx,(%edx)
100094a2:	89 4c 32 fc          	mov    %ecx,-0x4(%edx,%esi,1)
100094a6:	8b 75 f4             	mov    -0xc(%ebp),%esi
100094a9:	8b 0e                	mov    (%esi),%ecx
100094ab:	85 c9                	test   %ecx,%ecx
100094ad:	8d 79 01             	lea    0x1(%ecx),%edi
100094b0:	89 3e                	mov    %edi,(%esi)
100094b2:	75 1a                	jne    0x100094ce
100094b4:	3b 1d c0 02 01 10    	cmp    0x100102c0,%ebx
100094ba:	75 12                	jne    0x100094ce
100094bc:	8b 4d fc             	mov    -0x4(%ebp),%ecx
100094bf:	3b 0d d8 02 01 10    	cmp    0x100102d8,%ecx
100094c5:	75 07                	jne    0x100094ce
100094c7:	83 25 c0 02 01 10 00 	andl   $0x0,0x100102c0
100094ce:	8b 4d fc             	mov    -0x4(%ebp),%ecx
100094d1:	89 08                	mov    %ecx,(%eax)
100094d3:	8d 42 04             	lea    0x4(%edx),%eax
100094d6:	5f                   	pop    %edi
100094d7:	5e                   	pop    %esi
100094d8:	5b                   	pop    %ebx
100094d9:	c9                   	leave
100094da:	c3                   	ret
100094db:	6a 14                	push   $0x14
100094dd:	68 18 cb 00 10       	push   $0x1000cb18
100094e2:	e8 cd e8 ff ff       	call   0x10007db4
100094e7:	8b 7d 08             	mov    0x8(%ebp),%edi
100094ea:	33 db                	xor    %ebx,%ebx
100094ec:	3b fb                	cmp    %ebx,%edi
100094ee:	75 0e                	jne    0x100094fe
100094f0:	ff 75 0c             	push   0xc(%ebp)
100094f3:	e8 ba cf ff ff       	call   0x100064b2
100094f8:	59                   	pop    %ecx
100094f9:	e9 84 01 00 00       	jmp    0x10009682
100094fe:	8b 75 0c             	mov    0xc(%ebp),%esi
10009501:	3b f3                	cmp    %ebx,%esi
10009503:	75 0c                	jne    0x10009511
10009505:	57                   	push   %edi
10009506:	e8 b6 d4 ff ff       	call   0x100069c1
1000950b:	59                   	pop    %ecx
1000950c:	e9 6f 01 00 00       	jmp    0x10009680
10009511:	83 3d e0 02 01 10 03 	cmpl   $0x3,0x100102e0
10009518:	0f 85 2e 01 00 00    	jne    0x1000964c
1000951e:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
10009521:	83 fe e0             	cmp    $0xffffffe0,%esi
10009524:	0f 87 f1 00 00 00    	ja     0x1000961b
1000952a:	6a 04                	push   $0x4
1000952c:	e8 39 e3 ff ff       	call   0x1000786a
10009531:	59                   	pop    %ecx
10009532:	89 5d fc             	mov    %ebx,-0x4(%ebp)
10009535:	57                   	push   %edi
10009536:	e8 c5 f4 ff ff       	call   0x10008a00
1000953b:	59                   	pop    %ecx
1000953c:	89 45 e0             	mov    %eax,-0x20(%ebp)
1000953f:	3b c3                	cmp    %ebx,%eax
10009541:	0f 84 a4 00 00 00    	je     0x100095eb
10009547:	3b 35 cc 02 01 10    	cmp    0x100102cc,%esi
1000954d:	77 4c                	ja     0x1000959b
1000954f:	56                   	push   %esi
10009550:	57                   	push   %edi
10009551:	50                   	push   %eax
10009552:	e8 a9 f9 ff ff       	call   0x10008f00
10009557:	83 c4 0c             	add    $0xc,%esp
1000955a:	85 c0                	test   %eax,%eax
1000955c:	74 05                	je     0x10009563
1000955e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
10009561:	eb 38                	jmp    0x1000959b
10009563:	56                   	push   %esi
10009564:	e8 76 fc ff ff       	call   0x100091df
10009569:	59                   	pop    %ecx
1000956a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
1000956d:	3b c3                	cmp    %ebx,%eax
1000956f:	74 2a                	je     0x1000959b
10009571:	8b 47 fc             	mov    -0x4(%edi),%eax
10009574:	48                   	dec    %eax
10009575:	89 45 dc             	mov    %eax,-0x24(%ebp)
10009578:	3b c6                	cmp    %esi,%eax
1000957a:	72 02                	jb     0x1000957e
1000957c:	8b c6                	mov    %esi,%eax
1000957e:	50                   	push   %eax
1000957f:	57                   	push   %edi
10009580:	ff 75 e4             	push   -0x1c(%ebp)
10009583:	e8 e8 cf ff ff       	call   0x10006570
10009588:	57                   	push   %edi
10009589:	e8 72 f4 ff ff       	call   0x10008a00
1000958e:	89 45 e0             	mov    %eax,-0x20(%ebp)
10009591:	57                   	push   %edi
10009592:	50                   	push   %eax
10009593:	e8 93 f4 ff ff       	call   0x10008a2b
10009598:	83 c4 18             	add    $0x18,%esp
1000959b:	39 5d e4             	cmp    %ebx,-0x1c(%ebp)
1000959e:	75 4b                	jne    0x100095eb
100095a0:	3b f3                	cmp    %ebx,%esi
100095a2:	75 06                	jne    0x100095aa
100095a4:	33 f6                	xor    %esi,%esi
100095a6:	46                   	inc    %esi
100095a7:	89 75 0c             	mov    %esi,0xc(%ebp)
100095aa:	83 c6 0f             	add    $0xf,%esi
100095ad:	83 e6 f0             	and    $0xfffffff0,%esi
100095b0:	89 75 0c             	mov    %esi,0xc(%ebp)
100095b3:	56                   	push   %esi
100095b4:	53                   	push   %ebx
100095b5:	ff 35 dc 02 01 10    	push   0x100102dc
100095bb:	ff 15 34 c0 00 10    	call   *0x1000c034  ; 0x1000c034=KERNEL32.dll!HeapAlloc
100095c1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
100095c4:	3b c3                	cmp    %ebx,%eax
100095c6:	74 23                	je     0x100095eb
100095c8:	8b 47 fc             	mov    -0x4(%edi),%eax
100095cb:	48                   	dec    %eax
100095cc:	89 45 dc             	mov    %eax,-0x24(%ebp)
100095cf:	3b c6                	cmp    %esi,%eax
100095d1:	72 02                	jb     0x100095d5
100095d3:	8b c6                	mov    %esi,%eax
100095d5:	50                   	push   %eax
100095d6:	57                   	push   %edi
100095d7:	ff 75 e4             	push   -0x1c(%ebp)
100095da:	e8 91 cf ff ff       	call   0x10006570
100095df:	57                   	push   %edi
100095e0:	ff 75 e0             	push   -0x20(%ebp)
100095e3:	e8 43 f4 ff ff       	call   0x10008a2b
100095e8:	83 c4 14             	add    $0x14,%esp
100095eb:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
100095ef:	e8 4f 00 00 00       	call   0x10009643
100095f4:	39 5d e0             	cmp    %ebx,-0x20(%ebp)
100095f7:	75 22                	jne    0x1000961b
100095f9:	3b f3                	cmp    %ebx,%esi
100095fb:	75 03                	jne    0x10009600
100095fd:	33 f6                	xor    %esi,%esi
100095ff:	46                   	inc    %esi
10009600:	83 c6 0f             	add    $0xf,%esi
10009603:	83 e6 f0             	and    $0xfffffff0,%esi
10009606:	89 75 0c             	mov    %esi,0xc(%ebp)
10009609:	56                   	push   %esi
1000960a:	57                   	push   %edi
1000960b:	53                   	push   %ebx
1000960c:	ff 35 dc 02 01 10    	push   0x100102dc
10009612:	ff 15 b8 c0 00 10    	call   *0x1000c0b8  ; 0x1000c0b8=KERNEL32.dll!HeapReAlloc
10009618:	89 45 e4             	mov    %eax,-0x1c(%ebp)
1000961b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
1000961e:	3b c3                	cmp    %ebx,%eax
10009620:	75 60                	jne    0x10009682
10009622:	39 1d f8 fe 00 10    	cmp    %ebx,0x1000fef8
10009628:	74 58                	je     0x10009682
1000962a:	56                   	push   %esi
1000962b:	e8 94 ce ff ff       	call   0x100064c4
10009630:	59                   	pop    %ecx
10009631:	85 c0                	test   %eax,%eax
10009633:	0f 85 e5 fe ff ff    	jne    0x1000951e
10009639:	eb 45                	jmp    0x10009680
1000963b:	33 db                	xor    %ebx,%ebx
1000963d:	8b 75 0c             	mov    0xc(%ebp),%esi
10009640:	8b 7d 08             	mov    0x8(%ebp),%edi
10009643:	6a 04                	push   $0x4
10009645:	e8 8c e1 ff ff       	call   0x100077d6
1000964a:	59                   	pop    %ecx
1000964b:	c3                   	ret
1000964c:	33 c0                	xor    %eax,%eax
1000964e:	83 fe e0             	cmp    $0xffffffe0,%esi
10009651:	77 16                	ja     0x10009669
10009653:	3b f3                	cmp    %ebx,%esi
10009655:	75 03                	jne    0x1000965a
10009657:	33 f6                	xor    %esi,%esi
10009659:	46                   	inc    %esi
1000965a:	56                   	push   %esi
1000965b:	57                   	push   %edi
1000965c:	53                   	push   %ebx
1000965d:	ff 35 dc 02 01 10    	push   0x100102dc
10009663:	ff 15 b8 c0 00 10    	call   *0x1000c0b8  ; 0x1000c0b8=KERNEL32.dll!HeapReAlloc
10009669:	3b c3                	cmp    %ebx,%eax
1000966b:	75 15                	jne    0x10009682
1000966d:	39 1d f8 fe 00 10    	cmp    %ebx,0x1000fef8
10009673:	74 0d                	je     0x10009682
10009675:	56                   	push   %esi
10009676:	e8 49 ce ff ff       	call   0x100064c4
1000967b:	59                   	pop    %ecx
1000967c:	85 c0                	test   %eax,%eax
1000967e:	75 cc                	jne    0x1000964c
10009680:	33 c0                	xor    %eax,%eax
10009682:	e8 68 e7 ff ff       	call   0x10007def
10009687:	c3                   	ret
10009688:	6a 10                	push   $0x10
1000968a:	68 28 cb 00 10       	push   $0x1000cb28
1000968f:	e8 20 e7 ff ff       	call   0x10007db4
10009694:	83 3d e0 02 01 10 03 	cmpl   $0x3,0x100102e0
1000969b:	75 3a                	jne    0x100096d7
1000969d:	6a 04                	push   $0x4
1000969f:	e8 c6 e1 ff ff       	call   0x1000786a
100096a4:	59                   	pop    %ecx
100096a5:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
100096a9:	8b 75 08             	mov    0x8(%ebp),%esi
100096ac:	56                   	push   %esi
100096ad:	e8 4e f3 ff ff       	call   0x10008a00
100096b2:	59                   	pop    %ecx
100096b3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
100096b6:	85 c0                	test   %eax,%eax
100096b8:	74 0b                	je     0x100096c5
100096ba:	8b 76 fc             	mov    -0x4(%esi),%esi
100096bd:	83 ee 09             	sub    $0x9,%esi
100096c0:	89 75 e0             	mov    %esi,-0x20(%ebp)
100096c3:	eb 03                	jmp    0x100096c8
100096c5:	8b 75 e0             	mov    -0x20(%ebp),%esi
100096c8:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
100096cc:	e8 24 00 00 00       	call   0x100096f5
100096d1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
100096d5:	75 13                	jne    0x100096ea
100096d7:	ff 75 08             	push   0x8(%ebp)
100096da:	6a 00                	push   $0x0
100096dc:	ff 35 dc 02 01 10    	push   0x100102dc
100096e2:	ff 15 c0 c0 00 10    	call   *0x1000c0c0  ; 0x1000c0c0=KERNEL32.dll!HeapSize
100096e8:	8b f0                	mov    %eax,%esi
100096ea:	8b c6                	mov    %esi,%eax
100096ec:	e8 fe e6 ff ff       	call   0x10007def
100096f1:	c3                   	ret
100096f2:	8b 75 e0             	mov    -0x20(%ebp),%esi
100096f5:	6a 04                	push   $0x4
100096f7:	e8 da e0 ff ff       	call   0x100077d6
100096fc:	59                   	pop    %ecx
100096fd:	c3                   	ret
100096fe:	56                   	push   %esi
100096ff:	ff 74 24 0c          	push   0xc(%esp)
10009703:	33 f6                	xor    %esi,%esi
10009705:	ff 74 24 0c          	push   0xc(%esp)
10009709:	46                   	inc    %esi
1000970a:	ff 15 c4 c0 00 10    	call   *0x1000c0c4  ; 0x1000c0c4=KERNEL32.dll!IsBadReadPtr
10009710:	85 c0                	test   %eax,%eax
10009712:	74 02                	je     0x10009716
10009714:	33 f6                	xor    %esi,%esi
10009716:	8b c6                	mov    %esi,%eax
10009718:	5e                   	pop    %esi
10009719:	c3                   	ret
1000971a:	56                   	push   %esi
1000971b:	ff 74 24 0c          	push   0xc(%esp)
1000971f:	33 f6                	xor    %esi,%esi
10009721:	ff 74 24 0c          	push   0xc(%esp)
10009725:	46                   	inc    %esi
10009726:	ff 15 bc c0 00 10    	call   *0x1000c0bc  ; 0x1000c0bc=KERNEL32.dll!IsBadWritePtr
1000972c:	85 c0                	test   %eax,%eax
1000972e:	74 02                	je     0x10009732
10009730:	33 f6                	xor    %esi,%esi
10009732:	8b c6                	mov    %esi,%eax
10009734:	5e                   	pop    %esi
10009735:	c3                   	ret
10009736:	56                   	push   %esi
10009737:	ff 74 24 08          	push   0x8(%esp)
1000973b:	33 f6                	xor    %esi,%esi
1000973d:	46                   	inc    %esi
1000973e:	ff 15 c8 c0 00 10    	call   *0x1000c0c8  ; 0x1000c0c8=KERNEL32.dll!IsBadCodePtr
10009744:	85 c0                	test   %eax,%eax
10009746:	74 02                	je     0x1000974a
10009748:	33 f6                	xor    %esi,%esi
1000974a:	8b c6                	mov    %esi,%eax
1000974c:	5e                   	pop    %esi
1000974d:	c3                   	ret
1000974e:	6a 0a                	push   $0xa
10009750:	e8 b3 f0 ff ff       	call   0x10008808
10009755:	6a 16                	push   $0x16
10009757:	e8 4e 0f 00 00       	call   0x1000a6aa
1000975c:	59                   	pop    %ecx
1000975d:	59                   	pop    %ecx
1000975e:	6a 03                	push   $0x3
10009760:	e8 15 e8 ff ff       	call   0x10007f7a
10009765:	cc                   	int3
10009766:	2d a4 03 00 00       	sub    $0x3a4,%eax
1000976b:	74 22                	je     0x1000978f
1000976d:	83 e8 04             	sub    $0x4,%eax
10009770:	74 17                	je     0x10009789
10009772:	83 e8 0d             	sub    $0xd,%eax
10009775:	74 0c                	je     0x10009783
10009777:	48                   	dec    %eax
10009778:	74 03                	je     0x1000977d
1000977a:	33 c0                	xor    %eax,%eax
1000977c:	c3                   	ret
1000977d:	b8 04 04 00 00       	mov    $0x404,%eax
10009782:	c3                   	ret
10009783:	b8 12 04 00 00       	mov    $0x412,%eax
10009788:	c3                   	ret
10009789:	b8 04 08 00 00       	mov    $0x804,%eax
1000978e:	c3                   	ret
1000978f:	b8 11 04 00 00       	mov    $0x411,%eax
10009794:	c3                   	ret
10009795:	57                   	push   %edi
10009796:	6a 40                	push   $0x40
10009798:	33 c0                	xor    %eax,%eax
1000979a:	59                   	pop    %ecx
1000979b:	bf a0 00 01 10       	mov    $0x100100a0,%edi
100097a0:	f3 ab                	rep stos %eax,%es:(%edi)
100097a2:	aa                   	stos   %al,%es:(%edi)
100097a3:	33 c0                	xor    %eax,%eax
100097a5:	a3 a4 01 01 10       	mov    %eax,0x100101a4
100097aa:	a3 88 00 01 10       	mov    %eax,0x10010088
100097af:	a3 80 00 01 10       	mov    %eax,0x10010080
100097b4:	bf b0 01 01 10       	mov    $0x100101b0,%edi
100097b9:	ab                   	stos   %eax,%es:(%edi)
100097ba:	ab                   	stos   %eax,%es:(%edi)
100097bb:	ab                   	stos   %eax,%es:(%edi)
100097bc:	5f                   	pop    %edi
100097bd:	c3                   	ret
100097be:	55                   	push   %ebp
100097bf:	8b ec                	mov    %esp,%ebp
100097c1:	81 ec 18 05 00 00    	sub    $0x518,%esp
100097c7:	a1 30 f1 00 10       	mov    0x1000f130,%eax
100097cc:	33 45 04             	xor    0x4(%ebp),%eax
100097cf:	56                   	push   %esi
100097d0:	89 45 fc             	mov    %eax,-0x4(%ebp)
100097d3:	8d 45 e8             	lea    -0x18(%ebp),%eax
100097d6:	50                   	push   %eax
100097d7:	ff 35 a4 01 01 10    	push   0x100101a4
100097dd:	ff 15 d4 c0 00 10    	call   *0x1000c0d4  ; 0x1000c0d4=KERNEL32.dll!GetCPInfo
100097e3:	83 f8 01             	cmp    $0x1,%eax
100097e6:	be 00 01 00 00       	mov    $0x100,%esi
100097eb:	0f 85 0d 01 00 00    	jne    0x100098fe
100097f1:	33 c0                	xor    %eax,%eax
100097f3:	88 84 05 e8 fe ff ff 	mov    %al,-0x118(%ebp,%eax,1)
100097fa:	40                   	inc    %eax
100097fb:	3b c6                	cmp    %esi,%eax
100097fd:	72 f4                	jb     0x100097f3
100097ff:	8a 45 ee             	mov    -0x12(%ebp),%al
10009802:	84 c0                	test   %al,%al
10009804:	c6 85 e8 fe ff ff 20 	movb   $0x20,-0x118(%ebp)
1000980b:	74 36                	je     0x10009843
1000980d:	53                   	push   %ebx
1000980e:	8d 55 ef             	lea    -0x11(%ebp),%edx
10009811:	57                   	push   %edi
10009812:	0f b6 0a             	movzbl (%edx),%ecx
10009815:	0f b6 c0             	movzbl %al,%eax
10009818:	3b c1                	cmp    %ecx,%eax
1000981a:	77 1d                	ja     0x10009839
1000981c:	2b c8                	sub    %eax,%ecx
1000981e:	41                   	inc    %ecx
1000981f:	8b d9                	mov    %ecx,%ebx
10009821:	c1 e9 02             	shr    $0x2,%ecx
10009824:	8d bc 05 e8 fe ff ff 	lea    -0x118(%ebp,%eax,1),%edi
1000982b:	b8 20 20 20 20       	mov    $0x20202020,%eax
10009830:	f3 ab                	rep stos %eax,%es:(%edi)
10009832:	8b cb                	mov    %ebx,%ecx
10009834:	83 e1 03             	and    $0x3,%ecx
10009837:	f3 aa                	rep stos %al,%es:(%edi)
10009839:	42                   	inc    %edx
1000983a:	8a 02                	mov    (%edx),%al
1000983c:	42                   	inc    %edx
1000983d:	84 c0                	test   %al,%al
1000983f:	75 d1                	jne    0x10009812
10009841:	5f                   	pop    %edi
10009842:	5b                   	pop    %ebx
10009843:	6a 00                	push   $0x0
10009845:	ff 35 80 00 01 10    	push   0x10010080
1000984b:	8d 85 e8 fa ff ff    	lea    -0x518(%ebp),%eax
10009851:	ff 35 a4 01 01 10    	push   0x100101a4
10009857:	50                   	push   %eax
10009858:	56                   	push   %esi
10009859:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
1000985f:	50                   	push   %eax
10009860:	6a 01                	push   $0x1
10009862:	e8 91 04 00 00       	call   0x10009cf8
10009867:	6a 00                	push   $0x0
10009869:	ff 35 a4 01 01 10    	push   0x100101a4
1000986f:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
10009875:	56                   	push   %esi
10009876:	50                   	push   %eax
10009877:	56                   	push   %esi
10009878:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
1000987e:	50                   	push   %eax
1000987f:	56                   	push   %esi
10009880:	ff 35 80 00 01 10    	push   0x10010080
10009886:	e8 98 0f 00 00       	call   0x1000a823
1000988b:	6a 00                	push   $0x0
1000988d:	ff 35 a4 01 01 10    	push   0x100101a4
10009893:	8d 85 e8 fc ff ff    	lea    -0x318(%ebp),%eax
10009899:	56                   	push   %esi
1000989a:	50                   	push   %eax
1000989b:	56                   	push   %esi
1000989c:	8d 85 e8 fe ff ff    	lea    -0x118(%ebp),%eax
100098a2:	50                   	push   %eax
100098a3:	68 00 02 00 00       	push   $0x200
100098a8:	ff 35 80 00 01 10    	push   0x10010080
100098ae:	e8 70 0f 00 00       	call   0x1000a823
100098b3:	83 c4 5c             	add    $0x5c,%esp
100098b6:	33 c0                	xor    %eax,%eax
100098b8:	66 8b 8c 45 e8 fa ff 	mov    -0x518(%ebp,%eax,2),%cx
100098bf:	ff 
100098c0:	f6 c1 01             	test   $0x1,%cl
100098c3:	74 16                	je     0x100098db
100098c5:	80 88 a1 00 01 10 10 	orb    $0x10,0x100100a1(%eax)
100098cc:	8a 8c 05 e8 fd ff ff 	mov    -0x218(%ebp,%eax,1),%cl
100098d3:	88 88 c0 01 01 10    	mov    %cl,0x100101c0(%eax)
100098d9:	eb 1c                	jmp    0x100098f7
100098db:	f6 c1 02             	test   $0x2,%cl
100098de:	74 10                	je     0x100098f0
100098e0:	80 88 a1 00 01 10 20 	orb    $0x20,0x100100a1(%eax)
100098e7:	8a 8c 05 e8 fc ff ff 	mov    -0x318(%ebp,%eax,1),%cl
100098ee:	eb e3                	jmp    0x100098d3
100098f0:	80 a0 c0 01 01 10 00 	andb   $0x0,0x100101c0(%eax)
100098f7:	40                   	inc    %eax
100098f8:	3b c6                	cmp    %esi,%eax
100098fa:	72 bc                	jb     0x100098b8
100098fc:	eb 44                	jmp    0x10009942
100098fe:	33 c0                	xor    %eax,%eax
10009900:	83 f8 41             	cmp    $0x41,%eax
10009903:	72 19                	jb     0x1000991e
10009905:	83 f8 5a             	cmp    $0x5a,%eax
10009908:	77 14                	ja     0x1000991e
1000990a:	80 88 a1 00 01 10 10 	orb    $0x10,0x100100a1(%eax)
10009911:	8a c8                	mov    %al,%cl
10009913:	80 c1 20             	add    $0x20,%cl
10009916:	88 88 c0 01 01 10    	mov    %cl,0x100101c0(%eax)
1000991c:	eb 1f                	jmp    0x1000993d
1000991e:	83 f8 61             	cmp    $0x61,%eax
10009921:	72 13                	jb     0x10009936
10009923:	83 f8 7a             	cmp    $0x7a,%eax
10009926:	77 0e                	ja     0x10009936
10009928:	80 88 a1 00 01 10 20 	orb    $0x20,0x100100a1(%eax)
1000992f:	8a c8                	mov    %al,%cl
10009931:	80 e9 20             	sub    $0x20,%cl
10009934:	eb e0                	jmp    0x10009916
10009936:	80 a0 c0 01 01 10 00 	andb   $0x0,0x100101c0(%eax)
1000993d:	40                   	inc    %eax
1000993e:	3b c6                	cmp    %esi,%eax
10009940:	72 be                	jb     0x10009900
10009942:	8b 4d fc             	mov    -0x4(%ebp),%ecx
10009945:	33 4d 04             	xor    0x4(%ebp),%ecx
10009948:	5e                   	pop    %esi
10009949:	e8 1d c8 ff ff       	call   0x1000616b
1000994e:	c9                   	leave
1000994f:	c3                   	ret
10009950:	55                   	push   %ebp
10009951:	8b ec                	mov    %esp,%ebp
10009953:	83 ec 1c             	sub    $0x1c,%esp
10009956:	a1 30 f1 00 10       	mov    0x1000f130,%eax
1000995b:	33 45 04             	xor    0x4(%ebp),%eax
1000995e:	53                   	push   %ebx
1000995f:	56                   	push   %esi
10009960:	8b 75 08             	mov    0x8(%ebp),%esi
10009963:	33 db                	xor    %ebx,%ebx
10009965:	3b f3                	cmp    %ebx,%esi
10009967:	89 45 fc             	mov    %eax,-0x4(%ebp)
1000996a:	57                   	push   %edi
1000996b:	0f 84 54 01 00 00    	je     0x10009ac5
10009971:	33 d2                	xor    %edx,%edx
10009973:	33 c0                	xor    %eax,%eax
10009975:	39 b0 68 f5 00 10    	cmp    %esi,0x1000f568(%eax)
1000997b:	74 65                	je     0x100099e2
1000997d:	83 c0 30             	add    $0x30,%eax
10009980:	42                   	inc    %edx
10009981:	3d f0 00 00 00       	cmp    $0xf0,%eax
10009986:	72 ed                	jb     0x10009975
10009988:	8d 45 e4             	lea    -0x1c(%ebp),%eax
1000998b:	50                   	push   %eax
1000998c:	56                   	push   %esi
1000998d:	ff 15 d4 c0 00 10    	call   *0x1000c0d4  ; 0x1000c0d4=KERNEL32.dll!GetCPInfo
10009993:	83 f8 01             	cmp    $0x1,%eax
10009996:	0f 85 21 01 00 00    	jne    0x10009abd
1000999c:	6a 40                	push   $0x40
1000999e:	33 c0                	xor    %eax,%eax
100099a0:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
100099a4:	59                   	pop    %ecx
100099a5:	bf a0 00 01 10       	mov    $0x100100a0,%edi
100099aa:	f3 ab                	rep stos %eax,%es:(%edi)
100099ac:	aa                   	stos   %al,%es:(%edi)
100099ad:	89 35 a4 01 01 10    	mov    %esi,0x100101a4
100099b3:	89 1d 80 00 01 10    	mov    %ebx,0x10010080
100099b9:	0f 86 ec 00 00 00    	jbe    0x10009aab
100099bf:	80 7d ea 00          	cmpb   $0x0,-0x16(%ebp)
100099c3:	0f 84 ba 00 00 00    	je     0x10009a83
100099c9:	8d 4d eb             	lea    -0x15(%ebp),%ecx
100099cc:	8a 11                	mov    (%ecx),%dl
100099ce:	84 d2                	test   %dl,%dl
100099d0:	0f 84 ad 00 00 00    	je     0x10009a83
100099d6:	0f b6 41 ff          	movzbl -0x1(%ecx),%eax
100099da:	0f b6 d2             	movzbl %dl,%edx
100099dd:	e9 91 00 00 00       	jmp    0x10009a73
100099e2:	6a 40                	push   $0x40
100099e4:	33 c0                	xor    %eax,%eax
100099e6:	59                   	pop    %ecx
100099e7:	bf a0 00 01 10       	mov    $0x100100a0,%edi
100099ec:	f3 ab                	rep stos %eax,%es:(%edi)
100099ee:	8d 0c 52             	lea    (%edx,%edx,2),%ecx
100099f1:	c1 e1 04             	shl    $0x4,%ecx
100099f4:	89 5d f8             	mov    %ebx,-0x8(%ebp)
100099f7:	aa                   	stos   %al,%es:(%edi)
100099f8:	8d 99 78 f5 00 10    	lea    0x1000f578(%ecx),%ebx
100099fe:	8a 03                	mov    (%ebx),%al
10009a00:	8b f3                	mov    %ebx,%esi
10009a02:	eb 29                	jmp    0x10009a2d
10009a04:	8a 56 01             	mov    0x1(%esi),%dl
10009a07:	84 d2                	test   %dl,%dl
10009a09:	74 26                	je     0x10009a31
10009a0b:	0f b6 c0             	movzbl %al,%eax
10009a0e:	0f b6 fa             	movzbl %dl,%edi
10009a11:	3b c7                	cmp    %edi,%eax
10009a13:	77 14                	ja     0x10009a29
10009a15:	8b 55 f8             	mov    -0x8(%ebp),%edx
10009a18:	8a 92 60 f5 00 10    	mov    0x1000f560(%edx),%dl
10009a1e:	08 90 a1 00 01 10    	or     %dl,0x100100a1(%eax)
10009a24:	40                   	inc    %eax
10009a25:	3b c7                	cmp    %edi,%eax
10009a27:	76 f5                	jbe    0x10009a1e
10009a29:	46                   	inc    %esi
10009a2a:	46                   	inc    %esi
10009a2b:	8a 06                	mov    (%esi),%al
10009a2d:	84 c0                	test   %al,%al
10009a2f:	75 d3                	jne    0x10009a04
10009a31:	ff 45 f8             	incl   -0x8(%ebp)
10009a34:	83 c3 08             	add    $0x8,%ebx
10009a37:	83 7d f8 04          	cmpl   $0x4,-0x8(%ebp)
10009a3b:	72 c1                	jb     0x100099fe
10009a3d:	8b 45 08             	mov    0x8(%ebp),%eax
10009a40:	a3 a4 01 01 10       	mov    %eax,0x100101a4
10009a45:	c7 05 88 00 01 10 01 	movl   $0x1,0x10010088
10009a4c:	00 00 00 
10009a4f:	e8 12 fd ff ff       	call   0x10009766
10009a54:	8d 89 6c f5 00 10    	lea    0x1000f56c(%ecx),%ecx
10009a5a:	8b f1                	mov    %ecx,%esi
10009a5c:	bf b0 01 01 10       	mov    $0x100101b0,%edi
10009a61:	a5                   	movsl  %ds:(%esi),%es:(%edi)
10009a62:	a5                   	movsl  %ds:(%esi),%es:(%edi)
10009a63:	a3 80 00 01 10       	mov    %eax,0x10010080
10009a68:	a5                   	movsl  %ds:(%esi),%es:(%edi)
10009a69:	eb 5f                	jmp    0x10009aca
10009a6b:	80 88 a1 00 01 10 04 	orb    $0x4,0x100100a1(%eax)
10009a72:	40                   	inc    %eax
10009a73:	3b c2                	cmp    %edx,%eax
10009a75:	76 f4                	jbe    0x10009a6b
10009a77:	41                   	inc    %ecx
10009a78:	41                   	inc    %ecx
10009a79:	80 79 ff 00          	cmpb   $0x0,-0x1(%ecx)
10009a7d:	0f 85 49 ff ff ff    	jne    0x100099cc
10009a83:	33 c9                	xor    %ecx,%ecx
10009a85:	41                   	inc    %ecx
10009a86:	8b c1                	mov    %ecx,%eax
10009a88:	80 88 a1 00 01 10 08 	orb    $0x8,0x100100a1(%eax)
10009a8f:	40                   	inc    %eax
10009a90:	3d ff 00 00 00       	cmp    $0xff,%eax
10009a95:	72 f1                	jb     0x10009a88
10009a97:	8b c6                	mov    %esi,%eax
10009a99:	e8 c8 fc ff ff       	call   0x10009766
10009a9e:	a3 80 00 01 10       	mov    %eax,0x10010080
10009aa3:	89 0d 88 00 01 10    	mov    %ecx,0x10010088
10009aa9:	eb 06                	jmp    0x10009ab1
10009aab:	89 1d 88 00 01 10    	mov    %ebx,0x10010088
10009ab1:	33 c0                	xor    %eax,%eax
10009ab3:	bf b0 01 01 10       	mov    $0x100101b0,%edi
10009ab8:	ab                   	stos   %eax,%es:(%edi)
10009ab9:	ab                   	stos   %eax,%es:(%edi)
10009aba:	ab                   	stos   %eax,%es:(%edi)
10009abb:	eb 0d                	jmp    0x10009aca
10009abd:	39 1d fc fe 00 10    	cmp    %ebx,0x1000fefc
10009ac3:	74 0e                	je     0x10009ad3
10009ac5:	e8 cb fc ff ff       	call   0x10009795
10009aca:	e8 ef fc ff ff       	call   0x100097be
10009acf:	33 c0                	xor    %eax,%eax
10009ad1:	eb 03                	jmp    0x10009ad6
10009ad3:	83 c8 ff             	or     $0xffffffff,%eax
10009ad6:	8b 4d fc             	mov    -0x4(%ebp),%ecx
10009ad9:	33 4d 04             	xor    0x4(%ebp),%ecx
10009adc:	5f                   	pop    %edi
10009add:	5e                   	pop    %esi
10009ade:	5b                   	pop    %ebx
10009adf:	e8 87 c6 ff ff       	call   0x1000616b
10009ae4:	c9                   	leave
10009ae5:	c3                   	ret
10009ae6:	6a 14                	push   $0x14
10009ae8:	68 38 cb 00 10       	push   $0x1000cb38
10009aed:	e8 c2 e2 ff ff       	call   0x10007db4
10009af2:	83 4d e4 ff          	orl    $0xffffffff,-0x1c(%ebp)
10009af6:	6a 0d                	push   $0xd
10009af8:	e8 6d dd ff ff       	call   0x1000786a
10009afd:	59                   	pop    %ecx
10009afe:	33 ff                	xor    %edi,%edi
10009b00:	89 7d fc             	mov    %edi,-0x4(%ebp)
10009b03:	89 3d fc fe 00 10    	mov    %edi,0x1000fefc
10009b09:	8b 45 08             	mov    0x8(%ebp),%eax
10009b0c:	83 f8 fe             	cmp    $0xfffffffe,%eax
10009b0f:	75 12                	jne    0x10009b23
10009b11:	c7 05 fc fe 00 10 01 	movl   $0x1,0x1000fefc
10009b18:	00 00 00 
10009b1b:	ff 15 d0 c0 00 10    	call   *0x1000c0d0  ; 0x1000c0d0=KERNEL32.dll!GetOEMCP
10009b21:	eb 2b                	jmp    0x10009b4e
10009b23:	83 f8 fd             	cmp    $0xfffffffd,%eax
10009b26:	75 12                	jne    0x10009b3a
10009b28:	c7 05 fc fe 00 10 01 	movl   $0x1,0x1000fefc
10009b2f:	00 00 00 
10009b32:	ff 15 cc c0 00 10    	call   *0x1000c0cc  ; 0x1000c0cc=KERNEL32.dll!GetACP
10009b38:	eb 14                	jmp    0x10009b4e
10009b3a:	83 f8 fc             	cmp    $0xfffffffc,%eax
10009b3d:	75 0f                	jne    0x10009b4e
10009b3f:	c7 05 fc fe 00 10 01 	movl   $0x1,0x1000fefc
10009b46:	00 00 00 
10009b49:	a1 50 ff 00 10       	mov    0x1000ff50,%eax
10009b4e:	89 45 08             	mov    %eax,0x8(%ebp)
10009b51:	3b 05 a4 01 01 10    	cmp    0x100101a4,%eax
10009b57:	0f 84 bb 00 00 00    	je     0x10009c18
10009b5d:	8b 35 84 00 01 10    	mov    0x10010084,%esi
10009b63:	89 75 e0             	mov    %esi,-0x20(%ebp)
10009b66:	3b f7                	cmp    %edi,%esi
10009b68:	74 04                	je     0x10009b6e
10009b6a:	39 3e                	cmp    %edi,(%esi)
10009b6c:	74 10                	je     0x10009b7e
10009b6e:	68 20 02 00 00       	push   $0x220
10009b73:	e8 3a c9 ff ff       	call   0x100064b2
10009b78:	59                   	pop    %ecx
10009b79:	8b f0                	mov    %eax,%esi
10009b7b:	89 75 e0             	mov    %esi,-0x20(%ebp)
10009b7e:	3b f7                	cmp    %edi,%esi
10009b80:	74 7f                	je     0x10009c01
10009b82:	ff 75 08             	push   0x8(%ebp)
10009b85:	e8 c6 fd ff ff       	call   0x10009950
10009b8a:	59                   	pop    %ecx
10009b8b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
10009b8e:	3b c7                	cmp    %edi,%eax
10009b90:	75 6f                	jne    0x10009c01
10009b92:	89 3e                	mov    %edi,(%esi)
10009b94:	a1 a4 01 01 10       	mov    0x100101a4,%eax
10009b99:	89 46 04             	mov    %eax,0x4(%esi)
10009b9c:	a1 88 00 01 10       	mov    0x10010088,%eax
10009ba1:	89 46 08             	mov    %eax,0x8(%esi)
10009ba4:	a1 80 00 01 10       	mov    0x10010080,%eax
10009ba9:	89 46 0c             	mov    %eax,0xc(%esi)
10009bac:	33 c0                	xor    %eax,%eax
10009bae:	89 45 dc             	mov    %eax,-0x24(%ebp)
10009bb1:	83 f8 05             	cmp    $0x5,%eax
10009bb4:	7d 10                	jge    0x10009bc6
10009bb6:	66 8b 0c 45 b0 01 01 	mov    0x100101b0(,%eax,2),%cx
10009bbd:	10 
10009bbe:	66 89 4c 46 10       	mov    %cx,0x10(%esi,%eax,2)
10009bc3:	40                   	inc    %eax
10009bc4:	eb e8                	jmp    0x10009bae
10009bc6:	33 c0                	xor    %eax,%eax
10009bc8:	89 45 dc             	mov    %eax,-0x24(%ebp)
10009bcb:	3d 01 01 00 00       	cmp    $0x101,%eax
10009bd0:	7d 0d                	jge    0x10009bdf
10009bd2:	8a 88 a0 00 01 10    	mov    0x100100a0(%eax),%cl
10009bd8:	88 4c 30 1c          	mov    %cl,0x1c(%eax,%esi,1)
10009bdc:	40                   	inc    %eax
10009bdd:	eb e9                	jmp    0x10009bc8
10009bdf:	33 c0                	xor    %eax,%eax
10009be1:	89 45 dc             	mov    %eax,-0x24(%ebp)
10009be4:	3d 00 01 00 00       	cmp    $0x100,%eax
10009be9:	7d 10                	jge    0x10009bfb
10009beb:	8a 88 c0 01 01 10    	mov    0x100101c0(%eax),%cl
10009bf1:	88 8c 30 1d 01 00 00 	mov    %cl,0x11d(%eax,%esi,1)
10009bf8:	40                   	inc    %eax
10009bf9:	eb e6                	jmp    0x10009be1
10009bfb:	89 35 84 00 01 10    	mov    %esi,0x10010084
10009c01:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
10009c05:	75 14                	jne    0x10009c1b
10009c07:	3b 35 84 00 01 10    	cmp    0x10010084,%esi
10009c0d:	74 0c                	je     0x10009c1b
10009c0f:	56                   	push   %esi
10009c10:	e8 ac cd ff ff       	call   0x100069c1
10009c15:	59                   	pop    %ecx
10009c16:	eb 03                	jmp    0x10009c1b
10009c18:	89 7d e4             	mov    %edi,-0x1c(%ebp)
10009c1b:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
10009c1f:	e8 09 00 00 00       	call   0x10009c2d
10009c24:	8b 45 e4             	mov    -0x1c(%ebp),%eax
10009c27:	e8 c3 e1 ff ff       	call   0x10007def
10009c2c:	c3                   	ret
10009c2d:	6a 0d                	push   $0xd
10009c2f:	e8 a2 db ff ff       	call   0x100077d6
10009c34:	59                   	pop    %ecx
10009c35:	c3                   	ret
10009c36:	83 3d 0c 04 01 10 00 	cmpl   $0x0,0x1001040c
10009c3d:	75 12                	jne    0x10009c51
10009c3f:	6a fd                	push   $0xfffffffd
10009c41:	e8 a0 fe ff ff       	call   0x10009ae6
10009c46:	59                   	pop    %ecx
10009c47:	c7 05 0c 04 01 10 01 	movl   $0x1,0x1001040c
10009c4e:	00 00 00 
10009c51:	33 c0                	xor    %eax,%eax
10009c53:	c3                   	ret
10009c54:	ff 74 24 04          	push   0x4(%esp)
10009c58:	ff 15 d8 c0 00 10    	call   *0x1000c0d8  ; 0x1000c0d8=KERNEL32.dll!InitializeCriticalSection
10009c5e:	33 c0                	xor    %eax,%eax
10009c60:	40                   	inc    %eax
10009c61:	c2 08 00             	ret    $0x8
10009c64:	6a 10                	push   $0x10
10009c66:	68 80 cb 00 10       	push   $0x1000cb80
10009c6b:	e8 44 e1 ff ff       	call   0x10007db4
10009c70:	a1 00 ff 00 10       	mov    0x1000ff00,%eax
10009c75:	85 c0                	test   %eax,%eax
10009c77:	75 37                	jne    0x10009cb0
10009c79:	83 3d a4 fd 00 10 01 	cmpl   $0x1,0x1000fda4
10009c80:	74 24                	je     0x10009ca6
10009c82:	68 6c cb 00 10       	push   $0x1000cb6c  ; 0x1000cb6c='kernel32.dll'
10009c87:	ff 15 74 c0 00 10    	call   *0x1000c074  ; 0x1000c074=KERNEL32.dll!GetModuleHandleA
10009c8d:	85 c0                	test   %eax,%eax
10009c8f:	74 15                	je     0x10009ca6
10009c91:	68 44 cb 00 10       	push   $0x1000cb44  ; 0x1000cb44='InitializeCriticalSectionAndSpinCount'
10009c96:	50                   	push   %eax
10009c97:	ff 15 70 c0 00 10    	call   *0x1000c070  ; 0x1000c070=KERNEL32.dll!GetProcAddress
10009c9d:	a3 00 ff 00 10       	mov    %eax,0x1000ff00
10009ca2:	85 c0                	test   %eax,%eax
10009ca4:	75 0a                	jne    0x10009cb0
10009ca6:	b8 54 9c 00 10       	mov    $0x10009c54,%eax
10009cab:	a3 00 ff 00 10       	mov    %eax,0x1000ff00
10009cb0:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
10009cb4:	ff 75 0c             	push   0xc(%ebp)
10009cb7:	ff 75 08             	push   0x8(%ebp)
10009cba:	ff d0                	call   *%eax
10009cbc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
10009cbf:	eb 24                	jmp    0x10009ce5
10009cc1:	8b 45 ec             	mov    -0x14(%ebp),%eax
10009cc4:	8b 00                	mov    (%eax),%eax
10009cc6:	8b 00                	mov    (%eax),%eax
10009cc8:	89 45 e0             	mov    %eax,-0x20(%ebp)
10009ccb:	33 c0                	xor    %eax,%eax
10009ccd:	40                   	inc    %eax
10009cce:	c3                   	ret
10009ccf:	8b 65 e8             	mov    -0x18(%ebp),%esp
10009cd2:	81 7d e0 17 00 00 c0 	cmpl   $0xc0000017,-0x20(%ebp)
10009cd9:	75 08                	jne    0x10009ce3
10009cdb:	6a 08                	push   $0x8
10009cdd:	ff 15 44 c0 00 10    	call   *0x1000c044  ; 0x1000c044=KERNEL32.dll!SetLastError
10009ce3:	33 c0                	xor    %eax,%eax
10009ce5:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
10009ce9:	e8 01 e1 ff ff       	call   0x10007def
10009cee:	c3                   	ret
10009cef:	e8 a2 d6 ff ff       	call   0x10007396
10009cf4:	83 c0 08             	add    $0x8,%eax
10009cf7:	c3                   	ret
10009cf8:	6a 1c                	push   $0x1c
10009cfa:	68 90 cb 00 10       	push   $0x1000cb90
10009cff:	e8 b0 e0 ff ff       	call   0x10007db4
10009d04:	33 f6                	xor    %esi,%esi
10009d06:	39 35 04 ff 00 10    	cmp    %esi,0x1000ff04
10009d0c:	75 35                	jne    0x10009d43
10009d0e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
10009d11:	50                   	push   %eax
10009d12:	33 ff                	xor    %edi,%edi
10009d14:	47                   	inc    %edi
10009d15:	57                   	push   %edi
10009d16:	68 8c cb 00 10       	push   $0x1000cb8c
10009d1b:	57                   	push   %edi
10009d1c:	ff 15 e4 c0 00 10    	call   *0x1000c0e4  ; 0x1000c0e4=KERNEL32.dll!GetStringTypeW
10009d22:	85 c0                	test   %eax,%eax
10009d24:	74 08                	je     0x10009d2e
10009d26:	89 3d 04 ff 00 10    	mov    %edi,0x1000ff04
10009d2c:	eb 15                	jmp    0x10009d43
10009d2e:	ff 15 4c c0 00 10    	call   *0x1000c04c  ; 0x1000c04c=KERNEL32.dll!GetLastError
10009d34:	83 f8 78             	cmp    $0x78,%eax
10009d37:	75 0a                	jne    0x10009d43
10009d39:	c7 05 04 ff 00 10 02 	movl   $0x2,0x1000ff04
10009d40:	00 00 00 
10009d43:	a1 04 ff 00 10       	mov    0x1000ff04,%eax
10009d48:	83 f8 02             	cmp    $0x2,%eax
10009d4b:	0f 84 ea 00 00 00    	je     0x10009e3b
10009d51:	3b c6                	cmp    %esi,%eax
10009d53:	0f 84 e2 00 00 00    	je     0x10009e3b
10009d59:	83 f8 01             	cmp    $0x1,%eax
10009d5c:	0f 85 ff 00 00 00    	jne    0x10009e61
10009d62:	89 75 e0             	mov    %esi,-0x20(%ebp)
10009d65:	89 75 dc             	mov    %esi,-0x24(%ebp)
10009d68:	39 75 18             	cmp    %esi,0x18(%ebp)
10009d6b:	75 08                	jne    0x10009d75
10009d6d:	a1 50 ff 00 10       	mov    0x1000ff50,%eax
10009d72:	89 45 18             	mov    %eax,0x18(%ebp)
10009d75:	56                   	push   %esi
10009d76:	56                   	push   %esi
10009d77:	ff 75 10             	push   0x10(%ebp)
10009d7a:	ff 75 0c             	push   0xc(%ebp)
10009d7d:	33 c0                	xor    %eax,%eax
10009d7f:	39 75 20             	cmp    %esi,0x20(%ebp)
10009d82:	0f 95 c0             	setne  %al
10009d85:	8d 04 c5 01 00 00 00 	lea    0x1(,%eax,8),%eax
10009d8c:	50                   	push   %eax
10009d8d:	ff 75 18             	push   0x18(%ebp)
10009d90:	ff 15 e0 c0 00 10    	call   *0x1000c0e0  ; 0x1000c0e0=KERNEL32.dll!MultiByteToWideChar
10009d96:	8b f8                	mov    %eax,%edi
10009d98:	89 7d d8             	mov    %edi,-0x28(%ebp)
10009d9b:	85 ff                	test   %edi,%edi
10009d9d:	0f 84 be 00 00 00    	je     0x10009e61
10009da3:	83 65 fc 00          	andl   $0x0,-0x4(%ebp)
10009da7:	8d 1c 3f             	lea    (%edi,%edi,1),%ebx
10009daa:	8b c3                	mov    %ebx,%eax
10009dac:	83 c0 03             	add    $0x3,%eax
10009daf:	83 e0 fc             	and    $0xfffffffc,%eax
10009db2:	e8 c9 c3 ff ff       	call   0x10006180
10009db7:	89 65 e8             	mov    %esp,-0x18(%ebp)
10009dba:	8b f4                	mov    %esp,%esi
10009dbc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
10009dbf:	53                   	push   %ebx
10009dc0:	6a 00                	push   $0x0
10009dc2:	56                   	push   %esi
10009dc3:	e8 38 05 00 00       	call   0x1000a300
10009dc8:	83 c4 0c             	add    $0xc,%esp
10009dcb:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
10009dcf:	eb 15                	jmp    0x10009de6
10009dd1:	33 c0                	xor    %eax,%eax
10009dd3:	40                   	inc    %eax
10009dd4:	c3                   	ret
10009dd5:	8b 65 e8             	mov    -0x18(%ebp),%esp
10009dd8:	e8 1a 10 00 00       	call   0x1000adf7
10009ddd:	33 f6                	xor    %esi,%esi
10009ddf:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
10009de3:	8b 7d d8             	mov    -0x28(%ebp),%edi
10009de6:	85 f6                	test   %esi,%esi
10009de8:	75 17                	jne    0x10009e01
10009dea:	57                   	push   %edi
10009deb:	6a 02                	push   $0x2
10009ded:	e8 a8 e1 ff ff       	call   0x10007f9a
10009df2:	59                   	pop    %ecx
10009df3:	59                   	pop    %ecx
10009df4:	8b f0                	mov    %eax,%esi
10009df6:	85 f6                	test   %esi,%esi
10009df8:	74 67                	je     0x10009e61
10009dfa:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
10009e01:	57                   	push   %edi
10009e02:	56                   	push   %esi
10009e03:	ff 75 10             	push   0x10(%ebp)
10009e06:	ff 75 0c             	push   0xc(%ebp)
10009e09:	6a 01                	push   $0x1
10009e0b:	ff 75 18             	push   0x18(%ebp)
10009e0e:	ff 15 e0 c0 00 10    	call   *0x1000c0e0  ; 0x1000c0e0=KERNEL32.dll!MultiByteToWideChar
10009e14:	85 c0                	test   %eax,%eax
10009e16:	74 11                	je     0x10009e29
10009e18:	ff 75 14             	push   0x14(%ebp)
10009e1b:	50                   	push   %eax
10009e1c:	56                   	push   %esi
10009e1d:	ff 75 08             	push   0x8(%ebp)
10009e20:	ff 15 e4 c0 00 10    	call   *0x1000c0e4  ; 0x1000c0e4=KERNEL32.dll!GetStringTypeW
10009e26:	89 45 e0             	mov    %eax,-0x20(%ebp)
10009e29:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
10009e2d:	74 07                	je     0x10009e36
10009e2f:	56                   	push   %esi
10009e30:	e8 8c cb ff ff       	call   0x100069c1
10009e35:	59                   	pop    %ecx
10009e36:	8b 45 e0             	mov    -0x20(%ebp),%eax
10009e39:	eb 6e                	jmp    0x10009ea9
10009e3b:	8b 5d 1c             	mov    0x1c(%ebp),%ebx
10009e3e:	3b de                	cmp    %esi,%ebx
10009e40:	75 06                	jne    0x10009e48
10009e42:	8b 1d 40 ff 00 10    	mov    0x1000ff40,%ebx
10009e48:	8b 7d 18             	mov    0x18(%ebp),%edi
10009e4b:	85 ff                	test   %edi,%edi
10009e4d:	75 06                	jne    0x10009e55
10009e4f:	8b 3d 50 ff 00 10    	mov    0x1000ff50,%edi
10009e55:	53                   	push   %ebx
10009e56:	e8 84 0d 00 00       	call   0x1000abdf
10009e5b:	59                   	pop    %ecx
10009e5c:	83 f8 ff             	cmp    $0xffffffff,%eax
10009e5f:	75 04                	jne    0x10009e65
10009e61:	33 c0                	xor    %eax,%eax
10009e63:	eb 44                	jmp    0x10009ea9
10009e65:	3b c7                	cmp    %edi,%eax
10009e67:	74 1e                	je     0x10009e87
10009e69:	6a 00                	push   $0x0
10009e6b:	6a 00                	push   $0x0
10009e6d:	8d 4d 10             	lea    0x10(%ebp),%ecx
10009e70:	51                   	push   %ecx
10009e71:	ff 75 0c             	push   0xc(%ebp)
10009e74:	50                   	push   %eax
10009e75:	57                   	push   %edi
10009e76:	e8 ad 0d 00 00       	call   0x1000ac28
10009e7b:	83 c4 18             	add    $0x18,%esp
10009e7e:	8b f0                	mov    %eax,%esi
10009e80:	85 f6                	test   %esi,%esi
10009e82:	74 dd                	je     0x10009e61
10009e84:	89 75 0c             	mov    %esi,0xc(%ebp)
10009e87:	ff 75 14             	push   0x14(%ebp)
10009e8a:	ff 75 10             	push   0x10(%ebp)
10009e8d:	ff 75 0c             	push   0xc(%ebp)
10009e90:	ff 75 08             	push   0x8(%ebp)
10009e93:	53                   	push   %ebx
10009e94:	ff 15 dc c0 00 10    	call   *0x1000c0dc  ; 0x1000c0dc=KERNEL32.dll!GetStringTypeA
10009e9a:	8b f8                	mov    %eax,%edi
10009e9c:	85 f6                	test   %esi,%esi
10009e9e:	74 07                	je     0x10009ea7
10009ea0:	56                   	push   %esi
10009ea1:	e8 1b cb ff ff       	call   0x100069c1
10009ea6:	59                   	pop    %ecx
10009ea7:	8b c7                	mov    %edi,%eax
10009ea9:	8d 65 c8             	lea    -0x38(%ebp),%esp
10009eac:	e8 3e df ff ff       	call   0x10007def
10009eb1:	c3                   	ret
10009eb2:	56                   	push   %esi
10009eb3:	8b 74 24 08          	mov    0x8(%esp),%esi
10009eb7:	85 f6                	test   %esi,%esi
10009eb9:	0f 84 81 01 00 00    	je     0x1000a040
10009ebf:	ff 76 04             	push   0x4(%esi)
10009ec2:	e8 fa ca ff ff       	call   0x100069c1
10009ec7:	ff 76 08             	push   0x8(%esi)
10009eca:	e8 f2 ca ff ff       	call   0x100069c1
10009ecf:	ff 76 0c             	push   0xc(%esi)
10009ed2:	e8 ea ca ff ff       	call   0x100069c1
10009ed7:	ff 76 10             	push   0x10(%esi)
10009eda:	e8 e2 ca ff ff       	call   0x100069c1
10009edf:	ff 76 14             	push   0x14(%esi)
10009ee2:	e8 da ca ff ff       	call   0x100069c1
10009ee7:	ff 76 18             	push   0x18(%esi)
10009eea:	e8 d2 ca ff ff       	call   0x100069c1
10009eef:	ff 36                	push   (%esi)
10009ef1:	e8 cb ca ff ff       	call   0x100069c1
10009ef6:	ff 76 20             	push   0x20(%esi)
10009ef9:	e8 c3 ca ff ff       	call   0x100069c1
10009efe:	ff 76 24             	push   0x24(%esi)
10009f01:	e8 bb ca ff ff       	call   0x100069c1
10009f06:	ff 76 28             	push   0x28(%esi)
10009f09:	e8 b3 ca ff ff       	call   0x100069c1
10009f0e:	ff 76 2c             	push   0x2c(%esi)
10009f11:	e8 ab ca ff ff       	call   0x100069c1
10009f16:	ff 76 30             	push   0x30(%esi)
10009f19:	e8 a3 ca ff ff       	call   0x100069c1
10009f1e:	ff 76 34             	push   0x34(%esi)
10009f21:	e8 9b ca ff ff       	call   0x100069c1
10009f26:	ff 76 1c             	push   0x1c(%esi)
10009f29:	e8 93 ca ff ff       	call   0x100069c1
10009f2e:	ff 76 38             	push   0x38(%esi)
10009f31:	e8 8b ca ff ff       	call   0x100069c1
10009f36:	ff 76 3c             	push   0x3c(%esi)
10009f39:	e8 83 ca ff ff       	call   0x100069c1
10009f3e:	83 c4 40             	add    $0x40,%esp
10009f41:	ff 76 40             	push   0x40(%esi)
10009f44:	e8 78 ca ff ff       	call   0x100069c1
10009f49:	ff 76 44             	push   0x44(%esi)
10009f4c:	e8 70 ca ff ff       	call   0x100069c1
10009f51:	ff 76 48             	push   0x48(%esi)
10009f54:	e8 68 ca ff ff       	call   0x100069c1
10009f59:	ff 76 4c             	push   0x4c(%esi)
10009f5c:	e8 60 ca ff ff       	call   0x100069c1
10009f61:	ff 76 50             	push   0x50(%esi)
10009f64:	e8 58 ca ff ff       	call   0x100069c1
10009f69:	ff 76 54             	push   0x54(%esi)
10009f6c:	e8 50 ca ff ff       	call   0x100069c1
10009f71:	ff 76 58             	push   0x58(%esi)
10009f74:	e8 48 ca ff ff       	call   0x100069c1
10009f79:	ff 76 5c             	push   0x5c(%esi)
10009f7c:	e8 40 ca ff ff       	call   0x100069c1
10009f81:	ff 76 60             	push   0x60(%esi)
10009f84:	e8 38 ca ff ff       	call   0x100069c1
10009f89:	ff 76 64             	push   0x64(%esi)
10009f8c:	e8 30 ca ff ff       	call   0x100069c1
10009f91:	ff 76 68             	push   0x68(%esi)
10009f94:	e8 28 ca ff ff       	call   0x100069c1
10009f99:	ff 76 6c             	push   0x6c(%esi)
10009f9c:	e8 20 ca ff ff       	call   0x100069c1
10009fa1:	ff 76 70             	push   0x70(%esi)
10009fa4:	e8 18 ca ff ff       	call   0x100069c1
10009fa9:	ff 76 74             	push   0x74(%esi)
10009fac:	e8 10 ca ff ff       	call   0x100069c1
10009fb1:	ff 76 78             	push   0x78(%esi)
10009fb4:	e8 08 ca ff ff       	call   0x100069c1
10009fb9:	ff 76 7c             	push   0x7c(%esi)
10009fbc:	e8 00 ca ff ff       	call   0x100069c1
10009fc1:	83 c4 40             	add    $0x40,%esp
10009fc4:	ff b6 80 00 00 00    	push   0x80(%esi)
10009fca:	e8 f2 c9 ff ff       	call   0x100069c1
10009fcf:	ff b6 84 00 00 00    	push   0x84(%esi)
10009fd5:	e8 e7 c9 ff ff       	call   0x100069c1
10009fda:	ff b6 88 00 00 00    	push   0x88(%esi)
10009fe0:	e8 dc c9 ff ff       	call   0x100069c1
10009fe5:	ff b6 8c 00 00 00    	push   0x8c(%esi)
10009feb:	e8 d1 c9 ff ff       	call   0x100069c1
10009ff0:	ff b6 90 00 00 00    	push   0x90(%esi)
10009ff6:	e8 c6 c9 ff ff       	call   0x100069c1
10009ffb:	ff b6 94 00 00 00    	push   0x94(%esi)
1000a001:	e8 bb c9 ff ff       	call   0x100069c1
1000a006:	ff b6 98 00 00 00    	push   0x98(%esi)
1000a00c:	e8 b0 c9 ff ff       	call   0x100069c1
1000a011:	ff b6 9c 00 00 00    	push   0x9c(%esi)
1000a017:	e8 a5 c9 ff ff       	call   0x100069c1
1000a01c:	ff b6 a0 00 00 00    	push   0xa0(%esi)
1000a022:	e8 9a c9 ff ff       	call   0x100069c1
1000a027:	ff b6 a4 00 00 00    	push   0xa4(%esi)
1000a02d:	e8 8f c9 ff ff       	call   0x100069c1
1000a032:	ff b6 a8 00 00 00    	push   0xa8(%esi)
1000a038:	e8 84 c9 ff ff       	call   0x100069c1
1000a03d:	83 c4 2c             	add    $0x2c,%esp
1000a040:	5e                   	pop    %esi
1000a041:	c3                   	ret
1000a042:	56                   	push   %esi
1000a043:	8b 74 24 08          	mov    0x8(%esp),%esi
1000a047:	85 f6                	test   %esi,%esi
1000a049:	74 54                	je     0x1000a09f
1000a04b:	8b 06                	mov    (%esi),%eax
1000a04d:	8b 0d bc f8 00 10    	mov    0x1000f8bc,%ecx
1000a053:	3b 01                	cmp    (%ecx),%eax
1000a055:	74 0f                	je     0x1000a066
1000a057:	3b 05 8c f8 00 10    	cmp    0x1000f88c,%eax
1000a05d:	74 07                	je     0x1000a066
1000a05f:	50                   	push   %eax
1000a060:	e8 5c c9 ff ff       	call   0x100069c1
1000a065:	59                   	pop    %ecx
1000a066:	8b 46 04             	mov    0x4(%esi),%eax
1000a069:	8b 0d bc f8 00 10    	mov    0x1000f8bc,%ecx
1000a06f:	3b 41 04             	cmp    0x4(%ecx),%eax
1000a072:	74 0f                	je     0x1000a083
1000a074:	3b 05 90 f8 00 10    	cmp    0x1000f890,%eax
1000a07a:	74 07                	je     0x1000a083
1000a07c:	50                   	push   %eax
1000a07d:	e8 3f c9 ff ff       	call   0x100069c1
1000a082:	59                   	pop    %ecx
1000a083:	8b 76 08             	mov    0x8(%esi),%esi
1000a086:	a1 bc f8 00 10       	mov    0x1000f8bc,%eax
1000a08b:	3b 70 08             	cmp    0x8(%eax),%esi
1000a08e:	74 0f                	je     0x1000a09f
1000a090:	3b 35 94 f8 00 10    	cmp    0x1000f894,%esi
1000a096:	74 07                	je     0x1000a09f
1000a098:	56                   	push   %esi
1000a099:	e8 23 c9 ff ff       	call   0x100069c1
1000a09e:	59                   	pop    %ecx
1000a09f:	5e                   	pop    %esi
1000a0a0:	c3                   	ret
1000a0a1:	56                   	push   %esi
1000a0a2:	8b 74 24 08          	mov    0x8(%esp),%esi
1000a0a6:	85 f6                	test   %esi,%esi
1000a0a8:	0f 84 ca 00 00 00    	je     0x1000a178
1000a0ae:	8b 46 0c             	mov    0xc(%esi),%eax
1000a0b1:	8b 0d bc f8 00 10    	mov    0x1000f8bc,%ecx
1000a0b7:	3b 41 0c             	cmp    0xc(%ecx),%eax
1000a0ba:	74 0f                	je     0x1000a0cb
1000a0bc:	3b 05 98 f8 00 10    	cmp    0x1000f898,%eax
1000a0c2:	74 07                	je     0x1000a0cb
1000a0c4:	50                   	push   %eax
1000a0c5:	e8 f7 c8 ff ff       	call   0x100069c1
1000a0ca:	59                   	pop    %ecx
1000a0cb:	8b 46 10             	mov    0x10(%esi),%eax
1000a0ce:	8b 0d bc f8 00 10    	mov    0x1000f8bc,%ecx
1000a0d4:	3b 41 10             	cmp    0x10(%ecx),%eax
1000a0d7:	74 0f                	je     0x1000a0e8
1000a0d9:	3b 05 9c f8 00 10    	cmp    0x1000f89c,%eax
1000a0df:	74 07                	je     0x1000a0e8
1000a0e1:	50                   	push   %eax
1000a0e2:	e8 da c8 ff ff       	call   0x100069c1
1000a0e7:	59                   	pop    %ecx
1000a0e8:	8b 46 14             	mov    0x14(%esi),%eax
1000a0eb:	8b 0d bc f8 00 10    	mov    0x1000f8bc,%ecx
1000a0f1:	3b 41 14             	cmp    0x14(%ecx),%eax
1000a0f4:	74 0f                	je     0x1000a105
1000a0f6:	3b 05 a0 f8 00 10    	cmp    0x1000f8a0,%eax
1000a0fc:	74 07                	je     0x1000a105
1000a0fe:	50                   	push   %eax
1000a0ff:	e8 bd c8 ff ff       	call   0x100069c1
1000a104:	59                   	pop    %ecx
1000a105:	8b 46 18             	mov    0x18(%esi),%eax
1000a108:	8b 0d bc f8 00 10    	mov    0x1000f8bc,%ecx
1000a10e:	3b 41 18             	cmp    0x18(%ecx),%eax
1000a111:	74 0f                	je     0x1000a122
1000a113:	3b 05 a4 f8 00 10    	cmp    0x1000f8a4,%eax
1000a119:	74 07                	je     0x1000a122
1000a11b:	50                   	push   %eax
1000a11c:	e8 a0 c8 ff ff       	call   0x100069c1
1000a121:	59                   	pop    %ecx
1000a122:	8b 46 1c             	mov    0x1c(%esi),%eax
1000a125:	8b 0d bc f8 00 10    	mov    0x1000f8bc,%ecx
1000a12b:	3b 41 1c             	cmp    0x1c(%ecx),%eax
1000a12e:	74 0f                	je     0x1000a13f
1000a130:	3b 05 a8 f8 00 10    	cmp    0x1000f8a8,%eax
1000a136:	74 07                	je     0x1000a13f
1000a138:	50                   	push   %eax
1000a139:	e8 83 c8 ff ff       	call   0x100069c1
1000a13e:	59                   	pop    %ecx
1000a13f:	8b 46 20             	mov    0x20(%esi),%eax
1000a142:	8b 0d bc f8 00 10    	mov    0x1000f8bc,%ecx
1000a148:	3b 41 20             	cmp    0x20(%ecx),%eax
1000a14b:	74 0f                	je     0x1000a15c
1000a14d:	3b 05 ac f8 00 10    	cmp    0x1000f8ac,%eax
1000a153:	74 07                	je     0x1000a15c
1000a155:	50                   	push   %eax
1000a156:	e8 66 c8 ff ff       	call   0x100069c1
1000a15b:	59                   	pop    %ecx
1000a15c:	8b 76 24             	mov    0x24(%esi),%esi
1000a15f:	a1 bc f8 00 10       	mov    0x1000f8bc,%eax
1000a164:	3b 70 24             	cmp    0x24(%eax),%esi
1000a167:	74 0f                	je     0x1000a178
1000a169:	3b 35 b0 f8 00 10    	cmp    0x1000f8b0,%esi
1000a16f:	74 07                	je     0x1000a178
1000a171:	56                   	push   %esi
1000a172:	e8 4a c8 ff ff       	call   0x100069c1
1000a177:	59                   	pop    %ecx
1000a178:	5e                   	pop    %esi
1000a179:	c3                   	ret
1000a17a:	cc                   	int3
1000a17b:	cc                   	int3
1000a17c:	cc                   	int3
1000a17d:	cc                   	int3
1000a17e:	cc                   	int3
1000a17f:	cc                   	int3
1000a180:	55                   	push   %ebp
1000a181:	8b ec                	mov    %esp,%ebp
1000a183:	56                   	push   %esi
1000a184:	33 c0                	xor    %eax,%eax
1000a186:	50                   	push   %eax
1000a187:	50                   	push   %eax
1000a188:	50                   	push   %eax
1000a189:	50                   	push   %eax
1000a18a:	50                   	push   %eax
1000a18b:	50                   	push   %eax
1000a18c:	50                   	push   %eax
1000a18d:	50                   	push   %eax
1000a18e:	8b 55 0c             	mov    0xc(%ebp),%edx
1000a191:	8d 49 00             	lea    0x0(%ecx),%ecx
1000a194:	8a 02                	mov    (%edx),%al
1000a196:	0a c0                	or     %al,%al
1000a198:	74 09                	je     0x1000a1a3
1000a19a:	83 c2 01             	add    $0x1,%edx
1000a19d:	0f ab 04 24          	bts    %eax,(%esp)
1000a1a1:	eb f1                	jmp    0x1000a194
1000a1a3:	8b 75 08             	mov    0x8(%ebp),%esi
1000a1a6:	83 c9 ff             	or     $0xffffffff,%ecx
1000a1a9:	8d 49 00             	lea    0x0(%ecx),%ecx
1000a1ac:	83 c1 01             	add    $0x1,%ecx
1000a1af:	8a 06                	mov    (%esi),%al
1000a1b1:	0a c0                	or     %al,%al
1000a1b3:	74 09                	je     0x1000a1be
1000a1b5:	83 c6 01             	add    $0x1,%esi
1000a1b8:	0f a3 04 24          	bt     %eax,(%esp)
1000a1bc:	73 ee                	jae    0x1000a1ac
1000a1be:	8b c1                	mov    %ecx,%eax
1000a1c0:	83 c4 20             	add    $0x20,%esp
1000a1c3:	5e                   	pop    %esi
1000a1c4:	c9                   	leave
1000a1c5:	c3                   	ret
1000a1c6:	cc                   	int3
1000a1c7:	cc                   	int3
1000a1c8:	cc                   	int3
1000a1c9:	cc                   	int3
1000a1ca:	cc                   	int3
1000a1cb:	cc                   	int3
1000a1cc:	cc                   	int3
1000a1cd:	cc                   	int3
1000a1ce:	cc                   	int3
1000a1cf:	cc                   	int3
1000a1d0:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
1000a1d4:	57                   	push   %edi
1000a1d5:	85 c9                	test   %ecx,%ecx
1000a1d7:	0f 84 92 00 00 00    	je     0x1000a26f
1000a1dd:	56                   	push   %esi
1000a1de:	53                   	push   %ebx
1000a1df:	8b d9                	mov    %ecx,%ebx
1000a1e1:	8b 74 24 14          	mov    0x14(%esp),%esi
1000a1e5:	f7 c6 03 00 00 00    	test   $0x3,%esi
1000a1eb:	8b 7c 24 10          	mov    0x10(%esp),%edi
1000a1ef:	75 0b                	jne    0x1000a1fc
1000a1f1:	c1 e9 02             	shr    $0x2,%ecx
1000a1f4:	0f 85 85 00 00 00    	jne    0x1000a27f
1000a1fa:	eb 27                	jmp    0x1000a223
1000a1fc:	8a 06                	mov    (%esi),%al
1000a1fe:	83 c6 01             	add    $0x1,%esi
1000a201:	88 07                	mov    %al,(%edi)
1000a203:	83 c7 01             	add    $0x1,%edi
1000a206:	83 e9 01             	sub    $0x1,%ecx
1000a209:	74 2b                	je     0x1000a236
1000a20b:	84 c0                	test   %al,%al
1000a20d:	74 2f                	je     0x1000a23e
1000a20f:	f7 c6 03 00 00 00    	test   $0x3,%esi
1000a215:	75 e5                	jne    0x1000a1fc
1000a217:	8b d9                	mov    %ecx,%ebx
1000a219:	c1 e9 02             	shr    $0x2,%ecx
1000a21c:	75 61                	jne    0x1000a27f
1000a21e:	83 e3 03             	and    $0x3,%ebx
1000a221:	74 13                	je     0x1000a236
1000a223:	8a 06                	mov    (%esi),%al
1000a225:	83 c6 01             	add    $0x1,%esi
1000a228:	88 07                	mov    %al,(%edi)
1000a22a:	83 c7 01             	add    $0x1,%edi
1000a22d:	84 c0                	test   %al,%al
1000a22f:	74 37                	je     0x1000a268
1000a231:	83 eb 01             	sub    $0x1,%ebx
1000a234:	75 ed                	jne    0x1000a223
1000a236:	8b 44 24 10          	mov    0x10(%esp),%eax
1000a23a:	5b                   	pop    %ebx
1000a23b:	5e                   	pop    %esi
1000a23c:	5f                   	pop    %edi
1000a23d:	c3                   	ret
1000a23e:	f7 c7 03 00 00 00    	test   $0x3,%edi
1000a244:	74 16                	je     0x1000a25c
1000a246:	88 07                	mov    %al,(%edi)
1000a248:	83 c7 01             	add    $0x1,%edi
1000a24b:	83 e9 01             	sub    $0x1,%ecx
1000a24e:	0f 84 98 00 00 00    	je     0x1000a2ec
1000a254:	f7 c7 03 00 00 00    	test   $0x3,%edi
1000a25a:	75 ea                	jne    0x1000a246
1000a25c:	8b d9                	mov    %ecx,%ebx
1000a25e:	c1 e9 02             	shr    $0x2,%ecx
1000a261:	75 74                	jne    0x1000a2d7
1000a263:	88 07                	mov    %al,(%edi)
1000a265:	83 c7 01             	add    $0x1,%edi
1000a268:	83 eb 01             	sub    $0x1,%ebx
1000a26b:	75 f6                	jne    0x1000a263
1000a26d:	5b                   	pop    %ebx
1000a26e:	5e                   	pop    %esi
1000a26f:	8b 44 24 08          	mov    0x8(%esp),%eax
1000a273:	5f                   	pop    %edi
1000a274:	c3                   	ret
1000a275:	89 17                	mov    %edx,(%edi)
1000a277:	83 c7 04             	add    $0x4,%edi
1000a27a:	83 e9 01             	sub    $0x1,%ecx
1000a27d:	74 9f                	je     0x1000a21e
1000a27f:	ba ff fe fe 7e       	mov    $0x7efefeff,%edx
1000a284:	8b 06                	mov    (%esi),%eax
1000a286:	03 d0                	add    %eax,%edx
1000a288:	83 f0 ff             	xor    $0xffffffff,%eax
1000a28b:	33 c2                	xor    %edx,%eax
1000a28d:	8b 16                	mov    (%esi),%edx
1000a28f:	83 c6 04             	add    $0x4,%esi
1000a292:	a9 00 01 01 81       	test   $0x81010100,%eax
1000a297:	74 dc                	je     0x1000a275
1000a299:	84 d2                	test   %dl,%dl
1000a29b:	74 2c                	je     0x1000a2c9
1000a29d:	84 f6                	test   %dh,%dh
1000a29f:	74 1e                	je     0x1000a2bf
1000a2a1:	f7 c2 00 00 ff 00    	test   $0xff0000,%edx
1000a2a7:	74 0c                	je     0x1000a2b5
1000a2a9:	f7 c2 00 00 00 ff    	test   $0xff000000,%edx
1000a2af:	75 c4                	jne    0x1000a275
1000a2b1:	89 17                	mov    %edx,(%edi)
1000a2b3:	eb 18                	jmp    0x1000a2cd
1000a2b5:	81 e2 ff ff 00 00    	and    $0xffff,%edx
1000a2bb:	89 17                	mov    %edx,(%edi)
1000a2bd:	eb 0e                	jmp    0x1000a2cd
1000a2bf:	81 e2 ff 00 00 00    	and    $0xff,%edx
1000a2c5:	89 17                	mov    %edx,(%edi)
1000a2c7:	eb 04                	jmp    0x1000a2cd
1000a2c9:	33 d2                	xor    %edx,%edx
1000a2cb:	89 17                	mov    %edx,(%edi)
1000a2cd:	83 c7 04             	add    $0x4,%edi
1000a2d0:	33 c0                	xor    %eax,%eax
1000a2d2:	83 e9 01             	sub    $0x1,%ecx
1000a2d5:	74 0c                	je     0x1000a2e3
1000a2d7:	33 c0                	xor    %eax,%eax
1000a2d9:	89 07                	mov    %eax,(%edi)
1000a2db:	83 c7 04             	add    $0x4,%edi
1000a2de:	83 e9 01             	sub    $0x1,%ecx
1000a2e1:	75 f6                	jne    0x1000a2d9
1000a2e3:	83 e3 03             	and    $0x3,%ebx
1000a2e6:	0f 85 77 ff ff ff    	jne    0x1000a263
1000a2ec:	8b 44 24 10          	mov    0x10(%esp),%eax
1000a2f0:	5b                   	pop    %ebx
1000a2f1:	5e                   	pop    %esi
1000a2f2:	5f                   	pop    %edi
1000a2f3:	c3                   	ret
1000a2f4:	cc                   	int3
1000a2f5:	cc                   	int3
1000a2f6:	cc                   	int3
1000a2f7:	cc                   	int3
1000a2f8:	cc                   	int3
1000a2f9:	cc                   	int3
1000a2fa:	cc                   	int3
1000a2fb:	cc                   	int3
1000a2fc:	cc                   	int3
1000a2fd:	cc                   	int3
1000a2fe:	cc                   	int3
1000a2ff:	cc                   	int3
1000a300:	8b 54 24 0c          	mov    0xc(%esp),%edx
1000a304:	8b 4c 24 04          	mov    0x4(%esp),%ecx
1000a308:	85 d2                	test   %edx,%edx
1000a30a:	74 4f                	je     0x1000a35b
1000a30c:	33 c0                	xor    %eax,%eax
1000a30e:	8a 44 24 08          	mov    0x8(%esp),%al
1000a312:	57                   	push   %edi
1000a313:	8b f9                	mov    %ecx,%edi
1000a315:	83 fa 04             	cmp    $0x4,%edx
1000a318:	72 31                	jb     0x1000a34b
1000a31a:	f7 d9                	neg    %ecx
1000a31c:	83 e1 03             	and    $0x3,%ecx
1000a31f:	74 0c                	je     0x1000a32d
1000a321:	2b d1                	sub    %ecx,%edx
1000a323:	88 07                	mov    %al,(%edi)
1000a325:	83 c7 01             	add    $0x1,%edi
1000a328:	83 e9 01             	sub    $0x1,%ecx
1000a32b:	75 f6                	jne    0x1000a323
1000a32d:	8b c8                	mov    %eax,%ecx
1000a32f:	c1 e0 08             	shl    $0x8,%eax
1000a332:	03 c1                	add    %ecx,%eax
1000a334:	8b c8                	mov    %eax,%ecx
1000a336:	c1 e0 10             	shl    $0x10,%eax
1000a339:	03 c1                	add    %ecx,%eax
1000a33b:	8b ca                	mov    %edx,%ecx
1000a33d:	83 e2 03             	and    $0x3,%edx
1000a340:	c1 e9 02             	shr    $0x2,%ecx
1000a343:	74 06                	je     0x1000a34b
1000a345:	f3 ab                	rep stos %eax,%es:(%edi)
1000a347:	85 d2                	test   %edx,%edx
1000a349:	74 0a                	je     0x1000a355
1000a34b:	88 07                	mov    %al,(%edi)
1000a34d:	83 c7 01             	add    $0x1,%edi
1000a350:	83 ea 01             	sub    $0x1,%edx
1000a353:	75 f6                	jne    0x1000a34b
1000a355:	8b 44 24 08          	mov    0x8(%esp),%eax
1000a359:	5f                   	pop    %edi
1000a35a:	c3                   	ret
1000a35b:	8b 44 24 04          	mov    0x4(%esp),%eax
1000a35f:	c3                   	ret
1000a360:	8b 44 24 0c          	mov    0xc(%esp),%eax
1000a364:	85 c0                	test   %eax,%eax
1000a366:	74 4a                	je     0x1000a3b2
1000a368:	8b 54 24 04          	mov    0x4(%esp),%edx
1000a36c:	56                   	push   %esi
1000a36d:	57                   	push   %edi
1000a36e:	8b f2                	mov    %edx,%esi
1000a370:	8b 7c 24 10          	mov    0x10(%esp),%edi
1000a374:	0b d7                	or     %edi,%edx
1000a376:	83 e2 03             	and    $0x3,%edx
1000a379:	74 38                	je     0x1000a3b3
1000a37b:	a9 01 00 00 00       	test   $0x1,%eax
1000a380:	74 11                	je     0x1000a393
1000a382:	8a 0e                	mov    (%esi),%cl
1000a384:	3a 0f                	cmp    (%edi),%cl
1000a386:	75 58                	jne    0x1000a3e0
1000a388:	83 c6 01             	add    $0x1,%esi
1000a38b:	83 c7 01             	add    $0x1,%edi
1000a38e:	83 e8 01             	sub    $0x1,%eax
1000a391:	74 1d                	je     0x1000a3b0
1000a393:	8a 0e                	mov    (%esi),%cl
1000a395:	8a 17                	mov    (%edi),%dl
1000a397:	38 d1                	cmp    %dl,%cl
1000a399:	75 45                	jne    0x1000a3e0
1000a39b:	8a 4e 01             	mov    0x1(%esi),%cl
1000a39e:	8a 57 01             	mov    0x1(%edi),%dl
1000a3a1:	38 d1                	cmp    %dl,%cl
1000a3a3:	75 3b                	jne    0x1000a3e0
1000a3a5:	83 c7 02             	add    $0x2,%edi
1000a3a8:	83 c6 02             	add    $0x2,%esi
1000a3ab:	83 e8 02             	sub    $0x2,%eax
1000a3ae:	75 e3                	jne    0x1000a393
1000a3b0:	5f                   	pop    %edi
1000a3b1:	5e                   	pop    %esi
1000a3b2:	c3                   	ret
1000a3b3:	8b c8                	mov    %eax,%ecx
1000a3b5:	83 e0 03             	and    $0x3,%eax
1000a3b8:	c1 e9 02             	shr    $0x2,%ecx
1000a3bb:	74 2b                	je     0x1000a3e8
1000a3bd:	f3 a7                	repz cmpsl %es:(%edi),%ds:(%esi)
1000a3bf:	74 27                	je     0x1000a3e8
1000a3c1:	8b 4e fc             	mov    -0x4(%esi),%ecx
1000a3c4:	8b 57 fc             	mov    -0x4(%edi),%edx
1000a3c7:	38 d1                	cmp    %dl,%cl
1000a3c9:	75 10                	jne    0x1000a3db
1000a3cb:	38 f5                	cmp    %dh,%ch
1000a3cd:	75 0c                	jne    0x1000a3db
1000a3cf:	c1 e9 10             	shr    $0x10,%ecx
1000a3d2:	c1 ea 10             	shr    $0x10,%edx
1000a3d5:	38 d1                	cmp    %dl,%cl
1000a3d7:	75 02                	jne    0x1000a3db
1000a3d9:	38 f5                	cmp    %dh,%ch
1000a3db:	b8 00 00 00 00       	mov    $0x0,%eax
1000a3e0:	1b c0                	sbb    %eax,%eax
1000a3e2:	5f                   	pop    %edi
1000a3e3:	83 d8 ff             	sbb    $0xffffffff,%eax
1000a3e6:	5e                   	pop    %esi
1000a3e7:	c3                   	ret
1000a3e8:	85 c0                	test   %eax,%eax
1000a3ea:	74 c4                	je     0x1000a3b0
1000a3ec:	8b 16                	mov    (%esi),%edx
1000a3ee:	8b 0f                	mov    (%edi),%ecx
1000a3f0:	38 ca                	cmp    %cl,%dl
1000a3f2:	75 e7                	jne    0x1000a3db
1000a3f4:	83 e8 01             	sub    $0x1,%eax
1000a3f7:	74 1c                	je     0x1000a415
1000a3f9:	38 ee                	cmp    %ch,%dh
1000a3fb:	75 de                	jne    0x1000a3db
1000a3fd:	83 e8 01             	sub    $0x1,%eax
1000a400:	74 13                	je     0x1000a415
1000a402:	81 e1 00 00 ff 00    	and    $0xff0000,%ecx
1000a408:	81 e2 00 00 ff 00    	and    $0xff0000,%edx
1000a40e:	3b d1                	cmp    %ecx,%edx
1000a410:	75 c9                	jne    0x1000a3db
1000a412:	83 e8 01             	sub    $0x1,%eax
1000a415:	5f                   	pop    %edi
1000a416:	5e                   	pop    %esi
1000a417:	c3                   	ret
1000a418:	cc                   	int3
1000a419:	cc                   	int3
1000a41a:	cc                   	int3
1000a41b:	cc                   	int3
1000a41c:	cc                   	int3
1000a41d:	cc                   	int3
1000a41e:	cc                   	int3
1000a41f:	cc                   	int3
1000a420:	55                   	push   %ebp
1000a421:	8b ec                	mov    %esp,%ebp
1000a423:	57                   	push   %edi
1000a424:	56                   	push   %esi
1000a425:	53                   	push   %ebx
1000a426:	8b 4d 10             	mov    0x10(%ebp),%ecx
1000a429:	e3 27                	jecxz  0x1000a452
1000a42b:	8b d9                	mov    %ecx,%ebx
1000a42d:	8b 7d 08             	mov    0x8(%ebp),%edi
1000a430:	8b f7                	mov    %edi,%esi
1000a432:	33 c0                	xor    %eax,%eax
1000a434:	f2 ae                	repnz scas %es:(%edi),%al
1000a436:	f7 d9                	neg    %ecx
1000a438:	03 cb                	add    %ebx,%ecx
1000a43a:	8b fe                	mov    %esi,%edi
1000a43c:	8b 75 0c             	mov    0xc(%ebp),%esi
1000a43f:	f3 a6                	repz cmpsb %es:(%edi),%ds:(%esi)
1000a441:	8a 46 ff             	mov    -0x1(%esi),%al
1000a444:	33 c9                	xor    %ecx,%ecx
1000a446:	3a 47 ff             	cmp    -0x1(%edi),%al
1000a449:	77 05                	ja     0x1000a450
1000a44b:	74 05                	je     0x1000a452
1000a44d:	83 e9 02             	sub    $0x2,%ecx
1000a450:	f7 d1                	not    %ecx
1000a452:	8b c1                	mov    %ecx,%eax
1000a454:	5b                   	pop    %ebx
1000a455:	5e                   	pop    %esi
1000a456:	5f                   	pop    %edi
1000a457:	c9                   	leave
1000a458:	c3                   	ret
1000a459:	cc                   	int3
1000a45a:	cc                   	int3
1000a45b:	cc                   	int3
1000a45c:	cc                   	int3
1000a45d:	cc                   	int3
1000a45e:	cc                   	int3
1000a45f:	cc                   	int3
1000a460:	55                   	push   %ebp
1000a461:	8b ec                	mov    %esp,%ebp
1000a463:	56                   	push   %esi
1000a464:	33 c0                	xor    %eax,%eax
1000a466:	50                   	push   %eax
1000a467:	50                   	push   %eax
1000a468:	50                   	push   %eax
1000a469:	50                   	push   %eax
1000a46a:	50                   	push   %eax
1000a46b:	50                   	push   %eax
1000a46c:	50                   	push   %eax
1000a46d:	50                   	push   %eax
1000a46e:	8b 55 0c             	mov    0xc(%ebp),%edx
1000a471:	8d 49 00             	lea    0x0(%ecx),%ecx
1000a474:	8a 02                	mov    (%edx),%al
1000a476:	0a c0                	or     %al,%al
1000a478:	74 09                	je     0x1000a483
1000a47a:	83 c2 01             	add    $0x1,%edx
1000a47d:	0f ab 04 24          	bts    %eax,(%esp)
1000a481:	eb f1                	jmp    0x1000a474
1000a483:	8b 75 08             	mov    0x8(%ebp),%esi
1000a486:	8b ff                	mov    %edi,%edi
1000a488:	8a 06                	mov    (%esi),%al
1000a48a:	0a c0                	or     %al,%al
1000a48c:	74 0c                	je     0x1000a49a
1000a48e:	83 c6 01             	add    $0x1,%esi
1000a491:	0f a3 04 24          	bt     %eax,(%esp)
1000a495:	73 f1                	jae    0x1000a488
1000a497:	8d 46 ff             	lea    -0x1(%esi),%eax
1000a49a:	83 c4 20             	add    $0x20,%esp
1000a49d:	5e                   	pop    %esi
1000a49e:	c9                   	leave
1000a49f:	c3                   	ret
1000a4a0:	55                   	push   %ebp
1000a4a1:	8b ec                	mov    %esp,%ebp
1000a4a3:	83 ec 10             	sub    $0x10,%esp
1000a4a6:	53                   	push   %ebx
1000a4a7:	33 db                	xor    %ebx,%ebx
1000a4a9:	39 1d 7c ff 00 10    	cmp    %ebx,0x1000ff7c
1000a4af:	56                   	push   %esi
1000a4b0:	57                   	push   %edi
1000a4b1:	75 6d                	jne    0x1000a520
1000a4b3:	68 38 d1 00 10       	push   $0x1000d138  ; 0x1000d138='user32.dll'
1000a4b8:	ff 15 ec c0 00 10    	call   *0x1000c0ec  ; 0x1000c0ec=KERNEL32.dll!LoadLibraryA
1000a4be:	8b f8                	mov    %eax,%edi
1000a4c0:	3b fb                	cmp    %ebx,%edi
1000a4c2:	0f 84 93 00 00 00    	je     0x1000a55b
1000a4c8:	8b 35 70 c0 00 10    	mov    0x1000c070,%esi  ; 0x1000c070=KERNEL32.dll!GetProcAddress
1000a4ce:	68 2c d1 00 10       	push   $0x1000d12c  ; 0x1000d12c='MessageBoxA'
1000a4d3:	57                   	push   %edi
1000a4d4:	ff d6                	call   *%esi
1000a4d6:	85 c0                	test   %eax,%eax
1000a4d8:	a3 7c ff 00 10       	mov    %eax,0x1000ff7c
1000a4dd:	74 7c                	je     0x1000a55b
1000a4df:	68 1c d1 00 10       	push   $0x1000d11c  ; 0x1000d11c='GetActiveWindow'
1000a4e4:	57                   	push   %edi
1000a4e5:	ff d6                	call   *%esi
1000a4e7:	68 08 d1 00 10       	push   $0x1000d108  ; 0x1000d108='GetLastActivePopup'
1000a4ec:	57                   	push   %edi
1000a4ed:	a3 80 ff 00 10       	mov    %eax,0x1000ff80
1000a4f2:	ff d6                	call   *%esi
1000a4f4:	83 3d a4 fd 00 10 02 	cmpl   $0x2,0x1000fda4
1000a4fb:	a3 84 ff 00 10       	mov    %eax,0x1000ff84
1000a500:	75 1e                	jne    0x1000a520
1000a502:	68 ec d0 00 10       	push   $0x1000d0ec  ; 0x1000d0ec='GetUserObjectInformationA'
1000a507:	57                   	push   %edi
1000a508:	ff d6                	call   *%esi
1000a50a:	85 c0                	test   %eax,%eax
1000a50c:	a3 8c ff 00 10       	mov    %eax,0x1000ff8c
1000a511:	74 0d                	je     0x1000a520
1000a513:	68 d4 d0 00 10       	push   $0x1000d0d4  ; 0x1000d0d4='GetProcessWindowStation'
1000a518:	57                   	push   %edi
1000a519:	ff d6                	call   *%esi
1000a51b:	a3 88 ff 00 10       	mov    %eax,0x1000ff88
1000a520:	a1 88 ff 00 10       	mov    0x1000ff88,%eax
1000a525:	85 c0                	test   %eax,%eax
1000a527:	74 3c                	je     0x1000a565
1000a529:	ff d0                	call   *%eax
1000a52b:	85 c0                	test   %eax,%eax
1000a52d:	74 1d                	je     0x1000a54c
1000a52f:	8d 4d fc             	lea    -0x4(%ebp),%ecx
1000a532:	51                   	push   %ecx
1000a533:	6a 0c                	push   $0xc
1000a535:	8d 4d f0             	lea    -0x10(%ebp),%ecx
1000a538:	51                   	push   %ecx
1000a539:	6a 01                	push   $0x1
1000a53b:	50                   	push   %eax
1000a53c:	ff 15 8c ff 00 10    	call   *0x1000ff8c
1000a542:	85 c0                	test   %eax,%eax
1000a544:	74 06                	je     0x1000a54c
1000a546:	f6 45 f8 01          	testb  $0x1,-0x8(%ebp)
1000a54a:	75 19                	jne    0x1000a565
1000a54c:	83 3d b0 fd 00 10 04 	cmpl   $0x4,0x1000fdb0
1000a553:	72 0a                	jb     0x1000a55f
1000a555:	80 4d 12 20          	orb    $0x20,0x12(%ebp)
1000a559:	eb 29                	jmp    0x1000a584
1000a55b:	33 c0                	xor    %eax,%eax
1000a55d:	eb 35                	jmp    0x1000a594
1000a55f:	80 4d 12 04          	orb    $0x4,0x12(%ebp)
1000a563:	eb 1f                	jmp    0x1000a584
1000a565:	a1 80 ff 00 10       	mov    0x1000ff80,%eax
1000a56a:	85 c0                	test   %eax,%eax
1000a56c:	74 16                	je     0x1000a584
1000a56e:	ff d0                	call   *%eax
1000a570:	8b d8                	mov    %eax,%ebx
1000a572:	85 db                	test   %ebx,%ebx
1000a574:	74 0e                	je     0x1000a584
1000a576:	a1 84 ff 00 10       	mov    0x1000ff84,%eax
1000a57b:	85 c0                	test   %eax,%eax
1000a57d:	74 05                	je     0x1000a584
1000a57f:	53                   	push   %ebx
1000a580:	ff d0                	call   *%eax
1000a582:	8b d8                	mov    %eax,%ebx
1000a584:	ff 75 10             	push   0x10(%ebp)
1000a587:	ff 75 0c             	push   0xc(%ebp)
1000a58a:	ff 75 08             	push   0x8(%ebp)
1000a58d:	53                   	push   %ebx
1000a58e:	ff 15 7c ff 00 10    	call   *0x1000ff7c
1000a594:	5f                   	pop    %edi
1000a595:	5e                   	pop    %esi
1000a596:	5b                   	pop    %ebx
1000a597:	c9                   	leave
1000a598:	c3                   	ret
1000a599:	cc                   	int3
1000a59a:	cc                   	int3
1000a59b:	cc                   	int3
1000a59c:	56                   	push   %esi
1000a59d:	43                   	inc    %ebx
1000a59e:	32 30                	xor    (%eax),%dh
1000a5a0:	58                   	pop    %eax
1000a5a1:	43                   	inc    %ebx
1000a5a2:	30 30                	xor    %dh,(%eax)
1000a5a4:	55                   	push   %ebp
1000a5a5:	8b ec                	mov    %esp,%ebp
1000a5a7:	83 ec 08             	sub    $0x8,%esp
1000a5aa:	53                   	push   %ebx
1000a5ab:	56                   	push   %esi
1000a5ac:	57                   	push   %edi
1000a5ad:	55                   	push   %ebp
1000a5ae:	fc                   	cld
1000a5af:	8b 5d 0c             	mov    0xc(%ebp),%ebx
1000a5b2:	8b 45 08             	mov    0x8(%ebp),%eax
1000a5b5:	f7 40 04 06 00 00 00 	testl  $0x6,0x4(%eax)
1000a5bc:	0f 85 82 00 00 00    	jne    0x1000a644
1000a5c2:	89 45 f8             	mov    %eax,-0x8(%ebp)
1000a5c5:	8b 45 10             	mov    0x10(%ebp),%eax
1000a5c8:	89 45 fc             	mov    %eax,-0x4(%ebp)
1000a5cb:	8d 45 f8             	lea    -0x8(%ebp),%eax
1000a5ce:	89 43 fc             	mov    %eax,-0x4(%ebx)
1000a5d1:	8b 73 0c             	mov    0xc(%ebx),%esi
1000a5d4:	8b 7b 08             	mov    0x8(%ebx),%edi
1000a5d7:	83 fe ff             	cmp    $0xffffffff,%esi
1000a5da:	74 61                	je     0x1000a63d
1000a5dc:	8d 0c 76             	lea    (%esi,%esi,2),%ecx
1000a5df:	83 7c 8f 04 00       	cmpl   $0x0,0x4(%edi,%ecx,4)
1000a5e4:	74 45                	je     0x1000a62b
1000a5e6:	56                   	push   %esi
1000a5e7:	55                   	push   %ebp
1000a5e8:	8d 6b 10             	lea    0x10(%ebx),%ebp
1000a5eb:	ff 54 8f 04          	call   *0x4(%edi,%ecx,4)
1000a5ef:	5d                   	pop    %ebp
1000a5f0:	5e                   	pop    %esi
1000a5f1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
1000a5f4:	0b c0                	or     %eax,%eax
1000a5f6:	74 33                	je     0x1000a62b
1000a5f8:	78 3c                	js     0x1000a636
1000a5fa:	8b 7b 08             	mov    0x8(%ebx),%edi
1000a5fd:	53                   	push   %ebx
1000a5fe:	e8 7d b7 ff ff       	call   0x10005d80
1000a603:	83 c4 04             	add    $0x4,%esp
1000a606:	8d 6b 10             	lea    0x10(%ebx),%ebp
1000a609:	56                   	push   %esi
1000a60a:	53                   	push   %ebx
1000a60b:	e8 b2 b7 ff ff       	call   0x10005dc2
1000a610:	83 c4 08             	add    $0x8,%esp
1000a613:	8d 0c 76             	lea    (%esi,%esi,2),%ecx
1000a616:	6a 01                	push   $0x1
1000a618:	8b 44 8f 08          	mov    0x8(%edi,%ecx,4),%eax
1000a61c:	e8 35 b8 ff ff       	call   0x10005e56
1000a621:	8b 04 8f             	mov    (%edi,%ecx,4),%eax
1000a624:	89 43 0c             	mov    %eax,0xc(%ebx)
1000a627:	ff 54 8f 08          	call   *0x8(%edi,%ecx,4)
1000a62b:	8b 7b 08             	mov    0x8(%ebx),%edi
1000a62e:	8d 0c 76             	lea    (%esi,%esi,2),%ecx
1000a631:	8b 34 8f             	mov    (%edi,%ecx,4),%esi
1000a634:	eb a1                	jmp    0x1000a5d7
1000a636:	b8 00 00 00 00       	mov    $0x0,%eax
1000a63b:	eb 1c                	jmp    0x1000a659
1000a63d:	b8 01 00 00 00       	mov    $0x1,%eax
1000a642:	eb 15                	jmp    0x1000a659
1000a644:	55                   	push   %ebp
1000a645:	8d 6b 10             	lea    0x10(%ebx),%ebp
1000a648:	6a ff                	push   $0xffffffff
1000a64a:	53                   	push   %ebx
1000a64b:	e8 72 b7 ff ff       	call   0x10005dc2
1000a650:	83 c4 08             	add    $0x8,%esp
1000a653:	5d                   	pop    %ebp
1000a654:	b8 01 00 00 00       	mov    $0x1,%eax
1000a659:	5d                   	pop    %ebp
1000a65a:	5f                   	pop    %edi
1000a65b:	5e                   	pop    %esi
1000a65c:	5b                   	pop    %ebx
1000a65d:	8b e5                	mov    %ebp,%esp
1000a65f:	5d                   	pop    %ebp
1000a660:	c3                   	ret
1000a661:	55                   	push   %ebp
1000a662:	8b 4c 24 08          	mov    0x8(%esp),%ecx
1000a666:	8b 29                	mov    (%ecx),%ebp
1000a668:	8b 41 1c             	mov    0x1c(%ecx),%eax
1000a66b:	50                   	push   %eax
1000a66c:	8b 41 18             	mov    0x18(%ecx),%eax
1000a66f:	50                   	push   %eax
1000a670:	e8 4d b7 ff ff       	call   0x10005dc2
1000a675:	83 c4 08             	add    $0x8,%esp
1000a678:	5d                   	pop    %ebp
1000a679:	c2 04 00             	ret    $0x4
1000a67c:	8b 0d 5c f5 00 10    	mov    0x1000f55c,%ecx
1000a682:	8b c2                	mov    %edx,%eax
1000a684:	57                   	push   %edi
1000a685:	39 70 04             	cmp    %esi,0x4(%eax)
1000a688:	74 0d                	je     0x1000a697
1000a68a:	8d 3c 49             	lea    (%ecx,%ecx,2),%edi
1000a68d:	83 c0 0c             	add    $0xc,%eax
1000a690:	8d 3c ba             	lea    (%edx,%edi,4),%edi
1000a693:	3b c7                	cmp    %edi,%eax
1000a695:	72 ee                	jb     0x1000a685
1000a697:	8d 0c 49             	lea    (%ecx,%ecx,2),%ecx
1000a69a:	8d 0c 8a             	lea    (%edx,%ecx,4),%ecx
1000a69d:	3b c1                	cmp    %ecx,%eax
1000a69f:	5f                   	pop    %edi
1000a6a0:	73 05                	jae    0x1000a6a7
1000a6a2:	39 70 04             	cmp    %esi,0x4(%eax)
1000a6a5:	74 02                	je     0x1000a6a9
1000a6a7:	33 c0                	xor    %eax,%eax
1000a6a9:	c3                   	ret
1000a6aa:	6a 20                	push   $0x20
1000a6ac:	68 48 d1 00 10       	push   $0x1000d148
1000a6b1:	e8 fe d6 ff ff       	call   0x10007db4
1000a6b6:	33 c9                	xor    %ecx,%ecx
1000a6b8:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
1000a6bb:	8b 45 08             	mov    0x8(%ebp),%eax
1000a6be:	48                   	dec    %eax
1000a6bf:	48                   	dec    %eax
1000a6c0:	74 6a                	je     0x1000a72c
1000a6c2:	48                   	dec    %eax
1000a6c3:	48                   	dec    %eax
1000a6c4:	74 46                	je     0x1000a70c
1000a6c6:	83 e8 04             	sub    $0x4,%eax
1000a6c9:	74 41                	je     0x1000a70c
1000a6cb:	83 e8 03             	sub    $0x3,%eax
1000a6ce:	74 3c                	je     0x1000a70c
1000a6d0:	83 e8 04             	sub    $0x4,%eax
1000a6d3:	74 2a                	je     0x1000a6ff
1000a6d5:	83 e8 06             	sub    $0x6,%eax
1000a6d8:	74 18                	je     0x1000a6f2
1000a6da:	48                   	dec    %eax
1000a6db:	74 08                	je     0x1000a6e5
1000a6dd:	83 c8 ff             	or     $0xffffffff,%eax
1000a6e0:	e9 38 01 00 00       	jmp    0x1000a81d
1000a6e5:	be 98 ff 00 10       	mov    $0x1000ff98,%esi
1000a6ea:	8b 3d 98 ff 00 10    	mov    0x1000ff98,%edi
1000a6f0:	eb 45                	jmp    0x1000a737
1000a6f2:	be 94 ff 00 10       	mov    $0x1000ff94,%esi
1000a6f7:	8b 3d 94 ff 00 10    	mov    0x1000ff94,%edi
1000a6fd:	eb 38                	jmp    0x1000a737
1000a6ff:	be 9c ff 00 10       	mov    $0x1000ff9c,%esi
1000a704:	8b 3d 9c ff 00 10    	mov    0x1000ff9c,%edi
1000a70a:	eb 2b                	jmp    0x1000a737
1000a70c:	e8 85 cc ff ff       	call   0x10007396
1000a711:	8b d8                	mov    %eax,%ebx
1000a713:	89 5d dc             	mov    %ebx,-0x24(%ebp)
1000a716:	8b 53 54             	mov    0x54(%ebx),%edx
1000a719:	8b 75 08             	mov    0x8(%ebp),%esi
1000a71c:	e8 5b ff ff ff       	call   0x1000a67c
1000a721:	8b f0                	mov    %eax,%esi
1000a723:	83 c6 08             	add    $0x8,%esi
1000a726:	8b 3e                	mov    (%esi),%edi
1000a728:	33 c9                	xor    %ecx,%ecx
1000a72a:	eb 15                	jmp    0x1000a741
1000a72c:	be 90 ff 00 10       	mov    $0x1000ff90,%esi
1000a731:	8b 3d 90 ff 00 10    	mov    0x1000ff90,%edi
1000a737:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
1000a73e:	8b 5d dc             	mov    -0x24(%ebp),%ebx
1000a741:	89 7d e0             	mov    %edi,-0x20(%ebp)
1000a744:	83 ff 01             	cmp    $0x1,%edi
1000a747:	0f 84 ce 00 00 00    	je     0x1000a81b
1000a74d:	3b f9                	cmp    %ecx,%edi
1000a74f:	75 07                	jne    0x1000a758
1000a751:	6a 03                	push   $0x3
1000a753:	e8 22 d8 ff ff       	call   0x10007f7a
1000a758:	39 4d e4             	cmp    %ecx,-0x1c(%ebp)
1000a75b:	74 09                	je     0x1000a766
1000a75d:	51                   	push   %ecx
1000a75e:	e8 07 d1 ff ff       	call   0x1000786a
1000a763:	59                   	pop    %ecx
1000a764:	33 c9                	xor    %ecx,%ecx
1000a766:	89 4d fc             	mov    %ecx,-0x4(%ebp)
1000a769:	8b 45 08             	mov    0x8(%ebp),%eax
1000a76c:	83 f8 08             	cmp    $0x8,%eax
1000a76f:	74 0a                	je     0x1000a77b
1000a771:	83 f8 0b             	cmp    $0xb,%eax
1000a774:	74 05                	je     0x1000a77b
1000a776:	83 f8 04             	cmp    $0x4,%eax
1000a779:	75 1b                	jne    0x1000a796
1000a77b:	8b 53 58             	mov    0x58(%ebx),%edx
1000a77e:	89 55 d8             	mov    %edx,-0x28(%ebp)
1000a781:	89 4b 58             	mov    %ecx,0x58(%ebx)
1000a784:	83 f8 08             	cmp    $0x8,%eax
1000a787:	75 39                	jne    0x1000a7c2
1000a789:	8b 53 5c             	mov    0x5c(%ebx),%edx
1000a78c:	89 55 d4             	mov    %edx,-0x2c(%ebp)
1000a78f:	c7 43 5c 8c 00 00 00 	movl   $0x8c,0x5c(%ebx)
1000a796:	83 f8 08             	cmp    $0x8,%eax
1000a799:	75 27                	jne    0x1000a7c2
1000a79b:	a1 50 f5 00 10       	mov    0x1000f550,%eax
1000a7a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
1000a7a3:	8b 15 54 f5 00 10    	mov    0x1000f554,%edx
1000a7a9:	8b 35 50 f5 00 10    	mov    0x1000f550,%esi
1000a7af:	03 d6                	add    %esi,%edx
1000a7b1:	3b c2                	cmp    %edx,%eax
1000a7b3:	7d 0f                	jge    0x1000a7c4
1000a7b5:	8d 14 40             	lea    (%eax,%eax,2),%edx
1000a7b8:	8b 73 54             	mov    0x54(%ebx),%esi
1000a7bb:	89 4c 96 08          	mov    %ecx,0x8(%esi,%edx,4)
1000a7bf:	40                   	inc    %eax
1000a7c0:	eb de                	jmp    0x1000a7a0
1000a7c2:	89 0e                	mov    %ecx,(%esi)
1000a7c4:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
1000a7c8:	e8 18 00 00 00       	call   0x1000a7e5
1000a7cd:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
1000a7d1:	75 1f                	jne    0x1000a7f2
1000a7d3:	ff 73 5c             	push   0x5c(%ebx)
1000a7d6:	6a 08                	push   $0x8
1000a7d8:	ff d7                	call   *%edi
1000a7da:	59                   	pop    %ecx
1000a7db:	eb 1a                	jmp    0x1000a7f7
1000a7dd:	8b 7d e0             	mov    -0x20(%ebp),%edi
1000a7e0:	8b 5d dc             	mov    -0x24(%ebp),%ebx
1000a7e3:	33 c9                	xor    %ecx,%ecx
1000a7e5:	39 4d e4             	cmp    %ecx,-0x1c(%ebp)
1000a7e8:	74 07                	je     0x1000a7f1
1000a7ea:	51                   	push   %ecx
1000a7eb:	e8 e6 cf ff ff       	call   0x100077d6
1000a7f0:	59                   	pop    %ecx
1000a7f1:	c3                   	ret
1000a7f2:	ff 75 08             	push   0x8(%ebp)
1000a7f5:	ff d7                	call   *%edi
1000a7f7:	59                   	pop    %ecx
1000a7f8:	8b 45 08             	mov    0x8(%ebp),%eax
1000a7fb:	83 f8 08             	cmp    $0x8,%eax
1000a7fe:	74 0a                	je     0x1000a80a
1000a800:	83 f8 0b             	cmp    $0xb,%eax
1000a803:	74 05                	je     0x1000a80a
1000a805:	83 f8 04             	cmp    $0x4,%eax
1000a808:	75 11                	jne    0x1000a81b
1000a80a:	8b 4d d8             	mov    -0x28(%ebp),%ecx
1000a80d:	89 4b 58             	mov    %ecx,0x58(%ebx)
1000a810:	83 f8 08             	cmp    $0x8,%eax
1000a813:	75 06                	jne    0x1000a81b
1000a815:	8b 45 d4             	mov    -0x2c(%ebp),%eax
1000a818:	89 43 5c             	mov    %eax,0x5c(%ebx)
1000a81b:	33 c0                	xor    %eax,%eax
1000a81d:	e8 cd d5 ff ff       	call   0x10007def
1000a822:	c3                   	ret
1000a823:	6a 38                	push   $0x38
1000a825:	68 58 d1 00 10       	push   $0x1000d158
1000a82a:	e8 85 d5 ff ff       	call   0x10007db4
1000a82f:	33 db                	xor    %ebx,%ebx
1000a831:	39 1d a4 ff 00 10    	cmp    %ebx,0x1000ffa4
1000a837:	75 38                	jne    0x1000a871
1000a839:	53                   	push   %ebx
1000a83a:	53                   	push   %ebx
1000a83b:	33 f6                	xor    %esi,%esi
1000a83d:	46                   	inc    %esi
1000a83e:	56                   	push   %esi
1000a83f:	68 8c cb 00 10       	push   $0x1000cb8c
1000a844:	68 00 01 00 00       	push   $0x100
1000a849:	53                   	push   %ebx
1000a84a:	ff 15 f4 c0 00 10    	call   *0x1000c0f4  ; 0x1000c0f4=KERNEL32.dll!LCMapStringW
1000a850:	85 c0                	test   %eax,%eax
1000a852:	74 08                	je     0x1000a85c
1000a854:	89 35 a4 ff 00 10    	mov    %esi,0x1000ffa4
1000a85a:	eb 15                	jmp    0x1000a871
1000a85c:	ff 15 4c c0 00 10    	call   *0x1000c04c  ; 0x1000c04c=KERNEL32.dll!GetLastError
1000a862:	83 f8 78             	cmp    $0x78,%eax
1000a865:	75 0a                	jne    0x1000a871
1000a867:	c7 05 a4 ff 00 10 02 	movl   $0x2,0x1000ffa4
1000a86e:	00 00 00 
1000a871:	39 5d 14             	cmp    %ebx,0x14(%ebp)
1000a874:	7e 1b                	jle    0x1000a891
1000a876:	8b 4d 14             	mov    0x14(%ebp),%ecx
1000a879:	8b 45 10             	mov    0x10(%ebp),%eax
1000a87c:	49                   	dec    %ecx
1000a87d:	38 18                	cmp    %bl,(%eax)
1000a87f:	74 08                	je     0x1000a889
1000a881:	40                   	inc    %eax
1000a882:	3b cb                	cmp    %ebx,%ecx
1000a884:	75 f6                	jne    0x1000a87c
1000a886:	83 c9 ff             	or     $0xffffffff,%ecx
1000a889:	83 c8 ff             	or     $0xffffffff,%eax
1000a88c:	2b c1                	sub    %ecx,%eax
1000a88e:	01 45 14             	add    %eax,0x14(%ebp)
1000a891:	a1 a4 ff 00 10       	mov    0x1000ffa4,%eax
1000a896:	83 f8 02             	cmp    $0x2,%eax
1000a899:	0f 84 dc 01 00 00    	je     0x1000aa7b
1000a89f:	3b c3                	cmp    %ebx,%eax
1000a8a1:	0f 84 d4 01 00 00    	je     0x1000aa7b
1000a8a7:	83 f8 01             	cmp    $0x1,%eax
1000a8aa:	0f 85 fe 01 00 00    	jne    0x1000aaae
1000a8b0:	33 ff                	xor    %edi,%edi
1000a8b2:	89 7d e4             	mov    %edi,-0x1c(%ebp)
1000a8b5:	89 5d e0             	mov    %ebx,-0x20(%ebp)
1000a8b8:	89 5d dc             	mov    %ebx,-0x24(%ebp)
1000a8bb:	39 5d 20             	cmp    %ebx,0x20(%ebp)
1000a8be:	75 08                	jne    0x1000a8c8
1000a8c0:	a1 50 ff 00 10       	mov    0x1000ff50,%eax
1000a8c5:	89 45 20             	mov    %eax,0x20(%ebp)
1000a8c8:	53                   	push   %ebx
1000a8c9:	53                   	push   %ebx
1000a8ca:	ff 75 14             	push   0x14(%ebp)
1000a8cd:	ff 75 10             	push   0x10(%ebp)
1000a8d0:	33 c0                	xor    %eax,%eax
1000a8d2:	39 5d 24             	cmp    %ebx,0x24(%ebp)
1000a8d5:	0f 95 c0             	setne  %al
1000a8d8:	8d 04 c5 01 00 00 00 	lea    0x1(,%eax,8),%eax
1000a8df:	50                   	push   %eax
1000a8e0:	ff 75 20             	push   0x20(%ebp)
1000a8e3:	ff 15 e0 c0 00 10    	call   *0x1000c0e0  ; 0x1000c0e0=KERNEL32.dll!MultiByteToWideChar
1000a8e9:	8b f0                	mov    %eax,%esi
1000a8eb:	89 75 d8             	mov    %esi,-0x28(%ebp)
1000a8ee:	3b f3                	cmp    %ebx,%esi
1000a8f0:	0f 84 b8 01 00 00    	je     0x1000aaae
1000a8f6:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
1000a8fd:	8d 04 36             	lea    (%esi,%esi,1),%eax
1000a900:	83 c0 03             	add    $0x3,%eax
1000a903:	83 e0 fc             	and    $0xfffffffc,%eax
1000a906:	e8 75 b8 ff ff       	call   0x10006180
1000a90b:	89 65 e8             	mov    %esp,-0x18(%ebp)
1000a90e:	8b c4                	mov    %esp,%eax
1000a910:	89 45 d4             	mov    %eax,-0x2c(%ebp)
1000a913:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
1000a917:	eb 1b                	jmp    0x1000a934
1000a919:	33 c0                	xor    %eax,%eax
1000a91b:	40                   	inc    %eax
1000a91c:	c3                   	ret
1000a91d:	8b 65 e8             	mov    -0x18(%ebp),%esp
1000a920:	e8 d2 04 00 00       	call   0x1000adf7
1000a925:	33 db                	xor    %ebx,%ebx
1000a927:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
1000a92a:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
1000a92e:	8b 7d e4             	mov    -0x1c(%ebp),%edi
1000a931:	8b 75 d8             	mov    -0x28(%ebp),%esi
1000a934:	39 5d d4             	cmp    %ebx,-0x2c(%ebp)
1000a937:	75 1c                	jne    0x1000a955
1000a939:	8d 04 36             	lea    (%esi,%esi,1),%eax
1000a93c:	50                   	push   %eax
1000a93d:	e8 70 bb ff ff       	call   0x100064b2
1000a942:	59                   	pop    %ecx
1000a943:	89 45 d4             	mov    %eax,-0x2c(%ebp)
1000a946:	3b c3                	cmp    %ebx,%eax
1000a948:	0f 84 60 01 00 00    	je     0x1000aaae
1000a94e:	c7 45 e0 01 00 00 00 	movl   $0x1,-0x20(%ebp)
1000a955:	56                   	push   %esi
1000a956:	ff 75 d4             	push   -0x2c(%ebp)
1000a959:	ff 75 14             	push   0x14(%ebp)
1000a95c:	ff 75 10             	push   0x10(%ebp)
1000a95f:	6a 01                	push   $0x1
1000a961:	ff 75 20             	push   0x20(%ebp)
1000a964:	ff 15 e0 c0 00 10    	call   *0x1000c0e0  ; 0x1000c0e0=KERNEL32.dll!MultiByteToWideChar
1000a96a:	85 c0                	test   %eax,%eax
1000a96c:	0f 84 e6 00 00 00    	je     0x1000aa58
1000a972:	53                   	push   %ebx
1000a973:	53                   	push   %ebx
1000a974:	56                   	push   %esi
1000a975:	ff 75 d4             	push   -0x2c(%ebp)
1000a978:	ff 75 0c             	push   0xc(%ebp)
1000a97b:	ff 75 08             	push   0x8(%ebp)
1000a97e:	ff 15 f4 c0 00 10    	call   *0x1000c0f4  ; 0x1000c0f4=KERNEL32.dll!LCMapStringW
1000a984:	8b f8                	mov    %eax,%edi
1000a986:	89 7d e4             	mov    %edi,-0x1c(%ebp)
1000a989:	3b fb                	cmp    %ebx,%edi
1000a98b:	0f 84 c7 00 00 00    	je     0x1000aa58
1000a991:	f6 45 0d 04          	testb  $0x4,0xd(%ebp)
1000a995:	74 2d                	je     0x1000a9c4
1000a997:	39 5d 1c             	cmp    %ebx,0x1c(%ebp)
1000a99a:	0f 84 b8 00 00 00    	je     0x1000aa58
1000a9a0:	3b 7d 1c             	cmp    0x1c(%ebp),%edi
1000a9a3:	0f 8f af 00 00 00    	jg     0x1000aa58
1000a9a9:	ff 75 1c             	push   0x1c(%ebp)
1000a9ac:	ff 75 18             	push   0x18(%ebp)
1000a9af:	56                   	push   %esi
1000a9b0:	ff 75 d4             	push   -0x2c(%ebp)
1000a9b3:	ff 75 0c             	push   0xc(%ebp)
1000a9b6:	ff 75 08             	push   0x8(%ebp)
1000a9b9:	ff 15 f4 c0 00 10    	call   *0x1000c0f4  ; 0x1000c0f4=KERNEL32.dll!LCMapStringW
1000a9bf:	e9 94 00 00 00       	jmp    0x1000aa58
1000a9c4:	c7 45 fc 02 00 00 00 	movl   $0x2,-0x4(%ebp)
1000a9cb:	8d 04 3f             	lea    (%edi,%edi,1),%eax
1000a9ce:	83 c0 03             	add    $0x3,%eax
1000a9d1:	83 e0 fc             	and    $0xfffffffc,%eax
1000a9d4:	e8 a7 b7 ff ff       	call   0x10006180
1000a9d9:	89 65 e8             	mov    %esp,-0x18(%ebp)
1000a9dc:	8b c4                	mov    %esp,%eax
1000a9de:	89 45 d0             	mov    %eax,-0x30(%ebp)
1000a9e1:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
1000a9e5:	eb 1b                	jmp    0x1000aa02
1000a9e7:	33 c0                	xor    %eax,%eax
1000a9e9:	40                   	inc    %eax
1000a9ea:	c3                   	ret
1000a9eb:	8b 65 e8             	mov    -0x18(%ebp),%esp
1000a9ee:	e8 04 04 00 00       	call   0x1000adf7
1000a9f3:	33 db                	xor    %ebx,%ebx
1000a9f5:	89 5d d0             	mov    %ebx,-0x30(%ebp)
1000a9f8:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
1000a9fc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
1000a9ff:	8b 75 d8             	mov    -0x28(%ebp),%esi
1000aa02:	39 5d d0             	cmp    %ebx,-0x30(%ebp)
1000aa05:	75 18                	jne    0x1000aa1f
1000aa07:	8d 04 3f             	lea    (%edi,%edi,1),%eax
1000aa0a:	50                   	push   %eax
1000aa0b:	e8 a2 ba ff ff       	call   0x100064b2
1000aa10:	59                   	pop    %ecx
1000aa11:	89 45 d0             	mov    %eax,-0x30(%ebp)
1000aa14:	3b c3                	cmp    %ebx,%eax
1000aa16:	74 40                	je     0x1000aa58
1000aa18:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
1000aa1f:	57                   	push   %edi
1000aa20:	ff 75 d0             	push   -0x30(%ebp)
1000aa23:	56                   	push   %esi
1000aa24:	ff 75 d4             	push   -0x2c(%ebp)
1000aa27:	ff 75 0c             	push   0xc(%ebp)
1000aa2a:	ff 75 08             	push   0x8(%ebp)
1000aa2d:	ff 15 f4 c0 00 10    	call   *0x1000c0f4  ; 0x1000c0f4=KERNEL32.dll!LCMapStringW
1000aa33:	85 c0                	test   %eax,%eax
1000aa35:	74 21                	je     0x1000aa58
1000aa37:	53                   	push   %ebx
1000aa38:	53                   	push   %ebx
1000aa39:	39 5d 1c             	cmp    %ebx,0x1c(%ebp)
1000aa3c:	75 04                	jne    0x1000aa42
1000aa3e:	53                   	push   %ebx
1000aa3f:	53                   	push   %ebx
1000aa40:	eb 06                	jmp    0x1000aa48
1000aa42:	ff 75 1c             	push   0x1c(%ebp)
1000aa45:	ff 75 18             	push   0x18(%ebp)
1000aa48:	57                   	push   %edi
1000aa49:	ff 75 d0             	push   -0x30(%ebp)
1000aa4c:	53                   	push   %ebx
1000aa4d:	ff 75 20             	push   0x20(%ebp)
1000aa50:	ff 15 9c c0 00 10    	call   *0x1000c09c  ; 0x1000c09c=KERNEL32.dll!WideCharToMultiByte
1000aa56:	8b f8                	mov    %eax,%edi
1000aa58:	39 5d dc             	cmp    %ebx,-0x24(%ebp)
1000aa5b:	74 09                	je     0x1000aa66
1000aa5d:	ff 75 d0             	push   -0x30(%ebp)
1000aa60:	e8 5c bf ff ff       	call   0x100069c1
1000aa65:	59                   	pop    %ecx
1000aa66:	39 5d e0             	cmp    %ebx,-0x20(%ebp)
1000aa69:	74 09                	je     0x1000aa74
1000aa6b:	ff 75 d4             	push   -0x2c(%ebp)
1000aa6e:	e8 4e bf ff ff       	call   0x100069c1
1000aa73:	59                   	pop    %ecx
1000aa74:	8b c7                	mov    %edi,%eax
1000aa76:	e9 5b 01 00 00       	jmp    0x1000abd6
1000aa7b:	89 5d cc             	mov    %ebx,-0x34(%ebp)
1000aa7e:	33 ff                	xor    %edi,%edi
1000aa80:	89 5d c8             	mov    %ebx,-0x38(%ebp)
1000aa83:	39 5d 08             	cmp    %ebx,0x8(%ebp)
1000aa86:	75 08                	jne    0x1000aa90
1000aa88:	a1 40 ff 00 10       	mov    0x1000ff40,%eax
1000aa8d:	89 45 08             	mov    %eax,0x8(%ebp)
1000aa90:	39 5d 20             	cmp    %ebx,0x20(%ebp)
1000aa93:	75 08                	jne    0x1000aa9d
1000aa95:	a1 50 ff 00 10       	mov    0x1000ff50,%eax
1000aa9a:	89 45 20             	mov    %eax,0x20(%ebp)
1000aa9d:	ff 75 08             	push   0x8(%ebp)
1000aaa0:	e8 3a 01 00 00       	call   0x1000abdf
1000aaa5:	59                   	pop    %ecx
1000aaa6:	89 45 c4             	mov    %eax,-0x3c(%ebp)
1000aaa9:	83 f8 ff             	cmp    $0xffffffff,%eax
1000aaac:	75 07                	jne    0x1000aab5
1000aaae:	33 c0                	xor    %eax,%eax
1000aab0:	e9 21 01 00 00       	jmp    0x1000abd6
1000aab5:	3b 45 20             	cmp    0x20(%ebp),%eax
1000aab8:	0f 84 ee 00 00 00    	je     0x1000abac
1000aabe:	53                   	push   %ebx
1000aabf:	53                   	push   %ebx
1000aac0:	8d 4d 14             	lea    0x14(%ebp),%ecx
1000aac3:	51                   	push   %ecx
1000aac4:	ff 75 10             	push   0x10(%ebp)
1000aac7:	50                   	push   %eax
1000aac8:	ff 75 20             	push   0x20(%ebp)
1000aacb:	e8 58 01 00 00       	call   0x1000ac28
1000aad0:	83 c4 18             	add    $0x18,%esp
1000aad3:	89 45 cc             	mov    %eax,-0x34(%ebp)
1000aad6:	3b c3                	cmp    %ebx,%eax
1000aad8:	74 d4                	je     0x1000aaae
1000aada:	53                   	push   %ebx
1000aadb:	53                   	push   %ebx
1000aadc:	ff 75 14             	push   0x14(%ebp)
1000aadf:	50                   	push   %eax
1000aae0:	ff 75 0c             	push   0xc(%ebp)
1000aae3:	ff 75 08             	push   0x8(%ebp)
1000aae6:	ff 15 f0 c0 00 10    	call   *0x1000c0f0  ; 0x1000c0f0=KERNEL32.dll!LCMapStringA
1000aaec:	8b f0                	mov    %eax,%esi
1000aaee:	89 75 c0             	mov    %esi,-0x40(%ebp)
1000aaf1:	3b f3                	cmp    %ebx,%esi
1000aaf3:	0f 84 a2 00 00 00    	je     0x1000ab9b
1000aaf9:	89 5d fc             	mov    %ebx,-0x4(%ebp)
1000aafc:	83 c0 03             	add    $0x3,%eax
1000aaff:	83 e0 fc             	and    $0xfffffffc,%eax
1000ab02:	e8 79 b6 ff ff       	call   0x10006180
1000ab07:	89 65 e8             	mov    %esp,-0x18(%ebp)
1000ab0a:	8b fc                	mov    %esp,%edi
1000ab0c:	89 7d bc             	mov    %edi,-0x44(%ebp)
1000ab0f:	56                   	push   %esi
1000ab10:	53                   	push   %ebx
1000ab11:	57                   	push   %edi
1000ab12:	e8 e9 f7 ff ff       	call   0x1000a300
1000ab17:	83 c4 0c             	add    $0xc,%esp
1000ab1a:	eb 10                	jmp    0x1000ab2c
1000ab1c:	33 c0                	xor    %eax,%eax
1000ab1e:	40                   	inc    %eax
1000ab1f:	c3                   	ret
1000ab20:	8b 65 e8             	mov    -0x18(%ebp),%esp
1000ab23:	e8 cf 02 00 00       	call   0x1000adf7
1000ab28:	33 db                	xor    %ebx,%ebx
1000ab2a:	33 ff                	xor    %edi,%edi
1000ab2c:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
1000ab30:	3b fb                	cmp    %ebx,%edi
1000ab32:	75 23                	jne    0x1000ab57
1000ab34:	ff 75 c0             	push   -0x40(%ebp)
1000ab37:	e8 76 b9 ff ff       	call   0x100064b2
1000ab3c:	59                   	pop    %ecx
1000ab3d:	8b f8                	mov    %eax,%edi
1000ab3f:	3b fb                	cmp    %ebx,%edi
1000ab41:	74 31                	je     0x1000ab74
1000ab43:	ff 75 c0             	push   -0x40(%ebp)
1000ab46:	53                   	push   %ebx
1000ab47:	57                   	push   %edi
1000ab48:	e8 b3 f7 ff ff       	call   0x1000a300
1000ab4d:	83 c4 0c             	add    $0xc,%esp
1000ab50:	c7 45 c8 01 00 00 00 	movl   $0x1,-0x38(%ebp)
1000ab57:	ff 75 c0             	push   -0x40(%ebp)
1000ab5a:	57                   	push   %edi
1000ab5b:	ff 75 14             	push   0x14(%ebp)
1000ab5e:	ff 75 cc             	push   -0x34(%ebp)
1000ab61:	ff 75 0c             	push   0xc(%ebp)
1000ab64:	ff 75 08             	push   0x8(%ebp)
1000ab67:	ff 15 f0 c0 00 10    	call   *0x1000c0f0  ; 0x1000c0f0=KERNEL32.dll!LCMapStringA
1000ab6d:	89 45 c0             	mov    %eax,-0x40(%ebp)
1000ab70:	3b c3                	cmp    %ebx,%eax
1000ab72:	75 04                	jne    0x1000ab78
1000ab74:	33 f6                	xor    %esi,%esi
1000ab76:	eb 26                	jmp    0x1000ab9e
1000ab78:	ff 75 1c             	push   0x1c(%ebp)
1000ab7b:	ff 75 18             	push   0x18(%ebp)
1000ab7e:	8d 45 c0             	lea    -0x40(%ebp),%eax
1000ab81:	50                   	push   %eax
1000ab82:	57                   	push   %edi
1000ab83:	ff 75 20             	push   0x20(%ebp)
1000ab86:	ff 75 c4             	push   -0x3c(%ebp)
1000ab89:	e8 9a 00 00 00       	call   0x1000ac28
1000ab8e:	83 c4 18             	add    $0x18,%esp
1000ab91:	8b f0                	mov    %eax,%esi
1000ab93:	f7 de                	neg    %esi
1000ab95:	1b f6                	sbb    %esi,%esi
1000ab97:	f7 de                	neg    %esi
1000ab99:	eb 03                	jmp    0x1000ab9e
1000ab9b:	8b 75 b8             	mov    -0x48(%ebp),%esi
1000ab9e:	39 5d c8             	cmp    %ebx,-0x38(%ebp)
1000aba1:	74 23                	je     0x1000abc6
1000aba3:	57                   	push   %edi
1000aba4:	e8 18 be ff ff       	call   0x100069c1
1000aba9:	59                   	pop    %ecx
1000abaa:	eb 1a                	jmp    0x1000abc6
1000abac:	ff 75 1c             	push   0x1c(%ebp)
1000abaf:	ff 75 18             	push   0x18(%ebp)
1000abb2:	ff 75 14             	push   0x14(%ebp)
1000abb5:	ff 75 10             	push   0x10(%ebp)
1000abb8:	ff 75 0c             	push   0xc(%ebp)
1000abbb:	ff 75 08             	push   0x8(%ebp)
1000abbe:	ff 15 f0 c0 00 10    	call   *0x1000c0f0  ; 0x1000c0f0=KERNEL32.dll!LCMapStringA
1000abc4:	8b f0                	mov    %eax,%esi
1000abc6:	39 5d cc             	cmp    %ebx,-0x34(%ebp)
1000abc9:	74 09                	je     0x1000abd4
1000abcb:	ff 75 cc             	push   -0x34(%ebp)
1000abce:	e8 ee bd ff ff       	call   0x100069c1
1000abd3:	59                   	pop    %ecx
1000abd4:	8b c6                	mov    %esi,%eax
1000abd6:	8d 65 ac             	lea    -0x54(%ebp),%esp
1000abd9:	e8 11 d2 ff ff       	call   0x10007def
1000abde:	c3                   	ret
1000abdf:	55                   	push   %ebp
1000abe0:	8b ec                	mov    %esp,%ebp
1000abe2:	83 ec 0c             	sub    $0xc,%esp
1000abe5:	a1 30 f1 00 10       	mov    0x1000f130,%eax
1000abea:	33 45 04             	xor    0x4(%ebp),%eax
1000abed:	80 65 fa 00          	andb   $0x0,-0x6(%ebp)
1000abf1:	6a 06                	push   $0x6
1000abf3:	89 45 fc             	mov    %eax,-0x4(%ebp)
1000abf6:	8d 45 f4             	lea    -0xc(%ebp),%eax
1000abf9:	50                   	push   %eax
1000abfa:	68 04 10 00 00       	push   $0x1004
1000abff:	ff 75 08             	push   0x8(%ebp)
1000ac02:	ff 15 e8 c0 00 10    	call   *0x1000c0e8  ; 0x1000c0e8=KERNEL32.dll!GetLocaleInfoA
1000ac08:	85 c0                	test   %eax,%eax
1000ac0a:	75 05                	jne    0x1000ac11
1000ac0c:	83 c8 ff             	or     $0xffffffff,%eax
1000ac0f:	eb 0a                	jmp    0x1000ac1b
1000ac11:	8d 45 f4             	lea    -0xc(%ebp),%eax
1000ac14:	50                   	push   %eax
1000ac15:	e8 93 b4 ff ff       	call   0x100060ad
1000ac1a:	59                   	pop    %ecx
1000ac1b:	8b 4d fc             	mov    -0x4(%ebp),%ecx
1000ac1e:	33 4d 04             	xor    0x4(%ebp),%ecx
1000ac21:	e8 45 b5 ff ff       	call   0x1000616b
1000ac26:	c9                   	leave
1000ac27:	c3                   	ret
1000ac28:	6a 38                	push   $0x38
1000ac2a:	68 80 d1 00 10       	push   $0x1000d180
1000ac2f:	e8 80 d1 ff ff       	call   0x10007db4
1000ac34:	a1 30 f1 00 10       	mov    0x1000f130,%eax
1000ac39:	33 45 04             	xor    0x4(%ebp),%eax
1000ac3c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
1000ac3f:	33 ff                	xor    %edi,%edi
1000ac41:	89 7d e0             	mov    %edi,-0x20(%ebp)
1000ac44:	89 7d dc             	mov    %edi,-0x24(%ebp)
1000ac47:	8b 45 14             	mov    0x14(%ebp),%eax
1000ac4a:	8b 18                	mov    (%eax),%ebx
1000ac4c:	89 5d d8             	mov    %ebx,-0x28(%ebp)
1000ac4f:	89 7d d4             	mov    %edi,-0x2c(%ebp)
1000ac52:	8b 45 08             	mov    0x8(%ebp),%eax
1000ac55:	3b 45 0c             	cmp    0xc(%ebp),%eax
1000ac58:	0f 84 73 01 00 00    	je     0x1000add1
1000ac5e:	8d 4d c0             	lea    -0x40(%ebp),%ecx
1000ac61:	51                   	push   %ecx
1000ac62:	50                   	push   %eax
1000ac63:	8b 35 d4 c0 00 10    	mov    0x1000c0d4,%esi  ; 0x1000c0d4=KERNEL32.dll!GetCPInfo
1000ac69:	ff d6                	call   *%esi
1000ac6b:	85 c0                	test   %eax,%eax
1000ac6d:	74 20                	je     0x1000ac8f
1000ac6f:	83 7d c0 01          	cmpl   $0x1,-0x40(%ebp)
1000ac73:	75 1a                	jne    0x1000ac8f
1000ac75:	8d 45 c0             	lea    -0x40(%ebp),%eax
1000ac78:	50                   	push   %eax
1000ac79:	ff 75 0c             	push   0xc(%ebp)
1000ac7c:	ff d6                	call   *%esi
1000ac7e:	85 c0                	test   %eax,%eax
1000ac80:	74 0d                	je     0x1000ac8f
1000ac82:	83 7d c0 01          	cmpl   $0x1,-0x40(%ebp)
1000ac86:	75 07                	jne    0x1000ac8f
1000ac88:	c7 45 d4 01 00 00 00 	movl   $0x1,-0x2c(%ebp)
1000ac8f:	39 7d d4             	cmp    %edi,-0x2c(%ebp)
1000ac92:	74 1a                	je     0x1000acae
1000ac94:	83 fb ff             	cmp    $0xffffffff,%ebx
1000ac97:	74 04                	je     0x1000ac9d
1000ac99:	8b f3                	mov    %ebx,%esi
1000ac9b:	eb 0c                	jmp    0x1000aca9
1000ac9d:	ff 75 10             	push   0x10(%ebp)
1000aca0:	e8 3b b8 ff ff       	call   0x100064e0
1000aca5:	59                   	pop    %ecx
1000aca6:	8b f0                	mov    %eax,%esi
1000aca8:	46                   	inc    %esi
1000aca9:	89 75 bc             	mov    %esi,-0x44(%ebp)
1000acac:	eb 03                	jmp    0x1000acb1
1000acae:	8b 75 bc             	mov    -0x44(%ebp),%esi
1000acb1:	39 7d d4             	cmp    %edi,-0x2c(%ebp)
1000acb4:	75 1a                	jne    0x1000acd0
1000acb6:	57                   	push   %edi
1000acb7:	57                   	push   %edi
1000acb8:	53                   	push   %ebx
1000acb9:	ff 75 10             	push   0x10(%ebp)
1000acbc:	6a 01                	push   $0x1
1000acbe:	ff 75 08             	push   0x8(%ebp)
1000acc1:	ff 15 e0 c0 00 10    	call   *0x1000c0e0  ; 0x1000c0e0=KERNEL32.dll!MultiByteToWideChar
1000acc7:	8b f0                	mov    %eax,%esi
1000acc9:	89 75 bc             	mov    %esi,-0x44(%ebp)
1000accc:	3b f7                	cmp    %edi,%esi
1000acce:	74 58                	je     0x1000ad28
1000acd0:	89 7d fc             	mov    %edi,-0x4(%ebp)
1000acd3:	8d 04 36             	lea    (%esi,%esi,1),%eax
1000acd6:	83 c0 03             	add    $0x3,%eax
1000acd9:	83 e0 fc             	and    $0xfffffffc,%eax
1000acdc:	e8 9f b4 ff ff       	call   0x10006180
1000ace1:	89 65 e8             	mov    %esp,-0x18(%ebp)
1000ace4:	8b dc                	mov    %esp,%ebx
1000ace6:	89 5d b8             	mov    %ebx,-0x48(%ebp)
1000ace9:	8d 04 36             	lea    (%esi,%esi,1),%eax
1000acec:	50                   	push   %eax
1000aced:	57                   	push   %edi
1000acee:	53                   	push   %ebx
1000acef:	e8 0c f6 ff ff       	call   0x1000a300
1000acf4:	83 c4 0c             	add    $0xc,%esp
1000acf7:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
1000acfb:	eb 17                	jmp    0x1000ad14
1000acfd:	33 c0                	xor    %eax,%eax
1000acff:	40                   	inc    %eax
1000ad00:	c3                   	ret
1000ad01:	8b 65 e8             	mov    -0x18(%ebp),%esp
1000ad04:	e8 ee 00 00 00       	call   0x1000adf7
1000ad09:	33 ff                	xor    %edi,%edi
1000ad0b:	33 db                	xor    %ebx,%ebx
1000ad0d:	83 4d fc ff          	orl    $0xffffffff,-0x4(%ebp)
1000ad11:	8b 75 bc             	mov    -0x44(%ebp),%esi
1000ad14:	3b df                	cmp    %edi,%ebx
1000ad16:	75 1e                	jne    0x1000ad36
1000ad18:	56                   	push   %esi
1000ad19:	6a 02                	push   $0x2
1000ad1b:	e8 7a d2 ff ff       	call   0x10007f9a
1000ad20:	59                   	pop    %ecx
1000ad21:	59                   	pop    %ecx
1000ad22:	8b d8                	mov    %eax,%ebx
1000ad24:	3b df                	cmp    %edi,%ebx
1000ad26:	75 07                	jne    0x1000ad2f
1000ad28:	33 c0                	xor    %eax,%eax
1000ad2a:	e9 b4 00 00 00       	jmp    0x1000ade3
1000ad2f:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
1000ad36:	56                   	push   %esi
1000ad37:	53                   	push   %ebx
1000ad38:	ff 75 d8             	push   -0x28(%ebp)
1000ad3b:	ff 75 10             	push   0x10(%ebp)
1000ad3e:	6a 01                	push   $0x1
1000ad40:	ff 75 08             	push   0x8(%ebp)
1000ad43:	ff 15 e0 c0 00 10    	call   *0x1000c0e0  ; 0x1000c0e0=KERNEL32.dll!MultiByteToWideChar
1000ad49:	85 c0                	test   %eax,%eax
1000ad4b:	0f 84 83 00 00 00    	je     0x1000add4
1000ad51:	39 7d 18             	cmp    %edi,0x18(%ebp)
1000ad54:	74 20                	je     0x1000ad76
1000ad56:	57                   	push   %edi
1000ad57:	57                   	push   %edi
1000ad58:	ff 75 1c             	push   0x1c(%ebp)
1000ad5b:	ff 75 18             	push   0x18(%ebp)
1000ad5e:	56                   	push   %esi
1000ad5f:	53                   	push   %ebx
1000ad60:	57                   	push   %edi
1000ad61:	ff 75 0c             	push   0xc(%ebp)
1000ad64:	ff 15 9c c0 00 10    	call   *0x1000c09c  ; 0x1000c09c=KERNEL32.dll!WideCharToMultiByte
1000ad6a:	85 c0                	test   %eax,%eax
1000ad6c:	74 66                	je     0x1000add4
1000ad6e:	8b 45 18             	mov    0x18(%ebp),%eax
1000ad71:	89 45 e0             	mov    %eax,-0x20(%ebp)
1000ad74:	eb 5e                	jmp    0x1000add4
1000ad76:	39 7d d4             	cmp    %edi,-0x2c(%ebp)
1000ad79:	75 16                	jne    0x1000ad91
1000ad7b:	57                   	push   %edi
1000ad7c:	57                   	push   %edi
1000ad7d:	57                   	push   %edi
1000ad7e:	57                   	push   %edi
1000ad7f:	56                   	push   %esi
1000ad80:	53                   	push   %ebx
1000ad81:	57                   	push   %edi
1000ad82:	ff 75 0c             	push   0xc(%ebp)
1000ad85:	ff 15 9c c0 00 10    	call   *0x1000c09c  ; 0x1000c09c=KERNEL32.dll!WideCharToMultiByte
1000ad8b:	8b f0                	mov    %eax,%esi
1000ad8d:	3b f7                	cmp    %edi,%esi
1000ad8f:	74 43                	je     0x1000add4
1000ad91:	56                   	push   %esi
1000ad92:	6a 01                	push   $0x1
1000ad94:	e8 01 d2 ff ff       	call   0x10007f9a
1000ad99:	59                   	pop    %ecx
1000ad9a:	59                   	pop    %ecx
1000ad9b:	89 45 e0             	mov    %eax,-0x20(%ebp)
1000ad9e:	3b c7                	cmp    %edi,%eax
1000ada0:	74 32                	je     0x1000add4
1000ada2:	57                   	push   %edi
1000ada3:	57                   	push   %edi
1000ada4:	56                   	push   %esi
1000ada5:	50                   	push   %eax
1000ada6:	56                   	push   %esi
1000ada7:	53                   	push   %ebx
1000ada8:	57                   	push   %edi
1000ada9:	ff 75 0c             	push   0xc(%ebp)
1000adac:	ff 15 9c c0 00 10    	call   *0x1000c09c  ; 0x1000c09c=KERNEL32.dll!WideCharToMultiByte
1000adb2:	3b c7                	cmp    %edi,%eax
1000adb4:	75 0e                	jne    0x1000adc4
1000adb6:	ff 75 e0             	push   -0x20(%ebp)
1000adb9:	e8 03 bc ff ff       	call   0x100069c1
1000adbe:	59                   	pop    %ecx
1000adbf:	89 7d e0             	mov    %edi,-0x20(%ebp)
1000adc2:	eb 10                	jmp    0x1000add4
1000adc4:	83 7d d8 ff          	cmpl   $0xffffffff,-0x28(%ebp)
1000adc8:	74 0a                	je     0x1000add4
1000adca:	8b 4d 14             	mov    0x14(%ebp),%ecx
1000adcd:	89 01                	mov    %eax,(%ecx)
1000adcf:	eb 03                	jmp    0x1000add4
1000add1:	8b 5d b8             	mov    -0x48(%ebp),%ebx
1000add4:	39 7d dc             	cmp    %edi,-0x24(%ebp)
1000add7:	74 07                	je     0x1000ade0
1000add9:	53                   	push   %ebx
1000adda:	e8 e2 bb ff ff       	call   0x100069c1
1000addf:	59                   	pop    %ecx
1000ade0:	8b 45 e0             	mov    -0x20(%ebp),%eax
1000ade3:	8d 65 ac             	lea    -0x54(%ebp),%esp
1000ade6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
1000ade9:	33 4d 04             	xor    0x4(%ebp),%ecx
1000adec:	e8 7a b3 ff ff       	call   0x1000616b
1000adf1:	e8 f9 cf ff ff       	call   0x10007def
1000adf6:	c3                   	ret
1000adf7:	55                   	push   %ebp
1000adf8:	8b ec                	mov    %esp,%ebp
1000adfa:	83 ec 48             	sub    $0x48,%esp
1000adfd:	53                   	push   %ebx
1000adfe:	56                   	push   %esi
1000adff:	57                   	push   %edi
1000ae00:	6a 04                	push   $0x4
1000ae02:	58                   	pop    %eax
1000ae03:	e8 78 b3 ff ff       	call   0x10006180
1000ae08:	8b dc                	mov    %esp,%ebx
1000ae0a:	6a 1c                	push   $0x1c
1000ae0c:	8d 45 dc             	lea    -0x24(%ebp),%eax
1000ae0f:	50                   	push   %eax
1000ae10:	53                   	push   %ebx
1000ae11:	ff 15 00 c1 00 10    	call   *0x1000c100  ; 0x1000c100=KERNEL32.dll!VirtualQuery
1000ae17:	85 c0                	test   %eax,%eax
1000ae19:	74 71                	je     0x1000ae8c
1000ae1b:	8b 7d e0             	mov    -0x20(%ebp),%edi
1000ae1e:	8d 45 b8             	lea    -0x48(%ebp),%eax
1000ae21:	50                   	push   %eax
1000ae22:	ff 15 fc c0 00 10    	call   *0x1000c0fc  ; 0x1000c0fc=KERNEL32.dll!GetSystemInfo
1000ae28:	8b 45 bc             	mov    -0x44(%ebp),%eax
1000ae2b:	8d 70 ff             	lea    -0x1(%eax),%esi
1000ae2e:	f7 d6                	not    %esi
1000ae30:	23 f3                	and    %ebx,%esi
1000ae32:	2b f0                	sub    %eax,%esi
1000ae34:	89 45 fc             	mov    %eax,-0x4(%ebp)
1000ae37:	a1 a4 fd 00 10       	mov    0x1000fda4,%eax
1000ae3c:	8b c8                	mov    %eax,%ecx
1000ae3e:	49                   	dec    %ecx
1000ae3f:	f7 d9                	neg    %ecx
1000ae41:	1b c9                	sbb    %ecx,%ecx
1000ae43:	81 e1 00 10 ff ff    	and    $0xffff1000,%ecx
1000ae49:	81 c1 00 10 01 00    	add    $0x11000,%ecx
1000ae4f:	03 cf                	add    %edi,%ecx
1000ae51:	3b f1                	cmp    %ecx,%esi
1000ae53:	72 37                	jb     0x1000ae8c
1000ae55:	83 f8 01             	cmp    $0x1,%eax
1000ae58:	74 4a                	je     0x1000aea4
1000ae5a:	8b df                	mov    %edi,%ebx
1000ae5c:	bf 00 10 00 00       	mov    $0x1000,%edi
1000ae61:	6a 1c                	push   $0x1c
1000ae63:	8d 45 dc             	lea    -0x24(%ebp),%eax
1000ae66:	50                   	push   %eax
1000ae67:	53                   	push   %ebx
1000ae68:	ff 15 00 c1 00 10    	call   *0x1000c100  ; 0x1000c100=KERNEL32.dll!VirtualQuery
1000ae6e:	85 c0                	test   %eax,%eax
1000ae70:	74 1a                	je     0x1000ae8c
1000ae72:	03 5d e8             	add    -0x18(%ebp),%ebx
1000ae75:	85 7d ec             	test   %edi,-0x14(%ebp)
1000ae78:	74 e7                	je     0x1000ae61
1000ae7a:	f6 45 f1 01          	testb  $0x1,-0xf(%ebp)
1000ae7e:	8b 5d dc             	mov    -0x24(%ebp),%ebx
1000ae81:	74 05                	je     0x1000ae88
1000ae83:	33 c0                	xor    %eax,%eax
1000ae85:	40                   	inc    %eax
1000ae86:	eb 38                	jmp    0x1000aec0
1000ae88:	3b f3                	cmp    %ebx,%esi
1000ae8a:	73 04                	jae    0x1000ae90
1000ae8c:	33 c0                	xor    %eax,%eax
1000ae8e:	eb 30                	jmp    0x1000aec0
1000ae90:	6a 04                	push   $0x4
1000ae92:	57                   	push   %edi
1000ae93:	ff 75 fc             	push   -0x4(%ebp)
1000ae96:	53                   	push   %ebx
1000ae97:	ff 15 b4 c0 00 10    	call   *0x1000c0b4  ; 0x1000c0b4=KERNEL32.dll!VirtualAlloc
1000ae9d:	a1 a4 fd 00 10       	mov    0x1000fda4,%eax
1000aea2:	eb 02                	jmp    0x1000aea6
1000aea4:	8b de                	mov    %esi,%ebx
1000aea6:	48                   	dec    %eax
1000aea7:	f7 d8                	neg    %eax
1000aea9:	1b c0                	sbb    %eax,%eax
1000aeab:	25 03 01 00 00       	and    $0x103,%eax
1000aeb0:	8d 4d f8             	lea    -0x8(%ebp),%ecx
1000aeb3:	51                   	push   %ecx
1000aeb4:	40                   	inc    %eax
1000aeb5:	50                   	push   %eax
1000aeb6:	ff 75 fc             	push   -0x4(%ebp)
1000aeb9:	53                   	push   %ebx
1000aeba:	ff 15 f8 c0 00 10    	call   *0x1000c0f8  ; 0x1000c0f8=KERNEL32.dll!VirtualProtect
1000aec0:	8d 65 ac             	lea    -0x54(%ebp),%esp
1000aec3:	5f                   	pop    %edi
1000aec4:	5e                   	pop    %esi
1000aec5:	5b                   	pop    %ebx
1000aec6:	c9                   	leave
1000aec7:	c3                   	ret
1000aec8:	cc                   	int3
1000aec9:	cc                   	int3
1000aeca:	cc                   	int3
1000aecb:	cc                   	int3
1000aecc:	cc                   	int3
1000aecd:	cc                   	int3
1000aece:	cc                   	int3
1000aecf:	cc                   	int3
1000aed0:	55                   	push   %ebp
1000aed1:	8b ec                	mov    %esp,%ebp
1000aed3:	57                   	push   %edi
1000aed4:	56                   	push   %esi
1000aed5:	53                   	push   %ebx
1000aed6:	8b 75 0c             	mov    0xc(%ebp),%esi
1000aed9:	8b 7d 08             	mov    0x8(%ebp),%edi
1000aedc:	b0 ff                	mov    $0xff,%al
1000aede:	8b ff                	mov    %edi,%edi
1000aee0:	0a c0                	or     %al,%al
1000aee2:	74 32                	je     0x1000af16
1000aee4:	8a 06                	mov    (%esi),%al
1000aee6:	83 c6 01             	add    $0x1,%esi
1000aee9:	8a 27                	mov    (%edi),%ah
1000aeeb:	83 c7 01             	add    $0x1,%edi
1000aeee:	38 c4                	cmp    %al,%ah
1000aef0:	74 ee                	je     0x1000aee0
1000aef2:	2c 41                	sub    $0x41,%al
1000aef4:	3c 1a                	cmp    $0x1a,%al
1000aef6:	1a c9                	sbb    %cl,%cl
1000aef8:	80 e1 20             	and    $0x20,%cl
1000aefb:	02 c1                	add    %cl,%al
1000aefd:	04 41                	add    $0x41,%al
1000aeff:	86 e0                	xchg   %ah,%al
1000af01:	2c 41                	sub    $0x41,%al
1000af03:	3c 1a                	cmp    $0x1a,%al
1000af05:	1a c9                	sbb    %cl,%cl
1000af07:	80 e1 20             	and    $0x20,%cl
1000af0a:	02 c1                	add    %cl,%al
1000af0c:	04 41                	add    $0x41,%al
1000af0e:	38 e0                	cmp    %ah,%al
1000af10:	74 ce                	je     0x1000aee0
1000af12:	1a c0                	sbb    %al,%al
1000af14:	1c ff                	sbb    $0xff,%al
1000af16:	0f be c0             	movsbl %al,%eax
1000af19:	5b                   	pop    %ebx
1000af1a:	5e                   	pop    %esi
1000af1b:	5f                   	pop    %edi
1000af1c:	c9                   	leave
1000af1d:	c3                   	ret
1000af1e:	cc                   	int3
1000af1f:	cc                   	int3
1000af20:	55                   	push   %ebp
1000af21:	8b ec                	mov    %esp,%ebp
1000af23:	57                   	push   %edi
1000af24:	56                   	push   %esi
1000af25:	53                   	push   %ebx
1000af26:	8b 4d 10             	mov    0x10(%ebp),%ecx
1000af29:	0b c9                	or     %ecx,%ecx
1000af2b:	74 4d                	je     0x1000af7a
1000af2d:	8b 75 08             	mov    0x8(%ebp),%esi
1000af30:	8b 7d 0c             	mov    0xc(%ebp),%edi
1000af33:	b7 41                	mov    $0x41,%bh
1000af35:	b3 5a                	mov    $0x5a,%bl
1000af37:	b6 20                	mov    $0x20,%dh
1000af39:	8d 49 00             	lea    0x0(%ecx),%ecx
1000af3c:	8a 26                	mov    (%esi),%ah
1000af3e:	0a e4                	or     %ah,%ah
1000af40:	8a 07                	mov    (%edi),%al
1000af42:	74 27                	je     0x1000af6b
1000af44:	0a c0                	or     %al,%al
1000af46:	74 23                	je     0x1000af6b
1000af48:	83 c6 01             	add    $0x1,%esi
1000af4b:	83 c7 01             	add    $0x1,%edi
1000af4e:	38 fc                	cmp    %bh,%ah
1000af50:	72 06                	jb     0x1000af58
1000af52:	38 dc                	cmp    %bl,%ah
1000af54:	77 02                	ja     0x1000af58
1000af56:	02 e6                	add    %dh,%ah
1000af58:	38 f8                	cmp    %bh,%al
1000af5a:	72 06                	jb     0x1000af62
1000af5c:	38 d8                	cmp    %bl,%al
1000af5e:	77 02                	ja     0x1000af62
1000af60:	02 c6                	add    %dh,%al
1000af62:	38 c4                	cmp    %al,%ah
1000af64:	75 0b                	jne    0x1000af71
1000af66:	83 e9 01             	sub    $0x1,%ecx
1000af69:	75 d1                	jne    0x1000af3c
1000af6b:	33 c9                	xor    %ecx,%ecx
1000af6d:	38 c4                	cmp    %al,%ah
1000af6f:	74 09                	je     0x1000af7a
1000af71:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
1000af76:	72 02                	jb     0x1000af7a
1000af78:	f7 d9                	neg    %ecx
1000af7a:	8b c1                	mov    %ecx,%eax
1000af7c:	5b                   	pop    %ebx
1000af7d:	5e                   	pop    %esi
1000af7e:	5f                   	pop    %edi
1000af7f:	c9                   	leave
1000af80:	c3                   	ret
1000af81:	cc                   	int3
1000af82:	cc                   	int3
1000af83:	cc                   	int3
1000af84:	cc                   	int3
1000af85:	cc                   	int3
1000af86:	cc                   	int3
1000af87:	cc                   	int3
1000af88:	cc                   	int3
1000af89:	cc                   	int3
1000af8a:	cc                   	int3
1000af8b:	cc                   	int3
1000af8c:	cc                   	int3
1000af8d:	cc                   	int3
1000af8e:	cc                   	int3
1000af8f:	cc                   	int3
1000af90:	56                   	push   %esi
1000af91:	8b 44 24 14          	mov    0x14(%esp),%eax
1000af95:	0b c0                	or     %eax,%eax
1000af97:	75 28                	jne    0x1000afc1
1000af99:	8b 4c 24 10          	mov    0x10(%esp),%ecx
1000af9d:	8b 44 24 0c          	mov    0xc(%esp),%eax
1000afa1:	33 d2                	xor    %edx,%edx
1000afa3:	f7 f1                	div    %ecx
1000afa5:	8b d8                	mov    %eax,%ebx
1000afa7:	8b 44 24 08          	mov    0x8(%esp),%eax
1000afab:	f7 f1                	div    %ecx
1000afad:	8b f0                	mov    %eax,%esi
1000afaf:	8b c3                	mov    %ebx,%eax
1000afb1:	f7 64 24 10          	mull   0x10(%esp)
1000afb5:	8b c8                	mov    %eax,%ecx
1000afb7:	8b c6                	mov    %esi,%eax
1000afb9:	f7 64 24 10          	mull   0x10(%esp)
1000afbd:	03 d1                	add    %ecx,%edx
1000afbf:	eb 47                	jmp    0x1000b008
1000afc1:	8b c8                	mov    %eax,%ecx
1000afc3:	8b 5c 24 10          	mov    0x10(%esp),%ebx
1000afc7:	8b 54 24 0c          	mov    0xc(%esp),%edx
1000afcb:	8b 44 24 08          	mov    0x8(%esp),%eax
1000afcf:	d1 e9                	shr    $1,%ecx
1000afd1:	d1 db                	rcr    $1,%ebx
1000afd3:	d1 ea                	shr    $1,%edx
1000afd5:	d1 d8                	rcr    $1,%eax
1000afd7:	0b c9                	or     %ecx,%ecx
1000afd9:	75 f4                	jne    0x1000afcf
1000afdb:	f7 f3                	div    %ebx
1000afdd:	8b f0                	mov    %eax,%esi
1000afdf:	f7 64 24 14          	mull   0x14(%esp)
1000afe3:	8b c8                	mov    %eax,%ecx
1000afe5:	8b 44 24 10          	mov    0x10(%esp),%eax
1000afe9:	f7 e6                	mul    %esi
1000afeb:	03 d1                	add    %ecx,%edx
1000afed:	72 0e                	jb     0x1000affd
1000afef:	3b 54 24 0c          	cmp    0xc(%esp),%edx
1000aff3:	77 08                	ja     0x1000affd
1000aff5:	72 0f                	jb     0x1000b006
1000aff7:	3b 44 24 08          	cmp    0x8(%esp),%eax
1000affb:	76 09                	jbe    0x1000b006
1000affd:	4e                   	dec    %esi
1000affe:	2b 44 24 10          	sub    0x10(%esp),%eax
1000b002:	1b 54 24 14          	sbb    0x14(%esp),%edx
1000b006:	33 db                	xor    %ebx,%ebx
1000b008:	2b 44 24 08          	sub    0x8(%esp),%eax
1000b00c:	1b 54 24 0c          	sbb    0xc(%esp),%edx
1000b010:	f7 da                	neg    %edx
1000b012:	f7 d8                	neg    %eax
1000b014:	83 da 00             	sbb    $0x0,%edx
1000b017:	8b ca                	mov    %edx,%ecx
1000b019:	8b d3                	mov    %ebx,%edx
1000b01b:	8b d9                	mov    %ecx,%ebx
1000b01d:	8b c8                	mov    %eax,%ecx
1000b01f:	8b c6                	mov    %esi,%eax
1000b021:	5e                   	pop    %esi
1000b022:	c2 10 00             	ret    $0x10
1000b025:	cc                   	int3
1000b026:	cc                   	int3
1000b027:	cc                   	int3
1000b028:	cc                   	int3
1000b029:	cc                   	int3
1000b02a:	cc                   	int3
1000b02b:	cc                   	int3
1000b02c:	cc                   	int3
1000b02d:	cc                   	int3
1000b02e:	cc                   	int3
1000b02f:	cc                   	int3
1000b030:	8d 42 ff             	lea    -0x1(%edx),%eax
1000b033:	5b                   	pop    %ebx
1000b034:	c3                   	ret
1000b035:	8d a4 24 00 00 00 00 	lea    0x0(%esp),%esp
1000b03c:	8d 64 24 00          	lea    0x0(%esp),%esp
1000b040:	33 c0                	xor    %eax,%eax
1000b042:	8a 44 24 08          	mov    0x8(%esp),%al
1000b046:	53                   	push   %ebx
1000b047:	8b d8                	mov    %eax,%ebx
1000b049:	c1 e0 08             	shl    $0x8,%eax
1000b04c:	8b 54 24 08          	mov    0x8(%esp),%edx
1000b050:	f7 c2 03 00 00 00    	test   $0x3,%edx
1000b056:	74 15                	je     0x1000b06d
1000b058:	8a 0a                	mov    (%edx),%cl
1000b05a:	83 c2 01             	add    $0x1,%edx
1000b05d:	38 d9                	cmp    %bl,%cl
1000b05f:	74 cf                	je     0x1000b030
1000b061:	84 c9                	test   %cl,%cl
1000b063:	74 51                	je     0x1000b0b6
1000b065:	f7 c2 03 00 00 00    	test   $0x3,%edx
1000b06b:	75 eb                	jne    0x1000b058
1000b06d:	0b d8                	or     %eax,%ebx
1000b06f:	57                   	push   %edi
1000b070:	8b c3                	mov    %ebx,%eax
1000b072:	c1 e3 10             	shl    $0x10,%ebx
1000b075:	56                   	push   %esi
1000b076:	0b d8                	or     %eax,%ebx
1000b078:	8b 0a                	mov    (%edx),%ecx
1000b07a:	bf ff fe fe 7e       	mov    $0x7efefeff,%edi
1000b07f:	8b c1                	mov    %ecx,%eax
1000b081:	8b f7                	mov    %edi,%esi
1000b083:	33 cb                	xor    %ebx,%ecx
1000b085:	03 f0                	add    %eax,%esi
1000b087:	03 f9                	add    %ecx,%edi
1000b089:	83 f1 ff             	xor    $0xffffffff,%ecx
1000b08c:	83 f0 ff             	xor    $0xffffffff,%eax
1000b08f:	33 cf                	xor    %edi,%ecx
1000b091:	33 c6                	xor    %esi,%eax
1000b093:	83 c2 04             	add    $0x4,%edx
1000b096:	81 e1 00 01 01 81    	and    $0x81010100,%ecx
1000b09c:	75 1c                	jne    0x1000b0ba
1000b09e:	25 00 01 01 81       	and    $0x81010100,%eax
1000b0a3:	74 d3                	je     0x1000b078
1000b0a5:	25 00 01 01 01       	and    $0x1010100,%eax
1000b0aa:	75 08                	jne    0x1000b0b4
1000b0ac:	81 e6 00 00 00 80    	and    $0x80000000,%esi
1000b0b2:	75 c4                	jne    0x1000b078
1000b0b4:	5e                   	pop    %esi
1000b0b5:	5f                   	pop    %edi
1000b0b6:	5b                   	pop    %ebx
1000b0b7:	33 c0                	xor    %eax,%eax
1000b0b9:	c3                   	ret
1000b0ba:	8b 42 fc             	mov    -0x4(%edx),%eax
1000b0bd:	38 d8                	cmp    %bl,%al
1000b0bf:	74 36                	je     0x1000b0f7
1000b0c1:	84 c0                	test   %al,%al
1000b0c3:	74 ef                	je     0x1000b0b4
1000b0c5:	38 dc                	cmp    %bl,%ah
1000b0c7:	74 27                	je     0x1000b0f0
1000b0c9:	84 e4                	test   %ah,%ah
1000b0cb:	74 e7                	je     0x1000b0b4
1000b0cd:	c1 e8 10             	shr    $0x10,%eax
1000b0d0:	38 d8                	cmp    %bl,%al
1000b0d2:	74 15                	je     0x1000b0e9
1000b0d4:	84 c0                	test   %al,%al
1000b0d6:	74 dc                	je     0x1000b0b4
1000b0d8:	38 dc                	cmp    %bl,%ah
1000b0da:	74 06                	je     0x1000b0e2
1000b0dc:	84 e4                	test   %ah,%ah
1000b0de:	74 d4                	je     0x1000b0b4
1000b0e0:	eb 96                	jmp    0x1000b078
1000b0e2:	5e                   	pop    %esi
1000b0e3:	5f                   	pop    %edi
1000b0e4:	8d 42 ff             	lea    -0x1(%edx),%eax
1000b0e7:	5b                   	pop    %ebx
1000b0e8:	c3                   	ret
1000b0e9:	8d 42 fe             	lea    -0x2(%edx),%eax
1000b0ec:	5e                   	pop    %esi
1000b0ed:	5f                   	pop    %edi
1000b0ee:	5b                   	pop    %ebx
1000b0ef:	c3                   	ret
1000b0f0:	8d 42 fd             	lea    -0x3(%edx),%eax
1000b0f3:	5e                   	pop    %esi
1000b0f4:	5f                   	pop    %edi
1000b0f5:	5b                   	pop    %ebx
1000b0f6:	c3                   	ret
1000b0f7:	8d 42 fc             	lea    -0x4(%edx),%eax
1000b0fa:	5e                   	pop    %esi
1000b0fb:	5f                   	pop    %edi
1000b0fc:	5b                   	pop    %ebx
1000b0fd:	c3                   	ret
1000b0fe:	ff 25 18 c0 00 10    	jmp    *0x1000c018  ; 0x1000c018=KERNEL32.dll!RtlUnwind
1000b104:	cc                   	int3
1000b105:	cc                   	int3
1000b106:	cc                   	int3
1000b107:	cc                   	int3
1000b108:	cc                   	int3
1000b109:	cc                   	int3
1000b10a:	cc                   	int3
1000b10b:	cc                   	int3
1000b10c:	cc                   	int3
1000b10d:	cc                   	int3
1000b10e:	cc                   	int3
1000b10f:	cc                   	int3
1000b110:	b8 3c d4 00 10       	mov    $0x1000d43c,%eax
1000b115:	e9 8b a9 ff ff       	jmp    0x10005aa5
1000b11a:	cc                   	int3
1000b11b:	cc                   	int3
1000b11c:	cc                   	int3
1000b11d:	cc                   	int3
1000b11e:	cc                   	int3
1000b11f:	cc                   	int3
1000b120:	8d 4d b0             	lea    -0x50(%ebp),%ecx
1000b123:	e9 18 64 ff ff       	jmp    0x10001540
1000b128:	b8 d4 d4 00 10       	mov    $0x1000d4d4,%eax
1000b12d:	e9 73 a9 ff ff       	jmp    0x10005aa5
1000b132:	cc                   	int3
1000b133:	cc                   	int3
1000b134:	cc                   	int3
1000b135:	cc                   	int3
1000b136:	cc                   	int3
1000b137:	cc                   	int3
1000b138:	cc                   	int3
1000b139:	cc                   	int3
1000b13a:	cc                   	int3
1000b13b:	cc                   	int3
1000b13c:	cc                   	int3
1000b13d:	cc                   	int3
1000b13e:	cc                   	int3
1000b13f:	cc                   	int3
1000b140:	8b 4d f0             	mov    -0x10(%ebp),%ecx
1000b143:	e9 be ad ff ff       	jmp    0x10005f06
1000b148:	b8 f8 d4 00 10       	mov    $0x1000d4f8,%eax
1000b14d:	e9 53 a9 ff ff       	jmp    0x10005aa5
1000b152:	cc                   	int3
1000b153:	cc                   	int3
1000b154:	cc                   	int3
1000b155:	cc                   	int3
1000b156:	cc                   	int3
1000b157:	cc                   	int3
1000b158:	cc                   	int3
1000b159:	cc                   	int3
1000b15a:	cc                   	int3
1000b15b:	cc                   	int3
1000b15c:	cc                   	int3
1000b15d:	cc                   	int3
1000b15e:	cc                   	int3
1000b15f:	cc                   	int3
1000b160:	b8 7c d5 00 10       	mov    $0x1000d57c,%eax
1000b165:	e9 3b a9 ff ff       	jmp    0x10005aa5
1000b16a:	cc                   	int3
1000b16b:	cc                   	int3
1000b16c:	cc                   	int3
1000b16d:	cc                   	int3
1000b16e:	cc                   	int3
1000b16f:	cc                   	int3
1000b170:	8b 4d c8             	mov    -0x38(%ebp),%ecx
1000b173:	83 c1 18             	add    $0x18,%ecx
1000b176:	e9 85 71 ff ff       	jmp    0x10002300
1000b17b:	b8 a0 d5 00 10       	mov    $0x1000d5a0,%eax
1000b180:	e9 20 a9 ff ff       	jmp    0x10005aa5
1000b185:	cc                   	int3
1000b186:	cc                   	int3
1000b187:	cc                   	int3
1000b188:	cc                   	int3
1000b189:	cc                   	int3
1000b18a:	cc                   	int3
1000b18b:	cc                   	int3
1000b18c:	cc                   	int3
1000b18d:	cc                   	int3
1000b18e:	cc                   	int3
1000b18f:	cc                   	int3
1000b190:	8b 45 f0             	mov    -0x10(%ebp),%eax
1000b193:	50                   	push   %eax
1000b194:	e8 44 a8 ff ff       	call   0x100059dd
1000b199:	59                   	pop    %ecx
1000b19a:	c3                   	ret
1000b19b:	b8 c4 d5 00 10       	mov    $0x1000d5c4,%eax
1000b1a0:	e9 00 a9 ff ff       	jmp    0x10005aa5
1000b1a5:	cc                   	int3
1000b1a6:	cc                   	int3
1000b1a7:	cc                   	int3
1000b1a8:	cc                   	int3
1000b1a9:	cc                   	int3
1000b1aa:	cc                   	int3
1000b1ab:	cc                   	int3
1000b1ac:	cc                   	int3
1000b1ad:	cc                   	int3
1000b1ae:	cc                   	int3
1000b1af:	cc                   	int3
1000b1b0:	b8 14 d6 00 10       	mov    $0x1000d614,%eax
1000b1b5:	e9 eb a8 ff ff       	jmp    0x10005aa5
1000b1ba:	cc                   	int3
1000b1bb:	cc                   	int3
1000b1bc:	cc                   	int3
1000b1bd:	cc                   	int3
1000b1be:	cc                   	int3
1000b1bf:	cc                   	int3
1000b1c0:	8d 4d b0             	lea    -0x50(%ebp),%ecx
1000b1c3:	e9 78 63 ff ff       	jmp    0x10001540
1000b1c8:	b8 38 d6 00 10       	mov    $0x1000d638,%eax
1000b1cd:	e9 d3 a8 ff ff       	jmp    0x10005aa5
1000b1d2:	cc                   	int3
1000b1d3:	cc                   	int3
1000b1d4:	cc                   	int3
1000b1d5:	cc                   	int3
1000b1d6:	cc                   	int3
1000b1d7:	cc                   	int3
1000b1d8:	cc                   	int3
1000b1d9:	cc                   	int3
1000b1da:	cc                   	int3
1000b1db:	cc                   	int3
1000b1dc:	cc                   	int3
1000b1dd:	cc                   	int3
1000b1de:	cc                   	int3
1000b1df:	cc                   	int3
1000b1e0:	b8 bc d6 00 10       	mov    $0x1000d6bc,%eax
1000b1e5:	e9 bb a8 ff ff       	jmp    0x10005aa5
1000b1ea:	cc                   	int3
1000b1eb:	cc                   	int3
1000b1ec:	cc                   	int3
1000b1ed:	cc                   	int3
1000b1ee:	cc                   	int3
1000b1ef:	cc                   	int3
1000b1f0:	8b 4d f0             	mov    -0x10(%ebp),%ecx
1000b1f3:	83 c1 04             	add    $0x4,%ecx
1000b1f6:	e9 c5 70 ff ff       	jmp    0x100022c0
1000b1fb:	b8 e0 d6 00 10       	mov    $0x1000d6e0,%eax
1000b200:	e9 a0 a8 ff ff       	jmp    0x10005aa5
1000b205:	cc                   	int3
1000b206:	cc                   	int3
1000b207:	cc                   	int3
1000b208:	cc                   	int3
1000b209:	cc                   	int3
1000b20a:	cc                   	int3
1000b20b:	cc                   	int3
1000b20c:	cc                   	int3
1000b20d:	cc                   	int3
1000b20e:	cc                   	int3
1000b20f:	cc                   	int3
1000b210:	8b 45 f0             	mov    -0x10(%ebp),%eax
1000b213:	50                   	push   %eax
1000b214:	e8 c4 a7 ff ff       	call   0x100059dd
1000b219:	59                   	pop    %ecx
1000b21a:	c3                   	ret
1000b21b:	b8 28 d7 00 10       	mov    $0x1000d728,%eax
1000b220:	e9 80 a8 ff ff       	jmp    0x10005aa5
1000b225:	cc                   	int3
1000b226:	cc                   	int3
1000b227:	cc                   	int3
1000b228:	cc                   	int3
1000b229:	cc                   	int3
1000b22a:	cc                   	int3
1000b22b:	cc                   	int3
1000b22c:	cc                   	int3
1000b22d:	cc                   	int3
1000b22e:	cc                   	int3
1000b22f:	cc                   	int3
1000b230:	8b 4d f0             	mov    -0x10(%ebp),%ecx
1000b233:	83 c1 10             	add    $0x10,%ecx
1000b236:	e9 75 8c ff ff       	jmp    0x10003eb0
1000b23b:	b8 04 d7 00 10       	mov    $0x1000d704,%eax
1000b240:	e9 60 a8 ff ff       	jmp    0x10005aa5
1000b245:	cc                   	int3
1000b246:	cc                   	int3
1000b247:	cc                   	int3
1000b248:	cc                   	int3
1000b249:	cc                   	int3
1000b24a:	cc                   	int3
1000b24b:	cc                   	int3
1000b24c:	cc                   	int3
1000b24d:	cc                   	int3
1000b24e:	cc                   	int3
1000b24f:	cc                   	int3
1000b250:	b8 78 d7 00 10       	mov    $0x1000d778,%eax
1000b255:	e9 4b a8 ff ff       	jmp    0x10005aa5
1000b25a:	cc                   	int3
1000b25b:	cc                   	int3
1000b25c:	cc                   	int3
1000b25d:	cc                   	int3
1000b25e:	cc                   	int3
1000b25f:	cc                   	int3
1000b260:	8b 4d f0             	mov    -0x10(%ebp),%ecx
1000b263:	81 c1 fc 02 00 00    	add    $0x2fc,%ecx
1000b269:	e9 52 70 ff ff       	jmp    0x100022c0
1000b26e:	b8 9c d7 00 10       	mov    $0x1000d79c,%eax
1000b273:	e9 2d a8 ff ff       	jmp    0x10005aa5
1000b278:	cc                   	int3
1000b279:	cc                   	int3
1000b27a:	cc                   	int3
1000b27b:	cc                   	int3
1000b27c:	cc                   	int3
1000b27d:	cc                   	int3
1000b27e:	cc                   	int3
1000b27f:	cc                   	int3
1000b280:	8d 4d b0             	lea    -0x50(%ebp),%ecx
1000b283:	e9 b8 62 ff ff       	jmp    0x10001540
1000b288:	b8 c0 d7 00 10       	mov    $0x1000d7c0,%eax
1000b28d:	e9 13 a8 ff ff       	jmp    0x10005aa5
1000b292:	cc                   	int3
1000b293:	cc                   	int3
1000b294:	cc                   	int3
1000b295:	cc                   	int3
1000b296:	cc                   	int3
1000b297:	cc                   	int3
1000b298:	cc                   	int3
1000b299:	cc                   	int3
1000b29a:	cc                   	int3
1000b29b:	cc                   	int3
1000b29c:	cc                   	int3
1000b29d:	cc                   	int3
1000b29e:	cc                   	int3
1000b29f:	cc                   	int3
1000b2a0:	b8 44 d8 00 10       	mov    $0x1000d844,%eax
1000b2a5:	e9 fb a7 ff ff       	jmp    0x10005aa5
1000b2aa:	cc                   	int3
1000b2ab:	cc                   	int3
1000b2ac:	cc                   	int3
1000b2ad:	cc                   	int3
1000b2ae:	cc                   	int3
1000b2af:	cc                   	int3
1000b2b0:	8d 4d d4             	lea    -0x2c(%ebp),%ecx
1000b2b3:	e9 88 62 ff ff       	jmp    0x10001540
1000b2b8:	8d 4d b8             	lea    -0x48(%ebp),%ecx
1000b2bb:	e9 80 62 ff ff       	jmp    0x10001540
1000b2c0:	b8 70 d8 00 10       	mov    $0x1000d870,%eax
1000b2c5:	e9 db a7 ff ff       	jmp    0x10005aa5
1000b2ca:	cc                   	int3
1000b2cb:	cc                   	int3
1000b2cc:	cc                   	int3
1000b2cd:	cc                   	int3
1000b2ce:	cc                   	int3
1000b2cf:	cc                   	int3
1000b2d0:	8b 4d f0             	mov    -0x10(%ebp),%ecx
1000b2d3:	83 c1 04             	add    $0x4,%ecx
1000b2d6:	e9 e5 6f ff ff       	jmp    0x100022c0
1000b2db:	b8 94 d8 00 10       	mov    $0x1000d894,%eax
1000b2e0:	e9 c0 a7 ff ff       	jmp    0x10005aa5
1000b2e5:	cc                   	int3
1000b2e6:	cc                   	int3
1000b2e7:	cc                   	int3
1000b2e8:	cc                   	int3
1000b2e9:	cc                   	int3
1000b2ea:	cc                   	int3
1000b2eb:	cc                   	int3
1000b2ec:	cc                   	int3
1000b2ed:	cc                   	int3
1000b2ee:	cc                   	int3
1000b2ef:	cc                   	int3
1000b2f0:	8b 4d f0             	mov    -0x10(%ebp),%ecx
1000b2f3:	83 c1 10             	add    $0x10,%ecx
1000b2f6:	e9 b5 8b ff ff       	jmp    0x10003eb0
1000b2fb:	b8 b8 d8 00 10       	mov    $0x1000d8b8,%eax
1000b300:	e9 a0 a7 ff ff       	jmp    0x10005aa5
1000b305:	cc                   	int3
1000b306:	cc                   	int3
1000b307:	cc                   	int3
1000b308:	cc                   	int3
1000b309:	cc                   	int3
1000b30a:	cc                   	int3
1000b30b:	cc                   	int3
1000b30c:	cc                   	int3
1000b30d:	cc                   	int3
1000b30e:	cc                   	int3
1000b30f:	cc                   	int3
1000b310:	8b 45 f0             	mov    -0x10(%ebp),%eax
1000b313:	50                   	push   %eax
1000b314:	e8 c4 a6 ff ff       	call   0x100059dd
1000b319:	59                   	pop    %ecx
1000b31a:	c3                   	ret
1000b31b:	b8 dc d8 00 10       	mov    $0x1000d8dc,%eax
1000b320:	e9 80 a7 ff ff       	jmp    0x10005aa5
1000b325:	cc                   	int3
1000b326:	cc                   	int3
1000b327:	cc                   	int3
1000b328:	cc                   	int3
1000b329:	cc                   	int3
1000b32a:	cc                   	int3
1000b32b:	cc                   	int3
1000b32c:	cc                   	int3
1000b32d:	cc                   	int3
1000b32e:	cc                   	int3
1000b32f:	cc                   	int3
1000b330:	8b 45 e4             	mov    -0x1c(%ebp),%eax
1000b333:	50                   	push   %eax
1000b334:	e8 a4 a6 ff ff       	call   0x100059dd
1000b339:	59                   	pop    %ecx
1000b33a:	c3                   	ret
1000b33b:	b8 00 d9 00 10       	mov    $0x1000d900,%eax
1000b340:	e9 60 a7 ff ff       	jmp    0x10005aa5
1000b345:	8d 4d d8             	lea    -0x28(%ebp),%ecx
1000b348:	e9 f3 61 ff ff       	jmp    0x10001540
1000b34d:	b8 60 d9 00 10       	mov    $0x1000d960,%eax
1000b352:	e9 4e a7 ff ff       	jmp    0x10005aa5
1000b357:	b9 10 fc 00 10       	mov    $0x1000fc10,%ecx
1000b35c:	e9 92 a2 ff ff       	jmp    0x100055f3
