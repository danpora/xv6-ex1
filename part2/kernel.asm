
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc d0 b5 10 80       	mov    $0x8010b5d0,%esp
8010002d:	b8 20 2f 10 80       	mov    $0x80102f20,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb 14 b6 10 80       	mov    $0x8010b614,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 c0 6f 10 80       	push   $0x80106fc0
80100051:	68 e0 b5 10 80       	push   $0x8010b5e0
80100056:	e8 45 42 00 00       	call   801042a0 <initlock>
8010005b:	c7 05 2c fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd2c
80100062:	fc 10 80 
80100065:	c7 05 30 fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd30
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba dc fc 10 80       	mov    $0x8010fcdc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
80100092:	68 c7 6f 10 80       	push   $0x80106fc7
80100097:	50                   	push   %eax
80100098:	e8 f3 40 00 00       	call   80104190 <initsleeplock>
8010009d:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000b0:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
801000b6:	3d dc fc 10 80       	cmp    $0x8010fcdc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 e0 b5 10 80       	push   $0x8010b5e0
801000e4:	e8 d7 41 00 00       	call   801042c0 <acquire>
801000e9:	8b 1d 30 fd 10 80    	mov    0x8010fd30,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100120:	8b 1d 2c fd 10 80    	mov    0x8010fd2c,%ebx
80100126:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 e0 b5 10 80       	push   $0x8010b5e0
80100162:	e8 39 43 00 00       	call   801044a0 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 5e 40 00 00       	call   801041d0 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 9d 1f 00 00       	call   80102120 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 ce 6f 10 80       	push   $0x80106fce
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 bd 40 00 00       	call   80104270 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 57 1f 00 00       	jmp    80102120 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 df 6f 10 80       	push   $0x80106fdf
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 7c 40 00 00       	call   80104270 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 2c 40 00 00       	call   80104230 <releasesleep>
80100204:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
8010020b:	e8 b0 40 00 00       	call   801042c0 <acquire>
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100213:	83 c4 10             	add    $0x10,%esp
80100216:	83 e8 01             	sub    $0x1,%eax
80100219:	85 c0                	test   %eax,%eax
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
80100232:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
80100237:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
80100241:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
80100249:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
8010024f:	c7 45 08 e0 b5 10 80 	movl   $0x8010b5e0,0x8(%ebp)
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
8010025c:	e9 3f 42 00 00       	jmp    801044a0 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 e6 6f 10 80       	push   $0x80106fe6
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010027f:	57                   	push   %edi
80100280:	e8 0b 15 00 00       	call   80101790 <iunlock>
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 2f 40 00 00       	call   801042c0 <acquire>
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
801002a1:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002a6:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 a5 10 80       	push   $0x8010a520
801002b8:	68 c0 ff 10 80       	push   $0x8010ffc0
801002bd:	e8 7e 3b 00 00       	call   80103e40 <sleep>
801002c2:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
801002d2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801002d8:	8b 40 24             	mov    0x24(%eax),%eax
801002db:	85 c0                	test   %eax,%eax
801002dd:	74 d1                	je     801002b0 <consoleread+0x40>
801002df:	83 ec 0c             	sub    $0xc,%esp
801002e2:	68 20 a5 10 80       	push   $0x8010a520
801002e7:	e8 b4 41 00 00       	call   801044a0 <release>
801002ec:	89 3c 24             	mov    %edi,(%esp)
801002ef:	e8 bc 13 00 00       	call   801016b0 <ilock>
801002f4:	83 c4 10             	add    $0x10,%esp
801002f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801002fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002ff:	5b                   	pop    %ebx
80100300:	5e                   	pop    %esi
80100301:	5f                   	pop    %edi
80100302:	5d                   	pop    %ebp
80100303:	c3                   	ret    
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 c0 ff 10 80    	mov    %edx,0x8010ffc0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 40 ff 10 80 	movsbl -0x7fef00c0(%edx),%edx
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
80100322:	83 c6 01             	add    $0x1,%esi
80100325:	83 eb 01             	sub    $0x1,%ebx
80100328:	83 fa 0a             	cmp    $0xa,%edx
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 a5 10 80       	push   $0x8010a520
80100346:	e8 55 41 00 00       	call   801044a0 <release>
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 5d 13 00 00       	call   801016b0 <ilock>
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a1                	jmp    801002fc <consoleread+0x8c>
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
80100360:	a3 c0 ff 10 80       	mov    %eax,0x8010ffc0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 38             	sub    $0x38,%esp
80100378:	fa                   	cli    
80100379:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010037f:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100386:	00 00 00 
80100389:	8d 5d d0             	lea    -0x30(%ebp),%ebx
8010038c:	8d 75 f8             	lea    -0x8(%ebp),%esi
8010038f:	0f b6 00             	movzbl (%eax),%eax
80100392:	50                   	push   %eax
80100393:	68 ed 6f 10 80       	push   $0x80106fed
80100398:	e8 c3 02 00 00       	call   80100660 <cprintf>
8010039d:	58                   	pop    %eax
8010039e:	ff 75 08             	pushl  0x8(%ebp)
801003a1:	e8 ba 02 00 00       	call   80100660 <cprintf>
801003a6:	c7 04 24 e6 74 10 80 	movl   $0x801074e6,(%esp)
801003ad:	e8 ae 02 00 00       	call   80100660 <cprintf>
801003b2:	5a                   	pop    %edx
801003b3:	8d 45 08             	lea    0x8(%ebp),%eax
801003b6:	59                   	pop    %ecx
801003b7:	53                   	push   %ebx
801003b8:	50                   	push   %eax
801003b9:	e8 d2 3f 00 00       	call   80104390 <getcallerpcs>
801003be:	83 c4 10             	add    $0x10,%esp
801003c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801003c8:	83 ec 08             	sub    $0x8,%esp
801003cb:	ff 33                	pushl  (%ebx)
801003cd:	83 c3 04             	add    $0x4,%ebx
801003d0:	68 09 70 10 80       	push   $0x80107009
801003d5:	e8 86 02 00 00       	call   80100660 <cprintf>
801003da:	83 c4 10             	add    $0x10,%esp
801003dd:	39 f3                	cmp    %esi,%ebx
801003df:	75 e7                	jne    801003c8 <panic+0x58>
801003e1:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003e8:	00 00 00 
801003eb:	eb fe                	jmp    801003eb <panic+0x7b>
801003ed:	8d 76 00             	lea    0x0(%esi),%esi

801003f0 <consputc>:
801003f0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 a1 57 00 00       	call   80105bc0 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
80100437:	0f b6 c0             	movzbl %al,%eax
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c1                	mov    %eax,%ecx
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
80100447:	89 f2                	mov    %esi,%edx
80100449:	ec                   	in     (%dx),%al
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 c8                	or     %ecx,%eax
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004ab:	89 f0                	mov    %esi,%eax
801004ad:	ee                   	out    %al,(%dx)
801004ae:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b3:	89 fa                	mov    %edi,%edx
801004b5:	ee                   	out    %al,(%dx)
801004b6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004bb:	89 d8                	mov    %ebx,%eax
801004bd:	ee                   	out    %al,(%dx)
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 01             	mov    %ax,(%ecx)
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 e8 56 00 00       	call   80105bc0 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 dc 56 00 00       	call   80105bc0 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 d0 56 00 00       	call   80105bc0 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>
801004f8:	83 ec 04             	sub    $0x4,%esp
801004fb:	8d 5f b0             	lea    -0x50(%edi),%ebx
801004fe:	68 60 0e 00 00       	push   $0xe60
80100503:	68 a0 80 0b 80       	push   $0x800b80a0
80100508:	68 00 80 0b 80       	push   $0x800b8000
8010050d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi
80100514:	e8 87 40 00 00       	call   801045a0 <memmove>
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 c2 3f 00 00       	call   801044f0 <memset>
8010052e:	89 f1                	mov    %esi,%ecx
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	be 07 00 00 00       	mov    $0x7,%esi
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 0d 70 10 80       	push   $0x8010700d
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
8010055a:	31 db                	xor    %ebx,%ebx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
80100563:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100568:	f7 ea                	imul   %edx
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	c1 e8 05             	shr    $0x5,%eax
8010056f:	8d 04 80             	lea    (%eax,%eax,4),%eax
80100572:	c1 e0 04             	shl    $0x4,%eax
80100575:	8d 78 50             	lea    0x50(%eax),%edi
80100578:	e9 f8 fe ff ff       	jmp    80100475 <consputc+0x85>
8010057d:	8d 76 00             	lea    0x0(%esi),%esi

80100580 <printint>:
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 2c             	sub    $0x2c,%esp
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
80100590:	74 0c                	je     8010059e <printint+0x1e>
80100592:	89 c7                	mov    %eax,%edi
80100594:	c1 ef 1f             	shr    $0x1f,%edi
80100597:	85 c0                	test   %eax,%eax
80100599:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010059c:	78 51                	js     801005ef <printint+0x6f>
8010059e:	31 ff                	xor    %edi,%edi
801005a0:	8d 5d d7             	lea    -0x29(%ebp),%ebx
801005a3:	eb 05                	jmp    801005aa <printint+0x2a>
801005a5:	8d 76 00             	lea    0x0(%esi),%esi
801005a8:	89 cf                	mov    %ecx,%edi
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 4f 01             	lea    0x1(%edi),%ecx
801005af:	f7 f6                	div    %esi
801005b1:	0f b6 92 38 70 10 80 	movzbl -0x7fef8fc8(%edx),%edx
801005b8:	85 c0                	test   %eax,%eax
801005ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
801005bd:	75 e9                	jne    801005a8 <printint+0x28>
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
801005c6:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005cb:	8d 4f 02             	lea    0x2(%edi),%ecx
801005ce:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005d8:	0f be 06             	movsbl (%esi),%eax
801005db:	83 ee 01             	sub    $0x1,%esi
801005de:	e8 0d fe ff ff       	call   801003f0 <consputc>
801005e3:	39 de                	cmp    %ebx,%esi
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
801005ef:	f7 d8                	neg    %eax
801005f1:	eb ab                	jmp    8010059e <printint+0x1e>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	ff 75 08             	pushl  0x8(%ebp)
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
8010060f:	e8 7c 11 00 00       	call   80101790 <iunlock>
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 a0 3c 00 00       	call   801042c0 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 54 3e 00 00       	call   801044a0 <release>
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 5b 10 00 00       	call   801016b0 <ilock>
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
8010066e:	85 c0                	test   %eax,%eax
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 a5 fe ff ff       	call   80100580 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
801006ee:	e8 fd fc ff ff       	call   801003f0 <consputc>
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 20 a5 10 80       	push   $0x8010a520
8010070d:	e8 8e 3d 00 00       	call   801044a0 <release>
80100712:	83 c4 10             	add    $0x10,%esp
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 42 fe ff ff       	call   80100580 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 9b fc ff ff       	call   801003f0 <consputc>
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 91 fc ff ff       	call   801003f0 <consputc>
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 7e fc ff ff       	call   801003f0 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100788:	b8 20 70 10 80       	mov    $0x80107020,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
801007a3:	e8 48 fc ff ff       	call   801003f0 <consputc>
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 20 a5 10 80       	push   $0x8010a520
801007c8:	e8 f3 3a 00 00       	call   801042c0 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 27 70 10 80       	push   $0x80107027
801007dd:	e8 8e fb ff ff       	call   80100370 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleintr>:
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	57                   	push   %edi
801007f4:	56                   	push   %esi
801007f5:	53                   	push   %ebx
801007f6:	31 f6                	xor    %esi,%esi
801007f8:	83 ec 18             	sub    $0x18,%esp
801007fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
801007fe:	68 20 a5 10 80       	push   $0x8010a520
80100803:	e8 b8 3a 00 00       	call   801042c0 <acquire>
80100808:	83 c4 10             	add    $0x10,%esp
8010080b:	90                   	nop
8010080c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100810:	ff d3                	call   *%ebx
80100812:	85 c0                	test   %eax,%eax
80100814:	89 c7                	mov    %eax,%edi
80100816:	78 48                	js     80100860 <consoleintr+0x70>
80100818:	83 ff 10             	cmp    $0x10,%edi
8010081b:	0f 84 3f 01 00 00    	je     80100960 <consoleintr+0x170>
80100821:	7e 5d                	jle    80100880 <consoleintr+0x90>
80100823:	83 ff 15             	cmp    $0x15,%edi
80100826:	0f 84 dc 00 00 00    	je     80100908 <consoleintr+0x118>
8010082c:	83 ff 7f             	cmp    $0x7f,%edi
8010082f:	75 54                	jne    80100885 <consoleintr+0x95>
80100831:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100836:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010083c:	74 d2                	je     80100810 <consoleintr+0x20>
8010083e:	83 e8 01             	sub    $0x1,%eax
80100841:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
80100846:	b8 00 01 00 00       	mov    $0x100,%eax
8010084b:	e8 a0 fb ff ff       	call   801003f0 <consputc>
80100850:	ff d3                	call   *%ebx
80100852:	85 c0                	test   %eax,%eax
80100854:	89 c7                	mov    %eax,%edi
80100856:	79 c0                	jns    80100818 <consoleintr+0x28>
80100858:	90                   	nop
80100859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100860:	83 ec 0c             	sub    $0xc,%esp
80100863:	68 20 a5 10 80       	push   $0x8010a520
80100868:	e8 33 3c 00 00       	call   801044a0 <release>
8010086d:	83 c4 10             	add    $0x10,%esp
80100870:	85 f6                	test   %esi,%esi
80100872:	0f 85 f8 00 00 00    	jne    80100970 <consoleintr+0x180>
80100878:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087b:	5b                   	pop    %ebx
8010087c:	5e                   	pop    %esi
8010087d:	5f                   	pop    %edi
8010087e:	5d                   	pop    %ebp
8010087f:	c3                   	ret    
80100880:	83 ff 08             	cmp    $0x8,%edi
80100883:	74 ac                	je     80100831 <consoleintr+0x41>
80100885:	85 ff                	test   %edi,%edi
80100887:	74 87                	je     80100810 <consoleintr+0x20>
80100889:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	2b 15 c0 ff 10 80    	sub    0x8010ffc0,%edx
80100896:	83 fa 7f             	cmp    $0x7f,%edx
80100899:	0f 87 71 ff ff ff    	ja     80100810 <consoleintr+0x20>
8010089f:	8d 50 01             	lea    0x1(%eax),%edx
801008a2:	83 e0 7f             	and    $0x7f,%eax
801008a5:	83 ff 0d             	cmp    $0xd,%edi
801008a8:	89 15 c8 ff 10 80    	mov    %edx,0x8010ffc8
801008ae:	0f 84 c8 00 00 00    	je     8010097c <consoleintr+0x18c>
801008b4:	89 f9                	mov    %edi,%ecx
801008b6:	88 88 40 ff 10 80    	mov    %cl,-0x7fef00c0(%eax)
801008bc:	89 f8                	mov    %edi,%eax
801008be:	e8 2d fb ff ff       	call   801003f0 <consputc>
801008c3:	83 ff 0a             	cmp    $0xa,%edi
801008c6:	0f 84 c1 00 00 00    	je     8010098d <consoleintr+0x19d>
801008cc:	83 ff 04             	cmp    $0x4,%edi
801008cf:	0f 84 b8 00 00 00    	je     8010098d <consoleintr+0x19d>
801008d5:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801008da:	83 e8 80             	sub    $0xffffff80,%eax
801008dd:	39 05 c8 ff 10 80    	cmp    %eax,0x8010ffc8
801008e3:	0f 85 27 ff ff ff    	jne    80100810 <consoleintr+0x20>
801008e9:	83 ec 0c             	sub    $0xc,%esp
801008ec:	a3 c4 ff 10 80       	mov    %eax,0x8010ffc4
801008f1:	68 c0 ff 10 80       	push   $0x8010ffc0
801008f6:	e8 e5 36 00 00       	call   80103fe0 <wakeup>
801008fb:	83 c4 10             	add    $0x10,%esp
801008fe:	e9 0d ff ff ff       	jmp    80100810 <consoleintr+0x20>
80100903:	90                   	nop
80100904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100908:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010090d:	39 05 c4 ff 10 80    	cmp    %eax,0x8010ffc4
80100913:	75 2b                	jne    80100940 <consoleintr+0x150>
80100915:	e9 f6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100920:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
80100925:	b8 00 01 00 00       	mov    $0x100,%eax
8010092a:	e8 c1 fa ff ff       	call   801003f0 <consputc>
8010092f:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100934:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010093a:	0f 84 d0 fe ff ff    	je     80100810 <consoleintr+0x20>
80100940:	83 e8 01             	sub    $0x1,%eax
80100943:	89 c2                	mov    %eax,%edx
80100945:	83 e2 7f             	and    $0x7f,%edx
80100948:	80 ba 40 ff 10 80 0a 	cmpb   $0xa,-0x7fef00c0(%edx)
8010094f:	75 cf                	jne    80100920 <consoleintr+0x130>
80100951:	e9 ba fe ff ff       	jmp    80100810 <consoleintr+0x20>
80100956:	8d 76 00             	lea    0x0(%esi),%esi
80100959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 a6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
80100977:	e9 54 37 00 00       	jmp    801040d0 <procdump>
8010097c:	c6 80 40 ff 10 80 0a 	movb   $0xa,-0x7fef00c0(%eax)
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 63 fa ff ff       	call   801003f0 <consputc>
8010098d:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100992:	e9 52 ff ff ff       	jmp    801008e9 <consoleintr+0xf9>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 10             	sub    $0x10,%esp
801009a6:	68 30 70 10 80       	push   $0x80107030
801009ab:	68 20 a5 10 80       	push   $0x8010a520
801009b0:	e8 eb 38 00 00       	call   801042a0 <initlock>
801009b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801009bc:	c7 05 8c 09 11 80 00 	movl   $0x80100600,0x8011098c
801009c3:	06 10 80 
801009c6:	c7 05 88 09 11 80 70 	movl   $0x80100270,0x80110988
801009cd:	02 10 80 
801009d0:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009d7:	00 00 00 
801009da:	e8 01 29 00 00       	call   801032e0 <picenable>
801009df:	58                   	pop    %eax
801009e0:	5a                   	pop    %edx
801009e1:	6a 00                	push   $0x0
801009e3:	6a 01                	push   $0x1
801009e5:	e8 f6 18 00 00       	call   801022e0 <ioapicenable>
801009ea:	83 c4 10             	add    $0x10,%esp
801009ed:	c9                   	leave  
801009ee:	c3                   	ret    
801009ef:	90                   	nop

801009f0 <exitf>:
#include "traps.h"

/* assembly function to push syscall to stack */
void
exitf()
{
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
  asm volatile ("push %eax;");
801009f3:	50                   	push   %eax
  asm volatile ("pop 4(%esp);");
801009f4:	8f 44 24 04          	popl   0x4(%esp)
  asm volatile ("movl %0 , %%eax" : : "i" (SYS_exit));
801009f8:	b8 02 00 00 00       	mov    $0x2,%eax
  asm volatile ("int %0" : : "i" (T_SYSCALL));
801009fd:	cd 40                	int    $0x40
}
801009ff:	5d                   	pop    %ebp
80100a00:	c3                   	ret    
80100a01:	eb 0d                	jmp    80100a10 <exec>
80100a03:	90                   	nop
80100a04:	90                   	nop
80100a05:	90                   	nop
80100a06:	90                   	nop
80100a07:	90                   	nop
80100a08:	90                   	nop
80100a09:	90                   	nop
80100a0a:	90                   	nop
80100a0b:	90                   	nop
80100a0c:	90                   	nop
80100a0d:	90                   	nop
80100a0e:	90                   	nop
80100a0f:	90                   	nop

80100a10 <exec>:

int
exec(char *path, char **argv)
{
80100a10:	55                   	push   %ebp
80100a11:	89 e5                	mov    %esp,%ebp
80100a13:	57                   	push   %edi
80100a14:	56                   	push   %esi
80100a15:	53                   	push   %ebx
80100a16:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  struct proghdr ph;
  /* exit syscall size (byte) */
  int exitsz = (int)exec - (int)exitf;
  pde_t *pgdir, *oldpgdir;

  begin_op();
80100a1c:	e8 ef 21 00 00       	call   80102c10 <begin_op>

  if((ip = namei(path)) == 0){
80100a21:	83 ec 0c             	sub    $0xc,%esp
80100a24:	ff 75 08             	pushl  0x8(%ebp)
80100a27:	e8 b4 14 00 00       	call   80101ee0 <namei>
80100a2c:	83 c4 10             	add    $0x10,%esp
80100a2f:	85 c0                	test   %eax,%eax
80100a31:	0f 84 a3 01 00 00    	je     80100bda <exec+0x1ca>
    end_op();
    return -1;
  }
  ilock(ip);
80100a37:	83 ec 0c             	sub    $0xc,%esp
80100a3a:	89 c3                	mov    %eax,%ebx
80100a3c:	50                   	push   %eax
80100a3d:	e8 6e 0c 00 00       	call   801016b0 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
80100a42:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a48:	6a 34                	push   $0x34
80100a4a:	6a 00                	push   $0x0
80100a4c:	50                   	push   %eax
80100a4d:	53                   	push   %ebx
80100a4e:	e8 1d 0f 00 00       	call   80101970 <readi>
80100a53:	83 c4 20             	add    $0x20,%esp
80100a56:	83 f8 33             	cmp    $0x33,%eax
80100a59:	77 25                	ja     80100a80 <exec+0x70>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a5b:	83 ec 0c             	sub    $0xc,%esp
80100a5e:	53                   	push   %ebx
80100a5f:	e8 bc 0e 00 00       	call   80101920 <iunlockput>
    end_op();
80100a64:	e8 17 22 00 00       	call   80102c80 <end_op>
80100a69:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100a6c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a71:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a74:	5b                   	pop    %ebx
80100a75:	5e                   	pop    %esi
80100a76:	5f                   	pop    %edi
80100a77:	5d                   	pop    %ebp
80100a78:	c3                   	ret    
80100a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100a80:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a87:	45 4c 46 
80100a8a:	75 cf                	jne    80100a5b <exec+0x4b>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100a8c:	e8 ef 5e 00 00       	call   80106980 <setupkvm>
80100a91:	85 c0                	test   %eax,%eax
80100a93:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a99:	74 c0                	je     80100a5b <exec+0x4b>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a9b:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100aa2:	00 
80100aa3:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100aa9:	0f 84 d1 02 00 00    	je     80100d80 <exec+0x370>
80100aaf:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100ab6:	00 00 00 
80100ab9:	31 ff                	xor    %edi,%edi
80100abb:	eb 18                	jmp    80100ad5 <exec+0xc5>
80100abd:	8d 76 00             	lea    0x0(%esi),%esi
80100ac0:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100ac7:	83 c7 01             	add    $0x1,%edi
80100aca:	83 c6 20             	add    $0x20,%esi
80100acd:	39 f8                	cmp    %edi,%eax
80100acf:	0f 8e ab 00 00 00    	jle    80100b80 <exec+0x170>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100ad5:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100adb:	6a 20                	push   $0x20
80100add:	56                   	push   %esi
80100ade:	50                   	push   %eax
80100adf:	53                   	push   %ebx
80100ae0:	e8 8b 0e 00 00       	call   80101970 <readi>
80100ae5:	83 c4 10             	add    $0x10,%esp
80100ae8:	83 f8 20             	cmp    $0x20,%eax
80100aeb:	75 7b                	jne    80100b68 <exec+0x158>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100aed:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100af4:	75 ca                	jne    80100ac0 <exec+0xb0>
      continue;
    if(ph.memsz < ph.filesz)
80100af6:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100afc:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100b02:	72 64                	jb     80100b68 <exec+0x158>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100b04:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100b0a:	72 5c                	jb     80100b68 <exec+0x158>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100b0c:	83 ec 04             	sub    $0x4,%esp
80100b0f:	50                   	push   %eax
80100b10:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b16:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b1c:	e8 ef 60 00 00       	call   80106c10 <allocuvm>
80100b21:	83 c4 10             	add    $0x10,%esp
80100b24:	85 c0                	test   %eax,%eax
80100b26:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100b2c:	74 3a                	je     80100b68 <exec+0x158>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100b2e:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b34:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b39:	75 2d                	jne    80100b68 <exec+0x158>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b3b:	83 ec 0c             	sub    $0xc,%esp
80100b3e:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b44:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b4a:	53                   	push   %ebx
80100b4b:	50                   	push   %eax
80100b4c:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b52:	e8 f9 5f 00 00       	call   80106b50 <loaduvm>
80100b57:	83 c4 20             	add    $0x20,%esp
80100b5a:	85 c0                	test   %eax,%eax
80100b5c:	0f 89 5e ff ff ff    	jns    80100ac0 <exec+0xb0>
80100b62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b68:	83 ec 0c             	sub    $0xc,%esp
80100b6b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b71:	e8 ca 61 00 00       	call   80106d40 <freevm>
80100b76:	83 c4 10             	add    $0x10,%esp
80100b79:	e9 dd fe ff ff       	jmp    80100a5b <exec+0x4b>
80100b7e:	66 90                	xchg   %ax,%ax
80100b80:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100b86:	81 c6 ff 0f 00 00    	add    $0xfff,%esi
80100b8c:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80100b92:	8d be 00 20 00 00    	lea    0x2000(%esi),%edi
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100b98:	83 ec 0c             	sub    $0xc,%esp
80100b9b:	53                   	push   %ebx
80100b9c:	e8 7f 0d 00 00       	call   80101920 <iunlockput>
  end_op();
80100ba1:	e8 da 20 00 00       	call   80102c80 <end_op>
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100ba6:	83 c4 0c             	add    $0xc,%esp
80100ba9:	57                   	push   %edi
80100baa:	56                   	push   %esi
80100bab:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100bb1:	e8 5a 60 00 00       	call   80106c10 <allocuvm>
80100bb6:	83 c4 10             	add    $0x10,%esp
80100bb9:	85 c0                	test   %eax,%eax
80100bbb:	89 c6                	mov    %eax,%esi
80100bbd:	75 2a                	jne    80100be9 <exec+0x1d9>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100bbf:	83 ec 0c             	sub    $0xc,%esp
80100bc2:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100bc8:	e8 73 61 00 00       	call   80106d40 <freevm>
80100bcd:	83 c4 10             	add    $0x10,%esp
  if(ip){
    iunlockput(ip);
    end_op();
  }
  return -1;
80100bd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bd5:	e9 97 fe ff ff       	jmp    80100a71 <exec+0x61>
  pde_t *pgdir, *oldpgdir;

  begin_op();

  if((ip = namei(path)) == 0){
    end_op();
80100bda:	e8 a1 20 00 00       	call   80102c80 <end_op>
    return -1;
80100bdf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100be4:	e9 88 fe ff ff       	jmp    80100a71 <exec+0x61>
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100be9:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bef:	83 ec 08             	sub    $0x8,%esp
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bf2:	31 ff                	xor    %edi,%edi
80100bf4:	89 f3                	mov    %esi,%ebx
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bf6:	50                   	push   %eax
80100bf7:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100bfd:	e8 be 61 00 00       	call   80106dc0 <clearpteu>
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c02:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c05:	83 c4 10             	add    $0x10,%esp
80100c08:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c0e:	8b 00                	mov    (%eax),%eax
80100c10:	85 c0                	test   %eax,%eax
80100c12:	74 71                	je     80100c85 <exec+0x275>
80100c14:	89 b5 f0 fe ff ff    	mov    %esi,-0x110(%ebp)
80100c1a:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100c20:	eb 0b                	jmp    80100c2d <exec+0x21d>
80100c22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(argc >= MAXARG)
80100c28:	83 ff 20             	cmp    $0x20,%edi
80100c2b:	74 92                	je     80100bbf <exec+0x1af>
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c2d:	83 ec 0c             	sub    $0xc,%esp
80100c30:	50                   	push   %eax
80100c31:	e8 fa 3a 00 00       	call   80104730 <strlen>
80100c36:	f7 d0                	not    %eax
80100c38:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c3a:	58                   	pop    %eax
80100c3b:	8b 45 0c             	mov    0xc(%ebp),%eax

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c3e:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c41:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c44:	e8 e7 3a 00 00       	call   80104730 <strlen>
80100c49:	83 c0 01             	add    $0x1,%eax
80100c4c:	50                   	push   %eax
80100c4d:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c50:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c53:	53                   	push   %ebx
80100c54:	56                   	push   %esi
80100c55:	e8 c6 62 00 00       	call   80106f20 <copyout>
80100c5a:	83 c4 20             	add    $0x20,%esp
80100c5d:	85 c0                	test   %eax,%eax
80100c5f:	0f 88 5a ff ff ff    	js     80100bbf <exec+0x1af>
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c65:	8b 45 0c             	mov    0xc(%ebp),%eax
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c68:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c6f:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c72:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c78:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c7b:	85 c0                	test   %eax,%eax
80100c7d:	75 a9                	jne    80100c28 <exec+0x218>
80100c7f:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  /* stack pointer update */
  sp = sz - exitsz;
80100c85:	b8 10 0a 10 80       	mov    $0x80100a10,%eax
80100c8a:	89 f3                	mov    %esi,%ebx
80100c8c:	89 95 f0 fe ff ff    	mov    %edx,-0x110(%ebp)
80100c92:	2d f0 09 10 80       	sub    $0x801009f0,%eax
80100c97:	29 c3                	sub    %eax,%ebx
  /* copy page from sp to exitf */
  copyout(pgdir,sp,exitf,exitsz);
80100c99:	50                   	push   %eax
80100c9a:	68 f0 09 10 80       	push   $0x801009f0
80100c9f:	53                   	push   %ebx
80100ca0:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100ca6:	e8 75 62 00 00       	call   80106f20 <copyout>
  ustack[3+argc] = 0;

  /* return address of user space program */
  ustack[0] = sz - exitsz;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cab:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100cb2:	89 d9                	mov    %ebx,%ecx


  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cb4:	8b 95 f0 fe ff ff    	mov    -0x110(%ebp),%edx
  /* stack pointer update */
  sp = sz - exitsz;
  /* copy page from sp to exitf */
  copyout(pgdir,sp,exitf,exitsz);

  ustack[3+argc] = 0;
80100cba:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100cc1:	00 00 00 00 

  /* return address of user space program */
  ustack[0] = sz - exitsz;  // fake return PC
80100cc5:	89 9d 58 ff ff ff    	mov    %ebx,-0xa8(%ebp)
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100ccb:	29 c1                	sub    %eax,%ecx


  sp -= (3+argc+1) * 4;
80100ccd:	83 c0 0c             	add    $0xc,%eax

  ustack[3+argc] = 0;

  /* return address of user space program */
  ustack[0] = sz - exitsz;  // fake return PC
  ustack[1] = argc;
80100cd0:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer


  sp -= (3+argc+1) * 4;
80100cd6:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cd8:	50                   	push   %eax
80100cd9:	52                   	push   %edx
80100cda:	53                   	push   %ebx
80100cdb:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
  ustack[3+argc] = 0;

  /* return address of user space program */
  ustack[0] = sz - exitsz;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100ce1:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)


  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100ce7:	e8 34 62 00 00       	call   80106f20 <copyout>
80100cec:	83 c4 20             	add    $0x20,%esp
80100cef:	85 c0                	test   %eax,%eax
80100cf1:	0f 88 c8 fe ff ff    	js     80100bbf <exec+0x1af>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cf7:	8b 45 08             	mov    0x8(%ebp),%eax
80100cfa:	0f b6 10             	movzbl (%eax),%edx
80100cfd:	84 d2                	test   %dl,%dl
80100cff:	74 22                	je     80100d23 <exec+0x313>
80100d01:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100d04:	83 c0 01             	add    $0x1,%eax
80100d07:	89 f6                	mov    %esi,%esi
80100d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(*s == '/')
      last = s+1;
80100d10:	80 fa 2f             	cmp    $0x2f,%dl
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100d13:	0f b6 10             	movzbl (%eax),%edx
    if(*s == '/')
      last = s+1;
80100d16:	0f 44 c8             	cmove  %eax,%ecx
80100d19:	83 c0 01             	add    $0x1,%eax
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100d1c:	84 d2                	test   %dl,%dl
80100d1e:	75 f0                	jne    80100d10 <exec+0x300>
80100d20:	89 4d 08             	mov    %ecx,0x8(%ebp)
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));
80100d23:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100d29:	83 ec 04             	sub    $0x4,%esp
80100d2c:	6a 10                	push   $0x10
80100d2e:	ff 75 08             	pushl  0x8(%ebp)
80100d31:	83 c0 6c             	add    $0x6c,%eax
80100d34:	50                   	push   %eax
80100d35:	e8 b6 39 00 00       	call   801046f0 <safestrcpy>

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100d3a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  proc->pgdir = pgdir;
80100d40:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100d46:	8b 78 04             	mov    0x4(%eax),%edi
  proc->pgdir = pgdir;
  proc->sz = sz;
80100d49:	89 30                	mov    %esi,(%eax)
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));

  // Commit to the user image.
  oldpgdir = proc->pgdir;
  proc->pgdir = pgdir;
80100d4b:	89 48 04             	mov    %ecx,0x4(%eax)
  proc->sz = sz;
  proc->tf->eip = elf.entry;  // main
80100d4e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100d54:	8b 8d 3c ff ff ff    	mov    -0xc4(%ebp),%ecx
80100d5a:	8b 50 18             	mov    0x18(%eax),%edx
80100d5d:	89 4a 38             	mov    %ecx,0x38(%edx)
  proc->tf->esp = sp;
80100d60:	8b 50 18             	mov    0x18(%eax),%edx
80100d63:	89 5a 44             	mov    %ebx,0x44(%edx)
  switchuvm(proc);
80100d66:	89 04 24             	mov    %eax,(%esp)
80100d69:	e8 c2 5c 00 00       	call   80106a30 <switchuvm>
  freevm(oldpgdir);
80100d6e:	89 3c 24             	mov    %edi,(%esp)
80100d71:	e8 ca 5f 00 00       	call   80106d40 <freevm>
  return 0;
80100d76:	83 c4 10             	add    $0x10,%esp
80100d79:	31 c0                	xor    %eax,%eax
80100d7b:	e9 f1 fc ff ff       	jmp    80100a71 <exec+0x61>
  if((pgdir = setupkvm()) == 0)
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100d80:	bf 00 20 00 00       	mov    $0x2000,%edi
80100d85:	31 f6                	xor    %esi,%esi
80100d87:	e9 0c fe ff ff       	jmp    80100b98 <exec+0x188>
80100d8c:	66 90                	xchg   %ax,%ax
80100d8e:	66 90                	xchg   %ax,%ax

80100d90 <fileinit>:
80100d90:	55                   	push   %ebp
80100d91:	89 e5                	mov    %esp,%ebp
80100d93:	83 ec 10             	sub    $0x10,%esp
80100d96:	68 49 70 10 80       	push   $0x80107049
80100d9b:	68 e0 ff 10 80       	push   $0x8010ffe0
80100da0:	e8 fb 34 00 00       	call   801042a0 <initlock>
80100da5:	83 c4 10             	add    $0x10,%esp
80100da8:	c9                   	leave  
80100da9:	c3                   	ret    
80100daa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100db0 <filealloc>:
80100db0:	55                   	push   %ebp
80100db1:	89 e5                	mov    %esp,%ebp
80100db3:	53                   	push   %ebx
80100db4:	bb 14 00 11 80       	mov    $0x80110014,%ebx
80100db9:	83 ec 10             	sub    $0x10,%esp
80100dbc:	68 e0 ff 10 80       	push   $0x8010ffe0
80100dc1:	e8 fa 34 00 00       	call   801042c0 <acquire>
80100dc6:	83 c4 10             	add    $0x10,%esp
80100dc9:	eb 10                	jmp    80100ddb <filealloc+0x2b>
80100dcb:	90                   	nop
80100dcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100dd0:	83 c3 18             	add    $0x18,%ebx
80100dd3:	81 fb 74 09 11 80    	cmp    $0x80110974,%ebx
80100dd9:	74 25                	je     80100e00 <filealloc+0x50>
80100ddb:	8b 43 04             	mov    0x4(%ebx),%eax
80100dde:	85 c0                	test   %eax,%eax
80100de0:	75 ee                	jne    80100dd0 <filealloc+0x20>
80100de2:	83 ec 0c             	sub    $0xc,%esp
80100de5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100dec:	68 e0 ff 10 80       	push   $0x8010ffe0
80100df1:	e8 aa 36 00 00       	call   801044a0 <release>
80100df6:	89 d8                	mov    %ebx,%eax
80100df8:	83 c4 10             	add    $0x10,%esp
80100dfb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dfe:	c9                   	leave  
80100dff:	c3                   	ret    
80100e00:	83 ec 0c             	sub    $0xc,%esp
80100e03:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e08:	e8 93 36 00 00       	call   801044a0 <release>
80100e0d:	83 c4 10             	add    $0x10,%esp
80100e10:	31 c0                	xor    %eax,%eax
80100e12:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e15:	c9                   	leave  
80100e16:	c3                   	ret    
80100e17:	89 f6                	mov    %esi,%esi
80100e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e20 <filedup>:
80100e20:	55                   	push   %ebp
80100e21:	89 e5                	mov    %esp,%ebp
80100e23:	53                   	push   %ebx
80100e24:	83 ec 10             	sub    $0x10,%esp
80100e27:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100e2a:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e2f:	e8 8c 34 00 00       	call   801042c0 <acquire>
80100e34:	8b 43 04             	mov    0x4(%ebx),%eax
80100e37:	83 c4 10             	add    $0x10,%esp
80100e3a:	85 c0                	test   %eax,%eax
80100e3c:	7e 1a                	jle    80100e58 <filedup+0x38>
80100e3e:	83 c0 01             	add    $0x1,%eax
80100e41:	83 ec 0c             	sub    $0xc,%esp
80100e44:	89 43 04             	mov    %eax,0x4(%ebx)
80100e47:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e4c:	e8 4f 36 00 00       	call   801044a0 <release>
80100e51:	89 d8                	mov    %ebx,%eax
80100e53:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e56:	c9                   	leave  
80100e57:	c3                   	ret    
80100e58:	83 ec 0c             	sub    $0xc,%esp
80100e5b:	68 50 70 10 80       	push   $0x80107050
80100e60:	e8 0b f5 ff ff       	call   80100370 <panic>
80100e65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e70 <fileclose>:
80100e70:	55                   	push   %ebp
80100e71:	89 e5                	mov    %esp,%ebp
80100e73:	57                   	push   %edi
80100e74:	56                   	push   %esi
80100e75:	53                   	push   %ebx
80100e76:	83 ec 28             	sub    $0x28,%esp
80100e79:	8b 7d 08             	mov    0x8(%ebp),%edi
80100e7c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e81:	e8 3a 34 00 00       	call   801042c0 <acquire>
80100e86:	8b 47 04             	mov    0x4(%edi),%eax
80100e89:	83 c4 10             	add    $0x10,%esp
80100e8c:	85 c0                	test   %eax,%eax
80100e8e:	0f 8e 9b 00 00 00    	jle    80100f2f <fileclose+0xbf>
80100e94:	83 e8 01             	sub    $0x1,%eax
80100e97:	85 c0                	test   %eax,%eax
80100e99:	89 47 04             	mov    %eax,0x4(%edi)
80100e9c:	74 1a                	je     80100eb8 <fileclose+0x48>
80100e9e:	c7 45 08 e0 ff 10 80 	movl   $0x8010ffe0,0x8(%ebp)
80100ea5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ea8:	5b                   	pop    %ebx
80100ea9:	5e                   	pop    %esi
80100eaa:	5f                   	pop    %edi
80100eab:	5d                   	pop    %ebp
80100eac:	e9 ef 35 00 00       	jmp    801044a0 <release>
80100eb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100eb8:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100ebc:	8b 1f                	mov    (%edi),%ebx
80100ebe:	83 ec 0c             	sub    $0xc,%esp
80100ec1:	8b 77 0c             	mov    0xc(%edi),%esi
80100ec4:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80100eca:	88 45 e7             	mov    %al,-0x19(%ebp)
80100ecd:	8b 47 10             	mov    0x10(%edi),%eax
80100ed0:	68 e0 ff 10 80       	push   $0x8010ffe0
80100ed5:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100ed8:	e8 c3 35 00 00       	call   801044a0 <release>
80100edd:	83 c4 10             	add    $0x10,%esp
80100ee0:	83 fb 01             	cmp    $0x1,%ebx
80100ee3:	74 13                	je     80100ef8 <fileclose+0x88>
80100ee5:	83 fb 02             	cmp    $0x2,%ebx
80100ee8:	74 26                	je     80100f10 <fileclose+0xa0>
80100eea:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100eed:	5b                   	pop    %ebx
80100eee:	5e                   	pop    %esi
80100eef:	5f                   	pop    %edi
80100ef0:	5d                   	pop    %ebp
80100ef1:	c3                   	ret    
80100ef2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100ef8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100efc:	83 ec 08             	sub    $0x8,%esp
80100eff:	53                   	push   %ebx
80100f00:	56                   	push   %esi
80100f01:	e8 aa 25 00 00       	call   801034b0 <pipeclose>
80100f06:	83 c4 10             	add    $0x10,%esp
80100f09:	eb df                	jmp    80100eea <fileclose+0x7a>
80100f0b:	90                   	nop
80100f0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100f10:	e8 fb 1c 00 00       	call   80102c10 <begin_op>
80100f15:	83 ec 0c             	sub    $0xc,%esp
80100f18:	ff 75 e0             	pushl  -0x20(%ebp)
80100f1b:	e8 c0 08 00 00       	call   801017e0 <iput>
80100f20:	83 c4 10             	add    $0x10,%esp
80100f23:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f26:	5b                   	pop    %ebx
80100f27:	5e                   	pop    %esi
80100f28:	5f                   	pop    %edi
80100f29:	5d                   	pop    %ebp
80100f2a:	e9 51 1d 00 00       	jmp    80102c80 <end_op>
80100f2f:	83 ec 0c             	sub    $0xc,%esp
80100f32:	68 58 70 10 80       	push   $0x80107058
80100f37:	e8 34 f4 ff ff       	call   80100370 <panic>
80100f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f40 <filestat>:
80100f40:	55                   	push   %ebp
80100f41:	89 e5                	mov    %esp,%ebp
80100f43:	53                   	push   %ebx
80100f44:	83 ec 04             	sub    $0x4,%esp
80100f47:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f4a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f4d:	75 31                	jne    80100f80 <filestat+0x40>
80100f4f:	83 ec 0c             	sub    $0xc,%esp
80100f52:	ff 73 10             	pushl  0x10(%ebx)
80100f55:	e8 56 07 00 00       	call   801016b0 <ilock>
80100f5a:	58                   	pop    %eax
80100f5b:	5a                   	pop    %edx
80100f5c:	ff 75 0c             	pushl  0xc(%ebp)
80100f5f:	ff 73 10             	pushl  0x10(%ebx)
80100f62:	e8 d9 09 00 00       	call   80101940 <stati>
80100f67:	59                   	pop    %ecx
80100f68:	ff 73 10             	pushl  0x10(%ebx)
80100f6b:	e8 20 08 00 00       	call   80101790 <iunlock>
80100f70:	83 c4 10             	add    $0x10,%esp
80100f73:	31 c0                	xor    %eax,%eax
80100f75:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f78:	c9                   	leave  
80100f79:	c3                   	ret    
80100f7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f85:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f88:	c9                   	leave  
80100f89:	c3                   	ret    
80100f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f90 <fileread>:
80100f90:	55                   	push   %ebp
80100f91:	89 e5                	mov    %esp,%ebp
80100f93:	57                   	push   %edi
80100f94:	56                   	push   %esi
80100f95:	53                   	push   %ebx
80100f96:	83 ec 0c             	sub    $0xc,%esp
80100f99:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f9c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f9f:	8b 7d 10             	mov    0x10(%ebp),%edi
80100fa2:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100fa6:	74 60                	je     80101008 <fileread+0x78>
80100fa8:	8b 03                	mov    (%ebx),%eax
80100faa:	83 f8 01             	cmp    $0x1,%eax
80100fad:	74 41                	je     80100ff0 <fileread+0x60>
80100faf:	83 f8 02             	cmp    $0x2,%eax
80100fb2:	75 5b                	jne    8010100f <fileread+0x7f>
80100fb4:	83 ec 0c             	sub    $0xc,%esp
80100fb7:	ff 73 10             	pushl  0x10(%ebx)
80100fba:	e8 f1 06 00 00       	call   801016b0 <ilock>
80100fbf:	57                   	push   %edi
80100fc0:	ff 73 14             	pushl  0x14(%ebx)
80100fc3:	56                   	push   %esi
80100fc4:	ff 73 10             	pushl  0x10(%ebx)
80100fc7:	e8 a4 09 00 00       	call   80101970 <readi>
80100fcc:	83 c4 20             	add    $0x20,%esp
80100fcf:	85 c0                	test   %eax,%eax
80100fd1:	89 c6                	mov    %eax,%esi
80100fd3:	7e 03                	jle    80100fd8 <fileread+0x48>
80100fd5:	01 43 14             	add    %eax,0x14(%ebx)
80100fd8:	83 ec 0c             	sub    $0xc,%esp
80100fdb:	ff 73 10             	pushl  0x10(%ebx)
80100fde:	e8 ad 07 00 00       	call   80101790 <iunlock>
80100fe3:	83 c4 10             	add    $0x10,%esp
80100fe6:	89 f0                	mov    %esi,%eax
80100fe8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100feb:	5b                   	pop    %ebx
80100fec:	5e                   	pop    %esi
80100fed:	5f                   	pop    %edi
80100fee:	5d                   	pop    %ebp
80100fef:	c3                   	ret    
80100ff0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100ff3:	89 45 08             	mov    %eax,0x8(%ebp)
80100ff6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ff9:	5b                   	pop    %ebx
80100ffa:	5e                   	pop    %esi
80100ffb:	5f                   	pop    %edi
80100ffc:	5d                   	pop    %ebp
80100ffd:	e9 7e 26 00 00       	jmp    80103680 <piperead>
80101002:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101008:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010100d:	eb d9                	jmp    80100fe8 <fileread+0x58>
8010100f:	83 ec 0c             	sub    $0xc,%esp
80101012:	68 62 70 10 80       	push   $0x80107062
80101017:	e8 54 f3 ff ff       	call   80100370 <panic>
8010101c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101020 <filewrite>:
80101020:	55                   	push   %ebp
80101021:	89 e5                	mov    %esp,%ebp
80101023:	57                   	push   %edi
80101024:	56                   	push   %esi
80101025:	53                   	push   %ebx
80101026:	83 ec 1c             	sub    $0x1c,%esp
80101029:	8b 75 08             	mov    0x8(%ebp),%esi
8010102c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010102f:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80101033:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101036:	8b 45 10             	mov    0x10(%ebp),%eax
80101039:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010103c:	0f 84 aa 00 00 00    	je     801010ec <filewrite+0xcc>
80101042:	8b 06                	mov    (%esi),%eax
80101044:	83 f8 01             	cmp    $0x1,%eax
80101047:	0f 84 c2 00 00 00    	je     8010110f <filewrite+0xef>
8010104d:	83 f8 02             	cmp    $0x2,%eax
80101050:	0f 85 d8 00 00 00    	jne    8010112e <filewrite+0x10e>
80101056:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101059:	31 ff                	xor    %edi,%edi
8010105b:	85 c0                	test   %eax,%eax
8010105d:	7f 34                	jg     80101093 <filewrite+0x73>
8010105f:	e9 9c 00 00 00       	jmp    80101100 <filewrite+0xe0>
80101064:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101068:	01 46 14             	add    %eax,0x14(%esi)
8010106b:	83 ec 0c             	sub    $0xc,%esp
8010106e:	ff 76 10             	pushl  0x10(%esi)
80101071:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101074:	e8 17 07 00 00       	call   80101790 <iunlock>
80101079:	e8 02 1c 00 00       	call   80102c80 <end_op>
8010107e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101081:	83 c4 10             	add    $0x10,%esp
80101084:	39 d8                	cmp    %ebx,%eax
80101086:	0f 85 95 00 00 00    	jne    80101121 <filewrite+0x101>
8010108c:	01 c7                	add    %eax,%edi
8010108e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101091:	7e 6d                	jle    80101100 <filewrite+0xe0>
80101093:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101096:	b8 00 1a 00 00       	mov    $0x1a00,%eax
8010109b:	29 fb                	sub    %edi,%ebx
8010109d:	81 fb 00 1a 00 00    	cmp    $0x1a00,%ebx
801010a3:	0f 4f d8             	cmovg  %eax,%ebx
801010a6:	e8 65 1b 00 00       	call   80102c10 <begin_op>
801010ab:	83 ec 0c             	sub    $0xc,%esp
801010ae:	ff 76 10             	pushl  0x10(%esi)
801010b1:	e8 fa 05 00 00       	call   801016b0 <ilock>
801010b6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801010b9:	53                   	push   %ebx
801010ba:	ff 76 14             	pushl  0x14(%esi)
801010bd:	01 f8                	add    %edi,%eax
801010bf:	50                   	push   %eax
801010c0:	ff 76 10             	pushl  0x10(%esi)
801010c3:	e8 a8 09 00 00       	call   80101a70 <writei>
801010c8:	83 c4 20             	add    $0x20,%esp
801010cb:	85 c0                	test   %eax,%eax
801010cd:	7f 99                	jg     80101068 <filewrite+0x48>
801010cf:	83 ec 0c             	sub    $0xc,%esp
801010d2:	ff 76 10             	pushl  0x10(%esi)
801010d5:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010d8:	e8 b3 06 00 00       	call   80101790 <iunlock>
801010dd:	e8 9e 1b 00 00       	call   80102c80 <end_op>
801010e2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010e5:	83 c4 10             	add    $0x10,%esp
801010e8:	85 c0                	test   %eax,%eax
801010ea:	74 98                	je     80101084 <filewrite+0x64>
801010ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801010f4:	5b                   	pop    %ebx
801010f5:	5e                   	pop    %esi
801010f6:	5f                   	pop    %edi
801010f7:	5d                   	pop    %ebp
801010f8:	c3                   	ret    
801010f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101100:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
80101103:	75 e7                	jne    801010ec <filewrite+0xcc>
80101105:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101108:	89 f8                	mov    %edi,%eax
8010110a:	5b                   	pop    %ebx
8010110b:	5e                   	pop    %esi
8010110c:	5f                   	pop    %edi
8010110d:	5d                   	pop    %ebp
8010110e:	c3                   	ret    
8010110f:	8b 46 0c             	mov    0xc(%esi),%eax
80101112:	89 45 08             	mov    %eax,0x8(%ebp)
80101115:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101118:	5b                   	pop    %ebx
80101119:	5e                   	pop    %esi
8010111a:	5f                   	pop    %edi
8010111b:	5d                   	pop    %ebp
8010111c:	e9 2f 24 00 00       	jmp    80103550 <pipewrite>
80101121:	83 ec 0c             	sub    $0xc,%esp
80101124:	68 6b 70 10 80       	push   $0x8010706b
80101129:	e8 42 f2 ff ff       	call   80100370 <panic>
8010112e:	83 ec 0c             	sub    $0xc,%esp
80101131:	68 71 70 10 80       	push   $0x80107071
80101136:	e8 35 f2 ff ff       	call   80100370 <panic>
8010113b:	66 90                	xchg   %ax,%ax
8010113d:	66 90                	xchg   %ax,%ax
8010113f:	90                   	nop

80101140 <balloc>:
80101140:	55                   	push   %ebp
80101141:	89 e5                	mov    %esp,%ebp
80101143:	57                   	push   %edi
80101144:	56                   	push   %esi
80101145:	53                   	push   %ebx
80101146:	83 ec 1c             	sub    $0x1c,%esp
80101149:	8b 0d e0 09 11 80    	mov    0x801109e0,%ecx
8010114f:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101152:	85 c9                	test   %ecx,%ecx
80101154:	0f 84 85 00 00 00    	je     801011df <balloc+0x9f>
8010115a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80101161:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101164:	83 ec 08             	sub    $0x8,%esp
80101167:	89 f0                	mov    %esi,%eax
80101169:	c1 f8 0c             	sar    $0xc,%eax
8010116c:	03 05 f8 09 11 80    	add    0x801109f8,%eax
80101172:	50                   	push   %eax
80101173:	ff 75 d8             	pushl  -0x28(%ebp)
80101176:	e8 55 ef ff ff       	call   801000d0 <bread>
8010117b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010117e:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101183:	83 c4 10             	add    $0x10,%esp
80101186:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101189:	31 c0                	xor    %eax,%eax
8010118b:	eb 2d                	jmp    801011ba <balloc+0x7a>
8010118d:	8d 76 00             	lea    0x0(%esi),%esi
80101190:	89 c1                	mov    %eax,%ecx
80101192:	ba 01 00 00 00       	mov    $0x1,%edx
80101197:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
8010119a:	83 e1 07             	and    $0x7,%ecx
8010119d:	d3 e2                	shl    %cl,%edx
8010119f:	89 c1                	mov    %eax,%ecx
801011a1:	c1 f9 03             	sar    $0x3,%ecx
801011a4:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
801011a9:	85 d7                	test   %edx,%edi
801011ab:	74 43                	je     801011f0 <balloc+0xb0>
801011ad:	83 c0 01             	add    $0x1,%eax
801011b0:	83 c6 01             	add    $0x1,%esi
801011b3:	3d 00 10 00 00       	cmp    $0x1000,%eax
801011b8:	74 05                	je     801011bf <balloc+0x7f>
801011ba:	3b 75 e0             	cmp    -0x20(%ebp),%esi
801011bd:	72 d1                	jb     80101190 <balloc+0x50>
801011bf:	83 ec 0c             	sub    $0xc,%esp
801011c2:	ff 75 e4             	pushl  -0x1c(%ebp)
801011c5:	e8 16 f0 ff ff       	call   801001e0 <brelse>
801011ca:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
801011d1:	83 c4 10             	add    $0x10,%esp
801011d4:	8b 45 dc             	mov    -0x24(%ebp),%eax
801011d7:	39 05 e0 09 11 80    	cmp    %eax,0x801109e0
801011dd:	77 82                	ja     80101161 <balloc+0x21>
801011df:	83 ec 0c             	sub    $0xc,%esp
801011e2:	68 7b 70 10 80       	push   $0x8010707b
801011e7:	e8 84 f1 ff ff       	call   80100370 <panic>
801011ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801011f0:	09 fa                	or     %edi,%edx
801011f2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801011f5:	83 ec 0c             	sub    $0xc,%esp
801011f8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
801011fc:	57                   	push   %edi
801011fd:	e8 ee 1b 00 00       	call   80102df0 <log_write>
80101202:	89 3c 24             	mov    %edi,(%esp)
80101205:	e8 d6 ef ff ff       	call   801001e0 <brelse>
8010120a:	58                   	pop    %eax
8010120b:	5a                   	pop    %edx
8010120c:	56                   	push   %esi
8010120d:	ff 75 d8             	pushl  -0x28(%ebp)
80101210:	e8 bb ee ff ff       	call   801000d0 <bread>
80101215:	89 c3                	mov    %eax,%ebx
80101217:	8d 40 5c             	lea    0x5c(%eax),%eax
8010121a:	83 c4 0c             	add    $0xc,%esp
8010121d:	68 00 02 00 00       	push   $0x200
80101222:	6a 00                	push   $0x0
80101224:	50                   	push   %eax
80101225:	e8 c6 32 00 00       	call   801044f0 <memset>
8010122a:	89 1c 24             	mov    %ebx,(%esp)
8010122d:	e8 be 1b 00 00       	call   80102df0 <log_write>
80101232:	89 1c 24             	mov    %ebx,(%esp)
80101235:	e8 a6 ef ff ff       	call   801001e0 <brelse>
8010123a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010123d:	89 f0                	mov    %esi,%eax
8010123f:	5b                   	pop    %ebx
80101240:	5e                   	pop    %esi
80101241:	5f                   	pop    %edi
80101242:	5d                   	pop    %ebp
80101243:	c3                   	ret    
80101244:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010124a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101250 <iget>:
80101250:	55                   	push   %ebp
80101251:	89 e5                	mov    %esp,%ebp
80101253:	57                   	push   %edi
80101254:	56                   	push   %esi
80101255:	53                   	push   %ebx
80101256:	89 c7                	mov    %eax,%edi
80101258:	31 f6                	xor    %esi,%esi
8010125a:	bb 34 0a 11 80       	mov    $0x80110a34,%ebx
8010125f:	83 ec 28             	sub    $0x28,%esp
80101262:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101265:	68 00 0a 11 80       	push   $0x80110a00
8010126a:	e8 51 30 00 00       	call   801042c0 <acquire>
8010126f:	83 c4 10             	add    $0x10,%esp
80101272:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101275:	eb 1b                	jmp    80101292 <iget+0x42>
80101277:	89 f6                	mov    %esi,%esi
80101279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101280:	85 f6                	test   %esi,%esi
80101282:	74 44                	je     801012c8 <iget+0x78>
80101284:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010128a:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101290:	74 4e                	je     801012e0 <iget+0x90>
80101292:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101295:	85 c9                	test   %ecx,%ecx
80101297:	7e e7                	jle    80101280 <iget+0x30>
80101299:	39 3b                	cmp    %edi,(%ebx)
8010129b:	75 e3                	jne    80101280 <iget+0x30>
8010129d:	39 53 04             	cmp    %edx,0x4(%ebx)
801012a0:	75 de                	jne    80101280 <iget+0x30>
801012a2:	83 ec 0c             	sub    $0xc,%esp
801012a5:	83 c1 01             	add    $0x1,%ecx
801012a8:	89 de                	mov    %ebx,%esi
801012aa:	68 00 0a 11 80       	push   $0x80110a00
801012af:	89 4b 08             	mov    %ecx,0x8(%ebx)
801012b2:	e8 e9 31 00 00       	call   801044a0 <release>
801012b7:	83 c4 10             	add    $0x10,%esp
801012ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012bd:	89 f0                	mov    %esi,%eax
801012bf:	5b                   	pop    %ebx
801012c0:	5e                   	pop    %esi
801012c1:	5f                   	pop    %edi
801012c2:	5d                   	pop    %ebp
801012c3:	c3                   	ret    
801012c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801012c8:	85 c9                	test   %ecx,%ecx
801012ca:	0f 44 f3             	cmove  %ebx,%esi
801012cd:	81 c3 90 00 00 00    	add    $0x90,%ebx
801012d3:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
801012d9:	75 b7                	jne    80101292 <iget+0x42>
801012db:	90                   	nop
801012dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801012e0:	85 f6                	test   %esi,%esi
801012e2:	74 2d                	je     80101311 <iget+0xc1>
801012e4:	83 ec 0c             	sub    $0xc,%esp
801012e7:	89 3e                	mov    %edi,(%esi)
801012e9:	89 56 04             	mov    %edx,0x4(%esi)
801012ec:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
801012f3:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
801012fa:	68 00 0a 11 80       	push   $0x80110a00
801012ff:	e8 9c 31 00 00       	call   801044a0 <release>
80101304:	83 c4 10             	add    $0x10,%esp
80101307:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010130a:	89 f0                	mov    %esi,%eax
8010130c:	5b                   	pop    %ebx
8010130d:	5e                   	pop    %esi
8010130e:	5f                   	pop    %edi
8010130f:	5d                   	pop    %ebp
80101310:	c3                   	ret    
80101311:	83 ec 0c             	sub    $0xc,%esp
80101314:	68 91 70 10 80       	push   $0x80107091
80101319:	e8 52 f0 ff ff       	call   80100370 <panic>
8010131e:	66 90                	xchg   %ax,%ax

80101320 <bmap>:
80101320:	55                   	push   %ebp
80101321:	89 e5                	mov    %esp,%ebp
80101323:	57                   	push   %edi
80101324:	56                   	push   %esi
80101325:	53                   	push   %ebx
80101326:	89 c6                	mov    %eax,%esi
80101328:	83 ec 1c             	sub    $0x1c,%esp
8010132b:	83 fa 0b             	cmp    $0xb,%edx
8010132e:	77 18                	ja     80101348 <bmap+0x28>
80101330:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80101333:	8b 43 5c             	mov    0x5c(%ebx),%eax
80101336:	85 c0                	test   %eax,%eax
80101338:	74 76                	je     801013b0 <bmap+0x90>
8010133a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010133d:	5b                   	pop    %ebx
8010133e:	5e                   	pop    %esi
8010133f:	5f                   	pop    %edi
80101340:	5d                   	pop    %ebp
80101341:	c3                   	ret    
80101342:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101348:	8d 5a f4             	lea    -0xc(%edx),%ebx
8010134b:	83 fb 7f             	cmp    $0x7f,%ebx
8010134e:	0f 87 83 00 00 00    	ja     801013d7 <bmap+0xb7>
80101354:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010135a:	85 c0                	test   %eax,%eax
8010135c:	74 6a                	je     801013c8 <bmap+0xa8>
8010135e:	83 ec 08             	sub    $0x8,%esp
80101361:	50                   	push   %eax
80101362:	ff 36                	pushl  (%esi)
80101364:	e8 67 ed ff ff       	call   801000d0 <bread>
80101369:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010136d:	83 c4 10             	add    $0x10,%esp
80101370:	89 c7                	mov    %eax,%edi
80101372:	8b 1a                	mov    (%edx),%ebx
80101374:	85 db                	test   %ebx,%ebx
80101376:	75 1d                	jne    80101395 <bmap+0x75>
80101378:	8b 06                	mov    (%esi),%eax
8010137a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010137d:	e8 be fd ff ff       	call   80101140 <balloc>
80101382:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101385:	83 ec 0c             	sub    $0xc,%esp
80101388:	89 c3                	mov    %eax,%ebx
8010138a:	89 02                	mov    %eax,(%edx)
8010138c:	57                   	push   %edi
8010138d:	e8 5e 1a 00 00       	call   80102df0 <log_write>
80101392:	83 c4 10             	add    $0x10,%esp
80101395:	83 ec 0c             	sub    $0xc,%esp
80101398:	57                   	push   %edi
80101399:	e8 42 ee ff ff       	call   801001e0 <brelse>
8010139e:	83 c4 10             	add    $0x10,%esp
801013a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013a4:	89 d8                	mov    %ebx,%eax
801013a6:	5b                   	pop    %ebx
801013a7:	5e                   	pop    %esi
801013a8:	5f                   	pop    %edi
801013a9:	5d                   	pop    %ebp
801013aa:	c3                   	ret    
801013ab:	90                   	nop
801013ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801013b0:	8b 06                	mov    (%esi),%eax
801013b2:	e8 89 fd ff ff       	call   80101140 <balloc>
801013b7:	89 43 5c             	mov    %eax,0x5c(%ebx)
801013ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013bd:	5b                   	pop    %ebx
801013be:	5e                   	pop    %esi
801013bf:	5f                   	pop    %edi
801013c0:	5d                   	pop    %ebp
801013c1:	c3                   	ret    
801013c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801013c8:	8b 06                	mov    (%esi),%eax
801013ca:	e8 71 fd ff ff       	call   80101140 <balloc>
801013cf:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
801013d5:	eb 87                	jmp    8010135e <bmap+0x3e>
801013d7:	83 ec 0c             	sub    $0xc,%esp
801013da:	68 a1 70 10 80       	push   $0x801070a1
801013df:	e8 8c ef ff ff       	call   80100370 <panic>
801013e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801013ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801013f0 <readsb>:
801013f0:	55                   	push   %ebp
801013f1:	89 e5                	mov    %esp,%ebp
801013f3:	56                   	push   %esi
801013f4:	53                   	push   %ebx
801013f5:	8b 75 0c             	mov    0xc(%ebp),%esi
801013f8:	83 ec 08             	sub    $0x8,%esp
801013fb:	6a 01                	push   $0x1
801013fd:	ff 75 08             	pushl  0x8(%ebp)
80101400:	e8 cb ec ff ff       	call   801000d0 <bread>
80101405:	89 c3                	mov    %eax,%ebx
80101407:	8d 40 5c             	lea    0x5c(%eax),%eax
8010140a:	83 c4 0c             	add    $0xc,%esp
8010140d:	6a 1c                	push   $0x1c
8010140f:	50                   	push   %eax
80101410:	56                   	push   %esi
80101411:	e8 8a 31 00 00       	call   801045a0 <memmove>
80101416:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101419:	83 c4 10             	add    $0x10,%esp
8010141c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010141f:	5b                   	pop    %ebx
80101420:	5e                   	pop    %esi
80101421:	5d                   	pop    %ebp
80101422:	e9 b9 ed ff ff       	jmp    801001e0 <brelse>
80101427:	89 f6                	mov    %esi,%esi
80101429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101430 <bfree>:
80101430:	55                   	push   %ebp
80101431:	89 e5                	mov    %esp,%ebp
80101433:	56                   	push   %esi
80101434:	53                   	push   %ebx
80101435:	89 d3                	mov    %edx,%ebx
80101437:	89 c6                	mov    %eax,%esi
80101439:	83 ec 08             	sub    $0x8,%esp
8010143c:	68 e0 09 11 80       	push   $0x801109e0
80101441:	50                   	push   %eax
80101442:	e8 a9 ff ff ff       	call   801013f0 <readsb>
80101447:	58                   	pop    %eax
80101448:	5a                   	pop    %edx
80101449:	89 da                	mov    %ebx,%edx
8010144b:	c1 ea 0c             	shr    $0xc,%edx
8010144e:	03 15 f8 09 11 80    	add    0x801109f8,%edx
80101454:	52                   	push   %edx
80101455:	56                   	push   %esi
80101456:	e8 75 ec ff ff       	call   801000d0 <bread>
8010145b:	89 d9                	mov    %ebx,%ecx
8010145d:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80101463:	ba 01 00 00 00       	mov    $0x1,%edx
80101468:	83 e1 07             	and    $0x7,%ecx
8010146b:	c1 fb 03             	sar    $0x3,%ebx
8010146e:	83 c4 10             	add    $0x10,%esp
80101471:	d3 e2                	shl    %cl,%edx
80101473:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101478:	85 d1                	test   %edx,%ecx
8010147a:	74 27                	je     801014a3 <bfree+0x73>
8010147c:	89 c6                	mov    %eax,%esi
8010147e:	f7 d2                	not    %edx
80101480:	89 c8                	mov    %ecx,%eax
80101482:	83 ec 0c             	sub    $0xc,%esp
80101485:	21 d0                	and    %edx,%eax
80101487:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
8010148b:	56                   	push   %esi
8010148c:	e8 5f 19 00 00       	call   80102df0 <log_write>
80101491:	89 34 24             	mov    %esi,(%esp)
80101494:	e8 47 ed ff ff       	call   801001e0 <brelse>
80101499:	83 c4 10             	add    $0x10,%esp
8010149c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010149f:	5b                   	pop    %ebx
801014a0:	5e                   	pop    %esi
801014a1:	5d                   	pop    %ebp
801014a2:	c3                   	ret    
801014a3:	83 ec 0c             	sub    $0xc,%esp
801014a6:	68 b4 70 10 80       	push   $0x801070b4
801014ab:	e8 c0 ee ff ff       	call   80100370 <panic>

801014b0 <iinit>:
801014b0:	55                   	push   %ebp
801014b1:	89 e5                	mov    %esp,%ebp
801014b3:	53                   	push   %ebx
801014b4:	bb 40 0a 11 80       	mov    $0x80110a40,%ebx
801014b9:	83 ec 0c             	sub    $0xc,%esp
801014bc:	68 c7 70 10 80       	push   $0x801070c7
801014c1:	68 00 0a 11 80       	push   $0x80110a00
801014c6:	e8 d5 2d 00 00       	call   801042a0 <initlock>
801014cb:	83 c4 10             	add    $0x10,%esp
801014ce:	66 90                	xchg   %ax,%ax
801014d0:	83 ec 08             	sub    $0x8,%esp
801014d3:	68 ce 70 10 80       	push   $0x801070ce
801014d8:	53                   	push   %ebx
801014d9:	81 c3 90 00 00 00    	add    $0x90,%ebx
801014df:	e8 ac 2c 00 00       	call   80104190 <initsleeplock>
801014e4:	83 c4 10             	add    $0x10,%esp
801014e7:	81 fb 60 26 11 80    	cmp    $0x80112660,%ebx
801014ed:	75 e1                	jne    801014d0 <iinit+0x20>
801014ef:	83 ec 08             	sub    $0x8,%esp
801014f2:	68 e0 09 11 80       	push   $0x801109e0
801014f7:	ff 75 08             	pushl  0x8(%ebp)
801014fa:	e8 f1 fe ff ff       	call   801013f0 <readsb>
801014ff:	ff 35 f8 09 11 80    	pushl  0x801109f8
80101505:	ff 35 f4 09 11 80    	pushl  0x801109f4
8010150b:	ff 35 f0 09 11 80    	pushl  0x801109f0
80101511:	ff 35 ec 09 11 80    	pushl  0x801109ec
80101517:	ff 35 e8 09 11 80    	pushl  0x801109e8
8010151d:	ff 35 e4 09 11 80    	pushl  0x801109e4
80101523:	ff 35 e0 09 11 80    	pushl  0x801109e0
80101529:	68 24 71 10 80       	push   $0x80107124
8010152e:	e8 2d f1 ff ff       	call   80100660 <cprintf>
80101533:	83 c4 30             	add    $0x30,%esp
80101536:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101539:	c9                   	leave  
8010153a:	c3                   	ret    
8010153b:	90                   	nop
8010153c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101540 <ialloc>:
80101540:	55                   	push   %ebp
80101541:	89 e5                	mov    %esp,%ebp
80101543:	57                   	push   %edi
80101544:	56                   	push   %esi
80101545:	53                   	push   %ebx
80101546:	83 ec 1c             	sub    $0x1c,%esp
80101549:	83 3d e8 09 11 80 01 	cmpl   $0x1,0x801109e8
80101550:	8b 45 0c             	mov    0xc(%ebp),%eax
80101553:	8b 75 08             	mov    0x8(%ebp),%esi
80101556:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101559:	0f 86 91 00 00 00    	jbe    801015f0 <ialloc+0xb0>
8010155f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101564:	eb 21                	jmp    80101587 <ialloc+0x47>
80101566:	8d 76 00             	lea    0x0(%esi),%esi
80101569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101570:	83 ec 0c             	sub    $0xc,%esp
80101573:	83 c3 01             	add    $0x1,%ebx
80101576:	57                   	push   %edi
80101577:	e8 64 ec ff ff       	call   801001e0 <brelse>
8010157c:	83 c4 10             	add    $0x10,%esp
8010157f:	39 1d e8 09 11 80    	cmp    %ebx,0x801109e8
80101585:	76 69                	jbe    801015f0 <ialloc+0xb0>
80101587:	89 d8                	mov    %ebx,%eax
80101589:	83 ec 08             	sub    $0x8,%esp
8010158c:	c1 e8 03             	shr    $0x3,%eax
8010158f:	03 05 f4 09 11 80    	add    0x801109f4,%eax
80101595:	50                   	push   %eax
80101596:	56                   	push   %esi
80101597:	e8 34 eb ff ff       	call   801000d0 <bread>
8010159c:	89 c7                	mov    %eax,%edi
8010159e:	89 d8                	mov    %ebx,%eax
801015a0:	83 c4 10             	add    $0x10,%esp
801015a3:	83 e0 07             	and    $0x7,%eax
801015a6:	c1 e0 06             	shl    $0x6,%eax
801015a9:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
801015ad:	66 83 39 00          	cmpw   $0x0,(%ecx)
801015b1:	75 bd                	jne    80101570 <ialloc+0x30>
801015b3:	83 ec 04             	sub    $0x4,%esp
801015b6:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801015b9:	6a 40                	push   $0x40
801015bb:	6a 00                	push   $0x0
801015bd:	51                   	push   %ecx
801015be:	e8 2d 2f 00 00       	call   801044f0 <memset>
801015c3:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
801015c7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801015ca:	66 89 01             	mov    %ax,(%ecx)
801015cd:	89 3c 24             	mov    %edi,(%esp)
801015d0:	e8 1b 18 00 00       	call   80102df0 <log_write>
801015d5:	89 3c 24             	mov    %edi,(%esp)
801015d8:	e8 03 ec ff ff       	call   801001e0 <brelse>
801015dd:	83 c4 10             	add    $0x10,%esp
801015e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801015e3:	89 da                	mov    %ebx,%edx
801015e5:	89 f0                	mov    %esi,%eax
801015e7:	5b                   	pop    %ebx
801015e8:	5e                   	pop    %esi
801015e9:	5f                   	pop    %edi
801015ea:	5d                   	pop    %ebp
801015eb:	e9 60 fc ff ff       	jmp    80101250 <iget>
801015f0:	83 ec 0c             	sub    $0xc,%esp
801015f3:	68 d4 70 10 80       	push   $0x801070d4
801015f8:	e8 73 ed ff ff       	call   80100370 <panic>
801015fd:	8d 76 00             	lea    0x0(%esi),%esi

80101600 <iupdate>:
80101600:	55                   	push   %ebp
80101601:	89 e5                	mov    %esp,%ebp
80101603:	56                   	push   %esi
80101604:	53                   	push   %ebx
80101605:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101608:	83 ec 08             	sub    $0x8,%esp
8010160b:	8b 43 04             	mov    0x4(%ebx),%eax
8010160e:	83 c3 5c             	add    $0x5c,%ebx
80101611:	c1 e8 03             	shr    $0x3,%eax
80101614:	03 05 f4 09 11 80    	add    0x801109f4,%eax
8010161a:	50                   	push   %eax
8010161b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010161e:	e8 ad ea ff ff       	call   801000d0 <bread>
80101623:	89 c6                	mov    %eax,%esi
80101625:	8b 43 a8             	mov    -0x58(%ebx),%eax
80101628:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
8010162c:	83 c4 0c             	add    $0xc,%esp
8010162f:	83 e0 07             	and    $0x7,%eax
80101632:	c1 e0 06             	shl    $0x6,%eax
80101635:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101639:	66 89 10             	mov    %dx,(%eax)
8010163c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
80101640:	83 c0 0c             	add    $0xc,%eax
80101643:	66 89 50 f6          	mov    %dx,-0xa(%eax)
80101647:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010164b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
8010164f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101653:	66 89 50 fa          	mov    %dx,-0x6(%eax)
80101657:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010165a:	89 50 fc             	mov    %edx,-0x4(%eax)
8010165d:	6a 34                	push   $0x34
8010165f:	53                   	push   %ebx
80101660:	50                   	push   %eax
80101661:	e8 3a 2f 00 00       	call   801045a0 <memmove>
80101666:	89 34 24             	mov    %esi,(%esp)
80101669:	e8 82 17 00 00       	call   80102df0 <log_write>
8010166e:	89 75 08             	mov    %esi,0x8(%ebp)
80101671:	83 c4 10             	add    $0x10,%esp
80101674:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101677:	5b                   	pop    %ebx
80101678:	5e                   	pop    %esi
80101679:	5d                   	pop    %ebp
8010167a:	e9 61 eb ff ff       	jmp    801001e0 <brelse>
8010167f:	90                   	nop

80101680 <idup>:
80101680:	55                   	push   %ebp
80101681:	89 e5                	mov    %esp,%ebp
80101683:	53                   	push   %ebx
80101684:	83 ec 10             	sub    $0x10,%esp
80101687:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010168a:	68 00 0a 11 80       	push   $0x80110a00
8010168f:	e8 2c 2c 00 00       	call   801042c0 <acquire>
80101694:	83 43 08 01          	addl   $0x1,0x8(%ebx)
80101698:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010169f:	e8 fc 2d 00 00       	call   801044a0 <release>
801016a4:	89 d8                	mov    %ebx,%eax
801016a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801016a9:	c9                   	leave  
801016aa:	c3                   	ret    
801016ab:	90                   	nop
801016ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801016b0 <ilock>:
801016b0:	55                   	push   %ebp
801016b1:	89 e5                	mov    %esp,%ebp
801016b3:	56                   	push   %esi
801016b4:	53                   	push   %ebx
801016b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801016b8:	85 db                	test   %ebx,%ebx
801016ba:	0f 84 b4 00 00 00    	je     80101774 <ilock+0xc4>
801016c0:	8b 43 08             	mov    0x8(%ebx),%eax
801016c3:	85 c0                	test   %eax,%eax
801016c5:	0f 8e a9 00 00 00    	jle    80101774 <ilock+0xc4>
801016cb:	8d 43 0c             	lea    0xc(%ebx),%eax
801016ce:	83 ec 0c             	sub    $0xc,%esp
801016d1:	50                   	push   %eax
801016d2:	e8 f9 2a 00 00       	call   801041d0 <acquiresleep>
801016d7:	83 c4 10             	add    $0x10,%esp
801016da:	f6 43 4c 02          	testb  $0x2,0x4c(%ebx)
801016de:	74 10                	je     801016f0 <ilock+0x40>
801016e0:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016e3:	5b                   	pop    %ebx
801016e4:	5e                   	pop    %esi
801016e5:	5d                   	pop    %ebp
801016e6:	c3                   	ret    
801016e7:	89 f6                	mov    %esi,%esi
801016e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801016f0:	8b 43 04             	mov    0x4(%ebx),%eax
801016f3:	83 ec 08             	sub    $0x8,%esp
801016f6:	c1 e8 03             	shr    $0x3,%eax
801016f9:	03 05 f4 09 11 80    	add    0x801109f4,%eax
801016ff:	50                   	push   %eax
80101700:	ff 33                	pushl  (%ebx)
80101702:	e8 c9 e9 ff ff       	call   801000d0 <bread>
80101707:	89 c6                	mov    %eax,%esi
80101709:	8b 43 04             	mov    0x4(%ebx),%eax
8010170c:	83 c4 0c             	add    $0xc,%esp
8010170f:	83 e0 07             	and    $0x7,%eax
80101712:	c1 e0 06             	shl    $0x6,%eax
80101715:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101719:	0f b7 10             	movzwl (%eax),%edx
8010171c:	83 c0 0c             	add    $0xc,%eax
8010171f:	66 89 53 50          	mov    %dx,0x50(%ebx)
80101723:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
80101727:	66 89 53 52          	mov    %dx,0x52(%ebx)
8010172b:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
8010172f:	66 89 53 54          	mov    %dx,0x54(%ebx)
80101733:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101737:	66 89 53 56          	mov    %dx,0x56(%ebx)
8010173b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010173e:	89 53 58             	mov    %edx,0x58(%ebx)
80101741:	6a 34                	push   $0x34
80101743:	50                   	push   %eax
80101744:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101747:	50                   	push   %eax
80101748:	e8 53 2e 00 00       	call   801045a0 <memmove>
8010174d:	89 34 24             	mov    %esi,(%esp)
80101750:	e8 8b ea ff ff       	call   801001e0 <brelse>
80101755:	83 4b 4c 02          	orl    $0x2,0x4c(%ebx)
80101759:	83 c4 10             	add    $0x10,%esp
8010175c:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
80101761:	0f 85 79 ff ff ff    	jne    801016e0 <ilock+0x30>
80101767:	83 ec 0c             	sub    $0xc,%esp
8010176a:	68 ec 70 10 80       	push   $0x801070ec
8010176f:	e8 fc eb ff ff       	call   80100370 <panic>
80101774:	83 ec 0c             	sub    $0xc,%esp
80101777:	68 e6 70 10 80       	push   $0x801070e6
8010177c:	e8 ef eb ff ff       	call   80100370 <panic>
80101781:	eb 0d                	jmp    80101790 <iunlock>
80101783:	90                   	nop
80101784:	90                   	nop
80101785:	90                   	nop
80101786:	90                   	nop
80101787:	90                   	nop
80101788:	90                   	nop
80101789:	90                   	nop
8010178a:	90                   	nop
8010178b:	90                   	nop
8010178c:	90                   	nop
8010178d:	90                   	nop
8010178e:	90                   	nop
8010178f:	90                   	nop

80101790 <iunlock>:
80101790:	55                   	push   %ebp
80101791:	89 e5                	mov    %esp,%ebp
80101793:	56                   	push   %esi
80101794:	53                   	push   %ebx
80101795:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101798:	85 db                	test   %ebx,%ebx
8010179a:	74 28                	je     801017c4 <iunlock+0x34>
8010179c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010179f:	83 ec 0c             	sub    $0xc,%esp
801017a2:	56                   	push   %esi
801017a3:	e8 c8 2a 00 00       	call   80104270 <holdingsleep>
801017a8:	83 c4 10             	add    $0x10,%esp
801017ab:	85 c0                	test   %eax,%eax
801017ad:	74 15                	je     801017c4 <iunlock+0x34>
801017af:	8b 43 08             	mov    0x8(%ebx),%eax
801017b2:	85 c0                	test   %eax,%eax
801017b4:	7e 0e                	jle    801017c4 <iunlock+0x34>
801017b6:	89 75 08             	mov    %esi,0x8(%ebp)
801017b9:	8d 65 f8             	lea    -0x8(%ebp),%esp
801017bc:	5b                   	pop    %ebx
801017bd:	5e                   	pop    %esi
801017be:	5d                   	pop    %ebp
801017bf:	e9 6c 2a 00 00       	jmp    80104230 <releasesleep>
801017c4:	83 ec 0c             	sub    $0xc,%esp
801017c7:	68 fb 70 10 80       	push   $0x801070fb
801017cc:	e8 9f eb ff ff       	call   80100370 <panic>
801017d1:	eb 0d                	jmp    801017e0 <iput>
801017d3:	90                   	nop
801017d4:	90                   	nop
801017d5:	90                   	nop
801017d6:	90                   	nop
801017d7:	90                   	nop
801017d8:	90                   	nop
801017d9:	90                   	nop
801017da:	90                   	nop
801017db:	90                   	nop
801017dc:	90                   	nop
801017dd:	90                   	nop
801017de:	90                   	nop
801017df:	90                   	nop

801017e0 <iput>:
801017e0:	55                   	push   %ebp
801017e1:	89 e5                	mov    %esp,%ebp
801017e3:	57                   	push   %edi
801017e4:	56                   	push   %esi
801017e5:	53                   	push   %ebx
801017e6:	83 ec 28             	sub    $0x28,%esp
801017e9:	8b 75 08             	mov    0x8(%ebp),%esi
801017ec:	68 00 0a 11 80       	push   $0x80110a00
801017f1:	e8 ca 2a 00 00       	call   801042c0 <acquire>
801017f6:	8b 46 08             	mov    0x8(%esi),%eax
801017f9:	83 c4 10             	add    $0x10,%esp
801017fc:	83 f8 01             	cmp    $0x1,%eax
801017ff:	74 1f                	je     80101820 <iput+0x40>
80101801:	83 e8 01             	sub    $0x1,%eax
80101804:	89 46 08             	mov    %eax,0x8(%esi)
80101807:	c7 45 08 00 0a 11 80 	movl   $0x80110a00,0x8(%ebp)
8010180e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101811:	5b                   	pop    %ebx
80101812:	5e                   	pop    %esi
80101813:	5f                   	pop    %edi
80101814:	5d                   	pop    %ebp
80101815:	e9 86 2c 00 00       	jmp    801044a0 <release>
8010181a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101820:	f6 46 4c 02          	testb  $0x2,0x4c(%esi)
80101824:	74 db                	je     80101801 <iput+0x21>
80101826:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
8010182b:	75 d4                	jne    80101801 <iput+0x21>
8010182d:	83 ec 0c             	sub    $0xc,%esp
80101830:	8d 5e 5c             	lea    0x5c(%esi),%ebx
80101833:	8d be 8c 00 00 00    	lea    0x8c(%esi),%edi
80101839:	68 00 0a 11 80       	push   $0x80110a00
8010183e:	e8 5d 2c 00 00       	call   801044a0 <release>
80101843:	83 c4 10             	add    $0x10,%esp
80101846:	eb 0f                	jmp    80101857 <iput+0x77>
80101848:	90                   	nop
80101849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101850:	83 c3 04             	add    $0x4,%ebx
80101853:	39 fb                	cmp    %edi,%ebx
80101855:	74 19                	je     80101870 <iput+0x90>
80101857:	8b 13                	mov    (%ebx),%edx
80101859:	85 d2                	test   %edx,%edx
8010185b:	74 f3                	je     80101850 <iput+0x70>
8010185d:	8b 06                	mov    (%esi),%eax
8010185f:	e8 cc fb ff ff       	call   80101430 <bfree>
80101864:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010186a:	eb e4                	jmp    80101850 <iput+0x70>
8010186c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101870:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101876:	85 c0                	test   %eax,%eax
80101878:	75 46                	jne    801018c0 <iput+0xe0>
8010187a:	83 ec 0c             	sub    $0xc,%esp
8010187d:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
80101884:	56                   	push   %esi
80101885:	e8 76 fd ff ff       	call   80101600 <iupdate>
8010188a:	31 c0                	xor    %eax,%eax
8010188c:	66 89 46 50          	mov    %ax,0x50(%esi)
80101890:	89 34 24             	mov    %esi,(%esp)
80101893:	e8 68 fd ff ff       	call   80101600 <iupdate>
80101898:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010189f:	e8 1c 2a 00 00       	call   801042c0 <acquire>
801018a4:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
801018ab:	8b 46 08             	mov    0x8(%esi),%eax
801018ae:	83 c4 10             	add    $0x10,%esp
801018b1:	e9 4b ff ff ff       	jmp    80101801 <iput+0x21>
801018b6:	8d 76 00             	lea    0x0(%esi),%esi
801018b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801018c0:	83 ec 08             	sub    $0x8,%esp
801018c3:	50                   	push   %eax
801018c4:	ff 36                	pushl  (%esi)
801018c6:	e8 05 e8 ff ff       	call   801000d0 <bread>
801018cb:	83 c4 10             	add    $0x10,%esp
801018ce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801018d1:	8d 58 5c             	lea    0x5c(%eax),%ebx
801018d4:	8d b8 5c 02 00 00    	lea    0x25c(%eax),%edi
801018da:	eb 0b                	jmp    801018e7 <iput+0x107>
801018dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801018e0:	83 c3 04             	add    $0x4,%ebx
801018e3:	39 df                	cmp    %ebx,%edi
801018e5:	74 0f                	je     801018f6 <iput+0x116>
801018e7:	8b 13                	mov    (%ebx),%edx
801018e9:	85 d2                	test   %edx,%edx
801018eb:	74 f3                	je     801018e0 <iput+0x100>
801018ed:	8b 06                	mov    (%esi),%eax
801018ef:	e8 3c fb ff ff       	call   80101430 <bfree>
801018f4:	eb ea                	jmp    801018e0 <iput+0x100>
801018f6:	83 ec 0c             	sub    $0xc,%esp
801018f9:	ff 75 e4             	pushl  -0x1c(%ebp)
801018fc:	e8 df e8 ff ff       	call   801001e0 <brelse>
80101901:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
80101907:	8b 06                	mov    (%esi),%eax
80101909:	e8 22 fb ff ff       	call   80101430 <bfree>
8010190e:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
80101915:	00 00 00 
80101918:	83 c4 10             	add    $0x10,%esp
8010191b:	e9 5a ff ff ff       	jmp    8010187a <iput+0x9a>

80101920 <iunlockput>:
80101920:	55                   	push   %ebp
80101921:	89 e5                	mov    %esp,%ebp
80101923:	53                   	push   %ebx
80101924:	83 ec 10             	sub    $0x10,%esp
80101927:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010192a:	53                   	push   %ebx
8010192b:	e8 60 fe ff ff       	call   80101790 <iunlock>
80101930:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101933:	83 c4 10             	add    $0x10,%esp
80101936:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101939:	c9                   	leave  
8010193a:	e9 a1 fe ff ff       	jmp    801017e0 <iput>
8010193f:	90                   	nop

80101940 <stati>:
80101940:	55                   	push   %ebp
80101941:	89 e5                	mov    %esp,%ebp
80101943:	8b 55 08             	mov    0x8(%ebp),%edx
80101946:	8b 45 0c             	mov    0xc(%ebp),%eax
80101949:	8b 0a                	mov    (%edx),%ecx
8010194b:	89 48 04             	mov    %ecx,0x4(%eax)
8010194e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101951:	89 48 08             	mov    %ecx,0x8(%eax)
80101954:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101958:	66 89 08             	mov    %cx,(%eax)
8010195b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010195f:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101963:	8b 52 58             	mov    0x58(%edx),%edx
80101966:	89 50 10             	mov    %edx,0x10(%eax)
80101969:	5d                   	pop    %ebp
8010196a:	c3                   	ret    
8010196b:	90                   	nop
8010196c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101970 <readi>:
80101970:	55                   	push   %ebp
80101971:	89 e5                	mov    %esp,%ebp
80101973:	57                   	push   %edi
80101974:	56                   	push   %esi
80101975:	53                   	push   %ebx
80101976:	83 ec 1c             	sub    $0x1c,%esp
80101979:	8b 45 08             	mov    0x8(%ebp),%eax
8010197c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010197f:	8b 75 10             	mov    0x10(%ebp),%esi
80101982:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101987:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010198a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010198d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101990:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101993:	0f 84 a7 00 00 00    	je     80101a40 <readi+0xd0>
80101999:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010199c:	8b 40 58             	mov    0x58(%eax),%eax
8010199f:	39 f0                	cmp    %esi,%eax
801019a1:	0f 82 c1 00 00 00    	jb     80101a68 <readi+0xf8>
801019a7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801019aa:	89 fa                	mov    %edi,%edx
801019ac:	01 f2                	add    %esi,%edx
801019ae:	0f 82 b4 00 00 00    	jb     80101a68 <readi+0xf8>
801019b4:	89 c1                	mov    %eax,%ecx
801019b6:	29 f1                	sub    %esi,%ecx
801019b8:	39 d0                	cmp    %edx,%eax
801019ba:	0f 43 cf             	cmovae %edi,%ecx
801019bd:	31 ff                	xor    %edi,%edi
801019bf:	85 c9                	test   %ecx,%ecx
801019c1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801019c4:	74 6d                	je     80101a33 <readi+0xc3>
801019c6:	8d 76 00             	lea    0x0(%esi),%esi
801019c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801019d0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019d3:	89 f2                	mov    %esi,%edx
801019d5:	c1 ea 09             	shr    $0x9,%edx
801019d8:	89 d8                	mov    %ebx,%eax
801019da:	e8 41 f9 ff ff       	call   80101320 <bmap>
801019df:	83 ec 08             	sub    $0x8,%esp
801019e2:	50                   	push   %eax
801019e3:	ff 33                	pushl  (%ebx)
801019e5:	bb 00 02 00 00       	mov    $0x200,%ebx
801019ea:	e8 e1 e6 ff ff       	call   801000d0 <bread>
801019ef:	89 c2                	mov    %eax,%edx
801019f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019f4:	89 f1                	mov    %esi,%ecx
801019f6:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801019fc:	83 c4 0c             	add    $0xc,%esp
801019ff:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101a02:	29 cb                	sub    %ecx,%ebx
80101a04:	29 f8                	sub    %edi,%eax
80101a06:	39 c3                	cmp    %eax,%ebx
80101a08:	0f 47 d8             	cmova  %eax,%ebx
80101a0b:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
80101a0f:	53                   	push   %ebx
80101a10:	01 df                	add    %ebx,%edi
80101a12:	01 de                	add    %ebx,%esi
80101a14:	50                   	push   %eax
80101a15:	ff 75 e0             	pushl  -0x20(%ebp)
80101a18:	e8 83 2b 00 00       	call   801045a0 <memmove>
80101a1d:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a20:	89 14 24             	mov    %edx,(%esp)
80101a23:	e8 b8 e7 ff ff       	call   801001e0 <brelse>
80101a28:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a2b:	83 c4 10             	add    $0x10,%esp
80101a2e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a31:	77 9d                	ja     801019d0 <readi+0x60>
80101a33:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101a36:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a39:	5b                   	pop    %ebx
80101a3a:	5e                   	pop    %esi
80101a3b:	5f                   	pop    %edi
80101a3c:	5d                   	pop    %ebp
80101a3d:	c3                   	ret    
80101a3e:	66 90                	xchg   %ax,%ax
80101a40:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a44:	66 83 f8 09          	cmp    $0x9,%ax
80101a48:	77 1e                	ja     80101a68 <readi+0xf8>
80101a4a:	8b 04 c5 80 09 11 80 	mov    -0x7feef680(,%eax,8),%eax
80101a51:	85 c0                	test   %eax,%eax
80101a53:	74 13                	je     80101a68 <readi+0xf8>
80101a55:	89 7d 10             	mov    %edi,0x10(%ebp)
80101a58:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a5b:	5b                   	pop    %ebx
80101a5c:	5e                   	pop    %esi
80101a5d:	5f                   	pop    %edi
80101a5e:	5d                   	pop    %ebp
80101a5f:	ff e0                	jmp    *%eax
80101a61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101a68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a6d:	eb c7                	jmp    80101a36 <readi+0xc6>
80101a6f:	90                   	nop

80101a70 <writei>:
80101a70:	55                   	push   %ebp
80101a71:	89 e5                	mov    %esp,%ebp
80101a73:	57                   	push   %edi
80101a74:	56                   	push   %esi
80101a75:	53                   	push   %ebx
80101a76:	83 ec 1c             	sub    $0x1c,%esp
80101a79:	8b 45 08             	mov    0x8(%ebp),%eax
80101a7c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a7f:	8b 7d 14             	mov    0x14(%ebp),%edi
80101a82:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101a87:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a8a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a8d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a90:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101a93:	0f 84 b7 00 00 00    	je     80101b50 <writei+0xe0>
80101a99:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a9c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a9f:	0f 82 eb 00 00 00    	jb     80101b90 <writei+0x120>
80101aa5:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101aa8:	89 f8                	mov    %edi,%eax
80101aaa:	01 f0                	add    %esi,%eax
80101aac:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101ab1:	0f 87 d9 00 00 00    	ja     80101b90 <writei+0x120>
80101ab7:	39 c6                	cmp    %eax,%esi
80101ab9:	0f 87 d1 00 00 00    	ja     80101b90 <writei+0x120>
80101abf:	85 ff                	test   %edi,%edi
80101ac1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101ac8:	74 78                	je     80101b42 <writei+0xd2>
80101aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101ad0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101ad3:	89 f2                	mov    %esi,%edx
80101ad5:	bb 00 02 00 00       	mov    $0x200,%ebx
80101ada:	c1 ea 09             	shr    $0x9,%edx
80101add:	89 f8                	mov    %edi,%eax
80101adf:	e8 3c f8 ff ff       	call   80101320 <bmap>
80101ae4:	83 ec 08             	sub    $0x8,%esp
80101ae7:	50                   	push   %eax
80101ae8:	ff 37                	pushl  (%edi)
80101aea:	e8 e1 e5 ff ff       	call   801000d0 <bread>
80101aef:	89 c7                	mov    %eax,%edi
80101af1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101af4:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101af7:	89 f1                	mov    %esi,%ecx
80101af9:	83 c4 0c             	add    $0xc,%esp
80101afc:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101b02:	29 cb                	sub    %ecx,%ebx
80101b04:	39 c3                	cmp    %eax,%ebx
80101b06:	0f 47 d8             	cmova  %eax,%ebx
80101b09:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101b0d:	53                   	push   %ebx
80101b0e:	ff 75 dc             	pushl  -0x24(%ebp)
80101b11:	01 de                	add    %ebx,%esi
80101b13:	50                   	push   %eax
80101b14:	e8 87 2a 00 00       	call   801045a0 <memmove>
80101b19:	89 3c 24             	mov    %edi,(%esp)
80101b1c:	e8 cf 12 00 00       	call   80102df0 <log_write>
80101b21:	89 3c 24             	mov    %edi,(%esp)
80101b24:	e8 b7 e6 ff ff       	call   801001e0 <brelse>
80101b29:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b2c:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b2f:	83 c4 10             	add    $0x10,%esp
80101b32:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101b35:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101b38:	77 96                	ja     80101ad0 <writei+0x60>
80101b3a:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b3d:	3b 70 58             	cmp    0x58(%eax),%esi
80101b40:	77 36                	ja     80101b78 <writei+0x108>
80101b42:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b45:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b48:	5b                   	pop    %ebx
80101b49:	5e                   	pop    %esi
80101b4a:	5f                   	pop    %edi
80101b4b:	5d                   	pop    %ebp
80101b4c:	c3                   	ret    
80101b4d:	8d 76 00             	lea    0x0(%esi),%esi
80101b50:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b54:	66 83 f8 09          	cmp    $0x9,%ax
80101b58:	77 36                	ja     80101b90 <writei+0x120>
80101b5a:	8b 04 c5 84 09 11 80 	mov    -0x7feef67c(,%eax,8),%eax
80101b61:	85 c0                	test   %eax,%eax
80101b63:	74 2b                	je     80101b90 <writei+0x120>
80101b65:	89 7d 10             	mov    %edi,0x10(%ebp)
80101b68:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b6b:	5b                   	pop    %ebx
80101b6c:	5e                   	pop    %esi
80101b6d:	5f                   	pop    %edi
80101b6e:	5d                   	pop    %ebp
80101b6f:	ff e0                	jmp    *%eax
80101b71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b78:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b7b:	83 ec 0c             	sub    $0xc,%esp
80101b7e:	89 70 58             	mov    %esi,0x58(%eax)
80101b81:	50                   	push   %eax
80101b82:	e8 79 fa ff ff       	call   80101600 <iupdate>
80101b87:	83 c4 10             	add    $0x10,%esp
80101b8a:	eb b6                	jmp    80101b42 <writei+0xd2>
80101b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b95:	eb ae                	jmp    80101b45 <writei+0xd5>
80101b97:	89 f6                	mov    %esi,%esi
80101b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ba0 <namecmp>:
80101ba0:	55                   	push   %ebp
80101ba1:	89 e5                	mov    %esp,%ebp
80101ba3:	83 ec 0c             	sub    $0xc,%esp
80101ba6:	6a 0e                	push   $0xe
80101ba8:	ff 75 0c             	pushl  0xc(%ebp)
80101bab:	ff 75 08             	pushl  0x8(%ebp)
80101bae:	e8 6d 2a 00 00       	call   80104620 <strncmp>
80101bb3:	c9                   	leave  
80101bb4:	c3                   	ret    
80101bb5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bc0 <dirlookup>:
80101bc0:	55                   	push   %ebp
80101bc1:	89 e5                	mov    %esp,%ebp
80101bc3:	57                   	push   %edi
80101bc4:	56                   	push   %esi
80101bc5:	53                   	push   %ebx
80101bc6:	83 ec 1c             	sub    $0x1c,%esp
80101bc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101bcc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bd1:	0f 85 80 00 00 00    	jne    80101c57 <dirlookup+0x97>
80101bd7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bda:	31 ff                	xor    %edi,%edi
80101bdc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bdf:	85 d2                	test   %edx,%edx
80101be1:	75 0d                	jne    80101bf0 <dirlookup+0x30>
80101be3:	eb 5b                	jmp    80101c40 <dirlookup+0x80>
80101be5:	8d 76 00             	lea    0x0(%esi),%esi
80101be8:	83 c7 10             	add    $0x10,%edi
80101beb:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101bee:	76 50                	jbe    80101c40 <dirlookup+0x80>
80101bf0:	6a 10                	push   $0x10
80101bf2:	57                   	push   %edi
80101bf3:	56                   	push   %esi
80101bf4:	53                   	push   %ebx
80101bf5:	e8 76 fd ff ff       	call   80101970 <readi>
80101bfa:	83 c4 10             	add    $0x10,%esp
80101bfd:	83 f8 10             	cmp    $0x10,%eax
80101c00:	75 48                	jne    80101c4a <dirlookup+0x8a>
80101c02:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101c07:	74 df                	je     80101be8 <dirlookup+0x28>
80101c09:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c0c:	83 ec 04             	sub    $0x4,%esp
80101c0f:	6a 0e                	push   $0xe
80101c11:	50                   	push   %eax
80101c12:	ff 75 0c             	pushl  0xc(%ebp)
80101c15:	e8 06 2a 00 00       	call   80104620 <strncmp>
80101c1a:	83 c4 10             	add    $0x10,%esp
80101c1d:	85 c0                	test   %eax,%eax
80101c1f:	75 c7                	jne    80101be8 <dirlookup+0x28>
80101c21:	8b 45 10             	mov    0x10(%ebp),%eax
80101c24:	85 c0                	test   %eax,%eax
80101c26:	74 05                	je     80101c2d <dirlookup+0x6d>
80101c28:	8b 45 10             	mov    0x10(%ebp),%eax
80101c2b:	89 38                	mov    %edi,(%eax)
80101c2d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101c31:	8b 03                	mov    (%ebx),%eax
80101c33:	e8 18 f6 ff ff       	call   80101250 <iget>
80101c38:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c3b:	5b                   	pop    %ebx
80101c3c:	5e                   	pop    %esi
80101c3d:	5f                   	pop    %edi
80101c3e:	5d                   	pop    %ebp
80101c3f:	c3                   	ret    
80101c40:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c43:	31 c0                	xor    %eax,%eax
80101c45:	5b                   	pop    %ebx
80101c46:	5e                   	pop    %esi
80101c47:	5f                   	pop    %edi
80101c48:	5d                   	pop    %ebp
80101c49:	c3                   	ret    
80101c4a:	83 ec 0c             	sub    $0xc,%esp
80101c4d:	68 15 71 10 80       	push   $0x80107115
80101c52:	e8 19 e7 ff ff       	call   80100370 <panic>
80101c57:	83 ec 0c             	sub    $0xc,%esp
80101c5a:	68 03 71 10 80       	push   $0x80107103
80101c5f:	e8 0c e7 ff ff       	call   80100370 <panic>
80101c64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c70 <namex>:
80101c70:	55                   	push   %ebp
80101c71:	89 e5                	mov    %esp,%ebp
80101c73:	57                   	push   %edi
80101c74:	56                   	push   %esi
80101c75:	53                   	push   %ebx
80101c76:	89 cf                	mov    %ecx,%edi
80101c78:	89 c3                	mov    %eax,%ebx
80101c7a:	83 ec 1c             	sub    $0x1c,%esp
80101c7d:	80 38 2f             	cmpb   $0x2f,(%eax)
80101c80:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101c83:	0f 84 53 01 00 00    	je     80101ddc <namex+0x16c>
80101c89:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80101c8f:	83 ec 0c             	sub    $0xc,%esp
80101c92:	8b 70 68             	mov    0x68(%eax),%esi
80101c95:	68 00 0a 11 80       	push   $0x80110a00
80101c9a:	e8 21 26 00 00       	call   801042c0 <acquire>
80101c9f:	83 46 08 01          	addl   $0x1,0x8(%esi)
80101ca3:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101caa:	e8 f1 27 00 00       	call   801044a0 <release>
80101caf:	83 c4 10             	add    $0x10,%esp
80101cb2:	eb 07                	jmp    80101cbb <namex+0x4b>
80101cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101cb8:	83 c3 01             	add    $0x1,%ebx
80101cbb:	0f b6 03             	movzbl (%ebx),%eax
80101cbe:	3c 2f                	cmp    $0x2f,%al
80101cc0:	74 f6                	je     80101cb8 <namex+0x48>
80101cc2:	84 c0                	test   %al,%al
80101cc4:	0f 84 e3 00 00 00    	je     80101dad <namex+0x13d>
80101cca:	0f b6 03             	movzbl (%ebx),%eax
80101ccd:	89 da                	mov    %ebx,%edx
80101ccf:	84 c0                	test   %al,%al
80101cd1:	0f 84 ac 00 00 00    	je     80101d83 <namex+0x113>
80101cd7:	3c 2f                	cmp    $0x2f,%al
80101cd9:	75 09                	jne    80101ce4 <namex+0x74>
80101cdb:	e9 a3 00 00 00       	jmp    80101d83 <namex+0x113>
80101ce0:	84 c0                	test   %al,%al
80101ce2:	74 0a                	je     80101cee <namex+0x7e>
80101ce4:	83 c2 01             	add    $0x1,%edx
80101ce7:	0f b6 02             	movzbl (%edx),%eax
80101cea:	3c 2f                	cmp    $0x2f,%al
80101cec:	75 f2                	jne    80101ce0 <namex+0x70>
80101cee:	89 d1                	mov    %edx,%ecx
80101cf0:	29 d9                	sub    %ebx,%ecx
80101cf2:	83 f9 0d             	cmp    $0xd,%ecx
80101cf5:	0f 8e 8d 00 00 00    	jle    80101d88 <namex+0x118>
80101cfb:	83 ec 04             	sub    $0x4,%esp
80101cfe:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d01:	6a 0e                	push   $0xe
80101d03:	53                   	push   %ebx
80101d04:	57                   	push   %edi
80101d05:	e8 96 28 00 00       	call   801045a0 <memmove>
80101d0a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101d0d:	83 c4 10             	add    $0x10,%esp
80101d10:	89 d3                	mov    %edx,%ebx
80101d12:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d15:	75 11                	jne    80101d28 <namex+0xb8>
80101d17:	89 f6                	mov    %esi,%esi
80101d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101d20:	83 c3 01             	add    $0x1,%ebx
80101d23:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d26:	74 f8                	je     80101d20 <namex+0xb0>
80101d28:	83 ec 0c             	sub    $0xc,%esp
80101d2b:	56                   	push   %esi
80101d2c:	e8 7f f9 ff ff       	call   801016b0 <ilock>
80101d31:	83 c4 10             	add    $0x10,%esp
80101d34:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d39:	0f 85 7f 00 00 00    	jne    80101dbe <namex+0x14e>
80101d3f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d42:	85 d2                	test   %edx,%edx
80101d44:	74 09                	je     80101d4f <namex+0xdf>
80101d46:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d49:	0f 84 a3 00 00 00    	je     80101df2 <namex+0x182>
80101d4f:	83 ec 04             	sub    $0x4,%esp
80101d52:	6a 00                	push   $0x0
80101d54:	57                   	push   %edi
80101d55:	56                   	push   %esi
80101d56:	e8 65 fe ff ff       	call   80101bc0 <dirlookup>
80101d5b:	83 c4 10             	add    $0x10,%esp
80101d5e:	85 c0                	test   %eax,%eax
80101d60:	74 5c                	je     80101dbe <namex+0x14e>
80101d62:	83 ec 0c             	sub    $0xc,%esp
80101d65:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d68:	56                   	push   %esi
80101d69:	e8 22 fa ff ff       	call   80101790 <iunlock>
80101d6e:	89 34 24             	mov    %esi,(%esp)
80101d71:	e8 6a fa ff ff       	call   801017e0 <iput>
80101d76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d79:	83 c4 10             	add    $0x10,%esp
80101d7c:	89 c6                	mov    %eax,%esi
80101d7e:	e9 38 ff ff ff       	jmp    80101cbb <namex+0x4b>
80101d83:	31 c9                	xor    %ecx,%ecx
80101d85:	8d 76 00             	lea    0x0(%esi),%esi
80101d88:	83 ec 04             	sub    $0x4,%esp
80101d8b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d8e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d91:	51                   	push   %ecx
80101d92:	53                   	push   %ebx
80101d93:	57                   	push   %edi
80101d94:	e8 07 28 00 00       	call   801045a0 <memmove>
80101d99:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d9c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d9f:	83 c4 10             	add    $0x10,%esp
80101da2:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101da6:	89 d3                	mov    %edx,%ebx
80101da8:	e9 65 ff ff ff       	jmp    80101d12 <namex+0xa2>
80101dad:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101db0:	85 c0                	test   %eax,%eax
80101db2:	75 54                	jne    80101e08 <namex+0x198>
80101db4:	89 f0                	mov    %esi,%eax
80101db6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101db9:	5b                   	pop    %ebx
80101dba:	5e                   	pop    %esi
80101dbb:	5f                   	pop    %edi
80101dbc:	5d                   	pop    %ebp
80101dbd:	c3                   	ret    
80101dbe:	83 ec 0c             	sub    $0xc,%esp
80101dc1:	56                   	push   %esi
80101dc2:	e8 c9 f9 ff ff       	call   80101790 <iunlock>
80101dc7:	89 34 24             	mov    %esi,(%esp)
80101dca:	e8 11 fa ff ff       	call   801017e0 <iput>
80101dcf:	83 c4 10             	add    $0x10,%esp
80101dd2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101dd5:	31 c0                	xor    %eax,%eax
80101dd7:	5b                   	pop    %ebx
80101dd8:	5e                   	pop    %esi
80101dd9:	5f                   	pop    %edi
80101dda:	5d                   	pop    %ebp
80101ddb:	c3                   	ret    
80101ddc:	ba 01 00 00 00       	mov    $0x1,%edx
80101de1:	b8 01 00 00 00       	mov    $0x1,%eax
80101de6:	e8 65 f4 ff ff       	call   80101250 <iget>
80101deb:	89 c6                	mov    %eax,%esi
80101ded:	e9 c9 fe ff ff       	jmp    80101cbb <namex+0x4b>
80101df2:	83 ec 0c             	sub    $0xc,%esp
80101df5:	56                   	push   %esi
80101df6:	e8 95 f9 ff ff       	call   80101790 <iunlock>
80101dfb:	83 c4 10             	add    $0x10,%esp
80101dfe:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e01:	89 f0                	mov    %esi,%eax
80101e03:	5b                   	pop    %ebx
80101e04:	5e                   	pop    %esi
80101e05:	5f                   	pop    %edi
80101e06:	5d                   	pop    %ebp
80101e07:	c3                   	ret    
80101e08:	83 ec 0c             	sub    $0xc,%esp
80101e0b:	56                   	push   %esi
80101e0c:	e8 cf f9 ff ff       	call   801017e0 <iput>
80101e11:	83 c4 10             	add    $0x10,%esp
80101e14:	31 c0                	xor    %eax,%eax
80101e16:	eb 9e                	jmp    80101db6 <namex+0x146>
80101e18:	90                   	nop
80101e19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101e20 <dirlink>:
80101e20:	55                   	push   %ebp
80101e21:	89 e5                	mov    %esp,%ebp
80101e23:	57                   	push   %edi
80101e24:	56                   	push   %esi
80101e25:	53                   	push   %ebx
80101e26:	83 ec 20             	sub    $0x20,%esp
80101e29:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101e2c:	6a 00                	push   $0x0
80101e2e:	ff 75 0c             	pushl  0xc(%ebp)
80101e31:	53                   	push   %ebx
80101e32:	e8 89 fd ff ff       	call   80101bc0 <dirlookup>
80101e37:	83 c4 10             	add    $0x10,%esp
80101e3a:	85 c0                	test   %eax,%eax
80101e3c:	75 67                	jne    80101ea5 <dirlink+0x85>
80101e3e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e41:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e44:	85 ff                	test   %edi,%edi
80101e46:	74 29                	je     80101e71 <dirlink+0x51>
80101e48:	31 ff                	xor    %edi,%edi
80101e4a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e4d:	eb 09                	jmp    80101e58 <dirlink+0x38>
80101e4f:	90                   	nop
80101e50:	83 c7 10             	add    $0x10,%edi
80101e53:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101e56:	76 19                	jbe    80101e71 <dirlink+0x51>
80101e58:	6a 10                	push   $0x10
80101e5a:	57                   	push   %edi
80101e5b:	56                   	push   %esi
80101e5c:	53                   	push   %ebx
80101e5d:	e8 0e fb ff ff       	call   80101970 <readi>
80101e62:	83 c4 10             	add    $0x10,%esp
80101e65:	83 f8 10             	cmp    $0x10,%eax
80101e68:	75 4e                	jne    80101eb8 <dirlink+0x98>
80101e6a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e6f:	75 df                	jne    80101e50 <dirlink+0x30>
80101e71:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e74:	83 ec 04             	sub    $0x4,%esp
80101e77:	6a 0e                	push   $0xe
80101e79:	ff 75 0c             	pushl  0xc(%ebp)
80101e7c:	50                   	push   %eax
80101e7d:	e8 0e 28 00 00       	call   80104690 <strncpy>
80101e82:	8b 45 10             	mov    0x10(%ebp),%eax
80101e85:	6a 10                	push   $0x10
80101e87:	57                   	push   %edi
80101e88:	56                   	push   %esi
80101e89:	53                   	push   %ebx
80101e8a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101e8e:	e8 dd fb ff ff       	call   80101a70 <writei>
80101e93:	83 c4 20             	add    $0x20,%esp
80101e96:	83 f8 10             	cmp    $0x10,%eax
80101e99:	75 2a                	jne    80101ec5 <dirlink+0xa5>
80101e9b:	31 c0                	xor    %eax,%eax
80101e9d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ea0:	5b                   	pop    %ebx
80101ea1:	5e                   	pop    %esi
80101ea2:	5f                   	pop    %edi
80101ea3:	5d                   	pop    %ebp
80101ea4:	c3                   	ret    
80101ea5:	83 ec 0c             	sub    $0xc,%esp
80101ea8:	50                   	push   %eax
80101ea9:	e8 32 f9 ff ff       	call   801017e0 <iput>
80101eae:	83 c4 10             	add    $0x10,%esp
80101eb1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101eb6:	eb e5                	jmp    80101e9d <dirlink+0x7d>
80101eb8:	83 ec 0c             	sub    $0xc,%esp
80101ebb:	68 15 71 10 80       	push   $0x80107115
80101ec0:	e8 ab e4 ff ff       	call   80100370 <panic>
80101ec5:	83 ec 0c             	sub    $0xc,%esp
80101ec8:	68 de 76 10 80       	push   $0x801076de
80101ecd:	e8 9e e4 ff ff       	call   80100370 <panic>
80101ed2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ee0 <namei>:
80101ee0:	55                   	push   %ebp
80101ee1:	31 d2                	xor    %edx,%edx
80101ee3:	89 e5                	mov    %esp,%ebp
80101ee5:	83 ec 18             	sub    $0x18,%esp
80101ee8:	8b 45 08             	mov    0x8(%ebp),%eax
80101eeb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101eee:	e8 7d fd ff ff       	call   80101c70 <namex>
80101ef3:	c9                   	leave  
80101ef4:	c3                   	ret    
80101ef5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ef9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f00 <nameiparent>:
80101f00:	55                   	push   %ebp
80101f01:	ba 01 00 00 00       	mov    $0x1,%edx
80101f06:	89 e5                	mov    %esp,%ebp
80101f08:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f0b:	8b 45 08             	mov    0x8(%ebp),%eax
80101f0e:	5d                   	pop    %ebp
80101f0f:	e9 5c fd ff ff       	jmp    80101c70 <namex>
80101f14:	66 90                	xchg   %ax,%ax
80101f16:	66 90                	xchg   %ax,%ax
80101f18:	66 90                	xchg   %ax,%ax
80101f1a:	66 90                	xchg   %ax,%ax
80101f1c:	66 90                	xchg   %ax,%ax
80101f1e:	66 90                	xchg   %ax,%ax

80101f20 <idestart>:
80101f20:	55                   	push   %ebp
80101f21:	85 c0                	test   %eax,%eax
80101f23:	89 e5                	mov    %esp,%ebp
80101f25:	56                   	push   %esi
80101f26:	53                   	push   %ebx
80101f27:	0f 84 ad 00 00 00    	je     80101fda <idestart+0xba>
80101f2d:	8b 58 08             	mov    0x8(%eax),%ebx
80101f30:	89 c1                	mov    %eax,%ecx
80101f32:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f38:	0f 87 8f 00 00 00    	ja     80101fcd <idestart+0xad>
80101f3e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f43:	90                   	nop
80101f44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f48:	ec                   	in     (%dx),%al
80101f49:	83 e0 c0             	and    $0xffffffc0,%eax
80101f4c:	3c 40                	cmp    $0x40,%al
80101f4e:	75 f8                	jne    80101f48 <idestart+0x28>
80101f50:	31 f6                	xor    %esi,%esi
80101f52:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f57:	89 f0                	mov    %esi,%eax
80101f59:	ee                   	out    %al,(%dx)
80101f5a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f5f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f64:	ee                   	out    %al,(%dx)
80101f65:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f6a:	89 d8                	mov    %ebx,%eax
80101f6c:	ee                   	out    %al,(%dx)
80101f6d:	89 d8                	mov    %ebx,%eax
80101f6f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f74:	c1 f8 08             	sar    $0x8,%eax
80101f77:	ee                   	out    %al,(%dx)
80101f78:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f7d:	89 f0                	mov    %esi,%eax
80101f7f:	ee                   	out    %al,(%dx)
80101f80:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f84:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f89:	83 e0 01             	and    $0x1,%eax
80101f8c:	c1 e0 04             	shl    $0x4,%eax
80101f8f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f92:	ee                   	out    %al,(%dx)
80101f93:	f6 01 04             	testb  $0x4,(%ecx)
80101f96:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f9b:	75 13                	jne    80101fb0 <idestart+0x90>
80101f9d:	b8 20 00 00 00       	mov    $0x20,%eax
80101fa2:	ee                   	out    %al,(%dx)
80101fa3:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101fa6:	5b                   	pop    %ebx
80101fa7:	5e                   	pop    %esi
80101fa8:	5d                   	pop    %ebp
80101fa9:	c3                   	ret    
80101faa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101fb0:	b8 30 00 00 00       	mov    $0x30,%eax
80101fb5:	ee                   	out    %al,(%dx)
80101fb6:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101fbb:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101fbe:	b9 80 00 00 00       	mov    $0x80,%ecx
80101fc3:	fc                   	cld    
80101fc4:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80101fc6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101fc9:	5b                   	pop    %ebx
80101fca:	5e                   	pop    %esi
80101fcb:	5d                   	pop    %ebp
80101fcc:	c3                   	ret    
80101fcd:	83 ec 0c             	sub    $0xc,%esp
80101fd0:	68 80 71 10 80       	push   $0x80107180
80101fd5:	e8 96 e3 ff ff       	call   80100370 <panic>
80101fda:	83 ec 0c             	sub    $0xc,%esp
80101fdd:	68 77 71 10 80       	push   $0x80107177
80101fe2:	e8 89 e3 ff ff       	call   80100370 <panic>
80101fe7:	89 f6                	mov    %esi,%esi
80101fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ff0 <ideinit>:
80101ff0:	55                   	push   %ebp
80101ff1:	89 e5                	mov    %esp,%ebp
80101ff3:	83 ec 10             	sub    $0x10,%esp
80101ff6:	68 92 71 10 80       	push   $0x80107192
80101ffb:	68 80 a5 10 80       	push   $0x8010a580
80102000:	e8 9b 22 00 00       	call   801042a0 <initlock>
80102005:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
8010200c:	e8 cf 12 00 00       	call   801032e0 <picenable>
80102011:	58                   	pop    %eax
80102012:	a1 80 2d 11 80       	mov    0x80112d80,%eax
80102017:	5a                   	pop    %edx
80102018:	83 e8 01             	sub    $0x1,%eax
8010201b:	50                   	push   %eax
8010201c:	6a 0e                	push   $0xe
8010201e:	e8 bd 02 00 00       	call   801022e0 <ioapicenable>
80102023:	83 c4 10             	add    $0x10,%esp
80102026:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010202b:	90                   	nop
8010202c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102030:	ec                   	in     (%dx),%al
80102031:	83 e0 c0             	and    $0xffffffc0,%eax
80102034:	3c 40                	cmp    $0x40,%al
80102036:	75 f8                	jne    80102030 <ideinit+0x40>
80102038:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010203d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102042:	ee                   	out    %al,(%dx)
80102043:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80102048:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010204d:	eb 06                	jmp    80102055 <ideinit+0x65>
8010204f:	90                   	nop
80102050:	83 e9 01             	sub    $0x1,%ecx
80102053:	74 0f                	je     80102064 <ideinit+0x74>
80102055:	ec                   	in     (%dx),%al
80102056:	84 c0                	test   %al,%al
80102058:	74 f6                	je     80102050 <ideinit+0x60>
8010205a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102061:	00 00 00 
80102064:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102069:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010206e:	ee                   	out    %al,(%dx)
8010206f:	c9                   	leave  
80102070:	c3                   	ret    
80102071:	eb 0d                	jmp    80102080 <ideintr>
80102073:	90                   	nop
80102074:	90                   	nop
80102075:	90                   	nop
80102076:	90                   	nop
80102077:	90                   	nop
80102078:	90                   	nop
80102079:	90                   	nop
8010207a:	90                   	nop
8010207b:	90                   	nop
8010207c:	90                   	nop
8010207d:	90                   	nop
8010207e:	90                   	nop
8010207f:	90                   	nop

80102080 <ideintr>:
80102080:	55                   	push   %ebp
80102081:	89 e5                	mov    %esp,%ebp
80102083:	57                   	push   %edi
80102084:	56                   	push   %esi
80102085:	53                   	push   %ebx
80102086:	83 ec 18             	sub    $0x18,%esp
80102089:	68 80 a5 10 80       	push   $0x8010a580
8010208e:	e8 2d 22 00 00       	call   801042c0 <acquire>
80102093:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
80102099:	83 c4 10             	add    $0x10,%esp
8010209c:	85 db                	test   %ebx,%ebx
8010209e:	74 34                	je     801020d4 <ideintr+0x54>
801020a0:	8b 43 58             	mov    0x58(%ebx),%eax
801020a3:	a3 64 a5 10 80       	mov    %eax,0x8010a564
801020a8:	8b 33                	mov    (%ebx),%esi
801020aa:	f7 c6 04 00 00 00    	test   $0x4,%esi
801020b0:	74 3e                	je     801020f0 <ideintr+0x70>
801020b2:	83 e6 fb             	and    $0xfffffffb,%esi
801020b5:	83 ec 0c             	sub    $0xc,%esp
801020b8:	83 ce 02             	or     $0x2,%esi
801020bb:	89 33                	mov    %esi,(%ebx)
801020bd:	53                   	push   %ebx
801020be:	e8 1d 1f 00 00       	call   80103fe0 <wakeup>
801020c3:	a1 64 a5 10 80       	mov    0x8010a564,%eax
801020c8:	83 c4 10             	add    $0x10,%esp
801020cb:	85 c0                	test   %eax,%eax
801020cd:	74 05                	je     801020d4 <ideintr+0x54>
801020cf:	e8 4c fe ff ff       	call   80101f20 <idestart>
801020d4:	83 ec 0c             	sub    $0xc,%esp
801020d7:	68 80 a5 10 80       	push   $0x8010a580
801020dc:	e8 bf 23 00 00       	call   801044a0 <release>
801020e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020e4:	5b                   	pop    %ebx
801020e5:	5e                   	pop    %esi
801020e6:	5f                   	pop    %edi
801020e7:	5d                   	pop    %ebp
801020e8:	c3                   	ret    
801020e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801020f0:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020f5:	8d 76 00             	lea    0x0(%esi),%esi
801020f8:	ec                   	in     (%dx),%al
801020f9:	89 c1                	mov    %eax,%ecx
801020fb:	83 e1 c0             	and    $0xffffffc0,%ecx
801020fe:	80 f9 40             	cmp    $0x40,%cl
80102101:	75 f5                	jne    801020f8 <ideintr+0x78>
80102103:	a8 21                	test   $0x21,%al
80102105:	75 ab                	jne    801020b2 <ideintr+0x32>
80102107:	8d 7b 5c             	lea    0x5c(%ebx),%edi
8010210a:	b9 80 00 00 00       	mov    $0x80,%ecx
8010210f:	ba f0 01 00 00       	mov    $0x1f0,%edx
80102114:	fc                   	cld    
80102115:	f3 6d                	rep insl (%dx),%es:(%edi)
80102117:	8b 33                	mov    (%ebx),%esi
80102119:	eb 97                	jmp    801020b2 <ideintr+0x32>
8010211b:	90                   	nop
8010211c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102120 <iderw>:
80102120:	55                   	push   %ebp
80102121:	89 e5                	mov    %esp,%ebp
80102123:	53                   	push   %ebx
80102124:	83 ec 10             	sub    $0x10,%esp
80102127:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010212a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010212d:	50                   	push   %eax
8010212e:	e8 3d 21 00 00       	call   80104270 <holdingsleep>
80102133:	83 c4 10             	add    $0x10,%esp
80102136:	85 c0                	test   %eax,%eax
80102138:	0f 84 ad 00 00 00    	je     801021eb <iderw+0xcb>
8010213e:	8b 03                	mov    (%ebx),%eax
80102140:	83 e0 06             	and    $0x6,%eax
80102143:	83 f8 02             	cmp    $0x2,%eax
80102146:	0f 84 b9 00 00 00    	je     80102205 <iderw+0xe5>
8010214c:	8b 53 04             	mov    0x4(%ebx),%edx
8010214f:	85 d2                	test   %edx,%edx
80102151:	74 0d                	je     80102160 <iderw+0x40>
80102153:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102158:	85 c0                	test   %eax,%eax
8010215a:	0f 84 98 00 00 00    	je     801021f8 <iderw+0xd8>
80102160:	83 ec 0c             	sub    $0xc,%esp
80102163:	68 80 a5 10 80       	push   $0x8010a580
80102168:	e8 53 21 00 00       	call   801042c0 <acquire>
8010216d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102173:	83 c4 10             	add    $0x10,%esp
80102176:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
8010217d:	85 d2                	test   %edx,%edx
8010217f:	75 09                	jne    8010218a <iderw+0x6a>
80102181:	eb 58                	jmp    801021db <iderw+0xbb>
80102183:	90                   	nop
80102184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102188:	89 c2                	mov    %eax,%edx
8010218a:	8b 42 58             	mov    0x58(%edx),%eax
8010218d:	85 c0                	test   %eax,%eax
8010218f:	75 f7                	jne    80102188 <iderw+0x68>
80102191:	83 c2 58             	add    $0x58,%edx
80102194:	89 1a                	mov    %ebx,(%edx)
80102196:	3b 1d 64 a5 10 80    	cmp    0x8010a564,%ebx
8010219c:	74 44                	je     801021e2 <iderw+0xc2>
8010219e:	8b 03                	mov    (%ebx),%eax
801021a0:	83 e0 06             	and    $0x6,%eax
801021a3:	83 f8 02             	cmp    $0x2,%eax
801021a6:	74 23                	je     801021cb <iderw+0xab>
801021a8:	90                   	nop
801021a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801021b0:	83 ec 08             	sub    $0x8,%esp
801021b3:	68 80 a5 10 80       	push   $0x8010a580
801021b8:	53                   	push   %ebx
801021b9:	e8 82 1c 00 00       	call   80103e40 <sleep>
801021be:	8b 03                	mov    (%ebx),%eax
801021c0:	83 c4 10             	add    $0x10,%esp
801021c3:	83 e0 06             	and    $0x6,%eax
801021c6:	83 f8 02             	cmp    $0x2,%eax
801021c9:	75 e5                	jne    801021b0 <iderw+0x90>
801021cb:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
801021d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801021d5:	c9                   	leave  
801021d6:	e9 c5 22 00 00       	jmp    801044a0 <release>
801021db:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
801021e0:	eb b2                	jmp    80102194 <iderw+0x74>
801021e2:	89 d8                	mov    %ebx,%eax
801021e4:	e8 37 fd ff ff       	call   80101f20 <idestart>
801021e9:	eb b3                	jmp    8010219e <iderw+0x7e>
801021eb:	83 ec 0c             	sub    $0xc,%esp
801021ee:	68 96 71 10 80       	push   $0x80107196
801021f3:	e8 78 e1 ff ff       	call   80100370 <panic>
801021f8:	83 ec 0c             	sub    $0xc,%esp
801021fb:	68 c1 71 10 80       	push   $0x801071c1
80102200:	e8 6b e1 ff ff       	call   80100370 <panic>
80102205:	83 ec 0c             	sub    $0xc,%esp
80102208:	68 ac 71 10 80       	push   $0x801071ac
8010220d:	e8 5e e1 ff ff       	call   80100370 <panic>
80102212:	66 90                	xchg   %ax,%ax
80102214:	66 90                	xchg   %ax,%ax
80102216:	66 90                	xchg   %ax,%ax
80102218:	66 90                	xchg   %ax,%ax
8010221a:	66 90                	xchg   %ax,%ax
8010221c:	66 90                	xchg   %ax,%ax
8010221e:	66 90                	xchg   %ax,%ax

80102220 <ioapicinit>:
80102220:	a1 84 27 11 80       	mov    0x80112784,%eax
80102225:	85 c0                	test   %eax,%eax
80102227:	0f 84 a8 00 00 00    	je     801022d5 <ioapicinit+0xb5>
8010222d:	55                   	push   %ebp
8010222e:	c7 05 54 26 11 80 00 	movl   $0xfec00000,0x80112654
80102235:	00 c0 fe 
80102238:	89 e5                	mov    %esp,%ebp
8010223a:	56                   	push   %esi
8010223b:	53                   	push   %ebx
8010223c:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102243:	00 00 00 
80102246:	8b 15 54 26 11 80    	mov    0x80112654,%edx
8010224c:	8b 72 10             	mov    0x10(%edx),%esi
8010224f:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
80102255:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
8010225b:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
80102262:	89 f0                	mov    %esi,%eax
80102264:	c1 e8 10             	shr    $0x10,%eax
80102267:	0f b6 f0             	movzbl %al,%esi
8010226a:	8b 41 10             	mov    0x10(%ecx),%eax
8010226d:	c1 e8 18             	shr    $0x18,%eax
80102270:	39 d0                	cmp    %edx,%eax
80102272:	74 16                	je     8010228a <ioapicinit+0x6a>
80102274:	83 ec 0c             	sub    $0xc,%esp
80102277:	68 e0 71 10 80       	push   $0x801071e0
8010227c:	e8 df e3 ff ff       	call   80100660 <cprintf>
80102281:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102287:	83 c4 10             	add    $0x10,%esp
8010228a:	83 c6 21             	add    $0x21,%esi
8010228d:	ba 10 00 00 00       	mov    $0x10,%edx
80102292:	b8 20 00 00 00       	mov    $0x20,%eax
80102297:	89 f6                	mov    %esi,%esi
80102299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801022a0:	89 11                	mov    %edx,(%ecx)
801022a2:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
801022a8:	89 c3                	mov    %eax,%ebx
801022aa:	81 cb 00 00 01 00    	or     $0x10000,%ebx
801022b0:	83 c0 01             	add    $0x1,%eax
801022b3:	89 59 10             	mov    %ebx,0x10(%ecx)
801022b6:	8d 5a 01             	lea    0x1(%edx),%ebx
801022b9:	83 c2 02             	add    $0x2,%edx
801022bc:	39 f0                	cmp    %esi,%eax
801022be:	89 19                	mov    %ebx,(%ecx)
801022c0:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
801022c6:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
801022cd:	75 d1                	jne    801022a0 <ioapicinit+0x80>
801022cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801022d2:	5b                   	pop    %ebx
801022d3:	5e                   	pop    %esi
801022d4:	5d                   	pop    %ebp
801022d5:	f3 c3                	repz ret 
801022d7:	89 f6                	mov    %esi,%esi
801022d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801022e0 <ioapicenable>:
801022e0:	8b 15 84 27 11 80    	mov    0x80112784,%edx
801022e6:	55                   	push   %ebp
801022e7:	89 e5                	mov    %esp,%ebp
801022e9:	85 d2                	test   %edx,%edx
801022eb:	8b 45 08             	mov    0x8(%ebp),%eax
801022ee:	74 2b                	je     8010231b <ioapicenable+0x3b>
801022f0:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
801022f6:	8d 50 20             	lea    0x20(%eax),%edx
801022f9:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
801022fd:	89 01                	mov    %eax,(%ecx)
801022ff:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102305:	83 c0 01             	add    $0x1,%eax
80102308:	89 51 10             	mov    %edx,0x10(%ecx)
8010230b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010230e:	89 01                	mov    %eax,(%ecx)
80102310:	a1 54 26 11 80       	mov    0x80112654,%eax
80102315:	c1 e2 18             	shl    $0x18,%edx
80102318:	89 50 10             	mov    %edx,0x10(%eax)
8010231b:	5d                   	pop    %ebp
8010231c:	c3                   	ret    
8010231d:	66 90                	xchg   %ax,%ax
8010231f:	90                   	nop

80102320 <kfree>:
80102320:	55                   	push   %ebp
80102321:	89 e5                	mov    %esp,%ebp
80102323:	53                   	push   %ebx
80102324:	83 ec 04             	sub    $0x4,%esp
80102327:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010232a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102330:	75 70                	jne    801023a2 <kfree+0x82>
80102332:	81 fb 28 55 11 80    	cmp    $0x80115528,%ebx
80102338:	72 68                	jb     801023a2 <kfree+0x82>
8010233a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102340:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102345:	77 5b                	ja     801023a2 <kfree+0x82>
80102347:	83 ec 04             	sub    $0x4,%esp
8010234a:	68 00 10 00 00       	push   $0x1000
8010234f:	6a 01                	push   $0x1
80102351:	53                   	push   %ebx
80102352:	e8 99 21 00 00       	call   801044f0 <memset>
80102357:	8b 15 94 26 11 80    	mov    0x80112694,%edx
8010235d:	83 c4 10             	add    $0x10,%esp
80102360:	85 d2                	test   %edx,%edx
80102362:	75 2c                	jne    80102390 <kfree+0x70>
80102364:	a1 98 26 11 80       	mov    0x80112698,%eax
80102369:	89 03                	mov    %eax,(%ebx)
8010236b:	a1 94 26 11 80       	mov    0x80112694,%eax
80102370:	89 1d 98 26 11 80    	mov    %ebx,0x80112698
80102376:	85 c0                	test   %eax,%eax
80102378:	75 06                	jne    80102380 <kfree+0x60>
8010237a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010237d:	c9                   	leave  
8010237e:	c3                   	ret    
8010237f:	90                   	nop
80102380:	c7 45 08 60 26 11 80 	movl   $0x80112660,0x8(%ebp)
80102387:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010238a:	c9                   	leave  
8010238b:	e9 10 21 00 00       	jmp    801044a0 <release>
80102390:	83 ec 0c             	sub    $0xc,%esp
80102393:	68 60 26 11 80       	push   $0x80112660
80102398:	e8 23 1f 00 00       	call   801042c0 <acquire>
8010239d:	83 c4 10             	add    $0x10,%esp
801023a0:	eb c2                	jmp    80102364 <kfree+0x44>
801023a2:	83 ec 0c             	sub    $0xc,%esp
801023a5:	68 12 72 10 80       	push   $0x80107212
801023aa:	e8 c1 df ff ff       	call   80100370 <panic>
801023af:	90                   	nop

801023b0 <freerange>:
801023b0:	55                   	push   %ebp
801023b1:	89 e5                	mov    %esp,%ebp
801023b3:	56                   	push   %esi
801023b4:	53                   	push   %ebx
801023b5:	8b 45 08             	mov    0x8(%ebp),%eax
801023b8:	8b 75 0c             	mov    0xc(%ebp),%esi
801023bb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023c1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801023c7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023cd:	39 de                	cmp    %ebx,%esi
801023cf:	72 23                	jb     801023f4 <freerange+0x44>
801023d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801023d8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023de:	83 ec 0c             	sub    $0xc,%esp
801023e1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023e7:	50                   	push   %eax
801023e8:	e8 33 ff ff ff       	call   80102320 <kfree>
801023ed:	83 c4 10             	add    $0x10,%esp
801023f0:	39 f3                	cmp    %esi,%ebx
801023f2:	76 e4                	jbe    801023d8 <freerange+0x28>
801023f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023f7:	5b                   	pop    %ebx
801023f8:	5e                   	pop    %esi
801023f9:	5d                   	pop    %ebp
801023fa:	c3                   	ret    
801023fb:	90                   	nop
801023fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102400 <kinit1>:
80102400:	55                   	push   %ebp
80102401:	89 e5                	mov    %esp,%ebp
80102403:	56                   	push   %esi
80102404:	53                   	push   %ebx
80102405:	8b 75 0c             	mov    0xc(%ebp),%esi
80102408:	83 ec 08             	sub    $0x8,%esp
8010240b:	68 18 72 10 80       	push   $0x80107218
80102410:	68 60 26 11 80       	push   $0x80112660
80102415:	e8 86 1e 00 00       	call   801042a0 <initlock>
8010241a:	8b 45 08             	mov    0x8(%ebp),%eax
8010241d:	83 c4 10             	add    $0x10,%esp
80102420:	c7 05 94 26 11 80 00 	movl   $0x0,0x80112694
80102427:	00 00 00 
8010242a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102430:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102436:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010243c:	39 de                	cmp    %ebx,%esi
8010243e:	72 1c                	jb     8010245c <kinit1+0x5c>
80102440:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102446:	83 ec 0c             	sub    $0xc,%esp
80102449:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010244f:	50                   	push   %eax
80102450:	e8 cb fe ff ff       	call   80102320 <kfree>
80102455:	83 c4 10             	add    $0x10,%esp
80102458:	39 de                	cmp    %ebx,%esi
8010245a:	73 e4                	jae    80102440 <kinit1+0x40>
8010245c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010245f:	5b                   	pop    %ebx
80102460:	5e                   	pop    %esi
80102461:	5d                   	pop    %ebp
80102462:	c3                   	ret    
80102463:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102470 <kinit2>:
80102470:	55                   	push   %ebp
80102471:	89 e5                	mov    %esp,%ebp
80102473:	56                   	push   %esi
80102474:	53                   	push   %ebx
80102475:	8b 45 08             	mov    0x8(%ebp),%eax
80102478:	8b 75 0c             	mov    0xc(%ebp),%esi
8010247b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102481:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102487:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010248d:	39 de                	cmp    %ebx,%esi
8010248f:	72 23                	jb     801024b4 <kinit2+0x44>
80102491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102498:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010249e:	83 ec 0c             	sub    $0xc,%esp
801024a1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801024a7:	50                   	push   %eax
801024a8:	e8 73 fe ff ff       	call   80102320 <kfree>
801024ad:	83 c4 10             	add    $0x10,%esp
801024b0:	39 de                	cmp    %ebx,%esi
801024b2:	73 e4                	jae    80102498 <kinit2+0x28>
801024b4:	c7 05 94 26 11 80 01 	movl   $0x1,0x80112694
801024bb:	00 00 00 
801024be:	8d 65 f8             	lea    -0x8(%ebp),%esp
801024c1:	5b                   	pop    %ebx
801024c2:	5e                   	pop    %esi
801024c3:	5d                   	pop    %ebp
801024c4:	c3                   	ret    
801024c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801024c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801024d0 <kalloc>:
801024d0:	55                   	push   %ebp
801024d1:	89 e5                	mov    %esp,%ebp
801024d3:	53                   	push   %ebx
801024d4:	83 ec 04             	sub    $0x4,%esp
801024d7:	a1 94 26 11 80       	mov    0x80112694,%eax
801024dc:	85 c0                	test   %eax,%eax
801024de:	75 30                	jne    80102510 <kalloc+0x40>
801024e0:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
801024e6:	85 db                	test   %ebx,%ebx
801024e8:	74 1c                	je     80102506 <kalloc+0x36>
801024ea:	8b 13                	mov    (%ebx),%edx
801024ec:	89 15 98 26 11 80    	mov    %edx,0x80112698
801024f2:	85 c0                	test   %eax,%eax
801024f4:	74 10                	je     80102506 <kalloc+0x36>
801024f6:	83 ec 0c             	sub    $0xc,%esp
801024f9:	68 60 26 11 80       	push   $0x80112660
801024fe:	e8 9d 1f 00 00       	call   801044a0 <release>
80102503:	83 c4 10             	add    $0x10,%esp
80102506:	89 d8                	mov    %ebx,%eax
80102508:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010250b:	c9                   	leave  
8010250c:	c3                   	ret    
8010250d:	8d 76 00             	lea    0x0(%esi),%esi
80102510:	83 ec 0c             	sub    $0xc,%esp
80102513:	68 60 26 11 80       	push   $0x80112660
80102518:	e8 a3 1d 00 00       	call   801042c0 <acquire>
8010251d:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
80102523:	83 c4 10             	add    $0x10,%esp
80102526:	a1 94 26 11 80       	mov    0x80112694,%eax
8010252b:	85 db                	test   %ebx,%ebx
8010252d:	75 bb                	jne    801024ea <kalloc+0x1a>
8010252f:	eb c1                	jmp    801024f2 <kalloc+0x22>
80102531:	66 90                	xchg   %ax,%ax
80102533:	66 90                	xchg   %ax,%ax
80102535:	66 90                	xchg   %ax,%ax
80102537:	66 90                	xchg   %ax,%ax
80102539:	66 90                	xchg   %ax,%ax
8010253b:	66 90                	xchg   %ax,%ax
8010253d:	66 90                	xchg   %ax,%ax
8010253f:	90                   	nop

80102540 <kbdgetc>:
80102540:	55                   	push   %ebp
80102541:	ba 64 00 00 00       	mov    $0x64,%edx
80102546:	89 e5                	mov    %esp,%ebp
80102548:	ec                   	in     (%dx),%al
80102549:	a8 01                	test   $0x1,%al
8010254b:	0f 84 af 00 00 00    	je     80102600 <kbdgetc+0xc0>
80102551:	ba 60 00 00 00       	mov    $0x60,%edx
80102556:	ec                   	in     (%dx),%al
80102557:	0f b6 d0             	movzbl %al,%edx
8010255a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102560:	74 7e                	je     801025e0 <kbdgetc+0xa0>
80102562:	84 c0                	test   %al,%al
80102564:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
8010256a:	79 24                	jns    80102590 <kbdgetc+0x50>
8010256c:	f6 c1 40             	test   $0x40,%cl
8010256f:	75 05                	jne    80102576 <kbdgetc+0x36>
80102571:	89 c2                	mov    %eax,%edx
80102573:	83 e2 7f             	and    $0x7f,%edx
80102576:	0f b6 82 40 73 10 80 	movzbl -0x7fef8cc0(%edx),%eax
8010257d:	83 c8 40             	or     $0x40,%eax
80102580:	0f b6 c0             	movzbl %al,%eax
80102583:	f7 d0                	not    %eax
80102585:	21 c8                	and    %ecx,%eax
80102587:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
8010258c:	31 c0                	xor    %eax,%eax
8010258e:	5d                   	pop    %ebp
8010258f:	c3                   	ret    
80102590:	f6 c1 40             	test   $0x40,%cl
80102593:	74 09                	je     8010259e <kbdgetc+0x5e>
80102595:	83 c8 80             	or     $0xffffff80,%eax
80102598:	83 e1 bf             	and    $0xffffffbf,%ecx
8010259b:	0f b6 d0             	movzbl %al,%edx
8010259e:	0f b6 82 40 73 10 80 	movzbl -0x7fef8cc0(%edx),%eax
801025a5:	09 c1                	or     %eax,%ecx
801025a7:	0f b6 82 40 72 10 80 	movzbl -0x7fef8dc0(%edx),%eax
801025ae:	31 c1                	xor    %eax,%ecx
801025b0:	89 c8                	mov    %ecx,%eax
801025b2:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
801025b8:	83 e0 03             	and    $0x3,%eax
801025bb:	83 e1 08             	and    $0x8,%ecx
801025be:	8b 04 85 20 72 10 80 	mov    -0x7fef8de0(,%eax,4),%eax
801025c5:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
801025c9:	74 c3                	je     8010258e <kbdgetc+0x4e>
801025cb:	8d 50 9f             	lea    -0x61(%eax),%edx
801025ce:	83 fa 19             	cmp    $0x19,%edx
801025d1:	77 1d                	ja     801025f0 <kbdgetc+0xb0>
801025d3:	83 e8 20             	sub    $0x20,%eax
801025d6:	5d                   	pop    %ebp
801025d7:	c3                   	ret    
801025d8:	90                   	nop
801025d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801025e0:	31 c0                	xor    %eax,%eax
801025e2:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
801025e9:	5d                   	pop    %ebp
801025ea:	c3                   	ret    
801025eb:	90                   	nop
801025ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025f0:	8d 48 bf             	lea    -0x41(%eax),%ecx
801025f3:	8d 50 20             	lea    0x20(%eax),%edx
801025f6:	5d                   	pop    %ebp
801025f7:	83 f9 19             	cmp    $0x19,%ecx
801025fa:	0f 46 c2             	cmovbe %edx,%eax
801025fd:	c3                   	ret    
801025fe:	66 90                	xchg   %ax,%ax
80102600:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102605:	5d                   	pop    %ebp
80102606:	c3                   	ret    
80102607:	89 f6                	mov    %esi,%esi
80102609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102610 <kbdintr>:
80102610:	55                   	push   %ebp
80102611:	89 e5                	mov    %esp,%ebp
80102613:	83 ec 14             	sub    $0x14,%esp
80102616:	68 40 25 10 80       	push   $0x80102540
8010261b:	e8 d0 e1 ff ff       	call   801007f0 <consoleintr>
80102620:	83 c4 10             	add    $0x10,%esp
80102623:	c9                   	leave  
80102624:	c3                   	ret    
80102625:	66 90                	xchg   %ax,%ax
80102627:	66 90                	xchg   %ax,%ax
80102629:	66 90                	xchg   %ax,%ax
8010262b:	66 90                	xchg   %ax,%ax
8010262d:	66 90                	xchg   %ax,%ax
8010262f:	90                   	nop

80102630 <lapicinit>:
80102630:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102635:	55                   	push   %ebp
80102636:	89 e5                	mov    %esp,%ebp
80102638:	85 c0                	test   %eax,%eax
8010263a:	0f 84 c8 00 00 00    	je     80102708 <lapicinit+0xd8>
80102640:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102647:	01 00 00 
8010264a:	8b 50 20             	mov    0x20(%eax),%edx
8010264d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102654:	00 00 00 
80102657:	8b 50 20             	mov    0x20(%eax),%edx
8010265a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102661:	00 02 00 
80102664:	8b 50 20             	mov    0x20(%eax),%edx
80102667:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010266e:	96 98 00 
80102671:	8b 50 20             	mov    0x20(%eax),%edx
80102674:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010267b:	00 01 00 
8010267e:	8b 50 20             	mov    0x20(%eax),%edx
80102681:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102688:	00 01 00 
8010268b:	8b 50 20             	mov    0x20(%eax),%edx
8010268e:	8b 50 30             	mov    0x30(%eax),%edx
80102691:	c1 ea 10             	shr    $0x10,%edx
80102694:	80 fa 03             	cmp    $0x3,%dl
80102697:	77 77                	ja     80102710 <lapicinit+0xe0>
80102699:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801026a0:	00 00 00 
801026a3:	8b 50 20             	mov    0x20(%eax),%edx
801026a6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026ad:	00 00 00 
801026b0:	8b 50 20             	mov    0x20(%eax),%edx
801026b3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026ba:	00 00 00 
801026bd:	8b 50 20             	mov    0x20(%eax),%edx
801026c0:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801026c7:	00 00 00 
801026ca:	8b 50 20             	mov    0x20(%eax),%edx
801026cd:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801026d4:	00 00 00 
801026d7:	8b 50 20             	mov    0x20(%eax),%edx
801026da:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026e1:	85 08 00 
801026e4:	8b 50 20             	mov    0x20(%eax),%edx
801026e7:	89 f6                	mov    %esi,%esi
801026e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801026f0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026f6:	80 e6 10             	and    $0x10,%dh
801026f9:	75 f5                	jne    801026f0 <lapicinit+0xc0>
801026fb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102702:	00 00 00 
80102705:	8b 40 20             	mov    0x20(%eax),%eax
80102708:	5d                   	pop    %ebp
80102709:	c3                   	ret    
8010270a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102710:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102717:	00 01 00 
8010271a:	8b 50 20             	mov    0x20(%eax),%edx
8010271d:	e9 77 ff ff ff       	jmp    80102699 <lapicinit+0x69>
80102722:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102730 <cpunum>:
80102730:	55                   	push   %ebp
80102731:	89 e5                	mov    %esp,%ebp
80102733:	56                   	push   %esi
80102734:	53                   	push   %ebx
80102735:	9c                   	pushf  
80102736:	58                   	pop    %eax
80102737:	f6 c4 02             	test   $0x2,%ah
8010273a:	74 12                	je     8010274e <cpunum+0x1e>
8010273c:	a1 b8 a5 10 80       	mov    0x8010a5b8,%eax
80102741:	8d 50 01             	lea    0x1(%eax),%edx
80102744:	85 c0                	test   %eax,%eax
80102746:	89 15 b8 a5 10 80    	mov    %edx,0x8010a5b8
8010274c:	74 4d                	je     8010279b <cpunum+0x6b>
8010274e:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102753:	85 c0                	test   %eax,%eax
80102755:	74 60                	je     801027b7 <cpunum+0x87>
80102757:	8b 58 20             	mov    0x20(%eax),%ebx
8010275a:	8b 35 80 2d 11 80    	mov    0x80112d80,%esi
80102760:	c1 eb 18             	shr    $0x18,%ebx
80102763:	85 f6                	test   %esi,%esi
80102765:	7e 59                	jle    801027c0 <cpunum+0x90>
80102767:	0f b6 05 a0 27 11 80 	movzbl 0x801127a0,%eax
8010276e:	39 c3                	cmp    %eax,%ebx
80102770:	74 45                	je     801027b7 <cpunum+0x87>
80102772:	ba 5c 28 11 80       	mov    $0x8011285c,%edx
80102777:	31 c0                	xor    %eax,%eax
80102779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102780:	83 c0 01             	add    $0x1,%eax
80102783:	39 f0                	cmp    %esi,%eax
80102785:	74 39                	je     801027c0 <cpunum+0x90>
80102787:	0f b6 0a             	movzbl (%edx),%ecx
8010278a:	81 c2 bc 00 00 00    	add    $0xbc,%edx
80102790:	39 cb                	cmp    %ecx,%ebx
80102792:	75 ec                	jne    80102780 <cpunum+0x50>
80102794:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102797:	5b                   	pop    %ebx
80102798:	5e                   	pop    %esi
80102799:	5d                   	pop    %ebp
8010279a:	c3                   	ret    
8010279b:	83 ec 08             	sub    $0x8,%esp
8010279e:	ff 75 04             	pushl  0x4(%ebp)
801027a1:	68 40 74 10 80       	push   $0x80107440
801027a6:	e8 b5 de ff ff       	call   80100660 <cprintf>
801027ab:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801027b0:	83 c4 10             	add    $0x10,%esp
801027b3:	85 c0                	test   %eax,%eax
801027b5:	75 a0                	jne    80102757 <cpunum+0x27>
801027b7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801027ba:	31 c0                	xor    %eax,%eax
801027bc:	5b                   	pop    %ebx
801027bd:	5e                   	pop    %esi
801027be:	5d                   	pop    %ebp
801027bf:	c3                   	ret    
801027c0:	83 ec 0c             	sub    $0xc,%esp
801027c3:	68 6c 74 10 80       	push   $0x8010746c
801027c8:	e8 a3 db ff ff       	call   80100370 <panic>
801027cd:	8d 76 00             	lea    0x0(%esi),%esi

801027d0 <lapiceoi>:
801027d0:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801027d5:	55                   	push   %ebp
801027d6:	89 e5                	mov    %esp,%ebp
801027d8:	85 c0                	test   %eax,%eax
801027da:	74 0d                	je     801027e9 <lapiceoi+0x19>
801027dc:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801027e3:	00 00 00 
801027e6:	8b 40 20             	mov    0x20(%eax),%eax
801027e9:	5d                   	pop    %ebp
801027ea:	c3                   	ret    
801027eb:	90                   	nop
801027ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801027f0 <microdelay>:
801027f0:	55                   	push   %ebp
801027f1:	89 e5                	mov    %esp,%ebp
801027f3:	5d                   	pop    %ebp
801027f4:	c3                   	ret    
801027f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102800 <lapicstartap>:
80102800:	55                   	push   %ebp
80102801:	ba 70 00 00 00       	mov    $0x70,%edx
80102806:	b8 0f 00 00 00       	mov    $0xf,%eax
8010280b:	89 e5                	mov    %esp,%ebp
8010280d:	53                   	push   %ebx
8010280e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102811:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102814:	ee                   	out    %al,(%dx)
80102815:	ba 71 00 00 00       	mov    $0x71,%edx
8010281a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010281f:	ee                   	out    %al,(%dx)
80102820:	31 c0                	xor    %eax,%eax
80102822:	c1 e3 18             	shl    $0x18,%ebx
80102825:	66 a3 67 04 00 80    	mov    %ax,0x80000467
8010282b:	89 c8                	mov    %ecx,%eax
8010282d:	c1 e9 0c             	shr    $0xc,%ecx
80102830:	c1 e8 04             	shr    $0x4,%eax
80102833:	89 da                	mov    %ebx,%edx
80102835:	80 cd 06             	or     $0x6,%ch
80102838:	66 a3 69 04 00 80    	mov    %ax,0x80000469
8010283e:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102843:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
80102849:	8b 58 20             	mov    0x20(%eax),%ebx
8010284c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102853:	c5 00 00 
80102856:	8b 58 20             	mov    0x20(%eax),%ebx
80102859:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102860:	85 00 00 
80102863:	8b 58 20             	mov    0x20(%eax),%ebx
80102866:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010286c:	8b 58 20             	mov    0x20(%eax),%ebx
8010286f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102875:	8b 58 20             	mov    0x20(%eax),%ebx
80102878:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010287e:	8b 50 20             	mov    0x20(%eax),%edx
80102881:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102887:	8b 40 20             	mov    0x20(%eax),%eax
8010288a:	5b                   	pop    %ebx
8010288b:	5d                   	pop    %ebp
8010288c:	c3                   	ret    
8010288d:	8d 76 00             	lea    0x0(%esi),%esi

80102890 <cmostime>:
80102890:	55                   	push   %ebp
80102891:	ba 70 00 00 00       	mov    $0x70,%edx
80102896:	b8 0b 00 00 00       	mov    $0xb,%eax
8010289b:	89 e5                	mov    %esp,%ebp
8010289d:	57                   	push   %edi
8010289e:	56                   	push   %esi
8010289f:	53                   	push   %ebx
801028a0:	83 ec 4c             	sub    $0x4c,%esp
801028a3:	ee                   	out    %al,(%dx)
801028a4:	ba 71 00 00 00       	mov    $0x71,%edx
801028a9:	ec                   	in     (%dx),%al
801028aa:	83 e0 04             	and    $0x4,%eax
801028ad:	8d 75 d0             	lea    -0x30(%ebp),%esi
801028b0:	31 db                	xor    %ebx,%ebx
801028b2:	88 45 b7             	mov    %al,-0x49(%ebp)
801028b5:	bf 70 00 00 00       	mov    $0x70,%edi
801028ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801028c0:	89 d8                	mov    %ebx,%eax
801028c2:	89 fa                	mov    %edi,%edx
801028c4:	ee                   	out    %al,(%dx)
801028c5:	b9 71 00 00 00       	mov    $0x71,%ecx
801028ca:	89 ca                	mov    %ecx,%edx
801028cc:	ec                   	in     (%dx),%al
801028cd:	0f b6 c0             	movzbl %al,%eax
801028d0:	89 fa                	mov    %edi,%edx
801028d2:	89 45 b8             	mov    %eax,-0x48(%ebp)
801028d5:	b8 02 00 00 00       	mov    $0x2,%eax
801028da:	ee                   	out    %al,(%dx)
801028db:	89 ca                	mov    %ecx,%edx
801028dd:	ec                   	in     (%dx),%al
801028de:	0f b6 c0             	movzbl %al,%eax
801028e1:	89 fa                	mov    %edi,%edx
801028e3:	89 45 bc             	mov    %eax,-0x44(%ebp)
801028e6:	b8 04 00 00 00       	mov    $0x4,%eax
801028eb:	ee                   	out    %al,(%dx)
801028ec:	89 ca                	mov    %ecx,%edx
801028ee:	ec                   	in     (%dx),%al
801028ef:	0f b6 c0             	movzbl %al,%eax
801028f2:	89 fa                	mov    %edi,%edx
801028f4:	89 45 c0             	mov    %eax,-0x40(%ebp)
801028f7:	b8 07 00 00 00       	mov    $0x7,%eax
801028fc:	ee                   	out    %al,(%dx)
801028fd:	89 ca                	mov    %ecx,%edx
801028ff:	ec                   	in     (%dx),%al
80102900:	0f b6 c0             	movzbl %al,%eax
80102903:	89 fa                	mov    %edi,%edx
80102905:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102908:	b8 08 00 00 00       	mov    $0x8,%eax
8010290d:	ee                   	out    %al,(%dx)
8010290e:	89 ca                	mov    %ecx,%edx
80102910:	ec                   	in     (%dx),%al
80102911:	0f b6 c0             	movzbl %al,%eax
80102914:	89 fa                	mov    %edi,%edx
80102916:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102919:	b8 09 00 00 00       	mov    $0x9,%eax
8010291e:	ee                   	out    %al,(%dx)
8010291f:	89 ca                	mov    %ecx,%edx
80102921:	ec                   	in     (%dx),%al
80102922:	0f b6 c0             	movzbl %al,%eax
80102925:	89 fa                	mov    %edi,%edx
80102927:	89 45 cc             	mov    %eax,-0x34(%ebp)
8010292a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010292f:	ee                   	out    %al,(%dx)
80102930:	89 ca                	mov    %ecx,%edx
80102932:	ec                   	in     (%dx),%al
80102933:	84 c0                	test   %al,%al
80102935:	78 89                	js     801028c0 <cmostime+0x30>
80102937:	89 d8                	mov    %ebx,%eax
80102939:	89 fa                	mov    %edi,%edx
8010293b:	ee                   	out    %al,(%dx)
8010293c:	89 ca                	mov    %ecx,%edx
8010293e:	ec                   	in     (%dx),%al
8010293f:	0f b6 c0             	movzbl %al,%eax
80102942:	89 fa                	mov    %edi,%edx
80102944:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102947:	b8 02 00 00 00       	mov    $0x2,%eax
8010294c:	ee                   	out    %al,(%dx)
8010294d:	89 ca                	mov    %ecx,%edx
8010294f:	ec                   	in     (%dx),%al
80102950:	0f b6 c0             	movzbl %al,%eax
80102953:	89 fa                	mov    %edi,%edx
80102955:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102958:	b8 04 00 00 00       	mov    $0x4,%eax
8010295d:	ee                   	out    %al,(%dx)
8010295e:	89 ca                	mov    %ecx,%edx
80102960:	ec                   	in     (%dx),%al
80102961:	0f b6 c0             	movzbl %al,%eax
80102964:	89 fa                	mov    %edi,%edx
80102966:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102969:	b8 07 00 00 00       	mov    $0x7,%eax
8010296e:	ee                   	out    %al,(%dx)
8010296f:	89 ca                	mov    %ecx,%edx
80102971:	ec                   	in     (%dx),%al
80102972:	0f b6 c0             	movzbl %al,%eax
80102975:	89 fa                	mov    %edi,%edx
80102977:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010297a:	b8 08 00 00 00       	mov    $0x8,%eax
8010297f:	ee                   	out    %al,(%dx)
80102980:	89 ca                	mov    %ecx,%edx
80102982:	ec                   	in     (%dx),%al
80102983:	0f b6 c0             	movzbl %al,%eax
80102986:	89 fa                	mov    %edi,%edx
80102988:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010298b:	b8 09 00 00 00       	mov    $0x9,%eax
80102990:	ee                   	out    %al,(%dx)
80102991:	89 ca                	mov    %ecx,%edx
80102993:	ec                   	in     (%dx),%al
80102994:	0f b6 c0             	movzbl %al,%eax
80102997:	83 ec 04             	sub    $0x4,%esp
8010299a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010299d:	8d 45 b8             	lea    -0x48(%ebp),%eax
801029a0:	6a 18                	push   $0x18
801029a2:	56                   	push   %esi
801029a3:	50                   	push   %eax
801029a4:	e8 97 1b 00 00       	call   80104540 <memcmp>
801029a9:	83 c4 10             	add    $0x10,%esp
801029ac:	85 c0                	test   %eax,%eax
801029ae:	0f 85 0c ff ff ff    	jne    801028c0 <cmostime+0x30>
801029b4:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
801029b8:	75 78                	jne    80102a32 <cmostime+0x1a2>
801029ba:	8b 45 b8             	mov    -0x48(%ebp),%eax
801029bd:	89 c2                	mov    %eax,%edx
801029bf:	83 e0 0f             	and    $0xf,%eax
801029c2:	c1 ea 04             	shr    $0x4,%edx
801029c5:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029c8:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029cb:	89 45 b8             	mov    %eax,-0x48(%ebp)
801029ce:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029d1:	89 c2                	mov    %eax,%edx
801029d3:	83 e0 0f             	and    $0xf,%eax
801029d6:	c1 ea 04             	shr    $0x4,%edx
801029d9:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029dc:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029df:	89 45 bc             	mov    %eax,-0x44(%ebp)
801029e2:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029e5:	89 c2                	mov    %eax,%edx
801029e7:	83 e0 0f             	and    $0xf,%eax
801029ea:	c1 ea 04             	shr    $0x4,%edx
801029ed:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029f0:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029f3:	89 45 c0             	mov    %eax,-0x40(%ebp)
801029f6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029f9:	89 c2                	mov    %eax,%edx
801029fb:	83 e0 0f             	and    $0xf,%eax
801029fe:	c1 ea 04             	shr    $0x4,%edx
80102a01:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a04:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a07:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102a0a:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102a0d:	89 c2                	mov    %eax,%edx
80102a0f:	83 e0 0f             	and    $0xf,%eax
80102a12:	c1 ea 04             	shr    $0x4,%edx
80102a15:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a18:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a1b:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102a1e:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102a21:	89 c2                	mov    %eax,%edx
80102a23:	83 e0 0f             	and    $0xf,%eax
80102a26:	c1 ea 04             	shr    $0x4,%edx
80102a29:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a2c:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a2f:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102a32:	8b 75 08             	mov    0x8(%ebp),%esi
80102a35:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102a38:	89 06                	mov    %eax,(%esi)
80102a3a:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102a3d:	89 46 04             	mov    %eax,0x4(%esi)
80102a40:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102a43:	89 46 08             	mov    %eax,0x8(%esi)
80102a46:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102a49:	89 46 0c             	mov    %eax,0xc(%esi)
80102a4c:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102a4f:	89 46 10             	mov    %eax,0x10(%esi)
80102a52:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102a55:	89 46 14             	mov    %eax,0x14(%esi)
80102a58:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
80102a5f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a62:	5b                   	pop    %ebx
80102a63:	5e                   	pop    %esi
80102a64:	5f                   	pop    %edi
80102a65:	5d                   	pop    %ebp
80102a66:	c3                   	ret    
80102a67:	66 90                	xchg   %ax,%ax
80102a69:	66 90                	xchg   %ax,%ax
80102a6b:	66 90                	xchg   %ax,%ax
80102a6d:	66 90                	xchg   %ax,%ax
80102a6f:	90                   	nop

80102a70 <install_trans>:
80102a70:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102a76:	85 c9                	test   %ecx,%ecx
80102a78:	0f 8e 85 00 00 00    	jle    80102b03 <install_trans+0x93>
80102a7e:	55                   	push   %ebp
80102a7f:	89 e5                	mov    %esp,%ebp
80102a81:	57                   	push   %edi
80102a82:	56                   	push   %esi
80102a83:	53                   	push   %ebx
80102a84:	31 db                	xor    %ebx,%ebx
80102a86:	83 ec 0c             	sub    $0xc,%esp
80102a89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102a90:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102a95:	83 ec 08             	sub    $0x8,%esp
80102a98:	01 d8                	add    %ebx,%eax
80102a9a:	83 c0 01             	add    $0x1,%eax
80102a9d:	50                   	push   %eax
80102a9e:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102aa4:	e8 27 d6 ff ff       	call   801000d0 <bread>
80102aa9:	89 c7                	mov    %eax,%edi
80102aab:	58                   	pop    %eax
80102aac:	5a                   	pop    %edx
80102aad:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
80102ab4:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102aba:	83 c3 01             	add    $0x1,%ebx
80102abd:	e8 0e d6 ff ff       	call   801000d0 <bread>
80102ac2:	89 c6                	mov    %eax,%esi
80102ac4:	8d 47 5c             	lea    0x5c(%edi),%eax
80102ac7:	83 c4 0c             	add    $0xc,%esp
80102aca:	68 00 02 00 00       	push   $0x200
80102acf:	50                   	push   %eax
80102ad0:	8d 46 5c             	lea    0x5c(%esi),%eax
80102ad3:	50                   	push   %eax
80102ad4:	e8 c7 1a 00 00       	call   801045a0 <memmove>
80102ad9:	89 34 24             	mov    %esi,(%esp)
80102adc:	e8 bf d6 ff ff       	call   801001a0 <bwrite>
80102ae1:	89 3c 24             	mov    %edi,(%esp)
80102ae4:	e8 f7 d6 ff ff       	call   801001e0 <brelse>
80102ae9:	89 34 24             	mov    %esi,(%esp)
80102aec:	e8 ef d6 ff ff       	call   801001e0 <brelse>
80102af1:	83 c4 10             	add    $0x10,%esp
80102af4:	39 1d e8 26 11 80    	cmp    %ebx,0x801126e8
80102afa:	7f 94                	jg     80102a90 <install_trans+0x20>
80102afc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102aff:	5b                   	pop    %ebx
80102b00:	5e                   	pop    %esi
80102b01:	5f                   	pop    %edi
80102b02:	5d                   	pop    %ebp
80102b03:	f3 c3                	repz ret 
80102b05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b10 <write_head>:
80102b10:	55                   	push   %ebp
80102b11:	89 e5                	mov    %esp,%ebp
80102b13:	53                   	push   %ebx
80102b14:	83 ec 0c             	sub    $0xc,%esp
80102b17:	ff 35 d4 26 11 80    	pushl  0x801126d4
80102b1d:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102b23:	e8 a8 d5 ff ff       	call   801000d0 <bread>
80102b28:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102b2e:	83 c4 10             	add    $0x10,%esp
80102b31:	89 c3                	mov    %eax,%ebx
80102b33:	85 c9                	test   %ecx,%ecx
80102b35:	89 48 5c             	mov    %ecx,0x5c(%eax)
80102b38:	7e 1f                	jle    80102b59 <write_head+0x49>
80102b3a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102b41:	31 d2                	xor    %edx,%edx
80102b43:	90                   	nop
80102b44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102b48:	8b 8a ec 26 11 80    	mov    -0x7feed914(%edx),%ecx
80102b4e:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102b52:	83 c2 04             	add    $0x4,%edx
80102b55:	39 c2                	cmp    %eax,%edx
80102b57:	75 ef                	jne    80102b48 <write_head+0x38>
80102b59:	83 ec 0c             	sub    $0xc,%esp
80102b5c:	53                   	push   %ebx
80102b5d:	e8 3e d6 ff ff       	call   801001a0 <bwrite>
80102b62:	89 1c 24             	mov    %ebx,(%esp)
80102b65:	e8 76 d6 ff ff       	call   801001e0 <brelse>
80102b6a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b6d:	c9                   	leave  
80102b6e:	c3                   	ret    
80102b6f:	90                   	nop

80102b70 <initlog>:
80102b70:	55                   	push   %ebp
80102b71:	89 e5                	mov    %esp,%ebp
80102b73:	53                   	push   %ebx
80102b74:	83 ec 2c             	sub    $0x2c,%esp
80102b77:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102b7a:	68 7c 74 10 80       	push   $0x8010747c
80102b7f:	68 a0 26 11 80       	push   $0x801126a0
80102b84:	e8 17 17 00 00       	call   801042a0 <initlock>
80102b89:	58                   	pop    %eax
80102b8a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102b8d:	5a                   	pop    %edx
80102b8e:	50                   	push   %eax
80102b8f:	53                   	push   %ebx
80102b90:	e8 5b e8 ff ff       	call   801013f0 <readsb>
80102b95:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102b98:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102b9b:	59                   	pop    %ecx
80102b9c:	89 1d e4 26 11 80    	mov    %ebx,0x801126e4
80102ba2:	89 15 d8 26 11 80    	mov    %edx,0x801126d8
80102ba8:	a3 d4 26 11 80       	mov    %eax,0x801126d4
80102bad:	5a                   	pop    %edx
80102bae:	50                   	push   %eax
80102baf:	53                   	push   %ebx
80102bb0:	e8 1b d5 ff ff       	call   801000d0 <bread>
80102bb5:	8b 48 5c             	mov    0x5c(%eax),%ecx
80102bb8:	83 c4 10             	add    $0x10,%esp
80102bbb:	85 c9                	test   %ecx,%ecx
80102bbd:	89 0d e8 26 11 80    	mov    %ecx,0x801126e8
80102bc3:	7e 1c                	jle    80102be1 <initlog+0x71>
80102bc5:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102bcc:	31 d2                	xor    %edx,%edx
80102bce:	66 90                	xchg   %ax,%ax
80102bd0:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102bd4:	83 c2 04             	add    $0x4,%edx
80102bd7:	89 8a e8 26 11 80    	mov    %ecx,-0x7feed918(%edx)
80102bdd:	39 da                	cmp    %ebx,%edx
80102bdf:	75 ef                	jne    80102bd0 <initlog+0x60>
80102be1:	83 ec 0c             	sub    $0xc,%esp
80102be4:	50                   	push   %eax
80102be5:	e8 f6 d5 ff ff       	call   801001e0 <brelse>
80102bea:	e8 81 fe ff ff       	call   80102a70 <install_trans>
80102bef:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102bf6:	00 00 00 
80102bf9:	e8 12 ff ff ff       	call   80102b10 <write_head>
80102bfe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102c01:	c9                   	leave  
80102c02:	c3                   	ret    
80102c03:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c10 <begin_op>:
80102c10:	55                   	push   %ebp
80102c11:	89 e5                	mov    %esp,%ebp
80102c13:	83 ec 14             	sub    $0x14,%esp
80102c16:	68 a0 26 11 80       	push   $0x801126a0
80102c1b:	e8 a0 16 00 00       	call   801042c0 <acquire>
80102c20:	83 c4 10             	add    $0x10,%esp
80102c23:	eb 18                	jmp    80102c3d <begin_op+0x2d>
80102c25:	8d 76 00             	lea    0x0(%esi),%esi
80102c28:	83 ec 08             	sub    $0x8,%esp
80102c2b:	68 a0 26 11 80       	push   $0x801126a0
80102c30:	68 a0 26 11 80       	push   $0x801126a0
80102c35:	e8 06 12 00 00       	call   80103e40 <sleep>
80102c3a:	83 c4 10             	add    $0x10,%esp
80102c3d:	a1 e0 26 11 80       	mov    0x801126e0,%eax
80102c42:	85 c0                	test   %eax,%eax
80102c44:	75 e2                	jne    80102c28 <begin_op+0x18>
80102c46:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102c4b:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102c51:	83 c0 01             	add    $0x1,%eax
80102c54:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102c57:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102c5a:	83 fa 1e             	cmp    $0x1e,%edx
80102c5d:	7f c9                	jg     80102c28 <begin_op+0x18>
80102c5f:	83 ec 0c             	sub    $0xc,%esp
80102c62:	a3 dc 26 11 80       	mov    %eax,0x801126dc
80102c67:	68 a0 26 11 80       	push   $0x801126a0
80102c6c:	e8 2f 18 00 00       	call   801044a0 <release>
80102c71:	83 c4 10             	add    $0x10,%esp
80102c74:	c9                   	leave  
80102c75:	c3                   	ret    
80102c76:	8d 76 00             	lea    0x0(%esi),%esi
80102c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c80 <end_op>:
80102c80:	55                   	push   %ebp
80102c81:	89 e5                	mov    %esp,%ebp
80102c83:	57                   	push   %edi
80102c84:	56                   	push   %esi
80102c85:	53                   	push   %ebx
80102c86:	83 ec 18             	sub    $0x18,%esp
80102c89:	68 a0 26 11 80       	push   $0x801126a0
80102c8e:	e8 2d 16 00 00       	call   801042c0 <acquire>
80102c93:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102c98:	8b 1d e0 26 11 80    	mov    0x801126e0,%ebx
80102c9e:	83 c4 10             	add    $0x10,%esp
80102ca1:	83 e8 01             	sub    $0x1,%eax
80102ca4:	85 db                	test   %ebx,%ebx
80102ca6:	a3 dc 26 11 80       	mov    %eax,0x801126dc
80102cab:	0f 85 23 01 00 00    	jne    80102dd4 <end_op+0x154>
80102cb1:	85 c0                	test   %eax,%eax
80102cb3:	0f 85 f7 00 00 00    	jne    80102db0 <end_op+0x130>
80102cb9:	83 ec 0c             	sub    $0xc,%esp
80102cbc:	c7 05 e0 26 11 80 01 	movl   $0x1,0x801126e0
80102cc3:	00 00 00 
80102cc6:	31 db                	xor    %ebx,%ebx
80102cc8:	68 a0 26 11 80       	push   $0x801126a0
80102ccd:	e8 ce 17 00 00       	call   801044a0 <release>
80102cd2:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102cd8:	83 c4 10             	add    $0x10,%esp
80102cdb:	85 c9                	test   %ecx,%ecx
80102cdd:	0f 8e 8a 00 00 00    	jle    80102d6d <end_op+0xed>
80102ce3:	90                   	nop
80102ce4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102ce8:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102ced:	83 ec 08             	sub    $0x8,%esp
80102cf0:	01 d8                	add    %ebx,%eax
80102cf2:	83 c0 01             	add    $0x1,%eax
80102cf5:	50                   	push   %eax
80102cf6:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102cfc:	e8 cf d3 ff ff       	call   801000d0 <bread>
80102d01:	89 c6                	mov    %eax,%esi
80102d03:	58                   	pop    %eax
80102d04:	5a                   	pop    %edx
80102d05:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
80102d0c:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102d12:	83 c3 01             	add    $0x1,%ebx
80102d15:	e8 b6 d3 ff ff       	call   801000d0 <bread>
80102d1a:	89 c7                	mov    %eax,%edi
80102d1c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102d1f:	83 c4 0c             	add    $0xc,%esp
80102d22:	68 00 02 00 00       	push   $0x200
80102d27:	50                   	push   %eax
80102d28:	8d 46 5c             	lea    0x5c(%esi),%eax
80102d2b:	50                   	push   %eax
80102d2c:	e8 6f 18 00 00       	call   801045a0 <memmove>
80102d31:	89 34 24             	mov    %esi,(%esp)
80102d34:	e8 67 d4 ff ff       	call   801001a0 <bwrite>
80102d39:	89 3c 24             	mov    %edi,(%esp)
80102d3c:	e8 9f d4 ff ff       	call   801001e0 <brelse>
80102d41:	89 34 24             	mov    %esi,(%esp)
80102d44:	e8 97 d4 ff ff       	call   801001e0 <brelse>
80102d49:	83 c4 10             	add    $0x10,%esp
80102d4c:	3b 1d e8 26 11 80    	cmp    0x801126e8,%ebx
80102d52:	7c 94                	jl     80102ce8 <end_op+0x68>
80102d54:	e8 b7 fd ff ff       	call   80102b10 <write_head>
80102d59:	e8 12 fd ff ff       	call   80102a70 <install_trans>
80102d5e:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102d65:	00 00 00 
80102d68:	e8 a3 fd ff ff       	call   80102b10 <write_head>
80102d6d:	83 ec 0c             	sub    $0xc,%esp
80102d70:	68 a0 26 11 80       	push   $0x801126a0
80102d75:	e8 46 15 00 00       	call   801042c0 <acquire>
80102d7a:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d81:	c7 05 e0 26 11 80 00 	movl   $0x0,0x801126e0
80102d88:	00 00 00 
80102d8b:	e8 50 12 00 00       	call   80103fe0 <wakeup>
80102d90:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d97:	e8 04 17 00 00       	call   801044a0 <release>
80102d9c:	83 c4 10             	add    $0x10,%esp
80102d9f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102da2:	5b                   	pop    %ebx
80102da3:	5e                   	pop    %esi
80102da4:	5f                   	pop    %edi
80102da5:	5d                   	pop    %ebp
80102da6:	c3                   	ret    
80102da7:	89 f6                	mov    %esi,%esi
80102da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102db0:	83 ec 0c             	sub    $0xc,%esp
80102db3:	68 a0 26 11 80       	push   $0x801126a0
80102db8:	e8 23 12 00 00       	call   80103fe0 <wakeup>
80102dbd:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102dc4:	e8 d7 16 00 00       	call   801044a0 <release>
80102dc9:	83 c4 10             	add    $0x10,%esp
80102dcc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102dcf:	5b                   	pop    %ebx
80102dd0:	5e                   	pop    %esi
80102dd1:	5f                   	pop    %edi
80102dd2:	5d                   	pop    %ebp
80102dd3:	c3                   	ret    
80102dd4:	83 ec 0c             	sub    $0xc,%esp
80102dd7:	68 80 74 10 80       	push   $0x80107480
80102ddc:	e8 8f d5 ff ff       	call   80100370 <panic>
80102de1:	eb 0d                	jmp    80102df0 <log_write>
80102de3:	90                   	nop
80102de4:	90                   	nop
80102de5:	90                   	nop
80102de6:	90                   	nop
80102de7:	90                   	nop
80102de8:	90                   	nop
80102de9:	90                   	nop
80102dea:	90                   	nop
80102deb:	90                   	nop
80102dec:	90                   	nop
80102ded:	90                   	nop
80102dee:	90                   	nop
80102def:	90                   	nop

80102df0 <log_write>:
80102df0:	55                   	push   %ebp
80102df1:	89 e5                	mov    %esp,%ebp
80102df3:	53                   	push   %ebx
80102df4:	83 ec 04             	sub    $0x4,%esp
80102df7:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102dfd:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102e00:	83 fa 1d             	cmp    $0x1d,%edx
80102e03:	0f 8f 97 00 00 00    	jg     80102ea0 <log_write+0xb0>
80102e09:	a1 d8 26 11 80       	mov    0x801126d8,%eax
80102e0e:	83 e8 01             	sub    $0x1,%eax
80102e11:	39 c2                	cmp    %eax,%edx
80102e13:	0f 8d 87 00 00 00    	jge    80102ea0 <log_write+0xb0>
80102e19:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102e1e:	85 c0                	test   %eax,%eax
80102e20:	0f 8e 87 00 00 00    	jle    80102ead <log_write+0xbd>
80102e26:	83 ec 0c             	sub    $0xc,%esp
80102e29:	68 a0 26 11 80       	push   $0x801126a0
80102e2e:	e8 8d 14 00 00       	call   801042c0 <acquire>
80102e33:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102e39:	83 c4 10             	add    $0x10,%esp
80102e3c:	83 fa 00             	cmp    $0x0,%edx
80102e3f:	7e 50                	jle    80102e91 <log_write+0xa1>
80102e41:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102e44:	31 c0                	xor    %eax,%eax
80102e46:	3b 0d ec 26 11 80    	cmp    0x801126ec,%ecx
80102e4c:	75 0b                	jne    80102e59 <log_write+0x69>
80102e4e:	eb 38                	jmp    80102e88 <log_write+0x98>
80102e50:	39 0c 85 ec 26 11 80 	cmp    %ecx,-0x7feed914(,%eax,4)
80102e57:	74 2f                	je     80102e88 <log_write+0x98>
80102e59:	83 c0 01             	add    $0x1,%eax
80102e5c:	39 d0                	cmp    %edx,%eax
80102e5e:	75 f0                	jne    80102e50 <log_write+0x60>
80102e60:	89 0c 95 ec 26 11 80 	mov    %ecx,-0x7feed914(,%edx,4)
80102e67:	83 c2 01             	add    $0x1,%edx
80102e6a:	89 15 e8 26 11 80    	mov    %edx,0x801126e8
80102e70:	83 0b 04             	orl    $0x4,(%ebx)
80102e73:	c7 45 08 a0 26 11 80 	movl   $0x801126a0,0x8(%ebp)
80102e7a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e7d:	c9                   	leave  
80102e7e:	e9 1d 16 00 00       	jmp    801044a0 <release>
80102e83:	90                   	nop
80102e84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102e88:	89 0c 85 ec 26 11 80 	mov    %ecx,-0x7feed914(,%eax,4)
80102e8f:	eb df                	jmp    80102e70 <log_write+0x80>
80102e91:	8b 43 08             	mov    0x8(%ebx),%eax
80102e94:	a3 ec 26 11 80       	mov    %eax,0x801126ec
80102e99:	75 d5                	jne    80102e70 <log_write+0x80>
80102e9b:	eb ca                	jmp    80102e67 <log_write+0x77>
80102e9d:	8d 76 00             	lea    0x0(%esi),%esi
80102ea0:	83 ec 0c             	sub    $0xc,%esp
80102ea3:	68 8f 74 10 80       	push   $0x8010748f
80102ea8:	e8 c3 d4 ff ff       	call   80100370 <panic>
80102ead:	83 ec 0c             	sub    $0xc,%esp
80102eb0:	68 a5 74 10 80       	push   $0x801074a5
80102eb5:	e8 b6 d4 ff ff       	call   80100370 <panic>
80102eba:	66 90                	xchg   %ax,%ax
80102ebc:	66 90                	xchg   %ax,%ax
80102ebe:	66 90                	xchg   %ax,%ax

80102ec0 <mpmain>:
80102ec0:	55                   	push   %ebp
80102ec1:	89 e5                	mov    %esp,%ebp
80102ec3:	83 ec 08             	sub    $0x8,%esp
80102ec6:	e8 65 f8 ff ff       	call   80102730 <cpunum>
80102ecb:	83 ec 08             	sub    $0x8,%esp
80102ece:	50                   	push   %eax
80102ecf:	68 c0 74 10 80       	push   $0x801074c0
80102ed4:	e8 87 d7 ff ff       	call   80100660 <cprintf>
80102ed9:	e8 12 29 00 00       	call   801057f0 <idtinit>
80102ede:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80102ee5:	b8 01 00 00 00       	mov    $0x1,%eax
80102eea:	f0 87 82 a8 00 00 00 	lock xchg %eax,0xa8(%edx)
80102ef1:	e8 5a 0c 00 00       	call   80103b50 <scheduler>
80102ef6:	8d 76 00             	lea    0x0(%esi),%esi
80102ef9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102f00 <mpenter>:
80102f00:	55                   	push   %ebp
80102f01:	89 e5                	mov    %esp,%ebp
80102f03:	83 ec 08             	sub    $0x8,%esp
80102f06:	e8 05 3b 00 00       	call   80106a10 <switchkvm>
80102f0b:	e8 20 39 00 00       	call   80106830 <seginit>
80102f10:	e8 1b f7 ff ff       	call   80102630 <lapicinit>
80102f15:	e8 a6 ff ff ff       	call   80102ec0 <mpmain>
80102f1a:	66 90                	xchg   %ax,%ax
80102f1c:	66 90                	xchg   %ax,%ax
80102f1e:	66 90                	xchg   %ax,%ax

80102f20 <main>:
80102f20:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102f24:	83 e4 f0             	and    $0xfffffff0,%esp
80102f27:	ff 71 fc             	pushl  -0x4(%ecx)
80102f2a:	55                   	push   %ebp
80102f2b:	89 e5                	mov    %esp,%ebp
80102f2d:	53                   	push   %ebx
80102f2e:	51                   	push   %ecx
80102f2f:	83 ec 08             	sub    $0x8,%esp
80102f32:	68 00 00 40 80       	push   $0x80400000
80102f37:	68 28 55 11 80       	push   $0x80115528
80102f3c:	e8 bf f4 ff ff       	call   80102400 <kinit1>
80102f41:	e8 aa 3a 00 00       	call   801069f0 <kvmalloc>
80102f46:	e8 b5 01 00 00       	call   80103100 <mpinit>
80102f4b:	e8 e0 f6 ff ff       	call   80102630 <lapicinit>
80102f50:	e8 db 38 00 00       	call   80106830 <seginit>
80102f55:	e8 d6 f7 ff ff       	call   80102730 <cpunum>
80102f5a:	5a                   	pop    %edx
80102f5b:	59                   	pop    %ecx
80102f5c:	50                   	push   %eax
80102f5d:	68 d1 74 10 80       	push   $0x801074d1
80102f62:	e8 f9 d6 ff ff       	call   80100660 <cprintf>
80102f67:	e8 a4 03 00 00       	call   80103310 <picinit>
80102f6c:	e8 af f2 ff ff       	call   80102220 <ioapicinit>
80102f71:	e8 2a da ff ff       	call   801009a0 <consoleinit>
80102f76:	e8 85 2b 00 00       	call   80105b00 <uartinit>
80102f7b:	e8 30 09 00 00       	call   801038b0 <pinit>
80102f80:	e8 cb 27 00 00       	call   80105750 <tvinit>
80102f85:	e8 b6 d0 ff ff       	call   80100040 <binit>
80102f8a:	e8 01 de ff ff       	call   80100d90 <fileinit>
80102f8f:	e8 5c f0 ff ff       	call   80101ff0 <ideinit>
80102f94:	8b 1d 84 27 11 80    	mov    0x80112784,%ebx
80102f9a:	83 c4 10             	add    $0x10,%esp
80102f9d:	85 db                	test   %ebx,%ebx
80102f9f:	0f 84 ca 00 00 00    	je     8010306f <main+0x14f>
80102fa5:	83 ec 04             	sub    $0x4,%esp
80102fa8:	bb a0 27 11 80       	mov    $0x801127a0,%ebx
80102fad:	68 8a 00 00 00       	push   $0x8a
80102fb2:	68 8c a4 10 80       	push   $0x8010a48c
80102fb7:	68 00 70 00 80       	push   $0x80007000
80102fbc:	e8 df 15 00 00       	call   801045a0 <memmove>
80102fc1:	69 05 80 2d 11 80 bc 	imul   $0xbc,0x80112d80,%eax
80102fc8:	00 00 00 
80102fcb:	83 c4 10             	add    $0x10,%esp
80102fce:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102fd3:	39 d8                	cmp    %ebx,%eax
80102fd5:	76 7c                	jbe    80103053 <main+0x133>
80102fd7:	89 f6                	mov    %esi,%esi
80102fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102fe0:	e8 4b f7 ff ff       	call   80102730 <cpunum>
80102fe5:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80102feb:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102ff0:	39 c3                	cmp    %eax,%ebx
80102ff2:	74 46                	je     8010303a <main+0x11a>
80102ff4:	e8 d7 f4 ff ff       	call   801024d0 <kalloc>
80102ff9:	83 ec 08             	sub    $0x8,%esp
80102ffc:	05 00 10 00 00       	add    $0x1000,%eax
80103001:	c7 05 f8 6f 00 80 00 	movl   $0x80102f00,0x80006ff8
80103008:	2f 10 80 
8010300b:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80103010:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80103017:	90 10 00 
8010301a:	68 00 70 00 00       	push   $0x7000
8010301f:	0f b6 03             	movzbl (%ebx),%eax
80103022:	50                   	push   %eax
80103023:	e8 d8 f7 ff ff       	call   80102800 <lapicstartap>
80103028:	83 c4 10             	add    $0x10,%esp
8010302b:	90                   	nop
8010302c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103030:	8b 83 a8 00 00 00    	mov    0xa8(%ebx),%eax
80103036:	85 c0                	test   %eax,%eax
80103038:	74 f6                	je     80103030 <main+0x110>
8010303a:	69 05 80 2d 11 80 bc 	imul   $0xbc,0x80112d80,%eax
80103041:	00 00 00 
80103044:	81 c3 bc 00 00 00    	add    $0xbc,%ebx
8010304a:	05 a0 27 11 80       	add    $0x801127a0,%eax
8010304f:	39 c3                	cmp    %eax,%ebx
80103051:	72 8d                	jb     80102fe0 <main+0xc0>
80103053:	83 ec 08             	sub    $0x8,%esp
80103056:	68 00 00 00 8e       	push   $0x8e000000
8010305b:	68 00 00 40 80       	push   $0x80400000
80103060:	e8 0b f4 ff ff       	call   80102470 <kinit2>
80103065:	e8 66 08 00 00       	call   801038d0 <userinit>
8010306a:	e8 51 fe ff ff       	call   80102ec0 <mpmain>
8010306f:	e8 7c 26 00 00       	call   801056f0 <timerinit>
80103074:	e9 2c ff ff ff       	jmp    80102fa5 <main+0x85>
80103079:	66 90                	xchg   %ax,%ax
8010307b:	66 90                	xchg   %ax,%ax
8010307d:	66 90                	xchg   %ax,%ax
8010307f:	90                   	nop

80103080 <mpsearch1>:
80103080:	55                   	push   %ebp
80103081:	89 e5                	mov    %esp,%ebp
80103083:	57                   	push   %edi
80103084:	56                   	push   %esi
80103085:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
8010308b:	53                   	push   %ebx
8010308c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
8010308f:	83 ec 0c             	sub    $0xc,%esp
80103092:	39 de                	cmp    %ebx,%esi
80103094:	73 48                	jae    801030de <mpsearch1+0x5e>
80103096:	8d 76 00             	lea    0x0(%esi),%esi
80103099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801030a0:	83 ec 04             	sub    $0x4,%esp
801030a3:	8d 7e 10             	lea    0x10(%esi),%edi
801030a6:	6a 04                	push   $0x4
801030a8:	68 e8 74 10 80       	push   $0x801074e8
801030ad:	56                   	push   %esi
801030ae:	e8 8d 14 00 00       	call   80104540 <memcmp>
801030b3:	83 c4 10             	add    $0x10,%esp
801030b6:	85 c0                	test   %eax,%eax
801030b8:	75 1e                	jne    801030d8 <mpsearch1+0x58>
801030ba:	8d 7e 10             	lea    0x10(%esi),%edi
801030bd:	89 f2                	mov    %esi,%edx
801030bf:	31 c9                	xor    %ecx,%ecx
801030c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801030c8:	0f b6 02             	movzbl (%edx),%eax
801030cb:	83 c2 01             	add    $0x1,%edx
801030ce:	01 c1                	add    %eax,%ecx
801030d0:	39 fa                	cmp    %edi,%edx
801030d2:	75 f4                	jne    801030c8 <mpsearch1+0x48>
801030d4:	84 c9                	test   %cl,%cl
801030d6:	74 10                	je     801030e8 <mpsearch1+0x68>
801030d8:	39 fb                	cmp    %edi,%ebx
801030da:	89 fe                	mov    %edi,%esi
801030dc:	77 c2                	ja     801030a0 <mpsearch1+0x20>
801030de:	8d 65 f4             	lea    -0xc(%ebp),%esp
801030e1:	31 c0                	xor    %eax,%eax
801030e3:	5b                   	pop    %ebx
801030e4:	5e                   	pop    %esi
801030e5:	5f                   	pop    %edi
801030e6:	5d                   	pop    %ebp
801030e7:	c3                   	ret    
801030e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801030eb:	89 f0                	mov    %esi,%eax
801030ed:	5b                   	pop    %ebx
801030ee:	5e                   	pop    %esi
801030ef:	5f                   	pop    %edi
801030f0:	5d                   	pop    %ebp
801030f1:	c3                   	ret    
801030f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801030f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103100 <mpinit>:
80103100:	55                   	push   %ebp
80103101:	89 e5                	mov    %esp,%ebp
80103103:	57                   	push   %edi
80103104:	56                   	push   %esi
80103105:	53                   	push   %ebx
80103106:	83 ec 1c             	sub    $0x1c,%esp
80103109:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103110:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103117:	c1 e0 08             	shl    $0x8,%eax
8010311a:	09 d0                	or     %edx,%eax
8010311c:	c1 e0 04             	shl    $0x4,%eax
8010311f:	85 c0                	test   %eax,%eax
80103121:	75 1b                	jne    8010313e <mpinit+0x3e>
80103123:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010312a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103131:	c1 e0 08             	shl    $0x8,%eax
80103134:	09 d0                	or     %edx,%eax
80103136:	c1 e0 0a             	shl    $0xa,%eax
80103139:	2d 00 04 00 00       	sub    $0x400,%eax
8010313e:	ba 00 04 00 00       	mov    $0x400,%edx
80103143:	e8 38 ff ff ff       	call   80103080 <mpsearch1>
80103148:	85 c0                	test   %eax,%eax
8010314a:	89 c6                	mov    %eax,%esi
8010314c:	0f 84 66 01 00 00    	je     801032b8 <mpinit+0x1b8>
80103152:	8b 5e 04             	mov    0x4(%esi),%ebx
80103155:	85 db                	test   %ebx,%ebx
80103157:	0f 84 d6 00 00 00    	je     80103233 <mpinit+0x133>
8010315d:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80103163:	83 ec 04             	sub    $0x4,%esp
80103166:	6a 04                	push   $0x4
80103168:	68 ed 74 10 80       	push   $0x801074ed
8010316d:	50                   	push   %eax
8010316e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103171:	e8 ca 13 00 00       	call   80104540 <memcmp>
80103176:	83 c4 10             	add    $0x10,%esp
80103179:	85 c0                	test   %eax,%eax
8010317b:	0f 85 b2 00 00 00    	jne    80103233 <mpinit+0x133>
80103181:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103188:	3c 01                	cmp    $0x1,%al
8010318a:	74 08                	je     80103194 <mpinit+0x94>
8010318c:	3c 04                	cmp    $0x4,%al
8010318e:	0f 85 9f 00 00 00    	jne    80103233 <mpinit+0x133>
80103194:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
8010319b:	85 ff                	test   %edi,%edi
8010319d:	74 1e                	je     801031bd <mpinit+0xbd>
8010319f:	31 d2                	xor    %edx,%edx
801031a1:	31 c0                	xor    %eax,%eax
801031a3:	90                   	nop
801031a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801031a8:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
801031af:	80 
801031b0:	83 c0 01             	add    $0x1,%eax
801031b3:	01 ca                	add    %ecx,%edx
801031b5:	39 c7                	cmp    %eax,%edi
801031b7:	75 ef                	jne    801031a8 <mpinit+0xa8>
801031b9:	84 d2                	test   %dl,%dl
801031bb:	75 76                	jne    80103233 <mpinit+0x133>
801031bd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801031c0:	85 ff                	test   %edi,%edi
801031c2:	74 6f                	je     80103233 <mpinit+0x133>
801031c4:	c7 05 84 27 11 80 01 	movl   $0x1,0x80112784
801031cb:	00 00 00 
801031ce:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801031d4:	a3 9c 26 11 80       	mov    %eax,0x8011269c
801031d9:	0f b7 8b 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%ecx
801031e0:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
801031e6:	01 f9                	add    %edi,%ecx
801031e8:	39 c8                	cmp    %ecx,%eax
801031ea:	0f 83 a0 00 00 00    	jae    80103290 <mpinit+0x190>
801031f0:	80 38 04             	cmpb   $0x4,(%eax)
801031f3:	0f 87 87 00 00 00    	ja     80103280 <mpinit+0x180>
801031f9:	0f b6 10             	movzbl (%eax),%edx
801031fc:	ff 24 95 f4 74 10 80 	jmp    *-0x7fef8b0c(,%edx,4)
80103203:	90                   	nop
80103204:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103208:	83 c0 08             	add    $0x8,%eax
8010320b:	39 c1                	cmp    %eax,%ecx
8010320d:	77 e1                	ja     801031f0 <mpinit+0xf0>
8010320f:	a1 84 27 11 80       	mov    0x80112784,%eax
80103214:	85 c0                	test   %eax,%eax
80103216:	75 78                	jne    80103290 <mpinit+0x190>
80103218:	c7 05 80 2d 11 80 01 	movl   $0x1,0x80112d80
8010321f:	00 00 00 
80103222:	c7 05 9c 26 11 80 00 	movl   $0x0,0x8011269c
80103229:	00 00 00 
8010322c:	c6 05 80 27 11 80 00 	movb   $0x0,0x80112780
80103233:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103236:	5b                   	pop    %ebx
80103237:	5e                   	pop    %esi
80103238:	5f                   	pop    %edi
80103239:	5d                   	pop    %ebp
8010323a:	c3                   	ret    
8010323b:	90                   	nop
8010323c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103240:	8b 15 80 2d 11 80    	mov    0x80112d80,%edx
80103246:	83 fa 07             	cmp    $0x7,%edx
80103249:	7f 19                	jg     80103264 <mpinit+0x164>
8010324b:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
8010324f:	69 fa bc 00 00 00    	imul   $0xbc,%edx,%edi
80103255:	83 c2 01             	add    $0x1,%edx
80103258:	89 15 80 2d 11 80    	mov    %edx,0x80112d80
8010325e:	88 9f a0 27 11 80    	mov    %bl,-0x7feed860(%edi)
80103264:	83 c0 14             	add    $0x14,%eax
80103267:	eb a2                	jmp    8010320b <mpinit+0x10b>
80103269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103270:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103274:	83 c0 08             	add    $0x8,%eax
80103277:	88 15 80 27 11 80    	mov    %dl,0x80112780
8010327d:	eb 8c                	jmp    8010320b <mpinit+0x10b>
8010327f:	90                   	nop
80103280:	c7 05 84 27 11 80 00 	movl   $0x0,0x80112784
80103287:	00 00 00 
8010328a:	e9 7c ff ff ff       	jmp    8010320b <mpinit+0x10b>
8010328f:	90                   	nop
80103290:	80 7e 0c 00          	cmpb   $0x0,0xc(%esi)
80103294:	74 9d                	je     80103233 <mpinit+0x133>
80103296:	ba 22 00 00 00       	mov    $0x22,%edx
8010329b:	b8 70 00 00 00       	mov    $0x70,%eax
801032a0:	ee                   	out    %al,(%dx)
801032a1:	ba 23 00 00 00       	mov    $0x23,%edx
801032a6:	ec                   	in     (%dx),%al
801032a7:	83 c8 01             	or     $0x1,%eax
801032aa:	ee                   	out    %al,(%dx)
801032ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
801032ae:	5b                   	pop    %ebx
801032af:	5e                   	pop    %esi
801032b0:	5f                   	pop    %edi
801032b1:	5d                   	pop    %ebp
801032b2:	c3                   	ret    
801032b3:	90                   	nop
801032b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801032b8:	ba 00 00 01 00       	mov    $0x10000,%edx
801032bd:	b8 00 00 0f 00       	mov    $0xf0000,%eax
801032c2:	e8 b9 fd ff ff       	call   80103080 <mpsearch1>
801032c7:	85 c0                	test   %eax,%eax
801032c9:	89 c6                	mov    %eax,%esi
801032cb:	0f 85 81 fe ff ff    	jne    80103152 <mpinit+0x52>
801032d1:	e9 5d ff ff ff       	jmp    80103233 <mpinit+0x133>
801032d6:	66 90                	xchg   %ax,%ax
801032d8:	66 90                	xchg   %ax,%ax
801032da:	66 90                	xchg   %ax,%ax
801032dc:	66 90                	xchg   %ax,%ax
801032de:	66 90                	xchg   %ax,%ax

801032e0 <picenable>:
801032e0:	55                   	push   %ebp
801032e1:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
801032e6:	ba 21 00 00 00       	mov    $0x21,%edx
801032eb:	89 e5                	mov    %esp,%ebp
801032ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
801032f0:	d3 c0                	rol    %cl,%eax
801032f2:	66 23 05 00 a0 10 80 	and    0x8010a000,%ax
801032f9:	66 a3 00 a0 10 80    	mov    %ax,0x8010a000
801032ff:	ee                   	out    %al,(%dx)
80103300:	ba a1 00 00 00       	mov    $0xa1,%edx
80103305:	66 c1 e8 08          	shr    $0x8,%ax
80103309:	ee                   	out    %al,(%dx)
8010330a:	5d                   	pop    %ebp
8010330b:	c3                   	ret    
8010330c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103310 <picinit>:
80103310:	55                   	push   %ebp
80103311:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103316:	89 e5                	mov    %esp,%ebp
80103318:	57                   	push   %edi
80103319:	56                   	push   %esi
8010331a:	53                   	push   %ebx
8010331b:	bb 21 00 00 00       	mov    $0x21,%ebx
80103320:	89 da                	mov    %ebx,%edx
80103322:	ee                   	out    %al,(%dx)
80103323:	b9 a1 00 00 00       	mov    $0xa1,%ecx
80103328:	89 ca                	mov    %ecx,%edx
8010332a:	ee                   	out    %al,(%dx)
8010332b:	bf 11 00 00 00       	mov    $0x11,%edi
80103330:	be 20 00 00 00       	mov    $0x20,%esi
80103335:	89 f8                	mov    %edi,%eax
80103337:	89 f2                	mov    %esi,%edx
80103339:	ee                   	out    %al,(%dx)
8010333a:	b8 20 00 00 00       	mov    $0x20,%eax
8010333f:	89 da                	mov    %ebx,%edx
80103341:	ee                   	out    %al,(%dx)
80103342:	b8 04 00 00 00       	mov    $0x4,%eax
80103347:	ee                   	out    %al,(%dx)
80103348:	b8 03 00 00 00       	mov    $0x3,%eax
8010334d:	ee                   	out    %al,(%dx)
8010334e:	bb a0 00 00 00       	mov    $0xa0,%ebx
80103353:	89 f8                	mov    %edi,%eax
80103355:	89 da                	mov    %ebx,%edx
80103357:	ee                   	out    %al,(%dx)
80103358:	b8 28 00 00 00       	mov    $0x28,%eax
8010335d:	89 ca                	mov    %ecx,%edx
8010335f:	ee                   	out    %al,(%dx)
80103360:	b8 02 00 00 00       	mov    $0x2,%eax
80103365:	ee                   	out    %al,(%dx)
80103366:	b8 03 00 00 00       	mov    $0x3,%eax
8010336b:	ee                   	out    %al,(%dx)
8010336c:	bf 68 00 00 00       	mov    $0x68,%edi
80103371:	89 f2                	mov    %esi,%edx
80103373:	89 f8                	mov    %edi,%eax
80103375:	ee                   	out    %al,(%dx)
80103376:	b9 0a 00 00 00       	mov    $0xa,%ecx
8010337b:	89 c8                	mov    %ecx,%eax
8010337d:	ee                   	out    %al,(%dx)
8010337e:	89 f8                	mov    %edi,%eax
80103380:	89 da                	mov    %ebx,%edx
80103382:	ee                   	out    %al,(%dx)
80103383:	89 c8                	mov    %ecx,%eax
80103385:	ee                   	out    %al,(%dx)
80103386:	0f b7 05 00 a0 10 80 	movzwl 0x8010a000,%eax
8010338d:	66 83 f8 ff          	cmp    $0xffff,%ax
80103391:	74 10                	je     801033a3 <picinit+0x93>
80103393:	ba 21 00 00 00       	mov    $0x21,%edx
80103398:	ee                   	out    %al,(%dx)
80103399:	ba a1 00 00 00       	mov    $0xa1,%edx
8010339e:	66 c1 e8 08          	shr    $0x8,%ax
801033a2:	ee                   	out    %al,(%dx)
801033a3:	5b                   	pop    %ebx
801033a4:	5e                   	pop    %esi
801033a5:	5f                   	pop    %edi
801033a6:	5d                   	pop    %ebp
801033a7:	c3                   	ret    
801033a8:	66 90                	xchg   %ax,%ax
801033aa:	66 90                	xchg   %ax,%ax
801033ac:	66 90                	xchg   %ax,%ax
801033ae:	66 90                	xchg   %ax,%ax

801033b0 <pipealloc>:
801033b0:	55                   	push   %ebp
801033b1:	89 e5                	mov    %esp,%ebp
801033b3:	57                   	push   %edi
801033b4:	56                   	push   %esi
801033b5:	53                   	push   %ebx
801033b6:	83 ec 0c             	sub    $0xc,%esp
801033b9:	8b 75 08             	mov    0x8(%ebp),%esi
801033bc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801033bf:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801033c5:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
801033cb:	e8 e0 d9 ff ff       	call   80100db0 <filealloc>
801033d0:	85 c0                	test   %eax,%eax
801033d2:	89 06                	mov    %eax,(%esi)
801033d4:	0f 84 a8 00 00 00    	je     80103482 <pipealloc+0xd2>
801033da:	e8 d1 d9 ff ff       	call   80100db0 <filealloc>
801033df:	85 c0                	test   %eax,%eax
801033e1:	89 03                	mov    %eax,(%ebx)
801033e3:	0f 84 87 00 00 00    	je     80103470 <pipealloc+0xc0>
801033e9:	e8 e2 f0 ff ff       	call   801024d0 <kalloc>
801033ee:	85 c0                	test   %eax,%eax
801033f0:	89 c7                	mov    %eax,%edi
801033f2:	0f 84 b0 00 00 00    	je     801034a8 <pipealloc+0xf8>
801033f8:	83 ec 08             	sub    $0x8,%esp
801033fb:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103402:	00 00 00 
80103405:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010340c:	00 00 00 
8010340f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103416:	00 00 00 
80103419:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103420:	00 00 00 
80103423:	68 08 75 10 80       	push   $0x80107508
80103428:	50                   	push   %eax
80103429:	e8 72 0e 00 00       	call   801042a0 <initlock>
8010342e:	8b 06                	mov    (%esi),%eax
80103430:	83 c4 10             	add    $0x10,%esp
80103433:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103439:	8b 06                	mov    (%esi),%eax
8010343b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
8010343f:	8b 06                	mov    (%esi),%eax
80103441:	c6 40 09 00          	movb   $0x0,0x9(%eax)
80103445:	8b 06                	mov    (%esi),%eax
80103447:	89 78 0c             	mov    %edi,0xc(%eax)
8010344a:	8b 03                	mov    (%ebx),%eax
8010344c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103452:	8b 03                	mov    (%ebx),%eax
80103454:	c6 40 08 00          	movb   $0x0,0x8(%eax)
80103458:	8b 03                	mov    (%ebx),%eax
8010345a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
8010345e:	8b 03                	mov    (%ebx),%eax
80103460:	89 78 0c             	mov    %edi,0xc(%eax)
80103463:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103466:	31 c0                	xor    %eax,%eax
80103468:	5b                   	pop    %ebx
80103469:	5e                   	pop    %esi
8010346a:	5f                   	pop    %edi
8010346b:	5d                   	pop    %ebp
8010346c:	c3                   	ret    
8010346d:	8d 76 00             	lea    0x0(%esi),%esi
80103470:	8b 06                	mov    (%esi),%eax
80103472:	85 c0                	test   %eax,%eax
80103474:	74 1e                	je     80103494 <pipealloc+0xe4>
80103476:	83 ec 0c             	sub    $0xc,%esp
80103479:	50                   	push   %eax
8010347a:	e8 f1 d9 ff ff       	call   80100e70 <fileclose>
8010347f:	83 c4 10             	add    $0x10,%esp
80103482:	8b 03                	mov    (%ebx),%eax
80103484:	85 c0                	test   %eax,%eax
80103486:	74 0c                	je     80103494 <pipealloc+0xe4>
80103488:	83 ec 0c             	sub    $0xc,%esp
8010348b:	50                   	push   %eax
8010348c:	e8 df d9 ff ff       	call   80100e70 <fileclose>
80103491:	83 c4 10             	add    $0x10,%esp
80103494:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103497:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010349c:	5b                   	pop    %ebx
8010349d:	5e                   	pop    %esi
8010349e:	5f                   	pop    %edi
8010349f:	5d                   	pop    %ebp
801034a0:	c3                   	ret    
801034a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801034a8:	8b 06                	mov    (%esi),%eax
801034aa:	85 c0                	test   %eax,%eax
801034ac:	75 c8                	jne    80103476 <pipealloc+0xc6>
801034ae:	eb d2                	jmp    80103482 <pipealloc+0xd2>

801034b0 <pipeclose>:
801034b0:	55                   	push   %ebp
801034b1:	89 e5                	mov    %esp,%ebp
801034b3:	56                   	push   %esi
801034b4:	53                   	push   %ebx
801034b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801034b8:	8b 75 0c             	mov    0xc(%ebp),%esi
801034bb:	83 ec 0c             	sub    $0xc,%esp
801034be:	53                   	push   %ebx
801034bf:	e8 fc 0d 00 00       	call   801042c0 <acquire>
801034c4:	83 c4 10             	add    $0x10,%esp
801034c7:	85 f6                	test   %esi,%esi
801034c9:	74 45                	je     80103510 <pipeclose+0x60>
801034cb:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801034d1:	83 ec 0c             	sub    $0xc,%esp
801034d4:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
801034db:	00 00 00 
801034de:	50                   	push   %eax
801034df:	e8 fc 0a 00 00       	call   80103fe0 <wakeup>
801034e4:	83 c4 10             	add    $0x10,%esp
801034e7:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
801034ed:	85 d2                	test   %edx,%edx
801034ef:	75 0a                	jne    801034fb <pipeclose+0x4b>
801034f1:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801034f7:	85 c0                	test   %eax,%eax
801034f9:	74 35                	je     80103530 <pipeclose+0x80>
801034fb:	89 5d 08             	mov    %ebx,0x8(%ebp)
801034fe:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103501:	5b                   	pop    %ebx
80103502:	5e                   	pop    %esi
80103503:	5d                   	pop    %ebp
80103504:	e9 97 0f 00 00       	jmp    801044a0 <release>
80103509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103510:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103516:	83 ec 0c             	sub    $0xc,%esp
80103519:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103520:	00 00 00 
80103523:	50                   	push   %eax
80103524:	e8 b7 0a 00 00       	call   80103fe0 <wakeup>
80103529:	83 c4 10             	add    $0x10,%esp
8010352c:	eb b9                	jmp    801034e7 <pipeclose+0x37>
8010352e:	66 90                	xchg   %ax,%ax
80103530:	83 ec 0c             	sub    $0xc,%esp
80103533:	53                   	push   %ebx
80103534:	e8 67 0f 00 00       	call   801044a0 <release>
80103539:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010353c:	83 c4 10             	add    $0x10,%esp
8010353f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103542:	5b                   	pop    %ebx
80103543:	5e                   	pop    %esi
80103544:	5d                   	pop    %ebp
80103545:	e9 d6 ed ff ff       	jmp    80102320 <kfree>
8010354a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103550 <pipewrite>:
80103550:	55                   	push   %ebp
80103551:	89 e5                	mov    %esp,%ebp
80103553:	57                   	push   %edi
80103554:	56                   	push   %esi
80103555:	53                   	push   %ebx
80103556:	83 ec 28             	sub    $0x28,%esp
80103559:	8b 7d 08             	mov    0x8(%ebp),%edi
8010355c:	57                   	push   %edi
8010355d:	e8 5e 0d 00 00       	call   801042c0 <acquire>
80103562:	8b 45 10             	mov    0x10(%ebp),%eax
80103565:	83 c4 10             	add    $0x10,%esp
80103568:	85 c0                	test   %eax,%eax
8010356a:	0f 8e c6 00 00 00    	jle    80103636 <pipewrite+0xe6>
80103570:	8b 45 0c             	mov    0xc(%ebp),%eax
80103573:	8b 8f 38 02 00 00    	mov    0x238(%edi),%ecx
80103579:	8d b7 34 02 00 00    	lea    0x234(%edi),%esi
8010357f:	8d 9f 38 02 00 00    	lea    0x238(%edi),%ebx
80103585:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103588:	03 45 10             	add    0x10(%ebp),%eax
8010358b:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010358e:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
80103594:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
8010359a:	39 d1                	cmp    %edx,%ecx
8010359c:	0f 85 cf 00 00 00    	jne    80103671 <pipewrite+0x121>
801035a2:	8b 97 3c 02 00 00    	mov    0x23c(%edi),%edx
801035a8:	85 d2                	test   %edx,%edx
801035aa:	0f 84 a8 00 00 00    	je     80103658 <pipewrite+0x108>
801035b0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801035b7:	8b 42 24             	mov    0x24(%edx),%eax
801035ba:	85 c0                	test   %eax,%eax
801035bc:	74 25                	je     801035e3 <pipewrite+0x93>
801035be:	e9 95 00 00 00       	jmp    80103658 <pipewrite+0x108>
801035c3:	90                   	nop
801035c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801035c8:	8b 87 3c 02 00 00    	mov    0x23c(%edi),%eax
801035ce:	85 c0                	test   %eax,%eax
801035d0:	0f 84 82 00 00 00    	je     80103658 <pipewrite+0x108>
801035d6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801035dc:	8b 40 24             	mov    0x24(%eax),%eax
801035df:	85 c0                	test   %eax,%eax
801035e1:	75 75                	jne    80103658 <pipewrite+0x108>
801035e3:	83 ec 0c             	sub    $0xc,%esp
801035e6:	56                   	push   %esi
801035e7:	e8 f4 09 00 00       	call   80103fe0 <wakeup>
801035ec:	59                   	pop    %ecx
801035ed:	58                   	pop    %eax
801035ee:	57                   	push   %edi
801035ef:	53                   	push   %ebx
801035f0:	e8 4b 08 00 00       	call   80103e40 <sleep>
801035f5:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
801035fb:	8b 97 38 02 00 00    	mov    0x238(%edi),%edx
80103601:	83 c4 10             	add    $0x10,%esp
80103604:	05 00 02 00 00       	add    $0x200,%eax
80103609:	39 c2                	cmp    %eax,%edx
8010360b:	74 bb                	je     801035c8 <pipewrite+0x78>
8010360d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103610:	8d 4a 01             	lea    0x1(%edx),%ecx
80103613:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
80103617:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010361d:	89 8f 38 02 00 00    	mov    %ecx,0x238(%edi)
80103623:	0f b6 00             	movzbl (%eax),%eax
80103626:	88 44 17 34          	mov    %al,0x34(%edi,%edx,1)
8010362a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010362d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
80103630:	0f 85 58 ff ff ff    	jne    8010358e <pipewrite+0x3e>
80103636:	8d 97 34 02 00 00    	lea    0x234(%edi),%edx
8010363c:	83 ec 0c             	sub    $0xc,%esp
8010363f:	52                   	push   %edx
80103640:	e8 9b 09 00 00       	call   80103fe0 <wakeup>
80103645:	89 3c 24             	mov    %edi,(%esp)
80103648:	e8 53 0e 00 00       	call   801044a0 <release>
8010364d:	83 c4 10             	add    $0x10,%esp
80103650:	8b 45 10             	mov    0x10(%ebp),%eax
80103653:	eb 14                	jmp    80103669 <pipewrite+0x119>
80103655:	8d 76 00             	lea    0x0(%esi),%esi
80103658:	83 ec 0c             	sub    $0xc,%esp
8010365b:	57                   	push   %edi
8010365c:	e8 3f 0e 00 00       	call   801044a0 <release>
80103661:	83 c4 10             	add    $0x10,%esp
80103664:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103669:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010366c:	5b                   	pop    %ebx
8010366d:	5e                   	pop    %esi
8010366e:	5f                   	pop    %edi
8010366f:	5d                   	pop    %ebp
80103670:	c3                   	ret    
80103671:	89 ca                	mov    %ecx,%edx
80103673:	eb 98                	jmp    8010360d <pipewrite+0xbd>
80103675:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103680 <piperead>:
80103680:	55                   	push   %ebp
80103681:	89 e5                	mov    %esp,%ebp
80103683:	57                   	push   %edi
80103684:	56                   	push   %esi
80103685:	53                   	push   %ebx
80103686:	83 ec 18             	sub    $0x18,%esp
80103689:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010368c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010368f:	53                   	push   %ebx
80103690:	e8 2b 0c 00 00       	call   801042c0 <acquire>
80103695:	83 c4 10             	add    $0x10,%esp
80103698:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010369e:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
801036a4:	75 6a                	jne    80103710 <piperead+0x90>
801036a6:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
801036ac:	85 f6                	test   %esi,%esi
801036ae:	0f 84 cc 00 00 00    	je     80103780 <piperead+0x100>
801036b4:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
801036ba:	eb 2d                	jmp    801036e9 <piperead+0x69>
801036bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801036c0:	83 ec 08             	sub    $0x8,%esp
801036c3:	53                   	push   %ebx
801036c4:	56                   	push   %esi
801036c5:	e8 76 07 00 00       	call   80103e40 <sleep>
801036ca:	83 c4 10             	add    $0x10,%esp
801036cd:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801036d3:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
801036d9:	75 35                	jne    80103710 <piperead+0x90>
801036db:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
801036e1:	85 d2                	test   %edx,%edx
801036e3:	0f 84 97 00 00 00    	je     80103780 <piperead+0x100>
801036e9:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801036f0:	8b 4a 24             	mov    0x24(%edx),%ecx
801036f3:	85 c9                	test   %ecx,%ecx
801036f5:	74 c9                	je     801036c0 <piperead+0x40>
801036f7:	83 ec 0c             	sub    $0xc,%esp
801036fa:	53                   	push   %ebx
801036fb:	e8 a0 0d 00 00       	call   801044a0 <release>
80103700:	83 c4 10             	add    $0x10,%esp
80103703:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103706:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010370b:	5b                   	pop    %ebx
8010370c:	5e                   	pop    %esi
8010370d:	5f                   	pop    %edi
8010370e:	5d                   	pop    %ebp
8010370f:	c3                   	ret    
80103710:	8b 45 10             	mov    0x10(%ebp),%eax
80103713:	85 c0                	test   %eax,%eax
80103715:	7e 69                	jle    80103780 <piperead+0x100>
80103717:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
8010371d:	31 c9                	xor    %ecx,%ecx
8010371f:	eb 15                	jmp    80103736 <piperead+0xb6>
80103721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103728:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
8010372e:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
80103734:	74 5a                	je     80103790 <piperead+0x110>
80103736:	8d 72 01             	lea    0x1(%edx),%esi
80103739:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010373f:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
80103745:	0f b6 54 13 34       	movzbl 0x34(%ebx,%edx,1),%edx
8010374a:	88 14 0f             	mov    %dl,(%edi,%ecx,1)
8010374d:	83 c1 01             	add    $0x1,%ecx
80103750:	39 4d 10             	cmp    %ecx,0x10(%ebp)
80103753:	75 d3                	jne    80103728 <piperead+0xa8>
80103755:	8d 93 38 02 00 00    	lea    0x238(%ebx),%edx
8010375b:	83 ec 0c             	sub    $0xc,%esp
8010375e:	52                   	push   %edx
8010375f:	e8 7c 08 00 00       	call   80103fe0 <wakeup>
80103764:	89 1c 24             	mov    %ebx,(%esp)
80103767:	e8 34 0d 00 00       	call   801044a0 <release>
8010376c:	8b 45 10             	mov    0x10(%ebp),%eax
8010376f:	83 c4 10             	add    $0x10,%esp
80103772:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103775:	5b                   	pop    %ebx
80103776:	5e                   	pop    %esi
80103777:	5f                   	pop    %edi
80103778:	5d                   	pop    %ebp
80103779:	c3                   	ret    
8010377a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103780:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
80103787:	eb cc                	jmp    80103755 <piperead+0xd5>
80103789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103790:	89 4d 10             	mov    %ecx,0x10(%ebp)
80103793:	eb c0                	jmp    80103755 <piperead+0xd5>
80103795:	66 90                	xchg   %ax,%ax
80103797:	66 90                	xchg   %ax,%ax
80103799:	66 90                	xchg   %ax,%ax
8010379b:	66 90                	xchg   %ax,%ax
8010379d:	66 90                	xchg   %ax,%ax
8010379f:	90                   	nop

801037a0 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801037a0:	55                   	push   %ebp
801037a1:	89 e5                	mov    %esp,%ebp
801037a3:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801037a4:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801037a9:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
801037ac:	68 a0 2d 11 80       	push   $0x80112da0
801037b1:	e8 0a 0b 00 00       	call   801042c0 <acquire>
801037b6:	83 c4 10             	add    $0x10,%esp
801037b9:	eb 10                	jmp    801037cb <allocproc+0x2b>
801037bb:	90                   	nop
801037bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801037c0:	83 c3 7c             	add    $0x7c,%ebx
801037c3:	81 fb d4 4c 11 80    	cmp    $0x80114cd4,%ebx
801037c9:	74 75                	je     80103840 <allocproc+0xa0>
    if(p->state == UNUSED)
801037cb:	8b 43 0c             	mov    0xc(%ebx),%eax
801037ce:	85 c0                	test   %eax,%eax
801037d0:	75 ee                	jne    801037c0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801037d2:	a1 08 a0 10 80       	mov    0x8010a008,%eax

  release(&ptable.lock);
801037d7:	83 ec 0c             	sub    $0xc,%esp

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
801037da:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;

  release(&ptable.lock);
801037e1:	68 a0 2d 11 80       	push   $0x80112da0
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801037e6:	8d 50 01             	lea    0x1(%eax),%edx
801037e9:	89 43 10             	mov    %eax,0x10(%ebx)
801037ec:	89 15 08 a0 10 80    	mov    %edx,0x8010a008

  release(&ptable.lock);
801037f2:	e8 a9 0c 00 00       	call   801044a0 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
801037f7:	e8 d4 ec ff ff       	call   801024d0 <kalloc>
801037fc:	83 c4 10             	add    $0x10,%esp
801037ff:	85 c0                	test   %eax,%eax
80103801:	89 43 08             	mov    %eax,0x8(%ebx)
80103804:	74 51                	je     80103857 <allocproc+0xb7>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103806:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010380c:	83 ec 04             	sub    $0x4,%esp
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
8010380f:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103814:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
80103817:	c7 40 14 3e 57 10 80 	movl   $0x8010573e,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010381e:	6a 14                	push   $0x14
80103820:	6a 00                	push   $0x0
80103822:	50                   	push   %eax
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
80103823:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103826:	e8 c5 0c 00 00       	call   801044f0 <memset>
  p->context->eip = (uint)forkret;
8010382b:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
8010382e:	83 c4 10             	add    $0x10,%esp
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
80103831:	c7 40 10 60 38 10 80 	movl   $0x80103860,0x10(%eax)

  return p;
80103838:	89 d8                	mov    %ebx,%eax
}
8010383a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010383d:	c9                   	leave  
8010383e:	c3                   	ret    
8010383f:	90                   	nop

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
80103840:	83 ec 0c             	sub    $0xc,%esp
80103843:	68 a0 2d 11 80       	push   $0x80112da0
80103848:	e8 53 0c 00 00       	call   801044a0 <release>
  return 0;
8010384d:	83 c4 10             	add    $0x10,%esp
80103850:	31 c0                	xor    %eax,%eax
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
80103852:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103855:	c9                   	leave  
80103856:	c3                   	ret    

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
80103857:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
8010385e:	eb da                	jmp    8010383a <allocproc+0x9a>

80103860 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103860:	55                   	push   %ebp
80103861:	89 e5                	mov    %esp,%ebp
80103863:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103866:	68 a0 2d 11 80       	push   $0x80112da0
8010386b:	e8 30 0c 00 00       	call   801044a0 <release>

  if (first) {
80103870:	a1 04 a0 10 80       	mov    0x8010a004,%eax
80103875:	83 c4 10             	add    $0x10,%esp
80103878:	85 c0                	test   %eax,%eax
8010387a:	75 04                	jne    80103880 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010387c:	c9                   	leave  
8010387d:	c3                   	ret    
8010387e:	66 90                	xchg   %ax,%ax
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
80103880:	83 ec 0c             	sub    $0xc,%esp

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
80103883:	c7 05 04 a0 10 80 00 	movl   $0x0,0x8010a004
8010388a:	00 00 00 
    iinit(ROOTDEV);
8010388d:	6a 01                	push   $0x1
8010388f:	e8 1c dc ff ff       	call   801014b0 <iinit>
    initlog(ROOTDEV);
80103894:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010389b:	e8 d0 f2 ff ff       	call   80102b70 <initlog>
801038a0:	83 c4 10             	add    $0x10,%esp
  }

  // Return to "caller", actually trapret (see allocproc).
}
801038a3:	c9                   	leave  
801038a4:	c3                   	ret    
801038a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801038a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801038b0 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
801038b0:	55                   	push   %ebp
801038b1:	89 e5                	mov    %esp,%ebp
801038b3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801038b6:	68 0d 75 10 80       	push   $0x8010750d
801038bb:	68 a0 2d 11 80       	push   $0x80112da0
801038c0:	e8 db 09 00 00       	call   801042a0 <initlock>
}
801038c5:	83 c4 10             	add    $0x10,%esp
801038c8:	c9                   	leave  
801038c9:	c3                   	ret    
801038ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801038d0 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
801038d0:	55                   	push   %ebp
801038d1:	89 e5                	mov    %esp,%ebp
801038d3:	53                   	push   %ebx
801038d4:	83 ec 04             	sub    $0x4,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
801038d7:	e8 c4 fe ff ff       	call   801037a0 <allocproc>
801038dc:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
801038de:	a3 bc a5 10 80       	mov    %eax,0x8010a5bc
  if((p->pgdir = setupkvm()) == 0)
801038e3:	e8 98 30 00 00       	call   80106980 <setupkvm>
801038e8:	85 c0                	test   %eax,%eax
801038ea:	89 43 04             	mov    %eax,0x4(%ebx)
801038ed:	0f 84 bd 00 00 00    	je     801039b0 <userinit+0xe0>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801038f3:	83 ec 04             	sub    $0x4,%esp
801038f6:	68 2c 00 00 00       	push   $0x2c
801038fb:	68 60 a4 10 80       	push   $0x8010a460
80103900:	50                   	push   %eax
80103901:	e8 ca 31 00 00       	call   80106ad0 <inituvm>
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
80103906:	83 c4 0c             	add    $0xc,%esp
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
80103909:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010390f:	6a 4c                	push   $0x4c
80103911:	6a 00                	push   $0x0
80103913:	ff 73 18             	pushl  0x18(%ebx)
80103916:	e8 d5 0b 00 00       	call   801044f0 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010391b:	8b 43 18             	mov    0x18(%ebx),%eax
8010391e:	ba 23 00 00 00       	mov    $0x23,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103923:	b9 2b 00 00 00       	mov    $0x2b,%ecx
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103928:	83 c4 0c             	add    $0xc,%esp
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010392b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010392f:	8b 43 18             	mov    0x18(%ebx),%eax
80103932:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103936:	8b 43 18             	mov    0x18(%ebx),%eax
80103939:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010393d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103941:	8b 43 18             	mov    0x18(%ebx),%eax
80103944:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103948:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010394c:	8b 43 18             	mov    0x18(%ebx),%eax
8010394f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103956:	8b 43 18             	mov    0x18(%ebx),%eax
80103959:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103960:	8b 43 18             	mov    0x18(%ebx),%eax
80103963:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
8010396a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010396d:	6a 10                	push   $0x10
8010396f:	68 2d 75 10 80       	push   $0x8010752d
80103974:	50                   	push   %eax
80103975:	e8 76 0d 00 00       	call   801046f0 <safestrcpy>
  p->cwd = namei("/");
8010397a:	c7 04 24 36 75 10 80 	movl   $0x80107536,(%esp)
80103981:	e8 5a e5 ff ff       	call   80101ee0 <namei>
80103986:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
80103989:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103990:	e8 2b 09 00 00       	call   801042c0 <acquire>

  p->state = RUNNABLE;
80103995:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
8010399c:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
801039a3:	e8 f8 0a 00 00       	call   801044a0 <release>
}
801039a8:	83 c4 10             	add    $0x10,%esp
801039ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801039ae:	c9                   	leave  
801039af:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
801039b0:	83 ec 0c             	sub    $0xc,%esp
801039b3:	68 14 75 10 80       	push   $0x80107514
801039b8:	e8 b3 c9 ff ff       	call   80100370 <panic>
801039bd:	8d 76 00             	lea    0x0(%esi),%esi

801039c0 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
801039c0:	55                   	push   %ebp
801039c1:	89 e5                	mov    %esp,%ebp
801039c3:	83 ec 08             	sub    $0x8,%esp
  uint sz;

  sz = proc->sz;
801039c6:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
801039cd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint sz;

  sz = proc->sz;
801039d0:	8b 02                	mov    (%edx),%eax
  if(n > 0){
801039d2:	83 f9 00             	cmp    $0x0,%ecx
801039d5:	7e 39                	jle    80103a10 <growproc+0x50>
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
801039d7:	83 ec 04             	sub    $0x4,%esp
801039da:	01 c1                	add    %eax,%ecx
801039dc:	51                   	push   %ecx
801039dd:	50                   	push   %eax
801039de:	ff 72 04             	pushl  0x4(%edx)
801039e1:	e8 2a 32 00 00       	call   80106c10 <allocuvm>
801039e6:	83 c4 10             	add    $0x10,%esp
801039e9:	85 c0                	test   %eax,%eax
801039eb:	74 3b                	je     80103a28 <growproc+0x68>
801039ed:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  proc->sz = sz;
801039f4:	89 02                	mov    %eax,(%edx)
  switchuvm(proc);
801039f6:	83 ec 0c             	sub    $0xc,%esp
801039f9:	65 ff 35 04 00 00 00 	pushl  %gs:0x4
80103a00:	e8 2b 30 00 00       	call   80106a30 <switchuvm>
  return 0;
80103a05:	83 c4 10             	add    $0x10,%esp
80103a08:	31 c0                	xor    %eax,%eax
}
80103a0a:	c9                   	leave  
80103a0b:	c3                   	ret    
80103a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
80103a10:	74 e2                	je     801039f4 <growproc+0x34>
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
80103a12:	83 ec 04             	sub    $0x4,%esp
80103a15:	01 c1                	add    %eax,%ecx
80103a17:	51                   	push   %ecx
80103a18:	50                   	push   %eax
80103a19:	ff 72 04             	pushl  0x4(%edx)
80103a1c:	e8 ef 32 00 00       	call   80106d10 <deallocuvm>
80103a21:	83 c4 10             	add    $0x10,%esp
80103a24:	85 c0                	test   %eax,%eax
80103a26:	75 c5                	jne    801039ed <growproc+0x2d>
  uint sz;

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
80103a28:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
  }
  proc->sz = sz;
  switchuvm(proc);
  return 0;
}
80103a2d:	c9                   	leave  
80103a2e:	c3                   	ret    
80103a2f:	90                   	nop

80103a30 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
80103a30:	55                   	push   %ebp
80103a31:	89 e5                	mov    %esp,%ebp
80103a33:	57                   	push   %edi
80103a34:	56                   	push   %esi
80103a35:	53                   	push   %ebx
80103a36:	83 ec 0c             	sub    $0xc,%esp
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0){
80103a39:	e8 62 fd ff ff       	call   801037a0 <allocproc>
80103a3e:	85 c0                	test   %eax,%eax
80103a40:	0f 84 d6 00 00 00    	je     80103b1c <fork+0xec>
80103a46:	89 c3                	mov    %eax,%ebx
    return -1;
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
80103a48:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a4e:	83 ec 08             	sub    $0x8,%esp
80103a51:	ff 30                	pushl  (%eax)
80103a53:	ff 70 04             	pushl  0x4(%eax)
80103a56:	e8 95 33 00 00       	call   80106df0 <copyuvm>
80103a5b:	83 c4 10             	add    $0x10,%esp
80103a5e:	85 c0                	test   %eax,%eax
80103a60:	89 43 04             	mov    %eax,0x4(%ebx)
80103a63:	0f 84 ba 00 00 00    	je     80103b23 <fork+0xf3>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
80103a69:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  np->parent = proc;
  *np->tf = *proc->tf;
80103a6f:	8b 7b 18             	mov    0x18(%ebx),%edi
80103a72:	b9 13 00 00 00       	mov    $0x13,%ecx
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
80103a77:	8b 00                	mov    (%eax),%eax
80103a79:	89 03                	mov    %eax,(%ebx)
  np->parent = proc;
80103a7b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a81:	89 43 14             	mov    %eax,0x14(%ebx)
  *np->tf = *proc->tf;
80103a84:	8b 70 18             	mov    0x18(%eax),%esi
80103a87:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103a89:	31 f6                	xor    %esi,%esi
  np->sz = proc->sz;
  np->parent = proc;
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
80103a8b:	8b 43 18             	mov    0x18(%ebx),%eax
80103a8e:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103a95:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(i = 0; i < NOFILE; i++)
    if(proc->ofile[i])
80103aa0:	8b 44 b2 28          	mov    0x28(%edx,%esi,4),%eax
80103aa4:	85 c0                	test   %eax,%eax
80103aa6:	74 17                	je     80103abf <fork+0x8f>
      np->ofile[i] = filedup(proc->ofile[i]);
80103aa8:	83 ec 0c             	sub    $0xc,%esp
80103aab:	50                   	push   %eax
80103aac:	e8 6f d3 ff ff       	call   80100e20 <filedup>
80103ab1:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)
80103ab5:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103abc:	83 c4 10             	add    $0x10,%esp
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103abf:	83 c6 01             	add    $0x1,%esi
80103ac2:	83 fe 10             	cmp    $0x10,%esi
80103ac5:	75 d9                	jne    80103aa0 <fork+0x70>
    if(proc->ofile[i])
      np->ofile[i] = filedup(proc->ofile[i]);
  np->cwd = idup(proc->cwd);
80103ac7:	83 ec 0c             	sub    $0xc,%esp
80103aca:	ff 72 68             	pushl  0x68(%edx)
80103acd:	e8 ae db ff ff       	call   80101680 <idup>
80103ad2:	89 43 68             	mov    %eax,0x68(%ebx)

  safestrcpy(np->name, proc->name, sizeof(proc->name));
80103ad5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103adb:	83 c4 0c             	add    $0xc,%esp
80103ade:	6a 10                	push   $0x10
80103ae0:	83 c0 6c             	add    $0x6c,%eax
80103ae3:	50                   	push   %eax
80103ae4:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103ae7:	50                   	push   %eax
80103ae8:	e8 03 0c 00 00       	call   801046f0 <safestrcpy>

  pid = np->pid;
80103aed:	8b 73 10             	mov    0x10(%ebx),%esi

  acquire(&ptable.lock);
80103af0:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103af7:	e8 c4 07 00 00       	call   801042c0 <acquire>

  np->state = RUNNABLE;
80103afc:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
80103b03:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103b0a:	e8 91 09 00 00       	call   801044a0 <release>

  return pid;
80103b0f:	83 c4 10             	add    $0x10,%esp
80103b12:	89 f0                	mov    %esi,%eax
}
80103b14:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103b17:	5b                   	pop    %ebx
80103b18:	5e                   	pop    %esi
80103b19:	5f                   	pop    %edi
80103b1a:	5d                   	pop    %ebp
80103b1b:	c3                   	ret    
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
80103b1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103b21:	eb f1                	jmp    80103b14 <fork+0xe4>
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
    kfree(np->kstack);
80103b23:	83 ec 0c             	sub    $0xc,%esp
80103b26:	ff 73 08             	pushl  0x8(%ebx)
80103b29:	e8 f2 e7 ff ff       	call   80102320 <kfree>
    np->kstack = 0;
80103b2e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103b35:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103b3c:	83 c4 10             	add    $0x10,%esp
80103b3f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103b44:	eb ce                	jmp    80103b14 <fork+0xe4>
80103b46:	8d 76 00             	lea    0x0(%esi),%esi
80103b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103b50 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103b50:	55                   	push   %ebp
80103b51:	89 e5                	mov    %esp,%ebp
80103b53:	53                   	push   %ebx
80103b54:	83 ec 04             	sub    $0x4,%esp
80103b57:	89 f6                	mov    %esi,%esi
80103b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103b60:	fb                   	sti    
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103b61:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b64:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103b69:	68 a0 2d 11 80       	push   $0x80112da0
80103b6e:	e8 4d 07 00 00       	call   801042c0 <acquire>
80103b73:	83 c4 10             	add    $0x10,%esp
80103b76:	eb 13                	jmp    80103b8b <scheduler+0x3b>
80103b78:	90                   	nop
80103b79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b80:	83 c3 7c             	add    $0x7c,%ebx
80103b83:	81 fb d4 4c 11 80    	cmp    $0x80114cd4,%ebx
80103b89:	74 55                	je     80103be0 <scheduler+0x90>
      if(p->state != RUNNABLE)
80103b8b:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103b8f:	75 ef                	jne    80103b80 <scheduler+0x30>

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
80103b91:	83 ec 0c             	sub    $0xc,%esp
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
80103b94:	65 89 1d 04 00 00 00 	mov    %ebx,%gs:0x4
      switchuvm(p);
80103b9b:	53                   	push   %ebx
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b9c:	83 c3 7c             	add    $0x7c,%ebx

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
80103b9f:	e8 8c 2e 00 00       	call   80106a30 <switchuvm>
      p->state = RUNNING;
      swtch(&cpu->scheduler, p->context);
80103ba4:	58                   	pop    %eax
80103ba5:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
      p->state = RUNNING;
80103bab:	c7 43 90 04 00 00 00 	movl   $0x4,-0x70(%ebx)
      swtch(&cpu->scheduler, p->context);
80103bb2:	5a                   	pop    %edx
80103bb3:	ff 73 a0             	pushl  -0x60(%ebx)
80103bb6:	83 c0 04             	add    $0x4,%eax
80103bb9:	50                   	push   %eax
80103bba:	e8 8c 0b 00 00       	call   8010474b <swtch>
      switchkvm();
80103bbf:	e8 4c 2e 00 00       	call   80106a10 <switchkvm>

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
80103bc4:	83 c4 10             	add    $0x10,%esp
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103bc7:	81 fb d4 4c 11 80    	cmp    $0x80114cd4,%ebx
      swtch(&cpu->scheduler, p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
80103bcd:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80103bd4:	00 00 00 00 
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103bd8:	75 b1                	jne    80103b8b <scheduler+0x3b>
80103bda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
    }
    release(&ptable.lock);
80103be0:	83 ec 0c             	sub    $0xc,%esp
80103be3:	68 a0 2d 11 80       	push   $0x80112da0
80103be8:	e8 b3 08 00 00       	call   801044a0 <release>

  }
80103bed:	83 c4 10             	add    $0x10,%esp
80103bf0:	e9 6b ff ff ff       	jmp    80103b60 <scheduler+0x10>
80103bf5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103c00 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103c00:	55                   	push   %ebp
80103c01:	89 e5                	mov    %esp,%ebp
80103c03:	53                   	push   %ebx
80103c04:	83 ec 10             	sub    $0x10,%esp
  int intena;

  if(!holding(&ptable.lock))
80103c07:	68 a0 2d 11 80       	push   $0x80112da0
80103c0c:	e8 df 07 00 00       	call   801043f0 <holding>
80103c11:	83 c4 10             	add    $0x10,%esp
80103c14:	85 c0                	test   %eax,%eax
80103c16:	74 4c                	je     80103c64 <sched+0x64>
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
80103c18:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80103c1f:	83 ba ac 00 00 00 01 	cmpl   $0x1,0xac(%edx)
80103c26:	75 63                	jne    80103c8b <sched+0x8b>
    panic("sched locks");
  if(proc->state == RUNNING)
80103c28:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103c2e:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80103c32:	74 4a                	je     80103c7e <sched+0x7e>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103c34:	9c                   	pushf  
80103c35:	59                   	pop    %ecx
    panic("sched running");
  if(readeflags()&FL_IF)
80103c36:	80 e5 02             	and    $0x2,%ch
80103c39:	75 36                	jne    80103c71 <sched+0x71>
    panic("sched interruptible");
  intena = cpu->intena;
  swtch(&proc->context, cpu->scheduler);
80103c3b:	83 ec 08             	sub    $0x8,%esp
80103c3e:	83 c0 1c             	add    $0x1c,%eax
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = cpu->intena;
80103c41:	8b 9a b0 00 00 00    	mov    0xb0(%edx),%ebx
  swtch(&proc->context, cpu->scheduler);
80103c47:	ff 72 04             	pushl  0x4(%edx)
80103c4a:	50                   	push   %eax
80103c4b:	e8 fb 0a 00 00       	call   8010474b <swtch>
  cpu->intena = intena;
80103c50:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
}
80103c56:	83 c4 10             	add    $0x10,%esp
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = cpu->intena;
  swtch(&proc->context, cpu->scheduler);
  cpu->intena = intena;
80103c59:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
}
80103c5f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103c62:	c9                   	leave  
80103c63:	c3                   	ret    
sched(void)
{
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103c64:	83 ec 0c             	sub    $0xc,%esp
80103c67:	68 38 75 10 80       	push   $0x80107538
80103c6c:	e8 ff c6 ff ff       	call   80100370 <panic>
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103c71:	83 ec 0c             	sub    $0xc,%esp
80103c74:	68 64 75 10 80       	push   $0x80107564
80103c79:	e8 f2 c6 ff ff       	call   80100370 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
80103c7e:	83 ec 0c             	sub    $0xc,%esp
80103c81:	68 56 75 10 80       	push   $0x80107556
80103c86:	e8 e5 c6 ff ff       	call   80100370 <panic>
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
80103c8b:	83 ec 0c             	sub    $0xc,%esp
80103c8e:	68 4a 75 10 80       	push   $0x8010754a
80103c93:	e8 d8 c6 ff ff       	call   80100370 <panic>
80103c98:	90                   	nop
80103c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103ca0 <exit>:
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.

void
exit(int status)
{
80103ca0:	55                   	push   %ebp
80103ca1:	89 e5                	mov    %esp,%ebp
80103ca3:	56                   	push   %esi
80103ca4:	53                   	push   %ebx
  cprintf(" %d\n", status);
80103ca5:	83 ec 08             	sub    $0x8,%esp
80103ca8:	ff 75 08             	pushl  0x8(%ebp)
80103cab:	68 48 76 10 80       	push   $0x80107648
80103cb0:	e8 ab c9 ff ff       	call   80100660 <cprintf>
  struct proc *p;
  int fd;

  if(proc == initproc)
80103cb5:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103cbc:	83 c4 10             	add    $0x10,%esp
80103cbf:	3b 15 bc a5 10 80    	cmp    0x8010a5bc,%edx
80103cc5:	0f 84 1c 01 00 00    	je     80103de7 <exit+0x147>
80103ccb:	31 db                	xor    %ebx,%ebx
80103ccd:	8d 76 00             	lea    0x0(%esi),%esi
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd]){
80103cd0:	8d 73 08             	lea    0x8(%ebx),%esi
80103cd3:	8b 44 b2 08          	mov    0x8(%edx,%esi,4),%eax
80103cd7:	85 c0                	test   %eax,%eax
80103cd9:	74 1b                	je     80103cf6 <exit+0x56>
      fileclose(proc->ofile[fd]);
80103cdb:	83 ec 0c             	sub    $0xc,%esp
80103cde:	50                   	push   %eax
80103cdf:	e8 8c d1 ff ff       	call   80100e70 <fileclose>
      proc->ofile[fd] = 0;
80103ce4:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103ceb:	83 c4 10             	add    $0x10,%esp
80103cee:	c7 44 b2 08 00 00 00 	movl   $0x0,0x8(%edx,%esi,4)
80103cf5:	00 

  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103cf6:	83 c3 01             	add    $0x1,%ebx
80103cf9:	83 fb 10             	cmp    $0x10,%ebx
80103cfc:	75 d2                	jne    80103cd0 <exit+0x30>
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  begin_op();
80103cfe:	e8 0d ef ff ff       	call   80102c10 <begin_op>
  iput(proc->cwd);
80103d03:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d09:	83 ec 0c             	sub    $0xc,%esp
80103d0c:	ff 70 68             	pushl  0x68(%eax)
80103d0f:	e8 cc da ff ff       	call   801017e0 <iput>
  end_op();
80103d14:	e8 67 ef ff ff       	call   80102c80 <end_op>
  proc->cwd = 0;
80103d19:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d1f:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)

  acquire(&ptable.lock);
80103d26:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103d2d:	e8 8e 05 00 00       	call   801042c0 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103d32:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80103d39:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d3c:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
  proc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103d41:	8b 51 14             	mov    0x14(%ecx),%edx
80103d44:	eb 14                	jmp    80103d5a <exit+0xba>
80103d46:	8d 76 00             	lea    0x0(%esi),%esi
80103d49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d50:	83 c0 7c             	add    $0x7c,%eax
80103d53:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80103d58:	74 1c                	je     80103d76 <exit+0xd6>
    if(p->state == SLEEPING && p->chan == chan)
80103d5a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103d5e:	75 f0                	jne    80103d50 <exit+0xb0>
80103d60:	3b 50 20             	cmp    0x20(%eax),%edx
80103d63:	75 eb                	jne    80103d50 <exit+0xb0>
      p->state = RUNNABLE;
80103d65:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d6c:	83 c0 7c             	add    $0x7c,%eax
80103d6f:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80103d74:	75 e4                	jne    80103d5a <exit+0xba>
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103d76:	8b 1d bc a5 10 80    	mov    0x8010a5bc,%ebx
80103d7c:	ba d4 2d 11 80       	mov    $0x80112dd4,%edx
80103d81:	eb 10                	jmp    80103d93 <exit+0xf3>
80103d83:	90                   	nop
80103d84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103d88:	83 c2 7c             	add    $0x7c,%edx
80103d8b:	81 fa d4 4c 11 80    	cmp    $0x80114cd4,%edx
80103d91:	74 3b                	je     80103dce <exit+0x12e>
    if(p->parent == proc){
80103d93:	3b 4a 14             	cmp    0x14(%edx),%ecx
80103d96:	75 f0                	jne    80103d88 <exit+0xe8>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103d98:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103d9c:	89 5a 14             	mov    %ebx,0x14(%edx)
      if(p->state == ZOMBIE)
80103d9f:	75 e7                	jne    80103d88 <exit+0xe8>
80103da1:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103da6:	eb 12                	jmp    80103dba <exit+0x11a>
80103da8:	90                   	nop
80103da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103db0:	83 c0 7c             	add    $0x7c,%eax
80103db3:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80103db8:	74 ce                	je     80103d88 <exit+0xe8>
    if(p->state == SLEEPING && p->chan == chan)
80103dba:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103dbe:	75 f0                	jne    80103db0 <exit+0x110>
80103dc0:	3b 58 20             	cmp    0x20(%eax),%ebx
80103dc3:	75 eb                	jne    80103db0 <exit+0x110>
      p->state = RUNNABLE;
80103dc5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103dcc:	eb e2                	jmp    80103db0 <exit+0x110>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
80103dce:	c7 41 0c 05 00 00 00 	movl   $0x5,0xc(%ecx)
  sched();
80103dd5:	e8 26 fe ff ff       	call   80103c00 <sched>
  panic("zombie exit");
80103dda:	83 ec 0c             	sub    $0xc,%esp
80103ddd:	68 85 75 10 80       	push   $0x80107585
80103de2:	e8 89 c5 ff ff       	call   80100370 <panic>
  cprintf(" %d\n", status);
  struct proc *p;
  int fd;

  if(proc == initproc)
    panic("init exiting");
80103de7:	83 ec 0c             	sub    $0xc,%esp
80103dea:	68 78 75 10 80       	push   $0x80107578
80103def:	e8 7c c5 ff ff       	call   80100370 <panic>
80103df4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103dfa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103e00 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103e00:	55                   	push   %ebp
80103e01:	89 e5                	mov    %esp,%ebp
80103e03:	83 ec 14             	sub    $0x14,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103e06:	68 a0 2d 11 80       	push   $0x80112da0
80103e0b:	e8 b0 04 00 00       	call   801042c0 <acquire>
  proc->state = RUNNABLE;
80103e10:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e16:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80103e1d:	e8 de fd ff ff       	call   80103c00 <sched>
  release(&ptable.lock);
80103e22:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103e29:	e8 72 06 00 00       	call   801044a0 <release>
}
80103e2e:	83 c4 10             	add    $0x10,%esp
80103e31:	c9                   	leave  
80103e32:	c3                   	ret    
80103e33:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103e40 <sleep>:
// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
80103e40:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103e46:	55                   	push   %ebp
80103e47:	89 e5                	mov    %esp,%ebp
80103e49:	56                   	push   %esi
80103e4a:	53                   	push   %ebx
  if(proc == 0)
80103e4b:	85 c0                	test   %eax,%eax

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103e4d:	8b 75 08             	mov    0x8(%ebp),%esi
80103e50:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(proc == 0)
80103e53:	0f 84 97 00 00 00    	je     80103ef0 <sleep+0xb0>
    panic("sleep");

  if(lk == 0)
80103e59:	85 db                	test   %ebx,%ebx
80103e5b:	0f 84 82 00 00 00    	je     80103ee3 <sleep+0xa3>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103e61:	81 fb a0 2d 11 80    	cmp    $0x80112da0,%ebx
80103e67:	74 57                	je     80103ec0 <sleep+0x80>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103e69:	83 ec 0c             	sub    $0xc,%esp
80103e6c:	68 a0 2d 11 80       	push   $0x80112da0
80103e71:	e8 4a 04 00 00       	call   801042c0 <acquire>
    release(lk);
80103e76:	89 1c 24             	mov    %ebx,(%esp)
80103e79:	e8 22 06 00 00       	call   801044a0 <release>
  }

  // Go to sleep.
  proc->chan = chan;
80103e7e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e84:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103e87:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103e8e:	e8 6d fd ff ff       	call   80103c00 <sched>

  // Tidy up.
  proc->chan = 0;
80103e93:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e99:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103ea0:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103ea7:	e8 f4 05 00 00       	call   801044a0 <release>
    acquire(lk);
80103eac:	89 5d 08             	mov    %ebx,0x8(%ebp)
80103eaf:	83 c4 10             	add    $0x10,%esp
  }
}
80103eb2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103eb5:	5b                   	pop    %ebx
80103eb6:	5e                   	pop    %esi
80103eb7:	5d                   	pop    %ebp
  proc->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103eb8:	e9 03 04 00 00       	jmp    801042c0 <acquire>
80103ebd:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }

  // Go to sleep.
  proc->chan = chan;
80103ec0:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103ec3:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103eca:	e8 31 fd ff ff       	call   80103c00 <sched>

  // Tidy up.
  proc->chan = 0;
80103ecf:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ed5:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103edc:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103edf:	5b                   	pop    %ebx
80103ee0:	5e                   	pop    %esi
80103ee1:	5d                   	pop    %ebp
80103ee2:	c3                   	ret    
{
  if(proc == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103ee3:	83 ec 0c             	sub    $0xc,%esp
80103ee6:	68 97 75 10 80       	push   $0x80107597
80103eeb:	e8 80 c4 ff ff       	call   80100370 <panic>
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
    panic("sleep");
80103ef0:	83 ec 0c             	sub    $0xc,%esp
80103ef3:	68 91 75 10 80       	push   $0x80107591
80103ef8:	e8 73 c4 ff ff       	call   80100370 <panic>
80103efd:	8d 76 00             	lea    0x0(%esi),%esi

80103f00 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(int *status)
{
80103f00:	55                   	push   %ebp
80103f01:	89 e5                	mov    %esp,%ebp
80103f03:	56                   	push   %esi
80103f04:	53                   	push   %ebx
  struct proc *p;
  int havekids, pid;

  acquire(&ptable.lock);
80103f05:	83 ec 0c             	sub    $0xc,%esp
80103f08:	68 a0 2d 11 80       	push   $0x80112da0
80103f0d:	e8 ae 03 00 00       	call   801042c0 <acquire>
80103f12:	83 c4 10             	add    $0x10,%esp
80103f15:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80103f1b:	31 d2                	xor    %edx,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f1d:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
80103f22:	eb 0f                	jmp    80103f33 <wait+0x33>
80103f24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103f28:	83 c3 7c             	add    $0x7c,%ebx
80103f2b:	81 fb d4 4c 11 80    	cmp    $0x80114cd4,%ebx
80103f31:	74 1d                	je     80103f50 <wait+0x50>
      if(p->parent != proc)
80103f33:	3b 43 14             	cmp    0x14(%ebx),%eax
80103f36:	75 f0                	jne    80103f28 <wait+0x28>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80103f38:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103f3c:	74 30                	je     80103f6e <wait+0x6e>

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f3e:	83 c3 7c             	add    $0x7c,%ebx
      if(p->parent != proc)
        continue;
      havekids = 1;
80103f41:	ba 01 00 00 00       	mov    $0x1,%edx

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f46:	81 fb d4 4c 11 80    	cmp    $0x80114cd4,%ebx
80103f4c:	75 e5                	jne    80103f33 <wait+0x33>
80103f4e:	66 90                	xchg   %ax,%ax
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
80103f50:	85 d2                	test   %edx,%edx
80103f52:	74 70                	je     80103fc4 <wait+0xc4>
80103f54:	8b 50 24             	mov    0x24(%eax),%edx
80103f57:	85 d2                	test   %edx,%edx
80103f59:	75 69                	jne    80103fc4 <wait+0xc4>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
80103f5b:	83 ec 08             	sub    $0x8,%esp
80103f5e:	68 a0 2d 11 80       	push   $0x80112da0
80103f63:	50                   	push   %eax
80103f64:	e8 d7 fe ff ff       	call   80103e40 <sleep>
  }
80103f69:	83 c4 10             	add    $0x10,%esp
80103f6c:	eb a7                	jmp    80103f15 <wait+0x15>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80103f6e:	83 ec 0c             	sub    $0xc,%esp
80103f71:	ff 73 08             	pushl  0x8(%ebx)
      if(p->parent != proc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
80103f74:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103f77:	e8 a4 e3 ff ff       	call   80102320 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80103f7c:	59                   	pop    %ecx
80103f7d:	ff 73 04             	pushl  0x4(%ebx)
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80103f80:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103f87:	e8 b4 2d 00 00       	call   80106d40 <freevm>
        p->pid = 0;
80103f8c:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103f93:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103f9a:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103f9e:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103fa5:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103fac:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103fb3:	e8 e8 04 00 00       	call   801044a0 <release>
        return pid;
80103fb8:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103fbb:	8d 65 f8             	lea    -0x8(%ebp),%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
80103fbe:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103fc0:	5b                   	pop    %ebx
80103fc1:	5e                   	pop    %esi
80103fc2:	5d                   	pop    %ebp
80103fc3:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
80103fc4:	83 ec 0c             	sub    $0xc,%esp
80103fc7:	68 a0 2d 11 80       	push   $0x80112da0
80103fcc:	e8 cf 04 00 00       	call   801044a0 <release>
      return -1;
80103fd1:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103fd4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
      return -1;
80103fd7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103fdc:	5b                   	pop    %ebx
80103fdd:	5e                   	pop    %esi
80103fde:	5d                   	pop    %ebp
80103fdf:	c3                   	ret    

80103fe0 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103fe0:	55                   	push   %ebp
80103fe1:	89 e5                	mov    %esp,%ebp
80103fe3:	53                   	push   %ebx
80103fe4:	83 ec 10             	sub    $0x10,%esp
80103fe7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103fea:	68 a0 2d 11 80       	push   $0x80112da0
80103fef:	e8 cc 02 00 00       	call   801042c0 <acquire>
80103ff4:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ff7:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103ffc:	eb 0c                	jmp    8010400a <wakeup+0x2a>
80103ffe:	66 90                	xchg   %ax,%ax
80104000:	83 c0 7c             	add    $0x7c,%eax
80104003:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80104008:	74 1c                	je     80104026 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
8010400a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
8010400e:	75 f0                	jne    80104000 <wakeup+0x20>
80104010:	3b 58 20             	cmp    0x20(%eax),%ebx
80104013:	75 eb                	jne    80104000 <wakeup+0x20>
      p->state = RUNNABLE;
80104015:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010401c:	83 c0 7c             	add    $0x7c,%eax
8010401f:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80104024:	75 e4                	jne    8010400a <wakeup+0x2a>
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80104026:	c7 45 08 a0 2d 11 80 	movl   $0x80112da0,0x8(%ebp)
}
8010402d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104030:	c9                   	leave  
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80104031:	e9 6a 04 00 00       	jmp    801044a0 <release>
80104036:	8d 76 00             	lea    0x0(%esi),%esi
80104039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104040 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80104040:	55                   	push   %ebp
80104041:	89 e5                	mov    %esp,%ebp
80104043:	53                   	push   %ebx
80104044:	83 ec 10             	sub    $0x10,%esp
80104047:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010404a:	68 a0 2d 11 80       	push   $0x80112da0
8010404f:	e8 6c 02 00 00       	call   801042c0 <acquire>
80104054:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104057:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
8010405c:	eb 0c                	jmp    8010406a <kill+0x2a>
8010405e:	66 90                	xchg   %ax,%ax
80104060:	83 c0 7c             	add    $0x7c,%eax
80104063:	3d d4 4c 11 80       	cmp    $0x80114cd4,%eax
80104068:	74 3e                	je     801040a8 <kill+0x68>
    if(p->pid == pid){
8010406a:	39 58 10             	cmp    %ebx,0x10(%eax)
8010406d:	75 f1                	jne    80104060 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
8010406f:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
80104073:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
8010407a:	74 1c                	je     80104098 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
8010407c:	83 ec 0c             	sub    $0xc,%esp
8010407f:	68 a0 2d 11 80       	push   $0x80112da0
80104084:	e8 17 04 00 00       	call   801044a0 <release>
      return 0;
80104089:	83 c4 10             	add    $0x10,%esp
8010408c:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
8010408e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104091:	c9                   	leave  
80104092:	c3                   	ret    
80104093:	90                   	nop
80104094:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
80104098:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
8010409f:	eb db                	jmp    8010407c <kill+0x3c>
801040a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
801040a8:	83 ec 0c             	sub    $0xc,%esp
801040ab:	68 a0 2d 11 80       	push   $0x80112da0
801040b0:	e8 eb 03 00 00       	call   801044a0 <release>
  return -1;
801040b5:	83 c4 10             	add    $0x10,%esp
801040b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801040bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040c0:	c9                   	leave  
801040c1:	c3                   	ret    
801040c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801040c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801040d0 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
801040d0:	55                   	push   %ebp
801040d1:	89 e5                	mov    %esp,%ebp
801040d3:	57                   	push   %edi
801040d4:	56                   	push   %esi
801040d5:	53                   	push   %ebx
801040d6:	8d 75 e8             	lea    -0x18(%ebp),%esi
801040d9:	bb 40 2e 11 80       	mov    $0x80112e40,%ebx
801040de:	83 ec 3c             	sub    $0x3c,%esp
801040e1:	eb 24                	jmp    80104107 <procdump+0x37>
801040e3:	90                   	nop
801040e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
801040e8:	83 ec 0c             	sub    $0xc,%esp
801040eb:	68 e6 74 10 80       	push   $0x801074e6
801040f0:	e8 6b c5 ff ff       	call   80100660 <cprintf>
801040f5:	83 c4 10             	add    $0x10,%esp
801040f8:	83 c3 7c             	add    $0x7c,%ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801040fb:	81 fb 40 4d 11 80    	cmp    $0x80114d40,%ebx
80104101:	0f 84 81 00 00 00    	je     80104188 <procdump+0xb8>
    if(p->state == UNUSED)
80104107:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010410a:	85 c0                	test   %eax,%eax
8010410c:	74 ea                	je     801040f8 <procdump+0x28>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
8010410e:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
80104111:	ba a8 75 10 80       	mov    $0x801075a8,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104116:	77 11                	ja     80104129 <procdump+0x59>
80104118:	8b 14 85 e0 75 10 80 	mov    -0x7fef8a20(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
8010411f:	b8 a8 75 10 80       	mov    $0x801075a8,%eax
80104124:	85 d2                	test   %edx,%edx
80104126:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
80104129:	53                   	push   %ebx
8010412a:	52                   	push   %edx
8010412b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010412e:	68 ac 75 10 80       	push   $0x801075ac
80104133:	e8 28 c5 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
80104138:	83 c4 10             	add    $0x10,%esp
8010413b:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
8010413f:	75 a7                	jne    801040e8 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104141:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104144:	83 ec 08             	sub    $0x8,%esp
80104147:	8d 7d c0             	lea    -0x40(%ebp),%edi
8010414a:	50                   	push   %eax
8010414b:	8b 43 b0             	mov    -0x50(%ebx),%eax
8010414e:	8b 40 0c             	mov    0xc(%eax),%eax
80104151:	83 c0 08             	add    $0x8,%eax
80104154:	50                   	push   %eax
80104155:	e8 36 02 00 00       	call   80104390 <getcallerpcs>
8010415a:	83 c4 10             	add    $0x10,%esp
8010415d:	8d 76 00             	lea    0x0(%esi),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
80104160:	8b 17                	mov    (%edi),%edx
80104162:	85 d2                	test   %edx,%edx
80104164:	74 82                	je     801040e8 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104166:	83 ec 08             	sub    $0x8,%esp
80104169:	83 c7 04             	add    $0x4,%edi
8010416c:	52                   	push   %edx
8010416d:	68 09 70 10 80       	push   $0x80107009
80104172:	e8 e9 c4 ff ff       	call   80100660 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
80104177:	83 c4 10             	add    $0x10,%esp
8010417a:	39 f7                	cmp    %esi,%edi
8010417c:	75 e2                	jne    80104160 <procdump+0x90>
8010417e:	e9 65 ff ff ff       	jmp    801040e8 <procdump+0x18>
80104183:	90                   	nop
80104184:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
80104188:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010418b:	5b                   	pop    %ebx
8010418c:	5e                   	pop    %esi
8010418d:	5f                   	pop    %edi
8010418e:	5d                   	pop    %ebp
8010418f:	c3                   	ret    

80104190 <initsleeplock>:
80104190:	55                   	push   %ebp
80104191:	89 e5                	mov    %esp,%ebp
80104193:	53                   	push   %ebx
80104194:	83 ec 0c             	sub    $0xc,%esp
80104197:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010419a:	68 f8 75 10 80       	push   $0x801075f8
8010419f:	8d 43 04             	lea    0x4(%ebx),%eax
801041a2:	50                   	push   %eax
801041a3:	e8 f8 00 00 00       	call   801042a0 <initlock>
801041a8:	8b 45 0c             	mov    0xc(%ebp),%eax
801041ab:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801041b1:	83 c4 10             	add    $0x10,%esp
801041b4:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
801041bb:	89 43 38             	mov    %eax,0x38(%ebx)
801041be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801041c1:	c9                   	leave  
801041c2:	c3                   	ret    
801041c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801041c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801041d0 <acquiresleep>:
801041d0:	55                   	push   %ebp
801041d1:	89 e5                	mov    %esp,%ebp
801041d3:	56                   	push   %esi
801041d4:	53                   	push   %ebx
801041d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801041d8:	83 ec 0c             	sub    $0xc,%esp
801041db:	8d 73 04             	lea    0x4(%ebx),%esi
801041de:	56                   	push   %esi
801041df:	e8 dc 00 00 00       	call   801042c0 <acquire>
801041e4:	8b 13                	mov    (%ebx),%edx
801041e6:	83 c4 10             	add    $0x10,%esp
801041e9:	85 d2                	test   %edx,%edx
801041eb:	74 16                	je     80104203 <acquiresleep+0x33>
801041ed:	8d 76 00             	lea    0x0(%esi),%esi
801041f0:	83 ec 08             	sub    $0x8,%esp
801041f3:	56                   	push   %esi
801041f4:	53                   	push   %ebx
801041f5:	e8 46 fc ff ff       	call   80103e40 <sleep>
801041fa:	8b 03                	mov    (%ebx),%eax
801041fc:	83 c4 10             	add    $0x10,%esp
801041ff:	85 c0                	test   %eax,%eax
80104201:	75 ed                	jne    801041f0 <acquiresleep+0x20>
80104203:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80104209:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010420f:	8b 40 10             	mov    0x10(%eax),%eax
80104212:	89 43 3c             	mov    %eax,0x3c(%ebx)
80104215:	89 75 08             	mov    %esi,0x8(%ebp)
80104218:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010421b:	5b                   	pop    %ebx
8010421c:	5e                   	pop    %esi
8010421d:	5d                   	pop    %ebp
8010421e:	e9 7d 02 00 00       	jmp    801044a0 <release>
80104223:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104230 <releasesleep>:
80104230:	55                   	push   %ebp
80104231:	89 e5                	mov    %esp,%ebp
80104233:	56                   	push   %esi
80104234:	53                   	push   %ebx
80104235:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104238:	83 ec 0c             	sub    $0xc,%esp
8010423b:	8d 73 04             	lea    0x4(%ebx),%esi
8010423e:	56                   	push   %esi
8010423f:	e8 7c 00 00 00       	call   801042c0 <acquire>
80104244:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010424a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80104251:	89 1c 24             	mov    %ebx,(%esp)
80104254:	e8 87 fd ff ff       	call   80103fe0 <wakeup>
80104259:	89 75 08             	mov    %esi,0x8(%ebp)
8010425c:	83 c4 10             	add    $0x10,%esp
8010425f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104262:	5b                   	pop    %ebx
80104263:	5e                   	pop    %esi
80104264:	5d                   	pop    %ebp
80104265:	e9 36 02 00 00       	jmp    801044a0 <release>
8010426a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104270 <holdingsleep>:
80104270:	55                   	push   %ebp
80104271:	89 e5                	mov    %esp,%ebp
80104273:	56                   	push   %esi
80104274:	53                   	push   %ebx
80104275:	8b 75 08             	mov    0x8(%ebp),%esi
80104278:	83 ec 0c             	sub    $0xc,%esp
8010427b:	8d 5e 04             	lea    0x4(%esi),%ebx
8010427e:	53                   	push   %ebx
8010427f:	e8 3c 00 00 00       	call   801042c0 <acquire>
80104284:	8b 36                	mov    (%esi),%esi
80104286:	89 1c 24             	mov    %ebx,(%esp)
80104289:	e8 12 02 00 00       	call   801044a0 <release>
8010428e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104291:	89 f0                	mov    %esi,%eax
80104293:	5b                   	pop    %ebx
80104294:	5e                   	pop    %esi
80104295:	5d                   	pop    %ebp
80104296:	c3                   	ret    
80104297:	66 90                	xchg   %ax,%ax
80104299:	66 90                	xchg   %ax,%ax
8010429b:	66 90                	xchg   %ax,%ax
8010429d:	66 90                	xchg   %ax,%ax
8010429f:	90                   	nop

801042a0 <initlock>:
801042a0:	55                   	push   %ebp
801042a1:	89 e5                	mov    %esp,%ebp
801042a3:	8b 45 08             	mov    0x8(%ebp),%eax
801042a6:	8b 55 0c             	mov    0xc(%ebp),%edx
801042a9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801042af:	89 50 04             	mov    %edx,0x4(%eax)
801042b2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
801042b9:	5d                   	pop    %ebp
801042ba:	c3                   	ret    
801042bb:	90                   	nop
801042bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801042c0 <acquire>:
801042c0:	55                   	push   %ebp
801042c1:	89 e5                	mov    %esp,%ebp
801042c3:	53                   	push   %ebx
801042c4:	83 ec 04             	sub    $0x4,%esp
801042c7:	9c                   	pushf  
801042c8:	5a                   	pop    %edx
801042c9:	fa                   	cli    
801042ca:	65 8b 0d 00 00 00 00 	mov    %gs:0x0,%ecx
801042d1:	8b 81 ac 00 00 00    	mov    0xac(%ecx),%eax
801042d7:	85 c0                	test   %eax,%eax
801042d9:	75 0c                	jne    801042e7 <acquire+0x27>
801042db:	81 e2 00 02 00 00    	and    $0x200,%edx
801042e1:	89 91 b0 00 00 00    	mov    %edx,0xb0(%ecx)
801042e7:	8b 55 08             	mov    0x8(%ebp),%edx
801042ea:	83 c0 01             	add    $0x1,%eax
801042ed:	89 81 ac 00 00 00    	mov    %eax,0xac(%ecx)
801042f3:	8b 02                	mov    (%edx),%eax
801042f5:	85 c0                	test   %eax,%eax
801042f7:	74 05                	je     801042fe <acquire+0x3e>
801042f9:	39 4a 08             	cmp    %ecx,0x8(%edx)
801042fc:	74 7a                	je     80104378 <acquire+0xb8>
801042fe:	b9 01 00 00 00       	mov    $0x1,%ecx
80104303:	90                   	nop
80104304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104308:	89 c8                	mov    %ecx,%eax
8010430a:	f0 87 02             	lock xchg %eax,(%edx)
8010430d:	85 c0                	test   %eax,%eax
8010430f:	75 f7                	jne    80104308 <acquire+0x48>
80104311:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80104316:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104319:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
8010431f:	89 ea                	mov    %ebp,%edx
80104321:	89 41 08             	mov    %eax,0x8(%ecx)
80104324:	83 c1 0c             	add    $0xc,%ecx
80104327:	31 c0                	xor    %eax,%eax
80104329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104330:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104336:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010433c:	77 1a                	ja     80104358 <acquire+0x98>
8010433e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104341:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
80104344:	83 c0 01             	add    $0x1,%eax
80104347:	8b 12                	mov    (%edx),%edx
80104349:	83 f8 0a             	cmp    $0xa,%eax
8010434c:	75 e2                	jne    80104330 <acquire+0x70>
8010434e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104351:	c9                   	leave  
80104352:	c3                   	ret    
80104353:	90                   	nop
80104354:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104358:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
8010435f:	83 c0 01             	add    $0x1,%eax
80104362:	83 f8 0a             	cmp    $0xa,%eax
80104365:	74 e7                	je     8010434e <acquire+0x8e>
80104367:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
8010436e:	83 c0 01             	add    $0x1,%eax
80104371:	83 f8 0a             	cmp    $0xa,%eax
80104374:	75 e2                	jne    80104358 <acquire+0x98>
80104376:	eb d6                	jmp    8010434e <acquire+0x8e>
80104378:	83 ec 0c             	sub    $0xc,%esp
8010437b:	68 03 76 10 80       	push   $0x80107603
80104380:	e8 eb bf ff ff       	call   80100370 <panic>
80104385:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104390 <getcallerpcs>:
80104390:	55                   	push   %ebp
80104391:	89 e5                	mov    %esp,%ebp
80104393:	53                   	push   %ebx
80104394:	8b 45 08             	mov    0x8(%ebp),%eax
80104397:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010439a:	8d 50 f8             	lea    -0x8(%eax),%edx
8010439d:	31 c0                	xor    %eax,%eax
8010439f:	90                   	nop
801043a0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801043a6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801043ac:	77 1a                	ja     801043c8 <getcallerpcs+0x38>
801043ae:	8b 5a 04             	mov    0x4(%edx),%ebx
801043b1:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
801043b4:	83 c0 01             	add    $0x1,%eax
801043b7:	8b 12                	mov    (%edx),%edx
801043b9:	83 f8 0a             	cmp    $0xa,%eax
801043bc:	75 e2                	jne    801043a0 <getcallerpcs+0x10>
801043be:	5b                   	pop    %ebx
801043bf:	5d                   	pop    %ebp
801043c0:	c3                   	ret    
801043c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801043c8:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
801043cf:	83 c0 01             	add    $0x1,%eax
801043d2:	83 f8 0a             	cmp    $0xa,%eax
801043d5:	74 e7                	je     801043be <getcallerpcs+0x2e>
801043d7:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
801043de:	83 c0 01             	add    $0x1,%eax
801043e1:	83 f8 0a             	cmp    $0xa,%eax
801043e4:	75 e2                	jne    801043c8 <getcallerpcs+0x38>
801043e6:	eb d6                	jmp    801043be <getcallerpcs+0x2e>
801043e8:	90                   	nop
801043e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801043f0 <holding>:
801043f0:	55                   	push   %ebp
801043f1:	89 e5                	mov    %esp,%ebp
801043f3:	8b 55 08             	mov    0x8(%ebp),%edx
801043f6:	8b 02                	mov    (%edx),%eax
801043f8:	85 c0                	test   %eax,%eax
801043fa:	74 14                	je     80104410 <holding+0x20>
801043fc:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104402:	39 42 08             	cmp    %eax,0x8(%edx)
80104405:	5d                   	pop    %ebp
80104406:	0f 94 c0             	sete   %al
80104409:	0f b6 c0             	movzbl %al,%eax
8010440c:	c3                   	ret    
8010440d:	8d 76 00             	lea    0x0(%esi),%esi
80104410:	31 c0                	xor    %eax,%eax
80104412:	5d                   	pop    %ebp
80104413:	c3                   	ret    
80104414:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010441a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104420 <pushcli>:
80104420:	55                   	push   %ebp
80104421:	89 e5                	mov    %esp,%ebp
80104423:	9c                   	pushf  
80104424:	59                   	pop    %ecx
80104425:	fa                   	cli    
80104426:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
8010442d:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
80104433:	85 c0                	test   %eax,%eax
80104435:	75 0c                	jne    80104443 <pushcli+0x23>
80104437:	81 e1 00 02 00 00    	and    $0x200,%ecx
8010443d:	89 8a b0 00 00 00    	mov    %ecx,0xb0(%edx)
80104443:	83 c0 01             	add    $0x1,%eax
80104446:	89 82 ac 00 00 00    	mov    %eax,0xac(%edx)
8010444c:	5d                   	pop    %ebp
8010444d:	c3                   	ret    
8010444e:	66 90                	xchg   %ax,%ax

80104450 <popcli>:
80104450:	55                   	push   %ebp
80104451:	89 e5                	mov    %esp,%ebp
80104453:	83 ec 08             	sub    $0x8,%esp
80104456:	9c                   	pushf  
80104457:	58                   	pop    %eax
80104458:	f6 c4 02             	test   $0x2,%ah
8010445b:	75 2c                	jne    80104489 <popcli+0x39>
8010445d:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104464:	83 aa ac 00 00 00 01 	subl   $0x1,0xac(%edx)
8010446b:	78 0f                	js     8010447c <popcli+0x2c>
8010446d:	75 0b                	jne    8010447a <popcli+0x2a>
8010446f:	8b 82 b0 00 00 00    	mov    0xb0(%edx),%eax
80104475:	85 c0                	test   %eax,%eax
80104477:	74 01                	je     8010447a <popcli+0x2a>
80104479:	fb                   	sti    
8010447a:	c9                   	leave  
8010447b:	c3                   	ret    
8010447c:	83 ec 0c             	sub    $0xc,%esp
8010447f:	68 22 76 10 80       	push   $0x80107622
80104484:	e8 e7 be ff ff       	call   80100370 <panic>
80104489:	83 ec 0c             	sub    $0xc,%esp
8010448c:	68 0b 76 10 80       	push   $0x8010760b
80104491:	e8 da be ff ff       	call   80100370 <panic>
80104496:	8d 76 00             	lea    0x0(%esi),%esi
80104499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801044a0 <release>:
801044a0:	55                   	push   %ebp
801044a1:	89 e5                	mov    %esp,%ebp
801044a3:	83 ec 08             	sub    $0x8,%esp
801044a6:	8b 45 08             	mov    0x8(%ebp),%eax
801044a9:	8b 10                	mov    (%eax),%edx
801044ab:	85 d2                	test   %edx,%edx
801044ad:	74 0c                	je     801044bb <release+0x1b>
801044af:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801044b6:	39 50 08             	cmp    %edx,0x8(%eax)
801044b9:	74 15                	je     801044d0 <release+0x30>
801044bb:	83 ec 0c             	sub    $0xc,%esp
801044be:	68 29 76 10 80       	push   $0x80107629
801044c3:	e8 a8 be ff ff       	call   80100370 <panic>
801044c8:	90                   	nop
801044c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801044d0:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
801044d7:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
801044de:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801044e3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801044e9:	c9                   	leave  
801044ea:	e9 61 ff ff ff       	jmp    80104450 <popcli>
801044ef:	90                   	nop

801044f0 <memset>:
801044f0:	55                   	push   %ebp
801044f1:	89 e5                	mov    %esp,%ebp
801044f3:	57                   	push   %edi
801044f4:	53                   	push   %ebx
801044f5:	8b 55 08             	mov    0x8(%ebp),%edx
801044f8:	8b 4d 10             	mov    0x10(%ebp),%ecx
801044fb:	f6 c2 03             	test   $0x3,%dl
801044fe:	75 05                	jne    80104505 <memset+0x15>
80104500:	f6 c1 03             	test   $0x3,%cl
80104503:	74 13                	je     80104518 <memset+0x28>
80104505:	89 d7                	mov    %edx,%edi
80104507:	8b 45 0c             	mov    0xc(%ebp),%eax
8010450a:	fc                   	cld    
8010450b:	f3 aa                	rep stos %al,%es:(%edi)
8010450d:	5b                   	pop    %ebx
8010450e:	89 d0                	mov    %edx,%eax
80104510:	5f                   	pop    %edi
80104511:	5d                   	pop    %ebp
80104512:	c3                   	ret    
80104513:	90                   	nop
80104514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104518:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
8010451c:	c1 e9 02             	shr    $0x2,%ecx
8010451f:	89 fb                	mov    %edi,%ebx
80104521:	89 f8                	mov    %edi,%eax
80104523:	c1 e3 18             	shl    $0x18,%ebx
80104526:	c1 e0 10             	shl    $0x10,%eax
80104529:	09 d8                	or     %ebx,%eax
8010452b:	09 f8                	or     %edi,%eax
8010452d:	c1 e7 08             	shl    $0x8,%edi
80104530:	09 f8                	or     %edi,%eax
80104532:	89 d7                	mov    %edx,%edi
80104534:	fc                   	cld    
80104535:	f3 ab                	rep stos %eax,%es:(%edi)
80104537:	5b                   	pop    %ebx
80104538:	89 d0                	mov    %edx,%eax
8010453a:	5f                   	pop    %edi
8010453b:	5d                   	pop    %ebp
8010453c:	c3                   	ret    
8010453d:	8d 76 00             	lea    0x0(%esi),%esi

80104540 <memcmp>:
80104540:	55                   	push   %ebp
80104541:	89 e5                	mov    %esp,%ebp
80104543:	57                   	push   %edi
80104544:	56                   	push   %esi
80104545:	8b 45 10             	mov    0x10(%ebp),%eax
80104548:	53                   	push   %ebx
80104549:	8b 75 0c             	mov    0xc(%ebp),%esi
8010454c:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010454f:	85 c0                	test   %eax,%eax
80104551:	74 29                	je     8010457c <memcmp+0x3c>
80104553:	0f b6 13             	movzbl (%ebx),%edx
80104556:	0f b6 0e             	movzbl (%esi),%ecx
80104559:	38 d1                	cmp    %dl,%cl
8010455b:	75 2b                	jne    80104588 <memcmp+0x48>
8010455d:	8d 78 ff             	lea    -0x1(%eax),%edi
80104560:	31 c0                	xor    %eax,%eax
80104562:	eb 14                	jmp    80104578 <memcmp+0x38>
80104564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104568:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
8010456d:	83 c0 01             	add    $0x1,%eax
80104570:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
80104574:	38 ca                	cmp    %cl,%dl
80104576:	75 10                	jne    80104588 <memcmp+0x48>
80104578:	39 f8                	cmp    %edi,%eax
8010457a:	75 ec                	jne    80104568 <memcmp+0x28>
8010457c:	5b                   	pop    %ebx
8010457d:	31 c0                	xor    %eax,%eax
8010457f:	5e                   	pop    %esi
80104580:	5f                   	pop    %edi
80104581:	5d                   	pop    %ebp
80104582:	c3                   	ret    
80104583:	90                   	nop
80104584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104588:	0f b6 c2             	movzbl %dl,%eax
8010458b:	5b                   	pop    %ebx
8010458c:	29 c8                	sub    %ecx,%eax
8010458e:	5e                   	pop    %esi
8010458f:	5f                   	pop    %edi
80104590:	5d                   	pop    %ebp
80104591:	c3                   	ret    
80104592:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045a0 <memmove>:
801045a0:	55                   	push   %ebp
801045a1:	89 e5                	mov    %esp,%ebp
801045a3:	56                   	push   %esi
801045a4:	53                   	push   %ebx
801045a5:	8b 45 08             	mov    0x8(%ebp),%eax
801045a8:	8b 75 0c             	mov    0xc(%ebp),%esi
801045ab:	8b 5d 10             	mov    0x10(%ebp),%ebx
801045ae:	39 c6                	cmp    %eax,%esi
801045b0:	73 2e                	jae    801045e0 <memmove+0x40>
801045b2:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
801045b5:	39 c8                	cmp    %ecx,%eax
801045b7:	73 27                	jae    801045e0 <memmove+0x40>
801045b9:	85 db                	test   %ebx,%ebx
801045bb:	8d 53 ff             	lea    -0x1(%ebx),%edx
801045be:	74 17                	je     801045d7 <memmove+0x37>
801045c0:	29 d9                	sub    %ebx,%ecx
801045c2:	89 cb                	mov    %ecx,%ebx
801045c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045c8:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801045cc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801045cf:	83 ea 01             	sub    $0x1,%edx
801045d2:	83 fa ff             	cmp    $0xffffffff,%edx
801045d5:	75 f1                	jne    801045c8 <memmove+0x28>
801045d7:	5b                   	pop    %ebx
801045d8:	5e                   	pop    %esi
801045d9:	5d                   	pop    %ebp
801045da:	c3                   	ret    
801045db:	90                   	nop
801045dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045e0:	31 d2                	xor    %edx,%edx
801045e2:	85 db                	test   %ebx,%ebx
801045e4:	74 f1                	je     801045d7 <memmove+0x37>
801045e6:	8d 76 00             	lea    0x0(%esi),%esi
801045e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801045f0:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
801045f4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801045f7:	83 c2 01             	add    $0x1,%edx
801045fa:	39 d3                	cmp    %edx,%ebx
801045fc:	75 f2                	jne    801045f0 <memmove+0x50>
801045fe:	5b                   	pop    %ebx
801045ff:	5e                   	pop    %esi
80104600:	5d                   	pop    %ebp
80104601:	c3                   	ret    
80104602:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104610 <memcpy>:
80104610:	55                   	push   %ebp
80104611:	89 e5                	mov    %esp,%ebp
80104613:	5d                   	pop    %ebp
80104614:	eb 8a                	jmp    801045a0 <memmove>
80104616:	8d 76 00             	lea    0x0(%esi),%esi
80104619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104620 <strncmp>:
80104620:	55                   	push   %ebp
80104621:	89 e5                	mov    %esp,%ebp
80104623:	57                   	push   %edi
80104624:	56                   	push   %esi
80104625:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104628:	53                   	push   %ebx
80104629:	8b 7d 08             	mov    0x8(%ebp),%edi
8010462c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010462f:	85 c9                	test   %ecx,%ecx
80104631:	74 37                	je     8010466a <strncmp+0x4a>
80104633:	0f b6 17             	movzbl (%edi),%edx
80104636:	0f b6 1e             	movzbl (%esi),%ebx
80104639:	84 d2                	test   %dl,%dl
8010463b:	74 3f                	je     8010467c <strncmp+0x5c>
8010463d:	38 d3                	cmp    %dl,%bl
8010463f:	75 3b                	jne    8010467c <strncmp+0x5c>
80104641:	8d 47 01             	lea    0x1(%edi),%eax
80104644:	01 cf                	add    %ecx,%edi
80104646:	eb 1b                	jmp    80104663 <strncmp+0x43>
80104648:	90                   	nop
80104649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104650:	0f b6 10             	movzbl (%eax),%edx
80104653:	84 d2                	test   %dl,%dl
80104655:	74 21                	je     80104678 <strncmp+0x58>
80104657:	0f b6 19             	movzbl (%ecx),%ebx
8010465a:	83 c0 01             	add    $0x1,%eax
8010465d:	89 ce                	mov    %ecx,%esi
8010465f:	38 da                	cmp    %bl,%dl
80104661:	75 19                	jne    8010467c <strncmp+0x5c>
80104663:	39 c7                	cmp    %eax,%edi
80104665:	8d 4e 01             	lea    0x1(%esi),%ecx
80104668:	75 e6                	jne    80104650 <strncmp+0x30>
8010466a:	5b                   	pop    %ebx
8010466b:	31 c0                	xor    %eax,%eax
8010466d:	5e                   	pop    %esi
8010466e:	5f                   	pop    %edi
8010466f:	5d                   	pop    %ebp
80104670:	c3                   	ret    
80104671:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104678:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
8010467c:	0f b6 c2             	movzbl %dl,%eax
8010467f:	29 d8                	sub    %ebx,%eax
80104681:	5b                   	pop    %ebx
80104682:	5e                   	pop    %esi
80104683:	5f                   	pop    %edi
80104684:	5d                   	pop    %ebp
80104685:	c3                   	ret    
80104686:	8d 76 00             	lea    0x0(%esi),%esi
80104689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104690 <strncpy>:
80104690:	55                   	push   %ebp
80104691:	89 e5                	mov    %esp,%ebp
80104693:	56                   	push   %esi
80104694:	53                   	push   %ebx
80104695:	8b 45 08             	mov    0x8(%ebp),%eax
80104698:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010469b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010469e:	89 c2                	mov    %eax,%edx
801046a0:	eb 19                	jmp    801046bb <strncpy+0x2b>
801046a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801046a8:	83 c3 01             	add    $0x1,%ebx
801046ab:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
801046af:	83 c2 01             	add    $0x1,%edx
801046b2:	84 c9                	test   %cl,%cl
801046b4:	88 4a ff             	mov    %cl,-0x1(%edx)
801046b7:	74 09                	je     801046c2 <strncpy+0x32>
801046b9:	89 f1                	mov    %esi,%ecx
801046bb:	85 c9                	test   %ecx,%ecx
801046bd:	8d 71 ff             	lea    -0x1(%ecx),%esi
801046c0:	7f e6                	jg     801046a8 <strncpy+0x18>
801046c2:	31 c9                	xor    %ecx,%ecx
801046c4:	85 f6                	test   %esi,%esi
801046c6:	7e 17                	jle    801046df <strncpy+0x4f>
801046c8:	90                   	nop
801046c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046d0:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
801046d4:	89 f3                	mov    %esi,%ebx
801046d6:	83 c1 01             	add    $0x1,%ecx
801046d9:	29 cb                	sub    %ecx,%ebx
801046db:	85 db                	test   %ebx,%ebx
801046dd:	7f f1                	jg     801046d0 <strncpy+0x40>
801046df:	5b                   	pop    %ebx
801046e0:	5e                   	pop    %esi
801046e1:	5d                   	pop    %ebp
801046e2:	c3                   	ret    
801046e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801046e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046f0 <safestrcpy>:
801046f0:	55                   	push   %ebp
801046f1:	89 e5                	mov    %esp,%ebp
801046f3:	56                   	push   %esi
801046f4:	53                   	push   %ebx
801046f5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801046f8:	8b 45 08             	mov    0x8(%ebp),%eax
801046fb:	8b 55 0c             	mov    0xc(%ebp),%edx
801046fe:	85 c9                	test   %ecx,%ecx
80104700:	7e 26                	jle    80104728 <safestrcpy+0x38>
80104702:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104706:	89 c1                	mov    %eax,%ecx
80104708:	eb 17                	jmp    80104721 <safestrcpy+0x31>
8010470a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104710:	83 c2 01             	add    $0x1,%edx
80104713:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104717:	83 c1 01             	add    $0x1,%ecx
8010471a:	84 db                	test   %bl,%bl
8010471c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010471f:	74 04                	je     80104725 <safestrcpy+0x35>
80104721:	39 f2                	cmp    %esi,%edx
80104723:	75 eb                	jne    80104710 <safestrcpy+0x20>
80104725:	c6 01 00             	movb   $0x0,(%ecx)
80104728:	5b                   	pop    %ebx
80104729:	5e                   	pop    %esi
8010472a:	5d                   	pop    %ebp
8010472b:	c3                   	ret    
8010472c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104730 <strlen>:
80104730:	55                   	push   %ebp
80104731:	31 c0                	xor    %eax,%eax
80104733:	89 e5                	mov    %esp,%ebp
80104735:	8b 55 08             	mov    0x8(%ebp),%edx
80104738:	80 3a 00             	cmpb   $0x0,(%edx)
8010473b:	74 0c                	je     80104749 <strlen+0x19>
8010473d:	8d 76 00             	lea    0x0(%esi),%esi
80104740:	83 c0 01             	add    $0x1,%eax
80104743:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104747:	75 f7                	jne    80104740 <strlen+0x10>
80104749:	5d                   	pop    %ebp
8010474a:	c3                   	ret    

8010474b <swtch>:
8010474b:	8b 44 24 04          	mov    0x4(%esp),%eax
8010474f:	8b 54 24 08          	mov    0x8(%esp),%edx
80104753:	55                   	push   %ebp
80104754:	53                   	push   %ebx
80104755:	56                   	push   %esi
80104756:	57                   	push   %edi
80104757:	89 20                	mov    %esp,(%eax)
80104759:	89 d4                	mov    %edx,%esp
8010475b:	5f                   	pop    %edi
8010475c:	5e                   	pop    %esi
8010475d:	5b                   	pop    %ebx
8010475e:	5d                   	pop    %ebp
8010475f:	c3                   	ret    

80104760 <fetchint>:
80104760:	55                   	push   %ebp
80104761:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104768:	89 e5                	mov    %esp,%ebp
8010476a:	8b 45 08             	mov    0x8(%ebp),%eax
8010476d:	8b 12                	mov    (%edx),%edx
8010476f:	39 c2                	cmp    %eax,%edx
80104771:	76 15                	jbe    80104788 <fetchint+0x28>
80104773:	8d 48 04             	lea    0x4(%eax),%ecx
80104776:	39 ca                	cmp    %ecx,%edx
80104778:	72 0e                	jb     80104788 <fetchint+0x28>
8010477a:	8b 10                	mov    (%eax),%edx
8010477c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010477f:	89 10                	mov    %edx,(%eax)
80104781:	31 c0                	xor    %eax,%eax
80104783:	5d                   	pop    %ebp
80104784:	c3                   	ret    
80104785:	8d 76 00             	lea    0x0(%esi),%esi
80104788:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010478d:	5d                   	pop    %ebp
8010478e:	c3                   	ret    
8010478f:	90                   	nop

80104790 <fetchstr>:
80104790:	55                   	push   %ebp
80104791:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104797:	89 e5                	mov    %esp,%ebp
80104799:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010479c:	39 08                	cmp    %ecx,(%eax)
8010479e:	76 2c                	jbe    801047cc <fetchstr+0x3c>
801047a0:	8b 55 0c             	mov    0xc(%ebp),%edx
801047a3:	89 c8                	mov    %ecx,%eax
801047a5:	89 0a                	mov    %ecx,(%edx)
801047a7:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801047ae:	8b 12                	mov    (%edx),%edx
801047b0:	39 d1                	cmp    %edx,%ecx
801047b2:	73 18                	jae    801047cc <fetchstr+0x3c>
801047b4:	80 39 00             	cmpb   $0x0,(%ecx)
801047b7:	75 0c                	jne    801047c5 <fetchstr+0x35>
801047b9:	eb 1d                	jmp    801047d8 <fetchstr+0x48>
801047bb:	90                   	nop
801047bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801047c0:	80 38 00             	cmpb   $0x0,(%eax)
801047c3:	74 13                	je     801047d8 <fetchstr+0x48>
801047c5:	83 c0 01             	add    $0x1,%eax
801047c8:	39 c2                	cmp    %eax,%edx
801047ca:	77 f4                	ja     801047c0 <fetchstr+0x30>
801047cc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801047d1:	5d                   	pop    %ebp
801047d2:	c3                   	ret    
801047d3:	90                   	nop
801047d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801047d8:	29 c8                	sub    %ecx,%eax
801047da:	5d                   	pop    %ebp
801047db:	c3                   	ret    
801047dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801047e0 <argint>:
801047e0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801047e7:	55                   	push   %ebp
801047e8:	89 e5                	mov    %esp,%ebp
801047ea:	8b 42 18             	mov    0x18(%edx),%eax
801047ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
801047f0:	8b 12                	mov    (%edx),%edx
801047f2:	8b 40 44             	mov    0x44(%eax),%eax
801047f5:	8d 04 88             	lea    (%eax,%ecx,4),%eax
801047f8:	8d 48 04             	lea    0x4(%eax),%ecx
801047fb:	39 d1                	cmp    %edx,%ecx
801047fd:	73 19                	jae    80104818 <argint+0x38>
801047ff:	8d 48 08             	lea    0x8(%eax),%ecx
80104802:	39 ca                	cmp    %ecx,%edx
80104804:	72 12                	jb     80104818 <argint+0x38>
80104806:	8b 50 04             	mov    0x4(%eax),%edx
80104809:	8b 45 0c             	mov    0xc(%ebp),%eax
8010480c:	89 10                	mov    %edx,(%eax)
8010480e:	31 c0                	xor    %eax,%eax
80104810:	5d                   	pop    %ebp
80104811:	c3                   	ret    
80104812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104818:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010481d:	5d                   	pop    %ebp
8010481e:	c3                   	ret    
8010481f:	90                   	nop

80104820 <argptr>:
80104820:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104826:	55                   	push   %ebp
80104827:	89 e5                	mov    %esp,%ebp
80104829:	56                   	push   %esi
8010482a:	53                   	push   %ebx
8010482b:	8b 48 18             	mov    0x18(%eax),%ecx
8010482e:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104831:	8b 55 10             	mov    0x10(%ebp),%edx
80104834:	8b 49 44             	mov    0x44(%ecx),%ecx
80104837:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx
8010483a:	8b 08                	mov    (%eax),%ecx
8010483c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104841:	8d 73 04             	lea    0x4(%ebx),%esi
80104844:	39 ce                	cmp    %ecx,%esi
80104846:	73 1f                	jae    80104867 <argptr+0x47>
80104848:	8d 73 08             	lea    0x8(%ebx),%esi
8010484b:	39 f1                	cmp    %esi,%ecx
8010484d:	72 18                	jb     80104867 <argptr+0x47>
8010484f:	85 d2                	test   %edx,%edx
80104851:	8b 5b 04             	mov    0x4(%ebx),%ebx
80104854:	78 11                	js     80104867 <argptr+0x47>
80104856:	39 cb                	cmp    %ecx,%ebx
80104858:	73 0d                	jae    80104867 <argptr+0x47>
8010485a:	01 da                	add    %ebx,%edx
8010485c:	39 ca                	cmp    %ecx,%edx
8010485e:	77 07                	ja     80104867 <argptr+0x47>
80104860:	8b 45 0c             	mov    0xc(%ebp),%eax
80104863:	89 18                	mov    %ebx,(%eax)
80104865:	31 c0                	xor    %eax,%eax
80104867:	5b                   	pop    %ebx
80104868:	5e                   	pop    %esi
80104869:	5d                   	pop    %ebp
8010486a:	c3                   	ret    
8010486b:	90                   	nop
8010486c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104870 <argstr>:
80104870:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104876:	55                   	push   %ebp
80104877:	89 e5                	mov    %esp,%ebp
80104879:	8b 50 18             	mov    0x18(%eax),%edx
8010487c:	8b 4d 08             	mov    0x8(%ebp),%ecx
8010487f:	8b 00                	mov    (%eax),%eax
80104881:	8b 52 44             	mov    0x44(%edx),%edx
80104884:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
80104887:	8d 4a 04             	lea    0x4(%edx),%ecx
8010488a:	39 c1                	cmp    %eax,%ecx
8010488c:	73 07                	jae    80104895 <argstr+0x25>
8010488e:	8d 4a 08             	lea    0x8(%edx),%ecx
80104891:	39 c8                	cmp    %ecx,%eax
80104893:	73 0b                	jae    801048a0 <argstr+0x30>
80104895:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010489a:	5d                   	pop    %ebp
8010489b:	c3                   	ret    
8010489c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801048a0:	8b 4a 04             	mov    0x4(%edx),%ecx
801048a3:	39 c1                	cmp    %eax,%ecx
801048a5:	73 ee                	jae    80104895 <argstr+0x25>
801048a7:	8b 55 0c             	mov    0xc(%ebp),%edx
801048aa:	89 c8                	mov    %ecx,%eax
801048ac:	89 0a                	mov    %ecx,(%edx)
801048ae:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801048b5:	8b 12                	mov    (%edx),%edx
801048b7:	39 d1                	cmp    %edx,%ecx
801048b9:	73 da                	jae    80104895 <argstr+0x25>
801048bb:	80 39 00             	cmpb   $0x0,(%ecx)
801048be:	75 0d                	jne    801048cd <argstr+0x5d>
801048c0:	eb 1e                	jmp    801048e0 <argstr+0x70>
801048c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801048c8:	80 38 00             	cmpb   $0x0,(%eax)
801048cb:	74 13                	je     801048e0 <argstr+0x70>
801048cd:	83 c0 01             	add    $0x1,%eax
801048d0:	39 c2                	cmp    %eax,%edx
801048d2:	77 f4                	ja     801048c8 <argstr+0x58>
801048d4:	eb bf                	jmp    80104895 <argstr+0x25>
801048d6:	8d 76 00             	lea    0x0(%esi),%esi
801048d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801048e0:	29 c8                	sub    %ecx,%eax
801048e2:	5d                   	pop    %ebp
801048e3:	c3                   	ret    
801048e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801048ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801048f0 <syscall>:
801048f0:	55                   	push   %ebp
801048f1:	89 e5                	mov    %esp,%ebp
801048f3:	53                   	push   %ebx
801048f4:	83 ec 04             	sub    $0x4,%esp
801048f7:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801048fe:	8b 5a 18             	mov    0x18(%edx),%ebx
80104901:	8b 43 1c             	mov    0x1c(%ebx),%eax
80104904:	8d 48 ff             	lea    -0x1(%eax),%ecx
80104907:	83 f9 14             	cmp    $0x14,%ecx
8010490a:	77 1c                	ja     80104928 <syscall+0x38>
8010490c:	8b 0c 85 60 76 10 80 	mov    -0x7fef89a0(,%eax,4),%ecx
80104913:	85 c9                	test   %ecx,%ecx
80104915:	74 11                	je     80104928 <syscall+0x38>
80104917:	ff d1                	call   *%ecx
80104919:	89 43 1c             	mov    %eax,0x1c(%ebx)
8010491c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010491f:	c9                   	leave  
80104920:	c3                   	ret    
80104921:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104928:	50                   	push   %eax
80104929:	8d 42 6c             	lea    0x6c(%edx),%eax
8010492c:	50                   	push   %eax
8010492d:	ff 72 10             	pushl  0x10(%edx)
80104930:	68 31 76 10 80       	push   $0x80107631
80104935:	e8 26 bd ff ff       	call   80100660 <cprintf>
8010493a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104940:	83 c4 10             	add    $0x10,%esp
80104943:	8b 40 18             	mov    0x18(%eax),%eax
80104946:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
8010494d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104950:	c9                   	leave  
80104951:	c3                   	ret    
80104952:	66 90                	xchg   %ax,%ax
80104954:	66 90                	xchg   %ax,%ax
80104956:	66 90                	xchg   %ax,%ax
80104958:	66 90                	xchg   %ax,%ax
8010495a:	66 90                	xchg   %ax,%ax
8010495c:	66 90                	xchg   %ax,%ax
8010495e:	66 90                	xchg   %ax,%ax

80104960 <create>:
80104960:	55                   	push   %ebp
80104961:	89 e5                	mov    %esp,%ebp
80104963:	57                   	push   %edi
80104964:	56                   	push   %esi
80104965:	53                   	push   %ebx
80104966:	8d 75 da             	lea    -0x26(%ebp),%esi
80104969:	83 ec 44             	sub    $0x44,%esp
8010496c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
8010496f:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104972:	56                   	push   %esi
80104973:	50                   	push   %eax
80104974:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104977:	89 4d bc             	mov    %ecx,-0x44(%ebp)
8010497a:	e8 81 d5 ff ff       	call   80101f00 <nameiparent>
8010497f:	83 c4 10             	add    $0x10,%esp
80104982:	85 c0                	test   %eax,%eax
80104984:	0f 84 f6 00 00 00    	je     80104a80 <create+0x120>
8010498a:	83 ec 0c             	sub    $0xc,%esp
8010498d:	89 c7                	mov    %eax,%edi
8010498f:	50                   	push   %eax
80104990:	e8 1b cd ff ff       	call   801016b0 <ilock>
80104995:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104998:	83 c4 0c             	add    $0xc,%esp
8010499b:	50                   	push   %eax
8010499c:	56                   	push   %esi
8010499d:	57                   	push   %edi
8010499e:	e8 1d d2 ff ff       	call   80101bc0 <dirlookup>
801049a3:	83 c4 10             	add    $0x10,%esp
801049a6:	85 c0                	test   %eax,%eax
801049a8:	89 c3                	mov    %eax,%ebx
801049aa:	74 54                	je     80104a00 <create+0xa0>
801049ac:	83 ec 0c             	sub    $0xc,%esp
801049af:	57                   	push   %edi
801049b0:	e8 6b cf ff ff       	call   80101920 <iunlockput>
801049b5:	89 1c 24             	mov    %ebx,(%esp)
801049b8:	e8 f3 cc ff ff       	call   801016b0 <ilock>
801049bd:	83 c4 10             	add    $0x10,%esp
801049c0:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
801049c5:	75 19                	jne    801049e0 <create+0x80>
801049c7:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
801049cc:	89 d8                	mov    %ebx,%eax
801049ce:	75 10                	jne    801049e0 <create+0x80>
801049d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801049d3:	5b                   	pop    %ebx
801049d4:	5e                   	pop    %esi
801049d5:	5f                   	pop    %edi
801049d6:	5d                   	pop    %ebp
801049d7:	c3                   	ret    
801049d8:	90                   	nop
801049d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801049e0:	83 ec 0c             	sub    $0xc,%esp
801049e3:	53                   	push   %ebx
801049e4:	e8 37 cf ff ff       	call   80101920 <iunlockput>
801049e9:	83 c4 10             	add    $0x10,%esp
801049ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
801049ef:	31 c0                	xor    %eax,%eax
801049f1:	5b                   	pop    %ebx
801049f2:	5e                   	pop    %esi
801049f3:	5f                   	pop    %edi
801049f4:	5d                   	pop    %ebp
801049f5:	c3                   	ret    
801049f6:	8d 76 00             	lea    0x0(%esi),%esi
801049f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104a00:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104a04:	83 ec 08             	sub    $0x8,%esp
80104a07:	50                   	push   %eax
80104a08:	ff 37                	pushl  (%edi)
80104a0a:	e8 31 cb ff ff       	call   80101540 <ialloc>
80104a0f:	83 c4 10             	add    $0x10,%esp
80104a12:	85 c0                	test   %eax,%eax
80104a14:	89 c3                	mov    %eax,%ebx
80104a16:	0f 84 cc 00 00 00    	je     80104ae8 <create+0x188>
80104a1c:	83 ec 0c             	sub    $0xc,%esp
80104a1f:	50                   	push   %eax
80104a20:	e8 8b cc ff ff       	call   801016b0 <ilock>
80104a25:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104a29:	66 89 43 52          	mov    %ax,0x52(%ebx)
80104a2d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104a31:	66 89 43 54          	mov    %ax,0x54(%ebx)
80104a35:	b8 01 00 00 00       	mov    $0x1,%eax
80104a3a:	66 89 43 56          	mov    %ax,0x56(%ebx)
80104a3e:	89 1c 24             	mov    %ebx,(%esp)
80104a41:	e8 ba cb ff ff       	call   80101600 <iupdate>
80104a46:	83 c4 10             	add    $0x10,%esp
80104a49:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104a4e:	74 40                	je     80104a90 <create+0x130>
80104a50:	83 ec 04             	sub    $0x4,%esp
80104a53:	ff 73 04             	pushl  0x4(%ebx)
80104a56:	56                   	push   %esi
80104a57:	57                   	push   %edi
80104a58:	e8 c3 d3 ff ff       	call   80101e20 <dirlink>
80104a5d:	83 c4 10             	add    $0x10,%esp
80104a60:	85 c0                	test   %eax,%eax
80104a62:	78 77                	js     80104adb <create+0x17b>
80104a64:	83 ec 0c             	sub    $0xc,%esp
80104a67:	57                   	push   %edi
80104a68:	e8 b3 ce ff ff       	call   80101920 <iunlockput>
80104a6d:	83 c4 10             	add    $0x10,%esp
80104a70:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104a73:	89 d8                	mov    %ebx,%eax
80104a75:	5b                   	pop    %ebx
80104a76:	5e                   	pop    %esi
80104a77:	5f                   	pop    %edi
80104a78:	5d                   	pop    %ebp
80104a79:	c3                   	ret    
80104a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a80:	31 c0                	xor    %eax,%eax
80104a82:	e9 49 ff ff ff       	jmp    801049d0 <create+0x70>
80104a87:	89 f6                	mov    %esi,%esi
80104a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104a90:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
80104a95:	83 ec 0c             	sub    $0xc,%esp
80104a98:	57                   	push   %edi
80104a99:	e8 62 cb ff ff       	call   80101600 <iupdate>
80104a9e:	83 c4 0c             	add    $0xc,%esp
80104aa1:	ff 73 04             	pushl  0x4(%ebx)
80104aa4:	68 d4 76 10 80       	push   $0x801076d4
80104aa9:	53                   	push   %ebx
80104aaa:	e8 71 d3 ff ff       	call   80101e20 <dirlink>
80104aaf:	83 c4 10             	add    $0x10,%esp
80104ab2:	85 c0                	test   %eax,%eax
80104ab4:	78 18                	js     80104ace <create+0x16e>
80104ab6:	83 ec 04             	sub    $0x4,%esp
80104ab9:	ff 77 04             	pushl  0x4(%edi)
80104abc:	68 d3 76 10 80       	push   $0x801076d3
80104ac1:	53                   	push   %ebx
80104ac2:	e8 59 d3 ff ff       	call   80101e20 <dirlink>
80104ac7:	83 c4 10             	add    $0x10,%esp
80104aca:	85 c0                	test   %eax,%eax
80104acc:	79 82                	jns    80104a50 <create+0xf0>
80104ace:	83 ec 0c             	sub    $0xc,%esp
80104ad1:	68 c7 76 10 80       	push   $0x801076c7
80104ad6:	e8 95 b8 ff ff       	call   80100370 <panic>
80104adb:	83 ec 0c             	sub    $0xc,%esp
80104ade:	68 d6 76 10 80       	push   $0x801076d6
80104ae3:	e8 88 b8 ff ff       	call   80100370 <panic>
80104ae8:	83 ec 0c             	sub    $0xc,%esp
80104aeb:	68 b8 76 10 80       	push   $0x801076b8
80104af0:	e8 7b b8 ff ff       	call   80100370 <panic>
80104af5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b00 <argfd.constprop.0>:
80104b00:	55                   	push   %ebp
80104b01:	89 e5                	mov    %esp,%ebp
80104b03:	56                   	push   %esi
80104b04:	53                   	push   %ebx
80104b05:	89 c6                	mov    %eax,%esi
80104b07:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b0a:	89 d3                	mov    %edx,%ebx
80104b0c:	83 ec 18             	sub    $0x18,%esp
80104b0f:	50                   	push   %eax
80104b10:	6a 00                	push   $0x0
80104b12:	e8 c9 fc ff ff       	call   801047e0 <argint>
80104b17:	83 c4 10             	add    $0x10,%esp
80104b1a:	85 c0                	test   %eax,%eax
80104b1c:	78 3a                	js     80104b58 <argfd.constprop.0+0x58>
80104b1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104b21:	83 f8 0f             	cmp    $0xf,%eax
80104b24:	77 32                	ja     80104b58 <argfd.constprop.0+0x58>
80104b26:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104b2d:	8b 54 82 28          	mov    0x28(%edx,%eax,4),%edx
80104b31:	85 d2                	test   %edx,%edx
80104b33:	74 23                	je     80104b58 <argfd.constprop.0+0x58>
80104b35:	85 f6                	test   %esi,%esi
80104b37:	74 02                	je     80104b3b <argfd.constprop.0+0x3b>
80104b39:	89 06                	mov    %eax,(%esi)
80104b3b:	85 db                	test   %ebx,%ebx
80104b3d:	74 11                	je     80104b50 <argfd.constprop.0+0x50>
80104b3f:	89 13                	mov    %edx,(%ebx)
80104b41:	31 c0                	xor    %eax,%eax
80104b43:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104b46:	5b                   	pop    %ebx
80104b47:	5e                   	pop    %esi
80104b48:	5d                   	pop    %ebp
80104b49:	c3                   	ret    
80104b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104b50:	31 c0                	xor    %eax,%eax
80104b52:	eb ef                	jmp    80104b43 <argfd.constprop.0+0x43>
80104b54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104b58:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b5d:	eb e4                	jmp    80104b43 <argfd.constprop.0+0x43>
80104b5f:	90                   	nop

80104b60 <sys_dup>:
80104b60:	55                   	push   %ebp
80104b61:	31 c0                	xor    %eax,%eax
80104b63:	89 e5                	mov    %esp,%ebp
80104b65:	53                   	push   %ebx
80104b66:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104b69:	83 ec 14             	sub    $0x14,%esp
80104b6c:	e8 8f ff ff ff       	call   80104b00 <argfd.constprop.0>
80104b71:	85 c0                	test   %eax,%eax
80104b73:	78 1b                	js     80104b90 <sys_dup+0x30>
80104b75:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104b78:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104b7e:	31 db                	xor    %ebx,%ebx
80104b80:	8b 4c 98 28          	mov    0x28(%eax,%ebx,4),%ecx
80104b84:	85 c9                	test   %ecx,%ecx
80104b86:	74 18                	je     80104ba0 <sys_dup+0x40>
80104b88:	83 c3 01             	add    $0x1,%ebx
80104b8b:	83 fb 10             	cmp    $0x10,%ebx
80104b8e:	75 f0                	jne    80104b80 <sys_dup+0x20>
80104b90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b95:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b98:	c9                   	leave  
80104b99:	c3                   	ret    
80104b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104ba0:	83 ec 0c             	sub    $0xc,%esp
80104ba3:	89 54 98 28          	mov    %edx,0x28(%eax,%ebx,4)
80104ba7:	52                   	push   %edx
80104ba8:	e8 73 c2 ff ff       	call   80100e20 <filedup>
80104bad:	89 d8                	mov    %ebx,%eax
80104baf:	83 c4 10             	add    $0x10,%esp
80104bb2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104bb5:	c9                   	leave  
80104bb6:	c3                   	ret    
80104bb7:	89 f6                	mov    %esi,%esi
80104bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104bc0 <sys_read>:
80104bc0:	55                   	push   %ebp
80104bc1:	31 c0                	xor    %eax,%eax
80104bc3:	89 e5                	mov    %esp,%ebp
80104bc5:	83 ec 18             	sub    $0x18,%esp
80104bc8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104bcb:	e8 30 ff ff ff       	call   80104b00 <argfd.constprop.0>
80104bd0:	85 c0                	test   %eax,%eax
80104bd2:	78 4c                	js     80104c20 <sys_read+0x60>
80104bd4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104bd7:	83 ec 08             	sub    $0x8,%esp
80104bda:	50                   	push   %eax
80104bdb:	6a 02                	push   $0x2
80104bdd:	e8 fe fb ff ff       	call   801047e0 <argint>
80104be2:	83 c4 10             	add    $0x10,%esp
80104be5:	85 c0                	test   %eax,%eax
80104be7:	78 37                	js     80104c20 <sys_read+0x60>
80104be9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104bec:	83 ec 04             	sub    $0x4,%esp
80104bef:	ff 75 f0             	pushl  -0x10(%ebp)
80104bf2:	50                   	push   %eax
80104bf3:	6a 01                	push   $0x1
80104bf5:	e8 26 fc ff ff       	call   80104820 <argptr>
80104bfa:	83 c4 10             	add    $0x10,%esp
80104bfd:	85 c0                	test   %eax,%eax
80104bff:	78 1f                	js     80104c20 <sys_read+0x60>
80104c01:	83 ec 04             	sub    $0x4,%esp
80104c04:	ff 75 f0             	pushl  -0x10(%ebp)
80104c07:	ff 75 f4             	pushl  -0xc(%ebp)
80104c0a:	ff 75 ec             	pushl  -0x14(%ebp)
80104c0d:	e8 7e c3 ff ff       	call   80100f90 <fileread>
80104c12:	83 c4 10             	add    $0x10,%esp
80104c15:	c9                   	leave  
80104c16:	c3                   	ret    
80104c17:	89 f6                	mov    %esi,%esi
80104c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104c20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c25:	c9                   	leave  
80104c26:	c3                   	ret    
80104c27:	89 f6                	mov    %esi,%esi
80104c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c30 <sys_write>:
80104c30:	55                   	push   %ebp
80104c31:	31 c0                	xor    %eax,%eax
80104c33:	89 e5                	mov    %esp,%ebp
80104c35:	83 ec 18             	sub    $0x18,%esp
80104c38:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104c3b:	e8 c0 fe ff ff       	call   80104b00 <argfd.constprop.0>
80104c40:	85 c0                	test   %eax,%eax
80104c42:	78 4c                	js     80104c90 <sys_write+0x60>
80104c44:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c47:	83 ec 08             	sub    $0x8,%esp
80104c4a:	50                   	push   %eax
80104c4b:	6a 02                	push   $0x2
80104c4d:	e8 8e fb ff ff       	call   801047e0 <argint>
80104c52:	83 c4 10             	add    $0x10,%esp
80104c55:	85 c0                	test   %eax,%eax
80104c57:	78 37                	js     80104c90 <sys_write+0x60>
80104c59:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c5c:	83 ec 04             	sub    $0x4,%esp
80104c5f:	ff 75 f0             	pushl  -0x10(%ebp)
80104c62:	50                   	push   %eax
80104c63:	6a 01                	push   $0x1
80104c65:	e8 b6 fb ff ff       	call   80104820 <argptr>
80104c6a:	83 c4 10             	add    $0x10,%esp
80104c6d:	85 c0                	test   %eax,%eax
80104c6f:	78 1f                	js     80104c90 <sys_write+0x60>
80104c71:	83 ec 04             	sub    $0x4,%esp
80104c74:	ff 75 f0             	pushl  -0x10(%ebp)
80104c77:	ff 75 f4             	pushl  -0xc(%ebp)
80104c7a:	ff 75 ec             	pushl  -0x14(%ebp)
80104c7d:	e8 9e c3 ff ff       	call   80101020 <filewrite>
80104c82:	83 c4 10             	add    $0x10,%esp
80104c85:	c9                   	leave  
80104c86:	c3                   	ret    
80104c87:	89 f6                	mov    %esi,%esi
80104c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104c90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c95:	c9                   	leave  
80104c96:	c3                   	ret    
80104c97:	89 f6                	mov    %esi,%esi
80104c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ca0 <sys_close>:
80104ca0:	55                   	push   %ebp
80104ca1:	89 e5                	mov    %esp,%ebp
80104ca3:	83 ec 18             	sub    $0x18,%esp
80104ca6:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104ca9:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104cac:	e8 4f fe ff ff       	call   80104b00 <argfd.constprop.0>
80104cb1:	85 c0                	test   %eax,%eax
80104cb3:	78 2b                	js     80104ce0 <sys_close+0x40>
80104cb5:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104cb8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104cbe:	83 ec 0c             	sub    $0xc,%esp
80104cc1:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104cc8:	00 
80104cc9:	ff 75 f4             	pushl  -0xc(%ebp)
80104ccc:	e8 9f c1 ff ff       	call   80100e70 <fileclose>
80104cd1:	83 c4 10             	add    $0x10,%esp
80104cd4:	31 c0                	xor    %eax,%eax
80104cd6:	c9                   	leave  
80104cd7:	c3                   	ret    
80104cd8:	90                   	nop
80104cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104ce0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ce5:	c9                   	leave  
80104ce6:	c3                   	ret    
80104ce7:	89 f6                	mov    %esi,%esi
80104ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cf0 <sys_fstat>:
80104cf0:	55                   	push   %ebp
80104cf1:	31 c0                	xor    %eax,%eax
80104cf3:	89 e5                	mov    %esp,%ebp
80104cf5:	83 ec 18             	sub    $0x18,%esp
80104cf8:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104cfb:	e8 00 fe ff ff       	call   80104b00 <argfd.constprop.0>
80104d00:	85 c0                	test   %eax,%eax
80104d02:	78 2c                	js     80104d30 <sys_fstat+0x40>
80104d04:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d07:	83 ec 04             	sub    $0x4,%esp
80104d0a:	6a 14                	push   $0x14
80104d0c:	50                   	push   %eax
80104d0d:	6a 01                	push   $0x1
80104d0f:	e8 0c fb ff ff       	call   80104820 <argptr>
80104d14:	83 c4 10             	add    $0x10,%esp
80104d17:	85 c0                	test   %eax,%eax
80104d19:	78 15                	js     80104d30 <sys_fstat+0x40>
80104d1b:	83 ec 08             	sub    $0x8,%esp
80104d1e:	ff 75 f4             	pushl  -0xc(%ebp)
80104d21:	ff 75 f0             	pushl  -0x10(%ebp)
80104d24:	e8 17 c2 ff ff       	call   80100f40 <filestat>
80104d29:	83 c4 10             	add    $0x10,%esp
80104d2c:	c9                   	leave  
80104d2d:	c3                   	ret    
80104d2e:	66 90                	xchg   %ax,%ax
80104d30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d35:	c9                   	leave  
80104d36:	c3                   	ret    
80104d37:	89 f6                	mov    %esi,%esi
80104d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d40 <sys_link>:
80104d40:	55                   	push   %ebp
80104d41:	89 e5                	mov    %esp,%ebp
80104d43:	57                   	push   %edi
80104d44:	56                   	push   %esi
80104d45:	53                   	push   %ebx
80104d46:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104d49:	83 ec 34             	sub    $0x34,%esp
80104d4c:	50                   	push   %eax
80104d4d:	6a 00                	push   $0x0
80104d4f:	e8 1c fb ff ff       	call   80104870 <argstr>
80104d54:	83 c4 10             	add    $0x10,%esp
80104d57:	85 c0                	test   %eax,%eax
80104d59:	0f 88 fb 00 00 00    	js     80104e5a <sys_link+0x11a>
80104d5f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104d62:	83 ec 08             	sub    $0x8,%esp
80104d65:	50                   	push   %eax
80104d66:	6a 01                	push   $0x1
80104d68:	e8 03 fb ff ff       	call   80104870 <argstr>
80104d6d:	83 c4 10             	add    $0x10,%esp
80104d70:	85 c0                	test   %eax,%eax
80104d72:	0f 88 e2 00 00 00    	js     80104e5a <sys_link+0x11a>
80104d78:	e8 93 de ff ff       	call   80102c10 <begin_op>
80104d7d:	83 ec 0c             	sub    $0xc,%esp
80104d80:	ff 75 d4             	pushl  -0x2c(%ebp)
80104d83:	e8 58 d1 ff ff       	call   80101ee0 <namei>
80104d88:	83 c4 10             	add    $0x10,%esp
80104d8b:	85 c0                	test   %eax,%eax
80104d8d:	89 c3                	mov    %eax,%ebx
80104d8f:	0f 84 f3 00 00 00    	je     80104e88 <sys_link+0x148>
80104d95:	83 ec 0c             	sub    $0xc,%esp
80104d98:	50                   	push   %eax
80104d99:	e8 12 c9 ff ff       	call   801016b0 <ilock>
80104d9e:	83 c4 10             	add    $0x10,%esp
80104da1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104da6:	0f 84 c4 00 00 00    	je     80104e70 <sys_link+0x130>
80104dac:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104db1:	83 ec 0c             	sub    $0xc,%esp
80104db4:	8d 7d da             	lea    -0x26(%ebp),%edi
80104db7:	53                   	push   %ebx
80104db8:	e8 43 c8 ff ff       	call   80101600 <iupdate>
80104dbd:	89 1c 24             	mov    %ebx,(%esp)
80104dc0:	e8 cb c9 ff ff       	call   80101790 <iunlock>
80104dc5:	58                   	pop    %eax
80104dc6:	5a                   	pop    %edx
80104dc7:	57                   	push   %edi
80104dc8:	ff 75 d0             	pushl  -0x30(%ebp)
80104dcb:	e8 30 d1 ff ff       	call   80101f00 <nameiparent>
80104dd0:	83 c4 10             	add    $0x10,%esp
80104dd3:	85 c0                	test   %eax,%eax
80104dd5:	89 c6                	mov    %eax,%esi
80104dd7:	74 5b                	je     80104e34 <sys_link+0xf4>
80104dd9:	83 ec 0c             	sub    $0xc,%esp
80104ddc:	50                   	push   %eax
80104ddd:	e8 ce c8 ff ff       	call   801016b0 <ilock>
80104de2:	83 c4 10             	add    $0x10,%esp
80104de5:	8b 03                	mov    (%ebx),%eax
80104de7:	39 06                	cmp    %eax,(%esi)
80104de9:	75 3d                	jne    80104e28 <sys_link+0xe8>
80104deb:	83 ec 04             	sub    $0x4,%esp
80104dee:	ff 73 04             	pushl  0x4(%ebx)
80104df1:	57                   	push   %edi
80104df2:	56                   	push   %esi
80104df3:	e8 28 d0 ff ff       	call   80101e20 <dirlink>
80104df8:	83 c4 10             	add    $0x10,%esp
80104dfb:	85 c0                	test   %eax,%eax
80104dfd:	78 29                	js     80104e28 <sys_link+0xe8>
80104dff:	83 ec 0c             	sub    $0xc,%esp
80104e02:	56                   	push   %esi
80104e03:	e8 18 cb ff ff       	call   80101920 <iunlockput>
80104e08:	89 1c 24             	mov    %ebx,(%esp)
80104e0b:	e8 d0 c9 ff ff       	call   801017e0 <iput>
80104e10:	e8 6b de ff ff       	call   80102c80 <end_op>
80104e15:	83 c4 10             	add    $0x10,%esp
80104e18:	31 c0                	xor    %eax,%eax
80104e1a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e1d:	5b                   	pop    %ebx
80104e1e:	5e                   	pop    %esi
80104e1f:	5f                   	pop    %edi
80104e20:	5d                   	pop    %ebp
80104e21:	c3                   	ret    
80104e22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104e28:	83 ec 0c             	sub    $0xc,%esp
80104e2b:	56                   	push   %esi
80104e2c:	e8 ef ca ff ff       	call   80101920 <iunlockput>
80104e31:	83 c4 10             	add    $0x10,%esp
80104e34:	83 ec 0c             	sub    $0xc,%esp
80104e37:	53                   	push   %ebx
80104e38:	e8 73 c8 ff ff       	call   801016b0 <ilock>
80104e3d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104e42:	89 1c 24             	mov    %ebx,(%esp)
80104e45:	e8 b6 c7 ff ff       	call   80101600 <iupdate>
80104e4a:	89 1c 24             	mov    %ebx,(%esp)
80104e4d:	e8 ce ca ff ff       	call   80101920 <iunlockput>
80104e52:	e8 29 de ff ff       	call   80102c80 <end_op>
80104e57:	83 c4 10             	add    $0x10,%esp
80104e5a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104e5d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e62:	5b                   	pop    %ebx
80104e63:	5e                   	pop    %esi
80104e64:	5f                   	pop    %edi
80104e65:	5d                   	pop    %ebp
80104e66:	c3                   	ret    
80104e67:	89 f6                	mov    %esi,%esi
80104e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104e70:	83 ec 0c             	sub    $0xc,%esp
80104e73:	53                   	push   %ebx
80104e74:	e8 a7 ca ff ff       	call   80101920 <iunlockput>
80104e79:	e8 02 de ff ff       	call   80102c80 <end_op>
80104e7e:	83 c4 10             	add    $0x10,%esp
80104e81:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e86:	eb 92                	jmp    80104e1a <sys_link+0xda>
80104e88:	e8 f3 dd ff ff       	call   80102c80 <end_op>
80104e8d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e92:	eb 86                	jmp    80104e1a <sys_link+0xda>
80104e94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104e9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104ea0 <sys_unlink>:
80104ea0:	55                   	push   %ebp
80104ea1:	89 e5                	mov    %esp,%ebp
80104ea3:	57                   	push   %edi
80104ea4:	56                   	push   %esi
80104ea5:	53                   	push   %ebx
80104ea6:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104ea9:	83 ec 54             	sub    $0x54,%esp
80104eac:	50                   	push   %eax
80104ead:	6a 00                	push   $0x0
80104eaf:	e8 bc f9 ff ff       	call   80104870 <argstr>
80104eb4:	83 c4 10             	add    $0x10,%esp
80104eb7:	85 c0                	test   %eax,%eax
80104eb9:	0f 88 82 01 00 00    	js     80105041 <sys_unlink+0x1a1>
80104ebf:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80104ec2:	e8 49 dd ff ff       	call   80102c10 <begin_op>
80104ec7:	83 ec 08             	sub    $0x8,%esp
80104eca:	53                   	push   %ebx
80104ecb:	ff 75 c0             	pushl  -0x40(%ebp)
80104ece:	e8 2d d0 ff ff       	call   80101f00 <nameiparent>
80104ed3:	83 c4 10             	add    $0x10,%esp
80104ed6:	85 c0                	test   %eax,%eax
80104ed8:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104edb:	0f 84 6a 01 00 00    	je     8010504b <sys_unlink+0x1ab>
80104ee1:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104ee4:	83 ec 0c             	sub    $0xc,%esp
80104ee7:	56                   	push   %esi
80104ee8:	e8 c3 c7 ff ff       	call   801016b0 <ilock>
80104eed:	58                   	pop    %eax
80104eee:	5a                   	pop    %edx
80104eef:	68 d4 76 10 80       	push   $0x801076d4
80104ef4:	53                   	push   %ebx
80104ef5:	e8 a6 cc ff ff       	call   80101ba0 <namecmp>
80104efa:	83 c4 10             	add    $0x10,%esp
80104efd:	85 c0                	test   %eax,%eax
80104eff:	0f 84 fc 00 00 00    	je     80105001 <sys_unlink+0x161>
80104f05:	83 ec 08             	sub    $0x8,%esp
80104f08:	68 d3 76 10 80       	push   $0x801076d3
80104f0d:	53                   	push   %ebx
80104f0e:	e8 8d cc ff ff       	call   80101ba0 <namecmp>
80104f13:	83 c4 10             	add    $0x10,%esp
80104f16:	85 c0                	test   %eax,%eax
80104f18:	0f 84 e3 00 00 00    	je     80105001 <sys_unlink+0x161>
80104f1e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104f21:	83 ec 04             	sub    $0x4,%esp
80104f24:	50                   	push   %eax
80104f25:	53                   	push   %ebx
80104f26:	56                   	push   %esi
80104f27:	e8 94 cc ff ff       	call   80101bc0 <dirlookup>
80104f2c:	83 c4 10             	add    $0x10,%esp
80104f2f:	85 c0                	test   %eax,%eax
80104f31:	89 c3                	mov    %eax,%ebx
80104f33:	0f 84 c8 00 00 00    	je     80105001 <sys_unlink+0x161>
80104f39:	83 ec 0c             	sub    $0xc,%esp
80104f3c:	50                   	push   %eax
80104f3d:	e8 6e c7 ff ff       	call   801016b0 <ilock>
80104f42:	83 c4 10             	add    $0x10,%esp
80104f45:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104f4a:	0f 8e 24 01 00 00    	jle    80105074 <sys_unlink+0x1d4>
80104f50:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f55:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104f58:	74 66                	je     80104fc0 <sys_unlink+0x120>
80104f5a:	83 ec 04             	sub    $0x4,%esp
80104f5d:	6a 10                	push   $0x10
80104f5f:	6a 00                	push   $0x0
80104f61:	56                   	push   %esi
80104f62:	e8 89 f5 ff ff       	call   801044f0 <memset>
80104f67:	6a 10                	push   $0x10
80104f69:	ff 75 c4             	pushl  -0x3c(%ebp)
80104f6c:	56                   	push   %esi
80104f6d:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f70:	e8 fb ca ff ff       	call   80101a70 <writei>
80104f75:	83 c4 20             	add    $0x20,%esp
80104f78:	83 f8 10             	cmp    $0x10,%eax
80104f7b:	0f 85 e6 00 00 00    	jne    80105067 <sys_unlink+0x1c7>
80104f81:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f86:	0f 84 9c 00 00 00    	je     80105028 <sys_unlink+0x188>
80104f8c:	83 ec 0c             	sub    $0xc,%esp
80104f8f:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f92:	e8 89 c9 ff ff       	call   80101920 <iunlockput>
80104f97:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104f9c:	89 1c 24             	mov    %ebx,(%esp)
80104f9f:	e8 5c c6 ff ff       	call   80101600 <iupdate>
80104fa4:	89 1c 24             	mov    %ebx,(%esp)
80104fa7:	e8 74 c9 ff ff       	call   80101920 <iunlockput>
80104fac:	e8 cf dc ff ff       	call   80102c80 <end_op>
80104fb1:	83 c4 10             	add    $0x10,%esp
80104fb4:	31 c0                	xor    %eax,%eax
80104fb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104fb9:	5b                   	pop    %ebx
80104fba:	5e                   	pop    %esi
80104fbb:	5f                   	pop    %edi
80104fbc:	5d                   	pop    %ebp
80104fbd:	c3                   	ret    
80104fbe:	66 90                	xchg   %ax,%ax
80104fc0:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104fc4:	76 94                	jbe    80104f5a <sys_unlink+0xba>
80104fc6:	bf 20 00 00 00       	mov    $0x20,%edi
80104fcb:	eb 0f                	jmp    80104fdc <sys_unlink+0x13c>
80104fcd:	8d 76 00             	lea    0x0(%esi),%esi
80104fd0:	83 c7 10             	add    $0x10,%edi
80104fd3:	3b 7b 58             	cmp    0x58(%ebx),%edi
80104fd6:	0f 83 7e ff ff ff    	jae    80104f5a <sys_unlink+0xba>
80104fdc:	6a 10                	push   $0x10
80104fde:	57                   	push   %edi
80104fdf:	56                   	push   %esi
80104fe0:	53                   	push   %ebx
80104fe1:	e8 8a c9 ff ff       	call   80101970 <readi>
80104fe6:	83 c4 10             	add    $0x10,%esp
80104fe9:	83 f8 10             	cmp    $0x10,%eax
80104fec:	75 6c                	jne    8010505a <sys_unlink+0x1ba>
80104fee:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104ff3:	74 db                	je     80104fd0 <sys_unlink+0x130>
80104ff5:	83 ec 0c             	sub    $0xc,%esp
80104ff8:	53                   	push   %ebx
80104ff9:	e8 22 c9 ff ff       	call   80101920 <iunlockput>
80104ffe:	83 c4 10             	add    $0x10,%esp
80105001:	83 ec 0c             	sub    $0xc,%esp
80105004:	ff 75 b4             	pushl  -0x4c(%ebp)
80105007:	e8 14 c9 ff ff       	call   80101920 <iunlockput>
8010500c:	e8 6f dc ff ff       	call   80102c80 <end_op>
80105011:	83 c4 10             	add    $0x10,%esp
80105014:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105017:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010501c:	5b                   	pop    %ebx
8010501d:	5e                   	pop    %esi
8010501e:	5f                   	pop    %edi
8010501f:	5d                   	pop    %ebp
80105020:	c3                   	ret    
80105021:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105028:	8b 45 b4             	mov    -0x4c(%ebp),%eax
8010502b:	83 ec 0c             	sub    $0xc,%esp
8010502e:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
80105033:	50                   	push   %eax
80105034:	e8 c7 c5 ff ff       	call   80101600 <iupdate>
80105039:	83 c4 10             	add    $0x10,%esp
8010503c:	e9 4b ff ff ff       	jmp    80104f8c <sys_unlink+0xec>
80105041:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105046:	e9 6b ff ff ff       	jmp    80104fb6 <sys_unlink+0x116>
8010504b:	e8 30 dc ff ff       	call   80102c80 <end_op>
80105050:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105055:	e9 5c ff ff ff       	jmp    80104fb6 <sys_unlink+0x116>
8010505a:	83 ec 0c             	sub    $0xc,%esp
8010505d:	68 f8 76 10 80       	push   $0x801076f8
80105062:	e8 09 b3 ff ff       	call   80100370 <panic>
80105067:	83 ec 0c             	sub    $0xc,%esp
8010506a:	68 0a 77 10 80       	push   $0x8010770a
8010506f:	e8 fc b2 ff ff       	call   80100370 <panic>
80105074:	83 ec 0c             	sub    $0xc,%esp
80105077:	68 e6 76 10 80       	push   $0x801076e6
8010507c:	e8 ef b2 ff ff       	call   80100370 <panic>
80105081:	eb 0d                	jmp    80105090 <sys_open>
80105083:	90                   	nop
80105084:	90                   	nop
80105085:	90                   	nop
80105086:	90                   	nop
80105087:	90                   	nop
80105088:	90                   	nop
80105089:	90                   	nop
8010508a:	90                   	nop
8010508b:	90                   	nop
8010508c:	90                   	nop
8010508d:	90                   	nop
8010508e:	90                   	nop
8010508f:	90                   	nop

80105090 <sys_open>:
80105090:	55                   	push   %ebp
80105091:	89 e5                	mov    %esp,%ebp
80105093:	57                   	push   %edi
80105094:	56                   	push   %esi
80105095:	53                   	push   %ebx
80105096:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105099:	83 ec 24             	sub    $0x24,%esp
8010509c:	50                   	push   %eax
8010509d:	6a 00                	push   $0x0
8010509f:	e8 cc f7 ff ff       	call   80104870 <argstr>
801050a4:	83 c4 10             	add    $0x10,%esp
801050a7:	85 c0                	test   %eax,%eax
801050a9:	0f 88 9e 00 00 00    	js     8010514d <sys_open+0xbd>
801050af:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801050b2:	83 ec 08             	sub    $0x8,%esp
801050b5:	50                   	push   %eax
801050b6:	6a 01                	push   $0x1
801050b8:	e8 23 f7 ff ff       	call   801047e0 <argint>
801050bd:	83 c4 10             	add    $0x10,%esp
801050c0:	85 c0                	test   %eax,%eax
801050c2:	0f 88 85 00 00 00    	js     8010514d <sys_open+0xbd>
801050c8:	e8 43 db ff ff       	call   80102c10 <begin_op>
801050cd:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
801050d1:	0f 85 89 00 00 00    	jne    80105160 <sys_open+0xd0>
801050d7:	83 ec 0c             	sub    $0xc,%esp
801050da:	ff 75 e0             	pushl  -0x20(%ebp)
801050dd:	e8 fe cd ff ff       	call   80101ee0 <namei>
801050e2:	83 c4 10             	add    $0x10,%esp
801050e5:	85 c0                	test   %eax,%eax
801050e7:	89 c7                	mov    %eax,%edi
801050e9:	0f 84 8e 00 00 00    	je     8010517d <sys_open+0xed>
801050ef:	83 ec 0c             	sub    $0xc,%esp
801050f2:	50                   	push   %eax
801050f3:	e8 b8 c5 ff ff       	call   801016b0 <ilock>
801050f8:	83 c4 10             	add    $0x10,%esp
801050fb:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
80105100:	0f 84 d2 00 00 00    	je     801051d8 <sys_open+0x148>
80105106:	e8 a5 bc ff ff       	call   80100db0 <filealloc>
8010510b:	85 c0                	test   %eax,%eax
8010510d:	89 c6                	mov    %eax,%esi
8010510f:	74 2b                	je     8010513c <sys_open+0xac>
80105111:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80105118:	31 db                	xor    %ebx,%ebx
8010511a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105120:	8b 44 9a 28          	mov    0x28(%edx,%ebx,4),%eax
80105124:	85 c0                	test   %eax,%eax
80105126:	74 68                	je     80105190 <sys_open+0x100>
80105128:	83 c3 01             	add    $0x1,%ebx
8010512b:	83 fb 10             	cmp    $0x10,%ebx
8010512e:	75 f0                	jne    80105120 <sys_open+0x90>
80105130:	83 ec 0c             	sub    $0xc,%esp
80105133:	56                   	push   %esi
80105134:	e8 37 bd ff ff       	call   80100e70 <fileclose>
80105139:	83 c4 10             	add    $0x10,%esp
8010513c:	83 ec 0c             	sub    $0xc,%esp
8010513f:	57                   	push   %edi
80105140:	e8 db c7 ff ff       	call   80101920 <iunlockput>
80105145:	e8 36 db ff ff       	call   80102c80 <end_op>
8010514a:	83 c4 10             	add    $0x10,%esp
8010514d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105150:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105155:	5b                   	pop    %ebx
80105156:	5e                   	pop    %esi
80105157:	5f                   	pop    %edi
80105158:	5d                   	pop    %ebp
80105159:	c3                   	ret    
8010515a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105160:	83 ec 0c             	sub    $0xc,%esp
80105163:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105166:	31 c9                	xor    %ecx,%ecx
80105168:	6a 00                	push   $0x0
8010516a:	ba 02 00 00 00       	mov    $0x2,%edx
8010516f:	e8 ec f7 ff ff       	call   80104960 <create>
80105174:	83 c4 10             	add    $0x10,%esp
80105177:	85 c0                	test   %eax,%eax
80105179:	89 c7                	mov    %eax,%edi
8010517b:	75 89                	jne    80105106 <sys_open+0x76>
8010517d:	e8 fe da ff ff       	call   80102c80 <end_op>
80105182:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105187:	eb 43                	jmp    801051cc <sys_open+0x13c>
80105189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105190:	83 ec 0c             	sub    $0xc,%esp
80105193:	89 74 9a 28          	mov    %esi,0x28(%edx,%ebx,4)
80105197:	57                   	push   %edi
80105198:	e8 f3 c5 ff ff       	call   80101790 <iunlock>
8010519d:	e8 de da ff ff       	call   80102c80 <end_op>
801051a2:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
801051a8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801051ab:	83 c4 10             	add    $0x10,%esp
801051ae:	89 7e 10             	mov    %edi,0x10(%esi)
801051b1:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
801051b8:	89 d0                	mov    %edx,%eax
801051ba:	83 e0 01             	and    $0x1,%eax
801051bd:	83 f0 01             	xor    $0x1,%eax
801051c0:	83 e2 03             	and    $0x3,%edx
801051c3:	88 46 08             	mov    %al,0x8(%esi)
801051c6:	0f 95 46 09          	setne  0x9(%esi)
801051ca:	89 d8                	mov    %ebx,%eax
801051cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801051cf:	5b                   	pop    %ebx
801051d0:	5e                   	pop    %esi
801051d1:	5f                   	pop    %edi
801051d2:	5d                   	pop    %ebp
801051d3:	c3                   	ret    
801051d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801051d8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801051db:	85 d2                	test   %edx,%edx
801051dd:	0f 84 23 ff ff ff    	je     80105106 <sys_open+0x76>
801051e3:	e9 54 ff ff ff       	jmp    8010513c <sys_open+0xac>
801051e8:	90                   	nop
801051e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801051f0 <sys_mkdir>:
801051f0:	55                   	push   %ebp
801051f1:	89 e5                	mov    %esp,%ebp
801051f3:	83 ec 18             	sub    $0x18,%esp
801051f6:	e8 15 da ff ff       	call   80102c10 <begin_op>
801051fb:	8d 45 f4             	lea    -0xc(%ebp),%eax
801051fe:	83 ec 08             	sub    $0x8,%esp
80105201:	50                   	push   %eax
80105202:	6a 00                	push   $0x0
80105204:	e8 67 f6 ff ff       	call   80104870 <argstr>
80105209:	83 c4 10             	add    $0x10,%esp
8010520c:	85 c0                	test   %eax,%eax
8010520e:	78 30                	js     80105240 <sys_mkdir+0x50>
80105210:	83 ec 0c             	sub    $0xc,%esp
80105213:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105216:	31 c9                	xor    %ecx,%ecx
80105218:	6a 00                	push   $0x0
8010521a:	ba 01 00 00 00       	mov    $0x1,%edx
8010521f:	e8 3c f7 ff ff       	call   80104960 <create>
80105224:	83 c4 10             	add    $0x10,%esp
80105227:	85 c0                	test   %eax,%eax
80105229:	74 15                	je     80105240 <sys_mkdir+0x50>
8010522b:	83 ec 0c             	sub    $0xc,%esp
8010522e:	50                   	push   %eax
8010522f:	e8 ec c6 ff ff       	call   80101920 <iunlockput>
80105234:	e8 47 da ff ff       	call   80102c80 <end_op>
80105239:	83 c4 10             	add    $0x10,%esp
8010523c:	31 c0                	xor    %eax,%eax
8010523e:	c9                   	leave  
8010523f:	c3                   	ret    
80105240:	e8 3b da ff ff       	call   80102c80 <end_op>
80105245:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010524a:	c9                   	leave  
8010524b:	c3                   	ret    
8010524c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105250 <sys_mknod>:
80105250:	55                   	push   %ebp
80105251:	89 e5                	mov    %esp,%ebp
80105253:	83 ec 18             	sub    $0x18,%esp
80105256:	e8 b5 d9 ff ff       	call   80102c10 <begin_op>
8010525b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010525e:	83 ec 08             	sub    $0x8,%esp
80105261:	50                   	push   %eax
80105262:	6a 00                	push   $0x0
80105264:	e8 07 f6 ff ff       	call   80104870 <argstr>
80105269:	83 c4 10             	add    $0x10,%esp
8010526c:	85 c0                	test   %eax,%eax
8010526e:	78 60                	js     801052d0 <sys_mknod+0x80>
80105270:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105273:	83 ec 08             	sub    $0x8,%esp
80105276:	50                   	push   %eax
80105277:	6a 01                	push   $0x1
80105279:	e8 62 f5 ff ff       	call   801047e0 <argint>
8010527e:	83 c4 10             	add    $0x10,%esp
80105281:	85 c0                	test   %eax,%eax
80105283:	78 4b                	js     801052d0 <sys_mknod+0x80>
80105285:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105288:	83 ec 08             	sub    $0x8,%esp
8010528b:	50                   	push   %eax
8010528c:	6a 02                	push   $0x2
8010528e:	e8 4d f5 ff ff       	call   801047e0 <argint>
80105293:	83 c4 10             	add    $0x10,%esp
80105296:	85 c0                	test   %eax,%eax
80105298:	78 36                	js     801052d0 <sys_mknod+0x80>
8010529a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
8010529e:	83 ec 0c             	sub    $0xc,%esp
801052a1:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
801052a5:	ba 03 00 00 00       	mov    $0x3,%edx
801052aa:	50                   	push   %eax
801052ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
801052ae:	e8 ad f6 ff ff       	call   80104960 <create>
801052b3:	83 c4 10             	add    $0x10,%esp
801052b6:	85 c0                	test   %eax,%eax
801052b8:	74 16                	je     801052d0 <sys_mknod+0x80>
801052ba:	83 ec 0c             	sub    $0xc,%esp
801052bd:	50                   	push   %eax
801052be:	e8 5d c6 ff ff       	call   80101920 <iunlockput>
801052c3:	e8 b8 d9 ff ff       	call   80102c80 <end_op>
801052c8:	83 c4 10             	add    $0x10,%esp
801052cb:	31 c0                	xor    %eax,%eax
801052cd:	c9                   	leave  
801052ce:	c3                   	ret    
801052cf:	90                   	nop
801052d0:	e8 ab d9 ff ff       	call   80102c80 <end_op>
801052d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052da:	c9                   	leave  
801052db:	c3                   	ret    
801052dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801052e0 <sys_chdir>:
801052e0:	55                   	push   %ebp
801052e1:	89 e5                	mov    %esp,%ebp
801052e3:	53                   	push   %ebx
801052e4:	83 ec 14             	sub    $0x14,%esp
801052e7:	e8 24 d9 ff ff       	call   80102c10 <begin_op>
801052ec:	8d 45 f4             	lea    -0xc(%ebp),%eax
801052ef:	83 ec 08             	sub    $0x8,%esp
801052f2:	50                   	push   %eax
801052f3:	6a 00                	push   $0x0
801052f5:	e8 76 f5 ff ff       	call   80104870 <argstr>
801052fa:	83 c4 10             	add    $0x10,%esp
801052fd:	85 c0                	test   %eax,%eax
801052ff:	78 7f                	js     80105380 <sys_chdir+0xa0>
80105301:	83 ec 0c             	sub    $0xc,%esp
80105304:	ff 75 f4             	pushl  -0xc(%ebp)
80105307:	e8 d4 cb ff ff       	call   80101ee0 <namei>
8010530c:	83 c4 10             	add    $0x10,%esp
8010530f:	85 c0                	test   %eax,%eax
80105311:	89 c3                	mov    %eax,%ebx
80105313:	74 6b                	je     80105380 <sys_chdir+0xa0>
80105315:	83 ec 0c             	sub    $0xc,%esp
80105318:	50                   	push   %eax
80105319:	e8 92 c3 ff ff       	call   801016b0 <ilock>
8010531e:	83 c4 10             	add    $0x10,%esp
80105321:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105326:	75 38                	jne    80105360 <sys_chdir+0x80>
80105328:	83 ec 0c             	sub    $0xc,%esp
8010532b:	53                   	push   %ebx
8010532c:	e8 5f c4 ff ff       	call   80101790 <iunlock>
80105331:	58                   	pop    %eax
80105332:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105338:	ff 70 68             	pushl  0x68(%eax)
8010533b:	e8 a0 c4 ff ff       	call   801017e0 <iput>
80105340:	e8 3b d9 ff ff       	call   80102c80 <end_op>
80105345:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010534b:	83 c4 10             	add    $0x10,%esp
8010534e:	89 58 68             	mov    %ebx,0x68(%eax)
80105351:	31 c0                	xor    %eax,%eax
80105353:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105356:	c9                   	leave  
80105357:	c3                   	ret    
80105358:	90                   	nop
80105359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105360:	83 ec 0c             	sub    $0xc,%esp
80105363:	53                   	push   %ebx
80105364:	e8 b7 c5 ff ff       	call   80101920 <iunlockput>
80105369:	e8 12 d9 ff ff       	call   80102c80 <end_op>
8010536e:	83 c4 10             	add    $0x10,%esp
80105371:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105376:	eb db                	jmp    80105353 <sys_chdir+0x73>
80105378:	90                   	nop
80105379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105380:	e8 fb d8 ff ff       	call   80102c80 <end_op>
80105385:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010538a:	eb c7                	jmp    80105353 <sys_chdir+0x73>
8010538c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105390 <sys_exec>:
80105390:	55                   	push   %ebp
80105391:	89 e5                	mov    %esp,%ebp
80105393:	57                   	push   %edi
80105394:	56                   	push   %esi
80105395:	53                   	push   %ebx
80105396:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
8010539c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
801053a2:	50                   	push   %eax
801053a3:	6a 00                	push   $0x0
801053a5:	e8 c6 f4 ff ff       	call   80104870 <argstr>
801053aa:	83 c4 10             	add    $0x10,%esp
801053ad:	85 c0                	test   %eax,%eax
801053af:	78 7f                	js     80105430 <sys_exec+0xa0>
801053b1:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
801053b7:	83 ec 08             	sub    $0x8,%esp
801053ba:	50                   	push   %eax
801053bb:	6a 01                	push   $0x1
801053bd:	e8 1e f4 ff ff       	call   801047e0 <argint>
801053c2:	83 c4 10             	add    $0x10,%esp
801053c5:	85 c0                	test   %eax,%eax
801053c7:	78 67                	js     80105430 <sys_exec+0xa0>
801053c9:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801053cf:	83 ec 04             	sub    $0x4,%esp
801053d2:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
801053d8:	68 80 00 00 00       	push   $0x80
801053dd:	6a 00                	push   $0x0
801053df:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
801053e5:	50                   	push   %eax
801053e6:	31 db                	xor    %ebx,%ebx
801053e8:	e8 03 f1 ff ff       	call   801044f0 <memset>
801053ed:	83 c4 10             	add    $0x10,%esp
801053f0:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
801053f6:	83 ec 08             	sub    $0x8,%esp
801053f9:	57                   	push   %edi
801053fa:	8d 04 98             	lea    (%eax,%ebx,4),%eax
801053fd:	50                   	push   %eax
801053fe:	e8 5d f3 ff ff       	call   80104760 <fetchint>
80105403:	83 c4 10             	add    $0x10,%esp
80105406:	85 c0                	test   %eax,%eax
80105408:	78 26                	js     80105430 <sys_exec+0xa0>
8010540a:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105410:	85 c0                	test   %eax,%eax
80105412:	74 2c                	je     80105440 <sys_exec+0xb0>
80105414:	83 ec 08             	sub    $0x8,%esp
80105417:	56                   	push   %esi
80105418:	50                   	push   %eax
80105419:	e8 72 f3 ff ff       	call   80104790 <fetchstr>
8010541e:	83 c4 10             	add    $0x10,%esp
80105421:	85 c0                	test   %eax,%eax
80105423:	78 0b                	js     80105430 <sys_exec+0xa0>
80105425:	83 c3 01             	add    $0x1,%ebx
80105428:	83 c6 04             	add    $0x4,%esi
8010542b:	83 fb 20             	cmp    $0x20,%ebx
8010542e:	75 c0                	jne    801053f0 <sys_exec+0x60>
80105430:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105433:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105438:	5b                   	pop    %ebx
80105439:	5e                   	pop    %esi
8010543a:	5f                   	pop    %edi
8010543b:	5d                   	pop    %ebp
8010543c:	c3                   	ret    
8010543d:	8d 76 00             	lea    0x0(%esi),%esi
80105440:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105446:	83 ec 08             	sub    $0x8,%esp
80105449:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105450:	00 00 00 00 
80105454:	50                   	push   %eax
80105455:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010545b:	e8 b0 b5 ff ff       	call   80100a10 <exec>
80105460:	83 c4 10             	add    $0x10,%esp
80105463:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105466:	5b                   	pop    %ebx
80105467:	5e                   	pop    %esi
80105468:	5f                   	pop    %edi
80105469:	5d                   	pop    %ebp
8010546a:	c3                   	ret    
8010546b:	90                   	nop
8010546c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105470 <sys_pipe>:
80105470:	55                   	push   %ebp
80105471:	89 e5                	mov    %esp,%ebp
80105473:	57                   	push   %edi
80105474:	56                   	push   %esi
80105475:	53                   	push   %ebx
80105476:	8d 45 dc             	lea    -0x24(%ebp),%eax
80105479:	83 ec 20             	sub    $0x20,%esp
8010547c:	6a 08                	push   $0x8
8010547e:	50                   	push   %eax
8010547f:	6a 00                	push   $0x0
80105481:	e8 9a f3 ff ff       	call   80104820 <argptr>
80105486:	83 c4 10             	add    $0x10,%esp
80105489:	85 c0                	test   %eax,%eax
8010548b:	78 48                	js     801054d5 <sys_pipe+0x65>
8010548d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105490:	83 ec 08             	sub    $0x8,%esp
80105493:	50                   	push   %eax
80105494:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105497:	50                   	push   %eax
80105498:	e8 13 df ff ff       	call   801033b0 <pipealloc>
8010549d:	83 c4 10             	add    $0x10,%esp
801054a0:	85 c0                	test   %eax,%eax
801054a2:	78 31                	js     801054d5 <sys_pipe+0x65>
801054a4:	8b 5d e0             	mov    -0x20(%ebp),%ebx
801054a7:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
801054ae:	31 c0                	xor    %eax,%eax
801054b0:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
801054b4:	85 d2                	test   %edx,%edx
801054b6:	74 28                	je     801054e0 <sys_pipe+0x70>
801054b8:	83 c0 01             	add    $0x1,%eax
801054bb:	83 f8 10             	cmp    $0x10,%eax
801054be:	75 f0                	jne    801054b0 <sys_pipe+0x40>
801054c0:	83 ec 0c             	sub    $0xc,%esp
801054c3:	53                   	push   %ebx
801054c4:	e8 a7 b9 ff ff       	call   80100e70 <fileclose>
801054c9:	58                   	pop    %eax
801054ca:	ff 75 e4             	pushl  -0x1c(%ebp)
801054cd:	e8 9e b9 ff ff       	call   80100e70 <fileclose>
801054d2:	83 c4 10             	add    $0x10,%esp
801054d5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054da:	eb 45                	jmp    80105521 <sys_pipe+0xb1>
801054dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801054e0:	8d 34 81             	lea    (%ecx,%eax,4),%esi
801054e3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801054e6:	31 d2                	xor    %edx,%edx
801054e8:	89 5e 28             	mov    %ebx,0x28(%esi)
801054eb:	90                   	nop
801054ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801054f0:	83 7c 91 28 00       	cmpl   $0x0,0x28(%ecx,%edx,4)
801054f5:	74 19                	je     80105510 <sys_pipe+0xa0>
801054f7:	83 c2 01             	add    $0x1,%edx
801054fa:	83 fa 10             	cmp    $0x10,%edx
801054fd:	75 f1                	jne    801054f0 <sys_pipe+0x80>
801054ff:	c7 46 28 00 00 00 00 	movl   $0x0,0x28(%esi)
80105506:	eb b8                	jmp    801054c0 <sys_pipe+0x50>
80105508:	90                   	nop
80105509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105510:	89 7c 91 28          	mov    %edi,0x28(%ecx,%edx,4)
80105514:	8b 4d dc             	mov    -0x24(%ebp),%ecx
80105517:	89 01                	mov    %eax,(%ecx)
80105519:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010551c:	89 50 04             	mov    %edx,0x4(%eax)
8010551f:	31 c0                	xor    %eax,%eax
80105521:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105524:	5b                   	pop    %ebx
80105525:	5e                   	pop    %esi
80105526:	5f                   	pop    %edi
80105527:	5d                   	pop    %ebp
80105528:	c3                   	ret    
80105529:	66 90                	xchg   %ax,%ax
8010552b:	66 90                	xchg   %ax,%ax
8010552d:	66 90                	xchg   %ax,%ax
8010552f:	90                   	nop

80105530 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
80105530:	55                   	push   %ebp
80105531:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105533:	5d                   	pop    %ebp
#include "proc.h"

int
sys_fork(void)
{
  return fork();
80105534:	e9 f7 e4 ff ff       	jmp    80103a30 <fork>
80105539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105540 <sys_exit>:
}

int
sys_exit(void)
{
80105540:	55                   	push   %ebp
80105541:	89 e5                	mov    %esp,%ebp
80105543:	83 ec 20             	sub    $0x20,%esp
  int status;
  argint(0, &status);
80105546:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105549:	50                   	push   %eax
8010554a:	6a 00                	push   $0x0
8010554c:	e8 8f f2 ff ff       	call   801047e0 <argint>
  exit(status);
80105551:	58                   	pop    %eax
80105552:	ff 75 f4             	pushl  -0xc(%ebp)
80105555:	e8 46 e7 ff ff       	call   80103ca0 <exit>
  return 0;  // not reached
}
8010555a:	31 c0                	xor    %eax,%eax
8010555c:	c9                   	leave  
8010555d:	c3                   	ret    
8010555e:	66 90                	xchg   %ax,%ax

80105560 <sys_wait>:

int
sys_wait(void)
{
80105560:	55                   	push   %ebp
80105561:	89 e5                	mov    %esp,%ebp
80105563:	83 ec 14             	sub    $0x14,%esp
  return wait(0);
80105566:	6a 00                	push   $0x0
80105568:	e8 93 e9 ff ff       	call   80103f00 <wait>
}
8010556d:	c9                   	leave  
8010556e:	c3                   	ret    
8010556f:	90                   	nop

80105570 <sys_kill>:

int
sys_kill(void)
{
80105570:	55                   	push   %ebp
80105571:	89 e5                	mov    %esp,%ebp
80105573:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105576:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105579:	50                   	push   %eax
8010557a:	6a 00                	push   $0x0
8010557c:	e8 5f f2 ff ff       	call   801047e0 <argint>
80105581:	83 c4 10             	add    $0x10,%esp
80105584:	85 c0                	test   %eax,%eax
80105586:	78 18                	js     801055a0 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105588:	83 ec 0c             	sub    $0xc,%esp
8010558b:	ff 75 f4             	pushl  -0xc(%ebp)
8010558e:	e8 ad ea ff ff       	call   80104040 <kill>
80105593:	83 c4 10             	add    $0x10,%esp
}
80105596:	c9                   	leave  
80105597:	c3                   	ret    
80105598:	90                   	nop
80105599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
801055a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
801055a5:	c9                   	leave  
801055a6:	c3                   	ret    
801055a7:	89 f6                	mov    %esi,%esi
801055a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801055b0 <sys_getpid>:

int
sys_getpid(void)
{
  return proc->pid;
801055b0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return kill(pid);
}

int
sys_getpid(void)
{
801055b6:	55                   	push   %ebp
801055b7:	89 e5                	mov    %esp,%ebp
  return proc->pid;
801055b9:	8b 40 10             	mov    0x10(%eax),%eax
}
801055bc:	5d                   	pop    %ebp
801055bd:	c3                   	ret    
801055be:	66 90                	xchg   %ax,%ax

801055c0 <sys_sbrk>:

int
sys_sbrk(void)
{
801055c0:	55                   	push   %ebp
801055c1:	89 e5                	mov    %esp,%ebp
801055c3:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
801055c4:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return proc->pid;
}

int
sys_sbrk(void)
{
801055c7:	83 ec 1c             	sub    $0x1c,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
801055ca:	50                   	push   %eax
801055cb:	6a 00                	push   $0x0
801055cd:	e8 0e f2 ff ff       	call   801047e0 <argint>
801055d2:	83 c4 10             	add    $0x10,%esp
801055d5:	85 c0                	test   %eax,%eax
801055d7:	78 27                	js     80105600 <sys_sbrk+0x40>
    return -1;
  addr = proc->sz;
801055d9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  if(growproc(n) < 0)
801055df:	83 ec 0c             	sub    $0xc,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
801055e2:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
801055e4:	ff 75 f4             	pushl  -0xc(%ebp)
801055e7:	e8 d4 e3 ff ff       	call   801039c0 <growproc>
801055ec:	83 c4 10             	add    $0x10,%esp
801055ef:	85 c0                	test   %eax,%eax
801055f1:	78 0d                	js     80105600 <sys_sbrk+0x40>
    return -1;
  return addr;
801055f3:	89 d8                	mov    %ebx,%eax
}
801055f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801055f8:	c9                   	leave  
801055f9:	c3                   	ret    
801055fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
80105600:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105605:	eb ee                	jmp    801055f5 <sys_sbrk+0x35>
80105607:	89 f6                	mov    %esi,%esi
80105609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105610 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
80105610:	55                   	push   %ebp
80105611:	89 e5                	mov    %esp,%ebp
80105613:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105614:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return addr;
}

int
sys_sleep(void)
{
80105617:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
8010561a:	50                   	push   %eax
8010561b:	6a 00                	push   $0x0
8010561d:	e8 be f1 ff ff       	call   801047e0 <argint>
80105622:	83 c4 10             	add    $0x10,%esp
80105625:	85 c0                	test   %eax,%eax
80105627:	0f 88 8a 00 00 00    	js     801056b7 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
8010562d:	83 ec 0c             	sub    $0xc,%esp
80105630:	68 e0 4c 11 80       	push   $0x80114ce0
80105635:	e8 86 ec ff ff       	call   801042c0 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
8010563a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010563d:	83 c4 10             	add    $0x10,%esp
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
80105640:	8b 1d 20 55 11 80    	mov    0x80115520,%ebx
  while(ticks - ticks0 < n){
80105646:	85 d2                	test   %edx,%edx
80105648:	75 27                	jne    80105671 <sys_sleep+0x61>
8010564a:	eb 54                	jmp    801056a0 <sys_sleep+0x90>
8010564c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105650:	83 ec 08             	sub    $0x8,%esp
80105653:	68 e0 4c 11 80       	push   $0x80114ce0
80105658:	68 20 55 11 80       	push   $0x80115520
8010565d:	e8 de e7 ff ff       	call   80103e40 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105662:	a1 20 55 11 80       	mov    0x80115520,%eax
80105667:	83 c4 10             	add    $0x10,%esp
8010566a:	29 d8                	sub    %ebx,%eax
8010566c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010566f:	73 2f                	jae    801056a0 <sys_sleep+0x90>
    if(proc->killed){
80105671:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105677:	8b 40 24             	mov    0x24(%eax),%eax
8010567a:	85 c0                	test   %eax,%eax
8010567c:	74 d2                	je     80105650 <sys_sleep+0x40>
      release(&tickslock);
8010567e:	83 ec 0c             	sub    $0xc,%esp
80105681:	68 e0 4c 11 80       	push   $0x80114ce0
80105686:	e8 15 ee ff ff       	call   801044a0 <release>
      return -1;
8010568b:	83 c4 10             	add    $0x10,%esp
8010568e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
80105693:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105696:	c9                   	leave  
80105697:	c3                   	ret    
80105698:	90                   	nop
80105699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
801056a0:	83 ec 0c             	sub    $0xc,%esp
801056a3:	68 e0 4c 11 80       	push   $0x80114ce0
801056a8:	e8 f3 ed ff ff       	call   801044a0 <release>
  return 0;
801056ad:	83 c4 10             	add    $0x10,%esp
801056b0:	31 c0                	xor    %eax,%eax
}
801056b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801056b5:	c9                   	leave  
801056b6:	c3                   	ret    
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
801056b7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801056bc:	eb d5                	jmp    80105693 <sys_sleep+0x83>
801056be:	66 90                	xchg   %ax,%ax

801056c0 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
801056c0:	55                   	push   %ebp
801056c1:	89 e5                	mov    %esp,%ebp
801056c3:	53                   	push   %ebx
801056c4:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
801056c7:	68 e0 4c 11 80       	push   $0x80114ce0
801056cc:	e8 ef eb ff ff       	call   801042c0 <acquire>
  xticks = ticks;
801056d1:	8b 1d 20 55 11 80    	mov    0x80115520,%ebx
  release(&tickslock);
801056d7:	c7 04 24 e0 4c 11 80 	movl   $0x80114ce0,(%esp)
801056de:	e8 bd ed ff ff       	call   801044a0 <release>
  return xticks;
}
801056e3:	89 d8                	mov    %ebx,%eax
801056e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801056e8:	c9                   	leave  
801056e9:	c3                   	ret    
801056ea:	66 90                	xchg   %ax,%ax
801056ec:	66 90                	xchg   %ax,%ax
801056ee:	66 90                	xchg   %ax,%ax

801056f0 <timerinit>:
801056f0:	55                   	push   %ebp
801056f1:	ba 43 00 00 00       	mov    $0x43,%edx
801056f6:	b8 34 00 00 00       	mov    $0x34,%eax
801056fb:	89 e5                	mov    %esp,%ebp
801056fd:	83 ec 14             	sub    $0x14,%esp
80105700:	ee                   	out    %al,(%dx)
80105701:	ba 40 00 00 00       	mov    $0x40,%edx
80105706:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
8010570b:	ee                   	out    %al,(%dx)
8010570c:	b8 2e 00 00 00       	mov    $0x2e,%eax
80105711:	ee                   	out    %al,(%dx)
80105712:	6a 00                	push   $0x0
80105714:	e8 c7 db ff ff       	call   801032e0 <picenable>
80105719:	83 c4 10             	add    $0x10,%esp
8010571c:	c9                   	leave  
8010571d:	c3                   	ret    

8010571e <alltraps>:
8010571e:	1e                   	push   %ds
8010571f:	06                   	push   %es
80105720:	0f a0                	push   %fs
80105722:	0f a8                	push   %gs
80105724:	60                   	pusha  
80105725:	66 b8 10 00          	mov    $0x10,%ax
80105729:	8e d8                	mov    %eax,%ds
8010572b:	8e c0                	mov    %eax,%es
8010572d:	66 b8 18 00          	mov    $0x18,%ax
80105731:	8e e0                	mov    %eax,%fs
80105733:	8e e8                	mov    %eax,%gs
80105735:	54                   	push   %esp
80105736:	e8 e5 00 00 00       	call   80105820 <trap>
8010573b:	83 c4 04             	add    $0x4,%esp

8010573e <trapret>:
8010573e:	61                   	popa   
8010573f:	0f a9                	pop    %gs
80105741:	0f a1                	pop    %fs
80105743:	07                   	pop    %es
80105744:	1f                   	pop    %ds
80105745:	83 c4 08             	add    $0x8,%esp
80105748:	cf                   	iret   
80105749:	66 90                	xchg   %ax,%ax
8010574b:	66 90                	xchg   %ax,%ax
8010574d:	66 90                	xchg   %ax,%ax
8010574f:	90                   	nop

80105750 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105750:	31 c0                	xor    %eax,%eax
80105752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105758:	8b 14 85 0c a0 10 80 	mov    -0x7fef5ff4(,%eax,4),%edx
8010575f:	b9 08 00 00 00       	mov    $0x8,%ecx
80105764:	c6 04 c5 24 4d 11 80 	movb   $0x0,-0x7feeb2dc(,%eax,8)
8010576b:	00 
8010576c:	66 89 0c c5 22 4d 11 	mov    %cx,-0x7feeb2de(,%eax,8)
80105773:	80 
80105774:	c6 04 c5 25 4d 11 80 	movb   $0x8e,-0x7feeb2db(,%eax,8)
8010577b:	8e 
8010577c:	66 89 14 c5 20 4d 11 	mov    %dx,-0x7feeb2e0(,%eax,8)
80105783:	80 
80105784:	c1 ea 10             	shr    $0x10,%edx
80105787:	66 89 14 c5 26 4d 11 	mov    %dx,-0x7feeb2da(,%eax,8)
8010578e:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
8010578f:	83 c0 01             	add    $0x1,%eax
80105792:	3d 00 01 00 00       	cmp    $0x100,%eax
80105797:	75 bf                	jne    80105758 <tvinit+0x8>
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105799:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
8010579a:	ba 08 00 00 00       	mov    $0x8,%edx
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
8010579f:	89 e5                	mov    %esp,%ebp
801057a1:	83 ec 10             	sub    $0x10,%esp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801057a4:	a1 0c a1 10 80       	mov    0x8010a10c,%eax

  initlock(&tickslock, "time");
801057a9:	68 19 77 10 80       	push   $0x80107719
801057ae:	68 e0 4c 11 80       	push   $0x80114ce0
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
801057b3:	66 89 15 22 4f 11 80 	mov    %dx,0x80114f22
801057ba:	c6 05 24 4f 11 80 00 	movb   $0x0,0x80114f24
801057c1:	66 a3 20 4f 11 80    	mov    %ax,0x80114f20
801057c7:	c1 e8 10             	shr    $0x10,%eax
801057ca:	c6 05 25 4f 11 80 ef 	movb   $0xef,0x80114f25
801057d1:	66 a3 26 4f 11 80    	mov    %ax,0x80114f26

  initlock(&tickslock, "time");
801057d7:	e8 c4 ea ff ff       	call   801042a0 <initlock>
}
801057dc:	83 c4 10             	add    $0x10,%esp
801057df:	c9                   	leave  
801057e0:	c3                   	ret    
801057e1:	eb 0d                	jmp    801057f0 <idtinit>
801057e3:	90                   	nop
801057e4:	90                   	nop
801057e5:	90                   	nop
801057e6:	90                   	nop
801057e7:	90                   	nop
801057e8:	90                   	nop
801057e9:	90                   	nop
801057ea:	90                   	nop
801057eb:	90                   	nop
801057ec:	90                   	nop
801057ed:	90                   	nop
801057ee:	90                   	nop
801057ef:	90                   	nop

801057f0 <idtinit>:

void
idtinit(void)
{
801057f0:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
801057f1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
801057f6:	89 e5                	mov    %esp,%ebp
801057f8:	83 ec 10             	sub    $0x10,%esp
801057fb:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
801057ff:	b8 20 4d 11 80       	mov    $0x80114d20,%eax
80105804:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105808:	c1 e8 10             	shr    $0x10,%eax
8010580b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
8010580f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105812:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105815:	c9                   	leave  
80105816:	c3                   	ret    
80105817:	89 f6                	mov    %esi,%esi
80105819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105820 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105820:	55                   	push   %ebp
80105821:	89 e5                	mov    %esp,%ebp
80105823:	57                   	push   %edi
80105824:	56                   	push   %esi
80105825:	53                   	push   %ebx
80105826:	83 ec 0c             	sub    $0xc,%esp
80105829:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
8010582c:	8b 43 30             	mov    0x30(%ebx),%eax
8010582f:	83 f8 40             	cmp    $0x40,%eax
80105832:	0f 84 f8 00 00 00    	je     80105930 <trap+0x110>
    if(proc->killed)
      exit(11);
    return;
  }

  switch(tf->trapno){
80105838:	83 e8 20             	sub    $0x20,%eax
8010583b:	83 f8 1f             	cmp    $0x1f,%eax
8010583e:	77 68                	ja     801058a8 <trap+0x88>
80105840:	ff 24 85 c0 77 10 80 	jmp    *-0x7fef8840(,%eax,4)
80105847:	89 f6                	mov    %esi,%esi
80105849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
80105850:	e8 db ce ff ff       	call   80102730 <cpunum>
80105855:	85 c0                	test   %eax,%eax
80105857:	0f 84 c3 01 00 00    	je     80105a20 <trap+0x200>
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
    lapiceoi();
8010585d:	e8 6e cf ff ff       	call   801027d0 <lapiceoi>
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105862:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105868:	85 c0                	test   %eax,%eax
8010586a:	74 2d                	je     80105899 <trap+0x79>
8010586c:	8b 50 24             	mov    0x24(%eax),%edx
8010586f:	85 d2                	test   %edx,%edx
80105871:	0f 85 86 00 00 00    	jne    801058fd <trap+0xdd>
    exit(11);

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105877:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
8010587b:	0f 84 ef 00 00 00    	je     80105970 <trap+0x150>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105881:	8b 40 24             	mov    0x24(%eax),%eax
80105884:	85 c0                	test   %eax,%eax
80105886:	74 11                	je     80105899 <trap+0x79>
80105888:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
8010588c:	83 e0 03             	and    $0x3,%eax
8010588f:	66 83 f8 03          	cmp    $0x3,%ax
80105893:	0f 84 c1 00 00 00    	je     8010595a <trap+0x13a>
    exit(11);
}
80105899:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010589c:	5b                   	pop    %ebx
8010589d:	5e                   	pop    %esi
8010589e:	5f                   	pop    %edi
8010589f:	5d                   	pop    %ebp
801058a0:	c3                   	ret    
801058a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
801058a8:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
801058af:	85 c9                	test   %ecx,%ecx
801058b1:	0f 84 9d 01 00 00    	je     80105a54 <trap+0x234>
801058b7:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
801058bb:	0f 84 93 01 00 00    	je     80105a54 <trap+0x234>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
801058c1:	0f 20 d7             	mov    %cr2,%edi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801058c4:	8b 73 38             	mov    0x38(%ebx),%esi
801058c7:	e8 64 ce ff ff       	call   80102730 <cpunum>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
801058cc:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801058d3:	57                   	push   %edi
801058d4:	56                   	push   %esi
801058d5:	50                   	push   %eax
801058d6:	ff 73 34             	pushl  0x34(%ebx)
801058d9:	ff 73 30             	pushl  0x30(%ebx)
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
801058dc:	8d 42 6c             	lea    0x6c(%edx),%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801058df:	50                   	push   %eax
801058e0:	ff 72 10             	pushl  0x10(%edx)
801058e3:	68 7c 77 10 80       	push   $0x8010777c
801058e8:	e8 73 ad ff ff       	call   80100660 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
            rcr2());
    proc->killed = 1;
801058ed:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801058f3:	83 c4 20             	add    $0x20,%esp
801058f6:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
801058fd:	0f b7 53 3c          	movzwl 0x3c(%ebx),%edx
80105901:	83 e2 03             	and    $0x3,%edx
80105904:	66 83 fa 03          	cmp    $0x3,%dx
80105908:	0f 85 69 ff ff ff    	jne    80105877 <trap+0x57>
    exit(11);
8010590e:	83 ec 0c             	sub    $0xc,%esp
80105911:	6a 0b                	push   $0xb
80105913:	e8 88 e3 ff ff       	call   80103ca0 <exit>
80105918:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
8010591e:	83 c4 10             	add    $0x10,%esp
80105921:	85 c0                	test   %eax,%eax
80105923:	0f 85 4e ff ff ff    	jne    80105877 <trap+0x57>
80105929:	e9 6b ff ff ff       	jmp    80105899 <trap+0x79>
8010592e:	66 90                	xchg   %ax,%ax
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
80105930:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105936:	8b 70 24             	mov    0x24(%eax),%esi
80105939:	85 f6                	test   %esi,%esi
8010593b:	0f 85 bf 00 00 00    	jne    80105a00 <trap+0x1e0>
      exit(11);
    proc->tf = tf;
80105941:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
80105944:	e8 a7 ef ff ff       	call   801048f0 <syscall>
    if(proc->killed)
80105949:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010594f:	8b 58 24             	mov    0x24(%eax),%ebx
80105952:	85 db                	test   %ebx,%ebx
80105954:	0f 84 3f ff ff ff    	je     80105899 <trap+0x79>
      exit(11);
8010595a:	c7 45 08 0b 00 00 00 	movl   $0xb,0x8(%ebp)
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit(11);
}
80105961:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105964:	5b                   	pop    %ebx
80105965:	5e                   	pop    %esi
80105966:	5f                   	pop    %edi
80105967:	5d                   	pop    %ebp
    if(proc->killed)
      exit(11);
    proc->tf = tf;
    syscall();
    if(proc->killed)
      exit(11);
80105968:	e9 33 e3 ff ff       	jmp    80103ca0 <exit>
8010596d:	8d 76 00             	lea    0x0(%esi),%esi
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit(11);

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105970:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105974:	0f 85 07 ff ff ff    	jne    80105881 <trap+0x61>
    yield();
8010597a:	e8 81 e4 ff ff       	call   80103e00 <yield>
8010597f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105985:	85 c0                	test   %eax,%eax
80105987:	0f 85 f4 fe ff ff    	jne    80105881 <trap+0x61>
8010598d:	e9 07 ff ff ff       	jmp    80105899 <trap+0x79>
80105992:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
80105998:	e8 73 cc ff ff       	call   80102610 <kbdintr>
    lapiceoi();
8010599d:	e8 2e ce ff ff       	call   801027d0 <lapiceoi>
    break;
801059a2:	e9 bb fe ff ff       	jmp    80105862 <trap+0x42>
801059a7:	89 f6                	mov    %esi,%esi
801059a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  case T_IRQ0 + IRQ_COM1:
    uartintr();
801059b0:	e8 3b 02 00 00       	call   80105bf0 <uartintr>
801059b5:	e9 a3 fe ff ff       	jmp    8010585d <trap+0x3d>
801059ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
801059c0:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
801059c4:	8b 7b 38             	mov    0x38(%ebx),%edi
801059c7:	e8 64 cd ff ff       	call   80102730 <cpunum>
801059cc:	57                   	push   %edi
801059cd:	56                   	push   %esi
801059ce:	50                   	push   %eax
801059cf:	68 24 77 10 80       	push   $0x80107724
801059d4:	e8 87 ac ff ff       	call   80100660 <cprintf>
            cpunum(), tf->cs, tf->eip);
    lapiceoi();
801059d9:	e8 f2 cd ff ff       	call   801027d0 <lapiceoi>
    break;
801059de:	83 c4 10             	add    $0x10,%esp
801059e1:	e9 7c fe ff ff       	jmp    80105862 <trap+0x42>
801059e6:	8d 76 00             	lea    0x0(%esi),%esi
801059e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
801059f0:	e8 8b c6 ff ff       	call   80102080 <ideintr>
    lapiceoi();
801059f5:	e8 d6 cd ff ff       	call   801027d0 <lapiceoi>
    break;
801059fa:	e9 63 fe ff ff       	jmp    80105862 <trap+0x42>
801059ff:	90                   	nop
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
      exit(11);
80105a00:	83 ec 0c             	sub    $0xc,%esp
80105a03:	6a 0b                	push   $0xb
80105a05:	e8 96 e2 ff ff       	call   80103ca0 <exit>
80105a0a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105a10:	83 c4 10             	add    $0x10,%esp
80105a13:	e9 29 ff ff ff       	jmp    80105941 <trap+0x121>
80105a18:	90                   	nop
80105a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
80105a20:	83 ec 0c             	sub    $0xc,%esp
80105a23:	68 e0 4c 11 80       	push   $0x80114ce0
80105a28:	e8 93 e8 ff ff       	call   801042c0 <acquire>
      ticks++;
      wakeup(&ticks);
80105a2d:	c7 04 24 20 55 11 80 	movl   $0x80115520,(%esp)

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
      ticks++;
80105a34:	83 05 20 55 11 80 01 	addl   $0x1,0x80115520
      wakeup(&ticks);
80105a3b:	e8 a0 e5 ff ff       	call   80103fe0 <wakeup>
      release(&tickslock);
80105a40:	c7 04 24 e0 4c 11 80 	movl   $0x80114ce0,(%esp)
80105a47:	e8 54 ea ff ff       	call   801044a0 <release>
80105a4c:	83 c4 10             	add    $0x10,%esp
80105a4f:	e9 09 fe ff ff       	jmp    8010585d <trap+0x3d>
80105a54:	0f 20 d7             	mov    %cr2,%edi

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105a57:	8b 73 38             	mov    0x38(%ebx),%esi
80105a5a:	e8 d1 cc ff ff       	call   80102730 <cpunum>
80105a5f:	83 ec 0c             	sub    $0xc,%esp
80105a62:	57                   	push   %edi
80105a63:	56                   	push   %esi
80105a64:	50                   	push   %eax
80105a65:	ff 73 30             	pushl  0x30(%ebx)
80105a68:	68 48 77 10 80       	push   $0x80107748
80105a6d:	e8 ee ab ff ff       	call   80100660 <cprintf>
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
80105a72:	83 c4 14             	add    $0x14,%esp
80105a75:	68 1e 77 10 80       	push   $0x8010771e
80105a7a:	e8 f1 a8 ff ff       	call   80100370 <panic>
80105a7f:	90                   	nop

80105a80 <uartgetc>:
80105a80:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
80105a85:	55                   	push   %ebp
80105a86:	89 e5                	mov    %esp,%ebp
80105a88:	85 c0                	test   %eax,%eax
80105a8a:	74 1c                	je     80105aa8 <uartgetc+0x28>
80105a8c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105a91:	ec                   	in     (%dx),%al
80105a92:	a8 01                	test   $0x1,%al
80105a94:	74 12                	je     80105aa8 <uartgetc+0x28>
80105a96:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a9b:	ec                   	in     (%dx),%al
80105a9c:	0f b6 c0             	movzbl %al,%eax
80105a9f:	5d                   	pop    %ebp
80105aa0:	c3                   	ret    
80105aa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105aa8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105aad:	5d                   	pop    %ebp
80105aae:	c3                   	ret    
80105aaf:	90                   	nop

80105ab0 <uartputc.part.0>:
80105ab0:	55                   	push   %ebp
80105ab1:	89 e5                	mov    %esp,%ebp
80105ab3:	57                   	push   %edi
80105ab4:	56                   	push   %esi
80105ab5:	53                   	push   %ebx
80105ab6:	89 c7                	mov    %eax,%edi
80105ab8:	bb 80 00 00 00       	mov    $0x80,%ebx
80105abd:	be fd 03 00 00       	mov    $0x3fd,%esi
80105ac2:	83 ec 0c             	sub    $0xc,%esp
80105ac5:	eb 1b                	jmp    80105ae2 <uartputc.part.0+0x32>
80105ac7:	89 f6                	mov    %esi,%esi
80105ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105ad0:	83 ec 0c             	sub    $0xc,%esp
80105ad3:	6a 0a                	push   $0xa
80105ad5:	e8 16 cd ff ff       	call   801027f0 <microdelay>
80105ada:	83 c4 10             	add    $0x10,%esp
80105add:	83 eb 01             	sub    $0x1,%ebx
80105ae0:	74 07                	je     80105ae9 <uartputc.part.0+0x39>
80105ae2:	89 f2                	mov    %esi,%edx
80105ae4:	ec                   	in     (%dx),%al
80105ae5:	a8 20                	test   $0x20,%al
80105ae7:	74 e7                	je     80105ad0 <uartputc.part.0+0x20>
80105ae9:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105aee:	89 f8                	mov    %edi,%eax
80105af0:	ee                   	out    %al,(%dx)
80105af1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105af4:	5b                   	pop    %ebx
80105af5:	5e                   	pop    %esi
80105af6:	5f                   	pop    %edi
80105af7:	5d                   	pop    %ebp
80105af8:	c3                   	ret    
80105af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105b00 <uartinit>:
80105b00:	55                   	push   %ebp
80105b01:	31 c9                	xor    %ecx,%ecx
80105b03:	89 c8                	mov    %ecx,%eax
80105b05:	89 e5                	mov    %esp,%ebp
80105b07:	57                   	push   %edi
80105b08:	56                   	push   %esi
80105b09:	53                   	push   %ebx
80105b0a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105b0f:	89 da                	mov    %ebx,%edx
80105b11:	83 ec 0c             	sub    $0xc,%esp
80105b14:	ee                   	out    %al,(%dx)
80105b15:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105b1a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105b1f:	89 fa                	mov    %edi,%edx
80105b21:	ee                   	out    %al,(%dx)
80105b22:	b8 0c 00 00 00       	mov    $0xc,%eax
80105b27:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105b2c:	ee                   	out    %al,(%dx)
80105b2d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105b32:	89 c8                	mov    %ecx,%eax
80105b34:	89 f2                	mov    %esi,%edx
80105b36:	ee                   	out    %al,(%dx)
80105b37:	b8 03 00 00 00       	mov    $0x3,%eax
80105b3c:	89 fa                	mov    %edi,%edx
80105b3e:	ee                   	out    %al,(%dx)
80105b3f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105b44:	89 c8                	mov    %ecx,%eax
80105b46:	ee                   	out    %al,(%dx)
80105b47:	b8 01 00 00 00       	mov    $0x1,%eax
80105b4c:	89 f2                	mov    %esi,%edx
80105b4e:	ee                   	out    %al,(%dx)
80105b4f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105b54:	ec                   	in     (%dx),%al
80105b55:	3c ff                	cmp    $0xff,%al
80105b57:	74 5a                	je     80105bb3 <uartinit+0xb3>
80105b59:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105b60:	00 00 00 
80105b63:	89 da                	mov    %ebx,%edx
80105b65:	ec                   	in     (%dx),%al
80105b66:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105b6b:	ec                   	in     (%dx),%al
80105b6c:	83 ec 0c             	sub    $0xc,%esp
80105b6f:	6a 04                	push   $0x4
80105b71:	e8 6a d7 ff ff       	call   801032e0 <picenable>
80105b76:	59                   	pop    %ecx
80105b77:	5b                   	pop    %ebx
80105b78:	6a 00                	push   $0x0
80105b7a:	6a 04                	push   $0x4
80105b7c:	bb 40 78 10 80       	mov    $0x80107840,%ebx
80105b81:	e8 5a c7 ff ff       	call   801022e0 <ioapicenable>
80105b86:	83 c4 10             	add    $0x10,%esp
80105b89:	b8 78 00 00 00       	mov    $0x78,%eax
80105b8e:	eb 0a                	jmp    80105b9a <uartinit+0x9a>
80105b90:	83 c3 01             	add    $0x1,%ebx
80105b93:	0f be 03             	movsbl (%ebx),%eax
80105b96:	84 c0                	test   %al,%al
80105b98:	74 19                	je     80105bb3 <uartinit+0xb3>
80105b9a:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105ba0:	85 d2                	test   %edx,%edx
80105ba2:	74 ec                	je     80105b90 <uartinit+0x90>
80105ba4:	83 c3 01             	add    $0x1,%ebx
80105ba7:	e8 04 ff ff ff       	call   80105ab0 <uartputc.part.0>
80105bac:	0f be 03             	movsbl (%ebx),%eax
80105baf:	84 c0                	test   %al,%al
80105bb1:	75 e7                	jne    80105b9a <uartinit+0x9a>
80105bb3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105bb6:	5b                   	pop    %ebx
80105bb7:	5e                   	pop    %esi
80105bb8:	5f                   	pop    %edi
80105bb9:	5d                   	pop    %ebp
80105bba:	c3                   	ret    
80105bbb:	90                   	nop
80105bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105bc0 <uartputc>:
80105bc0:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105bc6:	55                   	push   %ebp
80105bc7:	89 e5                	mov    %esp,%ebp
80105bc9:	85 d2                	test   %edx,%edx
80105bcb:	8b 45 08             	mov    0x8(%ebp),%eax
80105bce:	74 10                	je     80105be0 <uartputc+0x20>
80105bd0:	5d                   	pop    %ebp
80105bd1:	e9 da fe ff ff       	jmp    80105ab0 <uartputc.part.0>
80105bd6:	8d 76 00             	lea    0x0(%esi),%esi
80105bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105be0:	5d                   	pop    %ebp
80105be1:	c3                   	ret    
80105be2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105bf0 <uartintr>:
80105bf0:	55                   	push   %ebp
80105bf1:	89 e5                	mov    %esp,%ebp
80105bf3:	83 ec 14             	sub    $0x14,%esp
80105bf6:	68 80 5a 10 80       	push   $0x80105a80
80105bfb:	e8 f0 ab ff ff       	call   801007f0 <consoleintr>
80105c00:	83 c4 10             	add    $0x10,%esp
80105c03:	c9                   	leave  
80105c04:	c3                   	ret    

80105c05 <vector0>:
80105c05:	6a 00                	push   $0x0
80105c07:	6a 00                	push   $0x0
80105c09:	e9 10 fb ff ff       	jmp    8010571e <alltraps>

80105c0e <vector1>:
80105c0e:	6a 00                	push   $0x0
80105c10:	6a 01                	push   $0x1
80105c12:	e9 07 fb ff ff       	jmp    8010571e <alltraps>

80105c17 <vector2>:
80105c17:	6a 00                	push   $0x0
80105c19:	6a 02                	push   $0x2
80105c1b:	e9 fe fa ff ff       	jmp    8010571e <alltraps>

80105c20 <vector3>:
80105c20:	6a 00                	push   $0x0
80105c22:	6a 03                	push   $0x3
80105c24:	e9 f5 fa ff ff       	jmp    8010571e <alltraps>

80105c29 <vector4>:
80105c29:	6a 00                	push   $0x0
80105c2b:	6a 04                	push   $0x4
80105c2d:	e9 ec fa ff ff       	jmp    8010571e <alltraps>

80105c32 <vector5>:
80105c32:	6a 00                	push   $0x0
80105c34:	6a 05                	push   $0x5
80105c36:	e9 e3 fa ff ff       	jmp    8010571e <alltraps>

80105c3b <vector6>:
80105c3b:	6a 00                	push   $0x0
80105c3d:	6a 06                	push   $0x6
80105c3f:	e9 da fa ff ff       	jmp    8010571e <alltraps>

80105c44 <vector7>:
80105c44:	6a 00                	push   $0x0
80105c46:	6a 07                	push   $0x7
80105c48:	e9 d1 fa ff ff       	jmp    8010571e <alltraps>

80105c4d <vector8>:
80105c4d:	6a 08                	push   $0x8
80105c4f:	e9 ca fa ff ff       	jmp    8010571e <alltraps>

80105c54 <vector9>:
80105c54:	6a 00                	push   $0x0
80105c56:	6a 09                	push   $0x9
80105c58:	e9 c1 fa ff ff       	jmp    8010571e <alltraps>

80105c5d <vector10>:
80105c5d:	6a 0a                	push   $0xa
80105c5f:	e9 ba fa ff ff       	jmp    8010571e <alltraps>

80105c64 <vector11>:
80105c64:	6a 0b                	push   $0xb
80105c66:	e9 b3 fa ff ff       	jmp    8010571e <alltraps>

80105c6b <vector12>:
80105c6b:	6a 0c                	push   $0xc
80105c6d:	e9 ac fa ff ff       	jmp    8010571e <alltraps>

80105c72 <vector13>:
80105c72:	6a 0d                	push   $0xd
80105c74:	e9 a5 fa ff ff       	jmp    8010571e <alltraps>

80105c79 <vector14>:
80105c79:	6a 0e                	push   $0xe
80105c7b:	e9 9e fa ff ff       	jmp    8010571e <alltraps>

80105c80 <vector15>:
80105c80:	6a 00                	push   $0x0
80105c82:	6a 0f                	push   $0xf
80105c84:	e9 95 fa ff ff       	jmp    8010571e <alltraps>

80105c89 <vector16>:
80105c89:	6a 00                	push   $0x0
80105c8b:	6a 10                	push   $0x10
80105c8d:	e9 8c fa ff ff       	jmp    8010571e <alltraps>

80105c92 <vector17>:
80105c92:	6a 11                	push   $0x11
80105c94:	e9 85 fa ff ff       	jmp    8010571e <alltraps>

80105c99 <vector18>:
80105c99:	6a 00                	push   $0x0
80105c9b:	6a 12                	push   $0x12
80105c9d:	e9 7c fa ff ff       	jmp    8010571e <alltraps>

80105ca2 <vector19>:
80105ca2:	6a 00                	push   $0x0
80105ca4:	6a 13                	push   $0x13
80105ca6:	e9 73 fa ff ff       	jmp    8010571e <alltraps>

80105cab <vector20>:
80105cab:	6a 00                	push   $0x0
80105cad:	6a 14                	push   $0x14
80105caf:	e9 6a fa ff ff       	jmp    8010571e <alltraps>

80105cb4 <vector21>:
80105cb4:	6a 00                	push   $0x0
80105cb6:	6a 15                	push   $0x15
80105cb8:	e9 61 fa ff ff       	jmp    8010571e <alltraps>

80105cbd <vector22>:
80105cbd:	6a 00                	push   $0x0
80105cbf:	6a 16                	push   $0x16
80105cc1:	e9 58 fa ff ff       	jmp    8010571e <alltraps>

80105cc6 <vector23>:
80105cc6:	6a 00                	push   $0x0
80105cc8:	6a 17                	push   $0x17
80105cca:	e9 4f fa ff ff       	jmp    8010571e <alltraps>

80105ccf <vector24>:
80105ccf:	6a 00                	push   $0x0
80105cd1:	6a 18                	push   $0x18
80105cd3:	e9 46 fa ff ff       	jmp    8010571e <alltraps>

80105cd8 <vector25>:
80105cd8:	6a 00                	push   $0x0
80105cda:	6a 19                	push   $0x19
80105cdc:	e9 3d fa ff ff       	jmp    8010571e <alltraps>

80105ce1 <vector26>:
80105ce1:	6a 00                	push   $0x0
80105ce3:	6a 1a                	push   $0x1a
80105ce5:	e9 34 fa ff ff       	jmp    8010571e <alltraps>

80105cea <vector27>:
80105cea:	6a 00                	push   $0x0
80105cec:	6a 1b                	push   $0x1b
80105cee:	e9 2b fa ff ff       	jmp    8010571e <alltraps>

80105cf3 <vector28>:
80105cf3:	6a 00                	push   $0x0
80105cf5:	6a 1c                	push   $0x1c
80105cf7:	e9 22 fa ff ff       	jmp    8010571e <alltraps>

80105cfc <vector29>:
80105cfc:	6a 00                	push   $0x0
80105cfe:	6a 1d                	push   $0x1d
80105d00:	e9 19 fa ff ff       	jmp    8010571e <alltraps>

80105d05 <vector30>:
80105d05:	6a 00                	push   $0x0
80105d07:	6a 1e                	push   $0x1e
80105d09:	e9 10 fa ff ff       	jmp    8010571e <alltraps>

80105d0e <vector31>:
80105d0e:	6a 00                	push   $0x0
80105d10:	6a 1f                	push   $0x1f
80105d12:	e9 07 fa ff ff       	jmp    8010571e <alltraps>

80105d17 <vector32>:
80105d17:	6a 00                	push   $0x0
80105d19:	6a 20                	push   $0x20
80105d1b:	e9 fe f9 ff ff       	jmp    8010571e <alltraps>

80105d20 <vector33>:
80105d20:	6a 00                	push   $0x0
80105d22:	6a 21                	push   $0x21
80105d24:	e9 f5 f9 ff ff       	jmp    8010571e <alltraps>

80105d29 <vector34>:
80105d29:	6a 00                	push   $0x0
80105d2b:	6a 22                	push   $0x22
80105d2d:	e9 ec f9 ff ff       	jmp    8010571e <alltraps>

80105d32 <vector35>:
80105d32:	6a 00                	push   $0x0
80105d34:	6a 23                	push   $0x23
80105d36:	e9 e3 f9 ff ff       	jmp    8010571e <alltraps>

80105d3b <vector36>:
80105d3b:	6a 00                	push   $0x0
80105d3d:	6a 24                	push   $0x24
80105d3f:	e9 da f9 ff ff       	jmp    8010571e <alltraps>

80105d44 <vector37>:
80105d44:	6a 00                	push   $0x0
80105d46:	6a 25                	push   $0x25
80105d48:	e9 d1 f9 ff ff       	jmp    8010571e <alltraps>

80105d4d <vector38>:
80105d4d:	6a 00                	push   $0x0
80105d4f:	6a 26                	push   $0x26
80105d51:	e9 c8 f9 ff ff       	jmp    8010571e <alltraps>

80105d56 <vector39>:
80105d56:	6a 00                	push   $0x0
80105d58:	6a 27                	push   $0x27
80105d5a:	e9 bf f9 ff ff       	jmp    8010571e <alltraps>

80105d5f <vector40>:
80105d5f:	6a 00                	push   $0x0
80105d61:	6a 28                	push   $0x28
80105d63:	e9 b6 f9 ff ff       	jmp    8010571e <alltraps>

80105d68 <vector41>:
80105d68:	6a 00                	push   $0x0
80105d6a:	6a 29                	push   $0x29
80105d6c:	e9 ad f9 ff ff       	jmp    8010571e <alltraps>

80105d71 <vector42>:
80105d71:	6a 00                	push   $0x0
80105d73:	6a 2a                	push   $0x2a
80105d75:	e9 a4 f9 ff ff       	jmp    8010571e <alltraps>

80105d7a <vector43>:
80105d7a:	6a 00                	push   $0x0
80105d7c:	6a 2b                	push   $0x2b
80105d7e:	e9 9b f9 ff ff       	jmp    8010571e <alltraps>

80105d83 <vector44>:
80105d83:	6a 00                	push   $0x0
80105d85:	6a 2c                	push   $0x2c
80105d87:	e9 92 f9 ff ff       	jmp    8010571e <alltraps>

80105d8c <vector45>:
80105d8c:	6a 00                	push   $0x0
80105d8e:	6a 2d                	push   $0x2d
80105d90:	e9 89 f9 ff ff       	jmp    8010571e <alltraps>

80105d95 <vector46>:
80105d95:	6a 00                	push   $0x0
80105d97:	6a 2e                	push   $0x2e
80105d99:	e9 80 f9 ff ff       	jmp    8010571e <alltraps>

80105d9e <vector47>:
80105d9e:	6a 00                	push   $0x0
80105da0:	6a 2f                	push   $0x2f
80105da2:	e9 77 f9 ff ff       	jmp    8010571e <alltraps>

80105da7 <vector48>:
80105da7:	6a 00                	push   $0x0
80105da9:	6a 30                	push   $0x30
80105dab:	e9 6e f9 ff ff       	jmp    8010571e <alltraps>

80105db0 <vector49>:
80105db0:	6a 00                	push   $0x0
80105db2:	6a 31                	push   $0x31
80105db4:	e9 65 f9 ff ff       	jmp    8010571e <alltraps>

80105db9 <vector50>:
80105db9:	6a 00                	push   $0x0
80105dbb:	6a 32                	push   $0x32
80105dbd:	e9 5c f9 ff ff       	jmp    8010571e <alltraps>

80105dc2 <vector51>:
80105dc2:	6a 00                	push   $0x0
80105dc4:	6a 33                	push   $0x33
80105dc6:	e9 53 f9 ff ff       	jmp    8010571e <alltraps>

80105dcb <vector52>:
80105dcb:	6a 00                	push   $0x0
80105dcd:	6a 34                	push   $0x34
80105dcf:	e9 4a f9 ff ff       	jmp    8010571e <alltraps>

80105dd4 <vector53>:
80105dd4:	6a 00                	push   $0x0
80105dd6:	6a 35                	push   $0x35
80105dd8:	e9 41 f9 ff ff       	jmp    8010571e <alltraps>

80105ddd <vector54>:
80105ddd:	6a 00                	push   $0x0
80105ddf:	6a 36                	push   $0x36
80105de1:	e9 38 f9 ff ff       	jmp    8010571e <alltraps>

80105de6 <vector55>:
80105de6:	6a 00                	push   $0x0
80105de8:	6a 37                	push   $0x37
80105dea:	e9 2f f9 ff ff       	jmp    8010571e <alltraps>

80105def <vector56>:
80105def:	6a 00                	push   $0x0
80105df1:	6a 38                	push   $0x38
80105df3:	e9 26 f9 ff ff       	jmp    8010571e <alltraps>

80105df8 <vector57>:
80105df8:	6a 00                	push   $0x0
80105dfa:	6a 39                	push   $0x39
80105dfc:	e9 1d f9 ff ff       	jmp    8010571e <alltraps>

80105e01 <vector58>:
80105e01:	6a 00                	push   $0x0
80105e03:	6a 3a                	push   $0x3a
80105e05:	e9 14 f9 ff ff       	jmp    8010571e <alltraps>

80105e0a <vector59>:
80105e0a:	6a 00                	push   $0x0
80105e0c:	6a 3b                	push   $0x3b
80105e0e:	e9 0b f9 ff ff       	jmp    8010571e <alltraps>

80105e13 <vector60>:
80105e13:	6a 00                	push   $0x0
80105e15:	6a 3c                	push   $0x3c
80105e17:	e9 02 f9 ff ff       	jmp    8010571e <alltraps>

80105e1c <vector61>:
80105e1c:	6a 00                	push   $0x0
80105e1e:	6a 3d                	push   $0x3d
80105e20:	e9 f9 f8 ff ff       	jmp    8010571e <alltraps>

80105e25 <vector62>:
80105e25:	6a 00                	push   $0x0
80105e27:	6a 3e                	push   $0x3e
80105e29:	e9 f0 f8 ff ff       	jmp    8010571e <alltraps>

80105e2e <vector63>:
80105e2e:	6a 00                	push   $0x0
80105e30:	6a 3f                	push   $0x3f
80105e32:	e9 e7 f8 ff ff       	jmp    8010571e <alltraps>

80105e37 <vector64>:
80105e37:	6a 00                	push   $0x0
80105e39:	6a 40                	push   $0x40
80105e3b:	e9 de f8 ff ff       	jmp    8010571e <alltraps>

80105e40 <vector65>:
80105e40:	6a 00                	push   $0x0
80105e42:	6a 41                	push   $0x41
80105e44:	e9 d5 f8 ff ff       	jmp    8010571e <alltraps>

80105e49 <vector66>:
80105e49:	6a 00                	push   $0x0
80105e4b:	6a 42                	push   $0x42
80105e4d:	e9 cc f8 ff ff       	jmp    8010571e <alltraps>

80105e52 <vector67>:
80105e52:	6a 00                	push   $0x0
80105e54:	6a 43                	push   $0x43
80105e56:	e9 c3 f8 ff ff       	jmp    8010571e <alltraps>

80105e5b <vector68>:
80105e5b:	6a 00                	push   $0x0
80105e5d:	6a 44                	push   $0x44
80105e5f:	e9 ba f8 ff ff       	jmp    8010571e <alltraps>

80105e64 <vector69>:
80105e64:	6a 00                	push   $0x0
80105e66:	6a 45                	push   $0x45
80105e68:	e9 b1 f8 ff ff       	jmp    8010571e <alltraps>

80105e6d <vector70>:
80105e6d:	6a 00                	push   $0x0
80105e6f:	6a 46                	push   $0x46
80105e71:	e9 a8 f8 ff ff       	jmp    8010571e <alltraps>

80105e76 <vector71>:
80105e76:	6a 00                	push   $0x0
80105e78:	6a 47                	push   $0x47
80105e7a:	e9 9f f8 ff ff       	jmp    8010571e <alltraps>

80105e7f <vector72>:
80105e7f:	6a 00                	push   $0x0
80105e81:	6a 48                	push   $0x48
80105e83:	e9 96 f8 ff ff       	jmp    8010571e <alltraps>

80105e88 <vector73>:
80105e88:	6a 00                	push   $0x0
80105e8a:	6a 49                	push   $0x49
80105e8c:	e9 8d f8 ff ff       	jmp    8010571e <alltraps>

80105e91 <vector74>:
80105e91:	6a 00                	push   $0x0
80105e93:	6a 4a                	push   $0x4a
80105e95:	e9 84 f8 ff ff       	jmp    8010571e <alltraps>

80105e9a <vector75>:
80105e9a:	6a 00                	push   $0x0
80105e9c:	6a 4b                	push   $0x4b
80105e9e:	e9 7b f8 ff ff       	jmp    8010571e <alltraps>

80105ea3 <vector76>:
80105ea3:	6a 00                	push   $0x0
80105ea5:	6a 4c                	push   $0x4c
80105ea7:	e9 72 f8 ff ff       	jmp    8010571e <alltraps>

80105eac <vector77>:
80105eac:	6a 00                	push   $0x0
80105eae:	6a 4d                	push   $0x4d
80105eb0:	e9 69 f8 ff ff       	jmp    8010571e <alltraps>

80105eb5 <vector78>:
80105eb5:	6a 00                	push   $0x0
80105eb7:	6a 4e                	push   $0x4e
80105eb9:	e9 60 f8 ff ff       	jmp    8010571e <alltraps>

80105ebe <vector79>:
80105ebe:	6a 00                	push   $0x0
80105ec0:	6a 4f                	push   $0x4f
80105ec2:	e9 57 f8 ff ff       	jmp    8010571e <alltraps>

80105ec7 <vector80>:
80105ec7:	6a 00                	push   $0x0
80105ec9:	6a 50                	push   $0x50
80105ecb:	e9 4e f8 ff ff       	jmp    8010571e <alltraps>

80105ed0 <vector81>:
80105ed0:	6a 00                	push   $0x0
80105ed2:	6a 51                	push   $0x51
80105ed4:	e9 45 f8 ff ff       	jmp    8010571e <alltraps>

80105ed9 <vector82>:
80105ed9:	6a 00                	push   $0x0
80105edb:	6a 52                	push   $0x52
80105edd:	e9 3c f8 ff ff       	jmp    8010571e <alltraps>

80105ee2 <vector83>:
80105ee2:	6a 00                	push   $0x0
80105ee4:	6a 53                	push   $0x53
80105ee6:	e9 33 f8 ff ff       	jmp    8010571e <alltraps>

80105eeb <vector84>:
80105eeb:	6a 00                	push   $0x0
80105eed:	6a 54                	push   $0x54
80105eef:	e9 2a f8 ff ff       	jmp    8010571e <alltraps>

80105ef4 <vector85>:
80105ef4:	6a 00                	push   $0x0
80105ef6:	6a 55                	push   $0x55
80105ef8:	e9 21 f8 ff ff       	jmp    8010571e <alltraps>

80105efd <vector86>:
80105efd:	6a 00                	push   $0x0
80105eff:	6a 56                	push   $0x56
80105f01:	e9 18 f8 ff ff       	jmp    8010571e <alltraps>

80105f06 <vector87>:
80105f06:	6a 00                	push   $0x0
80105f08:	6a 57                	push   $0x57
80105f0a:	e9 0f f8 ff ff       	jmp    8010571e <alltraps>

80105f0f <vector88>:
80105f0f:	6a 00                	push   $0x0
80105f11:	6a 58                	push   $0x58
80105f13:	e9 06 f8 ff ff       	jmp    8010571e <alltraps>

80105f18 <vector89>:
80105f18:	6a 00                	push   $0x0
80105f1a:	6a 59                	push   $0x59
80105f1c:	e9 fd f7 ff ff       	jmp    8010571e <alltraps>

80105f21 <vector90>:
80105f21:	6a 00                	push   $0x0
80105f23:	6a 5a                	push   $0x5a
80105f25:	e9 f4 f7 ff ff       	jmp    8010571e <alltraps>

80105f2a <vector91>:
80105f2a:	6a 00                	push   $0x0
80105f2c:	6a 5b                	push   $0x5b
80105f2e:	e9 eb f7 ff ff       	jmp    8010571e <alltraps>

80105f33 <vector92>:
80105f33:	6a 00                	push   $0x0
80105f35:	6a 5c                	push   $0x5c
80105f37:	e9 e2 f7 ff ff       	jmp    8010571e <alltraps>

80105f3c <vector93>:
80105f3c:	6a 00                	push   $0x0
80105f3e:	6a 5d                	push   $0x5d
80105f40:	e9 d9 f7 ff ff       	jmp    8010571e <alltraps>

80105f45 <vector94>:
80105f45:	6a 00                	push   $0x0
80105f47:	6a 5e                	push   $0x5e
80105f49:	e9 d0 f7 ff ff       	jmp    8010571e <alltraps>

80105f4e <vector95>:
80105f4e:	6a 00                	push   $0x0
80105f50:	6a 5f                	push   $0x5f
80105f52:	e9 c7 f7 ff ff       	jmp    8010571e <alltraps>

80105f57 <vector96>:
80105f57:	6a 00                	push   $0x0
80105f59:	6a 60                	push   $0x60
80105f5b:	e9 be f7 ff ff       	jmp    8010571e <alltraps>

80105f60 <vector97>:
80105f60:	6a 00                	push   $0x0
80105f62:	6a 61                	push   $0x61
80105f64:	e9 b5 f7 ff ff       	jmp    8010571e <alltraps>

80105f69 <vector98>:
80105f69:	6a 00                	push   $0x0
80105f6b:	6a 62                	push   $0x62
80105f6d:	e9 ac f7 ff ff       	jmp    8010571e <alltraps>

80105f72 <vector99>:
80105f72:	6a 00                	push   $0x0
80105f74:	6a 63                	push   $0x63
80105f76:	e9 a3 f7 ff ff       	jmp    8010571e <alltraps>

80105f7b <vector100>:
80105f7b:	6a 00                	push   $0x0
80105f7d:	6a 64                	push   $0x64
80105f7f:	e9 9a f7 ff ff       	jmp    8010571e <alltraps>

80105f84 <vector101>:
80105f84:	6a 00                	push   $0x0
80105f86:	6a 65                	push   $0x65
80105f88:	e9 91 f7 ff ff       	jmp    8010571e <alltraps>

80105f8d <vector102>:
80105f8d:	6a 00                	push   $0x0
80105f8f:	6a 66                	push   $0x66
80105f91:	e9 88 f7 ff ff       	jmp    8010571e <alltraps>

80105f96 <vector103>:
80105f96:	6a 00                	push   $0x0
80105f98:	6a 67                	push   $0x67
80105f9a:	e9 7f f7 ff ff       	jmp    8010571e <alltraps>

80105f9f <vector104>:
80105f9f:	6a 00                	push   $0x0
80105fa1:	6a 68                	push   $0x68
80105fa3:	e9 76 f7 ff ff       	jmp    8010571e <alltraps>

80105fa8 <vector105>:
80105fa8:	6a 00                	push   $0x0
80105faa:	6a 69                	push   $0x69
80105fac:	e9 6d f7 ff ff       	jmp    8010571e <alltraps>

80105fb1 <vector106>:
80105fb1:	6a 00                	push   $0x0
80105fb3:	6a 6a                	push   $0x6a
80105fb5:	e9 64 f7 ff ff       	jmp    8010571e <alltraps>

80105fba <vector107>:
80105fba:	6a 00                	push   $0x0
80105fbc:	6a 6b                	push   $0x6b
80105fbe:	e9 5b f7 ff ff       	jmp    8010571e <alltraps>

80105fc3 <vector108>:
80105fc3:	6a 00                	push   $0x0
80105fc5:	6a 6c                	push   $0x6c
80105fc7:	e9 52 f7 ff ff       	jmp    8010571e <alltraps>

80105fcc <vector109>:
80105fcc:	6a 00                	push   $0x0
80105fce:	6a 6d                	push   $0x6d
80105fd0:	e9 49 f7 ff ff       	jmp    8010571e <alltraps>

80105fd5 <vector110>:
80105fd5:	6a 00                	push   $0x0
80105fd7:	6a 6e                	push   $0x6e
80105fd9:	e9 40 f7 ff ff       	jmp    8010571e <alltraps>

80105fde <vector111>:
80105fde:	6a 00                	push   $0x0
80105fe0:	6a 6f                	push   $0x6f
80105fe2:	e9 37 f7 ff ff       	jmp    8010571e <alltraps>

80105fe7 <vector112>:
80105fe7:	6a 00                	push   $0x0
80105fe9:	6a 70                	push   $0x70
80105feb:	e9 2e f7 ff ff       	jmp    8010571e <alltraps>

80105ff0 <vector113>:
80105ff0:	6a 00                	push   $0x0
80105ff2:	6a 71                	push   $0x71
80105ff4:	e9 25 f7 ff ff       	jmp    8010571e <alltraps>

80105ff9 <vector114>:
80105ff9:	6a 00                	push   $0x0
80105ffb:	6a 72                	push   $0x72
80105ffd:	e9 1c f7 ff ff       	jmp    8010571e <alltraps>

80106002 <vector115>:
80106002:	6a 00                	push   $0x0
80106004:	6a 73                	push   $0x73
80106006:	e9 13 f7 ff ff       	jmp    8010571e <alltraps>

8010600b <vector116>:
8010600b:	6a 00                	push   $0x0
8010600d:	6a 74                	push   $0x74
8010600f:	e9 0a f7 ff ff       	jmp    8010571e <alltraps>

80106014 <vector117>:
80106014:	6a 00                	push   $0x0
80106016:	6a 75                	push   $0x75
80106018:	e9 01 f7 ff ff       	jmp    8010571e <alltraps>

8010601d <vector118>:
8010601d:	6a 00                	push   $0x0
8010601f:	6a 76                	push   $0x76
80106021:	e9 f8 f6 ff ff       	jmp    8010571e <alltraps>

80106026 <vector119>:
80106026:	6a 00                	push   $0x0
80106028:	6a 77                	push   $0x77
8010602a:	e9 ef f6 ff ff       	jmp    8010571e <alltraps>

8010602f <vector120>:
8010602f:	6a 00                	push   $0x0
80106031:	6a 78                	push   $0x78
80106033:	e9 e6 f6 ff ff       	jmp    8010571e <alltraps>

80106038 <vector121>:
80106038:	6a 00                	push   $0x0
8010603a:	6a 79                	push   $0x79
8010603c:	e9 dd f6 ff ff       	jmp    8010571e <alltraps>

80106041 <vector122>:
80106041:	6a 00                	push   $0x0
80106043:	6a 7a                	push   $0x7a
80106045:	e9 d4 f6 ff ff       	jmp    8010571e <alltraps>

8010604a <vector123>:
8010604a:	6a 00                	push   $0x0
8010604c:	6a 7b                	push   $0x7b
8010604e:	e9 cb f6 ff ff       	jmp    8010571e <alltraps>

80106053 <vector124>:
80106053:	6a 00                	push   $0x0
80106055:	6a 7c                	push   $0x7c
80106057:	e9 c2 f6 ff ff       	jmp    8010571e <alltraps>

8010605c <vector125>:
8010605c:	6a 00                	push   $0x0
8010605e:	6a 7d                	push   $0x7d
80106060:	e9 b9 f6 ff ff       	jmp    8010571e <alltraps>

80106065 <vector126>:
80106065:	6a 00                	push   $0x0
80106067:	6a 7e                	push   $0x7e
80106069:	e9 b0 f6 ff ff       	jmp    8010571e <alltraps>

8010606e <vector127>:
8010606e:	6a 00                	push   $0x0
80106070:	6a 7f                	push   $0x7f
80106072:	e9 a7 f6 ff ff       	jmp    8010571e <alltraps>

80106077 <vector128>:
80106077:	6a 00                	push   $0x0
80106079:	68 80 00 00 00       	push   $0x80
8010607e:	e9 9b f6 ff ff       	jmp    8010571e <alltraps>

80106083 <vector129>:
80106083:	6a 00                	push   $0x0
80106085:	68 81 00 00 00       	push   $0x81
8010608a:	e9 8f f6 ff ff       	jmp    8010571e <alltraps>

8010608f <vector130>:
8010608f:	6a 00                	push   $0x0
80106091:	68 82 00 00 00       	push   $0x82
80106096:	e9 83 f6 ff ff       	jmp    8010571e <alltraps>

8010609b <vector131>:
8010609b:	6a 00                	push   $0x0
8010609d:	68 83 00 00 00       	push   $0x83
801060a2:	e9 77 f6 ff ff       	jmp    8010571e <alltraps>

801060a7 <vector132>:
801060a7:	6a 00                	push   $0x0
801060a9:	68 84 00 00 00       	push   $0x84
801060ae:	e9 6b f6 ff ff       	jmp    8010571e <alltraps>

801060b3 <vector133>:
801060b3:	6a 00                	push   $0x0
801060b5:	68 85 00 00 00       	push   $0x85
801060ba:	e9 5f f6 ff ff       	jmp    8010571e <alltraps>

801060bf <vector134>:
801060bf:	6a 00                	push   $0x0
801060c1:	68 86 00 00 00       	push   $0x86
801060c6:	e9 53 f6 ff ff       	jmp    8010571e <alltraps>

801060cb <vector135>:
801060cb:	6a 00                	push   $0x0
801060cd:	68 87 00 00 00       	push   $0x87
801060d2:	e9 47 f6 ff ff       	jmp    8010571e <alltraps>

801060d7 <vector136>:
801060d7:	6a 00                	push   $0x0
801060d9:	68 88 00 00 00       	push   $0x88
801060de:	e9 3b f6 ff ff       	jmp    8010571e <alltraps>

801060e3 <vector137>:
801060e3:	6a 00                	push   $0x0
801060e5:	68 89 00 00 00       	push   $0x89
801060ea:	e9 2f f6 ff ff       	jmp    8010571e <alltraps>

801060ef <vector138>:
801060ef:	6a 00                	push   $0x0
801060f1:	68 8a 00 00 00       	push   $0x8a
801060f6:	e9 23 f6 ff ff       	jmp    8010571e <alltraps>

801060fb <vector139>:
801060fb:	6a 00                	push   $0x0
801060fd:	68 8b 00 00 00       	push   $0x8b
80106102:	e9 17 f6 ff ff       	jmp    8010571e <alltraps>

80106107 <vector140>:
80106107:	6a 00                	push   $0x0
80106109:	68 8c 00 00 00       	push   $0x8c
8010610e:	e9 0b f6 ff ff       	jmp    8010571e <alltraps>

80106113 <vector141>:
80106113:	6a 00                	push   $0x0
80106115:	68 8d 00 00 00       	push   $0x8d
8010611a:	e9 ff f5 ff ff       	jmp    8010571e <alltraps>

8010611f <vector142>:
8010611f:	6a 00                	push   $0x0
80106121:	68 8e 00 00 00       	push   $0x8e
80106126:	e9 f3 f5 ff ff       	jmp    8010571e <alltraps>

8010612b <vector143>:
8010612b:	6a 00                	push   $0x0
8010612d:	68 8f 00 00 00       	push   $0x8f
80106132:	e9 e7 f5 ff ff       	jmp    8010571e <alltraps>

80106137 <vector144>:
80106137:	6a 00                	push   $0x0
80106139:	68 90 00 00 00       	push   $0x90
8010613e:	e9 db f5 ff ff       	jmp    8010571e <alltraps>

80106143 <vector145>:
80106143:	6a 00                	push   $0x0
80106145:	68 91 00 00 00       	push   $0x91
8010614a:	e9 cf f5 ff ff       	jmp    8010571e <alltraps>

8010614f <vector146>:
8010614f:	6a 00                	push   $0x0
80106151:	68 92 00 00 00       	push   $0x92
80106156:	e9 c3 f5 ff ff       	jmp    8010571e <alltraps>

8010615b <vector147>:
8010615b:	6a 00                	push   $0x0
8010615d:	68 93 00 00 00       	push   $0x93
80106162:	e9 b7 f5 ff ff       	jmp    8010571e <alltraps>

80106167 <vector148>:
80106167:	6a 00                	push   $0x0
80106169:	68 94 00 00 00       	push   $0x94
8010616e:	e9 ab f5 ff ff       	jmp    8010571e <alltraps>

80106173 <vector149>:
80106173:	6a 00                	push   $0x0
80106175:	68 95 00 00 00       	push   $0x95
8010617a:	e9 9f f5 ff ff       	jmp    8010571e <alltraps>

8010617f <vector150>:
8010617f:	6a 00                	push   $0x0
80106181:	68 96 00 00 00       	push   $0x96
80106186:	e9 93 f5 ff ff       	jmp    8010571e <alltraps>

8010618b <vector151>:
8010618b:	6a 00                	push   $0x0
8010618d:	68 97 00 00 00       	push   $0x97
80106192:	e9 87 f5 ff ff       	jmp    8010571e <alltraps>

80106197 <vector152>:
80106197:	6a 00                	push   $0x0
80106199:	68 98 00 00 00       	push   $0x98
8010619e:	e9 7b f5 ff ff       	jmp    8010571e <alltraps>

801061a3 <vector153>:
801061a3:	6a 00                	push   $0x0
801061a5:	68 99 00 00 00       	push   $0x99
801061aa:	e9 6f f5 ff ff       	jmp    8010571e <alltraps>

801061af <vector154>:
801061af:	6a 00                	push   $0x0
801061b1:	68 9a 00 00 00       	push   $0x9a
801061b6:	e9 63 f5 ff ff       	jmp    8010571e <alltraps>

801061bb <vector155>:
801061bb:	6a 00                	push   $0x0
801061bd:	68 9b 00 00 00       	push   $0x9b
801061c2:	e9 57 f5 ff ff       	jmp    8010571e <alltraps>

801061c7 <vector156>:
801061c7:	6a 00                	push   $0x0
801061c9:	68 9c 00 00 00       	push   $0x9c
801061ce:	e9 4b f5 ff ff       	jmp    8010571e <alltraps>

801061d3 <vector157>:
801061d3:	6a 00                	push   $0x0
801061d5:	68 9d 00 00 00       	push   $0x9d
801061da:	e9 3f f5 ff ff       	jmp    8010571e <alltraps>

801061df <vector158>:
801061df:	6a 00                	push   $0x0
801061e1:	68 9e 00 00 00       	push   $0x9e
801061e6:	e9 33 f5 ff ff       	jmp    8010571e <alltraps>

801061eb <vector159>:
801061eb:	6a 00                	push   $0x0
801061ed:	68 9f 00 00 00       	push   $0x9f
801061f2:	e9 27 f5 ff ff       	jmp    8010571e <alltraps>

801061f7 <vector160>:
801061f7:	6a 00                	push   $0x0
801061f9:	68 a0 00 00 00       	push   $0xa0
801061fe:	e9 1b f5 ff ff       	jmp    8010571e <alltraps>

80106203 <vector161>:
80106203:	6a 00                	push   $0x0
80106205:	68 a1 00 00 00       	push   $0xa1
8010620a:	e9 0f f5 ff ff       	jmp    8010571e <alltraps>

8010620f <vector162>:
8010620f:	6a 00                	push   $0x0
80106211:	68 a2 00 00 00       	push   $0xa2
80106216:	e9 03 f5 ff ff       	jmp    8010571e <alltraps>

8010621b <vector163>:
8010621b:	6a 00                	push   $0x0
8010621d:	68 a3 00 00 00       	push   $0xa3
80106222:	e9 f7 f4 ff ff       	jmp    8010571e <alltraps>

80106227 <vector164>:
80106227:	6a 00                	push   $0x0
80106229:	68 a4 00 00 00       	push   $0xa4
8010622e:	e9 eb f4 ff ff       	jmp    8010571e <alltraps>

80106233 <vector165>:
80106233:	6a 00                	push   $0x0
80106235:	68 a5 00 00 00       	push   $0xa5
8010623a:	e9 df f4 ff ff       	jmp    8010571e <alltraps>

8010623f <vector166>:
8010623f:	6a 00                	push   $0x0
80106241:	68 a6 00 00 00       	push   $0xa6
80106246:	e9 d3 f4 ff ff       	jmp    8010571e <alltraps>

8010624b <vector167>:
8010624b:	6a 00                	push   $0x0
8010624d:	68 a7 00 00 00       	push   $0xa7
80106252:	e9 c7 f4 ff ff       	jmp    8010571e <alltraps>

80106257 <vector168>:
80106257:	6a 00                	push   $0x0
80106259:	68 a8 00 00 00       	push   $0xa8
8010625e:	e9 bb f4 ff ff       	jmp    8010571e <alltraps>

80106263 <vector169>:
80106263:	6a 00                	push   $0x0
80106265:	68 a9 00 00 00       	push   $0xa9
8010626a:	e9 af f4 ff ff       	jmp    8010571e <alltraps>

8010626f <vector170>:
8010626f:	6a 00                	push   $0x0
80106271:	68 aa 00 00 00       	push   $0xaa
80106276:	e9 a3 f4 ff ff       	jmp    8010571e <alltraps>

8010627b <vector171>:
8010627b:	6a 00                	push   $0x0
8010627d:	68 ab 00 00 00       	push   $0xab
80106282:	e9 97 f4 ff ff       	jmp    8010571e <alltraps>

80106287 <vector172>:
80106287:	6a 00                	push   $0x0
80106289:	68 ac 00 00 00       	push   $0xac
8010628e:	e9 8b f4 ff ff       	jmp    8010571e <alltraps>

80106293 <vector173>:
80106293:	6a 00                	push   $0x0
80106295:	68 ad 00 00 00       	push   $0xad
8010629a:	e9 7f f4 ff ff       	jmp    8010571e <alltraps>

8010629f <vector174>:
8010629f:	6a 00                	push   $0x0
801062a1:	68 ae 00 00 00       	push   $0xae
801062a6:	e9 73 f4 ff ff       	jmp    8010571e <alltraps>

801062ab <vector175>:
801062ab:	6a 00                	push   $0x0
801062ad:	68 af 00 00 00       	push   $0xaf
801062b2:	e9 67 f4 ff ff       	jmp    8010571e <alltraps>

801062b7 <vector176>:
801062b7:	6a 00                	push   $0x0
801062b9:	68 b0 00 00 00       	push   $0xb0
801062be:	e9 5b f4 ff ff       	jmp    8010571e <alltraps>

801062c3 <vector177>:
801062c3:	6a 00                	push   $0x0
801062c5:	68 b1 00 00 00       	push   $0xb1
801062ca:	e9 4f f4 ff ff       	jmp    8010571e <alltraps>

801062cf <vector178>:
801062cf:	6a 00                	push   $0x0
801062d1:	68 b2 00 00 00       	push   $0xb2
801062d6:	e9 43 f4 ff ff       	jmp    8010571e <alltraps>

801062db <vector179>:
801062db:	6a 00                	push   $0x0
801062dd:	68 b3 00 00 00       	push   $0xb3
801062e2:	e9 37 f4 ff ff       	jmp    8010571e <alltraps>

801062e7 <vector180>:
801062e7:	6a 00                	push   $0x0
801062e9:	68 b4 00 00 00       	push   $0xb4
801062ee:	e9 2b f4 ff ff       	jmp    8010571e <alltraps>

801062f3 <vector181>:
801062f3:	6a 00                	push   $0x0
801062f5:	68 b5 00 00 00       	push   $0xb5
801062fa:	e9 1f f4 ff ff       	jmp    8010571e <alltraps>

801062ff <vector182>:
801062ff:	6a 00                	push   $0x0
80106301:	68 b6 00 00 00       	push   $0xb6
80106306:	e9 13 f4 ff ff       	jmp    8010571e <alltraps>

8010630b <vector183>:
8010630b:	6a 00                	push   $0x0
8010630d:	68 b7 00 00 00       	push   $0xb7
80106312:	e9 07 f4 ff ff       	jmp    8010571e <alltraps>

80106317 <vector184>:
80106317:	6a 00                	push   $0x0
80106319:	68 b8 00 00 00       	push   $0xb8
8010631e:	e9 fb f3 ff ff       	jmp    8010571e <alltraps>

80106323 <vector185>:
80106323:	6a 00                	push   $0x0
80106325:	68 b9 00 00 00       	push   $0xb9
8010632a:	e9 ef f3 ff ff       	jmp    8010571e <alltraps>

8010632f <vector186>:
8010632f:	6a 00                	push   $0x0
80106331:	68 ba 00 00 00       	push   $0xba
80106336:	e9 e3 f3 ff ff       	jmp    8010571e <alltraps>

8010633b <vector187>:
8010633b:	6a 00                	push   $0x0
8010633d:	68 bb 00 00 00       	push   $0xbb
80106342:	e9 d7 f3 ff ff       	jmp    8010571e <alltraps>

80106347 <vector188>:
80106347:	6a 00                	push   $0x0
80106349:	68 bc 00 00 00       	push   $0xbc
8010634e:	e9 cb f3 ff ff       	jmp    8010571e <alltraps>

80106353 <vector189>:
80106353:	6a 00                	push   $0x0
80106355:	68 bd 00 00 00       	push   $0xbd
8010635a:	e9 bf f3 ff ff       	jmp    8010571e <alltraps>

8010635f <vector190>:
8010635f:	6a 00                	push   $0x0
80106361:	68 be 00 00 00       	push   $0xbe
80106366:	e9 b3 f3 ff ff       	jmp    8010571e <alltraps>

8010636b <vector191>:
8010636b:	6a 00                	push   $0x0
8010636d:	68 bf 00 00 00       	push   $0xbf
80106372:	e9 a7 f3 ff ff       	jmp    8010571e <alltraps>

80106377 <vector192>:
80106377:	6a 00                	push   $0x0
80106379:	68 c0 00 00 00       	push   $0xc0
8010637e:	e9 9b f3 ff ff       	jmp    8010571e <alltraps>

80106383 <vector193>:
80106383:	6a 00                	push   $0x0
80106385:	68 c1 00 00 00       	push   $0xc1
8010638a:	e9 8f f3 ff ff       	jmp    8010571e <alltraps>

8010638f <vector194>:
8010638f:	6a 00                	push   $0x0
80106391:	68 c2 00 00 00       	push   $0xc2
80106396:	e9 83 f3 ff ff       	jmp    8010571e <alltraps>

8010639b <vector195>:
8010639b:	6a 00                	push   $0x0
8010639d:	68 c3 00 00 00       	push   $0xc3
801063a2:	e9 77 f3 ff ff       	jmp    8010571e <alltraps>

801063a7 <vector196>:
801063a7:	6a 00                	push   $0x0
801063a9:	68 c4 00 00 00       	push   $0xc4
801063ae:	e9 6b f3 ff ff       	jmp    8010571e <alltraps>

801063b3 <vector197>:
801063b3:	6a 00                	push   $0x0
801063b5:	68 c5 00 00 00       	push   $0xc5
801063ba:	e9 5f f3 ff ff       	jmp    8010571e <alltraps>

801063bf <vector198>:
801063bf:	6a 00                	push   $0x0
801063c1:	68 c6 00 00 00       	push   $0xc6
801063c6:	e9 53 f3 ff ff       	jmp    8010571e <alltraps>

801063cb <vector199>:
801063cb:	6a 00                	push   $0x0
801063cd:	68 c7 00 00 00       	push   $0xc7
801063d2:	e9 47 f3 ff ff       	jmp    8010571e <alltraps>

801063d7 <vector200>:
801063d7:	6a 00                	push   $0x0
801063d9:	68 c8 00 00 00       	push   $0xc8
801063de:	e9 3b f3 ff ff       	jmp    8010571e <alltraps>

801063e3 <vector201>:
801063e3:	6a 00                	push   $0x0
801063e5:	68 c9 00 00 00       	push   $0xc9
801063ea:	e9 2f f3 ff ff       	jmp    8010571e <alltraps>

801063ef <vector202>:
801063ef:	6a 00                	push   $0x0
801063f1:	68 ca 00 00 00       	push   $0xca
801063f6:	e9 23 f3 ff ff       	jmp    8010571e <alltraps>

801063fb <vector203>:
801063fb:	6a 00                	push   $0x0
801063fd:	68 cb 00 00 00       	push   $0xcb
80106402:	e9 17 f3 ff ff       	jmp    8010571e <alltraps>

80106407 <vector204>:
80106407:	6a 00                	push   $0x0
80106409:	68 cc 00 00 00       	push   $0xcc
8010640e:	e9 0b f3 ff ff       	jmp    8010571e <alltraps>

80106413 <vector205>:
80106413:	6a 00                	push   $0x0
80106415:	68 cd 00 00 00       	push   $0xcd
8010641a:	e9 ff f2 ff ff       	jmp    8010571e <alltraps>

8010641f <vector206>:
8010641f:	6a 00                	push   $0x0
80106421:	68 ce 00 00 00       	push   $0xce
80106426:	e9 f3 f2 ff ff       	jmp    8010571e <alltraps>

8010642b <vector207>:
8010642b:	6a 00                	push   $0x0
8010642d:	68 cf 00 00 00       	push   $0xcf
80106432:	e9 e7 f2 ff ff       	jmp    8010571e <alltraps>

80106437 <vector208>:
80106437:	6a 00                	push   $0x0
80106439:	68 d0 00 00 00       	push   $0xd0
8010643e:	e9 db f2 ff ff       	jmp    8010571e <alltraps>

80106443 <vector209>:
80106443:	6a 00                	push   $0x0
80106445:	68 d1 00 00 00       	push   $0xd1
8010644a:	e9 cf f2 ff ff       	jmp    8010571e <alltraps>

8010644f <vector210>:
8010644f:	6a 00                	push   $0x0
80106451:	68 d2 00 00 00       	push   $0xd2
80106456:	e9 c3 f2 ff ff       	jmp    8010571e <alltraps>

8010645b <vector211>:
8010645b:	6a 00                	push   $0x0
8010645d:	68 d3 00 00 00       	push   $0xd3
80106462:	e9 b7 f2 ff ff       	jmp    8010571e <alltraps>

80106467 <vector212>:
80106467:	6a 00                	push   $0x0
80106469:	68 d4 00 00 00       	push   $0xd4
8010646e:	e9 ab f2 ff ff       	jmp    8010571e <alltraps>

80106473 <vector213>:
80106473:	6a 00                	push   $0x0
80106475:	68 d5 00 00 00       	push   $0xd5
8010647a:	e9 9f f2 ff ff       	jmp    8010571e <alltraps>

8010647f <vector214>:
8010647f:	6a 00                	push   $0x0
80106481:	68 d6 00 00 00       	push   $0xd6
80106486:	e9 93 f2 ff ff       	jmp    8010571e <alltraps>

8010648b <vector215>:
8010648b:	6a 00                	push   $0x0
8010648d:	68 d7 00 00 00       	push   $0xd7
80106492:	e9 87 f2 ff ff       	jmp    8010571e <alltraps>

80106497 <vector216>:
80106497:	6a 00                	push   $0x0
80106499:	68 d8 00 00 00       	push   $0xd8
8010649e:	e9 7b f2 ff ff       	jmp    8010571e <alltraps>

801064a3 <vector217>:
801064a3:	6a 00                	push   $0x0
801064a5:	68 d9 00 00 00       	push   $0xd9
801064aa:	e9 6f f2 ff ff       	jmp    8010571e <alltraps>

801064af <vector218>:
801064af:	6a 00                	push   $0x0
801064b1:	68 da 00 00 00       	push   $0xda
801064b6:	e9 63 f2 ff ff       	jmp    8010571e <alltraps>

801064bb <vector219>:
801064bb:	6a 00                	push   $0x0
801064bd:	68 db 00 00 00       	push   $0xdb
801064c2:	e9 57 f2 ff ff       	jmp    8010571e <alltraps>

801064c7 <vector220>:
801064c7:	6a 00                	push   $0x0
801064c9:	68 dc 00 00 00       	push   $0xdc
801064ce:	e9 4b f2 ff ff       	jmp    8010571e <alltraps>

801064d3 <vector221>:
801064d3:	6a 00                	push   $0x0
801064d5:	68 dd 00 00 00       	push   $0xdd
801064da:	e9 3f f2 ff ff       	jmp    8010571e <alltraps>

801064df <vector222>:
801064df:	6a 00                	push   $0x0
801064e1:	68 de 00 00 00       	push   $0xde
801064e6:	e9 33 f2 ff ff       	jmp    8010571e <alltraps>

801064eb <vector223>:
801064eb:	6a 00                	push   $0x0
801064ed:	68 df 00 00 00       	push   $0xdf
801064f2:	e9 27 f2 ff ff       	jmp    8010571e <alltraps>

801064f7 <vector224>:
801064f7:	6a 00                	push   $0x0
801064f9:	68 e0 00 00 00       	push   $0xe0
801064fe:	e9 1b f2 ff ff       	jmp    8010571e <alltraps>

80106503 <vector225>:
80106503:	6a 00                	push   $0x0
80106505:	68 e1 00 00 00       	push   $0xe1
8010650a:	e9 0f f2 ff ff       	jmp    8010571e <alltraps>

8010650f <vector226>:
8010650f:	6a 00                	push   $0x0
80106511:	68 e2 00 00 00       	push   $0xe2
80106516:	e9 03 f2 ff ff       	jmp    8010571e <alltraps>

8010651b <vector227>:
8010651b:	6a 00                	push   $0x0
8010651d:	68 e3 00 00 00       	push   $0xe3
80106522:	e9 f7 f1 ff ff       	jmp    8010571e <alltraps>

80106527 <vector228>:
80106527:	6a 00                	push   $0x0
80106529:	68 e4 00 00 00       	push   $0xe4
8010652e:	e9 eb f1 ff ff       	jmp    8010571e <alltraps>

80106533 <vector229>:
80106533:	6a 00                	push   $0x0
80106535:	68 e5 00 00 00       	push   $0xe5
8010653a:	e9 df f1 ff ff       	jmp    8010571e <alltraps>

8010653f <vector230>:
8010653f:	6a 00                	push   $0x0
80106541:	68 e6 00 00 00       	push   $0xe6
80106546:	e9 d3 f1 ff ff       	jmp    8010571e <alltraps>

8010654b <vector231>:
8010654b:	6a 00                	push   $0x0
8010654d:	68 e7 00 00 00       	push   $0xe7
80106552:	e9 c7 f1 ff ff       	jmp    8010571e <alltraps>

80106557 <vector232>:
80106557:	6a 00                	push   $0x0
80106559:	68 e8 00 00 00       	push   $0xe8
8010655e:	e9 bb f1 ff ff       	jmp    8010571e <alltraps>

80106563 <vector233>:
80106563:	6a 00                	push   $0x0
80106565:	68 e9 00 00 00       	push   $0xe9
8010656a:	e9 af f1 ff ff       	jmp    8010571e <alltraps>

8010656f <vector234>:
8010656f:	6a 00                	push   $0x0
80106571:	68 ea 00 00 00       	push   $0xea
80106576:	e9 a3 f1 ff ff       	jmp    8010571e <alltraps>

8010657b <vector235>:
8010657b:	6a 00                	push   $0x0
8010657d:	68 eb 00 00 00       	push   $0xeb
80106582:	e9 97 f1 ff ff       	jmp    8010571e <alltraps>

80106587 <vector236>:
80106587:	6a 00                	push   $0x0
80106589:	68 ec 00 00 00       	push   $0xec
8010658e:	e9 8b f1 ff ff       	jmp    8010571e <alltraps>

80106593 <vector237>:
80106593:	6a 00                	push   $0x0
80106595:	68 ed 00 00 00       	push   $0xed
8010659a:	e9 7f f1 ff ff       	jmp    8010571e <alltraps>

8010659f <vector238>:
8010659f:	6a 00                	push   $0x0
801065a1:	68 ee 00 00 00       	push   $0xee
801065a6:	e9 73 f1 ff ff       	jmp    8010571e <alltraps>

801065ab <vector239>:
801065ab:	6a 00                	push   $0x0
801065ad:	68 ef 00 00 00       	push   $0xef
801065b2:	e9 67 f1 ff ff       	jmp    8010571e <alltraps>

801065b7 <vector240>:
801065b7:	6a 00                	push   $0x0
801065b9:	68 f0 00 00 00       	push   $0xf0
801065be:	e9 5b f1 ff ff       	jmp    8010571e <alltraps>

801065c3 <vector241>:
801065c3:	6a 00                	push   $0x0
801065c5:	68 f1 00 00 00       	push   $0xf1
801065ca:	e9 4f f1 ff ff       	jmp    8010571e <alltraps>

801065cf <vector242>:
801065cf:	6a 00                	push   $0x0
801065d1:	68 f2 00 00 00       	push   $0xf2
801065d6:	e9 43 f1 ff ff       	jmp    8010571e <alltraps>

801065db <vector243>:
801065db:	6a 00                	push   $0x0
801065dd:	68 f3 00 00 00       	push   $0xf3
801065e2:	e9 37 f1 ff ff       	jmp    8010571e <alltraps>

801065e7 <vector244>:
801065e7:	6a 00                	push   $0x0
801065e9:	68 f4 00 00 00       	push   $0xf4
801065ee:	e9 2b f1 ff ff       	jmp    8010571e <alltraps>

801065f3 <vector245>:
801065f3:	6a 00                	push   $0x0
801065f5:	68 f5 00 00 00       	push   $0xf5
801065fa:	e9 1f f1 ff ff       	jmp    8010571e <alltraps>

801065ff <vector246>:
801065ff:	6a 00                	push   $0x0
80106601:	68 f6 00 00 00       	push   $0xf6
80106606:	e9 13 f1 ff ff       	jmp    8010571e <alltraps>

8010660b <vector247>:
8010660b:	6a 00                	push   $0x0
8010660d:	68 f7 00 00 00       	push   $0xf7
80106612:	e9 07 f1 ff ff       	jmp    8010571e <alltraps>

80106617 <vector248>:
80106617:	6a 00                	push   $0x0
80106619:	68 f8 00 00 00       	push   $0xf8
8010661e:	e9 fb f0 ff ff       	jmp    8010571e <alltraps>

80106623 <vector249>:
80106623:	6a 00                	push   $0x0
80106625:	68 f9 00 00 00       	push   $0xf9
8010662a:	e9 ef f0 ff ff       	jmp    8010571e <alltraps>

8010662f <vector250>:
8010662f:	6a 00                	push   $0x0
80106631:	68 fa 00 00 00       	push   $0xfa
80106636:	e9 e3 f0 ff ff       	jmp    8010571e <alltraps>

8010663b <vector251>:
8010663b:	6a 00                	push   $0x0
8010663d:	68 fb 00 00 00       	push   $0xfb
80106642:	e9 d7 f0 ff ff       	jmp    8010571e <alltraps>

80106647 <vector252>:
80106647:	6a 00                	push   $0x0
80106649:	68 fc 00 00 00       	push   $0xfc
8010664e:	e9 cb f0 ff ff       	jmp    8010571e <alltraps>

80106653 <vector253>:
80106653:	6a 00                	push   $0x0
80106655:	68 fd 00 00 00       	push   $0xfd
8010665a:	e9 bf f0 ff ff       	jmp    8010571e <alltraps>

8010665f <vector254>:
8010665f:	6a 00                	push   $0x0
80106661:	68 fe 00 00 00       	push   $0xfe
80106666:	e9 b3 f0 ff ff       	jmp    8010571e <alltraps>

8010666b <vector255>:
8010666b:	6a 00                	push   $0x0
8010666d:	68 ff 00 00 00       	push   $0xff
80106672:	e9 a7 f0 ff ff       	jmp    8010571e <alltraps>
80106677:	66 90                	xchg   %ax,%ax
80106679:	66 90                	xchg   %ax,%ax
8010667b:	66 90                	xchg   %ax,%ax
8010667d:	66 90                	xchg   %ax,%ax
8010667f:	90                   	nop

80106680 <walkpgdir>:
80106680:	55                   	push   %ebp
80106681:	89 e5                	mov    %esp,%ebp
80106683:	57                   	push   %edi
80106684:	56                   	push   %esi
80106685:	53                   	push   %ebx
80106686:	89 d3                	mov    %edx,%ebx
80106688:	c1 ea 16             	shr    $0x16,%edx
8010668b:	8d 3c 90             	lea    (%eax,%edx,4),%edi
8010668e:	83 ec 0c             	sub    $0xc,%esp
80106691:	8b 07                	mov    (%edi),%eax
80106693:	a8 01                	test   $0x1,%al
80106695:	74 29                	je     801066c0 <walkpgdir+0x40>
80106697:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010669c:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
801066a2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801066a5:	c1 eb 0a             	shr    $0xa,%ebx
801066a8:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
801066ae:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
801066b1:	5b                   	pop    %ebx
801066b2:	5e                   	pop    %esi
801066b3:	5f                   	pop    %edi
801066b4:	5d                   	pop    %ebp
801066b5:	c3                   	ret    
801066b6:	8d 76 00             	lea    0x0(%esi),%esi
801066b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801066c0:	85 c9                	test   %ecx,%ecx
801066c2:	74 2c                	je     801066f0 <walkpgdir+0x70>
801066c4:	e8 07 be ff ff       	call   801024d0 <kalloc>
801066c9:	85 c0                	test   %eax,%eax
801066cb:	89 c6                	mov    %eax,%esi
801066cd:	74 21                	je     801066f0 <walkpgdir+0x70>
801066cf:	83 ec 04             	sub    $0x4,%esp
801066d2:	68 00 10 00 00       	push   $0x1000
801066d7:	6a 00                	push   $0x0
801066d9:	50                   	push   %eax
801066da:	e8 11 de ff ff       	call   801044f0 <memset>
801066df:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
801066e5:	83 c4 10             	add    $0x10,%esp
801066e8:	83 c8 07             	or     $0x7,%eax
801066eb:	89 07                	mov    %eax,(%edi)
801066ed:	eb b3                	jmp    801066a2 <walkpgdir+0x22>
801066ef:	90                   	nop
801066f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801066f3:	31 c0                	xor    %eax,%eax
801066f5:	5b                   	pop    %ebx
801066f6:	5e                   	pop    %esi
801066f7:	5f                   	pop    %edi
801066f8:	5d                   	pop    %ebp
801066f9:	c3                   	ret    
801066fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106700 <mappages>:
80106700:	55                   	push   %ebp
80106701:	89 e5                	mov    %esp,%ebp
80106703:	57                   	push   %edi
80106704:	56                   	push   %esi
80106705:	53                   	push   %ebx
80106706:	89 d3                	mov    %edx,%ebx
80106708:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
8010670e:	83 ec 1c             	sub    $0x1c,%esp
80106711:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106714:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106718:	8b 7d 08             	mov    0x8(%ebp),%edi
8010671b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106720:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106723:	8b 45 0c             	mov    0xc(%ebp),%eax
80106726:	29 df                	sub    %ebx,%edi
80106728:	83 c8 01             	or     $0x1,%eax
8010672b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010672e:	eb 15                	jmp    80106745 <mappages+0x45>
80106730:	f6 00 01             	testb  $0x1,(%eax)
80106733:	75 45                	jne    8010677a <mappages+0x7a>
80106735:	0b 75 dc             	or     -0x24(%ebp),%esi
80106738:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
8010673b:	89 30                	mov    %esi,(%eax)
8010673d:	74 31                	je     80106770 <mappages+0x70>
8010673f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106745:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106748:	b9 01 00 00 00       	mov    $0x1,%ecx
8010674d:	89 da                	mov    %ebx,%edx
8010674f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106752:	e8 29 ff ff ff       	call   80106680 <walkpgdir>
80106757:	85 c0                	test   %eax,%eax
80106759:	75 d5                	jne    80106730 <mappages+0x30>
8010675b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010675e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106763:	5b                   	pop    %ebx
80106764:	5e                   	pop    %esi
80106765:	5f                   	pop    %edi
80106766:	5d                   	pop    %ebp
80106767:	c3                   	ret    
80106768:	90                   	nop
80106769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106770:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106773:	31 c0                	xor    %eax,%eax
80106775:	5b                   	pop    %ebx
80106776:	5e                   	pop    %esi
80106777:	5f                   	pop    %edi
80106778:	5d                   	pop    %ebp
80106779:	c3                   	ret    
8010677a:	83 ec 0c             	sub    $0xc,%esp
8010677d:	68 48 78 10 80       	push   $0x80107848
80106782:	e8 e9 9b ff ff       	call   80100370 <panic>
80106787:	89 f6                	mov    %esi,%esi
80106789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106790 <deallocuvm.part.0>:
80106790:	55                   	push   %ebp
80106791:	89 e5                	mov    %esp,%ebp
80106793:	57                   	push   %edi
80106794:	56                   	push   %esi
80106795:	53                   	push   %ebx
80106796:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
8010679c:	89 c7                	mov    %eax,%edi
8010679e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801067a4:	83 ec 1c             	sub    $0x1c,%esp
801067a7:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801067aa:	39 d3                	cmp    %edx,%ebx
801067ac:	73 60                	jae    8010680e <deallocuvm.part.0+0x7e>
801067ae:	89 d6                	mov    %edx,%esi
801067b0:	eb 3d                	jmp    801067ef <deallocuvm.part.0+0x5f>
801067b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801067b8:	8b 10                	mov    (%eax),%edx
801067ba:	f6 c2 01             	test   $0x1,%dl
801067bd:	74 26                	je     801067e5 <deallocuvm.part.0+0x55>
801067bf:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801067c5:	74 52                	je     80106819 <deallocuvm.part.0+0x89>
801067c7:	83 ec 0c             	sub    $0xc,%esp
801067ca:	81 c2 00 00 00 80    	add    $0x80000000,%edx
801067d0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801067d3:	52                   	push   %edx
801067d4:	e8 47 bb ff ff       	call   80102320 <kfree>
801067d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801067dc:	83 c4 10             	add    $0x10,%esp
801067df:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801067e5:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801067eb:	39 f3                	cmp    %esi,%ebx
801067ed:	73 1f                	jae    8010680e <deallocuvm.part.0+0x7e>
801067ef:	31 c9                	xor    %ecx,%ecx
801067f1:	89 da                	mov    %ebx,%edx
801067f3:	89 f8                	mov    %edi,%eax
801067f5:	e8 86 fe ff ff       	call   80106680 <walkpgdir>
801067fa:	85 c0                	test   %eax,%eax
801067fc:	75 ba                	jne    801067b8 <deallocuvm.part.0+0x28>
801067fe:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
80106804:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010680a:	39 f3                	cmp    %esi,%ebx
8010680c:	72 e1                	jb     801067ef <deallocuvm.part.0+0x5f>
8010680e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106811:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106814:	5b                   	pop    %ebx
80106815:	5e                   	pop    %esi
80106816:	5f                   	pop    %edi
80106817:	5d                   	pop    %ebp
80106818:	c3                   	ret    
80106819:	83 ec 0c             	sub    $0xc,%esp
8010681c:	68 12 72 10 80       	push   $0x80107212
80106821:	e8 4a 9b ff ff       	call   80100370 <panic>
80106826:	8d 76 00             	lea    0x0(%esi),%esi
80106829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106830 <seginit>:
80106830:	55                   	push   %ebp
80106831:	89 e5                	mov    %esp,%ebp
80106833:	53                   	push   %ebx
80106834:	31 db                	xor    %ebx,%ebx
80106836:	83 ec 14             	sub    $0x14,%esp
80106839:	e8 f2 be ff ff       	call   80102730 <cpunum>
8010683e:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80106844:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106849:	8d 90 a0 27 11 80    	lea    -0x7feed860(%eax),%edx
8010684f:	c6 80 1d 28 11 80 9a 	movb   $0x9a,-0x7feed7e3(%eax)
80106856:	c6 80 1e 28 11 80 cf 	movb   $0xcf,-0x7feed7e2(%eax)
8010685d:	c6 80 25 28 11 80 92 	movb   $0x92,-0x7feed7db(%eax)
80106864:	c6 80 26 28 11 80 cf 	movb   $0xcf,-0x7feed7da(%eax)
8010686b:	66 89 4a 78          	mov    %cx,0x78(%edx)
8010686f:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106874:	66 89 5a 7a          	mov    %bx,0x7a(%edx)
80106878:	66 89 8a 80 00 00 00 	mov    %cx,0x80(%edx)
8010687f:	31 db                	xor    %ebx,%ebx
80106881:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106886:	66 89 9a 82 00 00 00 	mov    %bx,0x82(%edx)
8010688d:	66 89 8a 90 00 00 00 	mov    %cx,0x90(%edx)
80106894:	31 db                	xor    %ebx,%ebx
80106896:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
8010689b:	66 89 9a 92 00 00 00 	mov    %bx,0x92(%edx)
801068a2:	31 db                	xor    %ebx,%ebx
801068a4:	66 89 8a 98 00 00 00 	mov    %cx,0x98(%edx)
801068ab:	8d 88 54 28 11 80    	lea    -0x7feed7ac(%eax),%ecx
801068b1:	66 89 9a 9a 00 00 00 	mov    %bx,0x9a(%edx)
801068b8:	31 db                	xor    %ebx,%ebx
801068ba:	c6 80 35 28 11 80 fa 	movb   $0xfa,-0x7feed7cb(%eax)
801068c1:	c6 80 36 28 11 80 cf 	movb   $0xcf,-0x7feed7ca(%eax)
801068c8:	66 89 9a 88 00 00 00 	mov    %bx,0x88(%edx)
801068cf:	66 89 8a 8a 00 00 00 	mov    %cx,0x8a(%edx)
801068d6:	89 cb                	mov    %ecx,%ebx
801068d8:	c1 e9 18             	shr    $0x18,%ecx
801068db:	c6 80 3d 28 11 80 f2 	movb   $0xf2,-0x7feed7c3(%eax)
801068e2:	c6 80 3e 28 11 80 cf 	movb   $0xcf,-0x7feed7c2(%eax)
801068e9:	88 8a 8f 00 00 00    	mov    %cl,0x8f(%edx)
801068ef:	c6 80 2d 28 11 80 92 	movb   $0x92,-0x7feed7d3(%eax)
801068f6:	b9 37 00 00 00       	mov    $0x37,%ecx
801068fb:	c6 80 2e 28 11 80 c0 	movb   $0xc0,-0x7feed7d2(%eax)
80106902:	05 10 28 11 80       	add    $0x80112810,%eax
80106907:	66 89 4d f2          	mov    %cx,-0xe(%ebp)
8010690b:	c1 eb 10             	shr    $0x10,%ebx
8010690e:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80106912:	c1 e8 10             	shr    $0x10,%eax
80106915:	c6 42 7c 00          	movb   $0x0,0x7c(%edx)
80106919:	c6 42 7f 00          	movb   $0x0,0x7f(%edx)
8010691d:	c6 82 84 00 00 00 00 	movb   $0x0,0x84(%edx)
80106924:	c6 82 87 00 00 00 00 	movb   $0x0,0x87(%edx)
8010692b:	c6 82 94 00 00 00 00 	movb   $0x0,0x94(%edx)
80106932:	c6 82 97 00 00 00 00 	movb   $0x0,0x97(%edx)
80106939:	c6 82 9c 00 00 00 00 	movb   $0x0,0x9c(%edx)
80106940:	c6 82 9f 00 00 00 00 	movb   $0x0,0x9f(%edx)
80106947:	88 9a 8c 00 00 00    	mov    %bl,0x8c(%edx)
8010694d:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
80106951:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106954:	0f 01 10             	lgdtl  (%eax)
80106957:	b8 18 00 00 00       	mov    $0x18,%eax
8010695c:	8e e8                	mov    %eax,%gs
8010695e:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80106965:	00 00 00 00 
80106969:	65 89 15 00 00 00 00 	mov    %edx,%gs:0x0
80106970:	83 c4 14             	add    $0x14,%esp
80106973:	5b                   	pop    %ebx
80106974:	5d                   	pop    %ebp
80106975:	c3                   	ret    
80106976:	8d 76 00             	lea    0x0(%esi),%esi
80106979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106980 <setupkvm>:
80106980:	55                   	push   %ebp
80106981:	89 e5                	mov    %esp,%ebp
80106983:	56                   	push   %esi
80106984:	53                   	push   %ebx
80106985:	e8 46 bb ff ff       	call   801024d0 <kalloc>
8010698a:	85 c0                	test   %eax,%eax
8010698c:	74 52                	je     801069e0 <setupkvm+0x60>
8010698e:	83 ec 04             	sub    $0x4,%esp
80106991:	89 c6                	mov    %eax,%esi
80106993:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
80106998:	68 00 10 00 00       	push   $0x1000
8010699d:	6a 00                	push   $0x0
8010699f:	50                   	push   %eax
801069a0:	e8 4b db ff ff       	call   801044f0 <memset>
801069a5:	83 c4 10             	add    $0x10,%esp
801069a8:	8b 43 04             	mov    0x4(%ebx),%eax
801069ab:	8b 4b 08             	mov    0x8(%ebx),%ecx
801069ae:	83 ec 08             	sub    $0x8,%esp
801069b1:	8b 13                	mov    (%ebx),%edx
801069b3:	ff 73 0c             	pushl  0xc(%ebx)
801069b6:	50                   	push   %eax
801069b7:	29 c1                	sub    %eax,%ecx
801069b9:	89 f0                	mov    %esi,%eax
801069bb:	e8 40 fd ff ff       	call   80106700 <mappages>
801069c0:	83 c4 10             	add    $0x10,%esp
801069c3:	85 c0                	test   %eax,%eax
801069c5:	78 19                	js     801069e0 <setupkvm+0x60>
801069c7:	83 c3 10             	add    $0x10,%ebx
801069ca:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
801069d0:	75 d6                	jne    801069a8 <setupkvm+0x28>
801069d2:	8d 65 f8             	lea    -0x8(%ebp),%esp
801069d5:	89 f0                	mov    %esi,%eax
801069d7:	5b                   	pop    %ebx
801069d8:	5e                   	pop    %esi
801069d9:	5d                   	pop    %ebp
801069da:	c3                   	ret    
801069db:	90                   	nop
801069dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801069e0:	8d 65 f8             	lea    -0x8(%ebp),%esp
801069e3:	31 c0                	xor    %eax,%eax
801069e5:	5b                   	pop    %ebx
801069e6:	5e                   	pop    %esi
801069e7:	5d                   	pop    %ebp
801069e8:	c3                   	ret    
801069e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801069f0 <kvmalloc>:
801069f0:	55                   	push   %ebp
801069f1:	89 e5                	mov    %esp,%ebp
801069f3:	83 ec 08             	sub    $0x8,%esp
801069f6:	e8 85 ff ff ff       	call   80106980 <setupkvm>
801069fb:	a3 24 55 11 80       	mov    %eax,0x80115524
80106a00:	05 00 00 00 80       	add    $0x80000000,%eax
80106a05:	0f 22 d8             	mov    %eax,%cr3
80106a08:	c9                   	leave  
80106a09:	c3                   	ret    
80106a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106a10 <switchkvm>:
80106a10:	a1 24 55 11 80       	mov    0x80115524,%eax
80106a15:	55                   	push   %ebp
80106a16:	89 e5                	mov    %esp,%ebp
80106a18:	05 00 00 00 80       	add    $0x80000000,%eax
80106a1d:	0f 22 d8             	mov    %eax,%cr3
80106a20:	5d                   	pop    %ebp
80106a21:	c3                   	ret    
80106a22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a30 <switchuvm>:
80106a30:	55                   	push   %ebp
80106a31:	89 e5                	mov    %esp,%ebp
80106a33:	53                   	push   %ebx
80106a34:	83 ec 04             	sub    $0x4,%esp
80106a37:	8b 5d 08             	mov    0x8(%ebp),%ebx
80106a3a:	e8 e1 d9 ff ff       	call   80104420 <pushcli>
80106a3f:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80106a45:	b9 67 00 00 00       	mov    $0x67,%ecx
80106a4a:	8d 50 08             	lea    0x8(%eax),%edx
80106a4d:	66 89 88 a0 00 00 00 	mov    %cx,0xa0(%eax)
80106a54:	c6 80 a6 00 00 00 40 	movb   $0x40,0xa6(%eax)
80106a5b:	c6 80 a5 00 00 00 89 	movb   $0x89,0xa5(%eax)
80106a62:	66 89 90 a2 00 00 00 	mov    %dx,0xa2(%eax)
80106a69:	89 d1                	mov    %edx,%ecx
80106a6b:	c1 ea 18             	shr    $0x18,%edx
80106a6e:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
80106a74:	ba 10 00 00 00       	mov    $0x10,%edx
80106a79:	c1 e9 10             	shr    $0x10,%ecx
80106a7c:	66 89 50 10          	mov    %dx,0x10(%eax)
80106a80:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80106a87:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
80106a8d:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106a92:	8b 52 08             	mov    0x8(%edx),%edx
80106a95:	66 89 48 6e          	mov    %cx,0x6e(%eax)
80106a99:	81 c2 00 10 00 00    	add    $0x1000,%edx
80106a9f:	89 50 0c             	mov    %edx,0xc(%eax)
80106aa2:	b8 30 00 00 00       	mov    $0x30,%eax
80106aa7:	0f 00 d8             	ltr    %ax
80106aaa:	8b 43 04             	mov    0x4(%ebx),%eax
80106aad:	85 c0                	test   %eax,%eax
80106aaf:	74 11                	je     80106ac2 <switchuvm+0x92>
80106ab1:	05 00 00 00 80       	add    $0x80000000,%eax
80106ab6:	0f 22 d8             	mov    %eax,%cr3
80106ab9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80106abc:	c9                   	leave  
80106abd:	e9 8e d9 ff ff       	jmp    80104450 <popcli>
80106ac2:	83 ec 0c             	sub    $0xc,%esp
80106ac5:	68 4e 78 10 80       	push   $0x8010784e
80106aca:	e8 a1 98 ff ff       	call   80100370 <panic>
80106acf:	90                   	nop

80106ad0 <inituvm>:
80106ad0:	55                   	push   %ebp
80106ad1:	89 e5                	mov    %esp,%ebp
80106ad3:	57                   	push   %edi
80106ad4:	56                   	push   %esi
80106ad5:	53                   	push   %ebx
80106ad6:	83 ec 1c             	sub    $0x1c,%esp
80106ad9:	8b 75 10             	mov    0x10(%ebp),%esi
80106adc:	8b 45 08             	mov    0x8(%ebp),%eax
80106adf:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106ae2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106ae8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106aeb:	77 49                	ja     80106b36 <inituvm+0x66>
80106aed:	e8 de b9 ff ff       	call   801024d0 <kalloc>
80106af2:	83 ec 04             	sub    $0x4,%esp
80106af5:	89 c3                	mov    %eax,%ebx
80106af7:	68 00 10 00 00       	push   $0x1000
80106afc:	6a 00                	push   $0x0
80106afe:	50                   	push   %eax
80106aff:	e8 ec d9 ff ff       	call   801044f0 <memset>
80106b04:	58                   	pop    %eax
80106b05:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106b0b:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106b10:	5a                   	pop    %edx
80106b11:	6a 06                	push   $0x6
80106b13:	50                   	push   %eax
80106b14:	31 d2                	xor    %edx,%edx
80106b16:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106b19:	e8 e2 fb ff ff       	call   80106700 <mappages>
80106b1e:	89 75 10             	mov    %esi,0x10(%ebp)
80106b21:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106b24:	83 c4 10             	add    $0x10,%esp
80106b27:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106b2a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b2d:	5b                   	pop    %ebx
80106b2e:	5e                   	pop    %esi
80106b2f:	5f                   	pop    %edi
80106b30:	5d                   	pop    %ebp
80106b31:	e9 6a da ff ff       	jmp    801045a0 <memmove>
80106b36:	83 ec 0c             	sub    $0xc,%esp
80106b39:	68 62 78 10 80       	push   $0x80107862
80106b3e:	e8 2d 98 ff ff       	call   80100370 <panic>
80106b43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b50 <loaduvm>:
80106b50:	55                   	push   %ebp
80106b51:	89 e5                	mov    %esp,%ebp
80106b53:	57                   	push   %edi
80106b54:	56                   	push   %esi
80106b55:	53                   	push   %ebx
80106b56:	83 ec 0c             	sub    $0xc,%esp
80106b59:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106b60:	0f 85 91 00 00 00    	jne    80106bf7 <loaduvm+0xa7>
80106b66:	8b 75 18             	mov    0x18(%ebp),%esi
80106b69:	31 db                	xor    %ebx,%ebx
80106b6b:	85 f6                	test   %esi,%esi
80106b6d:	75 1a                	jne    80106b89 <loaduvm+0x39>
80106b6f:	eb 6f                	jmp    80106be0 <loaduvm+0x90>
80106b71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b78:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b7e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106b84:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106b87:	76 57                	jbe    80106be0 <loaduvm+0x90>
80106b89:	8b 55 0c             	mov    0xc(%ebp),%edx
80106b8c:	8b 45 08             	mov    0x8(%ebp),%eax
80106b8f:	31 c9                	xor    %ecx,%ecx
80106b91:	01 da                	add    %ebx,%edx
80106b93:	e8 e8 fa ff ff       	call   80106680 <walkpgdir>
80106b98:	85 c0                	test   %eax,%eax
80106b9a:	74 4e                	je     80106bea <loaduvm+0x9a>
80106b9c:	8b 00                	mov    (%eax),%eax
80106b9e:	8b 4d 14             	mov    0x14(%ebp),%ecx
80106ba1:	bf 00 10 00 00       	mov    $0x1000,%edi
80106ba6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106bab:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106bb1:	0f 46 fe             	cmovbe %esi,%edi
80106bb4:	01 d9                	add    %ebx,%ecx
80106bb6:	05 00 00 00 80       	add    $0x80000000,%eax
80106bbb:	57                   	push   %edi
80106bbc:	51                   	push   %ecx
80106bbd:	50                   	push   %eax
80106bbe:	ff 75 10             	pushl  0x10(%ebp)
80106bc1:	e8 aa ad ff ff       	call   80101970 <readi>
80106bc6:	83 c4 10             	add    $0x10,%esp
80106bc9:	39 c7                	cmp    %eax,%edi
80106bcb:	74 ab                	je     80106b78 <loaduvm+0x28>
80106bcd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106bd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106bd5:	5b                   	pop    %ebx
80106bd6:	5e                   	pop    %esi
80106bd7:	5f                   	pop    %edi
80106bd8:	5d                   	pop    %ebp
80106bd9:	c3                   	ret    
80106bda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106be0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106be3:	31 c0                	xor    %eax,%eax
80106be5:	5b                   	pop    %ebx
80106be6:	5e                   	pop    %esi
80106be7:	5f                   	pop    %edi
80106be8:	5d                   	pop    %ebp
80106be9:	c3                   	ret    
80106bea:	83 ec 0c             	sub    $0xc,%esp
80106bed:	68 7c 78 10 80       	push   $0x8010787c
80106bf2:	e8 79 97 ff ff       	call   80100370 <panic>
80106bf7:	83 ec 0c             	sub    $0xc,%esp
80106bfa:	68 20 79 10 80       	push   $0x80107920
80106bff:	e8 6c 97 ff ff       	call   80100370 <panic>
80106c04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106c10 <allocuvm>:
80106c10:	55                   	push   %ebp
80106c11:	89 e5                	mov    %esp,%ebp
80106c13:	57                   	push   %edi
80106c14:	56                   	push   %esi
80106c15:	53                   	push   %ebx
80106c16:	83 ec 0c             	sub    $0xc,%esp
80106c19:	8b 7d 10             	mov    0x10(%ebp),%edi
80106c1c:	85 ff                	test   %edi,%edi
80106c1e:	0f 88 ca 00 00 00    	js     80106cee <allocuvm+0xde>
80106c24:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106c27:	8b 45 0c             	mov    0xc(%ebp),%eax
80106c2a:	0f 82 82 00 00 00    	jb     80106cb2 <allocuvm+0xa2>
80106c30:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106c36:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106c3c:	39 df                	cmp    %ebx,%edi
80106c3e:	77 43                	ja     80106c83 <allocuvm+0x73>
80106c40:	e9 bb 00 00 00       	jmp    80106d00 <allocuvm+0xf0>
80106c45:	8d 76 00             	lea    0x0(%esi),%esi
80106c48:	83 ec 04             	sub    $0x4,%esp
80106c4b:	68 00 10 00 00       	push   $0x1000
80106c50:	6a 00                	push   $0x0
80106c52:	50                   	push   %eax
80106c53:	e8 98 d8 ff ff       	call   801044f0 <memset>
80106c58:	58                   	pop    %eax
80106c59:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106c5f:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106c64:	5a                   	pop    %edx
80106c65:	6a 06                	push   $0x6
80106c67:	50                   	push   %eax
80106c68:	89 da                	mov    %ebx,%edx
80106c6a:	8b 45 08             	mov    0x8(%ebp),%eax
80106c6d:	e8 8e fa ff ff       	call   80106700 <mappages>
80106c72:	83 c4 10             	add    $0x10,%esp
80106c75:	85 c0                	test   %eax,%eax
80106c77:	78 47                	js     80106cc0 <allocuvm+0xb0>
80106c79:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106c7f:	39 df                	cmp    %ebx,%edi
80106c81:	76 7d                	jbe    80106d00 <allocuvm+0xf0>
80106c83:	e8 48 b8 ff ff       	call   801024d0 <kalloc>
80106c88:	85 c0                	test   %eax,%eax
80106c8a:	89 c6                	mov    %eax,%esi
80106c8c:	75 ba                	jne    80106c48 <allocuvm+0x38>
80106c8e:	83 ec 0c             	sub    $0xc,%esp
80106c91:	68 9a 78 10 80       	push   $0x8010789a
80106c96:	e8 c5 99 ff ff       	call   80100660 <cprintf>
80106c9b:	83 c4 10             	add    $0x10,%esp
80106c9e:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106ca1:	76 4b                	jbe    80106cee <allocuvm+0xde>
80106ca3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106ca6:	8b 45 08             	mov    0x8(%ebp),%eax
80106ca9:	89 fa                	mov    %edi,%edx
80106cab:	e8 e0 fa ff ff       	call   80106790 <deallocuvm.part.0>
80106cb0:	31 c0                	xor    %eax,%eax
80106cb2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106cb5:	5b                   	pop    %ebx
80106cb6:	5e                   	pop    %esi
80106cb7:	5f                   	pop    %edi
80106cb8:	5d                   	pop    %ebp
80106cb9:	c3                   	ret    
80106cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106cc0:	83 ec 0c             	sub    $0xc,%esp
80106cc3:	68 b2 78 10 80       	push   $0x801078b2
80106cc8:	e8 93 99 ff ff       	call   80100660 <cprintf>
80106ccd:	83 c4 10             	add    $0x10,%esp
80106cd0:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106cd3:	76 0d                	jbe    80106ce2 <allocuvm+0xd2>
80106cd5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106cd8:	8b 45 08             	mov    0x8(%ebp),%eax
80106cdb:	89 fa                	mov    %edi,%edx
80106cdd:	e8 ae fa ff ff       	call   80106790 <deallocuvm.part.0>
80106ce2:	83 ec 0c             	sub    $0xc,%esp
80106ce5:	56                   	push   %esi
80106ce6:	e8 35 b6 ff ff       	call   80102320 <kfree>
80106ceb:	83 c4 10             	add    $0x10,%esp
80106cee:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106cf1:	31 c0                	xor    %eax,%eax
80106cf3:	5b                   	pop    %ebx
80106cf4:	5e                   	pop    %esi
80106cf5:	5f                   	pop    %edi
80106cf6:	5d                   	pop    %ebp
80106cf7:	c3                   	ret    
80106cf8:	90                   	nop
80106cf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d00:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d03:	89 f8                	mov    %edi,%eax
80106d05:	5b                   	pop    %ebx
80106d06:	5e                   	pop    %esi
80106d07:	5f                   	pop    %edi
80106d08:	5d                   	pop    %ebp
80106d09:	c3                   	ret    
80106d0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106d10 <deallocuvm>:
80106d10:	55                   	push   %ebp
80106d11:	89 e5                	mov    %esp,%ebp
80106d13:	8b 55 0c             	mov    0xc(%ebp),%edx
80106d16:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106d19:	8b 45 08             	mov    0x8(%ebp),%eax
80106d1c:	39 d1                	cmp    %edx,%ecx
80106d1e:	73 10                	jae    80106d30 <deallocuvm+0x20>
80106d20:	5d                   	pop    %ebp
80106d21:	e9 6a fa ff ff       	jmp    80106790 <deallocuvm.part.0>
80106d26:	8d 76 00             	lea    0x0(%esi),%esi
80106d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106d30:	89 d0                	mov    %edx,%eax
80106d32:	5d                   	pop    %ebp
80106d33:	c3                   	ret    
80106d34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106d3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106d40 <freevm>:
80106d40:	55                   	push   %ebp
80106d41:	89 e5                	mov    %esp,%ebp
80106d43:	57                   	push   %edi
80106d44:	56                   	push   %esi
80106d45:	53                   	push   %ebx
80106d46:	83 ec 0c             	sub    $0xc,%esp
80106d49:	8b 75 08             	mov    0x8(%ebp),%esi
80106d4c:	85 f6                	test   %esi,%esi
80106d4e:	74 59                	je     80106da9 <freevm+0x69>
80106d50:	31 c9                	xor    %ecx,%ecx
80106d52:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106d57:	89 f0                	mov    %esi,%eax
80106d59:	e8 32 fa ff ff       	call   80106790 <deallocuvm.part.0>
80106d5e:	89 f3                	mov    %esi,%ebx
80106d60:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106d66:	eb 0f                	jmp    80106d77 <freevm+0x37>
80106d68:	90                   	nop
80106d69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d70:	83 c3 04             	add    $0x4,%ebx
80106d73:	39 fb                	cmp    %edi,%ebx
80106d75:	74 23                	je     80106d9a <freevm+0x5a>
80106d77:	8b 03                	mov    (%ebx),%eax
80106d79:	a8 01                	test   $0x1,%al
80106d7b:	74 f3                	je     80106d70 <freevm+0x30>
80106d7d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106d82:	83 ec 0c             	sub    $0xc,%esp
80106d85:	83 c3 04             	add    $0x4,%ebx
80106d88:	05 00 00 00 80       	add    $0x80000000,%eax
80106d8d:	50                   	push   %eax
80106d8e:	e8 8d b5 ff ff       	call   80102320 <kfree>
80106d93:	83 c4 10             	add    $0x10,%esp
80106d96:	39 fb                	cmp    %edi,%ebx
80106d98:	75 dd                	jne    80106d77 <freevm+0x37>
80106d9a:	89 75 08             	mov    %esi,0x8(%ebp)
80106d9d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106da0:	5b                   	pop    %ebx
80106da1:	5e                   	pop    %esi
80106da2:	5f                   	pop    %edi
80106da3:	5d                   	pop    %ebp
80106da4:	e9 77 b5 ff ff       	jmp    80102320 <kfree>
80106da9:	83 ec 0c             	sub    $0xc,%esp
80106dac:	68 ce 78 10 80       	push   $0x801078ce
80106db1:	e8 ba 95 ff ff       	call   80100370 <panic>
80106db6:	8d 76 00             	lea    0x0(%esi),%esi
80106db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106dc0 <clearpteu>:
80106dc0:	55                   	push   %ebp
80106dc1:	31 c9                	xor    %ecx,%ecx
80106dc3:	89 e5                	mov    %esp,%ebp
80106dc5:	83 ec 08             	sub    $0x8,%esp
80106dc8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106dcb:	8b 45 08             	mov    0x8(%ebp),%eax
80106dce:	e8 ad f8 ff ff       	call   80106680 <walkpgdir>
80106dd3:	85 c0                	test   %eax,%eax
80106dd5:	74 05                	je     80106ddc <clearpteu+0x1c>
80106dd7:	83 20 fb             	andl   $0xfffffffb,(%eax)
80106dda:	c9                   	leave  
80106ddb:	c3                   	ret    
80106ddc:	83 ec 0c             	sub    $0xc,%esp
80106ddf:	68 df 78 10 80       	push   $0x801078df
80106de4:	e8 87 95 ff ff       	call   80100370 <panic>
80106de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106df0 <copyuvm>:
80106df0:	55                   	push   %ebp
80106df1:	89 e5                	mov    %esp,%ebp
80106df3:	57                   	push   %edi
80106df4:	56                   	push   %esi
80106df5:	53                   	push   %ebx
80106df6:	83 ec 1c             	sub    $0x1c,%esp
80106df9:	e8 82 fb ff ff       	call   80106980 <setupkvm>
80106dfe:	85 c0                	test   %eax,%eax
80106e00:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106e03:	0f 84 b2 00 00 00    	je     80106ebb <copyuvm+0xcb>
80106e09:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106e0c:	85 c9                	test   %ecx,%ecx
80106e0e:	0f 84 9c 00 00 00    	je     80106eb0 <copyuvm+0xc0>
80106e14:	31 f6                	xor    %esi,%esi
80106e16:	eb 4a                	jmp    80106e62 <copyuvm+0x72>
80106e18:	90                   	nop
80106e19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e20:	83 ec 04             	sub    $0x4,%esp
80106e23:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80106e29:	68 00 10 00 00       	push   $0x1000
80106e2e:	57                   	push   %edi
80106e2f:	50                   	push   %eax
80106e30:	e8 6b d7 ff ff       	call   801045a0 <memmove>
80106e35:	58                   	pop    %eax
80106e36:	5a                   	pop    %edx
80106e37:	8d 93 00 00 00 80    	lea    -0x80000000(%ebx),%edx
80106e3d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106e40:	ff 75 e4             	pushl  -0x1c(%ebp)
80106e43:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106e48:	52                   	push   %edx
80106e49:	89 f2                	mov    %esi,%edx
80106e4b:	e8 b0 f8 ff ff       	call   80106700 <mappages>
80106e50:	83 c4 10             	add    $0x10,%esp
80106e53:	85 c0                	test   %eax,%eax
80106e55:	78 3e                	js     80106e95 <copyuvm+0xa5>
80106e57:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106e5d:	39 75 0c             	cmp    %esi,0xc(%ebp)
80106e60:	76 4e                	jbe    80106eb0 <copyuvm+0xc0>
80106e62:	8b 45 08             	mov    0x8(%ebp),%eax
80106e65:	31 c9                	xor    %ecx,%ecx
80106e67:	89 f2                	mov    %esi,%edx
80106e69:	e8 12 f8 ff ff       	call   80106680 <walkpgdir>
80106e6e:	85 c0                	test   %eax,%eax
80106e70:	74 5a                	je     80106ecc <copyuvm+0xdc>
80106e72:	8b 18                	mov    (%eax),%ebx
80106e74:	f6 c3 01             	test   $0x1,%bl
80106e77:	74 46                	je     80106ebf <copyuvm+0xcf>
80106e79:	89 df                	mov    %ebx,%edi
80106e7b:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80106e81:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80106e84:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80106e8a:	e8 41 b6 ff ff       	call   801024d0 <kalloc>
80106e8f:	85 c0                	test   %eax,%eax
80106e91:	89 c3                	mov    %eax,%ebx
80106e93:	75 8b                	jne    80106e20 <copyuvm+0x30>
80106e95:	83 ec 0c             	sub    $0xc,%esp
80106e98:	ff 75 e0             	pushl  -0x20(%ebp)
80106e9b:	e8 a0 fe ff ff       	call   80106d40 <freevm>
80106ea0:	83 c4 10             	add    $0x10,%esp
80106ea3:	31 c0                	xor    %eax,%eax
80106ea5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ea8:	5b                   	pop    %ebx
80106ea9:	5e                   	pop    %esi
80106eaa:	5f                   	pop    %edi
80106eab:	5d                   	pop    %ebp
80106eac:	c3                   	ret    
80106ead:	8d 76 00             	lea    0x0(%esi),%esi
80106eb0:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106eb3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106eb6:	5b                   	pop    %ebx
80106eb7:	5e                   	pop    %esi
80106eb8:	5f                   	pop    %edi
80106eb9:	5d                   	pop    %ebp
80106eba:	c3                   	ret    
80106ebb:	31 c0                	xor    %eax,%eax
80106ebd:	eb e6                	jmp    80106ea5 <copyuvm+0xb5>
80106ebf:	83 ec 0c             	sub    $0xc,%esp
80106ec2:	68 03 79 10 80       	push   $0x80107903
80106ec7:	e8 a4 94 ff ff       	call   80100370 <panic>
80106ecc:	83 ec 0c             	sub    $0xc,%esp
80106ecf:	68 e9 78 10 80       	push   $0x801078e9
80106ed4:	e8 97 94 ff ff       	call   80100370 <panic>
80106ed9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106ee0 <uva2ka>:
80106ee0:	55                   	push   %ebp
80106ee1:	31 c9                	xor    %ecx,%ecx
80106ee3:	89 e5                	mov    %esp,%ebp
80106ee5:	83 ec 08             	sub    $0x8,%esp
80106ee8:	8b 55 0c             	mov    0xc(%ebp),%edx
80106eeb:	8b 45 08             	mov    0x8(%ebp),%eax
80106eee:	e8 8d f7 ff ff       	call   80106680 <walkpgdir>
80106ef3:	8b 00                	mov    (%eax),%eax
80106ef5:	89 c2                	mov    %eax,%edx
80106ef7:	83 e2 05             	and    $0x5,%edx
80106efa:	83 fa 05             	cmp    $0x5,%edx
80106efd:	75 11                	jne    80106f10 <uva2ka+0x30>
80106eff:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106f04:	c9                   	leave  
80106f05:	05 00 00 00 80       	add    $0x80000000,%eax
80106f0a:	c3                   	ret    
80106f0b:	90                   	nop
80106f0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106f10:	31 c0                	xor    %eax,%eax
80106f12:	c9                   	leave  
80106f13:	c3                   	ret    
80106f14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106f1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106f20 <copyout>:
80106f20:	55                   	push   %ebp
80106f21:	89 e5                	mov    %esp,%ebp
80106f23:	57                   	push   %edi
80106f24:	56                   	push   %esi
80106f25:	53                   	push   %ebx
80106f26:	83 ec 1c             	sub    $0x1c,%esp
80106f29:	8b 5d 14             	mov    0x14(%ebp),%ebx
80106f2c:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f2f:	8b 7d 10             	mov    0x10(%ebp),%edi
80106f32:	85 db                	test   %ebx,%ebx
80106f34:	75 40                	jne    80106f76 <copyout+0x56>
80106f36:	eb 70                	jmp    80106fa8 <copyout+0x88>
80106f38:	90                   	nop
80106f39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f40:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106f43:	89 f1                	mov    %esi,%ecx
80106f45:	29 d1                	sub    %edx,%ecx
80106f47:	81 c1 00 10 00 00    	add    $0x1000,%ecx
80106f4d:	39 d9                	cmp    %ebx,%ecx
80106f4f:	0f 47 cb             	cmova  %ebx,%ecx
80106f52:	29 f2                	sub    %esi,%edx
80106f54:	83 ec 04             	sub    $0x4,%esp
80106f57:	01 d0                	add    %edx,%eax
80106f59:	51                   	push   %ecx
80106f5a:	57                   	push   %edi
80106f5b:	50                   	push   %eax
80106f5c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80106f5f:	e8 3c d6 ff ff       	call   801045a0 <memmove>
80106f64:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106f67:	83 c4 10             	add    $0x10,%esp
80106f6a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
80106f70:	01 cf                	add    %ecx,%edi
80106f72:	29 cb                	sub    %ecx,%ebx
80106f74:	74 32                	je     80106fa8 <copyout+0x88>
80106f76:	89 d6                	mov    %edx,%esi
80106f78:	83 ec 08             	sub    $0x8,%esp
80106f7b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106f7e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80106f84:	56                   	push   %esi
80106f85:	ff 75 08             	pushl  0x8(%ebp)
80106f88:	e8 53 ff ff ff       	call   80106ee0 <uva2ka>
80106f8d:	83 c4 10             	add    $0x10,%esp
80106f90:	85 c0                	test   %eax,%eax
80106f92:	75 ac                	jne    80106f40 <copyout+0x20>
80106f94:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f97:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106f9c:	5b                   	pop    %ebx
80106f9d:	5e                   	pop    %esi
80106f9e:	5f                   	pop    %edi
80106f9f:	5d                   	pop    %ebp
80106fa0:	c3                   	ret    
80106fa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106fa8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106fab:	31 c0                	xor    %eax,%eax
80106fad:	5b                   	pop    %ebx
80106fae:	5e                   	pop    %esi
80106faf:	5f                   	pop    %edi
80106fb0:	5d                   	pop    %ebp
80106fb1:	c3                   	ret    
