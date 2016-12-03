
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
8010002d:	b8 20 30 10 80       	mov    $0x80103020,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb 14 b6 10 80       	mov    $0x8010b614,%ebx
  struct buf head;
} bcache;

void
binit(void)
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  struct buf *b;

  initlock(&bcache.lock, "bcache");
8010004c:	68 40 72 10 80       	push   $0x80107240
80100051:	68 e0 b5 10 80       	push   $0x8010b5e0
80100056:	e8 55 43 00 00       	call   801043b0 <initlock>

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
8010005b:	c7 05 2c fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd2c
80100062:	fc 10 80 
  bcache.head.next = &bcache.head;
80100065:	c7 05 30 fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd30
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba dc fc 10 80       	mov    $0x8010fcdc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008b:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 47 72 10 80       	push   $0x80107247
80100097:	50                   	push   %eax
80100098:	e8 03 42 00 00       	call   801042a0 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 30 fd 10 80       	mov    0x8010fd30,%eax

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
801000b0:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	3d dc fc 10 80       	cmp    $0x8010fcdc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
}
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
static struct buf*
bget(uint dev, uint blockno)
{
  struct buf *b;

  acquire(&bcache.lock);
801000df:	68 e0 b5 10 80       	push   $0x8010b5e0
801000e4:	e8 e7 42 00 00       	call   801043d0 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d 30 fd 10 80    	mov    0x8010fd30,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  // Not cached; recycle some unused buffer and clean buffer
  // "clean" because B_DIRTY and not locked means log.c
  // hasn't yet committed the changes to the buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 2c fd 10 80    	mov    0x8010fd2c,%ebx
80100126:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 e0 b5 10 80       	push   $0x8010b5e0
80100162:	e8 49 44 00 00       	call   801045b0 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 6e 41 00 00       	call   801042e0 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
bread(uint dev, uint blockno)
{
  struct buf *b;

  b = bget(dev, blockno);
  if(!(b->flags & B_VALID)) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
    iderw(b);
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 9d 20 00 00       	call   80102220 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
  }
  return b;
}
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
      release(&bcache.lock);
      acquiresleep(&b->lock);
      return b;
    }
  }
  panic("bget: no buffers");
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 4e 72 10 80       	push   $0x8010724e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
}

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 cd 41 00 00       	call   80104380 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
  b->flags |= B_DIRTY;
  iderw(b);
801001c4:	e9 57 20 00 00       	jmp    80102220 <iderw>
// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 5f 72 10 80       	push   $0x8010725f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 8c 41 00 00       	call   80104380 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 3c 41 00 00       	call   80104340 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
8010020b:	e8 c0 41 00 00       	call   801043d0 <acquire>
  b->refcnt--;
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
  if (b->refcnt == 0) {
80100213:	83 c4 10             	add    $0x10,%esp
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
80100216:	83 e8 01             	sub    $0x1,%eax
  if (b->refcnt == 0) {
80100219:	85 c0                	test   %eax,%eax
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100232:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
    b->prev = &bcache.head;
80100237:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
  b->refcnt--;
  if (b->refcnt == 0) {
    // no one is waiting for it.
    b->next->prev = b->prev;
    b->prev->next = b->next;
    b->next = bcache.head.next;
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
80100241:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100249:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
  }
  
  release(&bcache.lock);
8010024f:	c7 45 08 e0 b5 10 80 	movl   $0x8010b5e0,0x8(%ebp)
}
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
  
  release(&bcache.lock);
8010025c:	e9 4f 43 00 00       	jmp    801045b0 <release>
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 66 72 10 80       	push   $0x80107266
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	57                   	push   %edi
80100280:	e8 0b 16 00 00       	call   80101890 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 3f 41 00 00       	call   801043d0 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
    while(input.r == input.w){
801002a1:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002a6:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
      if(proc->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 a5 10 80       	push   $0x8010a520
801002b8:	68 c0 ff 10 80       	push   $0x8010ffc0
801002bd:	e8 7e 3c 00 00       	call   80103f40 <sleep>

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
801002c2:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
      if(proc->killed){
801002d2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801002d8:	8b 40 24             	mov    0x24(%eax),%eax
801002db:	85 c0                	test   %eax,%eax
801002dd:	74 d1                	je     801002b0 <consoleread+0x40>
        release(&cons.lock);
801002df:	83 ec 0c             	sub    $0xc,%esp
801002e2:	68 20 a5 10 80       	push   $0x8010a520
801002e7:	e8 c4 42 00 00       	call   801045b0 <release>
        ilock(ip);
801002ec:	89 3c 24             	mov    %edi,(%esp)
801002ef:	e8 bc 14 00 00       	call   801017b0 <ilock>
        return -1;
801002f4:	83 c4 10             	add    $0x10,%esp
801002f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002ff:	5b                   	pop    %ebx
80100300:	5e                   	pop    %esi
80100301:	5f                   	pop    %edi
80100302:	5d                   	pop    %ebp
80100303:	c3                   	ret    
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 c0 ff 10 80    	mov    %edx,0x8010ffc0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 40 ff 10 80 	movsbl -0x7fef00c0(%edx),%edx
    if(c == C('D')){  // EOF
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
80100322:	83 c6 01             	add    $0x1,%esi
    --n;
80100325:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
80100328:	83 fa 0a             	cmp    $0xa,%edx
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
    --n;
    if(c == '\n')
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
  int c;

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&cons.lock);
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 a5 10 80       	push   $0x8010a520
80100346:	e8 65 42 00 00       	call   801045b0 <release>
  ilock(ip);
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 5d 14 00 00       	call   801017b0 <ilock>

  return target - n;
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a1                	jmp    801002fc <consoleread+0x8c>
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
80100360:	a3 c0 ff 10 80       	mov    %eax,0x8010ffc0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
    release(&cons.lock);
}

void
panic(char *s)
{
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 38             	sub    $0x38,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100378:	fa                   	cli    
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
80100379:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
{
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
8010037f:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100386:	00 00 00 
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
80100389:	8d 5d d0             	lea    -0x30(%ebp),%ebx
8010038c:	8d 75 f8             	lea    -0x8(%ebp),%esi
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
8010038f:	0f b6 00             	movzbl (%eax),%eax
80100392:	50                   	push   %eax
80100393:	68 6d 72 10 80       	push   $0x8010726d
80100398:	e8 c3 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
8010039d:	58                   	pop    %eax
8010039e:	ff 75 08             	pushl  0x8(%ebp)
801003a1:	e8 ba 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003a6:	c7 04 24 66 77 10 80 	movl   $0x80107766,(%esp)
801003ad:	e8 ae 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003b2:	5a                   	pop    %edx
801003b3:	8d 45 08             	lea    0x8(%ebp),%eax
801003b6:	59                   	pop    %ecx
801003b7:	53                   	push   %ebx
801003b8:	50                   	push   %eax
801003b9:	e8 e2 40 00 00       	call   801044a0 <getcallerpcs>
801003be:	83 c4 10             	add    $0x10,%esp
801003c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
801003c8:	83 ec 08             	sub    $0x8,%esp
801003cb:	ff 33                	pushl  (%ebx)
801003cd:	83 c3 04             	add    $0x4,%ebx
801003d0:	68 89 72 10 80       	push   $0x80107289
801003d5:	e8 86 02 00 00       	call   80100660 <cprintf>
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
801003da:	83 c4 10             	add    $0x10,%esp
801003dd:	39 f3                	cmp    %esi,%ebx
801003df:	75 e7                	jne    801003c8 <panic+0x58>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
801003e1:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003e8:	00 00 00 
801003eb:	eb fe                	jmp    801003eb <panic+0x7b>
801003ed:	8d 76 00             	lea    0x0(%esi),%esi

801003f0 <consputc>:
}

void
consputc(int c)
{
  if(panicked){
801003f0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
  crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
{
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
    cli();
    for(;;)
      ;
  }

  if(c == BACKSPACE){
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 11 5a 00 00       	call   80105e30 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
{
  int pos;

  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
  pos = inb(CRTPORT+1) << 8;
80100437:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c1                	mov    %eax,%ecx
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100447:	89 f2                	mov    %esi,%edx
80100449:	ec                   	in     (%dx),%al
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 c8                	or     %ecx,%eax

  if(c == '\n')
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 

  if(pos < 0 || pos > 25*80)
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
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

  outb(CRTPORT, 14);
  outb(CRTPORT+1, pos>>8);
  outb(CRTPORT, 15);
  outb(CRTPORT+1, pos);
  crt[pos] = ' ' | 0x0700;
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 01             	mov    %ax,(%ecx)
  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
  cgaputc(c);
}
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
    for(;;)
      ;
  }

  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 58 59 00 00       	call   80105e30 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 4c 59 00 00       	call   80105e30 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 40 59 00 00       	call   80105e30 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f8:	83 ec 04             	sub    $0x4,%esp
    pos -= 80;
801004fb:	8d 5f b0             	lea    -0x50(%edi),%ebx

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004fe:	68 60 0e 00 00       	push   $0xe60
80100503:	68 a0 80 0b 80       	push   $0x800b80a0
80100508:	68 00 80 0b 80       	push   $0x800b8000
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8010050d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100514:	e8 97 41 00 00       	call   801046b0 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 d2 40 00 00       	call   80104600 <memset>
8010052e:	89 f1                	mov    %esi,%ecx
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	be 07 00 00 00       	mov    $0x7,%esi
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 8d 72 10 80       	push   $0x8010728d
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
    if(pos > 0) --pos;
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
8010055a:	31 db                	xor    %ebx,%ebx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
  pos = inb(CRTPORT+1) << 8;
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
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
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 2c             	sub    $0x2c,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
8010058b:	85 c9                	test   %ecx,%ecx
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
80100590:	74 0c                	je     8010059e <printint+0x1e>
80100592:	89 c7                	mov    %eax,%edi
80100594:	c1 ef 1f             	shr    $0x1f,%edi
80100597:	85 c0                	test   %eax,%eax
80100599:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010059c:	78 51                	js     801005ef <printint+0x6f>
    x = -xx;
  else
    x = xx;

  i = 0;
8010059e:	31 ff                	xor    %edi,%edi
801005a0:	8d 5d d7             	lea    -0x29(%ebp),%ebx
801005a3:	eb 05                	jmp    801005aa <printint+0x2a>
801005a5:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
801005a8:	89 cf                	mov    %ecx,%edi
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 4f 01             	lea    0x1(%edi),%ecx
801005af:	f7 f6                	div    %esi
801005b1:	0f b6 92 b8 72 10 80 	movzbl -0x7fef8d48(%edx),%edx
  }while((x /= base) != 0);
801005b8:	85 c0                	test   %eax,%eax
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
801005ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
801005bd:	75 e9                	jne    801005a8 <printint+0x28>

  if(sign)
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
    buf[i++] = '-';
801005c6:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005cb:	8d 4f 02             	lea    0x2(%edi),%ecx
801005ce:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  while(--i >= 0)
    consputc(buf[i]);
801005d8:	0f be 06             	movsbl (%esi),%eax
801005db:	83 ee 01             	sub    $0x1,%esi
801005de:	e8 0d fe ff ff       	call   801003f0 <consputc>
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
801005e3:	39 de                	cmp    %ebx,%esi
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
    consputc(buf[i]);
}
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    x = -xx;
801005ef:	f7 d8                	neg    %eax
801005f1:	eb ab                	jmp    8010059e <printint+0x1e>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
80100609:	ff 75 08             	pushl  0x8(%ebp)
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
8010060f:	e8 7c 12 00 00       	call   80101890 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 b0 3d 00 00       	call   801043d0 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
  for(i = 0; i < n; i++)
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
    consputc(buf[i] & 0xff);
  release(&cons.lock);
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 64 3f 00 00       	call   801045b0 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 5b 11 00 00       	call   801017b0 <ilock>

  return n;
}
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
  if(locking)
8010066e:	85 c0                	test   %eax,%eax
{
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
    acquire(&cons.lock);

  if (fmt == 0)
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c != '%'){
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
    if(c == 0)
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
      break;
    switch(c){
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 a5 fe ff ff       	call   80100580 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
    if(c != '%'){
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
801006ee:	e8 fd fc ff ff       	call   801003f0 <consputc>

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
      consputc(c);
      break;
    }
  }

  if(locking)
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
    release(&cons.lock);
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 20 a5 10 80       	push   $0x8010a520
8010070d:	e8 9e 3e 00 00       	call   801045b0 <release>
80100712:	83 c4 10             	add    $0x10,%esp
}
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 42 fe ff ff       	call   80100580 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
      break;
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case '%':
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 9b fc ff ff       	call   801003f0 <consputc>
      consputc(c);
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 91 fc ff ff       	call   801003f0 <consputc>
      break;
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 7e fc ff ff       	call   801003f0 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        s = "(null)";
80100788:	b8 a0 72 10 80       	mov    $0x801072a0,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
      for(; *s; s++)
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
        consputc(*s);
801007a3:	e8 48 fc ff ff       	call   801003f0 <consputc>
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 20 a5 10 80       	push   $0x8010a520
801007c8:	e8 03 3c 00 00       	call   801043d0 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>

  if (fmt == 0)
    panic("null fmt");
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 a7 72 10 80       	push   $0x801072a7
801007dd:	e8 8e fb ff ff       	call   80100370 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	57                   	push   %edi
801007f4:	56                   	push   %esi
801007f5:	53                   	push   %ebx
  int c, doprocdump = 0;
801007f6:	31 f6                	xor    %esi,%esi

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f8:	83 ec 18             	sub    $0x18,%esp
801007fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int c, doprocdump = 0;

  acquire(&cons.lock);
801007fe:	68 20 a5 10 80       	push   $0x8010a520
80100803:	e8 c8 3b 00 00       	call   801043d0 <acquire>
  while((c = getc()) >= 0){
80100808:	83 c4 10             	add    $0x10,%esp
8010080b:	90                   	nop
8010080c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100810:	ff d3                	call   *%ebx
80100812:	85 c0                	test   %eax,%eax
80100814:	89 c7                	mov    %eax,%edi
80100816:	78 48                	js     80100860 <consoleintr+0x70>
    switch(c){
80100818:	83 ff 10             	cmp    $0x10,%edi
8010081b:	0f 84 3f 01 00 00    	je     80100960 <consoleintr+0x170>
80100821:	7e 5d                	jle    80100880 <consoleintr+0x90>
80100823:	83 ff 15             	cmp    $0x15,%edi
80100826:	0f 84 dc 00 00 00    	je     80100908 <consoleintr+0x118>
8010082c:	83 ff 7f             	cmp    $0x7f,%edi
8010082f:	75 54                	jne    80100885 <consoleintr+0x95>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
80100831:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100836:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010083c:	74 d2                	je     80100810 <consoleintr+0x20>
        input.e--;
8010083e:	83 e8 01             	sub    $0x1,%eax
80100841:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(BACKSPACE);
80100846:	b8 00 01 00 00       	mov    $0x100,%eax
8010084b:	e8 a0 fb ff ff       	call   801003f0 <consputc>
consoleintr(int (*getc)(void))
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
80100850:	ff d3                	call   *%ebx
80100852:	85 c0                	test   %eax,%eax
80100854:	89 c7                	mov    %eax,%edi
80100856:	79 c0                	jns    80100818 <consoleintr+0x28>
80100858:	90                   	nop
80100859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        }
      }
      break;
    }
  }
  release(&cons.lock);
80100860:	83 ec 0c             	sub    $0xc,%esp
80100863:	68 20 a5 10 80       	push   $0x8010a520
80100868:	e8 43 3d 00 00       	call   801045b0 <release>
  if(doprocdump) {
8010086d:	83 c4 10             	add    $0x10,%esp
80100870:	85 f6                	test   %esi,%esi
80100872:	0f 85 f8 00 00 00    	jne    80100970 <consoleintr+0x180>
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100878:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087b:	5b                   	pop    %ebx
8010087c:	5e                   	pop    %esi
8010087d:	5f                   	pop    %edi
8010087e:	5d                   	pop    %ebp
8010087f:	c3                   	ret    
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
80100880:	83 ff 08             	cmp    $0x8,%edi
80100883:	74 ac                	je     80100831 <consoleintr+0x41>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100885:	85 ff                	test   %edi,%edi
80100887:	74 87                	je     80100810 <consoleintr+0x20>
80100889:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	2b 15 c0 ff 10 80    	sub    0x8010ffc0,%edx
80100896:	83 fa 7f             	cmp    $0x7f,%edx
80100899:	0f 87 71 ff ff ff    	ja     80100810 <consoleintr+0x20>
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010089f:	8d 50 01             	lea    0x1(%eax),%edx
801008a2:	83 e0 7f             	and    $0x7f,%eax
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008a5:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
801008a8:	89 15 c8 ff 10 80    	mov    %edx,0x8010ffc8
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008ae:	0f 84 c8 00 00 00    	je     8010097c <consoleintr+0x18c>
        input.buf[input.e++ % INPUT_BUF] = c;
801008b4:	89 f9                	mov    %edi,%ecx
801008b6:	88 88 40 ff 10 80    	mov    %cl,-0x7fef00c0(%eax)
        consputc(c);
801008bc:	89 f8                	mov    %edi,%eax
801008be:	e8 2d fb ff ff       	call   801003f0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008c3:	83 ff 0a             	cmp    $0xa,%edi
801008c6:	0f 84 c1 00 00 00    	je     8010098d <consoleintr+0x19d>
801008cc:	83 ff 04             	cmp    $0x4,%edi
801008cf:	0f 84 b8 00 00 00    	je     8010098d <consoleintr+0x19d>
801008d5:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801008da:	83 e8 80             	sub    $0xffffff80,%eax
801008dd:	39 05 c8 ff 10 80    	cmp    %eax,0x8010ffc8
801008e3:	0f 85 27 ff ff ff    	jne    80100810 <consoleintr+0x20>
          input.w = input.e;
          wakeup(&input.r);
801008e9:	83 ec 0c             	sub    $0xc,%esp
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
        consputc(c);
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
          input.w = input.e;
801008ec:	a3 c4 ff 10 80       	mov    %eax,0x8010ffc4
          wakeup(&input.r);
801008f1:	68 c0 ff 10 80       	push   $0x8010ffc0
801008f6:	e8 f5 37 00 00       	call   801040f0 <wakeup>
801008fb:	83 c4 10             	add    $0x10,%esp
801008fe:	e9 0d ff ff ff       	jmp    80100810 <consoleintr+0x20>
80100903:	90                   	nop
80100904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100908:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010090d:	39 05 c4 ff 10 80    	cmp    %eax,0x8010ffc4
80100913:	75 2b                	jne    80100940 <consoleintr+0x150>
80100915:	e9 f6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
80100920:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(BACKSPACE);
80100925:	b8 00 01 00 00       	mov    $0x100,%eax
8010092a:	e8 c1 fa ff ff       	call   801003f0 <consputc>
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
8010092f:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100934:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010093a:	0f 84 d0 fe ff ff    	je     80100810 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100940:	83 e8 01             	sub    $0x1,%eax
80100943:	89 c2                	mov    %eax,%edx
80100945:	83 e2 7f             	and    $0x7f,%edx
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100948:	80 ba 40 ff 10 80 0a 	cmpb   $0xa,-0x7fef00c0(%edx)
8010094f:	75 cf                	jne    80100920 <consoleintr+0x130>
80100951:	e9 ba fe ff ff       	jmp    80100810 <consoleintr+0x20>
80100956:	8d 76 00             	lea    0x0(%esi),%esi
80100959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 a6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
      break;
    }
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
80100977:	e9 64 38 00 00       	jmp    801041e0 <procdump>
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010097c:	c6 80 40 ff 10 80 0a 	movb   $0xa,-0x7fef00c0(%eax)
        consputc(c);
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 63 fa ff ff       	call   801003f0 <consputc>
8010098d:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100992:	e9 52 ff ff ff       	jmp    801008e9 <consoleintr+0xf9>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:
  return n;
}

void
consoleinit(void)
{
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
801009a6:	68 b0 72 10 80       	push   $0x801072b0
801009ab:	68 20 a5 10 80       	push   $0x8010a520
801009b0:	e8 fb 39 00 00       	call   801043b0 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  picenable(IRQ_KBD);
801009b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
void
consoleinit(void)
{
  initlock(&cons.lock, "console");

  devsw[CONSOLE].write = consolewrite;
801009bc:	c7 05 8c 09 11 80 00 	movl   $0x80100600,0x8011098c
801009c3:	06 10 80 
  devsw[CONSOLE].read = consoleread;
801009c6:	c7 05 88 09 11 80 70 	movl   $0x80100270,0x80110988
801009cd:	02 10 80 
  cons.locking = 1;
801009d0:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009d7:	00 00 00 

  picenable(IRQ_KBD);
801009da:	e8 01 2a 00 00       	call   801033e0 <picenable>
  ioapicenable(IRQ_KBD, 0);
801009df:	58                   	pop    %eax
801009e0:	5a                   	pop    %edx
801009e1:	6a 00                	push   $0x0
801009e3:	6a 01                	push   $0x1
801009e5:	e8 f6 19 00 00       	call   801023e0 <ioapicenable>
}
801009ea:	83 c4 10             	add    $0x10,%esp
801009ed:	c9                   	leave  
801009ee:	c3                   	ret    
801009ef:	90                   	nop

801009f0 <exitf>:
/* assembly function to push exit syscall to stack */
/***************************************************/

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
/***************************************************/


int
exec(char *path, char **argv)
{
80100a10:	55                   	push   %ebp
    /* exit syscall size (byte) */
  int exitsz = (int)exec - (int)exitf;
  pde_t *pgdir, *oldpgdir;


char newOpPath[1024]={'\0'};
80100a11:	31 c0                	xor    %eax,%eax
80100a13:	b9 00 01 00 00       	mov    $0x100,%ecx
/***************************************************/


int
exec(char *path, char **argv)
{
80100a18:	89 e5                	mov    %esp,%ebp
80100a1a:	57                   	push   %edi
80100a1b:	56                   	push   %esi
80100a1c:	53                   	push   %ebx
    /* exit syscall size (byte) */
  int exitsz = (int)exec - (int)exitf;
  pde_t *pgdir, *oldpgdir;


char newOpPath[1024]={'\0'};
80100a1d:	8d bd e8 fb ff ff    	lea    -0x418(%ebp),%edi
/***************************************************/


int
exec(char *path, char **argv)
{
80100a23:	81 ec 1c 05 00 00    	sub    $0x51c,%esp
80100a29:	8b 75 08             	mov    0x8(%ebp),%esi
    /* exit syscall size (byte) */
  int exitsz = (int)exec - (int)exitf;
  pde_t *pgdir, *oldpgdir;


char newOpPath[1024]={'\0'};
80100a2c:	f3 ab                	rep stos %eax,%es:(%edi)
int j;
begin_op();
80100a2e:	e8 dd 22 00 00       	call   80102d10 <begin_op>
80100a33:	c7 85 f4 fa ff ff 00 	movl   $0x0,-0x50c(%ebp)
80100a3a:	00 00 00 
80100a3d:	c7 85 f0 fa ff ff 00 	movl   $0x0,-0x510(%ebp)
80100a44:	00 00 00 
80100a47:	8b 85 f4 fa ff ff    	mov    -0x50c(%ebp),%eax
/***************************************************/


int
exec(char *path, char **argv)
{
80100a4d:	31 db                	xor    %ebx,%ebx
80100a4f:	89 75 08             	mov    %esi,0x8(%ebp)
80100a52:	89 de                	mov    %ebx,%esi
80100a54:	8d b8 a0 2d 11 80    	lea    -0x7feed260(%eax),%edi
80100a5a:	89 c3                	mov    %eax,%ebx
80100a5c:	eb 14                	jmp    80100a72 <exec+0x62>
80100a5e:	66 90                	xchg   %ax,%ax
int found=0;


while(n<10 && found==0){
  for(j=0;j<strlen(gPath[n]);j++){
    newOpPath[j]=(gPath[n])[j];
80100a60:	0f b6 84 33 a0 2d 11 	movzbl -0x7feed260(%ebx,%esi,1),%eax
80100a67:	80 
80100a68:	88 84 35 e8 fb ff ff 	mov    %al,-0x418(%ebp,%esi,1)
int Failed=0;
int found=0;


while(n<10 && found==0){
  for(j=0;j<strlen(gPath[n]);j++){
80100a6f:	83 c6 01             	add    $0x1,%esi
80100a72:	83 ec 0c             	sub    $0xc,%esp
80100a75:	57                   	push   %edi
80100a76:	e8 c5 3d 00 00       	call   80104840 <strlen>
80100a7b:	83 c4 10             	add    $0x10,%esp
80100a7e:	39 c6                	cmp    %eax,%esi
80100a80:	7c de                	jl     80100a60 <exec+0x50>
    newOpPath[j]=(gPath[n])[j];

  } 
  for(int k=j;(k-j)<strlen(path);k++){
      newOpPath[k]=path[k-j];
80100a82:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
80100a88:	89 f3                	mov    %esi,%ebx
80100a8a:	31 ff                	xor    %edi,%edi
80100a8c:	8b 75 08             	mov    0x8(%ebp),%esi
80100a8f:	01 c3                	add    %eax,%ebx
80100a91:	eb 0f                	jmp    80100aa2 <exec+0x92>
80100a93:	90                   	nop
80100a94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100a98:	0f b6 04 3e          	movzbl (%esi,%edi,1),%eax
80100a9c:	88 04 3b             	mov    %al,(%ebx,%edi,1)
80100a9f:	83 c7 01             	add    $0x1,%edi
while(n<10 && found==0){
  for(j=0;j<strlen(gPath[n]);j++){
    newOpPath[j]=(gPath[n])[j];

  } 
  for(int k=j;(k-j)<strlen(path);k++){
80100aa2:	83 ec 0c             	sub    $0xc,%esp
80100aa5:	56                   	push   %esi
80100aa6:	e8 95 3d 00 00       	call   80104840 <strlen>
80100aab:	83 c4 10             	add    $0x10,%esp
80100aae:	39 c7                	cmp    %eax,%edi
80100ab0:	7c e6                	jl     80100a98 <exec+0x88>
      newOpPath[k]=path[k-j];
  }   

  if((ip = namei(newOpPath)) == 0){  //operate failed
80100ab2:	8d 85 e8 fb ff ff    	lea    -0x418(%ebp),%eax
80100ab8:	83 ec 0c             	sub    $0xc,%esp
80100abb:	50                   	push   %eax
80100abc:	e8 1f 15 00 00       	call   80101fe0 <namei>
80100ac1:	83 c4 10             	add    $0x10,%esp
80100ac4:	85 c0                	test   %eax,%eax
80100ac6:	74 4e                	je     80100b16 <exec+0x106>
}
 if(Failed==10){   //failed 10 times
    end_op();
    return -1;
}
  ilock(ip);
80100ac8:	83 ec 0c             	sub    $0xc,%esp
80100acb:	89 c3                	mov    %eax,%ebx
80100acd:	50                   	push   %eax
80100ace:	e8 dd 0c 00 00       	call   801017b0 <ilock>
  pgdir = 0;
*/


  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
80100ad3:	8d 85 24 fb ff ff    	lea    -0x4dc(%ebp),%eax
80100ad9:	6a 34                	push   $0x34
80100adb:	6a 00                	push   $0x0
80100add:	50                   	push   %eax
80100ade:	53                   	push   %ebx
80100adf:	e8 8c 0f 00 00       	call   80101a70 <readi>
80100ae4:	83 c4 20             	add    $0x20,%esp
80100ae7:	83 f8 33             	cmp    $0x33,%eax
80100aea:	76 0c                	jbe    80100af8 <exec+0xe8>
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100aec:	81 bd 24 fb ff ff 7f 	cmpl   $0x464c457f,-0x4dc(%ebp)
80100af3:	45 4c 46 
80100af6:	74 50                	je     80100b48 <exec+0x138>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100af8:	83 ec 0c             	sub    $0xc,%esp
80100afb:	53                   	push   %ebx
80100afc:	e8 1f 0f 00 00       	call   80101a20 <iunlockput>
    end_op();
80100b01:	e8 7a 22 00 00       	call   80102d80 <end_op>
80100b06:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100b09:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100b0e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100b11:	5b                   	pop    %ebx
80100b12:	5e                   	pop    %esi
80100b13:	5f                   	pop    %edi
80100b14:	5d                   	pop    %ebp
80100b15:	c3                   	ret    
  for(int k=j;(k-j)<strlen(path);k++){
      newOpPath[k]=path[k-j];
  }   

  if((ip = namei(newOpPath)) == 0){  //operate failed
     Failed++;
80100b16:	83 85 f0 fa ff ff 01 	addl   $0x1,-0x510(%ebp)
80100b1d:	81 85 f4 fa ff ff e8 	addl   $0x3e8,-0x50c(%ebp)
80100b24:	03 00 00 
80100b27:	8b 85 f0 fa ff ff    	mov    -0x510(%ebp),%eax
int n=0;
int Failed=0;
int found=0;


while(n<10 && found==0){
80100b2d:	83 f8 0a             	cmp    $0xa,%eax
80100b30:	0f 85 11 ff ff ff    	jne    80100a47 <exec+0x37>
    found=1;
   }	
  n++;
}
 if(Failed==10){   //failed 10 times
    end_op();
80100b36:	e8 45 22 00 00       	call   80102d80 <end_op>
    return -1;
80100b3b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100b40:	eb cc                	jmp    80100b0e <exec+0xfe>
80100b42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
    goto bad;
  if(elf.magic != ELF_MAGIC)
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100b48:	e8 a3 60 00 00       	call   80106bf0 <setupkvm>
80100b4d:	85 c0                	test   %eax,%eax
80100b4f:	89 85 f4 fa ff ff    	mov    %eax,-0x50c(%ebp)
80100b55:	74 a1                	je     80100af8 <exec+0xe8>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100b57:	66 83 bd 50 fb ff ff 	cmpw   $0x0,-0x4b0(%ebp)
80100b5e:	00 
80100b5f:	8b 85 40 fb ff ff    	mov    -0x4c0(%ebp),%eax
80100b65:	89 85 ec fa ff ff    	mov    %eax,-0x514(%ebp)
80100b6b:	0f 84 e0 00 00 00    	je     80100c51 <exec+0x241>
80100b71:	31 ff                	xor    %edi,%edi
80100b73:	c7 85 f0 fa ff ff 00 	movl   $0x0,-0x510(%ebp)
80100b7a:	00 00 00 
80100b7d:	eb 23                	jmp    80100ba2 <exec+0x192>
80100b7f:	83 85 f0 fa ff ff 01 	addl   $0x1,-0x510(%ebp)
80100b86:	0f b7 85 50 fb ff ff 	movzwl -0x4b0(%ebp),%eax
80100b8d:	8b 8d f0 fa ff ff    	mov    -0x510(%ebp),%ecx
80100b93:	83 85 ec fa ff ff 20 	addl   $0x20,-0x514(%ebp)
80100b9a:	39 c8                	cmp    %ecx,%eax
80100b9c:	0f 8e ed 00 00 00    	jle    80100c8f <exec+0x27f>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100ba2:	8d 85 04 fb ff ff    	lea    -0x4fc(%ebp),%eax
80100ba8:	6a 20                	push   $0x20
80100baa:	ff b5 ec fa ff ff    	pushl  -0x514(%ebp)
80100bb0:	50                   	push   %eax
80100bb1:	53                   	push   %ebx
80100bb2:	e8 b9 0e 00 00       	call   80101a70 <readi>
80100bb7:	83 c4 10             	add    $0x10,%esp
80100bba:	83 f8 20             	cmp    $0x20,%eax
80100bbd:	75 6c                	jne    80100c2b <exec+0x21b>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100bbf:	83 bd 04 fb ff ff 01 	cmpl   $0x1,-0x4fc(%ebp)
80100bc6:	75 b7                	jne    80100b7f <exec+0x16f>
      continue;
    if(ph.memsz < ph.filesz)
80100bc8:	8b 85 18 fb ff ff    	mov    -0x4e8(%ebp),%eax
80100bce:	3b 85 14 fb ff ff    	cmp    -0x4ec(%ebp),%eax
80100bd4:	72 55                	jb     80100c2b <exec+0x21b>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100bd6:	03 85 0c fb ff ff    	add    -0x4f4(%ebp),%eax
80100bdc:	72 4d                	jb     80100c2b <exec+0x21b>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100bde:	83 ec 04             	sub    $0x4,%esp
80100be1:	50                   	push   %eax
80100be2:	57                   	push   %edi
80100be3:	ff b5 f4 fa ff ff    	pushl  -0x50c(%ebp)
80100be9:	e8 92 62 00 00       	call   80106e80 <allocuvm>
80100bee:	83 c4 10             	add    $0x10,%esp
80100bf1:	85 c0                	test   %eax,%eax
80100bf3:	89 c7                	mov    %eax,%edi
80100bf5:	74 34                	je     80100c2b <exec+0x21b>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100bf7:	8b 85 0c fb ff ff    	mov    -0x4f4(%ebp),%eax
80100bfd:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100c02:	75 27                	jne    80100c2b <exec+0x21b>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100c04:	83 ec 0c             	sub    $0xc,%esp
80100c07:	ff b5 14 fb ff ff    	pushl  -0x4ec(%ebp)
80100c0d:	ff b5 08 fb ff ff    	pushl  -0x4f8(%ebp)
80100c13:	53                   	push   %ebx
80100c14:	50                   	push   %eax
80100c15:	ff b5 f4 fa ff ff    	pushl  -0x50c(%ebp)
80100c1b:	e8 a0 61 00 00       	call   80106dc0 <loaduvm>
80100c20:	83 c4 20             	add    $0x20,%esp
80100c23:	85 c0                	test   %eax,%eax
80100c25:	0f 89 54 ff ff ff    	jns    80100b7f <exec+0x16f>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100c2b:	83 ec 0c             	sub    $0xc,%esp
80100c2e:	ff b5 f4 fa ff ff    	pushl  -0x50c(%ebp)
80100c34:	e8 77 63 00 00       	call   80106fb0 <freevm>
  if(ip){
80100c39:	83 c4 10             	add    $0x10,%esp
80100c3c:	85 db                	test   %ebx,%ebx
80100c3e:	0f 85 b4 fe ff ff    	jne    80100af8 <exec+0xe8>
    iunlockput(ip);
    end_op();
  }
  return -1;
}
80100c44:	8d 65 f4             	lea    -0xc(%ebp),%esp
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
    end_op();
  }
  return -1;
80100c47:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100c4c:	5b                   	pop    %ebx
80100c4d:	5e                   	pop    %esi
80100c4e:	5f                   	pop    %edi
80100c4f:	5d                   	pop    %ebp
80100c50:	c3                   	ret    
  if((pgdir = setupkvm()) == 0)
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100c51:	bf 00 20 00 00       	mov    $0x2000,%edi
80100c56:	31 c0                	xor    %eax,%eax
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100c58:	83 ec 0c             	sub    $0xc,%esp
80100c5b:	89 85 f0 fa ff ff    	mov    %eax,-0x510(%ebp)
80100c61:	53                   	push   %ebx
80100c62:	e8 b9 0d 00 00       	call   80101a20 <iunlockput>
  end_op();
80100c67:	e8 14 21 00 00       	call   80102d80 <end_op>
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100c6c:	8b 85 f0 fa ff ff    	mov    -0x510(%ebp),%eax
80100c72:	83 c4 0c             	add    $0xc,%esp
80100c75:	57                   	push   %edi
80100c76:	50                   	push   %eax
80100c77:	ff b5 f4 fa ff ff    	pushl  -0x50c(%ebp)
80100c7d:	e8 fe 61 00 00       	call   80106e80 <allocuvm>
80100c82:	83 c4 10             	add    $0x10,%esp
80100c85:	85 c0                	test   %eax,%eax
80100c87:	89 c7                	mov    %eax,%edi
80100c89:	75 19                	jne    80100ca4 <exec+0x294>
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
  end_op();
  ip = 0;
80100c8b:	31 db                	xor    %ebx,%ebx
80100c8d:	eb 9c                	jmp    80100c2b <exec+0x21b>
80100c8f:	8d 8f ff 0f 00 00    	lea    0xfff(%edi),%ecx
80100c95:	89 c8                	mov    %ecx,%eax
80100c97:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80100c9c:	8d b8 00 20 00 00    	lea    0x2000(%eax),%edi
80100ca2:	eb b4                	jmp    80100c58 <exec+0x248>
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100ca4:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100caa:	83 ec 08             	sub    $0x8,%esp
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100cad:	31 db                	xor    %ebx,%ebx
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100caf:	50                   	push   %eax
80100cb0:	ff b5 f4 fa ff ff    	pushl  -0x50c(%ebp)
80100cb6:	e8 75 63 00 00       	call   80107030 <clearpteu>
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100cbb:	8b 45 0c             	mov    0xc(%ebp),%eax
80100cbe:	83 c4 10             	add    $0x10,%esp
80100cc1:	8b 00                	mov    (%eax),%eax
80100cc3:	85 c0                	test   %eax,%eax
80100cc5:	0f 84 8f 00 00 00    	je     80100d5a <exec+0x34a>
80100ccb:	89 75 08             	mov    %esi,0x8(%ebp)
80100cce:	89 fe                	mov    %edi,%esi
80100cd0:	eb 0d                	jmp    80100cdf <exec+0x2cf>
80100cd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(argc >= MAXARG)
80100cd8:	83 fa 20             	cmp    $0x20,%edx
80100cdb:	74 ae                	je     80100c8b <exec+0x27b>
80100cdd:	89 d3                	mov    %edx,%ebx
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100cdf:	83 ec 0c             	sub    $0xc,%esp
80100ce2:	50                   	push   %eax
80100ce3:	e8 58 3b 00 00       	call   80104840 <strlen>
80100ce8:	f7 d0                	not    %eax
80100cea:	01 c6                	add    %eax,%esi
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100cec:	58                   	pop    %eax
80100ced:	8b 45 0c             	mov    0xc(%ebp),%eax

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100cf0:	83 e6 fc             	and    $0xfffffffc,%esi
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100cf3:	ff 34 98             	pushl  (%eax,%ebx,4)
80100cf6:	e8 45 3b 00 00       	call   80104840 <strlen>
80100cfb:	83 c0 01             	add    $0x1,%eax
80100cfe:	50                   	push   %eax
80100cff:	8b 45 0c             	mov    0xc(%ebp),%eax
80100d02:	ff 34 98             	pushl  (%eax,%ebx,4)
80100d05:	56                   	push   %esi
80100d06:	ff b5 f4 fa ff ff    	pushl  -0x50c(%ebp)
80100d0c:	e8 7f 64 00 00       	call   80107190 <copyout>
80100d11:	83 c4 20             	add    $0x20,%esp
80100d14:	85 c0                	test   %eax,%eax
80100d16:	0f 88 6f ff ff ff    	js     80100c8b <exec+0x27b>
      goto bad;
    ustack[3+argc] = sp;
80100d1c:	8d 85 58 fb ff ff    	lea    -0x4a8(%ebp),%eax
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100d22:	8d 53 01             	lea    0x1(%ebx),%edx
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100d25:	89 b4 9d 64 fb ff ff 	mov    %esi,-0x49c(%ebp,%ebx,4)
80100d2c:	89 85 e8 fa ff ff    	mov    %eax,-0x518(%ebp)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100d32:	8b 45 0c             	mov    0xc(%ebp),%eax
80100d35:	8b 04 90             	mov    (%eax,%edx,4),%eax
80100d38:	85 c0                	test   %eax,%eax
80100d3a:	75 9c                	jne    80100cd8 <exec+0x2c8>
80100d3c:	8d 43 04             	lea    0x4(%ebx),%eax
80100d3f:	8b 75 08             	mov    0x8(%ebp),%esi
80100d42:	89 85 ec fa ff ff    	mov    %eax,-0x514(%ebp)
80100d48:	8d 04 9d 08 00 00 00 	lea    0x8(,%ebx,4),%eax
80100d4f:	89 85 f0 fa ff ff    	mov    %eax,-0x510(%ebp)
80100d55:	8d 58 0c             	lea    0xc(%eax),%ebx
80100d58:	eb 27                	jmp    80100d81 <exec+0x371>
80100d5a:	8d 85 58 fb ff ff    	lea    -0x4a8(%ebp),%eax
80100d60:	bb 10 00 00 00       	mov    $0x10,%ebx
80100d65:	c7 85 f0 fa ff ff 04 	movl   $0x4,-0x510(%ebp)
80100d6c:	00 00 00 
80100d6f:	c7 85 ec fa ff ff 03 	movl   $0x3,-0x514(%ebp)
80100d76:	00 00 00 
80100d79:	31 d2                	xor    %edx,%edx
80100d7b:	89 85 e8 fa ff ff    	mov    %eax,-0x518(%ebp)
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
    /* stack pointer update */
  sp = sz - exitsz;
80100d81:	b8 10 0a 10 80       	mov    $0x80100a10,%eax
80100d86:	89 f9                	mov    %edi,%ecx
80100d88:	89 95 e0 fa ff ff    	mov    %edx,-0x520(%ebp)
80100d8e:	2d f0 09 10 80       	sub    $0x801009f0,%eax
80100d93:	29 c1                	sub    %eax,%ecx
  /* copy page from sp to exitf */
  copyout(pgdir,sp,exitf,exitsz);
80100d95:	50                   	push   %eax
80100d96:	68 f0 09 10 80       	push   $0x801009f0
80100d9b:	51                   	push   %ecx
80100d9c:	ff b5 f4 fa ff ff    	pushl  -0x50c(%ebp)
80100da2:	89 8d e4 fa ff ff    	mov    %ecx,-0x51c(%ebp)
80100da8:	e8 e3 63 00 00       	call   80107190 <copyout>

  ustack[3+argc] = 0;

  /* return address of user space program */
  ustack[0] = sz - exitsz;  // fake return PC
80100dad:	8b 8d e4 fa ff ff    	mov    -0x51c(%ebp),%ecx
    /* stack pointer update */
  sp = sz - exitsz;
  /* copy page from sp to exitf */
  copyout(pgdir,sp,exitf,exitsz);

  ustack[3+argc] = 0;
80100db3:	8b 85 ec fa ff ff    	mov    -0x514(%ebp),%eax

  /* return address of user space program */
  ustack[0] = sz - exitsz;  // fake return PC
  ustack[1] = argc;
80100db9:	8b 95 e0 fa ff ff    	mov    -0x520(%ebp),%edx
  ustack[2] = sp - (argc+1)*4;  // argv pointer

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100dbf:	53                   	push   %ebx
80100dc0:	ff b5 e8 fa ff ff    	pushl  -0x518(%ebp)
    /* stack pointer update */
  sp = sz - exitsz;
  /* copy page from sp to exitf */
  copyout(pgdir,sp,exitf,exitsz);

  ustack[3+argc] = 0;
80100dc6:	c7 84 85 58 fb ff ff 	movl   $0x0,-0x4a8(%ebp,%eax,4)
80100dcd:	00 00 00 00 

  /* return address of user space program */
  ustack[0] = sz - exitsz;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100dd1:	89 c8                	mov    %ecx,%eax
80100dd3:	2b 85 f0 fa ff ff    	sub    -0x510(%ebp),%eax
  copyout(pgdir,sp,exitf,exitsz);

  ustack[3+argc] = 0;

  /* return address of user space program */
  ustack[0] = sz - exitsz;  // fake return PC
80100dd9:	89 8d 58 fb ff ff    	mov    %ecx,-0x4a8(%ebp)
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer

  sp -= (3+argc+1) * 4;
80100ddf:	29 d9                	sub    %ebx,%ecx

  ustack[3+argc] = 0;

  /* return address of user space program */
  ustack[0] = sz - exitsz;  // fake return PC
  ustack[1] = argc;
80100de1:	89 95 5c fb ff ff    	mov    %edx,-0x4a4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100de7:	51                   	push   %ecx
80100de8:	ff b5 f4 fa ff ff    	pushl  -0x50c(%ebp)
  /* return address of user space program */
  ustack[0] = sz - exitsz;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer

  sp -= (3+argc+1) * 4;
80100dee:	89 8d f0 fa ff ff    	mov    %ecx,-0x510(%ebp)
  ustack[3+argc] = 0;

  /* return address of user space program */
  ustack[0] = sz - exitsz;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100df4:	89 85 60 fb ff ff    	mov    %eax,-0x4a0(%ebp)

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100dfa:	e8 91 63 00 00       	call   80107190 <copyout>
80100dff:	83 c4 20             	add    $0x20,%esp
80100e02:	85 c0                	test   %eax,%eax
80100e04:	0f 88 81 fe ff ff    	js     80100c8b <exec+0x27b>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100e0a:	0f b6 16             	movzbl (%esi),%edx
80100e0d:	84 d2                	test   %dl,%dl
80100e0f:	74 13                	je     80100e24 <exec+0x414>
80100e11:	8d 46 01             	lea    0x1(%esi),%eax
    if(*s == '/')
      last = s+1;
80100e14:	80 fa 2f             	cmp    $0x2f,%dl
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100e17:	0f b6 10             	movzbl (%eax),%edx
    if(*s == '/')
      last = s+1;
80100e1a:	0f 44 f0             	cmove  %eax,%esi
80100e1d:	83 c0 01             	add    $0x1,%eax
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100e20:	84 d2                	test   %dl,%dl
80100e22:	75 f0                	jne    80100e14 <exec+0x404>
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));
80100e24:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100e2a:	83 ec 04             	sub    $0x4,%esp
80100e2d:	6a 10                	push   $0x10
80100e2f:	56                   	push   %esi
80100e30:	83 c0 6c             	add    $0x6c,%eax
80100e33:	50                   	push   %eax
80100e34:	e8 c7 39 00 00       	call   80104800 <safestrcpy>

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100e39:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  proc->pgdir = pgdir;
80100e3f:	8b 95 f4 fa ff ff    	mov    -0x50c(%ebp),%edx
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100e45:	8b 58 04             	mov    0x4(%eax),%ebx
  proc->pgdir = pgdir;
  proc->sz = sz;
80100e48:	89 38                	mov    %edi,(%eax)
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));

  // Commit to the user image.
  oldpgdir = proc->pgdir;
  proc->pgdir = pgdir;
80100e4a:	89 50 04             	mov    %edx,0x4(%eax)
  proc->sz = sz;
  proc->tf->eip = elf.entry;  // main
80100e4d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100e53:	8b 95 3c fb ff ff    	mov    -0x4c4(%ebp),%edx
80100e59:	8b 48 18             	mov    0x18(%eax),%ecx
80100e5c:	89 51 38             	mov    %edx,0x38(%ecx)
  proc->tf->esp = sp;
80100e5f:	8b 95 f0 fa ff ff    	mov    -0x510(%ebp),%edx
80100e65:	8b 48 18             	mov    0x18(%eax),%ecx
80100e68:	89 51 44             	mov    %edx,0x44(%ecx)
  switchuvm(proc);
80100e6b:	89 04 24             	mov    %eax,(%esp)
80100e6e:	e8 2d 5e 00 00       	call   80106ca0 <switchuvm>
  freevm(oldpgdir);
80100e73:	89 1c 24             	mov    %ebx,(%esp)
80100e76:	e8 35 61 00 00       	call   80106fb0 <freevm>
  return 0;
80100e7b:	83 c4 10             	add    $0x10,%esp
80100e7e:	31 c0                	xor    %eax,%eax
80100e80:	e9 89 fc ff ff       	jmp    80100b0e <exec+0xfe>
80100e85:	66 90                	xchg   %ax,%ax
80100e87:	66 90                	xchg   %ax,%ax
80100e89:	66 90                	xchg   %ax,%ax
80100e8b:	66 90                	xchg   %ax,%ax
80100e8d:	66 90                	xchg   %ax,%ax
80100e8f:	90                   	nop

80100e90 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100e90:	55                   	push   %ebp
80100e91:	89 e5                	mov    %esp,%ebp
80100e93:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100e96:	68 c9 72 10 80       	push   $0x801072c9
80100e9b:	68 e0 ff 10 80       	push   $0x8010ffe0
80100ea0:	e8 0b 35 00 00       	call   801043b0 <initlock>
}
80100ea5:	83 c4 10             	add    $0x10,%esp
80100ea8:	c9                   	leave  
80100ea9:	c3                   	ret    
80100eaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100eb0 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100eb0:	55                   	push   %ebp
80100eb1:	89 e5                	mov    %esp,%ebp
80100eb3:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100eb4:	bb 14 00 11 80       	mov    $0x80110014,%ebx
}

// Allocate a file structure.
struct file*
filealloc(void)
{
80100eb9:	83 ec 10             	sub    $0x10,%esp
  struct file *f;

  acquire(&ftable.lock);
80100ebc:	68 e0 ff 10 80       	push   $0x8010ffe0
80100ec1:	e8 0a 35 00 00       	call   801043d0 <acquire>
80100ec6:	83 c4 10             	add    $0x10,%esp
80100ec9:	eb 10                	jmp    80100edb <filealloc+0x2b>
80100ecb:	90                   	nop
80100ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100ed0:	83 c3 18             	add    $0x18,%ebx
80100ed3:	81 fb 74 09 11 80    	cmp    $0x80110974,%ebx
80100ed9:	74 25                	je     80100f00 <filealloc+0x50>
    if(f->ref == 0){
80100edb:	8b 43 04             	mov    0x4(%ebx),%eax
80100ede:	85 c0                	test   %eax,%eax
80100ee0:	75 ee                	jne    80100ed0 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100ee2:	83 ec 0c             	sub    $0xc,%esp
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
      f->ref = 1;
80100ee5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100eec:	68 e0 ff 10 80       	push   $0x8010ffe0
80100ef1:	e8 ba 36 00 00       	call   801045b0 <release>
      return f;
80100ef6:	89 d8                	mov    %ebx,%eax
80100ef8:	83 c4 10             	add    $0x10,%esp
    }
  }
  release(&ftable.lock);
  return 0;
}
80100efb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100efe:	c9                   	leave  
80100eff:	c3                   	ret    
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80100f00:	83 ec 0c             	sub    $0xc,%esp
80100f03:	68 e0 ff 10 80       	push   $0x8010ffe0
80100f08:	e8 a3 36 00 00       	call   801045b0 <release>
  return 0;
80100f0d:	83 c4 10             	add    $0x10,%esp
80100f10:	31 c0                	xor    %eax,%eax
}
80100f12:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f15:	c9                   	leave  
80100f16:	c3                   	ret    
80100f17:	89 f6                	mov    %esi,%esi
80100f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100f20 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100f20:	55                   	push   %ebp
80100f21:	89 e5                	mov    %esp,%ebp
80100f23:	53                   	push   %ebx
80100f24:	83 ec 10             	sub    $0x10,%esp
80100f27:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100f2a:	68 e0 ff 10 80       	push   $0x8010ffe0
80100f2f:	e8 9c 34 00 00       	call   801043d0 <acquire>
  if(f->ref < 1)
80100f34:	8b 43 04             	mov    0x4(%ebx),%eax
80100f37:	83 c4 10             	add    $0x10,%esp
80100f3a:	85 c0                	test   %eax,%eax
80100f3c:	7e 1a                	jle    80100f58 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100f3e:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100f41:	83 ec 0c             	sub    $0xc,%esp
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
  f->ref++;
80100f44:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100f47:	68 e0 ff 10 80       	push   $0x8010ffe0
80100f4c:	e8 5f 36 00 00       	call   801045b0 <release>
  return f;
}
80100f51:	89 d8                	mov    %ebx,%eax
80100f53:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f56:	c9                   	leave  
80100f57:	c3                   	ret    
struct file*
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
80100f58:	83 ec 0c             	sub    $0xc,%esp
80100f5b:	68 d0 72 10 80       	push   $0x801072d0
80100f60:	e8 0b f4 ff ff       	call   80100370 <panic>
80100f65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100f70 <fileclose>:
}

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100f70:	55                   	push   %ebp
80100f71:	89 e5                	mov    %esp,%ebp
80100f73:	57                   	push   %edi
80100f74:	56                   	push   %esi
80100f75:	53                   	push   %ebx
80100f76:	83 ec 28             	sub    $0x28,%esp
80100f79:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct file ff;

  acquire(&ftable.lock);
80100f7c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100f81:	e8 4a 34 00 00       	call   801043d0 <acquire>
  if(f->ref < 1)
80100f86:	8b 47 04             	mov    0x4(%edi),%eax
80100f89:	83 c4 10             	add    $0x10,%esp
80100f8c:	85 c0                	test   %eax,%eax
80100f8e:	0f 8e 9b 00 00 00    	jle    8010102f <fileclose+0xbf>
    panic("fileclose");
  if(--f->ref > 0){
80100f94:	83 e8 01             	sub    $0x1,%eax
80100f97:	85 c0                	test   %eax,%eax
80100f99:	89 47 04             	mov    %eax,0x4(%edi)
80100f9c:	74 1a                	je     80100fb8 <fileclose+0x48>
    release(&ftable.lock);
80100f9e:	c7 45 08 e0 ff 10 80 	movl   $0x8010ffe0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100fa5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fa8:	5b                   	pop    %ebx
80100fa9:	5e                   	pop    %esi
80100faa:	5f                   	pop    %edi
80100fab:	5d                   	pop    %ebp

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
80100fac:	e9 ff 35 00 00       	jmp    801045b0 <release>
80100fb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return;
  }
  ff = *f;
80100fb8:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100fbc:	8b 1f                	mov    (%edi),%ebx
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100fbe:	83 ec 0c             	sub    $0xc,%esp
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100fc1:	8b 77 0c             	mov    0xc(%edi),%esi
  f->ref = 0;
  f->type = FD_NONE;
80100fc4:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100fca:	88 45 e7             	mov    %al,-0x19(%ebp)
80100fcd:	8b 47 10             	mov    0x10(%edi),%eax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100fd0:	68 e0 ff 10 80       	push   $0x8010ffe0
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100fd5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100fd8:	e8 d3 35 00 00       	call   801045b0 <release>

  if(ff.type == FD_PIPE)
80100fdd:	83 c4 10             	add    $0x10,%esp
80100fe0:	83 fb 01             	cmp    $0x1,%ebx
80100fe3:	74 13                	je     80100ff8 <fileclose+0x88>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100fe5:	83 fb 02             	cmp    $0x2,%ebx
80100fe8:	74 26                	je     80101010 <fileclose+0xa0>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100fea:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fed:	5b                   	pop    %ebx
80100fee:	5e                   	pop    %esi
80100fef:	5f                   	pop    %edi
80100ff0:	5d                   	pop    %ebp
80100ff1:	c3                   	ret    
80100ff2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);

  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
80100ff8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100ffc:	83 ec 08             	sub    $0x8,%esp
80100fff:	53                   	push   %ebx
80101000:	56                   	push   %esi
80101001:	e8 aa 25 00 00       	call   801035b0 <pipeclose>
80101006:	83 c4 10             	add    $0x10,%esp
80101009:	eb df                	jmp    80100fea <fileclose+0x7a>
8010100b:	90                   	nop
8010100c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  else if(ff.type == FD_INODE){
    begin_op();
80101010:	e8 fb 1c 00 00       	call   80102d10 <begin_op>
    iput(ff.ip);
80101015:	83 ec 0c             	sub    $0xc,%esp
80101018:	ff 75 e0             	pushl  -0x20(%ebp)
8010101b:	e8 c0 08 00 00       	call   801018e0 <iput>
    end_op();
80101020:	83 c4 10             	add    $0x10,%esp
  }
}
80101023:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101026:	5b                   	pop    %ebx
80101027:	5e                   	pop    %esi
80101028:	5f                   	pop    %edi
80101029:	5d                   	pop    %ebp
  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
8010102a:	e9 51 1d 00 00       	jmp    80102d80 <end_op>
{
  struct file ff;

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
8010102f:	83 ec 0c             	sub    $0xc,%esp
80101032:	68 d8 72 10 80       	push   $0x801072d8
80101037:	e8 34 f3 ff ff       	call   80100370 <panic>
8010103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101040 <filestat>:
}

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80101040:	55                   	push   %ebp
80101041:	89 e5                	mov    %esp,%ebp
80101043:	53                   	push   %ebx
80101044:	83 ec 04             	sub    $0x4,%esp
80101047:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
8010104a:	83 3b 02             	cmpl   $0x2,(%ebx)
8010104d:	75 31                	jne    80101080 <filestat+0x40>
    ilock(f->ip);
8010104f:	83 ec 0c             	sub    $0xc,%esp
80101052:	ff 73 10             	pushl  0x10(%ebx)
80101055:	e8 56 07 00 00       	call   801017b0 <ilock>
    stati(f->ip, st);
8010105a:	58                   	pop    %eax
8010105b:	5a                   	pop    %edx
8010105c:	ff 75 0c             	pushl  0xc(%ebp)
8010105f:	ff 73 10             	pushl  0x10(%ebx)
80101062:	e8 d9 09 00 00       	call   80101a40 <stati>
    iunlock(f->ip);
80101067:	59                   	pop    %ecx
80101068:	ff 73 10             	pushl  0x10(%ebx)
8010106b:	e8 20 08 00 00       	call   80101890 <iunlock>
    return 0;
80101070:	83 c4 10             	add    $0x10,%esp
80101073:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80101075:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101078:	c9                   	leave  
80101079:	c3                   	ret    
8010107a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    ilock(f->ip);
    stati(f->ip, st);
    iunlock(f->ip);
    return 0;
  }
  return -1;
80101080:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80101085:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101088:	c9                   	leave  
80101089:	c3                   	ret    
8010108a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80101090 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80101090:	55                   	push   %ebp
80101091:	89 e5                	mov    %esp,%ebp
80101093:	57                   	push   %edi
80101094:	56                   	push   %esi
80101095:	53                   	push   %ebx
80101096:	83 ec 0c             	sub    $0xc,%esp
80101099:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010109c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010109f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
801010a2:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
801010a6:	74 60                	je     80101108 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
801010a8:	8b 03                	mov    (%ebx),%eax
801010aa:	83 f8 01             	cmp    $0x1,%eax
801010ad:	74 41                	je     801010f0 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
801010af:	83 f8 02             	cmp    $0x2,%eax
801010b2:	75 5b                	jne    8010110f <fileread+0x7f>
    ilock(f->ip);
801010b4:	83 ec 0c             	sub    $0xc,%esp
801010b7:	ff 73 10             	pushl  0x10(%ebx)
801010ba:	e8 f1 06 00 00       	call   801017b0 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
801010bf:	57                   	push   %edi
801010c0:	ff 73 14             	pushl  0x14(%ebx)
801010c3:	56                   	push   %esi
801010c4:	ff 73 10             	pushl  0x10(%ebx)
801010c7:	e8 a4 09 00 00       	call   80101a70 <readi>
801010cc:	83 c4 20             	add    $0x20,%esp
801010cf:	85 c0                	test   %eax,%eax
801010d1:	89 c6                	mov    %eax,%esi
801010d3:	7e 03                	jle    801010d8 <fileread+0x48>
      f->off += r;
801010d5:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
801010d8:	83 ec 0c             	sub    $0xc,%esp
801010db:	ff 73 10             	pushl  0x10(%ebx)
801010de:	e8 ad 07 00 00       	call   80101890 <iunlock>
    return r;
801010e3:	83 c4 10             	add    $0x10,%esp
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
    ilock(f->ip);
    if((r = readi(f->ip, addr, f->off, n)) > 0)
801010e6:	89 f0                	mov    %esi,%eax
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
801010e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010eb:	5b                   	pop    %ebx
801010ec:	5e                   	pop    %esi
801010ed:	5f                   	pop    %edi
801010ee:	5d                   	pop    %ebp
801010ef:	c3                   	ret    
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
801010f0:	8b 43 0c             	mov    0xc(%ebx),%eax
801010f3:	89 45 08             	mov    %eax,0x8(%ebp)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
801010f6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010f9:	5b                   	pop    %ebx
801010fa:	5e                   	pop    %esi
801010fb:	5f                   	pop    %edi
801010fc:	5d                   	pop    %ebp
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
801010fd:	e9 7e 26 00 00       	jmp    80103780 <piperead>
80101102:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fileread(struct file *f, char *addr, int n)
{
  int r;

  if(f->readable == 0)
    return -1;
80101108:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010110d:	eb d9                	jmp    801010e8 <fileread+0x58>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
8010110f:	83 ec 0c             	sub    $0xc,%esp
80101112:	68 e2 72 10 80       	push   $0x801072e2
80101117:	e8 54 f2 ff ff       	call   80100370 <panic>
8010111c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101120 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80101120:	55                   	push   %ebp
80101121:	89 e5                	mov    %esp,%ebp
80101123:	57                   	push   %edi
80101124:	56                   	push   %esi
80101125:	53                   	push   %ebx
80101126:	83 ec 1c             	sub    $0x1c,%esp
80101129:	8b 75 08             	mov    0x8(%ebp),%esi
8010112c:	8b 45 0c             	mov    0xc(%ebp),%eax
  int r;

  if(f->writable == 0)
8010112f:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80101133:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101136:	8b 45 10             	mov    0x10(%ebp),%eax
80101139:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int r;

  if(f->writable == 0)
8010113c:	0f 84 aa 00 00 00    	je     801011ec <filewrite+0xcc>
    return -1;
  if(f->type == FD_PIPE)
80101142:	8b 06                	mov    (%esi),%eax
80101144:	83 f8 01             	cmp    $0x1,%eax
80101147:	0f 84 c2 00 00 00    	je     8010120f <filewrite+0xef>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
8010114d:	83 f8 02             	cmp    $0x2,%eax
80101150:	0f 85 d8 00 00 00    	jne    8010122e <filewrite+0x10e>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101156:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101159:	31 ff                	xor    %edi,%edi
8010115b:	85 c0                	test   %eax,%eax
8010115d:	7f 34                	jg     80101193 <filewrite+0x73>
8010115f:	e9 9c 00 00 00       	jmp    80101200 <filewrite+0xe0>
80101164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101168:	01 46 14             	add    %eax,0x14(%esi)
      iunlock(f->ip);
8010116b:	83 ec 0c             	sub    $0xc,%esp
8010116e:	ff 76 10             	pushl  0x10(%esi)
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101171:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101174:	e8 17 07 00 00       	call   80101890 <iunlock>
      end_op();
80101179:	e8 02 1c 00 00       	call   80102d80 <end_op>
8010117e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101181:	83 c4 10             	add    $0x10,%esp

      if(r < 0)
        break;
      if(r != n1)
80101184:	39 d8                	cmp    %ebx,%eax
80101186:	0f 85 95 00 00 00    	jne    80101221 <filewrite+0x101>
        panic("short filewrite");
      i += r;
8010118c:	01 c7                	add    %eax,%edi
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
8010118e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101191:	7e 6d                	jle    80101200 <filewrite+0xe0>
      int n1 = n - i;
80101193:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101196:	b8 00 1a 00 00       	mov    $0x1a00,%eax
8010119b:	29 fb                	sub    %edi,%ebx
8010119d:	81 fb 00 1a 00 00    	cmp    $0x1a00,%ebx
801011a3:	0f 4f d8             	cmovg  %eax,%ebx
      if(n1 > max)
        n1 = max;

      begin_op();
801011a6:	e8 65 1b 00 00       	call   80102d10 <begin_op>
      ilock(f->ip);
801011ab:	83 ec 0c             	sub    $0xc,%esp
801011ae:	ff 76 10             	pushl  0x10(%esi)
801011b1:	e8 fa 05 00 00       	call   801017b0 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
801011b6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801011b9:	53                   	push   %ebx
801011ba:	ff 76 14             	pushl  0x14(%esi)
801011bd:	01 f8                	add    %edi,%eax
801011bf:	50                   	push   %eax
801011c0:	ff 76 10             	pushl  0x10(%esi)
801011c3:	e8 a8 09 00 00       	call   80101b70 <writei>
801011c8:	83 c4 20             	add    $0x20,%esp
801011cb:	85 c0                	test   %eax,%eax
801011cd:	7f 99                	jg     80101168 <filewrite+0x48>
        f->off += r;
      iunlock(f->ip);
801011cf:	83 ec 0c             	sub    $0xc,%esp
801011d2:	ff 76 10             	pushl  0x10(%esi)
801011d5:	89 45 e0             	mov    %eax,-0x20(%ebp)
801011d8:	e8 b3 06 00 00       	call   80101890 <iunlock>
      end_op();
801011dd:	e8 9e 1b 00 00       	call   80102d80 <end_op>

      if(r < 0)
801011e2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801011e5:	83 c4 10             	add    $0x10,%esp
801011e8:	85 c0                	test   %eax,%eax
801011ea:	74 98                	je     80101184 <filewrite+0x64>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801011ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801011ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  panic("filewrite");
}
801011f4:	5b                   	pop    %ebx
801011f5:	5e                   	pop    %esi
801011f6:	5f                   	pop    %edi
801011f7:	5d                   	pop    %ebp
801011f8:	c3                   	ret    
801011f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
80101200:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
80101203:	75 e7                	jne    801011ec <filewrite+0xcc>
  }
  panic("filewrite");
}
80101205:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101208:	89 f8                	mov    %edi,%eax
8010120a:	5b                   	pop    %ebx
8010120b:	5e                   	pop    %esi
8010120c:	5f                   	pop    %edi
8010120d:	5d                   	pop    %ebp
8010120e:	c3                   	ret    
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
8010120f:	8b 46 0c             	mov    0xc(%esi),%eax
80101212:	89 45 08             	mov    %eax,0x8(%ebp)
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
80101215:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101218:	5b                   	pop    %ebx
80101219:	5e                   	pop    %esi
8010121a:	5f                   	pop    %edi
8010121b:	5d                   	pop    %ebp
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
8010121c:	e9 2f 24 00 00       	jmp    80103650 <pipewrite>
      end_op();

      if(r < 0)
        break;
      if(r != n1)
        panic("short filewrite");
80101221:	83 ec 0c             	sub    $0xc,%esp
80101224:	68 eb 72 10 80       	push   $0x801072eb
80101229:	e8 42 f1 ff ff       	call   80100370 <panic>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
8010122e:	83 ec 0c             	sub    $0xc,%esp
80101231:	68 f1 72 10 80       	push   $0x801072f1
80101236:	e8 35 f1 ff ff       	call   80100370 <panic>
8010123b:	66 90                	xchg   %ax,%ax
8010123d:	66 90                	xchg   %ax,%ax
8010123f:	90                   	nop

80101240 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
80101240:	55                   	push   %ebp
80101241:	89 e5                	mov    %esp,%ebp
80101243:	57                   	push   %edi
80101244:	56                   	push   %esi
80101245:	53                   	push   %ebx
80101246:	83 ec 1c             	sub    $0x1c,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101249:	8b 0d e0 09 11 80    	mov    0x801109e0,%ecx
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
8010124f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101252:	85 c9                	test   %ecx,%ecx
80101254:	0f 84 85 00 00 00    	je     801012df <balloc+0x9f>
8010125a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101261:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101264:	83 ec 08             	sub    $0x8,%esp
80101267:	89 f0                	mov    %esi,%eax
80101269:	c1 f8 0c             	sar    $0xc,%eax
8010126c:	03 05 f8 09 11 80    	add    0x801109f8,%eax
80101272:	50                   	push   %eax
80101273:	ff 75 d8             	pushl  -0x28(%ebp)
80101276:	e8 55 ee ff ff       	call   801000d0 <bread>
8010127b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010127e:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101283:	83 c4 10             	add    $0x10,%esp
80101286:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101289:	31 c0                	xor    %eax,%eax
8010128b:	eb 2d                	jmp    801012ba <balloc+0x7a>
8010128d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101290:	89 c1                	mov    %eax,%ecx
80101292:	ba 01 00 00 00       	mov    $0x1,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101297:	8b 5d e4             	mov    -0x1c(%ebp),%ebx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
8010129a:	83 e1 07             	and    $0x7,%ecx
8010129d:	d3 e2                	shl    %cl,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010129f:	89 c1                	mov    %eax,%ecx
801012a1:	c1 f9 03             	sar    $0x3,%ecx
801012a4:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
801012a9:	85 d7                	test   %edx,%edi
801012ab:	74 43                	je     801012f0 <balloc+0xb0>
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
801012ad:	83 c0 01             	add    $0x1,%eax
801012b0:	83 c6 01             	add    $0x1,%esi
801012b3:	3d 00 10 00 00       	cmp    $0x1000,%eax
801012b8:	74 05                	je     801012bf <balloc+0x7f>
801012ba:	3b 75 e0             	cmp    -0x20(%ebp),%esi
801012bd:	72 d1                	jb     80101290 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
801012bf:	83 ec 0c             	sub    $0xc,%esp
801012c2:	ff 75 e4             	pushl  -0x1c(%ebp)
801012c5:	e8 16 ef ff ff       	call   801001e0 <brelse>
{
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
801012ca:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
801012d1:	83 c4 10             	add    $0x10,%esp
801012d4:	8b 45 dc             	mov    -0x24(%ebp),%eax
801012d7:	39 05 e0 09 11 80    	cmp    %eax,0x801109e0
801012dd:	77 82                	ja     80101261 <balloc+0x21>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
801012df:	83 ec 0c             	sub    $0xc,%esp
801012e2:	68 fb 72 10 80       	push   $0x801072fb
801012e7:	e8 84 f0 ff ff       	call   80100370 <panic>
801012ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801012f0:	09 fa                	or     %edi,%edx
801012f2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
801012f5:	83 ec 0c             	sub    $0xc,%esp
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801012f8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
801012fc:	57                   	push   %edi
801012fd:	e8 ee 1b 00 00       	call   80102ef0 <log_write>
        brelse(bp);
80101302:	89 3c 24             	mov    %edi,(%esp)
80101305:	e8 d6 ee ff ff       	call   801001e0 <brelse>
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
8010130a:	58                   	pop    %eax
8010130b:	5a                   	pop    %edx
8010130c:	56                   	push   %esi
8010130d:	ff 75 d8             	pushl  -0x28(%ebp)
80101310:	e8 bb ed ff ff       	call   801000d0 <bread>
80101315:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
80101317:	8d 40 5c             	lea    0x5c(%eax),%eax
8010131a:	83 c4 0c             	add    $0xc,%esp
8010131d:	68 00 02 00 00       	push   $0x200
80101322:	6a 00                	push   $0x0
80101324:	50                   	push   %eax
80101325:	e8 d6 32 00 00       	call   80104600 <memset>
  log_write(bp);
8010132a:	89 1c 24             	mov    %ebx,(%esp)
8010132d:	e8 be 1b 00 00       	call   80102ef0 <log_write>
  brelse(bp);
80101332:	89 1c 24             	mov    %ebx,(%esp)
80101335:	e8 a6 ee ff ff       	call   801001e0 <brelse>
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
8010133a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010133d:	89 f0                	mov    %esi,%eax
8010133f:	5b                   	pop    %ebx
80101340:	5e                   	pop    %esi
80101341:	5f                   	pop    %edi
80101342:	5d                   	pop    %ebp
80101343:	c3                   	ret    
80101344:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010134a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101350 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101350:	55                   	push   %ebp
80101351:	89 e5                	mov    %esp,%ebp
80101353:	57                   	push   %edi
80101354:	56                   	push   %esi
80101355:	53                   	push   %ebx
80101356:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101358:	31 f6                	xor    %esi,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010135a:	bb 34 0a 11 80       	mov    $0x80110a34,%ebx
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
8010135f:	83 ec 28             	sub    $0x28,%esp
80101362:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  struct inode *ip, *empty;

  acquire(&icache.lock);
80101365:	68 00 0a 11 80       	push   $0x80110a00
8010136a:	e8 61 30 00 00       	call   801043d0 <acquire>
8010136f:	83 c4 10             	add    $0x10,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101372:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101375:	eb 1b                	jmp    80101392 <iget+0x42>
80101377:	89 f6                	mov    %esi,%esi
80101379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101380:	85 f6                	test   %esi,%esi
80101382:	74 44                	je     801013c8 <iget+0x78>

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101384:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010138a:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101390:	74 4e                	je     801013e0 <iget+0x90>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101392:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101395:	85 c9                	test   %ecx,%ecx
80101397:	7e e7                	jle    80101380 <iget+0x30>
80101399:	39 3b                	cmp    %edi,(%ebx)
8010139b:	75 e3                	jne    80101380 <iget+0x30>
8010139d:	39 53 04             	cmp    %edx,0x4(%ebx)
801013a0:	75 de                	jne    80101380 <iget+0x30>
      ip->ref++;
      release(&icache.lock);
801013a2:	83 ec 0c             	sub    $0xc,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
801013a5:	83 c1 01             	add    $0x1,%ecx
      release(&icache.lock);
      return ip;
801013a8:	89 de                	mov    %ebx,%esi
  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
801013aa:	68 00 0a 11 80       	push   $0x80110a00

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
801013af:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
801013b2:	e8 f9 31 00 00       	call   801045b0 <release>
      return ip;
801013b7:	83 c4 10             	add    $0x10,%esp
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);

  return ip;
}
801013ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013bd:	89 f0                	mov    %esi,%eax
801013bf:	5b                   	pop    %ebx
801013c0:	5e                   	pop    %esi
801013c1:	5f                   	pop    %edi
801013c2:	5d                   	pop    %ebp
801013c3:	c3                   	ret    
801013c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
801013c8:	85 c9                	test   %ecx,%ecx
801013ca:	0f 44 f3             	cmove  %ebx,%esi

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801013cd:	81 c3 90 00 00 00    	add    $0x90,%ebx
801013d3:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
801013d9:	75 b7                	jne    80101392 <iget+0x42>
801013db:	90                   	nop
801013dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
801013e0:	85 f6                	test   %esi,%esi
801013e2:	74 2d                	je     80101411 <iget+0xc1>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);
801013e4:	83 ec 0c             	sub    $0xc,%esp
  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
801013e7:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
801013e9:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
801013ec:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->flags = 0;
801013f3:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
801013fa:	68 00 0a 11 80       	push   $0x80110a00
801013ff:	e8 ac 31 00 00       	call   801045b0 <release>

  return ip;
80101404:	83 c4 10             	add    $0x10,%esp
}
80101407:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010140a:	89 f0                	mov    %esi,%eax
8010140c:	5b                   	pop    %ebx
8010140d:	5e                   	pop    %esi
8010140e:	5f                   	pop    %edi
8010140f:	5d                   	pop    %ebp
80101410:	c3                   	ret    
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");
80101411:	83 ec 0c             	sub    $0xc,%esp
80101414:	68 11 73 10 80       	push   $0x80107311
80101419:	e8 52 ef ff ff       	call   80100370 <panic>
8010141e:	66 90                	xchg   %ax,%ax

80101420 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
80101420:	55                   	push   %ebp
80101421:	89 e5                	mov    %esp,%ebp
80101423:	57                   	push   %edi
80101424:	56                   	push   %esi
80101425:	53                   	push   %ebx
80101426:	89 c6                	mov    %eax,%esi
80101428:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
8010142b:	83 fa 0b             	cmp    $0xb,%edx
8010142e:	77 18                	ja     80101448 <bmap+0x28>
80101430:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
    if((addr = ip->addrs[bn]) == 0)
80101433:	8b 43 5c             	mov    0x5c(%ebx),%eax
80101436:	85 c0                	test   %eax,%eax
80101438:	74 76                	je     801014b0 <bmap+0x90>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010143a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010143d:	5b                   	pop    %ebx
8010143e:	5e                   	pop    %esi
8010143f:	5f                   	pop    %edi
80101440:	5d                   	pop    %ebp
80101441:	c3                   	ret    
80101442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
80101448:	8d 5a f4             	lea    -0xc(%edx),%ebx

  if(bn < NINDIRECT){
8010144b:	83 fb 7f             	cmp    $0x7f,%ebx
8010144e:	0f 87 83 00 00 00    	ja     801014d7 <bmap+0xb7>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
80101454:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010145a:	85 c0                	test   %eax,%eax
8010145c:	74 6a                	je     801014c8 <bmap+0xa8>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
8010145e:	83 ec 08             	sub    $0x8,%esp
80101461:	50                   	push   %eax
80101462:	ff 36                	pushl  (%esi)
80101464:	e8 67 ec ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101469:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010146d:	83 c4 10             	add    $0x10,%esp

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
80101470:	89 c7                	mov    %eax,%edi
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101472:	8b 1a                	mov    (%edx),%ebx
80101474:	85 db                	test   %ebx,%ebx
80101476:	75 1d                	jne    80101495 <bmap+0x75>
      a[bn] = addr = balloc(ip->dev);
80101478:	8b 06                	mov    (%esi),%eax
8010147a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010147d:	e8 be fd ff ff       	call   80101240 <balloc>
80101482:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
80101485:	83 ec 0c             	sub    $0xc,%esp
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
80101488:	89 c3                	mov    %eax,%ebx
8010148a:	89 02                	mov    %eax,(%edx)
      log_write(bp);
8010148c:	57                   	push   %edi
8010148d:	e8 5e 1a 00 00       	call   80102ef0 <log_write>
80101492:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
80101495:	83 ec 0c             	sub    $0xc,%esp
80101498:	57                   	push   %edi
80101499:	e8 42 ed ff ff       	call   801001e0 <brelse>
8010149e:	83 c4 10             	add    $0x10,%esp
    return addr;
  }

  panic("bmap: out of range");
}
801014a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
801014a4:	89 d8                	mov    %ebx,%eax
    return addr;
  }

  panic("bmap: out of range");
}
801014a6:	5b                   	pop    %ebx
801014a7:	5e                   	pop    %esi
801014a8:	5f                   	pop    %edi
801014a9:	5d                   	pop    %ebp
801014aa:	c3                   	ret    
801014ab:	90                   	nop
801014ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
801014b0:	8b 06                	mov    (%esi),%eax
801014b2:	e8 89 fd ff ff       	call   80101240 <balloc>
801014b7:	89 43 5c             	mov    %eax,0x5c(%ebx)
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801014ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801014bd:	5b                   	pop    %ebx
801014be:	5e                   	pop    %esi
801014bf:	5f                   	pop    %edi
801014c0:	5d                   	pop    %ebp
801014c1:	c3                   	ret    
801014c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  bn -= NDIRECT;

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
801014c8:	8b 06                	mov    (%esi),%eax
801014ca:	e8 71 fd ff ff       	call   80101240 <balloc>
801014cf:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
801014d5:	eb 87                	jmp    8010145e <bmap+0x3e>
    }
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
801014d7:	83 ec 0c             	sub    $0xc,%esp
801014da:	68 21 73 10 80       	push   $0x80107321
801014df:	e8 8c ee ff ff       	call   80100370 <panic>
801014e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801014ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801014f0 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
801014f0:	55                   	push   %ebp
801014f1:	89 e5                	mov    %esp,%ebp
801014f3:	56                   	push   %esi
801014f4:	53                   	push   %ebx
801014f5:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct buf *bp;

  bp = bread(dev, 1);
801014f8:	83 ec 08             	sub    $0x8,%esp
801014fb:	6a 01                	push   $0x1
801014fd:	ff 75 08             	pushl  0x8(%ebp)
80101500:	e8 cb eb ff ff       	call   801000d0 <bread>
80101505:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
80101507:	8d 40 5c             	lea    0x5c(%eax),%eax
8010150a:	83 c4 0c             	add    $0xc,%esp
8010150d:	6a 1c                	push   $0x1c
8010150f:	50                   	push   %eax
80101510:	56                   	push   %esi
80101511:	e8 9a 31 00 00       	call   801046b0 <memmove>
  brelse(bp);
80101516:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101519:	83 c4 10             	add    $0x10,%esp
}
8010151c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010151f:	5b                   	pop    %ebx
80101520:	5e                   	pop    %esi
80101521:	5d                   	pop    %ebp
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
80101522:	e9 b9 ec ff ff       	jmp    801001e0 <brelse>
80101527:	89 f6                	mov    %esi,%esi
80101529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101530 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
80101530:	55                   	push   %ebp
80101531:	89 e5                	mov    %esp,%ebp
80101533:	56                   	push   %esi
80101534:	53                   	push   %ebx
80101535:	89 d3                	mov    %edx,%ebx
80101537:	89 c6                	mov    %eax,%esi
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
80101539:	83 ec 08             	sub    $0x8,%esp
8010153c:	68 e0 09 11 80       	push   $0x801109e0
80101541:	50                   	push   %eax
80101542:	e8 a9 ff ff ff       	call   801014f0 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
80101547:	58                   	pop    %eax
80101548:	5a                   	pop    %edx
80101549:	89 da                	mov    %ebx,%edx
8010154b:	c1 ea 0c             	shr    $0xc,%edx
8010154e:	03 15 f8 09 11 80    	add    0x801109f8,%edx
80101554:	52                   	push   %edx
80101555:	56                   	push   %esi
80101556:	e8 75 eb ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
8010155b:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
8010155d:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101563:	ba 01 00 00 00       	mov    $0x1,%edx
80101568:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
8010156b:	c1 fb 03             	sar    $0x3,%ebx
8010156e:	83 c4 10             	add    $0x10,%esp
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101571:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
80101573:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101578:	85 d1                	test   %edx,%ecx
8010157a:	74 27                	je     801015a3 <bfree+0x73>
8010157c:	89 c6                	mov    %eax,%esi
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
8010157e:	f7 d2                	not    %edx
80101580:	89 c8                	mov    %ecx,%eax
  log_write(bp);
80101582:	83 ec 0c             	sub    $0xc,%esp
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101585:	21 d0                	and    %edx,%eax
80101587:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
  log_write(bp);
8010158b:	56                   	push   %esi
8010158c:	e8 5f 19 00 00       	call   80102ef0 <log_write>
  brelse(bp);
80101591:	89 34 24             	mov    %esi,(%esp)
80101594:	e8 47 ec ff ff       	call   801001e0 <brelse>
}
80101599:	83 c4 10             	add    $0x10,%esp
8010159c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010159f:	5b                   	pop    %ebx
801015a0:	5e                   	pop    %esi
801015a1:	5d                   	pop    %ebp
801015a2:	c3                   	ret    
  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
801015a3:	83 ec 0c             	sub    $0xc,%esp
801015a6:	68 34 73 10 80       	push   $0x80107334
801015ab:	e8 c0 ed ff ff       	call   80100370 <panic>

801015b0 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
801015b0:	55                   	push   %ebp
801015b1:	89 e5                	mov    %esp,%ebp
801015b3:	53                   	push   %ebx
801015b4:	bb 40 0a 11 80       	mov    $0x80110a40,%ebx
801015b9:	83 ec 0c             	sub    $0xc,%esp
  int i = 0;
  
  initlock(&icache.lock, "icache");
801015bc:	68 47 73 10 80       	push   $0x80107347
801015c1:	68 00 0a 11 80       	push   $0x80110a00
801015c6:	e8 e5 2d 00 00       	call   801043b0 <initlock>
801015cb:	83 c4 10             	add    $0x10,%esp
801015ce:	66 90                	xchg   %ax,%ax
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
801015d0:	83 ec 08             	sub    $0x8,%esp
801015d3:	68 4e 73 10 80       	push   $0x8010734e
801015d8:	53                   	push   %ebx
801015d9:	81 c3 90 00 00 00    	add    $0x90,%ebx
801015df:	e8 bc 2c 00 00       	call   801042a0 <initsleeplock>
iinit(int dev)
{
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
801015e4:	83 c4 10             	add    $0x10,%esp
801015e7:	81 fb 60 26 11 80    	cmp    $0x80112660,%ebx
801015ed:	75 e1                	jne    801015d0 <iinit+0x20>
    initsleeplock(&icache.inode[i].lock, "inode");
  }
  
  readsb(dev, &sb);
801015ef:	83 ec 08             	sub    $0x8,%esp
801015f2:	68 e0 09 11 80       	push   $0x801109e0
801015f7:	ff 75 08             	pushl  0x8(%ebp)
801015fa:	e8 f1 fe ff ff       	call   801014f0 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801015ff:	ff 35 f8 09 11 80    	pushl  0x801109f8
80101605:	ff 35 f4 09 11 80    	pushl  0x801109f4
8010160b:	ff 35 f0 09 11 80    	pushl  0x801109f0
80101611:	ff 35 ec 09 11 80    	pushl  0x801109ec
80101617:	ff 35 e8 09 11 80    	pushl  0x801109e8
8010161d:	ff 35 e4 09 11 80    	pushl  0x801109e4
80101623:	ff 35 e0 09 11 80    	pushl  0x801109e0
80101629:	68 a4 73 10 80       	push   $0x801073a4
8010162e:	e8 2d f0 ff ff       	call   80100660 <cprintf>
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
80101633:	83 c4 30             	add    $0x30,%esp
80101636:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101639:	c9                   	leave  
8010163a:	c3                   	ret    
8010163b:	90                   	nop
8010163c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101640 <ialloc>:
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
80101640:	55                   	push   %ebp
80101641:	89 e5                	mov    %esp,%ebp
80101643:	57                   	push   %edi
80101644:	56                   	push   %esi
80101645:	53                   	push   %ebx
80101646:	83 ec 1c             	sub    $0x1c,%esp
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101649:	83 3d e8 09 11 80 01 	cmpl   $0x1,0x801109e8
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
80101650:	8b 45 0c             	mov    0xc(%ebp),%eax
80101653:	8b 75 08             	mov    0x8(%ebp),%esi
80101656:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101659:	0f 86 91 00 00 00    	jbe    801016f0 <ialloc+0xb0>
8010165f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101664:	eb 21                	jmp    80101687 <ialloc+0x47>
80101666:	8d 76 00             	lea    0x0(%esi),%esi
80101669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101670:	83 ec 0c             	sub    $0xc,%esp
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101673:	83 c3 01             	add    $0x1,%ebx
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101676:	57                   	push   %edi
80101677:	e8 64 eb ff ff       	call   801001e0 <brelse>
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010167c:	83 c4 10             	add    $0x10,%esp
8010167f:	39 1d e8 09 11 80    	cmp    %ebx,0x801109e8
80101685:	76 69                	jbe    801016f0 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101687:	89 d8                	mov    %ebx,%eax
80101689:	83 ec 08             	sub    $0x8,%esp
8010168c:	c1 e8 03             	shr    $0x3,%eax
8010168f:	03 05 f4 09 11 80    	add    0x801109f4,%eax
80101695:	50                   	push   %eax
80101696:	56                   	push   %esi
80101697:	e8 34 ea ff ff       	call   801000d0 <bread>
8010169c:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
8010169e:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
801016a0:	83 c4 10             	add    $0x10,%esp
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
    dip = (struct dinode*)bp->data + inum%IPB;
801016a3:	83 e0 07             	and    $0x7,%eax
801016a6:	c1 e0 06             	shl    $0x6,%eax
801016a9:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
801016ad:	66 83 39 00          	cmpw   $0x0,(%ecx)
801016b1:	75 bd                	jne    80101670 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
801016b3:	83 ec 04             	sub    $0x4,%esp
801016b6:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801016b9:	6a 40                	push   $0x40
801016bb:	6a 00                	push   $0x0
801016bd:	51                   	push   %ecx
801016be:	e8 3d 2f 00 00       	call   80104600 <memset>
      dip->type = type;
801016c3:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
801016c7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801016ca:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
801016cd:	89 3c 24             	mov    %edi,(%esp)
801016d0:	e8 1b 18 00 00       	call   80102ef0 <log_write>
      brelse(bp);
801016d5:	89 3c 24             	mov    %edi,(%esp)
801016d8:	e8 03 eb ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
801016dd:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801016e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801016e3:	89 da                	mov    %ebx,%edx
801016e5:	89 f0                	mov    %esi,%eax
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801016e7:	5b                   	pop    %ebx
801016e8:	5e                   	pop    %esi
801016e9:	5f                   	pop    %edi
801016ea:	5d                   	pop    %ebp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801016eb:	e9 60 fc ff ff       	jmp    80101350 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
801016f0:	83 ec 0c             	sub    $0xc,%esp
801016f3:	68 54 73 10 80       	push   $0x80107354
801016f8:	e8 73 ec ff ff       	call   80100370 <panic>
801016fd:	8d 76 00             	lea    0x0(%esi),%esi

80101700 <iupdate>:
}

// Copy a modified in-memory inode to disk.
void
iupdate(struct inode *ip)
{
80101700:	55                   	push   %ebp
80101701:	89 e5                	mov    %esp,%ebp
80101703:	56                   	push   %esi
80101704:	53                   	push   %ebx
80101705:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101708:	83 ec 08             	sub    $0x8,%esp
8010170b:	8b 43 04             	mov    0x4(%ebx),%eax
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010170e:	83 c3 5c             	add    $0x5c,%ebx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101711:	c1 e8 03             	shr    $0x3,%eax
80101714:	03 05 f4 09 11 80    	add    0x801109f4,%eax
8010171a:	50                   	push   %eax
8010171b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010171e:	e8 ad e9 ff ff       	call   801000d0 <bread>
80101723:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
80101725:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
80101728:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010172c:	83 c4 0c             	add    $0xc,%esp
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
8010172f:	83 e0 07             	and    $0x7,%eax
80101732:	c1 e0 06             	shl    $0x6,%eax
80101735:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
80101739:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
8010173c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101740:	83 c0 0c             	add    $0xc,%eax
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
  dip->major = ip->major;
80101743:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
80101747:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010174b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
8010174f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101753:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
80101757:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010175a:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010175d:	6a 34                	push   $0x34
8010175f:	53                   	push   %ebx
80101760:	50                   	push   %eax
80101761:	e8 4a 2f 00 00       	call   801046b0 <memmove>
  log_write(bp);
80101766:	89 34 24             	mov    %esi,(%esp)
80101769:	e8 82 17 00 00       	call   80102ef0 <log_write>
  brelse(bp);
8010176e:	89 75 08             	mov    %esi,0x8(%ebp)
80101771:	83 c4 10             	add    $0x10,%esp
}
80101774:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101777:	5b                   	pop    %ebx
80101778:	5e                   	pop    %esi
80101779:	5d                   	pop    %ebp
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  log_write(bp);
  brelse(bp);
8010177a:	e9 61 ea ff ff       	jmp    801001e0 <brelse>
8010177f:	90                   	nop

80101780 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101780:	55                   	push   %ebp
80101781:	89 e5                	mov    %esp,%ebp
80101783:	53                   	push   %ebx
80101784:	83 ec 10             	sub    $0x10,%esp
80101787:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010178a:	68 00 0a 11 80       	push   $0x80110a00
8010178f:	e8 3c 2c 00 00       	call   801043d0 <acquire>
  ip->ref++;
80101794:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101798:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010179f:	e8 0c 2e 00 00       	call   801045b0 <release>
  return ip;
}
801017a4:	89 d8                	mov    %ebx,%eax
801017a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801017a9:	c9                   	leave  
801017aa:	c3                   	ret    
801017ab:	90                   	nop
801017ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801017b0 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
801017b0:	55                   	push   %ebp
801017b1:	89 e5                	mov    %esp,%ebp
801017b3:	56                   	push   %esi
801017b4:	53                   	push   %ebx
801017b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
801017b8:	85 db                	test   %ebx,%ebx
801017ba:	0f 84 b4 00 00 00    	je     80101874 <ilock+0xc4>
801017c0:	8b 43 08             	mov    0x8(%ebx),%eax
801017c3:	85 c0                	test   %eax,%eax
801017c5:	0f 8e a9 00 00 00    	jle    80101874 <ilock+0xc4>
    panic("ilock");

  acquiresleep(&ip->lock);
801017cb:	8d 43 0c             	lea    0xc(%ebx),%eax
801017ce:	83 ec 0c             	sub    $0xc,%esp
801017d1:	50                   	push   %eax
801017d2:	e8 09 2b 00 00       	call   801042e0 <acquiresleep>

  if(!(ip->flags & I_VALID)){
801017d7:	83 c4 10             	add    $0x10,%esp
801017da:	f6 43 4c 02          	testb  $0x2,0x4c(%ebx)
801017de:	74 10                	je     801017f0 <ilock+0x40>
    brelse(bp);
    ip->flags |= I_VALID;
    if(ip->type == 0)
      panic("ilock: no type");
  }
}
801017e0:	8d 65 f8             	lea    -0x8(%ebp),%esp
801017e3:	5b                   	pop    %ebx
801017e4:	5e                   	pop    %esi
801017e5:	5d                   	pop    %ebp
801017e6:	c3                   	ret    
801017e7:	89 f6                	mov    %esi,%esi
801017e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    panic("ilock");

  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801017f0:	8b 43 04             	mov    0x4(%ebx),%eax
801017f3:	83 ec 08             	sub    $0x8,%esp
801017f6:	c1 e8 03             	shr    $0x3,%eax
801017f9:	03 05 f4 09 11 80    	add    0x801109f4,%eax
801017ff:	50                   	push   %eax
80101800:	ff 33                	pushl  (%ebx)
80101802:	e8 c9 e8 ff ff       	call   801000d0 <bread>
80101807:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
80101809:	8b 43 04             	mov    0x4(%ebx),%eax
    ip->type = dip->type;
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
8010180c:	83 c4 0c             	add    $0xc,%esp

  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
8010180f:	83 e0 07             	and    $0x7,%eax
80101812:	c1 e0 06             	shl    $0x6,%eax
80101815:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
80101819:	0f b7 10             	movzwl (%eax),%edx
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
8010181c:	83 c0 0c             	add    $0xc,%eax
  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
8010181f:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
80101823:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
80101827:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
8010182b:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
8010182f:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
80101833:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101837:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
8010183b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010183e:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101841:	6a 34                	push   $0x34
80101843:	50                   	push   %eax
80101844:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101847:	50                   	push   %eax
80101848:	e8 63 2e 00 00       	call   801046b0 <memmove>
    brelse(bp);
8010184d:	89 34 24             	mov    %esi,(%esp)
80101850:	e8 8b e9 ff ff       	call   801001e0 <brelse>
    ip->flags |= I_VALID;
80101855:	83 4b 4c 02          	orl    $0x2,0x4c(%ebx)
    if(ip->type == 0)
80101859:	83 c4 10             	add    $0x10,%esp
8010185c:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
80101861:	0f 85 79 ff ff ff    	jne    801017e0 <ilock+0x30>
      panic("ilock: no type");
80101867:	83 ec 0c             	sub    $0xc,%esp
8010186a:	68 6c 73 10 80       	push   $0x8010736c
8010186f:	e8 fc ea ff ff       	call   80100370 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
80101874:	83 ec 0c             	sub    $0xc,%esp
80101877:	68 66 73 10 80       	push   $0x80107366
8010187c:	e8 ef ea ff ff       	call   80100370 <panic>
80101881:	eb 0d                	jmp    80101890 <iunlock>
80101883:	90                   	nop
80101884:	90                   	nop
80101885:	90                   	nop
80101886:	90                   	nop
80101887:	90                   	nop
80101888:	90                   	nop
80101889:	90                   	nop
8010188a:	90                   	nop
8010188b:	90                   	nop
8010188c:	90                   	nop
8010188d:	90                   	nop
8010188e:	90                   	nop
8010188f:	90                   	nop

80101890 <iunlock>:
}

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
80101890:	55                   	push   %ebp
80101891:	89 e5                	mov    %esp,%ebp
80101893:	56                   	push   %esi
80101894:	53                   	push   %ebx
80101895:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101898:	85 db                	test   %ebx,%ebx
8010189a:	74 28                	je     801018c4 <iunlock+0x34>
8010189c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010189f:	83 ec 0c             	sub    $0xc,%esp
801018a2:	56                   	push   %esi
801018a3:	e8 d8 2a 00 00       	call   80104380 <holdingsleep>
801018a8:	83 c4 10             	add    $0x10,%esp
801018ab:	85 c0                	test   %eax,%eax
801018ad:	74 15                	je     801018c4 <iunlock+0x34>
801018af:	8b 43 08             	mov    0x8(%ebx),%eax
801018b2:	85 c0                	test   %eax,%eax
801018b4:	7e 0e                	jle    801018c4 <iunlock+0x34>
    panic("iunlock");

  releasesleep(&ip->lock);
801018b6:	89 75 08             	mov    %esi,0x8(%ebp)
}
801018b9:	8d 65 f8             	lea    -0x8(%ebp),%esp
801018bc:	5b                   	pop    %ebx
801018bd:	5e                   	pop    %esi
801018be:	5d                   	pop    %ebp
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");

  releasesleep(&ip->lock);
801018bf:	e9 7c 2a 00 00       	jmp    80104340 <releasesleep>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");
801018c4:	83 ec 0c             	sub    $0xc,%esp
801018c7:	68 7b 73 10 80       	push   $0x8010737b
801018cc:	e8 9f ea ff ff       	call   80100370 <panic>
801018d1:	eb 0d                	jmp    801018e0 <iput>
801018d3:	90                   	nop
801018d4:	90                   	nop
801018d5:	90                   	nop
801018d6:	90                   	nop
801018d7:	90                   	nop
801018d8:	90                   	nop
801018d9:	90                   	nop
801018da:	90                   	nop
801018db:	90                   	nop
801018dc:	90                   	nop
801018dd:	90                   	nop
801018de:	90                   	nop
801018df:	90                   	nop

801018e0 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
801018e0:	55                   	push   %ebp
801018e1:	89 e5                	mov    %esp,%ebp
801018e3:	57                   	push   %edi
801018e4:	56                   	push   %esi
801018e5:	53                   	push   %ebx
801018e6:	83 ec 28             	sub    $0x28,%esp
801018e9:	8b 75 08             	mov    0x8(%ebp),%esi
  acquire(&icache.lock);
801018ec:	68 00 0a 11 80       	push   $0x80110a00
801018f1:	e8 da 2a 00 00       	call   801043d0 <acquire>
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
801018f6:	8b 46 08             	mov    0x8(%esi),%eax
801018f9:	83 c4 10             	add    $0x10,%esp
801018fc:	83 f8 01             	cmp    $0x1,%eax
801018ff:	74 1f                	je     80101920 <iput+0x40>
    ip->type = 0;
    iupdate(ip);
    acquire(&icache.lock);
    ip->flags = 0;
  }
  ip->ref--;
80101901:	83 e8 01             	sub    $0x1,%eax
80101904:	89 46 08             	mov    %eax,0x8(%esi)
  release(&icache.lock);
80101907:	c7 45 08 00 0a 11 80 	movl   $0x80110a00,0x8(%ebp)
}
8010190e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101911:	5b                   	pop    %ebx
80101912:	5e                   	pop    %esi
80101913:	5f                   	pop    %edi
80101914:	5d                   	pop    %ebp
    iupdate(ip);
    acquire(&icache.lock);
    ip->flags = 0;
  }
  ip->ref--;
  release(&icache.lock);
80101915:	e9 96 2c 00 00       	jmp    801045b0 <release>
8010191a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
// case it has to free the inode.
void
iput(struct inode *ip)
{
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
80101920:	f6 46 4c 02          	testb  $0x2,0x4c(%esi)
80101924:	74 db                	je     80101901 <iput+0x21>
80101926:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
8010192b:	75 d4                	jne    80101901 <iput+0x21>
    // inode has no links and no other references: truncate and free.
    release(&icache.lock);
8010192d:	83 ec 0c             	sub    $0xc,%esp
80101930:	8d 5e 5c             	lea    0x5c(%esi),%ebx
80101933:	8d be 8c 00 00 00    	lea    0x8c(%esi),%edi
80101939:	68 00 0a 11 80       	push   $0x80110a00
8010193e:	e8 6d 2c 00 00       	call   801045b0 <release>
80101943:	83 c4 10             	add    $0x10,%esp
80101946:	eb 0f                	jmp    80101957 <iput+0x77>
80101948:	90                   	nop
80101949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101950:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101953:	39 fb                	cmp    %edi,%ebx
80101955:	74 19                	je     80101970 <iput+0x90>
    if(ip->addrs[i]){
80101957:	8b 13                	mov    (%ebx),%edx
80101959:	85 d2                	test   %edx,%edx
8010195b:	74 f3                	je     80101950 <iput+0x70>
      bfree(ip->dev, ip->addrs[i]);
8010195d:	8b 06                	mov    (%esi),%eax
8010195f:	e8 cc fb ff ff       	call   80101530 <bfree>
      ip->addrs[i] = 0;
80101964:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010196a:	eb e4                	jmp    80101950 <iput+0x70>
8010196c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101970:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101976:	85 c0                	test   %eax,%eax
80101978:	75 46                	jne    801019c0 <iput+0xe0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010197a:	83 ec 0c             	sub    $0xc,%esp
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
8010197d:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101984:	56                   	push   %esi
80101985:	e8 76 fd ff ff       	call   80101700 <iupdate>
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
    // inode has no links and no other references: truncate and free.
    release(&icache.lock);
    itrunc(ip);
    ip->type = 0;
8010198a:	31 c0                	xor    %eax,%eax
8010198c:	66 89 46 50          	mov    %ax,0x50(%esi)
    iupdate(ip);
80101990:	89 34 24             	mov    %esi,(%esp)
80101993:	e8 68 fd ff ff       	call   80101700 <iupdate>
    acquire(&icache.lock);
80101998:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010199f:	e8 2c 2a 00 00       	call   801043d0 <acquire>
    ip->flags = 0;
801019a4:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
801019ab:	8b 46 08             	mov    0x8(%esi),%eax
801019ae:	83 c4 10             	add    $0x10,%esp
801019b1:	e9 4b ff ff ff       	jmp    80101901 <iput+0x21>
801019b6:	8d 76 00             	lea    0x0(%esi),%esi
801019b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801019c0:	83 ec 08             	sub    $0x8,%esp
801019c3:	50                   	push   %eax
801019c4:	ff 36                	pushl  (%esi)
801019c6:	e8 05 e7 ff ff       	call   801000d0 <bread>
801019cb:	83 c4 10             	add    $0x10,%esp
801019ce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
801019d1:	8d 58 5c             	lea    0x5c(%eax),%ebx
801019d4:	8d b8 5c 02 00 00    	lea    0x25c(%eax),%edi
801019da:	eb 0b                	jmp    801019e7 <iput+0x107>
801019dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801019e0:	83 c3 04             	add    $0x4,%ebx
    for(j = 0; j < NINDIRECT; j++){
801019e3:	39 df                	cmp    %ebx,%edi
801019e5:	74 0f                	je     801019f6 <iput+0x116>
      if(a[j])
801019e7:	8b 13                	mov    (%ebx),%edx
801019e9:	85 d2                	test   %edx,%edx
801019eb:	74 f3                	je     801019e0 <iput+0x100>
        bfree(ip->dev, a[j]);
801019ed:	8b 06                	mov    (%esi),%eax
801019ef:	e8 3c fb ff ff       	call   80101530 <bfree>
801019f4:	eb ea                	jmp    801019e0 <iput+0x100>
    }
    brelse(bp);
801019f6:	83 ec 0c             	sub    $0xc,%esp
801019f9:	ff 75 e4             	pushl  -0x1c(%ebp)
801019fc:	e8 df e7 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
80101a01:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
80101a07:	8b 06                	mov    (%esi),%eax
80101a09:	e8 22 fb ff ff       	call   80101530 <bfree>
    ip->addrs[NDIRECT] = 0;
80101a0e:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
80101a15:	00 00 00 
80101a18:	83 c4 10             	add    $0x10,%esp
80101a1b:	e9 5a ff ff ff       	jmp    8010197a <iput+0x9a>

80101a20 <iunlockput>:
}

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
80101a20:	55                   	push   %ebp
80101a21:	89 e5                	mov    %esp,%ebp
80101a23:	53                   	push   %ebx
80101a24:	83 ec 10             	sub    $0x10,%esp
80101a27:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
80101a2a:	53                   	push   %ebx
80101a2b:	e8 60 fe ff ff       	call   80101890 <iunlock>
  iput(ip);
80101a30:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101a33:	83 c4 10             	add    $0x10,%esp
}
80101a36:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101a39:	c9                   	leave  
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
80101a3a:	e9 a1 fe ff ff       	jmp    801018e0 <iput>
80101a3f:	90                   	nop

80101a40 <stati>:
}

// Copy stat information from inode.
void
stati(struct inode *ip, struct stat *st)
{
80101a40:	55                   	push   %ebp
80101a41:	89 e5                	mov    %esp,%ebp
80101a43:	8b 55 08             	mov    0x8(%ebp),%edx
80101a46:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101a49:	8b 0a                	mov    (%edx),%ecx
80101a4b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
80101a4e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101a51:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101a54:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101a58:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
80101a5b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
80101a5f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101a63:	8b 52 58             	mov    0x58(%edx),%edx
80101a66:	89 50 10             	mov    %edx,0x10(%eax)
}
80101a69:	5d                   	pop    %ebp
80101a6a:	c3                   	ret    
80101a6b:	90                   	nop
80101a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101a70 <readi>:

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101a70:	55                   	push   %ebp
80101a71:	89 e5                	mov    %esp,%ebp
80101a73:	57                   	push   %edi
80101a74:	56                   	push   %esi
80101a75:	53                   	push   %ebx
80101a76:	83 ec 1c             	sub    $0x1c,%esp
80101a79:	8b 45 08             	mov    0x8(%ebp),%eax
80101a7c:	8b 7d 0c             	mov    0xc(%ebp),%edi
80101a7f:	8b 75 10             	mov    0x10(%ebp),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a82:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101a87:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101a8a:	8b 7d 14             	mov    0x14(%ebp),%edi
80101a8d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a90:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a93:	0f 84 a7 00 00 00    	je     80101b40 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101a99:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a9c:	8b 40 58             	mov    0x58(%eax),%eax
80101a9f:	39 f0                	cmp    %esi,%eax
80101aa1:	0f 82 c1 00 00 00    	jb     80101b68 <readi+0xf8>
80101aa7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101aaa:	89 fa                	mov    %edi,%edx
80101aac:	01 f2                	add    %esi,%edx
80101aae:	0f 82 b4 00 00 00    	jb     80101b68 <readi+0xf8>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101ab4:	89 c1                	mov    %eax,%ecx
80101ab6:	29 f1                	sub    %esi,%ecx
80101ab8:	39 d0                	cmp    %edx,%eax
80101aba:	0f 43 cf             	cmovae %edi,%ecx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101abd:	31 ff                	xor    %edi,%edi
80101abf:	85 c9                	test   %ecx,%ecx
  }

  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101ac1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101ac4:	74 6d                	je     80101b33 <readi+0xc3>
80101ac6:	8d 76 00             	lea    0x0(%esi),%esi
80101ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ad0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
80101ad3:	89 f2                	mov    %esi,%edx
80101ad5:	c1 ea 09             	shr    $0x9,%edx
80101ad8:	89 d8                	mov    %ebx,%eax
80101ada:	e8 41 f9 ff ff       	call   80101420 <bmap>
80101adf:	83 ec 08             	sub    $0x8,%esp
80101ae2:	50                   	push   %eax
80101ae3:	ff 33                	pushl  (%ebx)
    m = min(n - tot, BSIZE - off%BSIZE);
80101ae5:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101aea:	e8 e1 e5 ff ff       	call   801000d0 <bread>
80101aef:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101af1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101af4:	89 f1                	mov    %esi,%ecx
80101af6:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101afc:	83 c4 0c             	add    $0xc,%esp
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
80101aff:	89 55 dc             	mov    %edx,-0x24(%ebp)
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
80101b02:	29 cb                	sub    %ecx,%ebx
80101b04:	29 f8                	sub    %edi,%eax
80101b06:	39 c3                	cmp    %eax,%ebx
80101b08:	0f 47 d8             	cmova  %eax,%ebx
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
80101b0b:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
80101b0f:	53                   	push   %ebx
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101b10:	01 df                	add    %ebx,%edi
80101b12:	01 de                	add    %ebx,%esi
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
80101b14:	50                   	push   %eax
80101b15:	ff 75 e0             	pushl  -0x20(%ebp)
80101b18:	e8 93 2b 00 00       	call   801046b0 <memmove>
    brelse(bp);
80101b1d:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101b20:	89 14 24             	mov    %edx,(%esp)
80101b23:	e8 b8 e6 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101b28:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101b2b:	83 c4 10             	add    $0x10,%esp
80101b2e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101b31:	77 9d                	ja     80101ad0 <readi+0x60>
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
80101b33:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101b36:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b39:	5b                   	pop    %ebx
80101b3a:	5e                   	pop    %esi
80101b3b:	5f                   	pop    %edi
80101b3c:	5d                   	pop    %ebp
80101b3d:	c3                   	ret    
80101b3e:	66 90                	xchg   %ax,%ax
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101b40:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b44:	66 83 f8 09          	cmp    $0x9,%ax
80101b48:	77 1e                	ja     80101b68 <readi+0xf8>
80101b4a:	8b 04 c5 80 09 11 80 	mov    -0x7feef680(,%eax,8),%eax
80101b51:	85 c0                	test   %eax,%eax
80101b53:	74 13                	je     80101b68 <readi+0xf8>
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101b55:	89 7d 10             	mov    %edi,0x10(%ebp)
    */
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
}
80101b58:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b5b:	5b                   	pop    %ebx
80101b5c:	5e                   	pop    %esi
80101b5d:	5f                   	pop    %edi
80101b5e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101b5f:	ff e0                	jmp    *%eax
80101b61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
80101b68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b6d:	eb c7                	jmp    80101b36 <readi+0xc6>
80101b6f:	90                   	nop

80101b70 <writei>:

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101b70:	55                   	push   %ebp
80101b71:	89 e5                	mov    %esp,%ebp
80101b73:	57                   	push   %edi
80101b74:	56                   	push   %esi
80101b75:	53                   	push   %ebx
80101b76:	83 ec 1c             	sub    $0x1c,%esp
80101b79:	8b 45 08             	mov    0x8(%ebp),%eax
80101b7c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101b7f:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101b82:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101b87:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101b8a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101b8d:	8b 75 10             	mov    0x10(%ebp),%esi
80101b90:	89 7d e0             	mov    %edi,-0x20(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101b93:	0f 84 b7 00 00 00    	je     80101c50 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101b99:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b9c:	39 70 58             	cmp    %esi,0x58(%eax)
80101b9f:	0f 82 eb 00 00 00    	jb     80101c90 <writei+0x120>
80101ba5:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101ba8:	89 f8                	mov    %edi,%eax
80101baa:	01 f0                	add    %esi,%eax
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101bac:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101bb1:	0f 87 d9 00 00 00    	ja     80101c90 <writei+0x120>
80101bb7:	39 c6                	cmp    %eax,%esi
80101bb9:	0f 87 d1 00 00 00    	ja     80101c90 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101bbf:	85 ff                	test   %edi,%edi
80101bc1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101bc8:	74 78                	je     80101c42 <writei+0xd2>
80101bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101bd0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101bd3:	89 f2                	mov    %esi,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101bd5:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101bda:	c1 ea 09             	shr    $0x9,%edx
80101bdd:	89 f8                	mov    %edi,%eax
80101bdf:	e8 3c f8 ff ff       	call   80101420 <bmap>
80101be4:	83 ec 08             	sub    $0x8,%esp
80101be7:	50                   	push   %eax
80101be8:	ff 37                	pushl  (%edi)
80101bea:	e8 e1 e4 ff ff       	call   801000d0 <bread>
80101bef:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101bf1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101bf4:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101bf7:	89 f1                	mov    %esi,%ecx
80101bf9:	83 c4 0c             	add    $0xc,%esp
80101bfc:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101c02:	29 cb                	sub    %ecx,%ebx
80101c04:	39 c3                	cmp    %eax,%ebx
80101c06:	0f 47 d8             	cmova  %eax,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101c09:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101c0d:	53                   	push   %ebx
80101c0e:	ff 75 dc             	pushl  -0x24(%ebp)
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101c11:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(bp->data + off%BSIZE, src, m);
80101c13:	50                   	push   %eax
80101c14:	e8 97 2a 00 00       	call   801046b0 <memmove>
    log_write(bp);
80101c19:	89 3c 24             	mov    %edi,(%esp)
80101c1c:	e8 cf 12 00 00       	call   80102ef0 <log_write>
    brelse(bp);
80101c21:	89 3c 24             	mov    %edi,(%esp)
80101c24:	e8 b7 e5 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101c29:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101c2c:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101c2f:	83 c4 10             	add    $0x10,%esp
80101c32:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101c35:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101c38:	77 96                	ja     80101bd0 <writei+0x60>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
80101c3a:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101c3d:	3b 70 58             	cmp    0x58(%eax),%esi
80101c40:	77 36                	ja     80101c78 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101c42:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101c45:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c48:	5b                   	pop    %ebx
80101c49:	5e                   	pop    %esi
80101c4a:	5f                   	pop    %edi
80101c4b:	5d                   	pop    %ebp
80101c4c:	c3                   	ret    
80101c4d:	8d 76 00             	lea    0x0(%esi),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101c50:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101c54:	66 83 f8 09          	cmp    $0x9,%ax
80101c58:	77 36                	ja     80101c90 <writei+0x120>
80101c5a:	8b 04 c5 84 09 11 80 	mov    -0x7feef67c(,%eax,8),%eax
80101c61:	85 c0                	test   %eax,%eax
80101c63:	74 2b                	je     80101c90 <writei+0x120>
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101c65:	89 7d 10             	mov    %edi,0x10(%ebp)
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101c68:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c6b:	5b                   	pop    %ebx
80101c6c:	5e                   	pop    %esi
80101c6d:	5f                   	pop    %edi
80101c6e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101c6f:	ff e0                	jmp    *%eax
80101c71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101c78:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101c7b:	83 ec 0c             	sub    $0xc,%esp
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101c7e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101c81:	50                   	push   %eax
80101c82:	e8 79 fa ff ff       	call   80101700 <iupdate>
80101c87:	83 c4 10             	add    $0x10,%esp
80101c8a:	eb b6                	jmp    80101c42 <writei+0xd2>
80101c8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
80101c90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101c95:	eb ae                	jmp    80101c45 <writei+0xd5>
80101c97:	89 f6                	mov    %esi,%esi
80101c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ca0 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101ca0:	55                   	push   %ebp
80101ca1:	89 e5                	mov    %esp,%ebp
80101ca3:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101ca6:	6a 0e                	push   $0xe
80101ca8:	ff 75 0c             	pushl  0xc(%ebp)
80101cab:	ff 75 08             	pushl  0x8(%ebp)
80101cae:	e8 7d 2a 00 00       	call   80104730 <strncmp>
}
80101cb3:	c9                   	leave  
80101cb4:	c3                   	ret    
80101cb5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101cc0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101cc0:	55                   	push   %ebp
80101cc1:	89 e5                	mov    %esp,%ebp
80101cc3:	57                   	push   %edi
80101cc4:	56                   	push   %esi
80101cc5:	53                   	push   %ebx
80101cc6:	83 ec 1c             	sub    $0x1c,%esp
80101cc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101ccc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101cd1:	0f 85 80 00 00 00    	jne    80101d57 <dirlookup+0x97>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101cd7:	8b 53 58             	mov    0x58(%ebx),%edx
80101cda:	31 ff                	xor    %edi,%edi
80101cdc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101cdf:	85 d2                	test   %edx,%edx
80101ce1:	75 0d                	jne    80101cf0 <dirlookup+0x30>
80101ce3:	eb 5b                	jmp    80101d40 <dirlookup+0x80>
80101ce5:	8d 76 00             	lea    0x0(%esi),%esi
80101ce8:	83 c7 10             	add    $0x10,%edi
80101ceb:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101cee:	76 50                	jbe    80101d40 <dirlookup+0x80>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101cf0:	6a 10                	push   $0x10
80101cf2:	57                   	push   %edi
80101cf3:	56                   	push   %esi
80101cf4:	53                   	push   %ebx
80101cf5:	e8 76 fd ff ff       	call   80101a70 <readi>
80101cfa:	83 c4 10             	add    $0x10,%esp
80101cfd:	83 f8 10             	cmp    $0x10,%eax
80101d00:	75 48                	jne    80101d4a <dirlookup+0x8a>
      panic("dirlink read");
    if(de.inum == 0)
80101d02:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101d07:	74 df                	je     80101ce8 <dirlookup+0x28>
// Directories

int
namecmp(const char *s, const char *t)
{
  return strncmp(s, t, DIRSIZ);
80101d09:	8d 45 da             	lea    -0x26(%ebp),%eax
80101d0c:	83 ec 04             	sub    $0x4,%esp
80101d0f:	6a 0e                	push   $0xe
80101d11:	50                   	push   %eax
80101d12:	ff 75 0c             	pushl  0xc(%ebp)
80101d15:	e8 16 2a 00 00       	call   80104730 <strncmp>
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
    if(de.inum == 0)
      continue;
    if(namecmp(name, de.name) == 0){
80101d1a:	83 c4 10             	add    $0x10,%esp
80101d1d:	85 c0                	test   %eax,%eax
80101d1f:	75 c7                	jne    80101ce8 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101d21:	8b 45 10             	mov    0x10(%ebp),%eax
80101d24:	85 c0                	test   %eax,%eax
80101d26:	74 05                	je     80101d2d <dirlookup+0x6d>
        *poff = off;
80101d28:	8b 45 10             	mov    0x10(%ebp),%eax
80101d2b:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
      return iget(dp->dev, inum);
80101d2d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101d31:	8b 03                	mov    (%ebx),%eax
80101d33:	e8 18 f6 ff ff       	call   80101350 <iget>
    }
  }

  return 0;
}
80101d38:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d3b:	5b                   	pop    %ebx
80101d3c:	5e                   	pop    %esi
80101d3d:	5f                   	pop    %edi
80101d3e:	5d                   	pop    %ebp
80101d3f:	c3                   	ret    
80101d40:	8d 65 f4             	lea    -0xc(%ebp),%esp
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101d43:	31 c0                	xor    %eax,%eax
}
80101d45:	5b                   	pop    %ebx
80101d46:	5e                   	pop    %esi
80101d47:	5f                   	pop    %edi
80101d48:	5d                   	pop    %ebp
80101d49:	c3                   	ret    
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101d4a:	83 ec 0c             	sub    $0xc,%esp
80101d4d:	68 95 73 10 80       	push   $0x80107395
80101d52:	e8 19 e6 ff ff       	call   80100370 <panic>
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
80101d57:	83 ec 0c             	sub    $0xc,%esp
80101d5a:	68 83 73 10 80       	push   $0x80107383
80101d5f:	e8 0c e6 ff ff       	call   80100370 <panic>
80101d64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101d6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101d70 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101d70:	55                   	push   %ebp
80101d71:	89 e5                	mov    %esp,%ebp
80101d73:	57                   	push   %edi
80101d74:	56                   	push   %esi
80101d75:	53                   	push   %ebx
80101d76:	89 cf                	mov    %ecx,%edi
80101d78:	89 c3                	mov    %eax,%ebx
80101d7a:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101d7d:	80 38 2f             	cmpb   $0x2f,(%eax)
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101d80:	89 55 e0             	mov    %edx,-0x20(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101d83:	0f 84 53 01 00 00    	je     80101edc <namex+0x16c>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
80101d89:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101d8f:	83 ec 0c             	sub    $0xc,%esp
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
80101d92:	8b 70 68             	mov    0x68(%eax),%esi
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101d95:	68 00 0a 11 80       	push   $0x80110a00
80101d9a:	e8 31 26 00 00       	call   801043d0 <acquire>
  ip->ref++;
80101d9f:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101da3:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101daa:	e8 01 28 00 00       	call   801045b0 <release>
80101daf:	83 c4 10             	add    $0x10,%esp
80101db2:	eb 07                	jmp    80101dbb <namex+0x4b>
80101db4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  char *s;
  int len;

  while(*path == '/')
    path++;
80101db8:	83 c3 01             	add    $0x1,%ebx
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80101dbb:	0f b6 03             	movzbl (%ebx),%eax
80101dbe:	3c 2f                	cmp    $0x2f,%al
80101dc0:	74 f6                	je     80101db8 <namex+0x48>
    path++;
  if(*path == 0)
80101dc2:	84 c0                	test   %al,%al
80101dc4:	0f 84 e3 00 00 00    	je     80101ead <namex+0x13d>
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101dca:	0f b6 03             	movzbl (%ebx),%eax
80101dcd:	89 da                	mov    %ebx,%edx
80101dcf:	84 c0                	test   %al,%al
80101dd1:	0f 84 ac 00 00 00    	je     80101e83 <namex+0x113>
80101dd7:	3c 2f                	cmp    $0x2f,%al
80101dd9:	75 09                	jne    80101de4 <namex+0x74>
80101ddb:	e9 a3 00 00 00       	jmp    80101e83 <namex+0x113>
80101de0:	84 c0                	test   %al,%al
80101de2:	74 0a                	je     80101dee <namex+0x7e>
    path++;
80101de4:	83 c2 01             	add    $0x1,%edx
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101de7:	0f b6 02             	movzbl (%edx),%eax
80101dea:	3c 2f                	cmp    $0x2f,%al
80101dec:	75 f2                	jne    80101de0 <namex+0x70>
80101dee:	89 d1                	mov    %edx,%ecx
80101df0:	29 d9                	sub    %ebx,%ecx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
80101df2:	83 f9 0d             	cmp    $0xd,%ecx
80101df5:	0f 8e 8d 00 00 00    	jle    80101e88 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101dfb:	83 ec 04             	sub    $0x4,%esp
80101dfe:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101e01:	6a 0e                	push   $0xe
80101e03:	53                   	push   %ebx
80101e04:	57                   	push   %edi
80101e05:	e8 a6 28 00 00       	call   801046b0 <memmove>
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101e0a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
80101e0d:	83 c4 10             	add    $0x10,%esp
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101e10:	89 d3                	mov    %edx,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101e12:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101e15:	75 11                	jne    80101e28 <namex+0xb8>
80101e17:	89 f6                	mov    %esi,%esi
80101e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101e20:	83 c3 01             	add    $0x1,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101e23:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101e26:	74 f8                	je     80101e20 <namex+0xb0>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101e28:	83 ec 0c             	sub    $0xc,%esp
80101e2b:	56                   	push   %esi
80101e2c:	e8 7f f9 ff ff       	call   801017b0 <ilock>
    if(ip->type != T_DIR){
80101e31:	83 c4 10             	add    $0x10,%esp
80101e34:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101e39:	0f 85 7f 00 00 00    	jne    80101ebe <namex+0x14e>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101e3f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101e42:	85 d2                	test   %edx,%edx
80101e44:	74 09                	je     80101e4f <namex+0xdf>
80101e46:	80 3b 00             	cmpb   $0x0,(%ebx)
80101e49:	0f 84 a3 00 00 00    	je     80101ef2 <namex+0x182>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101e4f:	83 ec 04             	sub    $0x4,%esp
80101e52:	6a 00                	push   $0x0
80101e54:	57                   	push   %edi
80101e55:	56                   	push   %esi
80101e56:	e8 65 fe ff ff       	call   80101cc0 <dirlookup>
80101e5b:	83 c4 10             	add    $0x10,%esp
80101e5e:	85 c0                	test   %eax,%eax
80101e60:	74 5c                	je     80101ebe <namex+0x14e>

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101e62:	83 ec 0c             	sub    $0xc,%esp
80101e65:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101e68:	56                   	push   %esi
80101e69:	e8 22 fa ff ff       	call   80101890 <iunlock>
  iput(ip);
80101e6e:	89 34 24             	mov    %esi,(%esp)
80101e71:	e8 6a fa ff ff       	call   801018e0 <iput>
80101e76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101e79:	83 c4 10             	add    $0x10,%esp
80101e7c:	89 c6                	mov    %eax,%esi
80101e7e:	e9 38 ff ff ff       	jmp    80101dbb <namex+0x4b>
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101e83:	31 c9                	xor    %ecx,%ecx
80101e85:	8d 76 00             	lea    0x0(%esi),%esi
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
80101e88:	83 ec 04             	sub    $0x4,%esp
80101e8b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101e8e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101e91:	51                   	push   %ecx
80101e92:	53                   	push   %ebx
80101e93:	57                   	push   %edi
80101e94:	e8 17 28 00 00       	call   801046b0 <memmove>
    name[len] = 0;
80101e99:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101e9c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101e9f:	83 c4 10             	add    $0x10,%esp
80101ea2:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101ea6:	89 d3                	mov    %edx,%ebx
80101ea8:	e9 65 ff ff ff       	jmp    80101e12 <namex+0xa2>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101ead:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101eb0:	85 c0                	test   %eax,%eax
80101eb2:	75 54                	jne    80101f08 <namex+0x198>
80101eb4:	89 f0                	mov    %esi,%eax
    iput(ip);
    return 0;
  }
  return ip;
}
80101eb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101eb9:	5b                   	pop    %ebx
80101eba:	5e                   	pop    %esi
80101ebb:	5f                   	pop    %edi
80101ebc:	5d                   	pop    %ebp
80101ebd:	c3                   	ret    

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101ebe:	83 ec 0c             	sub    $0xc,%esp
80101ec1:	56                   	push   %esi
80101ec2:	e8 c9 f9 ff ff       	call   80101890 <iunlock>
  iput(ip);
80101ec7:	89 34 24             	mov    %esi,(%esp)
80101eca:	e8 11 fa ff ff       	call   801018e0 <iput>
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101ecf:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101ed2:	8d 65 f4             	lea    -0xc(%ebp),%esp
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101ed5:	31 c0                	xor    %eax,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101ed7:	5b                   	pop    %ebx
80101ed8:	5e                   	pop    %esi
80101ed9:	5f                   	pop    %edi
80101eda:	5d                   	pop    %ebp
80101edb:	c3                   	ret    
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
80101edc:	ba 01 00 00 00       	mov    $0x1,%edx
80101ee1:	b8 01 00 00 00       	mov    $0x1,%eax
80101ee6:	e8 65 f4 ff ff       	call   80101350 <iget>
80101eeb:	89 c6                	mov    %eax,%esi
80101eed:	e9 c9 fe ff ff       	jmp    80101dbb <namex+0x4b>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
80101ef2:	83 ec 0c             	sub    $0xc,%esp
80101ef5:	56                   	push   %esi
80101ef6:	e8 95 f9 ff ff       	call   80101890 <iunlock>
      return ip;
80101efb:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101efe:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
      return ip;
80101f01:	89 f0                	mov    %esi,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101f03:	5b                   	pop    %ebx
80101f04:	5e                   	pop    %esi
80101f05:	5f                   	pop    %edi
80101f06:	5d                   	pop    %ebp
80101f07:	c3                   	ret    
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101f08:	83 ec 0c             	sub    $0xc,%esp
80101f0b:	56                   	push   %esi
80101f0c:	e8 cf f9 ff ff       	call   801018e0 <iput>
    return 0;
80101f11:	83 c4 10             	add    $0x10,%esp
80101f14:	31 c0                	xor    %eax,%eax
80101f16:	eb 9e                	jmp    80101eb6 <namex+0x146>
80101f18:	90                   	nop
80101f19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101f20 <dirlink>:
}

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101f20:	55                   	push   %ebp
80101f21:	89 e5                	mov    %esp,%ebp
80101f23:	57                   	push   %edi
80101f24:	56                   	push   %esi
80101f25:	53                   	push   %ebx
80101f26:	83 ec 20             	sub    $0x20,%esp
80101f29:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101f2c:	6a 00                	push   $0x0
80101f2e:	ff 75 0c             	pushl  0xc(%ebp)
80101f31:	53                   	push   %ebx
80101f32:	e8 89 fd ff ff       	call   80101cc0 <dirlookup>
80101f37:	83 c4 10             	add    $0x10,%esp
80101f3a:	85 c0                	test   %eax,%eax
80101f3c:	75 67                	jne    80101fa5 <dirlink+0x85>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101f3e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101f41:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101f44:	85 ff                	test   %edi,%edi
80101f46:	74 29                	je     80101f71 <dirlink+0x51>
80101f48:	31 ff                	xor    %edi,%edi
80101f4a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101f4d:	eb 09                	jmp    80101f58 <dirlink+0x38>
80101f4f:	90                   	nop
80101f50:	83 c7 10             	add    $0x10,%edi
80101f53:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101f56:	76 19                	jbe    80101f71 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101f58:	6a 10                	push   $0x10
80101f5a:	57                   	push   %edi
80101f5b:	56                   	push   %esi
80101f5c:	53                   	push   %ebx
80101f5d:	e8 0e fb ff ff       	call   80101a70 <readi>
80101f62:	83 c4 10             	add    $0x10,%esp
80101f65:	83 f8 10             	cmp    $0x10,%eax
80101f68:	75 4e                	jne    80101fb8 <dirlink+0x98>
      panic("dirlink read");
    if(de.inum == 0)
80101f6a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101f6f:	75 df                	jne    80101f50 <dirlink+0x30>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
80101f71:	8d 45 da             	lea    -0x26(%ebp),%eax
80101f74:	83 ec 04             	sub    $0x4,%esp
80101f77:	6a 0e                	push   $0xe
80101f79:	ff 75 0c             	pushl  0xc(%ebp)
80101f7c:	50                   	push   %eax
80101f7d:	e8 1e 28 00 00       	call   801047a0 <strncpy>
  de.inum = inum;
80101f82:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101f85:	6a 10                	push   $0x10
80101f87:	57                   	push   %edi
80101f88:	56                   	push   %esi
80101f89:	53                   	push   %ebx
    if(de.inum == 0)
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
80101f8a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101f8e:	e8 dd fb ff ff       	call   80101b70 <writei>
80101f93:	83 c4 20             	add    $0x20,%esp
80101f96:	83 f8 10             	cmp    $0x10,%eax
80101f99:	75 2a                	jne    80101fc5 <dirlink+0xa5>
    panic("dirlink");

  return 0;
80101f9b:	31 c0                	xor    %eax,%eax
}
80101f9d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fa0:	5b                   	pop    %ebx
80101fa1:	5e                   	pop    %esi
80101fa2:	5f                   	pop    %edi
80101fa3:	5d                   	pop    %ebp
80101fa4:	c3                   	ret    
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
80101fa5:	83 ec 0c             	sub    $0xc,%esp
80101fa8:	50                   	push   %eax
80101fa9:	e8 32 f9 ff ff       	call   801018e0 <iput>
    return -1;
80101fae:	83 c4 10             	add    $0x10,%esp
80101fb1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101fb6:	eb e5                	jmp    80101f9d <dirlink+0x7d>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101fb8:	83 ec 0c             	sub    $0xc,%esp
80101fbb:	68 95 73 10 80       	push   $0x80107395
80101fc0:	e8 ab e3 ff ff       	call   80100370 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
80101fc5:	83 ec 0c             	sub    $0xc,%esp
80101fc8:	68 a2 79 10 80       	push   $0x801079a2
80101fcd:	e8 9e e3 ff ff       	call   80100370 <panic>
80101fd2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101fe0 <namei>:
  return ip;
}

struct inode*
namei(char *path)
{
80101fe0:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101fe1:	31 d2                	xor    %edx,%edx
  return ip;
}

struct inode*
namei(char *path)
{
80101fe3:	89 e5                	mov    %esp,%ebp
80101fe5:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101fe8:	8b 45 08             	mov    0x8(%ebp),%eax
80101feb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101fee:	e8 7d fd ff ff       	call   80101d70 <namex>
}
80101ff3:	c9                   	leave  
80101ff4:	c3                   	ret    
80101ff5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102000 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80102000:	55                   	push   %ebp
  return namex(path, 1, name);
80102001:	ba 01 00 00 00       	mov    $0x1,%edx
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
80102006:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80102008:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010200b:	8b 45 08             	mov    0x8(%ebp),%eax
}
8010200e:	5d                   	pop    %ebp
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
8010200f:	e9 5c fd ff ff       	jmp    80101d70 <namex>
80102014:	66 90                	xchg   %ax,%ax
80102016:	66 90                	xchg   %ax,%ax
80102018:	66 90                	xchg   %ax,%ax
8010201a:	66 90                	xchg   %ax,%ax
8010201c:	66 90                	xchg   %ax,%ax
8010201e:	66 90                	xchg   %ax,%ax

80102020 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80102020:	55                   	push   %ebp
  if(b == 0)
80102021:	85 c0                	test   %eax,%eax
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80102023:	89 e5                	mov    %esp,%ebp
80102025:	56                   	push   %esi
80102026:	53                   	push   %ebx
  if(b == 0)
80102027:	0f 84 ad 00 00 00    	je     801020da <idestart+0xba>
    panic("idestart");
  if(b->blockno >= FSSIZE)
8010202d:	8b 58 08             	mov    0x8(%eax),%ebx
80102030:	89 c1                	mov    %eax,%ecx
80102032:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80102038:	0f 87 8f 00 00 00    	ja     801020cd <idestart+0xad>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010203e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102043:	90                   	nop
80102044:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102048:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102049:	83 e0 c0             	and    $0xffffffc0,%eax
8010204c:	3c 40                	cmp    $0x40,%al
8010204e:	75 f8                	jne    80102048 <idestart+0x28>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102050:	31 f6                	xor    %esi,%esi
80102052:	ba f6 03 00 00       	mov    $0x3f6,%edx
80102057:	89 f0                	mov    %esi,%eax
80102059:	ee                   	out    %al,(%dx)
8010205a:	ba f2 01 00 00       	mov    $0x1f2,%edx
8010205f:	b8 01 00 00 00       	mov    $0x1,%eax
80102064:	ee                   	out    %al,(%dx)
80102065:	ba f3 01 00 00       	mov    $0x1f3,%edx
8010206a:	89 d8                	mov    %ebx,%eax
8010206c:	ee                   	out    %al,(%dx)
8010206d:	89 d8                	mov    %ebx,%eax
8010206f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80102074:	c1 f8 08             	sar    $0x8,%eax
80102077:	ee                   	out    %al,(%dx)
80102078:	ba f5 01 00 00       	mov    $0x1f5,%edx
8010207d:	89 f0                	mov    %esi,%eax
8010207f:	ee                   	out    %al,(%dx)
80102080:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80102084:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102089:	83 e0 01             	and    $0x1,%eax
8010208c:	c1 e0 04             	shl    $0x4,%eax
8010208f:	83 c8 e0             	or     $0xffffffe0,%eax
80102092:	ee                   	out    %al,(%dx)
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
80102093:	f6 01 04             	testb  $0x4,(%ecx)
80102096:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010209b:	75 13                	jne    801020b0 <idestart+0x90>
8010209d:	b8 20 00 00 00       	mov    $0x20,%eax
801020a2:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
801020a3:	8d 65 f8             	lea    -0x8(%ebp),%esp
801020a6:	5b                   	pop    %ebx
801020a7:	5e                   	pop    %esi
801020a8:	5d                   	pop    %ebp
801020a9:	c3                   	ret    
801020aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801020b0:	b8 30 00 00 00       	mov    $0x30,%eax
801020b5:	ee                   	out    %al,(%dx)
}

static inline void
outsl(int port, const void *addr, int cnt)
{
  asm volatile("cld; rep outsl" :
801020b6:	ba f0 01 00 00       	mov    $0x1f0,%edx
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
801020bb:	8d 71 5c             	lea    0x5c(%ecx),%esi
801020be:	b9 80 00 00 00       	mov    $0x80,%ecx
801020c3:	fc                   	cld    
801020c4:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  } else {
    outb(0x1f7, read_cmd);
  }
}
801020c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801020c9:	5b                   	pop    %ebx
801020ca:	5e                   	pop    %esi
801020cb:	5d                   	pop    %ebp
801020cc:	c3                   	ret    
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
  if(b->blockno >= FSSIZE)
    panic("incorrect blockno");
801020cd:	83 ec 0c             	sub    $0xc,%esp
801020d0:	68 00 74 10 80       	push   $0x80107400
801020d5:	e8 96 e2 ff ff       	call   80100370 <panic>
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
801020da:	83 ec 0c             	sub    $0xc,%esp
801020dd:	68 f7 73 10 80       	push   $0x801073f7
801020e2:	e8 89 e2 ff ff       	call   80100370 <panic>
801020e7:	89 f6                	mov    %esi,%esi
801020e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801020f0 <ideinit>:
  return 0;
}

void
ideinit(void)
{
801020f0:	55                   	push   %ebp
801020f1:	89 e5                	mov    %esp,%ebp
801020f3:	83 ec 10             	sub    $0x10,%esp
  int i;

  initlock(&idelock, "ide");
801020f6:	68 12 74 10 80       	push   $0x80107412
801020fb:	68 80 a5 10 80       	push   $0x8010a580
80102100:	e8 ab 22 00 00       	call   801043b0 <initlock>
  picenable(IRQ_IDE);
80102105:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
8010210c:	e8 cf 12 00 00       	call   801033e0 <picenable>
  ioapicenable(IRQ_IDE, ncpu - 1);
80102111:	58                   	pop    %eax
80102112:	a1 80 2d 11 80       	mov    0x80112d80,%eax
80102117:	5a                   	pop    %edx
80102118:	83 e8 01             	sub    $0x1,%eax
8010211b:	50                   	push   %eax
8010211c:	6a 0e                	push   $0xe
8010211e:	e8 bd 02 00 00       	call   801023e0 <ioapicenable>
80102123:	83 c4 10             	add    $0x10,%esp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102126:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010212b:	90                   	nop
8010212c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102130:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102131:	83 e0 c0             	and    $0xffffffc0,%eax
80102134:	3c 40                	cmp    $0x40,%al
80102136:	75 f8                	jne    80102130 <ideinit+0x40>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102138:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010213d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102142:	ee                   	out    %al,(%dx)
80102143:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102148:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010214d:	eb 06                	jmp    80102155 <ideinit+0x65>
8010214f:	90                   	nop
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);

  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
80102150:	83 e9 01             	sub    $0x1,%ecx
80102153:	74 0f                	je     80102164 <ideinit+0x74>
80102155:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102156:	84 c0                	test   %al,%al
80102158:	74 f6                	je     80102150 <ideinit+0x60>
      havedisk1 = 1;
8010215a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102161:	00 00 00 
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102164:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102169:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010216e:	ee                   	out    %al,(%dx)
    }
  }

  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
}
8010216f:	c9                   	leave  
80102170:	c3                   	ret    
80102171:	eb 0d                	jmp    80102180 <ideintr>
80102173:	90                   	nop
80102174:	90                   	nop
80102175:	90                   	nop
80102176:	90                   	nop
80102177:	90                   	nop
80102178:	90                   	nop
80102179:	90                   	nop
8010217a:	90                   	nop
8010217b:	90                   	nop
8010217c:	90                   	nop
8010217d:	90                   	nop
8010217e:	90                   	nop
8010217f:	90                   	nop

80102180 <ideintr>:
}

// Interrupt handler.
void
ideintr(void)
{
80102180:	55                   	push   %ebp
80102181:	89 e5                	mov    %esp,%ebp
80102183:	57                   	push   %edi
80102184:	56                   	push   %esi
80102185:	53                   	push   %ebx
80102186:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102189:	68 80 a5 10 80       	push   $0x8010a580
8010218e:	e8 3d 22 00 00       	call   801043d0 <acquire>
  if((b = idequeue) == 0){
80102193:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
80102199:	83 c4 10             	add    $0x10,%esp
8010219c:	85 db                	test   %ebx,%ebx
8010219e:	74 34                	je     801021d4 <ideintr+0x54>
    release(&idelock);
    // cprintf("spurious IDE interrupt\n");
    return;
  }
  idequeue = b->qnext;
801021a0:	8b 43 58             	mov    0x58(%ebx),%eax
801021a3:	a3 64 a5 10 80       	mov    %eax,0x8010a564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
801021a8:	8b 33                	mov    (%ebx),%esi
801021aa:	f7 c6 04 00 00 00    	test   $0x4,%esi
801021b0:	74 3e                	je     801021f0 <ideintr+0x70>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
801021b2:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
801021b5:	83 ec 0c             	sub    $0xc,%esp
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
801021b8:	83 ce 02             	or     $0x2,%esi
801021bb:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
801021bd:	53                   	push   %ebx
801021be:	e8 2d 1f 00 00       	call   801040f0 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
801021c3:	a1 64 a5 10 80       	mov    0x8010a564,%eax
801021c8:	83 c4 10             	add    $0x10,%esp
801021cb:	85 c0                	test   %eax,%eax
801021cd:	74 05                	je     801021d4 <ideintr+0x54>
    idestart(idequeue);
801021cf:	e8 4c fe ff ff       	call   80102020 <idestart>
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
  if((b = idequeue) == 0){
    release(&idelock);
801021d4:	83 ec 0c             	sub    $0xc,%esp
801021d7:	68 80 a5 10 80       	push   $0x8010a580
801021dc:	e8 cf 23 00 00       	call   801045b0 <release>
  // Start disk on next buf in queue.
  if(idequeue != 0)
    idestart(idequeue);

  release(&idelock);
}
801021e1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801021e4:	5b                   	pop    %ebx
801021e5:	5e                   	pop    %esi
801021e6:	5f                   	pop    %edi
801021e7:	5d                   	pop    %ebp
801021e8:	c3                   	ret    
801021e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801021f0:	ba f7 01 00 00       	mov    $0x1f7,%edx
801021f5:	8d 76 00             	lea    0x0(%esi),%esi
801021f8:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801021f9:	89 c1                	mov    %eax,%ecx
801021fb:	83 e1 c0             	and    $0xffffffc0,%ecx
801021fe:	80 f9 40             	cmp    $0x40,%cl
80102201:	75 f5                	jne    801021f8 <ideintr+0x78>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
80102203:	a8 21                	test   $0x21,%al
80102205:	75 ab                	jne    801021b2 <ideintr+0x32>
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
80102207:	8d 7b 5c             	lea    0x5c(%ebx),%edi
}

static inline void
insl(int port, void *addr, int cnt)
{
  asm volatile("cld; rep insl" :
8010220a:	b9 80 00 00 00       	mov    $0x80,%ecx
8010220f:	ba f0 01 00 00       	mov    $0x1f0,%edx
80102214:	fc                   	cld    
80102215:	f3 6d                	rep insl (%dx),%es:(%edi)
80102217:	8b 33                	mov    (%ebx),%esi
80102219:	eb 97                	jmp    801021b2 <ideintr+0x32>
8010221b:	90                   	nop
8010221c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102220 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102220:	55                   	push   %ebp
80102221:	89 e5                	mov    %esp,%ebp
80102223:	53                   	push   %ebx
80102224:	83 ec 10             	sub    $0x10,%esp
80102227:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
8010222a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010222d:	50                   	push   %eax
8010222e:	e8 4d 21 00 00       	call   80104380 <holdingsleep>
80102233:	83 c4 10             	add    $0x10,%esp
80102236:	85 c0                	test   %eax,%eax
80102238:	0f 84 ad 00 00 00    	je     801022eb <iderw+0xcb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010223e:	8b 03                	mov    (%ebx),%eax
80102240:	83 e0 06             	and    $0x6,%eax
80102243:	83 f8 02             	cmp    $0x2,%eax
80102246:	0f 84 b9 00 00 00    	je     80102305 <iderw+0xe5>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010224c:	8b 53 04             	mov    0x4(%ebx),%edx
8010224f:	85 d2                	test   %edx,%edx
80102251:	74 0d                	je     80102260 <iderw+0x40>
80102253:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102258:	85 c0                	test   %eax,%eax
8010225a:	0f 84 98 00 00 00    	je     801022f8 <iderw+0xd8>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102260:	83 ec 0c             	sub    $0xc,%esp
80102263:	68 80 a5 10 80       	push   $0x8010a580
80102268:	e8 63 21 00 00       	call   801043d0 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010226d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102273:	83 c4 10             	add    $0x10,%esp
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
80102276:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010227d:	85 d2                	test   %edx,%edx
8010227f:	75 09                	jne    8010228a <iderw+0x6a>
80102281:	eb 58                	jmp    801022db <iderw+0xbb>
80102283:	90                   	nop
80102284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102288:	89 c2                	mov    %eax,%edx
8010228a:	8b 42 58             	mov    0x58(%edx),%eax
8010228d:	85 c0                	test   %eax,%eax
8010228f:	75 f7                	jne    80102288 <iderw+0x68>
80102291:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
80102294:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
80102296:	3b 1d 64 a5 10 80    	cmp    0x8010a564,%ebx
8010229c:	74 44                	je     801022e2 <iderw+0xc2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010229e:	8b 03                	mov    (%ebx),%eax
801022a0:	83 e0 06             	and    $0x6,%eax
801022a3:	83 f8 02             	cmp    $0x2,%eax
801022a6:	74 23                	je     801022cb <iderw+0xab>
801022a8:	90                   	nop
801022a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
801022b0:	83 ec 08             	sub    $0x8,%esp
801022b3:	68 80 a5 10 80       	push   $0x8010a580
801022b8:	53                   	push   %ebx
801022b9:	e8 82 1c 00 00       	call   80103f40 <sleep>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801022be:	8b 03                	mov    (%ebx),%eax
801022c0:	83 c4 10             	add    $0x10,%esp
801022c3:	83 e0 06             	and    $0x6,%eax
801022c6:	83 f8 02             	cmp    $0x2,%eax
801022c9:	75 e5                	jne    801022b0 <iderw+0x90>
    sleep(b, &idelock);
  }

  release(&idelock);
801022cb:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
801022d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801022d5:	c9                   	leave  
  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
  }

  release(&idelock);
801022d6:	e9 d5 22 00 00       	jmp    801045b0 <release>

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801022db:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
801022e0:	eb b2                	jmp    80102294 <iderw+0x74>
    ;
  *pp = b;

  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
801022e2:	89 d8                	mov    %ebx,%eax
801022e4:	e8 37 fd ff ff       	call   80102020 <idestart>
801022e9:	eb b3                	jmp    8010229e <iderw+0x7e>
iderw(struct buf *b)
{
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
801022eb:	83 ec 0c             	sub    $0xc,%esp
801022ee:	68 16 74 10 80       	push   $0x80107416
801022f3:	e8 78 e0 ff ff       	call   80100370 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("iderw: ide disk 1 not present");
801022f8:	83 ec 0c             	sub    $0xc,%esp
801022fb:	68 41 74 10 80       	push   $0x80107441
80102300:	e8 6b e0 ff ff       	call   80100370 <panic>
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
80102305:	83 ec 0c             	sub    $0xc,%esp
80102308:	68 2c 74 10 80       	push   $0x8010742c
8010230d:	e8 5e e0 ff ff       	call   80100370 <panic>
80102312:	66 90                	xchg   %ax,%ax
80102314:	66 90                	xchg   %ax,%ax
80102316:	66 90                	xchg   %ax,%ax
80102318:	66 90                	xchg   %ax,%ax
8010231a:	66 90                	xchg   %ax,%ax
8010231c:	66 90                	xchg   %ax,%ax
8010231e:	66 90                	xchg   %ax,%ax

80102320 <ioapicinit>:
void
ioapicinit(void)
{
  int i, id, maxintr;

  if(!ismp)
80102320:	a1 84 27 11 80       	mov    0x80112784,%eax
80102325:	85 c0                	test   %eax,%eax
80102327:	0f 84 a8 00 00 00    	je     801023d5 <ioapicinit+0xb5>
  ioapic->data = data;
}

void
ioapicinit(void)
{
8010232d:	55                   	push   %ebp
  int i, id, maxintr;

  if(!ismp)
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
8010232e:	c7 05 54 26 11 80 00 	movl   $0xfec00000,0x80112654
80102335:	00 c0 fe 
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102338:	89 e5                	mov    %esp,%ebp
8010233a:	56                   	push   %esi
8010233b:	53                   	push   %ebx
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
8010233c:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102343:	00 00 00 
  return ioapic->data;
80102346:	8b 15 54 26 11 80    	mov    0x80112654,%edx
8010234c:	8b 72 10             	mov    0x10(%edx),%esi
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
8010234f:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  return ioapic->data;
80102355:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010235b:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx

  if(!ismp)
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102362:	89 f0                	mov    %esi,%eax
80102364:	c1 e8 10             	shr    $0x10,%eax
80102367:	0f b6 f0             	movzbl %al,%esi

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
  return ioapic->data;
8010236a:	8b 41 10             	mov    0x10(%ecx),%eax
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010236d:	c1 e8 18             	shr    $0x18,%eax
80102370:	39 d0                	cmp    %edx,%eax
80102372:	74 16                	je     8010238a <ioapicinit+0x6a>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102374:	83 ec 0c             	sub    $0xc,%esp
80102377:	68 60 74 10 80       	push   $0x80107460
8010237c:	e8 df e2 ff ff       	call   80100660 <cprintf>
80102381:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102387:	83 c4 10             	add    $0x10,%esp
8010238a:	83 c6 21             	add    $0x21,%esi
  ioapic->data = data;
}

void
ioapicinit(void)
{
8010238d:	ba 10 00 00 00       	mov    $0x10,%edx
80102392:	b8 20 00 00 00       	mov    $0x20,%eax
80102397:	89 f6                	mov    %esi,%esi
80102399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801023a0:	89 11                	mov    %edx,(%ecx)
  ioapic->data = data;
801023a2:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
801023a8:	89 c3                	mov    %eax,%ebx
801023aa:	81 cb 00 00 01 00    	or     $0x10000,%ebx
801023b0:	83 c0 01             	add    $0x1,%eax

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
801023b3:	89 59 10             	mov    %ebx,0x10(%ecx)
801023b6:	8d 5a 01             	lea    0x1(%edx),%ebx
801023b9:	83 c2 02             	add    $0x2,%edx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
801023bc:	39 f0                	cmp    %esi,%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801023be:	89 19                	mov    %ebx,(%ecx)
  ioapic->data = data;
801023c0:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
801023c6:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
801023cd:	75 d1                	jne    801023a0 <ioapicinit+0x80>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
801023cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023d2:	5b                   	pop    %ebx
801023d3:	5e                   	pop    %esi
801023d4:	5d                   	pop    %ebp
801023d5:	f3 c3                	repz ret 
801023d7:	89 f6                	mov    %esi,%esi
801023d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801023e0 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
  if(!ismp)
801023e0:	8b 15 84 27 11 80    	mov    0x80112784,%edx
  }
}

void
ioapicenable(int irq, int cpunum)
{
801023e6:	55                   	push   %ebp
801023e7:	89 e5                	mov    %esp,%ebp
  if(!ismp)
801023e9:	85 d2                	test   %edx,%edx
  }
}

void
ioapicenable(int irq, int cpunum)
{
801023eb:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!ismp)
801023ee:	74 2b                	je     8010241b <ioapicenable+0x3b>
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801023f0:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
    return;

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
801023f6:	8d 50 20             	lea    0x20(%eax),%edx
801023f9:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801023fd:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
801023ff:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102405:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
80102408:	89 51 10             	mov    %edx,0x10(%ecx)

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
8010240b:	8b 55 0c             	mov    0xc(%ebp),%edx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
8010240e:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102410:	a1 54 26 11 80       	mov    0x80112654,%eax

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80102415:	c1 e2 18             	shl    $0x18,%edx

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
80102418:	89 50 10             	mov    %edx,0x10(%eax)
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
}
8010241b:	5d                   	pop    %ebp
8010241c:	c3                   	ret    
8010241d:	66 90                	xchg   %ax,%ax
8010241f:	90                   	nop

80102420 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
80102420:	55                   	push   %ebp
80102421:	89 e5                	mov    %esp,%ebp
80102423:	53                   	push   %ebx
80102424:	83 ec 04             	sub    $0x4,%esp
80102427:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
8010242a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102430:	75 70                	jne    801024a2 <kfree+0x82>
80102432:	81 fb 48 7c 11 80    	cmp    $0x80117c48,%ebx
80102438:	72 68                	jb     801024a2 <kfree+0x82>
8010243a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102440:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102445:	77 5b                	ja     801024a2 <kfree+0x82>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
80102447:	83 ec 04             	sub    $0x4,%esp
8010244a:	68 00 10 00 00       	push   $0x1000
8010244f:	6a 01                	push   $0x1
80102451:	53                   	push   %ebx
80102452:	e8 a9 21 00 00       	call   80104600 <memset>

  if(kmem.use_lock)
80102457:	8b 15 94 26 11 80    	mov    0x80112694,%edx
8010245d:	83 c4 10             	add    $0x10,%esp
80102460:	85 d2                	test   %edx,%edx
80102462:	75 2c                	jne    80102490 <kfree+0x70>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102464:	a1 98 26 11 80       	mov    0x80112698,%eax
80102469:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
8010246b:	a1 94 26 11 80       	mov    0x80112694,%eax

  if(kmem.use_lock)
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
80102470:	89 1d 98 26 11 80    	mov    %ebx,0x80112698
  if(kmem.use_lock)
80102476:	85 c0                	test   %eax,%eax
80102478:	75 06                	jne    80102480 <kfree+0x60>
    release(&kmem.lock);
}
8010247a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010247d:	c9                   	leave  
8010247e:	c3                   	ret    
8010247f:	90                   	nop
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
80102480:	c7 45 08 60 26 11 80 	movl   $0x80112660,0x8(%ebp)
}
80102487:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010248a:	c9                   	leave  
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
8010248b:	e9 20 21 00 00       	jmp    801045b0 <release>

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);

  if(kmem.use_lock)
    acquire(&kmem.lock);
80102490:	83 ec 0c             	sub    $0xc,%esp
80102493:	68 60 26 11 80       	push   $0x80112660
80102498:	e8 33 1f 00 00       	call   801043d0 <acquire>
8010249d:	83 c4 10             	add    $0x10,%esp
801024a0:	eb c2                	jmp    80102464 <kfree+0x44>
kfree(char *v)
{
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
    panic("kfree");
801024a2:	83 ec 0c             	sub    $0xc,%esp
801024a5:	68 92 74 10 80       	push   $0x80107492
801024aa:	e8 c1 de ff ff       	call   80100370 <panic>
801024af:	90                   	nop

801024b0 <freerange>:
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
801024b0:	55                   	push   %ebp
801024b1:	89 e5                	mov    %esp,%ebp
801024b3:	56                   	push   %esi
801024b4:	53                   	push   %ebx
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801024b5:	8b 45 08             	mov    0x8(%ebp),%eax
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
801024b8:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801024bb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801024c1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801024c7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801024cd:	39 de                	cmp    %ebx,%esi
801024cf:	72 23                	jb     801024f4 <freerange+0x44>
801024d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
801024d8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801024de:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801024e1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801024e7:	50                   	push   %eax
801024e8:	e8 33 ff ff ff       	call   80102420 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801024ed:	83 c4 10             	add    $0x10,%esp
801024f0:	39 f3                	cmp    %esi,%ebx
801024f2:	76 e4                	jbe    801024d8 <freerange+0x28>
    kfree(p);
}
801024f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801024f7:	5b                   	pop    %ebx
801024f8:	5e                   	pop    %esi
801024f9:	5d                   	pop    %ebp
801024fa:	c3                   	ret    
801024fb:	90                   	nop
801024fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102500 <kinit1>:
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
80102500:	55                   	push   %ebp
80102501:	89 e5                	mov    %esp,%ebp
80102503:	56                   	push   %esi
80102504:	53                   	push   %ebx
80102505:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
80102508:	83 ec 08             	sub    $0x8,%esp
8010250b:	68 98 74 10 80       	push   $0x80107498
80102510:	68 60 26 11 80       	push   $0x80112660
80102515:	e8 96 1e 00 00       	call   801043b0 <initlock>

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010251a:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010251d:	83 c4 10             	add    $0x10,%esp
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
80102520:	c7 05 94 26 11 80 00 	movl   $0x0,0x80112694
80102527:	00 00 00 

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010252a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102530:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102536:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010253c:	39 de                	cmp    %ebx,%esi
8010253e:	72 1c                	jb     8010255c <kinit1+0x5c>
    kfree(p);
80102540:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102546:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102549:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
8010254f:	50                   	push   %eax
80102550:	e8 cb fe ff ff       	call   80102420 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102555:	83 c4 10             	add    $0x10,%esp
80102558:	39 de                	cmp    %ebx,%esi
8010255a:	73 e4                	jae    80102540 <kinit1+0x40>
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  freerange(vstart, vend);
}
8010255c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010255f:	5b                   	pop    %ebx
80102560:	5e                   	pop    %esi
80102561:	5d                   	pop    %ebp
80102562:	c3                   	ret    
80102563:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102570 <kinit2>:

void
kinit2(void *vstart, void *vend)
{
80102570:	55                   	push   %ebp
80102571:	89 e5                	mov    %esp,%ebp
80102573:	56                   	push   %esi
80102574:	53                   	push   %ebx

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102575:	8b 45 08             	mov    0x8(%ebp),%eax
  freerange(vstart, vend);
}

void
kinit2(void *vstart, void *vend)
{
80102578:	8b 75 0c             	mov    0xc(%ebp),%esi

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010257b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102581:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102587:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010258d:	39 de                	cmp    %ebx,%esi
8010258f:	72 23                	jb     801025b4 <kinit2+0x44>
80102591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102598:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010259e:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801025a1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801025a7:	50                   	push   %eax
801025a8:	e8 73 fe ff ff       	call   80102420 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801025ad:	83 c4 10             	add    $0x10,%esp
801025b0:	39 de                	cmp    %ebx,%esi
801025b2:	73 e4                	jae    80102598 <kinit2+0x28>

void
kinit2(void *vstart, void *vend)
{
  freerange(vstart, vend);
  kmem.use_lock = 1;
801025b4:	c7 05 94 26 11 80 01 	movl   $0x1,0x80112694
801025bb:	00 00 00 
}
801025be:	8d 65 f8             	lea    -0x8(%ebp),%esp
801025c1:	5b                   	pop    %ebx
801025c2:	5e                   	pop    %esi
801025c3:	5d                   	pop    %ebp
801025c4:	c3                   	ret    
801025c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025d0 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
801025d0:	55                   	push   %ebp
801025d1:	89 e5                	mov    %esp,%ebp
801025d3:	53                   	push   %ebx
801025d4:	83 ec 04             	sub    $0x4,%esp
  struct run *r;

  if(kmem.use_lock)
801025d7:	a1 94 26 11 80       	mov    0x80112694,%eax
801025dc:	85 c0                	test   %eax,%eax
801025de:	75 30                	jne    80102610 <kalloc+0x40>
    acquire(&kmem.lock);
  r = kmem.freelist;
801025e0:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
  if(r)
801025e6:	85 db                	test   %ebx,%ebx
801025e8:	74 1c                	je     80102606 <kalloc+0x36>
    kmem.freelist = r->next;
801025ea:	8b 13                	mov    (%ebx),%edx
801025ec:	89 15 98 26 11 80    	mov    %edx,0x80112698
  if(kmem.use_lock)
801025f2:	85 c0                	test   %eax,%eax
801025f4:	74 10                	je     80102606 <kalloc+0x36>
    release(&kmem.lock);
801025f6:	83 ec 0c             	sub    $0xc,%esp
801025f9:	68 60 26 11 80       	push   $0x80112660
801025fe:	e8 ad 1f 00 00       	call   801045b0 <release>
80102603:	83 c4 10             	add    $0x10,%esp
  return (char*)r;
}
80102606:	89 d8                	mov    %ebx,%eax
80102608:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010260b:	c9                   	leave  
8010260c:	c3                   	ret    
8010260d:	8d 76 00             	lea    0x0(%esi),%esi
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
    acquire(&kmem.lock);
80102610:	83 ec 0c             	sub    $0xc,%esp
80102613:	68 60 26 11 80       	push   $0x80112660
80102618:	e8 b3 1d 00 00       	call   801043d0 <acquire>
  r = kmem.freelist;
8010261d:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
  if(r)
80102623:	83 c4 10             	add    $0x10,%esp
80102626:	a1 94 26 11 80       	mov    0x80112694,%eax
8010262b:	85 db                	test   %ebx,%ebx
8010262d:	75 bb                	jne    801025ea <kalloc+0x1a>
8010262f:	eb c1                	jmp    801025f2 <kalloc+0x22>
80102631:	66 90                	xchg   %ax,%ax
80102633:	66 90                	xchg   %ax,%ax
80102635:	66 90                	xchg   %ax,%ax
80102637:	66 90                	xchg   %ax,%ax
80102639:	66 90                	xchg   %ax,%ax
8010263b:	66 90                	xchg   %ax,%ax
8010263d:	66 90                	xchg   %ax,%ax
8010263f:	90                   	nop

80102640 <kbdgetc>:
#include "defs.h"
#include "kbd.h"

int
kbdgetc(void)
{
80102640:	55                   	push   %ebp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102641:	ba 64 00 00 00       	mov    $0x64,%edx
80102646:	89 e5                	mov    %esp,%ebp
80102648:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102649:	a8 01                	test   $0x1,%al
8010264b:	0f 84 af 00 00 00    	je     80102700 <kbdgetc+0xc0>
80102651:	ba 60 00 00 00       	mov    $0x60,%edx
80102656:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
80102657:	0f b6 d0             	movzbl %al,%edx

  if(data == 0xE0){
8010265a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102660:	74 7e                	je     801026e0 <kbdgetc+0xa0>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
80102662:	84 c0                	test   %al,%al
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
80102664:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
8010266a:	79 24                	jns    80102690 <kbdgetc+0x50>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
8010266c:	f6 c1 40             	test   $0x40,%cl
8010266f:	75 05                	jne    80102676 <kbdgetc+0x36>
80102671:	89 c2                	mov    %eax,%edx
80102673:	83 e2 7f             	and    $0x7f,%edx
    shift &= ~(shiftcode[data] | E0ESC);
80102676:	0f b6 82 c0 75 10 80 	movzbl -0x7fef8a40(%edx),%eax
8010267d:	83 c8 40             	or     $0x40,%eax
80102680:	0f b6 c0             	movzbl %al,%eax
80102683:	f7 d0                	not    %eax
80102685:	21 c8                	and    %ecx,%eax
80102687:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
    return 0;
8010268c:	31 c0                	xor    %eax,%eax
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
8010268e:	5d                   	pop    %ebp
8010268f:	c3                   	ret    
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
80102690:	f6 c1 40             	test   $0x40,%cl
80102693:	74 09                	je     8010269e <kbdgetc+0x5e>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102695:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
80102698:	83 e1 bf             	and    $0xffffffbf,%ecx
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
8010269b:	0f b6 d0             	movzbl %al,%edx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
8010269e:	0f b6 82 c0 75 10 80 	movzbl -0x7fef8a40(%edx),%eax
801026a5:	09 c1                	or     %eax,%ecx
801026a7:	0f b6 82 c0 74 10 80 	movzbl -0x7fef8b40(%edx),%eax
801026ae:	31 c1                	xor    %eax,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
801026b0:	89 c8                	mov    %ecx,%eax
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
801026b2:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
  c = charcode[shift & (CTL | SHIFT)][data];
801026b8:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
801026bb:	83 e1 08             	and    $0x8,%ecx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
801026be:	8b 04 85 a0 74 10 80 	mov    -0x7fef8b60(,%eax,4),%eax
801026c5:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
  if(shift & CAPSLOCK){
801026c9:	74 c3                	je     8010268e <kbdgetc+0x4e>
    if('a' <= c && c <= 'z')
801026cb:	8d 50 9f             	lea    -0x61(%eax),%edx
801026ce:	83 fa 19             	cmp    $0x19,%edx
801026d1:	77 1d                	ja     801026f0 <kbdgetc+0xb0>
      c += 'A' - 'a';
801026d3:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801026d6:	5d                   	pop    %ebp
801026d7:	c3                   	ret    
801026d8:	90                   	nop
801026d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
801026e0:	31 c0                	xor    %eax,%eax
  if((st & KBS_DIB) == 0)
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
801026e2:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801026e9:	5d                   	pop    %ebp
801026ea:	c3                   	ret    
801026eb:	90                   	nop
801026ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
801026f0:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
801026f3:	8d 50 20             	lea    0x20(%eax),%edx
  }
  return c;
}
801026f6:	5d                   	pop    %ebp
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
801026f7:	83 f9 19             	cmp    $0x19,%ecx
801026fa:	0f 46 c2             	cmovbe %edx,%eax
  }
  return c;
}
801026fd:	c3                   	ret    
801026fe:	66 90                	xchg   %ax,%ax
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
    return -1;
80102700:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
80102705:	5d                   	pop    %ebp
80102706:	c3                   	ret    
80102707:	89 f6                	mov    %esi,%esi
80102709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102710 <kbdintr>:

void
kbdintr(void)
{
80102710:	55                   	push   %ebp
80102711:	89 e5                	mov    %esp,%ebp
80102713:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
80102716:	68 40 26 10 80       	push   $0x80102640
8010271b:	e8 d0 e0 ff ff       	call   801007f0 <consoleintr>
}
80102720:	83 c4 10             	add    $0x10,%esp
80102723:	c9                   	leave  
80102724:	c3                   	ret    
80102725:	66 90                	xchg   %ax,%ax
80102727:	66 90                	xchg   %ax,%ax
80102729:	66 90                	xchg   %ax,%ax
8010272b:	66 90                	xchg   %ax,%ax
8010272d:	66 90                	xchg   %ax,%ax
8010272f:	90                   	nop

80102730 <lapicinit>:
//PAGEBREAK!

void
lapicinit(void)
{
  if(!lapic)
80102730:	a1 9c 26 11 80       	mov    0x8011269c,%eax
}
//PAGEBREAK!

void
lapicinit(void)
{
80102735:	55                   	push   %ebp
80102736:	89 e5                	mov    %esp,%ebp
  if(!lapic)
80102738:	85 c0                	test   %eax,%eax
8010273a:	0f 84 c8 00 00 00    	je     80102808 <lapicinit+0xd8>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102740:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102747:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010274a:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010274d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102754:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102757:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010275a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102761:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
80102764:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102767:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010276e:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
80102771:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102774:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010277b:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010277e:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102781:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102788:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010278b:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
8010278e:	8b 50 30             	mov    0x30(%eax),%edx
80102791:	c1 ea 10             	shr    $0x10,%edx
80102794:	80 fa 03             	cmp    $0x3,%dl
80102797:	77 77                	ja     80102810 <lapicinit+0xe0>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102799:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801027a0:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027a3:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027a6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801027ad:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027b0:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027b3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801027ba:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027bd:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027c0:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801027c7:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027ca:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027cd:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801027d4:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027d7:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027da:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801027e1:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
801027e4:	8b 50 20             	mov    0x20(%eax),%edx
801027e7:	89 f6                	mov    %esi,%esi
801027e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
801027f0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801027f6:	80 e6 10             	and    $0x10,%dh
801027f9:	75 f5                	jne    801027f0 <lapicinit+0xc0>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027fb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102802:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102805:	8b 40 20             	mov    0x20(%eax),%eax
  while(lapic[ICRLO] & DELIVS)
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
80102808:	5d                   	pop    %ebp
80102809:	c3                   	ret    
8010280a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102810:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102817:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010281a:	8b 50 20             	mov    0x20(%eax),%edx
8010281d:	e9 77 ff ff ff       	jmp    80102799 <lapicinit+0x69>
80102822:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102830 <cpunum>:
  lapicw(TPR, 0);
}

int
cpunum(void)
{
80102830:	55                   	push   %ebp
80102831:	89 e5                	mov    %esp,%ebp
80102833:	56                   	push   %esi
80102834:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80102835:	9c                   	pushf  
80102836:	58                   	pop    %eax
  // Cannot call cpu when interrupts are enabled:
  // result not guaranteed to last long enough to be used!
  // Would prefer to panic but even printing is chancy here:
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
80102837:	f6 c4 02             	test   $0x2,%ah
8010283a:	74 12                	je     8010284e <cpunum+0x1e>
    static int n;
    if(n++ == 0)
8010283c:	a1 b8 a5 10 80       	mov    0x8010a5b8,%eax
80102841:	8d 50 01             	lea    0x1(%eax),%edx
80102844:	85 c0                	test   %eax,%eax
80102846:	89 15 b8 a5 10 80    	mov    %edx,0x8010a5b8
8010284c:	74 4d                	je     8010289b <cpunum+0x6b>
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if (!lapic)
8010284e:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102853:	85 c0                	test   %eax,%eax
80102855:	74 60                	je     801028b7 <cpunum+0x87>
    return 0;

  apicid = lapic[ID] >> 24;
80102857:	8b 58 20             	mov    0x20(%eax),%ebx
  for (i = 0; i < ncpu; ++i) {
8010285a:	8b 35 80 2d 11 80    	mov    0x80112d80,%esi
  }

  if (!lapic)
    return 0;

  apicid = lapic[ID] >> 24;
80102860:	c1 eb 18             	shr    $0x18,%ebx
  for (i = 0; i < ncpu; ++i) {
80102863:	85 f6                	test   %esi,%esi
80102865:	7e 59                	jle    801028c0 <cpunum+0x90>
    if (cpus[i].apicid == apicid)
80102867:	0f b6 05 a0 27 11 80 	movzbl 0x801127a0,%eax
8010286e:	39 c3                	cmp    %eax,%ebx
80102870:	74 45                	je     801028b7 <cpunum+0x87>
80102872:	ba 5c 28 11 80       	mov    $0x8011285c,%edx
80102877:	31 c0                	xor    %eax,%eax
80102879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  if (!lapic)
    return 0;

  apicid = lapic[ID] >> 24;
  for (i = 0; i < ncpu; ++i) {
80102880:	83 c0 01             	add    $0x1,%eax
80102883:	39 f0                	cmp    %esi,%eax
80102885:	74 39                	je     801028c0 <cpunum+0x90>
    if (cpus[i].apicid == apicid)
80102887:	0f b6 0a             	movzbl (%edx),%ecx
8010288a:	81 c2 bc 00 00 00    	add    $0xbc,%edx
80102890:	39 cb                	cmp    %ecx,%ebx
80102892:	75 ec                	jne    80102880 <cpunum+0x50>
      return i;
  }
  panic("unknown apicid\n");
}
80102894:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102897:	5b                   	pop    %ebx
80102898:	5e                   	pop    %esi
80102899:	5d                   	pop    %ebp
8010289a:	c3                   	ret    
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
    static int n;
    if(n++ == 0)
      cprintf("cpu called from %x with interrupts enabled\n",
8010289b:	83 ec 08             	sub    $0x8,%esp
8010289e:	ff 75 04             	pushl  0x4(%ebp)
801028a1:	68 c0 76 10 80       	push   $0x801076c0
801028a6:	e8 b5 dd ff ff       	call   80100660 <cprintf>
        __builtin_return_address(0));
  }

  if (!lapic)
801028ab:	a1 9c 26 11 80       	mov    0x8011269c,%eax
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
    static int n;
    if(n++ == 0)
      cprintf("cpu called from %x with interrupts enabled\n",
801028b0:	83 c4 10             	add    $0x10,%esp
        __builtin_return_address(0));
  }

  if (!lapic)
801028b3:	85 c0                	test   %eax,%eax
801028b5:	75 a0                	jne    80102857 <cpunum+0x27>
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
}
801028b7:	8d 65 f8             	lea    -0x8(%ebp),%esp
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if (!lapic)
    return 0;
801028ba:	31 c0                	xor    %eax,%eax
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
}
801028bc:	5b                   	pop    %ebx
801028bd:	5e                   	pop    %esi
801028be:	5d                   	pop    %ebp
801028bf:	c3                   	ret    
  apicid = lapic[ID] >> 24;
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
801028c0:	83 ec 0c             	sub    $0xc,%esp
801028c3:	68 ec 76 10 80       	push   $0x801076ec
801028c8:	e8 a3 da ff ff       	call   80100370 <panic>
801028cd:	8d 76 00             	lea    0x0(%esi),%esi

801028d0 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
801028d0:	a1 9c 26 11 80       	mov    0x8011269c,%eax
}

// Acknowledge interrupt.
void
lapiceoi(void)
{
801028d5:	55                   	push   %ebp
801028d6:	89 e5                	mov    %esp,%ebp
  if(lapic)
801028d8:	85 c0                	test   %eax,%eax
801028da:	74 0d                	je     801028e9 <lapiceoi+0x19>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801028dc:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801028e3:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801028e6:	8b 40 20             	mov    0x20(%eax),%eax
void
lapiceoi(void)
{
  if(lapic)
    lapicw(EOI, 0);
}
801028e9:	5d                   	pop    %ebp
801028ea:	c3                   	ret    
801028eb:	90                   	nop
801028ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801028f0 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
801028f0:	55                   	push   %ebp
801028f1:	89 e5                	mov    %esp,%ebp
}
801028f3:	5d                   	pop    %ebp
801028f4:	c3                   	ret    
801028f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801028f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102900 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
80102900:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102901:	ba 70 00 00 00       	mov    $0x70,%edx
80102906:	b8 0f 00 00 00       	mov    $0xf,%eax
8010290b:	89 e5                	mov    %esp,%ebp
8010290d:	53                   	push   %ebx
8010290e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102911:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102914:	ee                   	out    %al,(%dx)
80102915:	ba 71 00 00 00       	mov    $0x71,%edx
8010291a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010291f:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102920:	31 c0                	xor    %eax,%eax
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102922:	c1 e3 18             	shl    $0x18,%ebx
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102925:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
8010292b:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
8010292d:	c1 e9 0c             	shr    $0xc,%ecx
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
80102930:	c1 e8 04             	shr    $0x4,%eax
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102933:	89 da                	mov    %ebx,%edx
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
80102935:	80 cd 06             	or     $0x6,%ch
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
80102938:	66 a3 69 04 00 80    	mov    %ax,0x80000469
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010293e:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102943:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102949:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010294c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102953:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102956:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102959:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102960:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102963:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102966:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010296c:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010296f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102975:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102978:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010297e:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102981:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102987:	8b 40 20             	mov    0x20(%eax),%eax
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
8010298a:	5b                   	pop    %ebx
8010298b:	5d                   	pop    %ebp
8010298c:	c3                   	ret    
8010298d:	8d 76 00             	lea    0x0(%esi),%esi

80102990 <cmostime>:
  r->year   = cmos_read(YEAR);
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void cmostime(struct rtcdate *r)
{
80102990:	55                   	push   %ebp
80102991:	ba 70 00 00 00       	mov    $0x70,%edx
80102996:	b8 0b 00 00 00       	mov    $0xb,%eax
8010299b:	89 e5                	mov    %esp,%ebp
8010299d:	57                   	push   %edi
8010299e:	56                   	push   %esi
8010299f:	53                   	push   %ebx
801029a0:	83 ec 4c             	sub    $0x4c,%esp
801029a3:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801029a4:	ba 71 00 00 00       	mov    $0x71,%edx
801029a9:	ec                   	in     (%dx),%al
801029aa:	83 e0 04             	and    $0x4,%eax
801029ad:	8d 75 d0             	lea    -0x30(%ebp),%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801029b0:	31 db                	xor    %ebx,%ebx
801029b2:	88 45 b7             	mov    %al,-0x49(%ebp)
801029b5:	bf 70 00 00 00       	mov    $0x70,%edi
801029ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801029c0:	89 d8                	mov    %ebx,%eax
801029c2:	89 fa                	mov    %edi,%edx
801029c4:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801029c5:	b9 71 00 00 00       	mov    $0x71,%ecx
801029ca:	89 ca                	mov    %ecx,%edx
801029cc:	ec                   	in     (%dx),%al
  return inb(CMOS_RETURN);
}

static void fill_rtcdate(struct rtcdate *r)
{
  r->second = cmos_read(SECS);
801029cd:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801029d0:	89 fa                	mov    %edi,%edx
801029d2:	89 45 b8             	mov    %eax,-0x48(%ebp)
801029d5:	b8 02 00 00 00       	mov    $0x2,%eax
801029da:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801029db:	89 ca                	mov    %ecx,%edx
801029dd:	ec                   	in     (%dx),%al
  r->minute = cmos_read(MINS);
801029de:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801029e1:	89 fa                	mov    %edi,%edx
801029e3:	89 45 bc             	mov    %eax,-0x44(%ebp)
801029e6:	b8 04 00 00 00       	mov    $0x4,%eax
801029eb:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801029ec:	89 ca                	mov    %ecx,%edx
801029ee:	ec                   	in     (%dx),%al
  r->hour   = cmos_read(HOURS);
801029ef:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801029f2:	89 fa                	mov    %edi,%edx
801029f4:	89 45 c0             	mov    %eax,-0x40(%ebp)
801029f7:	b8 07 00 00 00       	mov    $0x7,%eax
801029fc:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801029fd:	89 ca                	mov    %ecx,%edx
801029ff:	ec                   	in     (%dx),%al
  r->day    = cmos_read(DAY);
80102a00:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a03:	89 fa                	mov    %edi,%edx
80102a05:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102a08:	b8 08 00 00 00       	mov    $0x8,%eax
80102a0d:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a0e:	89 ca                	mov    %ecx,%edx
80102a10:	ec                   	in     (%dx),%al
  r->month  = cmos_read(MONTH);
80102a11:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a14:	89 fa                	mov    %edi,%edx
80102a16:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102a19:	b8 09 00 00 00       	mov    $0x9,%eax
80102a1e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a1f:	89 ca                	mov    %ecx,%edx
80102a21:	ec                   	in     (%dx),%al
  r->year   = cmos_read(YEAR);
80102a22:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a25:	89 fa                	mov    %edi,%edx
80102a27:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102a2a:	b8 0a 00 00 00       	mov    $0xa,%eax
80102a2f:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a30:	89 ca                	mov    %ecx,%edx
80102a32:	ec                   	in     (%dx),%al
  bcd = (sb & (1 << 2)) == 0;

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102a33:	84 c0                	test   %al,%al
80102a35:	78 89                	js     801029c0 <cmostime+0x30>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a37:	89 d8                	mov    %ebx,%eax
80102a39:	89 fa                	mov    %edi,%edx
80102a3b:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a3c:	89 ca                	mov    %ecx,%edx
80102a3e:	ec                   	in     (%dx),%al
  return inb(CMOS_RETURN);
}

static void fill_rtcdate(struct rtcdate *r)
{
  r->second = cmos_read(SECS);
80102a3f:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a42:	89 fa                	mov    %edi,%edx
80102a44:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102a47:	b8 02 00 00 00       	mov    $0x2,%eax
80102a4c:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a4d:	89 ca                	mov    %ecx,%edx
80102a4f:	ec                   	in     (%dx),%al
  r->minute = cmos_read(MINS);
80102a50:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a53:	89 fa                	mov    %edi,%edx
80102a55:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102a58:	b8 04 00 00 00       	mov    $0x4,%eax
80102a5d:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a5e:	89 ca                	mov    %ecx,%edx
80102a60:	ec                   	in     (%dx),%al
  r->hour   = cmos_read(HOURS);
80102a61:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a64:	89 fa                	mov    %edi,%edx
80102a66:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102a69:	b8 07 00 00 00       	mov    $0x7,%eax
80102a6e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a6f:	89 ca                	mov    %ecx,%edx
80102a71:	ec                   	in     (%dx),%al
  r->day    = cmos_read(DAY);
80102a72:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a75:	89 fa                	mov    %edi,%edx
80102a77:	89 45 dc             	mov    %eax,-0x24(%ebp)
80102a7a:	b8 08 00 00 00       	mov    $0x8,%eax
80102a7f:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a80:	89 ca                	mov    %ecx,%edx
80102a82:	ec                   	in     (%dx),%al
  r->month  = cmos_read(MONTH);
80102a83:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102a86:	89 fa                	mov    %edi,%edx
80102a88:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102a8b:	b8 09 00 00 00       	mov    $0x9,%eax
80102a90:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102a91:	89 ca                	mov    %ecx,%edx
80102a93:	ec                   	in     (%dx),%al
  r->year   = cmos_read(YEAR);
80102a94:	0f b6 c0             	movzbl %al,%eax
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102a97:	83 ec 04             	sub    $0x4,%esp
  r->second = cmos_read(SECS);
  r->minute = cmos_read(MINS);
  r->hour   = cmos_read(HOURS);
  r->day    = cmos_read(DAY);
  r->month  = cmos_read(MONTH);
  r->year   = cmos_read(YEAR);
80102a9a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102a9d:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102aa0:	6a 18                	push   $0x18
80102aa2:	56                   	push   %esi
80102aa3:	50                   	push   %eax
80102aa4:	e8 a7 1b 00 00       	call   80104650 <memcmp>
80102aa9:	83 c4 10             	add    $0x10,%esp
80102aac:	85 c0                	test   %eax,%eax
80102aae:	0f 85 0c ff ff ff    	jne    801029c0 <cmostime+0x30>
      break;
  }

  // convert
  if(bcd) {
80102ab4:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
80102ab8:	75 78                	jne    80102b32 <cmostime+0x1a2>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
80102aba:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102abd:	89 c2                	mov    %eax,%edx
80102abf:	83 e0 0f             	and    $0xf,%eax
80102ac2:	c1 ea 04             	shr    $0x4,%edx
80102ac5:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102ac8:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102acb:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
80102ace:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102ad1:	89 c2                	mov    %eax,%edx
80102ad3:	83 e0 0f             	and    $0xf,%eax
80102ad6:	c1 ea 04             	shr    $0x4,%edx
80102ad9:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102adc:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102adf:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
80102ae2:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102ae5:	89 c2                	mov    %eax,%edx
80102ae7:	83 e0 0f             	and    $0xf,%eax
80102aea:	c1 ea 04             	shr    $0x4,%edx
80102aed:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102af0:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102af3:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
80102af6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102af9:	89 c2                	mov    %eax,%edx
80102afb:	83 e0 0f             	and    $0xf,%eax
80102afe:	c1 ea 04             	shr    $0x4,%edx
80102b01:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b04:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b07:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
80102b0a:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102b0d:	89 c2                	mov    %eax,%edx
80102b0f:	83 e0 0f             	and    $0xf,%eax
80102b12:	c1 ea 04             	shr    $0x4,%edx
80102b15:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b18:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b1b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
80102b1e:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102b21:	89 c2                	mov    %eax,%edx
80102b23:	83 e0 0f             	and    $0xf,%eax
80102b26:	c1 ea 04             	shr    $0x4,%edx
80102b29:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102b2c:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102b2f:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
80102b32:	8b 75 08             	mov    0x8(%ebp),%esi
80102b35:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102b38:	89 06                	mov    %eax,(%esi)
80102b3a:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102b3d:	89 46 04             	mov    %eax,0x4(%esi)
80102b40:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102b43:	89 46 08             	mov    %eax,0x8(%esi)
80102b46:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102b49:	89 46 0c             	mov    %eax,0xc(%esi)
80102b4c:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102b4f:	89 46 10             	mov    %eax,0x10(%esi)
80102b52:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102b55:	89 46 14             	mov    %eax,0x14(%esi)
  r->year += 2000;
80102b58:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
80102b5f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102b62:	5b                   	pop    %ebx
80102b63:	5e                   	pop    %esi
80102b64:	5f                   	pop    %edi
80102b65:	5d                   	pop    %ebp
80102b66:	c3                   	ret    
80102b67:	66 90                	xchg   %ax,%ax
80102b69:	66 90                	xchg   %ax,%ax
80102b6b:	66 90                	xchg   %ax,%ax
80102b6d:	66 90                	xchg   %ax,%ax
80102b6f:	90                   	nop

80102b70 <install_trans>:
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102b70:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102b76:	85 c9                	test   %ecx,%ecx
80102b78:	0f 8e 85 00 00 00    	jle    80102c03 <install_trans+0x93>
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
80102b7e:	55                   	push   %ebp
80102b7f:	89 e5                	mov    %esp,%ebp
80102b81:	57                   	push   %edi
80102b82:	56                   	push   %esi
80102b83:	53                   	push   %ebx
80102b84:	31 db                	xor    %ebx,%ebx
80102b86:	83 ec 0c             	sub    $0xc,%esp
80102b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102b90:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102b95:	83 ec 08             	sub    $0x8,%esp
80102b98:	01 d8                	add    %ebx,%eax
80102b9a:	83 c0 01             	add    $0x1,%eax
80102b9d:	50                   	push   %eax
80102b9e:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102ba4:	e8 27 d5 ff ff       	call   801000d0 <bread>
80102ba9:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102bab:	58                   	pop    %eax
80102bac:	5a                   	pop    %edx
80102bad:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
80102bb4:	ff 35 e4 26 11 80    	pushl  0x801126e4
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102bba:	83 c3 01             	add    $0x1,%ebx
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102bbd:	e8 0e d5 ff ff       	call   801000d0 <bread>
80102bc2:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102bc4:	8d 47 5c             	lea    0x5c(%edi),%eax
80102bc7:	83 c4 0c             	add    $0xc,%esp
80102bca:	68 00 02 00 00       	push   $0x200
80102bcf:	50                   	push   %eax
80102bd0:	8d 46 5c             	lea    0x5c(%esi),%eax
80102bd3:	50                   	push   %eax
80102bd4:	e8 d7 1a 00 00       	call   801046b0 <memmove>
    bwrite(dbuf);  // write dst to disk
80102bd9:	89 34 24             	mov    %esi,(%esp)
80102bdc:	e8 bf d5 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
80102be1:	89 3c 24             	mov    %edi,(%esp)
80102be4:	e8 f7 d5 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102be9:	89 34 24             	mov    %esi,(%esp)
80102bec:	e8 ef d5 ff ff       	call   801001e0 <brelse>
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102bf1:	83 c4 10             	add    $0x10,%esp
80102bf4:	39 1d e8 26 11 80    	cmp    %ebx,0x801126e8
80102bfa:	7f 94                	jg     80102b90 <install_trans+0x20>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    bwrite(dbuf);  // write dst to disk
    brelse(lbuf);
    brelse(dbuf);
  }
}
80102bfc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102bff:	5b                   	pop    %ebx
80102c00:	5e                   	pop    %esi
80102c01:	5f                   	pop    %edi
80102c02:	5d                   	pop    %ebp
80102c03:	f3 c3                	repz ret 
80102c05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c10 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102c10:	55                   	push   %ebp
80102c11:	89 e5                	mov    %esp,%ebp
80102c13:	53                   	push   %ebx
80102c14:	83 ec 0c             	sub    $0xc,%esp
  struct buf *buf = bread(log.dev, log.start);
80102c17:	ff 35 d4 26 11 80    	pushl  0x801126d4
80102c1d:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102c23:	e8 a8 d4 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102c28:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
  for (i = 0; i < log.lh.n; i++) {
80102c2e:	83 c4 10             	add    $0x10,%esp
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102c31:	89 c3                	mov    %eax,%ebx
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102c33:	85 c9                	test   %ecx,%ecx
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102c35:	89 48 5c             	mov    %ecx,0x5c(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102c38:	7e 1f                	jle    80102c59 <write_head+0x49>
80102c3a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102c41:	31 d2                	xor    %edx,%edx
80102c43:	90                   	nop
80102c44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    hb->block[i] = log.lh.block[i];
80102c48:	8b 8a ec 26 11 80    	mov    -0x7feed914(%edx),%ecx
80102c4e:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102c52:	83 c2 04             	add    $0x4,%edx
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102c55:	39 c2                	cmp    %eax,%edx
80102c57:	75 ef                	jne    80102c48 <write_head+0x38>
    hb->block[i] = log.lh.block[i];
  }
  bwrite(buf);
80102c59:	83 ec 0c             	sub    $0xc,%esp
80102c5c:	53                   	push   %ebx
80102c5d:	e8 3e d5 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102c62:	89 1c 24             	mov    %ebx,(%esp)
80102c65:	e8 76 d5 ff ff       	call   801001e0 <brelse>
}
80102c6a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102c6d:	c9                   	leave  
80102c6e:	c3                   	ret    
80102c6f:	90                   	nop

80102c70 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev)
{
80102c70:	55                   	push   %ebp
80102c71:	89 e5                	mov    %esp,%ebp
80102c73:	53                   	push   %ebx
80102c74:	83 ec 2c             	sub    $0x2c,%esp
80102c77:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
80102c7a:	68 fc 76 10 80       	push   $0x801076fc
80102c7f:	68 a0 26 11 80       	push   $0x801126a0
80102c84:	e8 27 17 00 00       	call   801043b0 <initlock>
  readsb(dev, &sb);
80102c89:	58                   	pop    %eax
80102c8a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102c8d:	5a                   	pop    %edx
80102c8e:	50                   	push   %eax
80102c8f:	53                   	push   %ebx
80102c90:	e8 5b e8 ff ff       	call   801014f0 <readsb>
  log.start = sb.logstart;
  log.size = sb.nlog;
80102c95:	8b 55 e8             	mov    -0x18(%ebp),%edx
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102c98:	8b 45 ec             	mov    -0x14(%ebp),%eax

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102c9b:	59                   	pop    %ecx
  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
80102c9c:	89 1d e4 26 11 80    	mov    %ebx,0x801126e4

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
80102ca2:	89 15 d8 26 11 80    	mov    %edx,0x801126d8
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102ca8:	a3 d4 26 11 80       	mov    %eax,0x801126d4

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102cad:	5a                   	pop    %edx
80102cae:	50                   	push   %eax
80102caf:	53                   	push   %ebx
80102cb0:	e8 1b d4 ff ff       	call   801000d0 <bread>
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102cb5:	8b 48 5c             	mov    0x5c(%eax),%ecx
  for (i = 0; i < log.lh.n; i++) {
80102cb8:	83 c4 10             	add    $0x10,%esp
80102cbb:	85 c9                	test   %ecx,%ecx
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102cbd:	89 0d e8 26 11 80    	mov    %ecx,0x801126e8
  for (i = 0; i < log.lh.n; i++) {
80102cc3:	7e 1c                	jle    80102ce1 <initlog+0x71>
80102cc5:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102ccc:	31 d2                	xor    %edx,%edx
80102cce:	66 90                	xchg   %ax,%ax
    log.lh.block[i] = lh->block[i];
80102cd0:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102cd4:	83 c2 04             	add    $0x4,%edx
80102cd7:	89 8a e8 26 11 80    	mov    %ecx,-0x7feed918(%edx)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
  for (i = 0; i < log.lh.n; i++) {
80102cdd:	39 da                	cmp    %ebx,%edx
80102cdf:	75 ef                	jne    80102cd0 <initlog+0x60>
    log.lh.block[i] = lh->block[i];
  }
  brelse(buf);
80102ce1:	83 ec 0c             	sub    $0xc,%esp
80102ce4:	50                   	push   %eax
80102ce5:	e8 f6 d4 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102cea:	e8 81 fe ff ff       	call   80102b70 <install_trans>
  log.lh.n = 0;
80102cef:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102cf6:	00 00 00 
  write_head(); // clear the log
80102cf9:	e8 12 ff ff ff       	call   80102c10 <write_head>
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
  recover_from_log();
}
80102cfe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102d01:	c9                   	leave  
80102d02:	c3                   	ret    
80102d03:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102d10 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102d10:	55                   	push   %ebp
80102d11:	89 e5                	mov    %esp,%ebp
80102d13:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102d16:	68 a0 26 11 80       	push   $0x801126a0
80102d1b:	e8 b0 16 00 00       	call   801043d0 <acquire>
80102d20:	83 c4 10             	add    $0x10,%esp
80102d23:	eb 18                	jmp    80102d3d <begin_op+0x2d>
80102d25:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102d28:	83 ec 08             	sub    $0x8,%esp
80102d2b:	68 a0 26 11 80       	push   $0x801126a0
80102d30:	68 a0 26 11 80       	push   $0x801126a0
80102d35:	e8 06 12 00 00       	call   80103f40 <sleep>
80102d3a:	83 c4 10             	add    $0x10,%esp
void
begin_op(void)
{
  acquire(&log.lock);
  while(1){
    if(log.committing){
80102d3d:	a1 e0 26 11 80       	mov    0x801126e0,%eax
80102d42:	85 c0                	test   %eax,%eax
80102d44:	75 e2                	jne    80102d28 <begin_op+0x18>
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102d46:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102d4b:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102d51:	83 c0 01             	add    $0x1,%eax
80102d54:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102d57:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102d5a:	83 fa 1e             	cmp    $0x1e,%edx
80102d5d:	7f c9                	jg     80102d28 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102d5f:	83 ec 0c             	sub    $0xc,%esp
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
80102d62:	a3 dc 26 11 80       	mov    %eax,0x801126dc
      release(&log.lock);
80102d67:	68 a0 26 11 80       	push   $0x801126a0
80102d6c:	e8 3f 18 00 00       	call   801045b0 <release>
      break;
    }
  }
}
80102d71:	83 c4 10             	add    $0x10,%esp
80102d74:	c9                   	leave  
80102d75:	c3                   	ret    
80102d76:	8d 76 00             	lea    0x0(%esi),%esi
80102d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102d80 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102d80:	55                   	push   %ebp
80102d81:	89 e5                	mov    %esp,%ebp
80102d83:	57                   	push   %edi
80102d84:	56                   	push   %esi
80102d85:	53                   	push   %ebx
80102d86:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102d89:	68 a0 26 11 80       	push   $0x801126a0
80102d8e:	e8 3d 16 00 00       	call   801043d0 <acquire>
  log.outstanding -= 1;
80102d93:	a1 dc 26 11 80       	mov    0x801126dc,%eax
  if(log.committing)
80102d98:	8b 1d e0 26 11 80    	mov    0x801126e0,%ebx
80102d9e:	83 c4 10             	add    $0x10,%esp
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102da1:	83 e8 01             	sub    $0x1,%eax
  if(log.committing)
80102da4:	85 db                	test   %ebx,%ebx
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102da6:	a3 dc 26 11 80       	mov    %eax,0x801126dc
  if(log.committing)
80102dab:	0f 85 23 01 00 00    	jne    80102ed4 <end_op+0x154>
    panic("log.committing");
  if(log.outstanding == 0){
80102db1:	85 c0                	test   %eax,%eax
80102db3:	0f 85 f7 00 00 00    	jne    80102eb0 <end_op+0x130>
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
  }
  release(&log.lock);
80102db9:	83 ec 0c             	sub    $0xc,%esp
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
  if(log.outstanding == 0){
    do_commit = 1;
    log.committing = 1;
80102dbc:	c7 05 e0 26 11 80 01 	movl   $0x1,0x801126e0
80102dc3:	00 00 00 
}

static void
commit()
{
  if (log.lh.n > 0) {
80102dc6:	31 db                	xor    %ebx,%ebx
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
  }
  release(&log.lock);
80102dc8:	68 a0 26 11 80       	push   $0x801126a0
80102dcd:	e8 de 17 00 00       	call   801045b0 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102dd2:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102dd8:	83 c4 10             	add    $0x10,%esp
80102ddb:	85 c9                	test   %ecx,%ecx
80102ddd:	0f 8e 8a 00 00 00    	jle    80102e6d <end_op+0xed>
80102de3:	90                   	nop
80102de4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102de8:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102ded:	83 ec 08             	sub    $0x8,%esp
80102df0:	01 d8                	add    %ebx,%eax
80102df2:	83 c0 01             	add    $0x1,%eax
80102df5:	50                   	push   %eax
80102df6:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102dfc:	e8 cf d2 ff ff       	call   801000d0 <bread>
80102e01:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102e03:	58                   	pop    %eax
80102e04:	5a                   	pop    %edx
80102e05:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
80102e0c:	ff 35 e4 26 11 80    	pushl  0x801126e4
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102e12:	83 c3 01             	add    $0x1,%ebx
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102e15:	e8 b6 d2 ff ff       	call   801000d0 <bread>
80102e1a:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102e1c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102e1f:	83 c4 0c             	add    $0xc,%esp
80102e22:	68 00 02 00 00       	push   $0x200
80102e27:	50                   	push   %eax
80102e28:	8d 46 5c             	lea    0x5c(%esi),%eax
80102e2b:	50                   	push   %eax
80102e2c:	e8 7f 18 00 00       	call   801046b0 <memmove>
    bwrite(to);  // write the log
80102e31:	89 34 24             	mov    %esi,(%esp)
80102e34:	e8 67 d3 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102e39:	89 3c 24             	mov    %edi,(%esp)
80102e3c:	e8 9f d3 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102e41:	89 34 24             	mov    %esi,(%esp)
80102e44:	e8 97 d3 ff ff       	call   801001e0 <brelse>
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102e49:	83 c4 10             	add    $0x10,%esp
80102e4c:	3b 1d e8 26 11 80    	cmp    0x801126e8,%ebx
80102e52:	7c 94                	jl     80102de8 <end_op+0x68>
static void
commit()
{
  if (log.lh.n > 0) {
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102e54:	e8 b7 fd ff ff       	call   80102c10 <write_head>
    install_trans(); // Now install writes to home locations
80102e59:	e8 12 fd ff ff       	call   80102b70 <install_trans>
    log.lh.n = 0;
80102e5e:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102e65:	00 00 00 
    write_head();    // Erase the transaction from the log
80102e68:	e8 a3 fd ff ff       	call   80102c10 <write_head>

  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
80102e6d:	83 ec 0c             	sub    $0xc,%esp
80102e70:	68 a0 26 11 80       	push   $0x801126a0
80102e75:	e8 56 15 00 00       	call   801043d0 <acquire>
    log.committing = 0;
    wakeup(&log);
80102e7a:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
    log.committing = 0;
80102e81:	c7 05 e0 26 11 80 00 	movl   $0x0,0x801126e0
80102e88:	00 00 00 
    wakeup(&log);
80102e8b:	e8 60 12 00 00       	call   801040f0 <wakeup>
    release(&log.lock);
80102e90:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102e97:	e8 14 17 00 00       	call   801045b0 <release>
80102e9c:	83 c4 10             	add    $0x10,%esp
  }
}
80102e9f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ea2:	5b                   	pop    %ebx
80102ea3:	5e                   	pop    %esi
80102ea4:	5f                   	pop    %edi
80102ea5:	5d                   	pop    %ebp
80102ea6:	c3                   	ret    
80102ea7:	89 f6                	mov    %esi,%esi
80102ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(log.outstanding == 0){
    do_commit = 1;
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
80102eb0:	83 ec 0c             	sub    $0xc,%esp
80102eb3:	68 a0 26 11 80       	push   $0x801126a0
80102eb8:	e8 33 12 00 00       	call   801040f0 <wakeup>
  }
  release(&log.lock);
80102ebd:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102ec4:	e8 e7 16 00 00       	call   801045b0 <release>
80102ec9:	83 c4 10             	add    $0x10,%esp
    acquire(&log.lock);
    log.committing = 0;
    wakeup(&log);
    release(&log.lock);
  }
}
80102ecc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ecf:	5b                   	pop    %ebx
80102ed0:	5e                   	pop    %esi
80102ed1:	5f                   	pop    %edi
80102ed2:	5d                   	pop    %ebp
80102ed3:	c3                   	ret    
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
80102ed4:	83 ec 0c             	sub    $0xc,%esp
80102ed7:	68 00 77 10 80       	push   $0x80107700
80102edc:	e8 8f d4 ff ff       	call   80100370 <panic>
80102ee1:	eb 0d                	jmp    80102ef0 <log_write>
80102ee3:	90                   	nop
80102ee4:	90                   	nop
80102ee5:	90                   	nop
80102ee6:	90                   	nop
80102ee7:	90                   	nop
80102ee8:	90                   	nop
80102ee9:	90                   	nop
80102eea:	90                   	nop
80102eeb:	90                   	nop
80102eec:	90                   	nop
80102eed:	90                   	nop
80102eee:	90                   	nop
80102eef:	90                   	nop

80102ef0 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102ef0:	55                   	push   %ebp
80102ef1:	89 e5                	mov    %esp,%ebp
80102ef3:	53                   	push   %ebx
80102ef4:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102ef7:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102efd:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102f00:	83 fa 1d             	cmp    $0x1d,%edx
80102f03:	0f 8f 97 00 00 00    	jg     80102fa0 <log_write+0xb0>
80102f09:	a1 d8 26 11 80       	mov    0x801126d8,%eax
80102f0e:	83 e8 01             	sub    $0x1,%eax
80102f11:	39 c2                	cmp    %eax,%edx
80102f13:	0f 8d 87 00 00 00    	jge    80102fa0 <log_write+0xb0>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102f19:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102f1e:	85 c0                	test   %eax,%eax
80102f20:	0f 8e 87 00 00 00    	jle    80102fad <log_write+0xbd>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102f26:	83 ec 0c             	sub    $0xc,%esp
80102f29:	68 a0 26 11 80       	push   $0x801126a0
80102f2e:	e8 9d 14 00 00       	call   801043d0 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102f33:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102f39:	83 c4 10             	add    $0x10,%esp
80102f3c:	83 fa 00             	cmp    $0x0,%edx
80102f3f:	7e 50                	jle    80102f91 <log_write+0xa1>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102f41:	8b 4b 08             	mov    0x8(%ebx),%ecx
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102f44:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102f46:	3b 0d ec 26 11 80    	cmp    0x801126ec,%ecx
80102f4c:	75 0b                	jne    80102f59 <log_write+0x69>
80102f4e:	eb 38                	jmp    80102f88 <log_write+0x98>
80102f50:	39 0c 85 ec 26 11 80 	cmp    %ecx,-0x7feed914(,%eax,4)
80102f57:	74 2f                	je     80102f88 <log_write+0x98>
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102f59:	83 c0 01             	add    $0x1,%eax
80102f5c:	39 d0                	cmp    %edx,%eax
80102f5e:	75 f0                	jne    80102f50 <log_write+0x60>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102f60:	89 0c 95 ec 26 11 80 	mov    %ecx,-0x7feed914(,%edx,4)
  if (i == log.lh.n)
    log.lh.n++;
80102f67:	83 c2 01             	add    $0x1,%edx
80102f6a:	89 15 e8 26 11 80    	mov    %edx,0x801126e8
  b->flags |= B_DIRTY; // prevent eviction
80102f70:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102f73:	c7 45 08 a0 26 11 80 	movl   $0x801126a0,0x8(%ebp)
}
80102f7a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102f7d:	c9                   	leave  
  }
  log.lh.block[i] = b->blockno;
  if (i == log.lh.n)
    log.lh.n++;
  b->flags |= B_DIRTY; // prevent eviction
  release(&log.lock);
80102f7e:	e9 2d 16 00 00       	jmp    801045b0 <release>
80102f83:	90                   	nop
80102f84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102f88:	89 0c 85 ec 26 11 80 	mov    %ecx,-0x7feed914(,%eax,4)
80102f8f:	eb df                	jmp    80102f70 <log_write+0x80>
80102f91:	8b 43 08             	mov    0x8(%ebx),%eax
80102f94:	a3 ec 26 11 80       	mov    %eax,0x801126ec
  if (i == log.lh.n)
80102f99:	75 d5                	jne    80102f70 <log_write+0x80>
80102f9b:	eb ca                	jmp    80102f67 <log_write+0x77>
80102f9d:	8d 76 00             	lea    0x0(%esi),%esi
log_write(struct buf *b)
{
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    panic("too big a transaction");
80102fa0:	83 ec 0c             	sub    $0xc,%esp
80102fa3:	68 0f 77 10 80       	push   $0x8010770f
80102fa8:	e8 c3 d3 ff ff       	call   80100370 <panic>
  if (log.outstanding < 1)
    panic("log_write outside of trans");
80102fad:	83 ec 0c             	sub    $0xc,%esp
80102fb0:	68 25 77 10 80       	push   $0x80107725
80102fb5:	e8 b6 d3 ff ff       	call   80100370 <panic>
80102fba:	66 90                	xchg   %ax,%ax
80102fbc:	66 90                	xchg   %ax,%ax
80102fbe:	66 90                	xchg   %ax,%ax

80102fc0 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102fc0:	55                   	push   %ebp
80102fc1:	89 e5                	mov    %esp,%ebp
80102fc3:	83 ec 08             	sub    $0x8,%esp
  cprintf("cpu%d: starting\n", cpunum());
80102fc6:	e8 65 f8 ff ff       	call   80102830 <cpunum>
80102fcb:	83 ec 08             	sub    $0x8,%esp
80102fce:	50                   	push   %eax
80102fcf:	68 40 77 10 80       	push   $0x80107740
80102fd4:	e8 87 d6 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102fd9:	e8 82 2a 00 00       	call   80105a60 <idtinit>
  xchg(&cpu->started, 1); // tell startothers() we're up
80102fde:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102fe5:	b8 01 00 00 00       	mov    $0x1,%eax
80102fea:	f0 87 82 a8 00 00 00 	lock xchg %eax,0xa8(%edx)
  scheduler();     // start running processes
80102ff1:	e8 5a 0c 00 00       	call   80103c50 <scheduler>
80102ff6:	8d 76 00             	lea    0x0(%esi),%esi
80102ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103000 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80103000:	55                   	push   %ebp
80103001:	89 e5                	mov    %esp,%ebp
80103003:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80103006:	e8 75 3c 00 00       	call   80106c80 <switchkvm>
  seginit();
8010300b:	e8 90 3a 00 00       	call   80106aa0 <seginit>
  lapicinit();
80103010:	e8 1b f7 ff ff       	call   80102730 <lapicinit>
  mpmain();
80103015:	e8 a6 ff ff ff       	call   80102fc0 <mpmain>
8010301a:	66 90                	xchg   %ax,%ax
8010301c:	66 90                	xchg   %ax,%ax
8010301e:	66 90                	xchg   %ax,%ax

80103020 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
80103020:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80103024:	83 e4 f0             	and    $0xfffffff0,%esp
80103027:	ff 71 fc             	pushl  -0x4(%ecx)
8010302a:	55                   	push   %ebp
8010302b:	89 e5                	mov    %esp,%ebp
8010302d:	53                   	push   %ebx
8010302e:	51                   	push   %ecx
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
8010302f:	83 ec 08             	sub    $0x8,%esp
80103032:	68 00 00 40 80       	push   $0x80400000
80103037:	68 48 7c 11 80       	push   $0x80117c48
8010303c:	e8 bf f4 ff ff       	call   80102500 <kinit1>
  kvmalloc();      // kernel page table
80103041:	e8 1a 3c 00 00       	call   80106c60 <kvmalloc>
  mpinit();        // detect other processors
80103046:	e8 b5 01 00 00       	call   80103200 <mpinit>
  lapicinit();     // interrupt controller
8010304b:	e8 e0 f6 ff ff       	call   80102730 <lapicinit>
  seginit();       // segment descriptors
80103050:	e8 4b 3a 00 00       	call   80106aa0 <seginit>
  cprintf("\ncpu%d: starting xv6\n\n", cpunum());
80103055:	e8 d6 f7 ff ff       	call   80102830 <cpunum>
8010305a:	5a                   	pop    %edx
8010305b:	59                   	pop    %ecx
8010305c:	50                   	push   %eax
8010305d:	68 51 77 10 80       	push   $0x80107751
80103062:	e8 f9 d5 ff ff       	call   80100660 <cprintf>
  picinit();       // another interrupt controller
80103067:	e8 a4 03 00 00       	call   80103410 <picinit>
  ioapicinit();    // another interrupt controller
8010306c:	e8 af f2 ff ff       	call   80102320 <ioapicinit>
  consoleinit();   // console hardware
80103071:	e8 2a d9 ff ff       	call   801009a0 <consoleinit>
  uartinit();      // serial port
80103076:	e8 f5 2c 00 00       	call   80105d70 <uartinit>
  pinit();         // process table
8010307b:	e8 30 09 00 00       	call   801039b0 <pinit>
  tvinit();        // trap vectors
80103080:	e8 3b 29 00 00       	call   801059c0 <tvinit>
  binit();         // buffer cache
80103085:	e8 b6 cf ff ff       	call   80100040 <binit>
  fileinit();      // file table
8010308a:	e8 01 de ff ff       	call   80100e90 <fileinit>
  ideinit();       // disk
8010308f:	e8 5c f0 ff ff       	call   801020f0 <ideinit>
  if(!ismp)
80103094:	8b 1d 84 27 11 80    	mov    0x80112784,%ebx
8010309a:	83 c4 10             	add    $0x10,%esp
8010309d:	85 db                	test   %ebx,%ebx
8010309f:	0f 84 ca 00 00 00    	je     8010316f <main+0x14f>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
801030a5:	83 ec 04             	sub    $0x4,%esp

  for(c = cpus; c < cpus+ncpu; c++){
801030a8:	bb a0 27 11 80       	mov    $0x801127a0,%ebx

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
801030ad:	68 8a 00 00 00       	push   $0x8a
801030b2:	68 8c a4 10 80       	push   $0x8010a48c
801030b7:	68 00 70 00 80       	push   $0x80007000
801030bc:	e8 ef 15 00 00       	call   801046b0 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
801030c1:	69 05 80 2d 11 80 bc 	imul   $0xbc,0x80112d80,%eax
801030c8:	00 00 00 
801030cb:	83 c4 10             	add    $0x10,%esp
801030ce:	05 a0 27 11 80       	add    $0x801127a0,%eax
801030d3:	39 d8                	cmp    %ebx,%eax
801030d5:	76 7c                	jbe    80103153 <main+0x133>
801030d7:	89 f6                	mov    %esi,%esi
801030d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c == cpus+cpunum())  // We've started already.
801030e0:	e8 4b f7 ff ff       	call   80102830 <cpunum>
801030e5:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
801030eb:	05 a0 27 11 80       	add    $0x801127a0,%eax
801030f0:	39 c3                	cmp    %eax,%ebx
801030f2:	74 46                	je     8010313a <main+0x11a>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
801030f4:	e8 d7 f4 ff ff       	call   801025d0 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
801030f9:	83 ec 08             	sub    $0x8,%esp

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
801030fc:	05 00 10 00 00       	add    $0x1000,%eax
    *(void**)(code-8) = mpenter;
80103101:	c7 05 f8 6f 00 80 00 	movl   $0x80103000,0x80006ff8
80103108:	30 10 80 

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
8010310b:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80103110:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80103117:	90 10 00 

    lapicstartap(c->apicid, V2P(code));
8010311a:	68 00 70 00 00       	push   $0x7000
8010311f:	0f b6 03             	movzbl (%ebx),%eax
80103122:	50                   	push   %eax
80103123:	e8 d8 f7 ff ff       	call   80102900 <lapicstartap>
80103128:	83 c4 10             	add    $0x10,%esp
8010312b:	90                   	nop
8010312c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80103130:	8b 83 a8 00 00 00    	mov    0xa8(%ebx),%eax
80103136:	85 c0                	test   %eax,%eax
80103138:	74 f6                	je     80103130 <main+0x110>
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
8010313a:	69 05 80 2d 11 80 bc 	imul   $0xbc,0x80112d80,%eax
80103141:	00 00 00 
80103144:	81 c3 bc 00 00 00    	add    $0xbc,%ebx
8010314a:	05 a0 27 11 80       	add    $0x801127a0,%eax
8010314f:	39 c3                	cmp    %eax,%ebx
80103151:	72 8d                	jb     801030e0 <main+0xc0>
  fileinit();      // file table
  ideinit();       // disk
  if(!ismp)
    timerinit();   // uniprocessor timer
  startothers();   // start other processors
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80103153:	83 ec 08             	sub    $0x8,%esp
80103156:	68 00 00 00 8e       	push   $0x8e000000
8010315b:	68 00 00 40 80       	push   $0x80400000
80103160:	e8 0b f4 ff ff       	call   80102570 <kinit2>
  userinit();      // first user process
80103165:	e8 66 08 00 00       	call   801039d0 <userinit>
  mpmain();        // finish this processor's setup
8010316a:	e8 51 fe ff ff       	call   80102fc0 <mpmain>
  tvinit();        // trap vectors
  binit();         // buffer cache
  fileinit();      // file table
  ideinit();       // disk
  if(!ismp)
    timerinit();   // uniprocessor timer
8010316f:	e8 ec 27 00 00       	call   80105960 <timerinit>
80103174:	e9 2c ff ff ff       	jmp    801030a5 <main+0x85>
80103179:	66 90                	xchg   %ax,%ax
8010317b:	66 90                	xchg   %ax,%ax
8010317d:	66 90                	xchg   %ax,%ax
8010317f:	90                   	nop

80103180 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80103180:	55                   	push   %ebp
80103181:	89 e5                	mov    %esp,%ebp
80103183:	57                   	push   %edi
80103184:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80103185:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
8010318b:	53                   	push   %ebx
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
8010318c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
8010318f:	83 ec 0c             	sub    $0xc,%esp
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80103192:	39 de                	cmp    %ebx,%esi
80103194:	73 48                	jae    801031de <mpsearch1+0x5e>
80103196:	8d 76 00             	lea    0x0(%esi),%esi
80103199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
801031a0:	83 ec 04             	sub    $0x4,%esp
801031a3:	8d 7e 10             	lea    0x10(%esi),%edi
801031a6:	6a 04                	push   $0x4
801031a8:	68 68 77 10 80       	push   $0x80107768
801031ad:	56                   	push   %esi
801031ae:	e8 9d 14 00 00       	call   80104650 <memcmp>
801031b3:	83 c4 10             	add    $0x10,%esp
801031b6:	85 c0                	test   %eax,%eax
801031b8:	75 1e                	jne    801031d8 <mpsearch1+0x58>
801031ba:	8d 7e 10             	lea    0x10(%esi),%edi
801031bd:	89 f2                	mov    %esi,%edx
801031bf:	31 c9                	xor    %ecx,%ecx
801031c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
    sum += addr[i];
801031c8:	0f b6 02             	movzbl (%edx),%eax
801031cb:	83 c2 01             	add    $0x1,%edx
801031ce:	01 c1                	add    %eax,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801031d0:	39 fa                	cmp    %edi,%edx
801031d2:	75 f4                	jne    801031c8 <mpsearch1+0x48>
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
801031d4:	84 c9                	test   %cl,%cl
801031d6:	74 10                	je     801031e8 <mpsearch1+0x68>
{
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
801031d8:	39 fb                	cmp    %edi,%ebx
801031da:	89 fe                	mov    %edi,%esi
801031dc:	77 c2                	ja     801031a0 <mpsearch1+0x20>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
}
801031de:	8d 65 f4             	lea    -0xc(%ebp),%esp
  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
801031e1:	31 c0                	xor    %eax,%eax
}
801031e3:	5b                   	pop    %ebx
801031e4:	5e                   	pop    %esi
801031e5:	5f                   	pop    %edi
801031e6:	5d                   	pop    %ebp
801031e7:	c3                   	ret    
801031e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801031eb:	89 f0                	mov    %esi,%eax
801031ed:	5b                   	pop    %ebx
801031ee:	5e                   	pop    %esi
801031ef:	5f                   	pop    %edi
801031f0:	5d                   	pop    %ebp
801031f1:	c3                   	ret    
801031f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801031f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103200 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103200:	55                   	push   %ebp
80103201:	89 e5                	mov    %esp,%ebp
80103203:	57                   	push   %edi
80103204:	56                   	push   %esi
80103205:	53                   	push   %ebx
80103206:	83 ec 1c             	sub    $0x1c,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103209:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103210:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103217:	c1 e0 08             	shl    $0x8,%eax
8010321a:	09 d0                	or     %edx,%eax
8010321c:	c1 e0 04             	shl    $0x4,%eax
8010321f:	85 c0                	test   %eax,%eax
80103221:	75 1b                	jne    8010323e <mpinit+0x3e>
    if((mp = mpsearch1(p, 1024)))
      return mp;
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
80103223:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010322a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103231:	c1 e0 08             	shl    $0x8,%eax
80103234:	09 d0                	or     %edx,%eax
80103236:	c1 e0 0a             	shl    $0xa,%eax
80103239:	2d 00 04 00 00       	sub    $0x400,%eax
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
    if((mp = mpsearch1(p, 1024)))
8010323e:	ba 00 04 00 00       	mov    $0x400,%edx
80103243:	e8 38 ff ff ff       	call   80103180 <mpsearch1>
80103248:	85 c0                	test   %eax,%eax
8010324a:	89 c6                	mov    %eax,%esi
8010324c:	0f 84 66 01 00 00    	je     801033b8 <mpinit+0x1b8>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103252:	8b 5e 04             	mov    0x4(%esi),%ebx
80103255:	85 db                	test   %ebx,%ebx
80103257:	0f 84 d6 00 00 00    	je     80103333 <mpinit+0x133>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
8010325d:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
  if(memcmp(conf, "PCMP", 4) != 0)
80103263:	83 ec 04             	sub    $0x4,%esp
80103266:	6a 04                	push   $0x4
80103268:	68 6d 77 10 80       	push   $0x8010776d
8010326d:	50                   	push   %eax
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
8010326e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
80103271:	e8 da 13 00 00       	call   80104650 <memcmp>
80103276:	83 c4 10             	add    $0x10,%esp
80103279:	85 c0                	test   %eax,%eax
8010327b:	0f 85 b2 00 00 00    	jne    80103333 <mpinit+0x133>
    return 0;
  if(conf->version != 1 && conf->version != 4)
80103281:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103288:	3c 01                	cmp    $0x1,%al
8010328a:	74 08                	je     80103294 <mpinit+0x94>
8010328c:	3c 04                	cmp    $0x4,%al
8010328e:	0f 85 9f 00 00 00    	jne    80103333 <mpinit+0x133>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
80103294:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
8010329b:	85 ff                	test   %edi,%edi
8010329d:	74 1e                	je     801032bd <mpinit+0xbd>
8010329f:	31 d2                	xor    %edx,%edx
801032a1:	31 c0                	xor    %eax,%eax
801032a3:	90                   	nop
801032a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
801032a8:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
801032af:	80 
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801032b0:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
801032b3:	01 ca                	add    %ecx,%edx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801032b5:	39 c7                	cmp    %eax,%edi
801032b7:	75 ef                	jne    801032a8 <mpinit+0xa8>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
801032b9:	84 d2                	test   %dl,%dl
801032bb:	75 76                	jne    80103333 <mpinit+0x133>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
801032bd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801032c0:	85 ff                	test   %edi,%edi
801032c2:	74 6f                	je     80103333 <mpinit+0x133>
    return;
  ismp = 1;
801032c4:	c7 05 84 27 11 80 01 	movl   $0x1,0x80112784
801032cb:	00 00 00 
  lapic = (uint*)conf->lapicaddr;
801032ce:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801032d4:	a3 9c 26 11 80       	mov    %eax,0x8011269c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801032d9:	0f b7 8b 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%ecx
801032e0:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
801032e6:	01 f9                	add    %edi,%ecx
801032e8:	39 c8                	cmp    %ecx,%eax
801032ea:	0f 83 a0 00 00 00    	jae    80103390 <mpinit+0x190>
    switch(*p){
801032f0:	80 38 04             	cmpb   $0x4,(%eax)
801032f3:	0f 87 87 00 00 00    	ja     80103380 <mpinit+0x180>
801032f9:	0f b6 10             	movzbl (%eax),%edx
801032fc:	ff 24 95 74 77 10 80 	jmp    *-0x7fef888c(,%edx,4)
80103303:	90                   	nop
80103304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103308:	83 c0 08             	add    $0x8,%eax

  if((conf = mpconfig(&mp)) == 0)
    return;
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
8010330b:	39 c1                	cmp    %eax,%ecx
8010330d:	77 e1                	ja     801032f0 <mpinit+0xf0>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp){
8010330f:	a1 84 27 11 80       	mov    0x80112784,%eax
80103314:	85 c0                	test   %eax,%eax
80103316:	75 78                	jne    80103390 <mpinit+0x190>
    // Didn't like what we found; fall back to no MP.
    ncpu = 1;
80103318:	c7 05 80 2d 11 80 01 	movl   $0x1,0x80112d80
8010331f:	00 00 00 
    lapic = 0;
80103322:	c7 05 9c 26 11 80 00 	movl   $0x0,0x8011269c
80103329:	00 00 00 
    ioapicid = 0;
8010332c:	c6 05 80 27 11 80 00 	movb   $0x0,0x80112780
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
80103333:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103336:	5b                   	pop    %ebx
80103337:	5e                   	pop    %esi
80103338:	5f                   	pop    %edi
80103339:	5d                   	pop    %ebp
8010333a:	c3                   	ret    
8010333b:	90                   	nop
8010333c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
80103340:	8b 15 80 2d 11 80    	mov    0x80112d80,%edx
80103346:	83 fa 07             	cmp    $0x7,%edx
80103349:	7f 19                	jg     80103364 <mpinit+0x164>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
8010334b:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
8010334f:	69 fa bc 00 00 00    	imul   $0xbc,%edx,%edi
        ncpu++;
80103355:	83 c2 01             	add    $0x1,%edx
80103358:	89 15 80 2d 11 80    	mov    %edx,0x80112d80
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
8010335e:	88 9f a0 27 11 80    	mov    %bl,-0x7feed860(%edi)
        ncpu++;
      }
      p += sizeof(struct mpproc);
80103364:	83 c0 14             	add    $0x14,%eax
      continue;
80103367:	eb a2                	jmp    8010330b <mpinit+0x10b>
80103369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103370:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
80103374:	83 c0 08             	add    $0x8,%eax
      }
      p += sizeof(struct mpproc);
      continue;
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103377:	88 15 80 27 11 80    	mov    %dl,0x80112780
      p += sizeof(struct mpioapic);
      continue;
8010337d:	eb 8c                	jmp    8010330b <mpinit+0x10b>
8010337f:	90                   	nop
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
    default:
      ismp = 0;
80103380:	c7 05 84 27 11 80 00 	movl   $0x0,0x80112784
80103387:	00 00 00 
      break;
8010338a:	e9 7c ff ff ff       	jmp    8010330b <mpinit+0x10b>
8010338f:	90                   	nop
    lapic = 0;
    ioapicid = 0;
    return;
  }

  if(mp->imcrp){
80103390:	80 7e 0c 00          	cmpb   $0x0,0xc(%esi)
80103394:	74 9d                	je     80103333 <mpinit+0x133>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103396:	ba 22 00 00 00       	mov    $0x22,%edx
8010339b:	b8 70 00 00 00       	mov    $0x70,%eax
801033a0:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801033a1:	ba 23 00 00 00       	mov    $0x23,%edx
801033a6:	ec                   	in     (%dx),%al
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801033a7:	83 c8 01             	or     $0x1,%eax
801033aa:	ee                   	out    %al,(%dx)
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
801033ab:	8d 65 f4             	lea    -0xc(%ebp),%esp
801033ae:	5b                   	pop    %ebx
801033af:	5e                   	pop    %esi
801033b0:	5f                   	pop    %edi
801033b1:	5d                   	pop    %ebp
801033b2:	c3                   	ret    
801033b3:	90                   	nop
801033b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
801033b8:	ba 00 00 01 00       	mov    $0x10000,%edx
801033bd:	b8 00 00 0f 00       	mov    $0xf0000,%eax
801033c2:	e8 b9 fd ff ff       	call   80103180 <mpsearch1>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801033c7:	85 c0                	test   %eax,%eax
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
801033c9:	89 c6                	mov    %eax,%esi
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801033cb:	0f 85 81 fe ff ff    	jne    80103252 <mpinit+0x52>
801033d1:	e9 5d ff ff ff       	jmp    80103333 <mpinit+0x133>
801033d6:	66 90                	xchg   %ax,%ax
801033d8:	66 90                	xchg   %ax,%ax
801033da:	66 90                	xchg   %ax,%ax
801033dc:	66 90                	xchg   %ax,%ax
801033de:	66 90                	xchg   %ax,%ax

801033e0 <picenable>:
801033e0:	55                   	push   %ebp
801033e1:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
801033e6:	ba 21 00 00 00       	mov    $0x21,%edx
801033eb:	89 e5                	mov    %esp,%ebp
801033ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
801033f0:	d3 c0                	rol    %cl,%eax
801033f2:	66 23 05 00 a0 10 80 	and    0x8010a000,%ax
801033f9:	66 a3 00 a0 10 80    	mov    %ax,0x8010a000
801033ff:	ee                   	out    %al,(%dx)
80103400:	ba a1 00 00 00       	mov    $0xa1,%edx
80103405:	66 c1 e8 08          	shr    $0x8,%ax
80103409:	ee                   	out    %al,(%dx)
8010340a:	5d                   	pop    %ebp
8010340b:	c3                   	ret    
8010340c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103410 <picinit>:
80103410:	55                   	push   %ebp
80103411:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103416:	89 e5                	mov    %esp,%ebp
80103418:	57                   	push   %edi
80103419:	56                   	push   %esi
8010341a:	53                   	push   %ebx
8010341b:	bb 21 00 00 00       	mov    $0x21,%ebx
80103420:	89 da                	mov    %ebx,%edx
80103422:	ee                   	out    %al,(%dx)
80103423:	b9 a1 00 00 00       	mov    $0xa1,%ecx
80103428:	89 ca                	mov    %ecx,%edx
8010342a:	ee                   	out    %al,(%dx)
8010342b:	bf 11 00 00 00       	mov    $0x11,%edi
80103430:	be 20 00 00 00       	mov    $0x20,%esi
80103435:	89 f8                	mov    %edi,%eax
80103437:	89 f2                	mov    %esi,%edx
80103439:	ee                   	out    %al,(%dx)
8010343a:	b8 20 00 00 00       	mov    $0x20,%eax
8010343f:	89 da                	mov    %ebx,%edx
80103441:	ee                   	out    %al,(%dx)
80103442:	b8 04 00 00 00       	mov    $0x4,%eax
80103447:	ee                   	out    %al,(%dx)
80103448:	b8 03 00 00 00       	mov    $0x3,%eax
8010344d:	ee                   	out    %al,(%dx)
8010344e:	bb a0 00 00 00       	mov    $0xa0,%ebx
80103453:	89 f8                	mov    %edi,%eax
80103455:	89 da                	mov    %ebx,%edx
80103457:	ee                   	out    %al,(%dx)
80103458:	b8 28 00 00 00       	mov    $0x28,%eax
8010345d:	89 ca                	mov    %ecx,%edx
8010345f:	ee                   	out    %al,(%dx)
80103460:	b8 02 00 00 00       	mov    $0x2,%eax
80103465:	ee                   	out    %al,(%dx)
80103466:	b8 03 00 00 00       	mov    $0x3,%eax
8010346b:	ee                   	out    %al,(%dx)
8010346c:	bf 68 00 00 00       	mov    $0x68,%edi
80103471:	89 f2                	mov    %esi,%edx
80103473:	89 f8                	mov    %edi,%eax
80103475:	ee                   	out    %al,(%dx)
80103476:	b9 0a 00 00 00       	mov    $0xa,%ecx
8010347b:	89 c8                	mov    %ecx,%eax
8010347d:	ee                   	out    %al,(%dx)
8010347e:	89 f8                	mov    %edi,%eax
80103480:	89 da                	mov    %ebx,%edx
80103482:	ee                   	out    %al,(%dx)
80103483:	89 c8                	mov    %ecx,%eax
80103485:	ee                   	out    %al,(%dx)
80103486:	0f b7 05 00 a0 10 80 	movzwl 0x8010a000,%eax
8010348d:	66 83 f8 ff          	cmp    $0xffff,%ax
80103491:	74 10                	je     801034a3 <picinit+0x93>
80103493:	ba 21 00 00 00       	mov    $0x21,%edx
80103498:	ee                   	out    %al,(%dx)
80103499:	ba a1 00 00 00       	mov    $0xa1,%edx
8010349e:	66 c1 e8 08          	shr    $0x8,%ax
801034a2:	ee                   	out    %al,(%dx)
801034a3:	5b                   	pop    %ebx
801034a4:	5e                   	pop    %esi
801034a5:	5f                   	pop    %edi
801034a6:	5d                   	pop    %ebp
801034a7:	c3                   	ret    
801034a8:	66 90                	xchg   %ax,%ax
801034aa:	66 90                	xchg   %ax,%ax
801034ac:	66 90                	xchg   %ax,%ax
801034ae:	66 90                	xchg   %ax,%ax

801034b0 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
801034b0:	55                   	push   %ebp
801034b1:	89 e5                	mov    %esp,%ebp
801034b3:	57                   	push   %edi
801034b4:	56                   	push   %esi
801034b5:	53                   	push   %ebx
801034b6:	83 ec 0c             	sub    $0xc,%esp
801034b9:	8b 75 08             	mov    0x8(%ebp),%esi
801034bc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
801034bf:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801034c5:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
801034cb:	e8 e0 d9 ff ff       	call   80100eb0 <filealloc>
801034d0:	85 c0                	test   %eax,%eax
801034d2:	89 06                	mov    %eax,(%esi)
801034d4:	0f 84 a8 00 00 00    	je     80103582 <pipealloc+0xd2>
801034da:	e8 d1 d9 ff ff       	call   80100eb0 <filealloc>
801034df:	85 c0                	test   %eax,%eax
801034e1:	89 03                	mov    %eax,(%ebx)
801034e3:	0f 84 87 00 00 00    	je     80103570 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
801034e9:	e8 e2 f0 ff ff       	call   801025d0 <kalloc>
801034ee:	85 c0                	test   %eax,%eax
801034f0:	89 c7                	mov    %eax,%edi
801034f2:	0f 84 b0 00 00 00    	je     801035a8 <pipealloc+0xf8>
    goto bad;
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
801034f8:	83 ec 08             	sub    $0x8,%esp
  *f0 = *f1 = 0;
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
    goto bad;
  p->readopen = 1;
801034fb:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103502:	00 00 00 
  p->writeopen = 1;
80103505:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010350c:	00 00 00 
  p->nwrite = 0;
8010350f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103516:	00 00 00 
  p->nread = 0;
80103519:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103520:	00 00 00 
  initlock(&p->lock, "pipe");
80103523:	68 88 77 10 80       	push   $0x80107788
80103528:	50                   	push   %eax
80103529:	e8 82 0e 00 00       	call   801043b0 <initlock>
  (*f0)->type = FD_PIPE;
8010352e:	8b 06                	mov    (%esi),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103530:	83 c4 10             	add    $0x10,%esp
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
  (*f0)->type = FD_PIPE;
80103533:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103539:	8b 06                	mov    (%esi),%eax
8010353b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010353f:	8b 06                	mov    (%esi),%eax
80103541:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103545:	8b 06                	mov    (%esi),%eax
80103547:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
8010354a:	8b 03                	mov    (%ebx),%eax
8010354c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
80103552:	8b 03                	mov    (%ebx),%eax
80103554:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103558:	8b 03                	mov    (%ebx),%eax
8010355a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
8010355e:	8b 03                	mov    (%ebx),%eax
80103560:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103563:	8d 65 f4             	lea    -0xc(%ebp),%esp
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103566:	31 c0                	xor    %eax,%eax
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103568:	5b                   	pop    %ebx
80103569:	5e                   	pop    %esi
8010356a:	5f                   	pop    %edi
8010356b:	5d                   	pop    %ebp
8010356c:	c3                   	ret    
8010356d:	8d 76 00             	lea    0x0(%esi),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
80103570:	8b 06                	mov    (%esi),%eax
80103572:	85 c0                	test   %eax,%eax
80103574:	74 1e                	je     80103594 <pipealloc+0xe4>
    fileclose(*f0);
80103576:	83 ec 0c             	sub    $0xc,%esp
80103579:	50                   	push   %eax
8010357a:	e8 f1 d9 ff ff       	call   80100f70 <fileclose>
8010357f:	83 c4 10             	add    $0x10,%esp
  if(*f1)
80103582:	8b 03                	mov    (%ebx),%eax
80103584:	85 c0                	test   %eax,%eax
80103586:	74 0c                	je     80103594 <pipealloc+0xe4>
    fileclose(*f1);
80103588:	83 ec 0c             	sub    $0xc,%esp
8010358b:	50                   	push   %eax
8010358c:	e8 df d9 ff ff       	call   80100f70 <fileclose>
80103591:	83 c4 10             	add    $0x10,%esp
  return -1;
}
80103594:	8d 65 f4             	lea    -0xc(%ebp),%esp
    kfree((char*)p);
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
80103597:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010359c:	5b                   	pop    %ebx
8010359d:	5e                   	pop    %esi
8010359e:	5f                   	pop    %edi
8010359f:	5d                   	pop    %ebp
801035a0:	c3                   	ret    
801035a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
801035a8:	8b 06                	mov    (%esi),%eax
801035aa:	85 c0                	test   %eax,%eax
801035ac:	75 c8                	jne    80103576 <pipealloc+0xc6>
801035ae:	eb d2                	jmp    80103582 <pipealloc+0xd2>

801035b0 <pipeclose>:
  return -1;
}

void
pipeclose(struct pipe *p, int writable)
{
801035b0:	55                   	push   %ebp
801035b1:	89 e5                	mov    %esp,%ebp
801035b3:	56                   	push   %esi
801035b4:	53                   	push   %ebx
801035b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801035b8:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
801035bb:	83 ec 0c             	sub    $0xc,%esp
801035be:	53                   	push   %ebx
801035bf:	e8 0c 0e 00 00       	call   801043d0 <acquire>
  if(writable){
801035c4:	83 c4 10             	add    $0x10,%esp
801035c7:	85 f6                	test   %esi,%esi
801035c9:	74 45                	je     80103610 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
801035cb:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801035d1:	83 ec 0c             	sub    $0xc,%esp
void
pipeclose(struct pipe *p, int writable)
{
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
801035d4:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
801035db:	00 00 00 
    wakeup(&p->nread);
801035de:	50                   	push   %eax
801035df:	e8 0c 0b 00 00       	call   801040f0 <wakeup>
801035e4:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
801035e7:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
801035ed:	85 d2                	test   %edx,%edx
801035ef:	75 0a                	jne    801035fb <pipeclose+0x4b>
801035f1:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801035f7:	85 c0                	test   %eax,%eax
801035f9:	74 35                	je     80103630 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
801035fb:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801035fe:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103601:	5b                   	pop    %ebx
80103602:	5e                   	pop    %esi
80103603:	5d                   	pop    %ebp
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
80103604:	e9 a7 0f 00 00       	jmp    801045b0 <release>
80103609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
80103610:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103616:	83 ec 0c             	sub    $0xc,%esp
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
80103619:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103620:	00 00 00 
    wakeup(&p->nwrite);
80103623:	50                   	push   %eax
80103624:	e8 c7 0a 00 00       	call   801040f0 <wakeup>
80103629:	83 c4 10             	add    $0x10,%esp
8010362c:	eb b9                	jmp    801035e7 <pipeclose+0x37>
8010362e:	66 90                	xchg   %ax,%ax
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
80103630:	83 ec 0c             	sub    $0xc,%esp
80103633:	53                   	push   %ebx
80103634:	e8 77 0f 00 00       	call   801045b0 <release>
    kfree((char*)p);
80103639:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010363c:	83 c4 10             	add    $0x10,%esp
  } else
    release(&p->lock);
}
8010363f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103642:	5b                   	pop    %ebx
80103643:	5e                   	pop    %esi
80103644:	5d                   	pop    %ebp
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
80103645:	e9 d6 ed ff ff       	jmp    80102420 <kfree>
8010364a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103650 <pipewrite>:
}

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103650:	55                   	push   %ebp
80103651:	89 e5                	mov    %esp,%ebp
80103653:	57                   	push   %edi
80103654:	56                   	push   %esi
80103655:	53                   	push   %ebx
80103656:	83 ec 28             	sub    $0x28,%esp
80103659:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i;

  acquire(&p->lock);
8010365c:	57                   	push   %edi
8010365d:	e8 6e 0d 00 00       	call   801043d0 <acquire>
  for(i = 0; i < n; i++){
80103662:	8b 45 10             	mov    0x10(%ebp),%eax
80103665:	83 c4 10             	add    $0x10,%esp
80103668:	85 c0                	test   %eax,%eax
8010366a:	0f 8e c6 00 00 00    	jle    80103736 <pipewrite+0xe6>
80103670:	8b 45 0c             	mov    0xc(%ebp),%eax
80103673:	8b 8f 38 02 00 00    	mov    0x238(%edi),%ecx
80103679:	8d b7 34 02 00 00    	lea    0x234(%edi),%esi
8010367f:	8d 9f 38 02 00 00    	lea    0x238(%edi),%ebx
80103685:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103688:	03 45 10             	add    0x10(%ebp),%eax
8010368b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
8010368e:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
80103694:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
8010369a:	39 d1                	cmp    %edx,%ecx
8010369c:	0f 85 cf 00 00 00    	jne    80103771 <pipewrite+0x121>
      if(p->readopen == 0 || proc->killed){
801036a2:	8b 97 3c 02 00 00    	mov    0x23c(%edi),%edx
801036a8:	85 d2                	test   %edx,%edx
801036aa:	0f 84 a8 00 00 00    	je     80103758 <pipewrite+0x108>
801036b0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801036b7:	8b 42 24             	mov    0x24(%edx),%eax
801036ba:	85 c0                	test   %eax,%eax
801036bc:	74 25                	je     801036e3 <pipewrite+0x93>
801036be:	e9 95 00 00 00       	jmp    80103758 <pipewrite+0x108>
801036c3:	90                   	nop
801036c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801036c8:	8b 87 3c 02 00 00    	mov    0x23c(%edi),%eax
801036ce:	85 c0                	test   %eax,%eax
801036d0:	0f 84 82 00 00 00    	je     80103758 <pipewrite+0x108>
801036d6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801036dc:	8b 40 24             	mov    0x24(%eax),%eax
801036df:	85 c0                	test   %eax,%eax
801036e1:	75 75                	jne    80103758 <pipewrite+0x108>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801036e3:	83 ec 0c             	sub    $0xc,%esp
801036e6:	56                   	push   %esi
801036e7:	e8 04 0a 00 00       	call   801040f0 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801036ec:	59                   	pop    %ecx
801036ed:	58                   	pop    %eax
801036ee:	57                   	push   %edi
801036ef:	53                   	push   %ebx
801036f0:	e8 4b 08 00 00       	call   80103f40 <sleep>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801036f5:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
801036fb:	8b 97 38 02 00 00    	mov    0x238(%edi),%edx
80103701:	83 c4 10             	add    $0x10,%esp
80103704:	05 00 02 00 00       	add    $0x200,%eax
80103709:	39 c2                	cmp    %eax,%edx
8010370b:	74 bb                	je     801036c8 <pipewrite+0x78>
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
8010370d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103710:	8d 4a 01             	lea    0x1(%edx),%ecx
80103713:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
80103717:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010371d:	89 8f 38 02 00 00    	mov    %ecx,0x238(%edi)
80103723:	0f b6 00             	movzbl (%eax),%eax
80103726:	88 44 17 34          	mov    %al,0x34(%edi,%edx,1)
8010372a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
8010372d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
80103730:	0f 85 58 ff ff ff    	jne    8010368e <pipewrite+0x3e>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103736:	8d 97 34 02 00 00    	lea    0x234(%edi),%edx
8010373c:	83 ec 0c             	sub    $0xc,%esp
8010373f:	52                   	push   %edx
80103740:	e8 ab 09 00 00       	call   801040f0 <wakeup>
  release(&p->lock);
80103745:	89 3c 24             	mov    %edi,(%esp)
80103748:	e8 63 0e 00 00       	call   801045b0 <release>
  return n;
8010374d:	83 c4 10             	add    $0x10,%esp
80103750:	8b 45 10             	mov    0x10(%ebp),%eax
80103753:	eb 14                	jmp    80103769 <pipewrite+0x119>
80103755:	8d 76 00             	lea    0x0(%esi),%esi

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || proc->killed){
        release(&p->lock);
80103758:	83 ec 0c             	sub    $0xc,%esp
8010375b:	57                   	push   %edi
8010375c:	e8 4f 0e 00 00       	call   801045b0 <release>
        return -1;
80103761:	83 c4 10             	add    $0x10,%esp
80103764:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
80103769:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010376c:	5b                   	pop    %ebx
8010376d:	5e                   	pop    %esi
8010376e:	5f                   	pop    %edi
8010376f:	5d                   	pop    %ebp
80103770:	c3                   	ret    
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103771:	89 ca                	mov    %ecx,%edx
80103773:	eb 98                	jmp    8010370d <pipewrite+0xbd>
80103775:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103780 <piperead>:
  return n;
}

int
piperead(struct pipe *p, char *addr, int n)
{
80103780:	55                   	push   %ebp
80103781:	89 e5                	mov    %esp,%ebp
80103783:	57                   	push   %edi
80103784:	56                   	push   %esi
80103785:	53                   	push   %ebx
80103786:	83 ec 18             	sub    $0x18,%esp
80103789:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010378c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
8010378f:	53                   	push   %ebx
80103790:	e8 3b 0c 00 00       	call   801043d0 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103795:	83 c4 10             	add    $0x10,%esp
80103798:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010379e:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
801037a4:	75 6a                	jne    80103810 <piperead+0x90>
801037a6:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
801037ac:	85 f6                	test   %esi,%esi
801037ae:	0f 84 cc 00 00 00    	je     80103880 <piperead+0x100>
801037b4:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
801037ba:	eb 2d                	jmp    801037e9 <piperead+0x69>
801037bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
801037c0:	83 ec 08             	sub    $0x8,%esp
801037c3:	53                   	push   %ebx
801037c4:	56                   	push   %esi
801037c5:	e8 76 07 00 00       	call   80103f40 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801037ca:	83 c4 10             	add    $0x10,%esp
801037cd:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801037d3:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
801037d9:	75 35                	jne    80103810 <piperead+0x90>
801037db:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
801037e1:	85 d2                	test   %edx,%edx
801037e3:	0f 84 97 00 00 00    	je     80103880 <piperead+0x100>
    if(proc->killed){
801037e9:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801037f0:	8b 4a 24             	mov    0x24(%edx),%ecx
801037f3:	85 c9                	test   %ecx,%ecx
801037f5:	74 c9                	je     801037c0 <piperead+0x40>
      release(&p->lock);
801037f7:	83 ec 0c             	sub    $0xc,%esp
801037fa:	53                   	push   %ebx
801037fb:	e8 b0 0d 00 00       	call   801045b0 <release>
      return -1;
80103800:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103803:	8d 65 f4             	lea    -0xc(%ebp),%esp

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(proc->killed){
      release(&p->lock);
      return -1;
80103806:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
8010380b:	5b                   	pop    %ebx
8010380c:	5e                   	pop    %esi
8010380d:	5f                   	pop    %edi
8010380e:	5d                   	pop    %ebp
8010380f:	c3                   	ret    
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103810:	8b 45 10             	mov    0x10(%ebp),%eax
80103813:	85 c0                	test   %eax,%eax
80103815:	7e 69                	jle    80103880 <piperead+0x100>
    if(p->nread == p->nwrite)
80103817:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
8010381d:	31 c9                	xor    %ecx,%ecx
8010381f:	eb 15                	jmp    80103836 <piperead+0xb6>
80103821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103828:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
8010382e:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
80103834:	74 5a                	je     80103890 <piperead+0x110>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103836:	8d 72 01             	lea    0x1(%edx),%esi
80103839:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010383f:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
80103845:	0f b6 54 13 34       	movzbl 0x34(%ebx,%edx,1),%edx
8010384a:	88 14 0f             	mov    %dl,(%edi,%ecx,1)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
8010384d:	83 c1 01             	add    $0x1,%ecx
80103850:	39 4d 10             	cmp    %ecx,0x10(%ebp)
80103853:	75 d3                	jne    80103828 <piperead+0xa8>
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
80103855:	8d 93 38 02 00 00    	lea    0x238(%ebx),%edx
8010385b:	83 ec 0c             	sub    $0xc,%esp
8010385e:	52                   	push   %edx
8010385f:	e8 8c 08 00 00       	call   801040f0 <wakeup>
  release(&p->lock);
80103864:	89 1c 24             	mov    %ebx,(%esp)
80103867:	e8 44 0d 00 00       	call   801045b0 <release>
  return i;
8010386c:	8b 45 10             	mov    0x10(%ebp),%eax
8010386f:	83 c4 10             	add    $0x10,%esp
}
80103872:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103875:	5b                   	pop    %ebx
80103876:	5e                   	pop    %esi
80103877:	5f                   	pop    %edi
80103878:	5d                   	pop    %ebp
80103879:	c3                   	ret    
8010387a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103880:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
80103887:	eb cc                	jmp    80103855 <piperead+0xd5>
80103889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103890:	89 4d 10             	mov    %ecx,0x10(%ebp)
80103893:	eb c0                	jmp    80103855 <piperead+0xd5>
80103895:	66 90                	xchg   %ax,%ax
80103897:	66 90                	xchg   %ax,%ax
80103899:	66 90                	xchg   %ax,%ax
8010389b:	66 90                	xchg   %ax,%ax
8010389d:	66 90                	xchg   %ax,%ax
8010389f:	90                   	nop

801038a0 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801038a0:	55                   	push   %ebp
801038a1:	89 e5                	mov    %esp,%ebp
801038a3:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801038a4:	bb f4 54 11 80       	mov    $0x801154f4,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801038a9:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
801038ac:	68 c0 54 11 80       	push   $0x801154c0
801038b1:	e8 1a 0b 00 00       	call   801043d0 <acquire>
801038b6:	83 c4 10             	add    $0x10,%esp
801038b9:	eb 10                	jmp    801038cb <allocproc+0x2b>
801038bb:	90                   	nop
801038bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801038c0:	83 c3 7c             	add    $0x7c,%ebx
801038c3:	81 fb f4 73 11 80    	cmp    $0x801173f4,%ebx
801038c9:	74 75                	je     80103940 <allocproc+0xa0>
    if(p->state == UNUSED)
801038cb:	8b 43 0c             	mov    0xc(%ebx),%eax
801038ce:	85 c0                	test   %eax,%eax
801038d0:	75 ee                	jne    801038c0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801038d2:	a1 08 a0 10 80       	mov    0x8010a008,%eax

  release(&ptable.lock);
801038d7:	83 ec 0c             	sub    $0xc,%esp

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
801038da:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;

  release(&ptable.lock);
801038e1:	68 c0 54 11 80       	push   $0x801154c0
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801038e6:	8d 50 01             	lea    0x1(%eax),%edx
801038e9:	89 43 10             	mov    %eax,0x10(%ebx)
801038ec:	89 15 08 a0 10 80    	mov    %edx,0x8010a008

  release(&ptable.lock);
801038f2:	e8 b9 0c 00 00       	call   801045b0 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
801038f7:	e8 d4 ec ff ff       	call   801025d0 <kalloc>
801038fc:	83 c4 10             	add    $0x10,%esp
801038ff:	85 c0                	test   %eax,%eax
80103901:	89 43 08             	mov    %eax,0x8(%ebx)
80103904:	74 51                	je     80103957 <allocproc+0xb7>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103906:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010390c:	83 ec 04             	sub    $0x4,%esp
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
8010390f:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103914:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
80103917:	c7 40 14 ae 59 10 80 	movl   $0x801059ae,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010391e:	6a 14                	push   $0x14
80103920:	6a 00                	push   $0x0
80103922:	50                   	push   %eax
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
80103923:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103926:	e8 d5 0c 00 00       	call   80104600 <memset>
  p->context->eip = (uint)forkret;
8010392b:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
8010392e:	83 c4 10             	add    $0x10,%esp
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
80103931:	c7 40 10 60 39 10 80 	movl   $0x80103960,0x10(%eax)

  return p;
80103938:	89 d8                	mov    %ebx,%eax
}
8010393a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010393d:	c9                   	leave  
8010393e:	c3                   	ret    
8010393f:	90                   	nop

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
80103940:	83 ec 0c             	sub    $0xc,%esp
80103943:	68 c0 54 11 80       	push   $0x801154c0
80103948:	e8 63 0c 00 00       	call   801045b0 <release>
  return 0;
8010394d:	83 c4 10             	add    $0x10,%esp
80103950:	31 c0                	xor    %eax,%eax
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
80103952:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103955:	c9                   	leave  
80103956:	c3                   	ret    

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
80103957:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
8010395e:	eb da                	jmp    8010393a <allocproc+0x9a>

80103960 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103960:	55                   	push   %ebp
80103961:	89 e5                	mov    %esp,%ebp
80103963:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103966:	68 c0 54 11 80       	push   $0x801154c0
8010396b:	e8 40 0c 00 00       	call   801045b0 <release>

  if (first) {
80103970:	a1 04 a0 10 80       	mov    0x8010a004,%eax
80103975:	83 c4 10             	add    $0x10,%esp
80103978:	85 c0                	test   %eax,%eax
8010397a:	75 04                	jne    80103980 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010397c:	c9                   	leave  
8010397d:	c3                   	ret    
8010397e:	66 90                	xchg   %ax,%ax
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
80103980:	83 ec 0c             	sub    $0xc,%esp

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
80103983:	c7 05 04 a0 10 80 00 	movl   $0x0,0x8010a004
8010398a:	00 00 00 
    iinit(ROOTDEV);
8010398d:	6a 01                	push   $0x1
8010398f:	e8 1c dc ff ff       	call   801015b0 <iinit>
    initlog(ROOTDEV);
80103994:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010399b:	e8 d0 f2 ff ff       	call   80102c70 <initlog>
801039a0:	83 c4 10             	add    $0x10,%esp
  }

  // Return to "caller", actually trapret (see allocproc).
}
801039a3:	c9                   	leave  
801039a4:	c3                   	ret    
801039a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801039a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801039b0 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
801039b0:	55                   	push   %ebp
801039b1:	89 e5                	mov    %esp,%ebp
801039b3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801039b6:	68 8d 77 10 80       	push   $0x8010778d
801039bb:	68 c0 54 11 80       	push   $0x801154c0
801039c0:	e8 eb 09 00 00       	call   801043b0 <initlock>
}
801039c5:	83 c4 10             	add    $0x10,%esp
801039c8:	c9                   	leave  
801039c9:	c3                   	ret    
801039ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801039d0 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
801039d0:	55                   	push   %ebp
801039d1:	89 e5                	mov    %esp,%ebp
801039d3:	53                   	push   %ebx
801039d4:	83 ec 04             	sub    $0x4,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
801039d7:	e8 c4 fe ff ff       	call   801038a0 <allocproc>
801039dc:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
801039de:	a3 bc a5 10 80       	mov    %eax,0x8010a5bc
  if((p->pgdir = setupkvm()) == 0)
801039e3:	e8 08 32 00 00       	call   80106bf0 <setupkvm>
801039e8:	85 c0                	test   %eax,%eax
801039ea:	89 43 04             	mov    %eax,0x4(%ebx)
801039ed:	0f 84 bd 00 00 00    	je     80103ab0 <userinit+0xe0>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801039f3:	83 ec 04             	sub    $0x4,%esp
801039f6:	68 2c 00 00 00       	push   $0x2c
801039fb:	68 60 a4 10 80       	push   $0x8010a460
80103a00:	50                   	push   %eax
80103a01:	e8 3a 33 00 00       	call   80106d40 <inituvm>
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
80103a06:	83 c4 0c             	add    $0xc,%esp
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
80103a09:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
80103a0f:	6a 4c                	push   $0x4c
80103a11:	6a 00                	push   $0x0
80103a13:	ff 73 18             	pushl  0x18(%ebx)
80103a16:	e8 e5 0b 00 00       	call   80104600 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
80103a1b:	8b 43 18             	mov    0x18(%ebx),%eax
80103a1e:	ba 23 00 00 00       	mov    $0x23,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103a23:	b9 2b 00 00 00       	mov    $0x2b,%ecx
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103a28:	83 c4 0c             	add    $0xc,%esp
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
80103a2b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103a2f:	8b 43 18             	mov    0x18(%ebx),%eax
80103a32:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103a36:	8b 43 18             	mov    0x18(%ebx),%eax
80103a39:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103a3d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103a41:	8b 43 18             	mov    0x18(%ebx),%eax
80103a44:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103a48:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
80103a4c:	8b 43 18             	mov    0x18(%ebx),%eax
80103a4f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103a56:	8b 43 18             	mov    0x18(%ebx),%eax
80103a59:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103a60:	8b 43 18             	mov    0x18(%ebx),%eax
80103a63:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103a6a:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103a6d:	6a 10                	push   $0x10
80103a6f:	68 ad 77 10 80       	push   $0x801077ad
80103a74:	50                   	push   %eax
80103a75:	e8 86 0d 00 00       	call   80104800 <safestrcpy>
  p->cwd = namei("/");
80103a7a:	c7 04 24 b6 77 10 80 	movl   $0x801077b6,(%esp)
80103a81:	e8 5a e5 ff ff       	call   80101fe0 <namei>
80103a86:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
80103a89:	c7 04 24 c0 54 11 80 	movl   $0x801154c0,(%esp)
80103a90:	e8 3b 09 00 00       	call   801043d0 <acquire>

  p->state = RUNNABLE;
80103a95:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
80103a9c:	c7 04 24 c0 54 11 80 	movl   $0x801154c0,(%esp)
80103aa3:	e8 08 0b 00 00       	call   801045b0 <release>
}
80103aa8:	83 c4 10             	add    $0x10,%esp
80103aab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103aae:	c9                   	leave  
80103aaf:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
80103ab0:	83 ec 0c             	sub    $0xc,%esp
80103ab3:	68 94 77 10 80       	push   $0x80107794
80103ab8:	e8 b3 c8 ff ff       	call   80100370 <panic>
80103abd:	8d 76 00             	lea    0x0(%esi),%esi

80103ac0 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
80103ac0:	55                   	push   %ebp
80103ac1:	89 e5                	mov    %esp,%ebp
80103ac3:	83 ec 08             	sub    $0x8,%esp
  uint sz;

  sz = proc->sz;
80103ac6:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
80103acd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint sz;

  sz = proc->sz;
80103ad0:	8b 02                	mov    (%edx),%eax
  if(n > 0){
80103ad2:	83 f9 00             	cmp    $0x0,%ecx
80103ad5:	7e 39                	jle    80103b10 <growproc+0x50>
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
80103ad7:	83 ec 04             	sub    $0x4,%esp
80103ada:	01 c1                	add    %eax,%ecx
80103adc:	51                   	push   %ecx
80103add:	50                   	push   %eax
80103ade:	ff 72 04             	pushl  0x4(%edx)
80103ae1:	e8 9a 33 00 00       	call   80106e80 <allocuvm>
80103ae6:	83 c4 10             	add    $0x10,%esp
80103ae9:	85 c0                	test   %eax,%eax
80103aeb:	74 3b                	je     80103b28 <growproc+0x68>
80103aed:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  proc->sz = sz;
80103af4:	89 02                	mov    %eax,(%edx)
  switchuvm(proc);
80103af6:	83 ec 0c             	sub    $0xc,%esp
80103af9:	65 ff 35 04 00 00 00 	pushl  %gs:0x4
80103b00:	e8 9b 31 00 00       	call   80106ca0 <switchuvm>
  return 0;
80103b05:	83 c4 10             	add    $0x10,%esp
80103b08:	31 c0                	xor    %eax,%eax
}
80103b0a:	c9                   	leave  
80103b0b:	c3                   	ret    
80103b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
80103b10:	74 e2                	je     80103af4 <growproc+0x34>
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
80103b12:	83 ec 04             	sub    $0x4,%esp
80103b15:	01 c1                	add    %eax,%ecx
80103b17:	51                   	push   %ecx
80103b18:	50                   	push   %eax
80103b19:	ff 72 04             	pushl  0x4(%edx)
80103b1c:	e8 5f 34 00 00       	call   80106f80 <deallocuvm>
80103b21:	83 c4 10             	add    $0x10,%esp
80103b24:	85 c0                	test   %eax,%eax
80103b26:	75 c5                	jne    80103aed <growproc+0x2d>
  uint sz;

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
80103b28:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
  }
  proc->sz = sz;
  switchuvm(proc);
  return 0;
}
80103b2d:	c9                   	leave  
80103b2e:	c3                   	ret    
80103b2f:	90                   	nop

80103b30 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
80103b30:	55                   	push   %ebp
80103b31:	89 e5                	mov    %esp,%ebp
80103b33:	57                   	push   %edi
80103b34:	56                   	push   %esi
80103b35:	53                   	push   %ebx
80103b36:	83 ec 0c             	sub    $0xc,%esp
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0){
80103b39:	e8 62 fd ff ff       	call   801038a0 <allocproc>
80103b3e:	85 c0                	test   %eax,%eax
80103b40:	0f 84 d6 00 00 00    	je     80103c1c <fork+0xec>
80103b46:	89 c3                	mov    %eax,%ebx
    return -1;
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
80103b48:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103b4e:	83 ec 08             	sub    $0x8,%esp
80103b51:	ff 30                	pushl  (%eax)
80103b53:	ff 70 04             	pushl  0x4(%eax)
80103b56:	e8 05 35 00 00       	call   80107060 <copyuvm>
80103b5b:	83 c4 10             	add    $0x10,%esp
80103b5e:	85 c0                	test   %eax,%eax
80103b60:	89 43 04             	mov    %eax,0x4(%ebx)
80103b63:	0f 84 ba 00 00 00    	je     80103c23 <fork+0xf3>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
80103b69:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  np->parent = proc;
  *np->tf = *proc->tf;
80103b6f:	8b 7b 18             	mov    0x18(%ebx),%edi
80103b72:	b9 13 00 00 00       	mov    $0x13,%ecx
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
80103b77:	8b 00                	mov    (%eax),%eax
80103b79:	89 03                	mov    %eax,(%ebx)
  np->parent = proc;
80103b7b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103b81:	89 43 14             	mov    %eax,0x14(%ebx)
  *np->tf = *proc->tf;
80103b84:	8b 70 18             	mov    0x18(%eax),%esi
80103b87:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103b89:	31 f6                	xor    %esi,%esi
  np->sz = proc->sz;
  np->parent = proc;
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
80103b8b:	8b 43 18             	mov    0x18(%ebx),%eax
80103b8e:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103b95:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103b9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(i = 0; i < NOFILE; i++)
    if(proc->ofile[i])
80103ba0:	8b 44 b2 28          	mov    0x28(%edx,%esi,4),%eax
80103ba4:	85 c0                	test   %eax,%eax
80103ba6:	74 17                	je     80103bbf <fork+0x8f>
      np->ofile[i] = filedup(proc->ofile[i]);
80103ba8:	83 ec 0c             	sub    $0xc,%esp
80103bab:	50                   	push   %eax
80103bac:	e8 6f d3 ff ff       	call   80100f20 <filedup>
80103bb1:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)
80103bb5:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103bbc:	83 c4 10             	add    $0x10,%esp
  *np->tf = *proc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103bbf:	83 c6 01             	add    $0x1,%esi
80103bc2:	83 fe 10             	cmp    $0x10,%esi
80103bc5:	75 d9                	jne    80103ba0 <fork+0x70>
    if(proc->ofile[i])
      np->ofile[i] = filedup(proc->ofile[i]);
  np->cwd = idup(proc->cwd);
80103bc7:	83 ec 0c             	sub    $0xc,%esp
80103bca:	ff 72 68             	pushl  0x68(%edx)
80103bcd:	e8 ae db ff ff       	call   80101780 <idup>
80103bd2:	89 43 68             	mov    %eax,0x68(%ebx)

  safestrcpy(np->name, proc->name, sizeof(proc->name));
80103bd5:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103bdb:	83 c4 0c             	add    $0xc,%esp
80103bde:	6a 10                	push   $0x10
80103be0:	83 c0 6c             	add    $0x6c,%eax
80103be3:	50                   	push   %eax
80103be4:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103be7:	50                   	push   %eax
80103be8:	e8 13 0c 00 00       	call   80104800 <safestrcpy>

  pid = np->pid;
80103bed:	8b 73 10             	mov    0x10(%ebx),%esi

  acquire(&ptable.lock);
80103bf0:	c7 04 24 c0 54 11 80 	movl   $0x801154c0,(%esp)
80103bf7:	e8 d4 07 00 00       	call   801043d0 <acquire>

  np->state = RUNNABLE;
80103bfc:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
80103c03:	c7 04 24 c0 54 11 80 	movl   $0x801154c0,(%esp)
80103c0a:	e8 a1 09 00 00       	call   801045b0 <release>

  return pid;
80103c0f:	83 c4 10             	add    $0x10,%esp
80103c12:	89 f0                	mov    %esi,%eax
}
80103c14:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103c17:	5b                   	pop    %ebx
80103c18:	5e                   	pop    %esi
80103c19:	5f                   	pop    %edi
80103c1a:	5d                   	pop    %ebp
80103c1b:	c3                   	ret    
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
80103c1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103c21:	eb f1                	jmp    80103c14 <fork+0xe4>
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
    kfree(np->kstack);
80103c23:	83 ec 0c             	sub    $0xc,%esp
80103c26:	ff 73 08             	pushl  0x8(%ebx)
80103c29:	e8 f2 e7 ff ff       	call   80102420 <kfree>
    np->kstack = 0;
80103c2e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103c35:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103c3c:	83 c4 10             	add    $0x10,%esp
80103c3f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103c44:	eb ce                	jmp    80103c14 <fork+0xe4>
80103c46:	8d 76 00             	lea    0x0(%esi),%esi
80103c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103c50 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103c50:	55                   	push   %ebp
80103c51:	89 e5                	mov    %esp,%ebp
80103c53:	53                   	push   %ebx
80103c54:	83 ec 04             	sub    $0x4,%esp
80103c57:	89 f6                	mov    %esi,%esi
80103c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103c60:	fb                   	sti    
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103c61:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c64:	bb f4 54 11 80       	mov    $0x801154f4,%ebx
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103c69:	68 c0 54 11 80       	push   $0x801154c0
80103c6e:	e8 5d 07 00 00       	call   801043d0 <acquire>
80103c73:	83 c4 10             	add    $0x10,%esp
80103c76:	eb 13                	jmp    80103c8b <scheduler+0x3b>
80103c78:	90                   	nop
80103c79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c80:	83 c3 7c             	add    $0x7c,%ebx
80103c83:	81 fb f4 73 11 80    	cmp    $0x801173f4,%ebx
80103c89:	74 55                	je     80103ce0 <scheduler+0x90>
      if(p->state != RUNNABLE)
80103c8b:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103c8f:	75 ef                	jne    80103c80 <scheduler+0x30>

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
80103c91:	83 ec 0c             	sub    $0xc,%esp
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
80103c94:	65 89 1d 04 00 00 00 	mov    %ebx,%gs:0x4
      switchuvm(p);
80103c9b:	53                   	push   %ebx
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c9c:	83 c3 7c             	add    $0x7c,%ebx

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
80103c9f:	e8 fc 2f 00 00       	call   80106ca0 <switchuvm>
      p->state = RUNNING;
      swtch(&cpu->scheduler, p->context);
80103ca4:	58                   	pop    %eax
80103ca5:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
      p->state = RUNNING;
80103cab:	c7 43 90 04 00 00 00 	movl   $0x4,-0x70(%ebx)
      swtch(&cpu->scheduler, p->context);
80103cb2:	5a                   	pop    %edx
80103cb3:	ff 73 a0             	pushl  -0x60(%ebx)
80103cb6:	83 c0 04             	add    $0x4,%eax
80103cb9:	50                   	push   %eax
80103cba:	e8 9c 0b 00 00       	call   8010485b <swtch>
      switchkvm();
80103cbf:	e8 bc 2f 00 00       	call   80106c80 <switchkvm>

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
80103cc4:	83 c4 10             	add    $0x10,%esp
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103cc7:	81 fb f4 73 11 80    	cmp    $0x801173f4,%ebx
      swtch(&cpu->scheduler, p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
80103ccd:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80103cd4:	00 00 00 00 
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103cd8:	75 b1                	jne    80103c8b <scheduler+0x3b>
80103cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
    }
    release(&ptable.lock);
80103ce0:	83 ec 0c             	sub    $0xc,%esp
80103ce3:	68 c0 54 11 80       	push   $0x801154c0
80103ce8:	e8 c3 08 00 00       	call   801045b0 <release>

  }
80103ced:	83 c4 10             	add    $0x10,%esp
80103cf0:	e9 6b ff ff ff       	jmp    80103c60 <scheduler+0x10>
80103cf5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103d00 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103d00:	55                   	push   %ebp
80103d01:	89 e5                	mov    %esp,%ebp
80103d03:	53                   	push   %ebx
80103d04:	83 ec 10             	sub    $0x10,%esp
  int intena;

  if(!holding(&ptable.lock))
80103d07:	68 c0 54 11 80       	push   $0x801154c0
80103d0c:	e8 ef 07 00 00       	call   80104500 <holding>
80103d11:	83 c4 10             	add    $0x10,%esp
80103d14:	85 c0                	test   %eax,%eax
80103d16:	74 4c                	je     80103d64 <sched+0x64>
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
80103d18:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80103d1f:	83 ba ac 00 00 00 01 	cmpl   $0x1,0xac(%edx)
80103d26:	75 63                	jne    80103d8b <sched+0x8b>
    panic("sched locks");
  if(proc->state == RUNNING)
80103d28:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d2e:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80103d32:	74 4a                	je     80103d7e <sched+0x7e>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103d34:	9c                   	pushf  
80103d35:	59                   	pop    %ecx
    panic("sched running");
  if(readeflags()&FL_IF)
80103d36:	80 e5 02             	and    $0x2,%ch
80103d39:	75 36                	jne    80103d71 <sched+0x71>
    panic("sched interruptible");
  intena = cpu->intena;
  swtch(&proc->context, cpu->scheduler);
80103d3b:	83 ec 08             	sub    $0x8,%esp
80103d3e:	83 c0 1c             	add    $0x1c,%eax
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = cpu->intena;
80103d41:	8b 9a b0 00 00 00    	mov    0xb0(%edx),%ebx
  swtch(&proc->context, cpu->scheduler);
80103d47:	ff 72 04             	pushl  0x4(%edx)
80103d4a:	50                   	push   %eax
80103d4b:	e8 0b 0b 00 00       	call   8010485b <swtch>
  cpu->intena = intena;
80103d50:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
}
80103d56:	83 c4 10             	add    $0x10,%esp
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = cpu->intena;
  swtch(&proc->context, cpu->scheduler);
  cpu->intena = intena;
80103d59:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
}
80103d5f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103d62:	c9                   	leave  
80103d63:	c3                   	ret    
sched(void)
{
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103d64:	83 ec 0c             	sub    $0xc,%esp
80103d67:	68 b8 77 10 80       	push   $0x801077b8
80103d6c:	e8 ff c5 ff ff       	call   80100370 <panic>
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103d71:	83 ec 0c             	sub    $0xc,%esp
80103d74:	68 e4 77 10 80       	push   $0x801077e4
80103d79:	e8 f2 c5 ff ff       	call   80100370 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
80103d7e:	83 ec 0c             	sub    $0xc,%esp
80103d81:	68 d6 77 10 80       	push   $0x801077d6
80103d86:	e8 e5 c5 ff ff       	call   80100370 <panic>
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
80103d8b:	83 ec 0c             	sub    $0xc,%esp
80103d8e:	68 ca 77 10 80       	push   $0x801077ca
80103d93:	e8 d8 c5 ff ff       	call   80100370 <panic>
80103d98:	90                   	nop
80103d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103da0 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait(0) to find out it exited.
void
exit(int status)
{
80103da0:	55                   	push   %ebp
80103da1:	89 e5                	mov    %esp,%ebp
80103da3:	56                   	push   %esi
80103da4:	53                   	push   %ebx
  cprintf("my_test program returs %d\n", status);
80103da5:	83 ec 08             	sub    $0x8,%esp
80103da8:	ff 75 08             	pushl  0x8(%ebp)
80103dab:	68 f8 77 10 80       	push   $0x801077f8
80103db0:	e8 ab c8 ff ff       	call   80100660 <cprintf>
  struct proc *p;
  int fd;

  if(proc == initproc)
80103db5:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103dbc:	83 c4 10             	add    $0x10,%esp
80103dbf:	3b 15 bc a5 10 80    	cmp    0x8010a5bc,%edx
80103dc5:	0f 84 1c 01 00 00    	je     80103ee7 <exit+0x147>
80103dcb:	31 db                	xor    %ebx,%ebx
80103dcd:	8d 76 00             	lea    0x0(%esi),%esi
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd]){
80103dd0:	8d 73 08             	lea    0x8(%ebx),%esi
80103dd3:	8b 44 b2 08          	mov    0x8(%edx,%esi,4),%eax
80103dd7:	85 c0                	test   %eax,%eax
80103dd9:	74 1b                	je     80103df6 <exit+0x56>
      fileclose(proc->ofile[fd]);
80103ddb:	83 ec 0c             	sub    $0xc,%esp
80103dde:	50                   	push   %eax
80103ddf:	e8 8c d1 ff ff       	call   80100f70 <fileclose>
      proc->ofile[fd] = 0;
80103de4:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103deb:	83 c4 10             	add    $0x10,%esp
80103dee:	c7 44 b2 08 00 00 00 	movl   $0x0,0x8(%edx,%esi,4)
80103df5:	00 

  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103df6:	83 c3 01             	add    $0x1,%ebx
80103df9:	83 fb 10             	cmp    $0x10,%ebx
80103dfc:	75 d2                	jne    80103dd0 <exit+0x30>
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  begin_op();
80103dfe:	e8 0d ef ff ff       	call   80102d10 <begin_op>
  iput(proc->cwd);
80103e03:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e09:	83 ec 0c             	sub    $0xc,%esp
80103e0c:	ff 70 68             	pushl  0x68(%eax)
80103e0f:	e8 cc da ff ff       	call   801018e0 <iput>
  end_op();
80103e14:	e8 67 ef ff ff       	call   80102d80 <end_op>
  proc->cwd = 0;
80103e19:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e1f:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)

  acquire(&ptable.lock);
80103e26:	c7 04 24 c0 54 11 80 	movl   $0x801154c0,(%esp)
80103e2d:	e8 9e 05 00 00       	call   801043d0 <acquire>

  // Parent might be sleeping in wait(0).
  wakeup1(proc->parent);
80103e32:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80103e39:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e3c:	b8 f4 54 11 80       	mov    $0x801154f4,%eax
  proc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait(0).
  wakeup1(proc->parent);
80103e41:	8b 51 14             	mov    0x14(%ecx),%edx
80103e44:	eb 14                	jmp    80103e5a <exit+0xba>
80103e46:	8d 76 00             	lea    0x0(%esi),%esi
80103e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e50:	83 c0 7c             	add    $0x7c,%eax
80103e53:	3d f4 73 11 80       	cmp    $0x801173f4,%eax
80103e58:	74 1c                	je     80103e76 <exit+0xd6>
    if(p->state == SLEEPING && p->chan == chan)
80103e5a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e5e:	75 f0                	jne    80103e50 <exit+0xb0>
80103e60:	3b 50 20             	cmp    0x20(%eax),%edx
80103e63:	75 eb                	jne    80103e50 <exit+0xb0>
      p->state = RUNNABLE;
80103e65:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e6c:	83 c0 7c             	add    $0x7c,%eax
80103e6f:	3d f4 73 11 80       	cmp    $0x801173f4,%eax
80103e74:	75 e4                	jne    80103e5a <exit+0xba>
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103e76:	8b 1d bc a5 10 80    	mov    0x8010a5bc,%ebx
80103e7c:	ba f4 54 11 80       	mov    $0x801154f4,%edx
80103e81:	eb 10                	jmp    80103e93 <exit+0xf3>
80103e83:	90                   	nop
80103e84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Parent might be sleeping in wait(0).
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e88:	83 c2 7c             	add    $0x7c,%edx
80103e8b:	81 fa f4 73 11 80    	cmp    $0x801173f4,%edx
80103e91:	74 3b                	je     80103ece <exit+0x12e>
    if(p->parent == proc){
80103e93:	3b 4a 14             	cmp    0x14(%edx),%ecx
80103e96:	75 f0                	jne    80103e88 <exit+0xe8>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103e98:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103e9c:	89 5a 14             	mov    %ebx,0x14(%edx)
      if(p->state == ZOMBIE)
80103e9f:	75 e7                	jne    80103e88 <exit+0xe8>
80103ea1:	b8 f4 54 11 80       	mov    $0x801154f4,%eax
80103ea6:	eb 12                	jmp    80103eba <exit+0x11a>
80103ea8:	90                   	nop
80103ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103eb0:	83 c0 7c             	add    $0x7c,%eax
80103eb3:	3d f4 73 11 80       	cmp    $0x801173f4,%eax
80103eb8:	74 ce                	je     80103e88 <exit+0xe8>
    if(p->state == SLEEPING && p->chan == chan)
80103eba:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103ebe:	75 f0                	jne    80103eb0 <exit+0x110>
80103ec0:	3b 58 20             	cmp    0x20(%eax),%ebx
80103ec3:	75 eb                	jne    80103eb0 <exit+0x110>
      p->state = RUNNABLE;
80103ec5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103ecc:	eb e2                	jmp    80103eb0 <exit+0x110>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
80103ece:	c7 41 0c 05 00 00 00 	movl   $0x5,0xc(%ecx)
  sched();
80103ed5:	e8 26 fe ff ff       	call   80103d00 <sched>
  panic("zombie exit");
80103eda:	83 ec 0c             	sub    $0xc,%esp
80103edd:	68 20 78 10 80       	push   $0x80107820
80103ee2:	e8 89 c4 ff ff       	call   80100370 <panic>
  cprintf("my_test program returs %d\n", status);
  struct proc *p;
  int fd;

  if(proc == initproc)
    panic("init exiting");
80103ee7:	83 ec 0c             	sub    $0xc,%esp
80103eea:	68 13 78 10 80       	push   $0x80107813
80103eef:	e8 7c c4 ff ff       	call   80100370 <panic>
80103ef4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103efa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103f00 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103f00:	55                   	push   %ebp
80103f01:	89 e5                	mov    %esp,%ebp
80103f03:	83 ec 14             	sub    $0x14,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103f06:	68 c0 54 11 80       	push   $0x801154c0
80103f0b:	e8 c0 04 00 00       	call   801043d0 <acquire>
  proc->state = RUNNABLE;
80103f10:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f16:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80103f1d:	e8 de fd ff ff       	call   80103d00 <sched>
  release(&ptable.lock);
80103f22:	c7 04 24 c0 54 11 80 	movl   $0x801154c0,(%esp)
80103f29:	e8 82 06 00 00       	call   801045b0 <release>
}
80103f2e:	83 c4 10             	add    $0x10,%esp
80103f31:	c9                   	leave  
80103f32:	c3                   	ret    
80103f33:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103f40 <sleep>:
// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
80103f40:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103f46:	55                   	push   %ebp
80103f47:	89 e5                	mov    %esp,%ebp
80103f49:	56                   	push   %esi
80103f4a:	53                   	push   %ebx
  if(proc == 0)
80103f4b:	85 c0                	test   %eax,%eax

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103f4d:	8b 75 08             	mov    0x8(%ebp),%esi
80103f50:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(proc == 0)
80103f53:	0f 84 97 00 00 00    	je     80103ff0 <sleep+0xb0>
    panic("sleep");

  if(lk == 0)
80103f59:	85 db                	test   %ebx,%ebx
80103f5b:	0f 84 82 00 00 00    	je     80103fe3 <sleep+0xa3>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103f61:	81 fb c0 54 11 80    	cmp    $0x801154c0,%ebx
80103f67:	74 57                	je     80103fc0 <sleep+0x80>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103f69:	83 ec 0c             	sub    $0xc,%esp
80103f6c:	68 c0 54 11 80       	push   $0x801154c0
80103f71:	e8 5a 04 00 00       	call   801043d0 <acquire>
    release(lk);
80103f76:	89 1c 24             	mov    %ebx,(%esp)
80103f79:	e8 32 06 00 00       	call   801045b0 <release>
  }

  // Go to sleep.
  proc->chan = chan;
80103f7e:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f84:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103f87:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103f8e:	e8 6d fd ff ff       	call   80103d00 <sched>

  // Tidy up.
  proc->chan = 0;
80103f93:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f99:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103fa0:	c7 04 24 c0 54 11 80 	movl   $0x801154c0,(%esp)
80103fa7:	e8 04 06 00 00       	call   801045b0 <release>
    acquire(lk);
80103fac:	89 5d 08             	mov    %ebx,0x8(%ebp)
80103faf:	83 c4 10             	add    $0x10,%esp
  }
}
80103fb2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103fb5:	5b                   	pop    %ebx
80103fb6:	5e                   	pop    %esi
80103fb7:	5d                   	pop    %ebp
  proc->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103fb8:	e9 13 04 00 00       	jmp    801043d0 <acquire>
80103fbd:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }

  // Go to sleep.
  proc->chan = chan;
80103fc0:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103fc3:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103fca:	e8 31 fd ff ff       	call   80103d00 <sched>

  // Tidy up.
  proc->chan = 0;
80103fcf:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103fd5:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103fdc:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103fdf:	5b                   	pop    %ebx
80103fe0:	5e                   	pop    %esi
80103fe1:	5d                   	pop    %ebp
80103fe2:	c3                   	ret    
{
  if(proc == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103fe3:	83 ec 0c             	sub    $0xc,%esp
80103fe6:	68 32 78 10 80       	push   $0x80107832
80103feb:	e8 80 c3 ff ff       	call   80100370 <panic>
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
    panic("sleep");
80103ff0:	83 ec 0c             	sub    $0xc,%esp
80103ff3:	68 2c 78 10 80       	push   $0x8010782c
80103ff8:	e8 73 c3 ff ff       	call   80100370 <panic>
80103ffd:	8d 76 00             	lea    0x0(%esi),%esi

80104000 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(int *status)
{
80104000:	55                   	push   %ebp
80104001:	89 e5                	mov    %esp,%ebp
80104003:	56                   	push   %esi
80104004:	53                   	push   %ebx
  cprintf("sys_wait returns status: %d\n", *status);
80104005:	8b 45 08             	mov    0x8(%ebp),%eax
80104008:	83 ec 08             	sub    $0x8,%esp
8010400b:	ff 30                	pushl  (%eax)
8010400d:	68 43 78 10 80       	push   $0x80107843
80104012:	e8 49 c6 ff ff       	call   80100660 <cprintf>
  struct proc *p;
  int havekids, pid;

  acquire(&ptable.lock);
80104017:	c7 04 24 c0 54 11 80 	movl   $0x801154c0,(%esp)
8010401e:	e8 ad 03 00 00       	call   801043d0 <acquire>
80104023:	83 c4 10             	add    $0x10,%esp
80104026:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
8010402c:	31 d2                	xor    %edx,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010402e:	bb f4 54 11 80       	mov    $0x801154f4,%ebx
80104033:	eb 0e                	jmp    80104043 <wait+0x43>
80104035:	8d 76 00             	lea    0x0(%esi),%esi
80104038:	83 c3 7c             	add    $0x7c,%ebx
8010403b:	81 fb f4 73 11 80    	cmp    $0x801173f4,%ebx
80104041:	74 1d                	je     80104060 <wait+0x60>
      if(p->parent != proc)
80104043:	3b 43 14             	cmp    0x14(%ebx),%eax
80104046:	75 f0                	jne    80104038 <wait+0x38>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80104048:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
8010404c:	74 30                	je     8010407e <wait+0x7e>

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010404e:	83 c3 7c             	add    $0x7c,%ebx
      if(p->parent != proc)
        continue;
      havekids = 1;
80104051:	ba 01 00 00 00       	mov    $0x1,%edx

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104056:	81 fb f4 73 11 80    	cmp    $0x801173f4,%ebx
8010405c:	75 e5                	jne    80104043 <wait+0x43>
8010405e:	66 90                	xchg   %ax,%ax
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
80104060:	85 d2                	test   %edx,%edx
80104062:	74 70                	je     801040d4 <wait+0xd4>
80104064:	8b 50 24             	mov    0x24(%eax),%edx
80104067:	85 d2                	test   %edx,%edx
80104069:	75 69                	jne    801040d4 <wait+0xd4>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
8010406b:	83 ec 08             	sub    $0x8,%esp
8010406e:	68 c0 54 11 80       	push   $0x801154c0
80104073:	50                   	push   %eax
80104074:	e8 c7 fe ff ff       	call   80103f40 <sleep>
  }
80104079:	83 c4 10             	add    $0x10,%esp
8010407c:	eb a8                	jmp    80104026 <wait+0x26>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
8010407e:	83 ec 0c             	sub    $0xc,%esp
80104081:	ff 73 08             	pushl  0x8(%ebx)
      if(p->parent != proc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
80104084:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80104087:	e8 94 e3 ff ff       	call   80102420 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
8010408c:	59                   	pop    %ecx
8010408d:	ff 73 04             	pushl  0x4(%ebx)
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80104090:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80104097:	e8 14 2f 00 00       	call   80106fb0 <freevm>
        p->pid = 0;
8010409c:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
801040a3:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
801040aa:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
801040ae:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
801040b5:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
801040bc:	c7 04 24 c0 54 11 80 	movl   $0x801154c0,(%esp)
801040c3:	e8 e8 04 00 00       	call   801045b0 <release>
        return pid;
801040c8:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
801040cb:	8d 65 f8             	lea    -0x8(%ebp),%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
801040ce:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
801040d0:	5b                   	pop    %ebx
801040d1:	5e                   	pop    %esi
801040d2:	5d                   	pop    %ebp
801040d3:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
801040d4:	83 ec 0c             	sub    $0xc,%esp
801040d7:	68 c0 54 11 80       	push   $0x801154c0
801040dc:	e8 cf 04 00 00       	call   801045b0 <release>
      return -1;
801040e1:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
801040e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
      return -1;
801040e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
801040ec:	5b                   	pop    %ebx
801040ed:	5e                   	pop    %esi
801040ee:	5d                   	pop    %ebp
801040ef:	c3                   	ret    

801040f0 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
801040f0:	55                   	push   %ebp
801040f1:	89 e5                	mov    %esp,%ebp
801040f3:	53                   	push   %ebx
801040f4:	83 ec 10             	sub    $0x10,%esp
801040f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
801040fa:	68 c0 54 11 80       	push   $0x801154c0
801040ff:	e8 cc 02 00 00       	call   801043d0 <acquire>
80104104:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104107:	b8 f4 54 11 80       	mov    $0x801154f4,%eax
8010410c:	eb 0c                	jmp    8010411a <wakeup+0x2a>
8010410e:	66 90                	xchg   %ax,%ax
80104110:	83 c0 7c             	add    $0x7c,%eax
80104113:	3d f4 73 11 80       	cmp    $0x801173f4,%eax
80104118:	74 1c                	je     80104136 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
8010411a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
8010411e:	75 f0                	jne    80104110 <wakeup+0x20>
80104120:	3b 58 20             	cmp    0x20(%eax),%ebx
80104123:	75 eb                	jne    80104110 <wakeup+0x20>
      p->state = RUNNABLE;
80104125:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010412c:	83 c0 7c             	add    $0x7c,%eax
8010412f:	3d f4 73 11 80       	cmp    $0x801173f4,%eax
80104134:	75 e4                	jne    8010411a <wakeup+0x2a>
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80104136:	c7 45 08 c0 54 11 80 	movl   $0x801154c0,0x8(%ebp)
}
8010413d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104140:	c9                   	leave  
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80104141:	e9 6a 04 00 00       	jmp    801045b0 <release>
80104146:	8d 76 00             	lea    0x0(%esi),%esi
80104149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104150 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80104150:	55                   	push   %ebp
80104151:	89 e5                	mov    %esp,%ebp
80104153:	53                   	push   %ebx
80104154:	83 ec 10             	sub    $0x10,%esp
80104157:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010415a:	68 c0 54 11 80       	push   $0x801154c0
8010415f:	e8 6c 02 00 00       	call   801043d0 <acquire>
80104164:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104167:	b8 f4 54 11 80       	mov    $0x801154f4,%eax
8010416c:	eb 0c                	jmp    8010417a <kill+0x2a>
8010416e:	66 90                	xchg   %ax,%ax
80104170:	83 c0 7c             	add    $0x7c,%eax
80104173:	3d f4 73 11 80       	cmp    $0x801173f4,%eax
80104178:	74 3e                	je     801041b8 <kill+0x68>
    if(p->pid == pid){
8010417a:	39 58 10             	cmp    %ebx,0x10(%eax)
8010417d:	75 f1                	jne    80104170 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
8010417f:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
80104183:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
8010418a:	74 1c                	je     801041a8 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
8010418c:	83 ec 0c             	sub    $0xc,%esp
8010418f:	68 c0 54 11 80       	push   $0x801154c0
80104194:	e8 17 04 00 00       	call   801045b0 <release>
      return 0;
80104199:	83 c4 10             	add    $0x10,%esp
8010419c:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
8010419e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801041a1:	c9                   	leave  
801041a2:	c3                   	ret    
801041a3:	90                   	nop
801041a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
801041a8:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801041af:	eb db                	jmp    8010418c <kill+0x3c>
801041b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
801041b8:	83 ec 0c             	sub    $0xc,%esp
801041bb:	68 c0 54 11 80       	push   $0x801154c0
801041c0:	e8 eb 03 00 00       	call   801045b0 <release>
  return -1;
801041c5:	83 c4 10             	add    $0x10,%esp
801041c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801041cd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801041d0:	c9                   	leave  
801041d1:	c3                   	ret    
801041d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801041d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801041e0 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
801041e0:	55                   	push   %ebp
801041e1:	89 e5                	mov    %esp,%ebp
801041e3:	57                   	push   %edi
801041e4:	56                   	push   %esi
801041e5:	53                   	push   %ebx
801041e6:	8d 75 e8             	lea    -0x18(%ebp),%esi
801041e9:	bb 60 55 11 80       	mov    $0x80115560,%ebx
801041ee:	83 ec 3c             	sub    $0x3c,%esp
801041f1:	eb 24                	jmp    80104217 <procdump+0x37>
801041f3:	90                   	nop
801041f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
801041f8:	83 ec 0c             	sub    $0xc,%esp
801041fb:	68 66 77 10 80       	push   $0x80107766
80104200:	e8 5b c4 ff ff       	call   80100660 <cprintf>
80104205:	83 c4 10             	add    $0x10,%esp
80104208:	83 c3 7c             	add    $0x7c,%ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010420b:	81 fb 60 74 11 80    	cmp    $0x80117460,%ebx
80104211:	0f 84 81 00 00 00    	je     80104298 <procdump+0xb8>
    if(p->state == UNUSED)
80104217:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010421a:	85 c0                	test   %eax,%eax
8010421c:	74 ea                	je     80104208 <procdump+0x28>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
8010421e:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
80104221:	ba 60 78 10 80       	mov    $0x80107860,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104226:	77 11                	ja     80104239 <procdump+0x59>
80104228:	8b 14 85 98 78 10 80 	mov    -0x7fef8768(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
8010422f:	b8 60 78 10 80       	mov    $0x80107860,%eax
80104234:	85 d2                	test   %edx,%edx
80104236:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
80104239:	53                   	push   %ebx
8010423a:	52                   	push   %edx
8010423b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010423e:	68 64 78 10 80       	push   $0x80107864
80104243:	e8 18 c4 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
80104248:	83 c4 10             	add    $0x10,%esp
8010424b:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
8010424f:	75 a7                	jne    801041f8 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104251:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104254:	83 ec 08             	sub    $0x8,%esp
80104257:	8d 7d c0             	lea    -0x40(%ebp),%edi
8010425a:	50                   	push   %eax
8010425b:	8b 43 b0             	mov    -0x50(%ebx),%eax
8010425e:	8b 40 0c             	mov    0xc(%eax),%eax
80104261:	83 c0 08             	add    $0x8,%eax
80104264:	50                   	push   %eax
80104265:	e8 36 02 00 00       	call   801044a0 <getcallerpcs>
8010426a:	83 c4 10             	add    $0x10,%esp
8010426d:	8d 76 00             	lea    0x0(%esi),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
80104270:	8b 17                	mov    (%edi),%edx
80104272:	85 d2                	test   %edx,%edx
80104274:	74 82                	je     801041f8 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104276:	83 ec 08             	sub    $0x8,%esp
80104279:	83 c7 04             	add    $0x4,%edi
8010427c:	52                   	push   %edx
8010427d:	68 89 72 10 80       	push   $0x80107289
80104282:	e8 d9 c3 ff ff       	call   80100660 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
80104287:	83 c4 10             	add    $0x10,%esp
8010428a:	39 f7                	cmp    %esi,%edi
8010428c:	75 e2                	jne    80104270 <procdump+0x90>
8010428e:	e9 65 ff ff ff       	jmp    801041f8 <procdump+0x18>
80104293:	90                   	nop
80104294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
80104298:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010429b:	5b                   	pop    %ebx
8010429c:	5e                   	pop    %esi
8010429d:	5f                   	pop    %edi
8010429e:	5d                   	pop    %ebp
8010429f:	c3                   	ret    

801042a0 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
801042a0:	55                   	push   %ebp
801042a1:	89 e5                	mov    %esp,%ebp
801042a3:	53                   	push   %ebx
801042a4:	83 ec 0c             	sub    $0xc,%esp
801042a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
801042aa:	68 b0 78 10 80       	push   $0x801078b0
801042af:	8d 43 04             	lea    0x4(%ebx),%eax
801042b2:	50                   	push   %eax
801042b3:	e8 f8 00 00 00       	call   801043b0 <initlock>
  lk->name = name;
801042b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
801042bb:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
801042c1:	83 c4 10             	add    $0x10,%esp
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
  lk->locked = 0;
  lk->pid = 0;
801042c4:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)

void
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
801042cb:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
  lk->pid = 0;
}
801042ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801042d1:	c9                   	leave  
801042d2:	c3                   	ret    
801042d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801042d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801042e0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
801042e0:	55                   	push   %ebp
801042e1:	89 e5                	mov    %esp,%ebp
801042e3:	56                   	push   %esi
801042e4:	53                   	push   %ebx
801042e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801042e8:	83 ec 0c             	sub    $0xc,%esp
801042eb:	8d 73 04             	lea    0x4(%ebx),%esi
801042ee:	56                   	push   %esi
801042ef:	e8 dc 00 00 00       	call   801043d0 <acquire>
  while (lk->locked) {
801042f4:	8b 13                	mov    (%ebx),%edx
801042f6:	83 c4 10             	add    $0x10,%esp
801042f9:	85 d2                	test   %edx,%edx
801042fb:	74 16                	je     80104313 <acquiresleep+0x33>
801042fd:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
80104300:	83 ec 08             	sub    $0x8,%esp
80104303:	56                   	push   %esi
80104304:	53                   	push   %ebx
80104305:	e8 36 fc ff ff       	call   80103f40 <sleep>

void
acquiresleep(struct sleeplock *lk)
{
  acquire(&lk->lk);
  while (lk->locked) {
8010430a:	8b 03                	mov    (%ebx),%eax
8010430c:	83 c4 10             	add    $0x10,%esp
8010430f:	85 c0                	test   %eax,%eax
80104311:	75 ed                	jne    80104300 <acquiresleep+0x20>
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
80104313:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = proc->pid;
80104319:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010431f:	8b 40 10             	mov    0x10(%eax),%eax
80104322:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
80104325:	89 75 08             	mov    %esi,0x8(%ebp)
}
80104328:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010432b:	5b                   	pop    %ebx
8010432c:	5e                   	pop    %esi
8010432d:	5d                   	pop    %ebp
  while (lk->locked) {
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
  lk->pid = proc->pid;
  release(&lk->lk);
8010432e:	e9 7d 02 00 00       	jmp    801045b0 <release>
80104333:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104340 <releasesleep>:
}

void
releasesleep(struct sleeplock *lk)
{
80104340:	55                   	push   %ebp
80104341:	89 e5                	mov    %esp,%ebp
80104343:	56                   	push   %esi
80104344:	53                   	push   %ebx
80104345:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104348:	83 ec 0c             	sub    $0xc,%esp
8010434b:	8d 73 04             	lea    0x4(%ebx),%esi
8010434e:	56                   	push   %esi
8010434f:	e8 7c 00 00 00       	call   801043d0 <acquire>
  lk->locked = 0;
80104354:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010435a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104361:	89 1c 24             	mov    %ebx,(%esp)
80104364:	e8 87 fd ff ff       	call   801040f0 <wakeup>
  release(&lk->lk);
80104369:	89 75 08             	mov    %esi,0x8(%ebp)
8010436c:	83 c4 10             	add    $0x10,%esp
}
8010436f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104372:	5b                   	pop    %ebx
80104373:	5e                   	pop    %esi
80104374:	5d                   	pop    %ebp
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
80104375:	e9 36 02 00 00       	jmp    801045b0 <release>
8010437a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104380 <holdingsleep>:
}

int
holdingsleep(struct sleeplock *lk)
{
80104380:	55                   	push   %ebp
80104381:	89 e5                	mov    %esp,%ebp
80104383:	56                   	push   %esi
80104384:	53                   	push   %ebx
80104385:	8b 75 08             	mov    0x8(%ebp),%esi
  int r;
  
  acquire(&lk->lk);
80104388:	83 ec 0c             	sub    $0xc,%esp
8010438b:	8d 5e 04             	lea    0x4(%esi),%ebx
8010438e:	53                   	push   %ebx
8010438f:	e8 3c 00 00 00       	call   801043d0 <acquire>
  r = lk->locked;
80104394:	8b 36                	mov    (%esi),%esi
  release(&lk->lk);
80104396:	89 1c 24             	mov    %ebx,(%esp)
80104399:	e8 12 02 00 00       	call   801045b0 <release>
  return r;
}
8010439e:	8d 65 f8             	lea    -0x8(%ebp),%esp
801043a1:	89 f0                	mov    %esi,%eax
801043a3:	5b                   	pop    %ebx
801043a4:	5e                   	pop    %esi
801043a5:	5d                   	pop    %ebp
801043a6:	c3                   	ret    
801043a7:	66 90                	xchg   %ax,%ax
801043a9:	66 90                	xchg   %ax,%ax
801043ab:	66 90                	xchg   %ax,%ax
801043ad:	66 90                	xchg   %ax,%ax
801043af:	90                   	nop

801043b0 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
801043b0:	55                   	push   %ebp
801043b1:	89 e5                	mov    %esp,%ebp
801043b3:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
801043b6:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
801043b9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
801043bf:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
801043c2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
801043c9:	5d                   	pop    %ebp
801043ca:	c3                   	ret    
801043cb:	90                   	nop
801043cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801043d0 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
801043d0:	55                   	push   %ebp
801043d1:	89 e5                	mov    %esp,%ebp
801043d3:	53                   	push   %ebx
801043d4:	83 ec 04             	sub    $0x4,%esp
801043d7:	9c                   	pushf  
801043d8:	5a                   	pop    %edx
}

static inline void
cli(void)
{
  asm volatile("cli");
801043d9:	fa                   	cli    
{
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
801043da:	65 8b 0d 00 00 00 00 	mov    %gs:0x0,%ecx
801043e1:	8b 81 ac 00 00 00    	mov    0xac(%ecx),%eax
801043e7:	85 c0                	test   %eax,%eax
801043e9:	75 0c                	jne    801043f7 <acquire+0x27>
    cpu->intena = eflags & FL_IF;
801043eb:	81 e2 00 02 00 00    	and    $0x200,%edx
801043f1:	89 91 b0 00 00 00    	mov    %edx,0xb0(%ecx)
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
801043f7:	8b 55 08             	mov    0x8(%ebp),%edx

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
    cpu->intena = eflags & FL_IF;
  cpu->ncli += 1;
801043fa:	83 c0 01             	add    $0x1,%eax
801043fd:	89 81 ac 00 00 00    	mov    %eax,0xac(%ecx)

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104403:	8b 02                	mov    (%edx),%eax
80104405:	85 c0                	test   %eax,%eax
80104407:	74 05                	je     8010440e <acquire+0x3e>
80104409:	39 4a 08             	cmp    %ecx,0x8(%edx)
8010440c:	74 7a                	je     80104488 <acquire+0xb8>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
8010440e:	b9 01 00 00 00       	mov    $0x1,%ecx
80104413:	90                   	nop
80104414:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104418:	89 c8                	mov    %ecx,%eax
8010441a:	f0 87 02             	lock xchg %eax,(%edx)
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");

  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
8010441d:	85 c0                	test   %eax,%eax
8010441f:	75 f7                	jne    80104418 <acquire+0x48>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
80104421:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
80104426:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104429:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
getcallerpcs(void *v, uint pcs[])
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
8010442f:	89 ea                	mov    %ebp,%edx
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
80104431:	89 41 08             	mov    %eax,0x8(%ecx)
  getcallerpcs(&lk, lk->pcs);
80104434:	83 c1 0c             	add    $0xc,%ecx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104437:	31 c0                	xor    %eax,%eax
80104439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104440:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104446:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010444c:	77 1a                	ja     80104468 <acquire+0x98>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010444e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104451:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104454:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
80104457:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104459:	83 f8 0a             	cmp    $0xa,%eax
8010445c:	75 e2                	jne    80104440 <acquire+0x70>
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
  getcallerpcs(&lk, lk->pcs);
}
8010445e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104461:	c9                   	leave  
80104462:	c3                   	ret    
80104463:	90                   	nop
80104464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80104468:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010446f:	83 c0 01             	add    $0x1,%eax
80104472:	83 f8 0a             	cmp    $0xa,%eax
80104475:	74 e7                	je     8010445e <acquire+0x8e>
    pcs[i] = 0;
80104477:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010447e:	83 c0 01             	add    $0x1,%eax
80104481:	83 f8 0a             	cmp    $0xa,%eax
80104484:	75 e2                	jne    80104468 <acquire+0x98>
80104486:	eb d6                	jmp    8010445e <acquire+0x8e>
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");
80104488:	83 ec 0c             	sub    $0xc,%esp
8010448b:	68 bb 78 10 80       	push   $0x801078bb
80104490:	e8 db be ff ff       	call   80100370 <panic>
80104495:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801044a0 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801044a0:	55                   	push   %ebp
801044a1:	89 e5                	mov    %esp,%ebp
801044a3:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
801044a4:	8b 45 08             	mov    0x8(%ebp),%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
801044a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
801044aa:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
801044ad:	31 c0                	xor    %eax,%eax
801044af:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
801044b0:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801044b6:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801044bc:	77 1a                	ja     801044d8 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
801044be:	8b 5a 04             	mov    0x4(%edx),%ebx
801044c1:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801044c4:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
801044c7:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801044c9:	83 f8 0a             	cmp    $0xa,%eax
801044cc:	75 e2                	jne    801044b0 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
801044ce:	5b                   	pop    %ebx
801044cf:	5d                   	pop    %ebp
801044d0:	c3                   	ret    
801044d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
801044d8:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801044df:	83 c0 01             	add    $0x1,%eax
801044e2:	83 f8 0a             	cmp    $0xa,%eax
801044e5:	74 e7                	je     801044ce <getcallerpcs+0x2e>
    pcs[i] = 0;
801044e7:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801044ee:	83 c0 01             	add    $0x1,%eax
801044f1:	83 f8 0a             	cmp    $0xa,%eax
801044f4:	75 e2                	jne    801044d8 <getcallerpcs+0x38>
801044f6:	eb d6                	jmp    801044ce <getcallerpcs+0x2e>
801044f8:	90                   	nop
801044f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104500 <holding>:
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
80104500:	55                   	push   %ebp
80104501:	89 e5                	mov    %esp,%ebp
80104503:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == cpu;
80104506:	8b 02                	mov    (%edx),%eax
80104508:	85 c0                	test   %eax,%eax
8010450a:	74 14                	je     80104520 <holding+0x20>
8010450c:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80104512:	39 42 08             	cmp    %eax,0x8(%edx)
}
80104515:	5d                   	pop    %ebp

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104516:	0f 94 c0             	sete   %al
80104519:	0f b6 c0             	movzbl %al,%eax
}
8010451c:	c3                   	ret    
8010451d:	8d 76 00             	lea    0x0(%esi),%esi
80104520:	31 c0                	xor    %eax,%eax
80104522:	5d                   	pop    %ebp
80104523:	c3                   	ret    
80104524:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010452a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104530 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104530:	55                   	push   %ebp
80104531:	89 e5                	mov    %esp,%ebp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104533:	9c                   	pushf  
80104534:	59                   	pop    %ecx
}

static inline void
cli(void)
{
  asm volatile("cli");
80104535:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
80104536:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
8010453d:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
80104543:	85 c0                	test   %eax,%eax
80104545:	75 0c                	jne    80104553 <pushcli+0x23>
    cpu->intena = eflags & FL_IF;
80104547:	81 e1 00 02 00 00    	and    $0x200,%ecx
8010454d:	89 8a b0 00 00 00    	mov    %ecx,0xb0(%edx)
  cpu->ncli += 1;
80104553:	83 c0 01             	add    $0x1,%eax
80104556:	89 82 ac 00 00 00    	mov    %eax,0xac(%edx)
}
8010455c:	5d                   	pop    %ebp
8010455d:	c3                   	ret    
8010455e:	66 90                	xchg   %ax,%ax

80104560 <popcli>:

void
popcli(void)
{
80104560:	55                   	push   %ebp
80104561:	89 e5                	mov    %esp,%ebp
80104563:	83 ec 08             	sub    $0x8,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104566:	9c                   	pushf  
80104567:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104568:	f6 c4 02             	test   $0x2,%ah
8010456b:	75 2c                	jne    80104599 <popcli+0x39>
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
8010456d:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104574:	83 aa ac 00 00 00 01 	subl   $0x1,0xac(%edx)
8010457b:	78 0f                	js     8010458c <popcli+0x2c>
    panic("popcli");
  if(cpu->ncli == 0 && cpu->intena)
8010457d:	75 0b                	jne    8010458a <popcli+0x2a>
8010457f:	8b 82 b0 00 00 00    	mov    0xb0(%edx),%eax
80104585:	85 c0                	test   %eax,%eax
80104587:	74 01                	je     8010458a <popcli+0x2a>
}

static inline void
sti(void)
{
  asm volatile("sti");
80104589:	fb                   	sti    
    sti();
}
8010458a:	c9                   	leave  
8010458b:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
    panic("popcli");
8010458c:	83 ec 0c             	sub    $0xc,%esp
8010458f:	68 da 78 10 80       	push   $0x801078da
80104594:	e8 d7 bd ff ff       	call   80100370 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
80104599:	83 ec 0c             	sub    $0xc,%esp
8010459c:	68 c3 78 10 80       	push   $0x801078c3
801045a1:	e8 ca bd ff ff       	call   80100370 <panic>
801045a6:	8d 76 00             	lea    0x0(%esi),%esi
801045a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045b0 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
801045b0:	55                   	push   %ebp
801045b1:	89 e5                	mov    %esp,%ebp
801045b3:	83 ec 08             	sub    $0x8,%esp
801045b6:	8b 45 08             	mov    0x8(%ebp),%eax

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
801045b9:	8b 10                	mov    (%eax),%edx
801045bb:	85 d2                	test   %edx,%edx
801045bd:	74 0c                	je     801045cb <release+0x1b>
801045bf:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801045c6:	39 50 08             	cmp    %edx,0x8(%eax)
801045c9:	74 15                	je     801045e0 <release+0x30>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
801045cb:	83 ec 0c             	sub    $0xc,%esp
801045ce:	68 e1 78 10 80       	push   $0x801078e1
801045d3:	e8 98 bd ff ff       	call   80100370 <panic>
801045d8:	90                   	nop
801045d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  lk->pcs[0] = 0;
801045e0:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  lk->cpu = 0;
801045e7:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
801045ee:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
801045f3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  popcli();
}
801045f9:	c9                   	leave  
  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );

  popcli();
801045fa:	e9 61 ff ff ff       	jmp    80104560 <popcli>
801045ff:	90                   	nop

80104600 <memset>:
80104600:	55                   	push   %ebp
80104601:	89 e5                	mov    %esp,%ebp
80104603:	57                   	push   %edi
80104604:	53                   	push   %ebx
80104605:	8b 55 08             	mov    0x8(%ebp),%edx
80104608:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010460b:	f6 c2 03             	test   $0x3,%dl
8010460e:	75 05                	jne    80104615 <memset+0x15>
80104610:	f6 c1 03             	test   $0x3,%cl
80104613:	74 13                	je     80104628 <memset+0x28>
80104615:	89 d7                	mov    %edx,%edi
80104617:	8b 45 0c             	mov    0xc(%ebp),%eax
8010461a:	fc                   	cld    
8010461b:	f3 aa                	rep stos %al,%es:(%edi)
8010461d:	5b                   	pop    %ebx
8010461e:	89 d0                	mov    %edx,%eax
80104620:	5f                   	pop    %edi
80104621:	5d                   	pop    %ebp
80104622:	c3                   	ret    
80104623:	90                   	nop
80104624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104628:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
8010462c:	c1 e9 02             	shr    $0x2,%ecx
8010462f:	89 fb                	mov    %edi,%ebx
80104631:	89 f8                	mov    %edi,%eax
80104633:	c1 e3 18             	shl    $0x18,%ebx
80104636:	c1 e0 10             	shl    $0x10,%eax
80104639:	09 d8                	or     %ebx,%eax
8010463b:	09 f8                	or     %edi,%eax
8010463d:	c1 e7 08             	shl    $0x8,%edi
80104640:	09 f8                	or     %edi,%eax
80104642:	89 d7                	mov    %edx,%edi
80104644:	fc                   	cld    
80104645:	f3 ab                	rep stos %eax,%es:(%edi)
80104647:	5b                   	pop    %ebx
80104648:	89 d0                	mov    %edx,%eax
8010464a:	5f                   	pop    %edi
8010464b:	5d                   	pop    %ebp
8010464c:	c3                   	ret    
8010464d:	8d 76 00             	lea    0x0(%esi),%esi

80104650 <memcmp>:
80104650:	55                   	push   %ebp
80104651:	89 e5                	mov    %esp,%ebp
80104653:	57                   	push   %edi
80104654:	56                   	push   %esi
80104655:	8b 45 10             	mov    0x10(%ebp),%eax
80104658:	53                   	push   %ebx
80104659:	8b 75 0c             	mov    0xc(%ebp),%esi
8010465c:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010465f:	85 c0                	test   %eax,%eax
80104661:	74 29                	je     8010468c <memcmp+0x3c>
80104663:	0f b6 13             	movzbl (%ebx),%edx
80104666:	0f b6 0e             	movzbl (%esi),%ecx
80104669:	38 d1                	cmp    %dl,%cl
8010466b:	75 2b                	jne    80104698 <memcmp+0x48>
8010466d:	8d 78 ff             	lea    -0x1(%eax),%edi
80104670:	31 c0                	xor    %eax,%eax
80104672:	eb 14                	jmp    80104688 <memcmp+0x38>
80104674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104678:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
8010467d:	83 c0 01             	add    $0x1,%eax
80104680:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
80104684:	38 ca                	cmp    %cl,%dl
80104686:	75 10                	jne    80104698 <memcmp+0x48>
80104688:	39 f8                	cmp    %edi,%eax
8010468a:	75 ec                	jne    80104678 <memcmp+0x28>
8010468c:	5b                   	pop    %ebx
8010468d:	31 c0                	xor    %eax,%eax
8010468f:	5e                   	pop    %esi
80104690:	5f                   	pop    %edi
80104691:	5d                   	pop    %ebp
80104692:	c3                   	ret    
80104693:	90                   	nop
80104694:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104698:	0f b6 c2             	movzbl %dl,%eax
8010469b:	5b                   	pop    %ebx
8010469c:	29 c8                	sub    %ecx,%eax
8010469e:	5e                   	pop    %esi
8010469f:	5f                   	pop    %edi
801046a0:	5d                   	pop    %ebp
801046a1:	c3                   	ret    
801046a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046b0 <memmove>:
801046b0:	55                   	push   %ebp
801046b1:	89 e5                	mov    %esp,%ebp
801046b3:	56                   	push   %esi
801046b4:	53                   	push   %ebx
801046b5:	8b 45 08             	mov    0x8(%ebp),%eax
801046b8:	8b 75 0c             	mov    0xc(%ebp),%esi
801046bb:	8b 5d 10             	mov    0x10(%ebp),%ebx
801046be:	39 c6                	cmp    %eax,%esi
801046c0:	73 2e                	jae    801046f0 <memmove+0x40>
801046c2:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
801046c5:	39 c8                	cmp    %ecx,%eax
801046c7:	73 27                	jae    801046f0 <memmove+0x40>
801046c9:	85 db                	test   %ebx,%ebx
801046cb:	8d 53 ff             	lea    -0x1(%ebx),%edx
801046ce:	74 17                	je     801046e7 <memmove+0x37>
801046d0:	29 d9                	sub    %ebx,%ecx
801046d2:	89 cb                	mov    %ecx,%ebx
801046d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801046d8:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
801046dc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801046df:	83 ea 01             	sub    $0x1,%edx
801046e2:	83 fa ff             	cmp    $0xffffffff,%edx
801046e5:	75 f1                	jne    801046d8 <memmove+0x28>
801046e7:	5b                   	pop    %ebx
801046e8:	5e                   	pop    %esi
801046e9:	5d                   	pop    %ebp
801046ea:	c3                   	ret    
801046eb:	90                   	nop
801046ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801046f0:	31 d2                	xor    %edx,%edx
801046f2:	85 db                	test   %ebx,%ebx
801046f4:	74 f1                	je     801046e7 <memmove+0x37>
801046f6:	8d 76 00             	lea    0x0(%esi),%esi
801046f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104700:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104704:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104707:	83 c2 01             	add    $0x1,%edx
8010470a:	39 d3                	cmp    %edx,%ebx
8010470c:	75 f2                	jne    80104700 <memmove+0x50>
8010470e:	5b                   	pop    %ebx
8010470f:	5e                   	pop    %esi
80104710:	5d                   	pop    %ebp
80104711:	c3                   	ret    
80104712:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104720 <memcpy>:
80104720:	55                   	push   %ebp
80104721:	89 e5                	mov    %esp,%ebp
80104723:	5d                   	pop    %ebp
80104724:	eb 8a                	jmp    801046b0 <memmove>
80104726:	8d 76 00             	lea    0x0(%esi),%esi
80104729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104730 <strncmp>:
80104730:	55                   	push   %ebp
80104731:	89 e5                	mov    %esp,%ebp
80104733:	57                   	push   %edi
80104734:	56                   	push   %esi
80104735:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104738:	53                   	push   %ebx
80104739:	8b 7d 08             	mov    0x8(%ebp),%edi
8010473c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010473f:	85 c9                	test   %ecx,%ecx
80104741:	74 37                	je     8010477a <strncmp+0x4a>
80104743:	0f b6 17             	movzbl (%edi),%edx
80104746:	0f b6 1e             	movzbl (%esi),%ebx
80104749:	84 d2                	test   %dl,%dl
8010474b:	74 3f                	je     8010478c <strncmp+0x5c>
8010474d:	38 d3                	cmp    %dl,%bl
8010474f:	75 3b                	jne    8010478c <strncmp+0x5c>
80104751:	8d 47 01             	lea    0x1(%edi),%eax
80104754:	01 cf                	add    %ecx,%edi
80104756:	eb 1b                	jmp    80104773 <strncmp+0x43>
80104758:	90                   	nop
80104759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104760:	0f b6 10             	movzbl (%eax),%edx
80104763:	84 d2                	test   %dl,%dl
80104765:	74 21                	je     80104788 <strncmp+0x58>
80104767:	0f b6 19             	movzbl (%ecx),%ebx
8010476a:	83 c0 01             	add    $0x1,%eax
8010476d:	89 ce                	mov    %ecx,%esi
8010476f:	38 da                	cmp    %bl,%dl
80104771:	75 19                	jne    8010478c <strncmp+0x5c>
80104773:	39 c7                	cmp    %eax,%edi
80104775:	8d 4e 01             	lea    0x1(%esi),%ecx
80104778:	75 e6                	jne    80104760 <strncmp+0x30>
8010477a:	5b                   	pop    %ebx
8010477b:	31 c0                	xor    %eax,%eax
8010477d:	5e                   	pop    %esi
8010477e:	5f                   	pop    %edi
8010477f:	5d                   	pop    %ebp
80104780:	c3                   	ret    
80104781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104788:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
8010478c:	0f b6 c2             	movzbl %dl,%eax
8010478f:	29 d8                	sub    %ebx,%eax
80104791:	5b                   	pop    %ebx
80104792:	5e                   	pop    %esi
80104793:	5f                   	pop    %edi
80104794:	5d                   	pop    %ebp
80104795:	c3                   	ret    
80104796:	8d 76 00             	lea    0x0(%esi),%esi
80104799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047a0 <strncpy>:
801047a0:	55                   	push   %ebp
801047a1:	89 e5                	mov    %esp,%ebp
801047a3:	56                   	push   %esi
801047a4:	53                   	push   %ebx
801047a5:	8b 45 08             	mov    0x8(%ebp),%eax
801047a8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801047ab:	8b 4d 10             	mov    0x10(%ebp),%ecx
801047ae:	89 c2                	mov    %eax,%edx
801047b0:	eb 19                	jmp    801047cb <strncpy+0x2b>
801047b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801047b8:	83 c3 01             	add    $0x1,%ebx
801047bb:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
801047bf:	83 c2 01             	add    $0x1,%edx
801047c2:	84 c9                	test   %cl,%cl
801047c4:	88 4a ff             	mov    %cl,-0x1(%edx)
801047c7:	74 09                	je     801047d2 <strncpy+0x32>
801047c9:	89 f1                	mov    %esi,%ecx
801047cb:	85 c9                	test   %ecx,%ecx
801047cd:	8d 71 ff             	lea    -0x1(%ecx),%esi
801047d0:	7f e6                	jg     801047b8 <strncpy+0x18>
801047d2:	31 c9                	xor    %ecx,%ecx
801047d4:	85 f6                	test   %esi,%esi
801047d6:	7e 17                	jle    801047ef <strncpy+0x4f>
801047d8:	90                   	nop
801047d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801047e0:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
801047e4:	89 f3                	mov    %esi,%ebx
801047e6:	83 c1 01             	add    $0x1,%ecx
801047e9:	29 cb                	sub    %ecx,%ebx
801047eb:	85 db                	test   %ebx,%ebx
801047ed:	7f f1                	jg     801047e0 <strncpy+0x40>
801047ef:	5b                   	pop    %ebx
801047f0:	5e                   	pop    %esi
801047f1:	5d                   	pop    %ebp
801047f2:	c3                   	ret    
801047f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801047f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104800 <safestrcpy>:
80104800:	55                   	push   %ebp
80104801:	89 e5                	mov    %esp,%ebp
80104803:	56                   	push   %esi
80104804:	53                   	push   %ebx
80104805:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104808:	8b 45 08             	mov    0x8(%ebp),%eax
8010480b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010480e:	85 c9                	test   %ecx,%ecx
80104810:	7e 26                	jle    80104838 <safestrcpy+0x38>
80104812:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104816:	89 c1                	mov    %eax,%ecx
80104818:	eb 17                	jmp    80104831 <safestrcpy+0x31>
8010481a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104820:	83 c2 01             	add    $0x1,%edx
80104823:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104827:	83 c1 01             	add    $0x1,%ecx
8010482a:	84 db                	test   %bl,%bl
8010482c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010482f:	74 04                	je     80104835 <safestrcpy+0x35>
80104831:	39 f2                	cmp    %esi,%edx
80104833:	75 eb                	jne    80104820 <safestrcpy+0x20>
80104835:	c6 01 00             	movb   $0x0,(%ecx)
80104838:	5b                   	pop    %ebx
80104839:	5e                   	pop    %esi
8010483a:	5d                   	pop    %ebp
8010483b:	c3                   	ret    
8010483c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104840 <strlen>:
80104840:	55                   	push   %ebp
80104841:	31 c0                	xor    %eax,%eax
80104843:	89 e5                	mov    %esp,%ebp
80104845:	8b 55 08             	mov    0x8(%ebp),%edx
80104848:	80 3a 00             	cmpb   $0x0,(%edx)
8010484b:	74 0c                	je     80104859 <strlen+0x19>
8010484d:	8d 76 00             	lea    0x0(%esi),%esi
80104850:	83 c0 01             	add    $0x1,%eax
80104853:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104857:	75 f7                	jne    80104850 <strlen+0x10>
80104859:	5d                   	pop    %ebp
8010485a:	c3                   	ret    

8010485b <swtch>:
8010485b:	8b 44 24 04          	mov    0x4(%esp),%eax
8010485f:	8b 54 24 08          	mov    0x8(%esp),%edx
80104863:	55                   	push   %ebp
80104864:	53                   	push   %ebx
80104865:	56                   	push   %esi
80104866:	57                   	push   %edi
80104867:	89 20                	mov    %esp,(%eax)
80104869:	89 d4                	mov    %edx,%esp
8010486b:	5f                   	pop    %edi
8010486c:	5e                   	pop    %esi
8010486d:	5b                   	pop    %ebx
8010486e:	5d                   	pop    %ebp
8010486f:	c3                   	ret    

80104870 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104870:	55                   	push   %ebp
  if(addr >= proc->sz || addr+4 > proc->sz)
80104871:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104878:	89 e5                	mov    %esp,%ebp
8010487a:	8b 45 08             	mov    0x8(%ebp),%eax
  if(addr >= proc->sz || addr+4 > proc->sz)
8010487d:	8b 12                	mov    (%edx),%edx
8010487f:	39 c2                	cmp    %eax,%edx
80104881:	76 15                	jbe    80104898 <fetchint+0x28>
80104883:	8d 48 04             	lea    0x4(%eax),%ecx
80104886:	39 ca                	cmp    %ecx,%edx
80104888:	72 0e                	jb     80104898 <fetchint+0x28>
    return -1;
  *ip = *(int*)(addr);
8010488a:	8b 10                	mov    (%eax),%edx
8010488c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010488f:	89 10                	mov    %edx,(%eax)
  return 0;
80104891:	31 c0                	xor    %eax,%eax
}
80104893:	5d                   	pop    %ebp
80104894:	c3                   	ret    
80104895:	8d 76 00             	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
80104898:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  *ip = *(int*)(addr);
  return 0;
}
8010489d:	5d                   	pop    %ebp
8010489e:	c3                   	ret    
8010489f:	90                   	nop

801048a0 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801048a0:	55                   	push   %ebp
  char *s, *ep;

  if(addr >= proc->sz)
801048a1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
801048a7:	89 e5                	mov    %esp,%ebp
801048a9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  char *s, *ep;

  if(addr >= proc->sz)
801048ac:	39 08                	cmp    %ecx,(%eax)
801048ae:	76 2c                	jbe    801048dc <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
801048b0:	8b 55 0c             	mov    0xc(%ebp),%edx
801048b3:	89 c8                	mov    %ecx,%eax
801048b5:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
801048b7:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801048be:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
801048c0:	39 d1                	cmp    %edx,%ecx
801048c2:	73 18                	jae    801048dc <fetchstr+0x3c>
    if(*s == 0)
801048c4:	80 39 00             	cmpb   $0x0,(%ecx)
801048c7:	75 0c                	jne    801048d5 <fetchstr+0x35>
801048c9:	eb 1d                	jmp    801048e8 <fetchstr+0x48>
801048cb:	90                   	nop
801048cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801048d0:	80 38 00             	cmpb   $0x0,(%eax)
801048d3:	74 13                	je     801048e8 <fetchstr+0x48>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
801048d5:	83 c0 01             	add    $0x1,%eax
801048d8:	39 c2                	cmp    %eax,%edx
801048da:	77 f4                	ja     801048d0 <fetchstr+0x30>
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
    return -1;
801048dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
  return -1;
}
801048e1:	5d                   	pop    %ebp
801048e2:	c3                   	ret    
801048e3:	90                   	nop
801048e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
801048e8:	29 c8                	sub    %ecx,%eax
  return -1;
}
801048ea:	5d                   	pop    %ebp
801048eb:	c3                   	ret    
801048ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801048f0 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801048f0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
}

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
801048f7:	55                   	push   %ebp
801048f8:	89 e5                	mov    %esp,%ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801048fa:	8b 42 18             	mov    0x18(%edx),%eax
801048fd:	8b 4d 08             	mov    0x8(%ebp),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104900:	8b 12                	mov    (%edx),%edx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104902:	8b 40 44             	mov    0x44(%eax),%eax
80104905:	8d 04 88             	lea    (%eax,%ecx,4),%eax
80104908:	8d 48 04             	lea    0x4(%eax),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
8010490b:	39 d1                	cmp    %edx,%ecx
8010490d:	73 19                	jae    80104928 <argint+0x38>
8010490f:	8d 48 08             	lea    0x8(%eax),%ecx
80104912:	39 ca                	cmp    %ecx,%edx
80104914:	72 12                	jb     80104928 <argint+0x38>
    return -1;
  *ip = *(int*)(addr);
80104916:	8b 50 04             	mov    0x4(%eax),%edx
80104919:	8b 45 0c             	mov    0xc(%ebp),%eax
8010491c:	89 10                	mov    %edx,(%eax)
  return 0;
8010491e:	31 c0                	xor    %eax,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
80104920:	5d                   	pop    %ebp
80104921:	c3                   	ret    
80104922:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
80104928:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
8010492d:	5d                   	pop    %ebp
8010492e:	c3                   	ret    
8010492f:	90                   	nop

80104930 <argptr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104930:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104936:	55                   	push   %ebp
80104937:	89 e5                	mov    %esp,%ebp
80104939:	56                   	push   %esi
8010493a:	53                   	push   %ebx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
8010493b:	8b 48 18             	mov    0x18(%eax),%ecx
8010493e:	8b 5d 08             	mov    0x8(%ebp),%ebx
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104941:	8b 55 10             	mov    0x10(%ebp),%edx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104944:	8b 49 44             	mov    0x44(%ecx),%ecx
80104947:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
8010494a:	8b 08                	mov    (%eax),%ecx
argptr(int n, char **pp, int size)
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
8010494c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104951:	8d 73 04             	lea    0x4(%ebx),%esi

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104954:	39 ce                	cmp    %ecx,%esi
80104956:	73 1f                	jae    80104977 <argptr+0x47>
80104958:	8d 73 08             	lea    0x8(%ebx),%esi
8010495b:	39 f1                	cmp    %esi,%ecx
8010495d:	72 18                	jb     80104977 <argptr+0x47>
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= proc->sz || (uint)i+size > proc->sz)
8010495f:	85 d2                	test   %edx,%edx
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
  *ip = *(int*)(addr);
80104961:	8b 5b 04             	mov    0x4(%ebx),%ebx
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= proc->sz || (uint)i+size > proc->sz)
80104964:	78 11                	js     80104977 <argptr+0x47>
80104966:	39 cb                	cmp    %ecx,%ebx
80104968:	73 0d                	jae    80104977 <argptr+0x47>
8010496a:	01 da                	add    %ebx,%edx
8010496c:	39 ca                	cmp    %ecx,%edx
8010496e:	77 07                	ja     80104977 <argptr+0x47>
    return -1;
  *pp = (char*)i;
80104970:	8b 45 0c             	mov    0xc(%ebp),%eax
80104973:	89 18                	mov    %ebx,(%eax)
  return 0;
80104975:	31 c0                	xor    %eax,%eax
}
80104977:	5b                   	pop    %ebx
80104978:	5e                   	pop    %esi
80104979:	5d                   	pop    %ebp
8010497a:	c3                   	ret    
8010497b:	90                   	nop
8010497c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104980 <argstr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104980:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104986:	55                   	push   %ebp
80104987:	89 e5                	mov    %esp,%ebp

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104989:	8b 50 18             	mov    0x18(%eax),%edx
8010498c:	8b 4d 08             	mov    0x8(%ebp),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
8010498f:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104991:	8b 52 44             	mov    0x44(%edx),%edx
80104994:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
80104997:	8d 4a 04             	lea    0x4(%edx),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
8010499a:	39 c1                	cmp    %eax,%ecx
8010499c:	73 07                	jae    801049a5 <argstr+0x25>
8010499e:	8d 4a 08             	lea    0x8(%edx),%ecx
801049a1:	39 c8                	cmp    %ecx,%eax
801049a3:	73 0b                	jae    801049b0 <argstr+0x30>
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
801049a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
801049aa:	5d                   	pop    %ebp
801049ab:	c3                   	ret    
801049ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
  *ip = *(int*)(addr);
801049b0:	8b 4a 04             	mov    0x4(%edx),%ecx
int
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
801049b3:	39 c1                	cmp    %eax,%ecx
801049b5:	73 ee                	jae    801049a5 <argstr+0x25>
    return -1;
  *pp = (char*)addr;
801049b7:	8b 55 0c             	mov    0xc(%ebp),%edx
801049ba:	89 c8                	mov    %ecx,%eax
801049bc:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
801049be:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801049c5:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
801049c7:	39 d1                	cmp    %edx,%ecx
801049c9:	73 da                	jae    801049a5 <argstr+0x25>
    if(*s == 0)
801049cb:	80 39 00             	cmpb   $0x0,(%ecx)
801049ce:	75 0d                	jne    801049dd <argstr+0x5d>
801049d0:	eb 1e                	jmp    801049f0 <argstr+0x70>
801049d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801049d8:	80 38 00             	cmpb   $0x0,(%eax)
801049db:	74 13                	je     801049f0 <argstr+0x70>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
801049dd:	83 c0 01             	add    $0x1,%eax
801049e0:	39 c2                	cmp    %eax,%edx
801049e2:	77 f4                	ja     801049d8 <argstr+0x58>
801049e4:	eb bf                	jmp    801049a5 <argstr+0x25>
801049e6:	8d 76 00             	lea    0x0(%esi),%esi
801049e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(*s == 0)
      return s - *pp;
801049f0:	29 c8                	sub    %ecx,%eax
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, pp);
}
801049f2:	5d                   	pop    %ebp
801049f3:	c3                   	ret    
801049f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801049fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104a00 <syscall>:
[SYS_set]     sys_set, //added for 1.1
};

void
syscall(void)
{
80104a00:	55                   	push   %ebp
80104a01:	89 e5                	mov    %esp,%ebp
80104a03:	53                   	push   %ebx
80104a04:	83 ec 04             	sub    $0x4,%esp
  int num;

  num = proc->tf->eax;
80104a07:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104a0e:	8b 5a 18             	mov    0x18(%edx),%ebx
80104a11:	8b 43 1c             	mov    0x1c(%ebx),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104a14:	8d 48 ff             	lea    -0x1(%eax),%ecx
80104a17:	83 f9 15             	cmp    $0x15,%ecx
80104a1a:	77 1c                	ja     80104a38 <syscall+0x38>
80104a1c:	8b 0c 85 20 79 10 80 	mov    -0x7fef86e0(,%eax,4),%ecx
80104a23:	85 c9                	test   %ecx,%ecx
80104a25:	74 11                	je     80104a38 <syscall+0x38>
    proc->tf->eax = syscalls[num]();
80104a27:	ff d1                	call   *%ecx
80104a29:	89 43 1c             	mov    %eax,0x1c(%ebx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
  }
}
80104a2c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104a2f:	c9                   	leave  
80104a30:	c3                   	ret    
80104a31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104a38:	50                   	push   %eax
            proc->pid, proc->name, num);
80104a39:	8d 42 6c             	lea    0x6c(%edx),%eax

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104a3c:	50                   	push   %eax
80104a3d:	ff 72 10             	pushl  0x10(%edx)
80104a40:	68 e9 78 10 80       	push   $0x801078e9
80104a45:	e8 16 bc ff ff       	call   80100660 <cprintf>
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
80104a4a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104a50:	83 c4 10             	add    $0x10,%esp
80104a53:	8b 40 18             	mov    0x18(%eax),%eax
80104a56:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
80104a5d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104a60:	c9                   	leave  
80104a61:	c3                   	ret    
80104a62:	66 90                	xchg   %ax,%ax
80104a64:	66 90                	xchg   %ax,%ax
80104a66:	66 90                	xchg   %ax,%ax
80104a68:	66 90                	xchg   %ax,%ax
80104a6a:	66 90                	xchg   %ax,%ax
80104a6c:	66 90                	xchg   %ax,%ax
80104a6e:	66 90                	xchg   %ax,%ax

80104a70 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104a70:	55                   	push   %ebp
80104a71:	89 e5                	mov    %esp,%ebp
80104a73:	57                   	push   %edi
80104a74:	56                   	push   %esi
80104a75:	53                   	push   %ebx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104a76:	8d 75 da             	lea    -0x26(%ebp),%esi
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104a79:	83 ec 44             	sub    $0x44,%esp
80104a7c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
80104a7f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104a82:	56                   	push   %esi
80104a83:	50                   	push   %eax
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104a84:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104a87:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104a8a:	e8 71 d5 ff ff       	call   80102000 <nameiparent>
80104a8f:	83 c4 10             	add    $0x10,%esp
80104a92:	85 c0                	test   %eax,%eax
80104a94:	0f 84 f6 00 00 00    	je     80104b90 <create+0x120>
    return 0;
  ilock(dp);
80104a9a:	83 ec 0c             	sub    $0xc,%esp
80104a9d:	89 c7                	mov    %eax,%edi
80104a9f:	50                   	push   %eax
80104aa0:	e8 0b cd ff ff       	call   801017b0 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80104aa5:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104aa8:	83 c4 0c             	add    $0xc,%esp
80104aab:	50                   	push   %eax
80104aac:	56                   	push   %esi
80104aad:	57                   	push   %edi
80104aae:	e8 0d d2 ff ff       	call   80101cc0 <dirlookup>
80104ab3:	83 c4 10             	add    $0x10,%esp
80104ab6:	85 c0                	test   %eax,%eax
80104ab8:	89 c3                	mov    %eax,%ebx
80104aba:	74 54                	je     80104b10 <create+0xa0>
    iunlockput(dp);
80104abc:	83 ec 0c             	sub    $0xc,%esp
80104abf:	57                   	push   %edi
80104ac0:	e8 5b cf ff ff       	call   80101a20 <iunlockput>
    ilock(ip);
80104ac5:	89 1c 24             	mov    %ebx,(%esp)
80104ac8:	e8 e3 cc ff ff       	call   801017b0 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104acd:	83 c4 10             	add    $0x10,%esp
80104ad0:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104ad5:	75 19                	jne    80104af0 <create+0x80>
80104ad7:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
80104adc:	89 d8                	mov    %ebx,%eax
80104ade:	75 10                	jne    80104af0 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104ae0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ae3:	5b                   	pop    %ebx
80104ae4:	5e                   	pop    %esi
80104ae5:	5f                   	pop    %edi
80104ae6:	5d                   	pop    %ebp
80104ae7:	c3                   	ret    
80104ae8:	90                   	nop
80104ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if((ip = dirlookup(dp, name, &off)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104af0:	83 ec 0c             	sub    $0xc,%esp
80104af3:	53                   	push   %ebx
80104af4:	e8 27 cf ff ff       	call   80101a20 <iunlockput>
    return 0;
80104af9:	83 c4 10             	add    $0x10,%esp
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104afc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
    return 0;
80104aff:	31 c0                	xor    %eax,%eax
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104b01:	5b                   	pop    %ebx
80104b02:	5e                   	pop    %esi
80104b03:	5f                   	pop    %edi
80104b04:	5d                   	pop    %ebp
80104b05:	c3                   	ret    
80104b06:	8d 76 00             	lea    0x0(%esi),%esi
80104b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
80104b10:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104b14:	83 ec 08             	sub    $0x8,%esp
80104b17:	50                   	push   %eax
80104b18:	ff 37                	pushl  (%edi)
80104b1a:	e8 21 cb ff ff       	call   80101640 <ialloc>
80104b1f:	83 c4 10             	add    $0x10,%esp
80104b22:	85 c0                	test   %eax,%eax
80104b24:	89 c3                	mov    %eax,%ebx
80104b26:	0f 84 cc 00 00 00    	je     80104bf8 <create+0x188>
    panic("create: ialloc");

  ilock(ip);
80104b2c:	83 ec 0c             	sub    $0xc,%esp
80104b2f:	50                   	push   %eax
80104b30:	e8 7b cc ff ff       	call   801017b0 <ilock>
  ip->major = major;
80104b35:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104b39:	66 89 43 52          	mov    %ax,0x52(%ebx)
  ip->minor = minor;
80104b3d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104b41:	66 89 43 54          	mov    %ax,0x54(%ebx)
  ip->nlink = 1;
80104b45:	b8 01 00 00 00       	mov    $0x1,%eax
80104b4a:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
80104b4e:	89 1c 24             	mov    %ebx,(%esp)
80104b51:	e8 aa cb ff ff       	call   80101700 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
80104b56:	83 c4 10             	add    $0x10,%esp
80104b59:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104b5e:	74 40                	je     80104ba0 <create+0x130>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
80104b60:	83 ec 04             	sub    $0x4,%esp
80104b63:	ff 73 04             	pushl  0x4(%ebx)
80104b66:	56                   	push   %esi
80104b67:	57                   	push   %edi
80104b68:	e8 b3 d3 ff ff       	call   80101f20 <dirlink>
80104b6d:	83 c4 10             	add    $0x10,%esp
80104b70:	85 c0                	test   %eax,%eax
80104b72:	78 77                	js     80104beb <create+0x17b>
    panic("create: dirlink");

  iunlockput(dp);
80104b74:	83 ec 0c             	sub    $0xc,%esp
80104b77:	57                   	push   %edi
80104b78:	e8 a3 ce ff ff       	call   80101a20 <iunlockput>

  return ip;
80104b7d:	83 c4 10             	add    $0x10,%esp
}
80104b80:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
80104b83:	89 d8                	mov    %ebx,%eax
}
80104b85:	5b                   	pop    %ebx
80104b86:	5e                   	pop    %esi
80104b87:	5f                   	pop    %edi
80104b88:	5d                   	pop    %ebp
80104b89:	c3                   	ret    
80104b8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
80104b90:	31 c0                	xor    %eax,%eax
80104b92:	e9 49 ff ff ff       	jmp    80104ae0 <create+0x70>
80104b97:	89 f6                	mov    %esi,%esi
80104b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
80104ba0:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
    iupdate(dp);
80104ba5:	83 ec 0c             	sub    $0xc,%esp
80104ba8:	57                   	push   %edi
80104ba9:	e8 52 cb ff ff       	call   80101700 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104bae:	83 c4 0c             	add    $0xc,%esp
80104bb1:	ff 73 04             	pushl  0x4(%ebx)
80104bb4:	68 98 79 10 80       	push   $0x80107998
80104bb9:	53                   	push   %ebx
80104bba:	e8 61 d3 ff ff       	call   80101f20 <dirlink>
80104bbf:	83 c4 10             	add    $0x10,%esp
80104bc2:	85 c0                	test   %eax,%eax
80104bc4:	78 18                	js     80104bde <create+0x16e>
80104bc6:	83 ec 04             	sub    $0x4,%esp
80104bc9:	ff 77 04             	pushl  0x4(%edi)
80104bcc:	68 97 79 10 80       	push   $0x80107997
80104bd1:	53                   	push   %ebx
80104bd2:	e8 49 d3 ff ff       	call   80101f20 <dirlink>
80104bd7:	83 c4 10             	add    $0x10,%esp
80104bda:	85 c0                	test   %eax,%eax
80104bdc:	79 82                	jns    80104b60 <create+0xf0>
      panic("create dots");
80104bde:	83 ec 0c             	sub    $0xc,%esp
80104be1:	68 8b 79 10 80       	push   $0x8010798b
80104be6:	e8 85 b7 ff ff       	call   80100370 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
80104beb:	83 ec 0c             	sub    $0xc,%esp
80104bee:	68 9a 79 10 80       	push   $0x8010799a
80104bf3:	e8 78 b7 ff ff       	call   80100370 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
80104bf8:	83 ec 0c             	sub    $0xc,%esp
80104bfb:	68 7c 79 10 80       	push   $0x8010797c
80104c00:	e8 6b b7 ff ff       	call   80100370 <panic>
80104c05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c10 <argfd.constprop.0>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104c10:	55                   	push   %ebp
80104c11:	89 e5                	mov    %esp,%ebp
80104c13:	56                   	push   %esi
80104c14:	53                   	push   %ebx
80104c15:	89 c6                	mov    %eax,%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104c17:	8d 45 f4             	lea    -0xc(%ebp),%eax
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104c1a:	89 d3                	mov    %edx,%ebx
80104c1c:	83 ec 18             	sub    $0x18,%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104c1f:	50                   	push   %eax
80104c20:	6a 00                	push   $0x0
80104c22:	e8 c9 fc ff ff       	call   801048f0 <argint>
80104c27:	83 c4 10             	add    $0x10,%esp
80104c2a:	85 c0                	test   %eax,%eax
80104c2c:	78 3a                	js     80104c68 <argfd.constprop.0+0x58>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
80104c2e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104c31:	83 f8 0f             	cmp    $0xf,%eax
80104c34:	77 32                	ja     80104c68 <argfd.constprop.0+0x58>
80104c36:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104c3d:	8b 54 82 28          	mov    0x28(%edx,%eax,4),%edx
80104c41:	85 d2                	test   %edx,%edx
80104c43:	74 23                	je     80104c68 <argfd.constprop.0+0x58>
    return -1;
  if(pfd)
80104c45:	85 f6                	test   %esi,%esi
80104c47:	74 02                	je     80104c4b <argfd.constprop.0+0x3b>
    *pfd = fd;
80104c49:	89 06                	mov    %eax,(%esi)
  if(pf)
80104c4b:	85 db                	test   %ebx,%ebx
80104c4d:	74 11                	je     80104c60 <argfd.constprop.0+0x50>
    *pf = f;
80104c4f:	89 13                	mov    %edx,(%ebx)
  return 0;
80104c51:	31 c0                	xor    %eax,%eax
}
80104c53:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104c56:	5b                   	pop    %ebx
80104c57:	5e                   	pop    %esi
80104c58:	5d                   	pop    %ebp
80104c59:	c3                   	ret    
80104c5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
80104c60:	31 c0                	xor    %eax,%eax
80104c62:	eb ef                	jmp    80104c53 <argfd.constprop.0+0x43>
80104c64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
80104c68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c6d:	eb e4                	jmp    80104c53 <argfd.constprop.0+0x43>
80104c6f:	90                   	nop

80104c70 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
80104c70:	55                   	push   %ebp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104c71:	31 c0                	xor    %eax,%eax
  return -1;
}

int
sys_dup(void)
{
80104c73:	89 e5                	mov    %esp,%ebp
80104c75:	53                   	push   %ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104c76:	8d 55 f4             	lea    -0xc(%ebp),%edx
  return -1;
}

int
sys_dup(void)
{
80104c79:	83 ec 14             	sub    $0x14,%esp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104c7c:	e8 8f ff ff ff       	call   80104c10 <argfd.constprop.0>
80104c81:	85 c0                	test   %eax,%eax
80104c83:	78 1b                	js     80104ca0 <sys_dup+0x30>
    return -1;
  if((fd=fdalloc(f)) < 0)
80104c85:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104c88:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104c8e:	31 db                	xor    %ebx,%ebx
    if(proc->ofile[fd] == 0){
80104c90:	8b 4c 98 28          	mov    0x28(%eax,%ebx,4),%ecx
80104c94:	85 c9                	test   %ecx,%ecx
80104c96:	74 18                	je     80104cb0 <sys_dup+0x40>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104c98:	83 c3 01             	add    $0x1,%ebx
80104c9b:	83 fb 10             	cmp    $0x10,%ebx
80104c9e:	75 f0                	jne    80104c90 <sys_dup+0x20>
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
80104ca0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104ca5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104ca8:	c9                   	leave  
80104ca9:	c3                   	ret    
80104caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80104cb0:	83 ec 0c             	sub    $0xc,%esp
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80104cb3:	89 54 98 28          	mov    %edx,0x28(%eax,%ebx,4)

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80104cb7:	52                   	push   %edx
80104cb8:	e8 63 c2 ff ff       	call   80100f20 <filedup>
  return fd;
80104cbd:	89 d8                	mov    %ebx,%eax
80104cbf:	83 c4 10             	add    $0x10,%esp
}
80104cc2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104cc5:	c9                   	leave  
80104cc6:	c3                   	ret    
80104cc7:	89 f6                	mov    %esi,%esi
80104cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cd0 <sys_read>:

int
sys_read(void)
{
80104cd0:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104cd1:	31 c0                	xor    %eax,%eax
  return fd;
}

int
sys_read(void)
{
80104cd3:	89 e5                	mov    %esp,%ebp
80104cd5:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104cd8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104cdb:	e8 30 ff ff ff       	call   80104c10 <argfd.constprop.0>
80104ce0:	85 c0                	test   %eax,%eax
80104ce2:	78 4c                	js     80104d30 <sys_read+0x60>
80104ce4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104ce7:	83 ec 08             	sub    $0x8,%esp
80104cea:	50                   	push   %eax
80104ceb:	6a 02                	push   $0x2
80104ced:	e8 fe fb ff ff       	call   801048f0 <argint>
80104cf2:	83 c4 10             	add    $0x10,%esp
80104cf5:	85 c0                	test   %eax,%eax
80104cf7:	78 37                	js     80104d30 <sys_read+0x60>
80104cf9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104cfc:	83 ec 04             	sub    $0x4,%esp
80104cff:	ff 75 f0             	pushl  -0x10(%ebp)
80104d02:	50                   	push   %eax
80104d03:	6a 01                	push   $0x1
80104d05:	e8 26 fc ff ff       	call   80104930 <argptr>
80104d0a:	83 c4 10             	add    $0x10,%esp
80104d0d:	85 c0                	test   %eax,%eax
80104d0f:	78 1f                	js     80104d30 <sys_read+0x60>
    return -1;
  return fileread(f, p, n);
80104d11:	83 ec 04             	sub    $0x4,%esp
80104d14:	ff 75 f0             	pushl  -0x10(%ebp)
80104d17:	ff 75 f4             	pushl  -0xc(%ebp)
80104d1a:	ff 75 ec             	pushl  -0x14(%ebp)
80104d1d:	e8 6e c3 ff ff       	call   80101090 <fileread>
80104d22:	83 c4 10             	add    $0x10,%esp
}
80104d25:	c9                   	leave  
80104d26:	c3                   	ret    
80104d27:	89 f6                	mov    %esi,%esi
80104d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104d30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fileread(f, p, n);
}
80104d35:	c9                   	leave  
80104d36:	c3                   	ret    
80104d37:	89 f6                	mov    %esi,%esi
80104d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d40 <sys_write>:

int
sys_write(void)
{
80104d40:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104d41:	31 c0                	xor    %eax,%eax
  return fileread(f, p, n);
}

int
sys_write(void)
{
80104d43:	89 e5                	mov    %esp,%ebp
80104d45:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104d48:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104d4b:	e8 c0 fe ff ff       	call   80104c10 <argfd.constprop.0>
80104d50:	85 c0                	test   %eax,%eax
80104d52:	78 4c                	js     80104da0 <sys_write+0x60>
80104d54:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d57:	83 ec 08             	sub    $0x8,%esp
80104d5a:	50                   	push   %eax
80104d5b:	6a 02                	push   $0x2
80104d5d:	e8 8e fb ff ff       	call   801048f0 <argint>
80104d62:	83 c4 10             	add    $0x10,%esp
80104d65:	85 c0                	test   %eax,%eax
80104d67:	78 37                	js     80104da0 <sys_write+0x60>
80104d69:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d6c:	83 ec 04             	sub    $0x4,%esp
80104d6f:	ff 75 f0             	pushl  -0x10(%ebp)
80104d72:	50                   	push   %eax
80104d73:	6a 01                	push   $0x1
80104d75:	e8 b6 fb ff ff       	call   80104930 <argptr>
80104d7a:	83 c4 10             	add    $0x10,%esp
80104d7d:	85 c0                	test   %eax,%eax
80104d7f:	78 1f                	js     80104da0 <sys_write+0x60>
    return -1;
  return filewrite(f, p, n);
80104d81:	83 ec 04             	sub    $0x4,%esp
80104d84:	ff 75 f0             	pushl  -0x10(%ebp)
80104d87:	ff 75 f4             	pushl  -0xc(%ebp)
80104d8a:	ff 75 ec             	pushl  -0x14(%ebp)
80104d8d:	e8 8e c3 ff ff       	call   80101120 <filewrite>
80104d92:	83 c4 10             	add    $0x10,%esp
}
80104d95:	c9                   	leave  
80104d96:	c3                   	ret    
80104d97:	89 f6                	mov    %esi,%esi
80104d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104da0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filewrite(f, p, n);
}
80104da5:	c9                   	leave  
80104da6:	c3                   	ret    
80104da7:	89 f6                	mov    %esi,%esi
80104da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104db0 <sys_close>:

int
sys_close(void)
{
80104db0:	55                   	push   %ebp
80104db1:	89 e5                	mov    %esp,%ebp
80104db3:	83 ec 18             	sub    $0x18,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
80104db6:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104db9:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104dbc:	e8 4f fe ff ff       	call   80104c10 <argfd.constprop.0>
80104dc1:	85 c0                	test   %eax,%eax
80104dc3:	78 2b                	js     80104df0 <sys_close+0x40>
    return -1;
  proc->ofile[fd] = 0;
80104dc5:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104dc8:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  fileclose(f);
80104dce:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
  proc->ofile[fd] = 0;
80104dd1:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104dd8:	00 
  fileclose(f);
80104dd9:	ff 75 f4             	pushl  -0xc(%ebp)
80104ddc:	e8 8f c1 ff ff       	call   80100f70 <fileclose>
  return 0;
80104de1:	83 c4 10             	add    $0x10,%esp
80104de4:	31 c0                	xor    %eax,%eax
}
80104de6:	c9                   	leave  
80104de7:	c3                   	ret    
80104de8:	90                   	nop
80104de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
80104df0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  proc->ofile[fd] = 0;
  fileclose(f);
  return 0;
}
80104df5:	c9                   	leave  
80104df6:	c3                   	ret    
80104df7:	89 f6                	mov    %esi,%esi
80104df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e00 <sys_fstat>:

int
sys_fstat(void)
{
80104e00:	55                   	push   %ebp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104e01:	31 c0                	xor    %eax,%eax
  return 0;
}

int
sys_fstat(void)
{
80104e03:	89 e5                	mov    %esp,%ebp
80104e05:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104e08:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104e0b:	e8 00 fe ff ff       	call   80104c10 <argfd.constprop.0>
80104e10:	85 c0                	test   %eax,%eax
80104e12:	78 2c                	js     80104e40 <sys_fstat+0x40>
80104e14:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e17:	83 ec 04             	sub    $0x4,%esp
80104e1a:	6a 14                	push   $0x14
80104e1c:	50                   	push   %eax
80104e1d:	6a 01                	push   $0x1
80104e1f:	e8 0c fb ff ff       	call   80104930 <argptr>
80104e24:	83 c4 10             	add    $0x10,%esp
80104e27:	85 c0                	test   %eax,%eax
80104e29:	78 15                	js     80104e40 <sys_fstat+0x40>
    return -1;
  return filestat(f, st);
80104e2b:	83 ec 08             	sub    $0x8,%esp
80104e2e:	ff 75 f4             	pushl  -0xc(%ebp)
80104e31:	ff 75 f0             	pushl  -0x10(%ebp)
80104e34:	e8 07 c2 ff ff       	call   80101040 <filestat>
80104e39:	83 c4 10             	add    $0x10,%esp
}
80104e3c:	c9                   	leave  
80104e3d:	c3                   	ret    
80104e3e:	66 90                	xchg   %ax,%ax
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
80104e40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filestat(f, st);
}
80104e45:	c9                   	leave  
80104e46:	c3                   	ret    
80104e47:	89 f6                	mov    %esi,%esi
80104e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e50 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104e50:	55                   	push   %ebp
80104e51:	89 e5                	mov    %esp,%ebp
80104e53:	57                   	push   %edi
80104e54:	56                   	push   %esi
80104e55:	53                   	push   %ebx
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104e56:	8d 45 d4             	lea    -0x2c(%ebp),%eax
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104e59:	83 ec 34             	sub    $0x34,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104e5c:	50                   	push   %eax
80104e5d:	6a 00                	push   $0x0
80104e5f:	e8 1c fb ff ff       	call   80104980 <argstr>
80104e64:	83 c4 10             	add    $0x10,%esp
80104e67:	85 c0                	test   %eax,%eax
80104e69:	0f 88 fb 00 00 00    	js     80104f6a <sys_link+0x11a>
80104e6f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104e72:	83 ec 08             	sub    $0x8,%esp
80104e75:	50                   	push   %eax
80104e76:	6a 01                	push   $0x1
80104e78:	e8 03 fb ff ff       	call   80104980 <argstr>
80104e7d:	83 c4 10             	add    $0x10,%esp
80104e80:	85 c0                	test   %eax,%eax
80104e82:	0f 88 e2 00 00 00    	js     80104f6a <sys_link+0x11a>
    return -1;

  begin_op();
80104e88:	e8 83 de ff ff       	call   80102d10 <begin_op>
  if((ip = namei(old)) == 0){
80104e8d:	83 ec 0c             	sub    $0xc,%esp
80104e90:	ff 75 d4             	pushl  -0x2c(%ebp)
80104e93:	e8 48 d1 ff ff       	call   80101fe0 <namei>
80104e98:	83 c4 10             	add    $0x10,%esp
80104e9b:	85 c0                	test   %eax,%eax
80104e9d:	89 c3                	mov    %eax,%ebx
80104e9f:	0f 84 f3 00 00 00    	je     80104f98 <sys_link+0x148>
    end_op();
    return -1;
  }

  ilock(ip);
80104ea5:	83 ec 0c             	sub    $0xc,%esp
80104ea8:	50                   	push   %eax
80104ea9:	e8 02 c9 ff ff       	call   801017b0 <ilock>
  if(ip->type == T_DIR){
80104eae:	83 c4 10             	add    $0x10,%esp
80104eb1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104eb6:	0f 84 c4 00 00 00    	je     80104f80 <sys_link+0x130>
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
80104ebc:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80104ec1:	83 ec 0c             	sub    $0xc,%esp
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
80104ec4:	8d 7d da             	lea    -0x26(%ebp),%edi
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
80104ec7:	53                   	push   %ebx
80104ec8:	e8 33 c8 ff ff       	call   80101700 <iupdate>
  iunlock(ip);
80104ecd:	89 1c 24             	mov    %ebx,(%esp)
80104ed0:	e8 bb c9 ff ff       	call   80101890 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80104ed5:	58                   	pop    %eax
80104ed6:	5a                   	pop    %edx
80104ed7:	57                   	push   %edi
80104ed8:	ff 75 d0             	pushl  -0x30(%ebp)
80104edb:	e8 20 d1 ff ff       	call   80102000 <nameiparent>
80104ee0:	83 c4 10             	add    $0x10,%esp
80104ee3:	85 c0                	test   %eax,%eax
80104ee5:	89 c6                	mov    %eax,%esi
80104ee7:	74 5b                	je     80104f44 <sys_link+0xf4>
    goto bad;
  ilock(dp);
80104ee9:	83 ec 0c             	sub    $0xc,%esp
80104eec:	50                   	push   %eax
80104eed:	e8 be c8 ff ff       	call   801017b0 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104ef2:	83 c4 10             	add    $0x10,%esp
80104ef5:	8b 03                	mov    (%ebx),%eax
80104ef7:	39 06                	cmp    %eax,(%esi)
80104ef9:	75 3d                	jne    80104f38 <sys_link+0xe8>
80104efb:	83 ec 04             	sub    $0x4,%esp
80104efe:	ff 73 04             	pushl  0x4(%ebx)
80104f01:	57                   	push   %edi
80104f02:	56                   	push   %esi
80104f03:	e8 18 d0 ff ff       	call   80101f20 <dirlink>
80104f08:	83 c4 10             	add    $0x10,%esp
80104f0b:	85 c0                	test   %eax,%eax
80104f0d:	78 29                	js     80104f38 <sys_link+0xe8>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
80104f0f:	83 ec 0c             	sub    $0xc,%esp
80104f12:	56                   	push   %esi
80104f13:	e8 08 cb ff ff       	call   80101a20 <iunlockput>
  iput(ip);
80104f18:	89 1c 24             	mov    %ebx,(%esp)
80104f1b:	e8 c0 c9 ff ff       	call   801018e0 <iput>

  end_op();
80104f20:	e8 5b de ff ff       	call   80102d80 <end_op>

  return 0;
80104f25:	83 c4 10             	add    $0x10,%esp
80104f28:	31 c0                	xor    %eax,%eax
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
80104f2a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f2d:	5b                   	pop    %ebx
80104f2e:	5e                   	pop    %esi
80104f2f:	5f                   	pop    %edi
80104f30:	5d                   	pop    %ebp
80104f31:	c3                   	ret    
80104f32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
80104f38:	83 ec 0c             	sub    $0xc,%esp
80104f3b:	56                   	push   %esi
80104f3c:	e8 df ca ff ff       	call   80101a20 <iunlockput>
    goto bad;
80104f41:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  ilock(ip);
80104f44:	83 ec 0c             	sub    $0xc,%esp
80104f47:	53                   	push   %ebx
80104f48:	e8 63 c8 ff ff       	call   801017b0 <ilock>
  ip->nlink--;
80104f4d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104f52:	89 1c 24             	mov    %ebx,(%esp)
80104f55:	e8 a6 c7 ff ff       	call   80101700 <iupdate>
  iunlockput(ip);
80104f5a:	89 1c 24             	mov    %ebx,(%esp)
80104f5d:	e8 be ca ff ff       	call   80101a20 <iunlockput>
  end_op();
80104f62:	e8 19 de ff ff       	call   80102d80 <end_op>
  return -1;
80104f67:	83 c4 10             	add    $0x10,%esp
}
80104f6a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
80104f6d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104f72:	5b                   	pop    %ebx
80104f73:	5e                   	pop    %esi
80104f74:	5f                   	pop    %edi
80104f75:	5d                   	pop    %ebp
80104f76:	c3                   	ret    
80104f77:	89 f6                	mov    %esi,%esi
80104f79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
  }

  ilock(ip);
  if(ip->type == T_DIR){
    iunlockput(ip);
80104f80:	83 ec 0c             	sub    $0xc,%esp
80104f83:	53                   	push   %ebx
80104f84:	e8 97 ca ff ff       	call   80101a20 <iunlockput>
    end_op();
80104f89:	e8 f2 dd ff ff       	call   80102d80 <end_op>
    return -1;
80104f8e:	83 c4 10             	add    $0x10,%esp
80104f91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f96:	eb 92                	jmp    80104f2a <sys_link+0xda>
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
    return -1;

  begin_op();
  if((ip = namei(old)) == 0){
    end_op();
80104f98:	e8 e3 dd ff ff       	call   80102d80 <end_op>
    return -1;
80104f9d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fa2:	eb 86                	jmp    80104f2a <sys_link+0xda>
80104fa4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104faa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104fb0 <sys_unlink>:
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104fb0:	55                   	push   %ebp
80104fb1:	89 e5                	mov    %esp,%ebp
80104fb3:	57                   	push   %edi
80104fb4:	56                   	push   %esi
80104fb5:	53                   	push   %ebx
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104fb6:	8d 45 c0             	lea    -0x40(%ebp),%eax
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104fb9:	83 ec 54             	sub    $0x54,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104fbc:	50                   	push   %eax
80104fbd:	6a 00                	push   $0x0
80104fbf:	e8 bc f9 ff ff       	call   80104980 <argstr>
80104fc4:	83 c4 10             	add    $0x10,%esp
80104fc7:	85 c0                	test   %eax,%eax
80104fc9:	0f 88 82 01 00 00    	js     80105151 <sys_unlink+0x1a1>
    return -1;

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
80104fcf:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  uint off;

  if(argstr(0, &path) < 0)
    return -1;

  begin_op();
80104fd2:	e8 39 dd ff ff       	call   80102d10 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104fd7:	83 ec 08             	sub    $0x8,%esp
80104fda:	53                   	push   %ebx
80104fdb:	ff 75 c0             	pushl  -0x40(%ebp)
80104fde:	e8 1d d0 ff ff       	call   80102000 <nameiparent>
80104fe3:	83 c4 10             	add    $0x10,%esp
80104fe6:	85 c0                	test   %eax,%eax
80104fe8:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104feb:	0f 84 6a 01 00 00    	je     8010515b <sys_unlink+0x1ab>
    end_op();
    return -1;
  }

  ilock(dp);
80104ff1:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104ff4:	83 ec 0c             	sub    $0xc,%esp
80104ff7:	56                   	push   %esi
80104ff8:	e8 b3 c7 ff ff       	call   801017b0 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104ffd:	58                   	pop    %eax
80104ffe:	5a                   	pop    %edx
80104fff:	68 98 79 10 80       	push   $0x80107998
80105004:	53                   	push   %ebx
80105005:	e8 96 cc ff ff       	call   80101ca0 <namecmp>
8010500a:	83 c4 10             	add    $0x10,%esp
8010500d:	85 c0                	test   %eax,%eax
8010500f:	0f 84 fc 00 00 00    	je     80105111 <sys_unlink+0x161>
80105015:	83 ec 08             	sub    $0x8,%esp
80105018:	68 97 79 10 80       	push   $0x80107997
8010501d:	53                   	push   %ebx
8010501e:	e8 7d cc ff ff       	call   80101ca0 <namecmp>
80105023:	83 c4 10             	add    $0x10,%esp
80105026:	85 c0                	test   %eax,%eax
80105028:	0f 84 e3 00 00 00    	je     80105111 <sys_unlink+0x161>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
8010502e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80105031:	83 ec 04             	sub    $0x4,%esp
80105034:	50                   	push   %eax
80105035:	53                   	push   %ebx
80105036:	56                   	push   %esi
80105037:	e8 84 cc ff ff       	call   80101cc0 <dirlookup>
8010503c:	83 c4 10             	add    $0x10,%esp
8010503f:	85 c0                	test   %eax,%eax
80105041:	89 c3                	mov    %eax,%ebx
80105043:	0f 84 c8 00 00 00    	je     80105111 <sys_unlink+0x161>
    goto bad;
  ilock(ip);
80105049:	83 ec 0c             	sub    $0xc,%esp
8010504c:	50                   	push   %eax
8010504d:	e8 5e c7 ff ff       	call   801017b0 <ilock>

  if(ip->nlink < 1)
80105052:	83 c4 10             	add    $0x10,%esp
80105055:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
8010505a:	0f 8e 24 01 00 00    	jle    80105184 <sys_unlink+0x1d4>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
80105060:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105065:	8d 75 d8             	lea    -0x28(%ebp),%esi
80105068:	74 66                	je     801050d0 <sys_unlink+0x120>
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
8010506a:	83 ec 04             	sub    $0x4,%esp
8010506d:	6a 10                	push   $0x10
8010506f:	6a 00                	push   $0x0
80105071:	56                   	push   %esi
80105072:	e8 89 f5 ff ff       	call   80104600 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105077:	6a 10                	push   $0x10
80105079:	ff 75 c4             	pushl  -0x3c(%ebp)
8010507c:	56                   	push   %esi
8010507d:	ff 75 b4             	pushl  -0x4c(%ebp)
80105080:	e8 eb ca ff ff       	call   80101b70 <writei>
80105085:	83 c4 20             	add    $0x20,%esp
80105088:	83 f8 10             	cmp    $0x10,%eax
8010508b:	0f 85 e6 00 00 00    	jne    80105177 <sys_unlink+0x1c7>
    panic("unlink: writei");
  if(ip->type == T_DIR){
80105091:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105096:	0f 84 9c 00 00 00    	je     80105138 <sys_unlink+0x188>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
8010509c:	83 ec 0c             	sub    $0xc,%esp
8010509f:	ff 75 b4             	pushl  -0x4c(%ebp)
801050a2:	e8 79 c9 ff ff       	call   80101a20 <iunlockput>

  ip->nlink--;
801050a7:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
801050ac:	89 1c 24             	mov    %ebx,(%esp)
801050af:	e8 4c c6 ff ff       	call   80101700 <iupdate>
  iunlockput(ip);
801050b4:	89 1c 24             	mov    %ebx,(%esp)
801050b7:	e8 64 c9 ff ff       	call   80101a20 <iunlockput>

  end_op();
801050bc:	e8 bf dc ff ff       	call   80102d80 <end_op>

  return 0;
801050c1:	83 c4 10             	add    $0x10,%esp
801050c4:	31 c0                	xor    %eax,%eax

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
801050c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801050c9:	5b                   	pop    %ebx
801050ca:	5e                   	pop    %esi
801050cb:	5f                   	pop    %edi
801050cc:	5d                   	pop    %ebp
801050cd:	c3                   	ret    
801050ce:	66 90                	xchg   %ax,%ax
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
801050d0:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
801050d4:	76 94                	jbe    8010506a <sys_unlink+0xba>
801050d6:	bf 20 00 00 00       	mov    $0x20,%edi
801050db:	eb 0f                	jmp    801050ec <sys_unlink+0x13c>
801050dd:	8d 76 00             	lea    0x0(%esi),%esi
801050e0:	83 c7 10             	add    $0x10,%edi
801050e3:	3b 7b 58             	cmp    0x58(%ebx),%edi
801050e6:	0f 83 7e ff ff ff    	jae    8010506a <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801050ec:	6a 10                	push   $0x10
801050ee:	57                   	push   %edi
801050ef:	56                   	push   %esi
801050f0:	53                   	push   %ebx
801050f1:	e8 7a c9 ff ff       	call   80101a70 <readi>
801050f6:	83 c4 10             	add    $0x10,%esp
801050f9:	83 f8 10             	cmp    $0x10,%eax
801050fc:	75 6c                	jne    8010516a <sys_unlink+0x1ba>
      panic("isdirempty: readi");
    if(de.inum != 0)
801050fe:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105103:	74 db                	je     801050e0 <sys_unlink+0x130>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
80105105:	83 ec 0c             	sub    $0xc,%esp
80105108:	53                   	push   %ebx
80105109:	e8 12 c9 ff ff       	call   80101a20 <iunlockput>
    goto bad;
8010510e:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  iunlockput(dp);
80105111:	83 ec 0c             	sub    $0xc,%esp
80105114:	ff 75 b4             	pushl  -0x4c(%ebp)
80105117:	e8 04 c9 ff ff       	call   80101a20 <iunlockput>
  end_op();
8010511c:	e8 5f dc ff ff       	call   80102d80 <end_op>
  return -1;
80105121:	83 c4 10             	add    $0x10,%esp
}
80105124:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
80105127:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010512c:	5b                   	pop    %ebx
8010512d:	5e                   	pop    %esi
8010512e:	5f                   	pop    %edi
8010512f:	5d                   	pop    %ebp
80105130:	c3                   	ret    
80105131:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
80105138:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
8010513b:	83 ec 0c             	sub    $0xc,%esp

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
8010513e:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80105143:	50                   	push   %eax
80105144:	e8 b7 c5 ff ff       	call   80101700 <iupdate>
80105149:	83 c4 10             	add    $0x10,%esp
8010514c:	e9 4b ff ff ff       	jmp    8010509c <sys_unlink+0xec>
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
    return -1;
80105151:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105156:	e9 6b ff ff ff       	jmp    801050c6 <sys_unlink+0x116>

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
    end_op();
8010515b:	e8 20 dc ff ff       	call   80102d80 <end_op>
    return -1;
80105160:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105165:	e9 5c ff ff ff       	jmp    801050c6 <sys_unlink+0x116>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
8010516a:	83 ec 0c             	sub    $0xc,%esp
8010516d:	68 bc 79 10 80       	push   $0x801079bc
80105172:	e8 f9 b1 ff ff       	call   80100370 <panic>
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
80105177:	83 ec 0c             	sub    $0xc,%esp
8010517a:	68 ce 79 10 80       	push   $0x801079ce
8010517f:	e8 ec b1 ff ff       	call   80100370 <panic>
  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
80105184:	83 ec 0c             	sub    $0xc,%esp
80105187:	68 aa 79 10 80       	push   $0x801079aa
8010518c:	e8 df b1 ff ff       	call   80100370 <panic>
80105191:	eb 0d                	jmp    801051a0 <sys_open>
80105193:	90                   	nop
80105194:	90                   	nop
80105195:	90                   	nop
80105196:	90                   	nop
80105197:	90                   	nop
80105198:	90                   	nop
80105199:	90                   	nop
8010519a:	90                   	nop
8010519b:	90                   	nop
8010519c:	90                   	nop
8010519d:	90                   	nop
8010519e:	90                   	nop
8010519f:	90                   	nop

801051a0 <sys_open>:
  return ip;
}

int
sys_open(void)
{
801051a0:	55                   	push   %ebp
801051a1:	89 e5                	mov    %esp,%ebp
801051a3:	57                   	push   %edi
801051a4:	56                   	push   %esi
801051a5:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
801051a6:	8d 45 e0             	lea    -0x20(%ebp),%eax
  return ip;
}

int
sys_open(void)
{
801051a9:	83 ec 24             	sub    $0x24,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
801051ac:	50                   	push   %eax
801051ad:	6a 00                	push   $0x0
801051af:	e8 cc f7 ff ff       	call   80104980 <argstr>
801051b4:	83 c4 10             	add    $0x10,%esp
801051b7:	85 c0                	test   %eax,%eax
801051b9:	0f 88 9e 00 00 00    	js     8010525d <sys_open+0xbd>
801051bf:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801051c2:	83 ec 08             	sub    $0x8,%esp
801051c5:	50                   	push   %eax
801051c6:	6a 01                	push   $0x1
801051c8:	e8 23 f7 ff ff       	call   801048f0 <argint>
801051cd:	83 c4 10             	add    $0x10,%esp
801051d0:	85 c0                	test   %eax,%eax
801051d2:	0f 88 85 00 00 00    	js     8010525d <sys_open+0xbd>
    return -1;

  begin_op();
801051d8:	e8 33 db ff ff       	call   80102d10 <begin_op>

  if(omode & O_CREATE){
801051dd:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
801051e1:	0f 85 89 00 00 00    	jne    80105270 <sys_open+0xd0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
801051e7:	83 ec 0c             	sub    $0xc,%esp
801051ea:	ff 75 e0             	pushl  -0x20(%ebp)
801051ed:	e8 ee cd ff ff       	call   80101fe0 <namei>
801051f2:	83 c4 10             	add    $0x10,%esp
801051f5:	85 c0                	test   %eax,%eax
801051f7:	89 c7                	mov    %eax,%edi
801051f9:	0f 84 8e 00 00 00    	je     8010528d <sys_open+0xed>
      end_op();
      return -1;
    }
    ilock(ip);
801051ff:	83 ec 0c             	sub    $0xc,%esp
80105202:	50                   	push   %eax
80105203:	e8 a8 c5 ff ff       	call   801017b0 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
80105208:	83 c4 10             	add    $0x10,%esp
8010520b:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
80105210:	0f 84 d2 00 00 00    	je     801052e8 <sys_open+0x148>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
80105216:	e8 95 bc ff ff       	call   80100eb0 <filealloc>
8010521b:	85 c0                	test   %eax,%eax
8010521d:	89 c6                	mov    %eax,%esi
8010521f:	74 2b                	je     8010524c <sys_open+0xac>
80105221:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80105228:	31 db                	xor    %ebx,%ebx
8010522a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
80105230:	8b 44 9a 28          	mov    0x28(%edx,%ebx,4),%eax
80105234:	85 c0                	test   %eax,%eax
80105236:	74 68                	je     801052a0 <sys_open+0x100>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105238:	83 c3 01             	add    $0x1,%ebx
8010523b:	83 fb 10             	cmp    $0x10,%ebx
8010523e:	75 f0                	jne    80105230 <sys_open+0x90>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
80105240:	83 ec 0c             	sub    $0xc,%esp
80105243:	56                   	push   %esi
80105244:	e8 27 bd ff ff       	call   80100f70 <fileclose>
80105249:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
8010524c:	83 ec 0c             	sub    $0xc,%esp
8010524f:	57                   	push   %edi
80105250:	e8 cb c7 ff ff       	call   80101a20 <iunlockput>
    end_op();
80105255:	e8 26 db ff ff       	call   80102d80 <end_op>
    return -1;
8010525a:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
8010525d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
80105260:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
80105265:	5b                   	pop    %ebx
80105266:	5e                   	pop    %esi
80105267:	5f                   	pop    %edi
80105268:	5d                   	pop    %ebp
80105269:	c3                   	ret    
8010526a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80105270:	83 ec 0c             	sub    $0xc,%esp
80105273:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105276:	31 c9                	xor    %ecx,%ecx
80105278:	6a 00                	push   $0x0
8010527a:	ba 02 00 00 00       	mov    $0x2,%edx
8010527f:	e8 ec f7 ff ff       	call   80104a70 <create>
    if(ip == 0){
80105284:	83 c4 10             	add    $0x10,%esp
80105287:	85 c0                	test   %eax,%eax
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80105289:	89 c7                	mov    %eax,%edi
    if(ip == 0){
8010528b:	75 89                	jne    80105216 <sys_open+0x76>
      end_op();
8010528d:	e8 ee da ff ff       	call   80102d80 <end_op>
      return -1;
80105292:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105297:	eb 43                	jmp    801052dc <sys_open+0x13c>
80105299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801052a0:	83 ec 0c             	sub    $0xc,%esp
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
801052a3:	89 74 9a 28          	mov    %esi,0x28(%edx,%ebx,4)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801052a7:	57                   	push   %edi
801052a8:	e8 e3 c5 ff ff       	call   80101890 <iunlock>
  end_op();
801052ad:	e8 ce da ff ff       	call   80102d80 <end_op>

  f->type = FD_INODE;
801052b2:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
801052b8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801052bb:	83 c4 10             	add    $0x10,%esp
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
801052be:	89 7e 10             	mov    %edi,0x10(%esi)
  f->off = 0;
801052c1:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
  f->readable = !(omode & O_WRONLY);
801052c8:	89 d0                	mov    %edx,%eax
801052ca:	83 e0 01             	and    $0x1,%eax
801052cd:	83 f0 01             	xor    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801052d0:	83 e2 03             	and    $0x3,%edx
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
801052d3:	88 46 08             	mov    %al,0x8(%esi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
801052d6:	0f 95 46 09          	setne  0x9(%esi)
  return fd;
801052da:	89 d8                	mov    %ebx,%eax
}
801052dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801052df:	5b                   	pop    %ebx
801052e0:	5e                   	pop    %esi
801052e1:	5f                   	pop    %edi
801052e2:	5d                   	pop    %ebp
801052e3:	c3                   	ret    
801052e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
801052e8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801052eb:	85 d2                	test   %edx,%edx
801052ed:	0f 84 23 ff ff ff    	je     80105216 <sys_open+0x76>
801052f3:	e9 54 ff ff ff       	jmp    8010524c <sys_open+0xac>
801052f8:	90                   	nop
801052f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105300 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
80105300:	55                   	push   %ebp
80105301:	89 e5                	mov    %esp,%ebp
80105303:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
80105306:	e8 05 da ff ff       	call   80102d10 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
8010530b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010530e:	83 ec 08             	sub    $0x8,%esp
80105311:	50                   	push   %eax
80105312:	6a 00                	push   $0x0
80105314:	e8 67 f6 ff ff       	call   80104980 <argstr>
80105319:	83 c4 10             	add    $0x10,%esp
8010531c:	85 c0                	test   %eax,%eax
8010531e:	78 30                	js     80105350 <sys_mkdir+0x50>
80105320:	83 ec 0c             	sub    $0xc,%esp
80105323:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105326:	31 c9                	xor    %ecx,%ecx
80105328:	6a 00                	push   $0x0
8010532a:	ba 01 00 00 00       	mov    $0x1,%edx
8010532f:	e8 3c f7 ff ff       	call   80104a70 <create>
80105334:	83 c4 10             	add    $0x10,%esp
80105337:	85 c0                	test   %eax,%eax
80105339:	74 15                	je     80105350 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
8010533b:	83 ec 0c             	sub    $0xc,%esp
8010533e:	50                   	push   %eax
8010533f:	e8 dc c6 ff ff       	call   80101a20 <iunlockput>
  end_op();
80105344:	e8 37 da ff ff       	call   80102d80 <end_op>
  return 0;
80105349:	83 c4 10             	add    $0x10,%esp
8010534c:	31 c0                	xor    %eax,%eax
}
8010534e:	c9                   	leave  
8010534f:	c3                   	ret    
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
80105350:	e8 2b da ff ff       	call   80102d80 <end_op>
    return -1;
80105355:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010535a:	c9                   	leave  
8010535b:	c3                   	ret    
8010535c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105360 <sys_mknod>:

int
sys_mknod(void)
{
80105360:	55                   	push   %ebp
80105361:	89 e5                	mov    %esp,%ebp
80105363:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105366:	e8 a5 d9 ff ff       	call   80102d10 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010536b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010536e:	83 ec 08             	sub    $0x8,%esp
80105371:	50                   	push   %eax
80105372:	6a 00                	push   $0x0
80105374:	e8 07 f6 ff ff       	call   80104980 <argstr>
80105379:	83 c4 10             	add    $0x10,%esp
8010537c:	85 c0                	test   %eax,%eax
8010537e:	78 60                	js     801053e0 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105380:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105383:	83 ec 08             	sub    $0x8,%esp
80105386:	50                   	push   %eax
80105387:	6a 01                	push   $0x1
80105389:	e8 62 f5 ff ff       	call   801048f0 <argint>
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
8010538e:	83 c4 10             	add    $0x10,%esp
80105391:	85 c0                	test   %eax,%eax
80105393:	78 4b                	js     801053e0 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105395:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105398:	83 ec 08             	sub    $0x8,%esp
8010539b:	50                   	push   %eax
8010539c:	6a 02                	push   $0x2
8010539e:	e8 4d f5 ff ff       	call   801048f0 <argint>
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
801053a3:	83 c4 10             	add    $0x10,%esp
801053a6:	85 c0                	test   %eax,%eax
801053a8:	78 36                	js     801053e0 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
801053aa:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
801053ae:	83 ec 0c             	sub    $0xc,%esp
801053b1:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
801053b5:	ba 03 00 00 00       	mov    $0x3,%edx
801053ba:	50                   	push   %eax
801053bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
801053be:	e8 ad f6 ff ff       	call   80104a70 <create>
801053c3:	83 c4 10             	add    $0x10,%esp
801053c6:	85 c0                	test   %eax,%eax
801053c8:	74 16                	je     801053e0 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
801053ca:	83 ec 0c             	sub    $0xc,%esp
801053cd:	50                   	push   %eax
801053ce:	e8 4d c6 ff ff       	call   80101a20 <iunlockput>
  end_op();
801053d3:	e8 a8 d9 ff ff       	call   80102d80 <end_op>
  return 0;
801053d8:	83 c4 10             	add    $0x10,%esp
801053db:	31 c0                	xor    %eax,%eax
}
801053dd:	c9                   	leave  
801053de:	c3                   	ret    
801053df:	90                   	nop
  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
801053e0:	e8 9b d9 ff ff       	call   80102d80 <end_op>
    return -1;
801053e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
801053ea:	c9                   	leave  
801053eb:	c3                   	ret    
801053ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801053f0 <sys_chdir>:

int
sys_chdir(void)
{
801053f0:	55                   	push   %ebp
801053f1:	89 e5                	mov    %esp,%ebp
801053f3:	53                   	push   %ebx
801053f4:	83 ec 14             	sub    $0x14,%esp
  char *path;
  struct inode *ip;

  begin_op();
801053f7:	e8 14 d9 ff ff       	call   80102d10 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
801053fc:	8d 45 f4             	lea    -0xc(%ebp),%eax
801053ff:	83 ec 08             	sub    $0x8,%esp
80105402:	50                   	push   %eax
80105403:	6a 00                	push   $0x0
80105405:	e8 76 f5 ff ff       	call   80104980 <argstr>
8010540a:	83 c4 10             	add    $0x10,%esp
8010540d:	85 c0                	test   %eax,%eax
8010540f:	78 7f                	js     80105490 <sys_chdir+0xa0>
80105411:	83 ec 0c             	sub    $0xc,%esp
80105414:	ff 75 f4             	pushl  -0xc(%ebp)
80105417:	e8 c4 cb ff ff       	call   80101fe0 <namei>
8010541c:	83 c4 10             	add    $0x10,%esp
8010541f:	85 c0                	test   %eax,%eax
80105421:	89 c3                	mov    %eax,%ebx
80105423:	74 6b                	je     80105490 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
80105425:	83 ec 0c             	sub    $0xc,%esp
80105428:	50                   	push   %eax
80105429:	e8 82 c3 ff ff       	call   801017b0 <ilock>
  if(ip->type != T_DIR){
8010542e:	83 c4 10             	add    $0x10,%esp
80105431:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105436:	75 38                	jne    80105470 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105438:	83 ec 0c             	sub    $0xc,%esp
8010543b:	53                   	push   %ebx
8010543c:	e8 4f c4 ff ff       	call   80101890 <iunlock>
  iput(proc->cwd);
80105441:	58                   	pop    %eax
80105442:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105448:	ff 70 68             	pushl  0x68(%eax)
8010544b:	e8 90 c4 ff ff       	call   801018e0 <iput>
  end_op();
80105450:	e8 2b d9 ff ff       	call   80102d80 <end_op>
  proc->cwd = ip;
80105455:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return 0;
8010545b:	83 c4 10             	add    $0x10,%esp
    return -1;
  }
  iunlock(ip);
  iput(proc->cwd);
  end_op();
  proc->cwd = ip;
8010545e:	89 58 68             	mov    %ebx,0x68(%eax)
  return 0;
80105461:	31 c0                	xor    %eax,%eax
}
80105463:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105466:	c9                   	leave  
80105467:	c3                   	ret    
80105468:	90                   	nop
80105469:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
80105470:	83 ec 0c             	sub    $0xc,%esp
80105473:	53                   	push   %ebx
80105474:	e8 a7 c5 ff ff       	call   80101a20 <iunlockput>
    end_op();
80105479:	e8 02 d9 ff ff       	call   80102d80 <end_op>
    return -1;
8010547e:	83 c4 10             	add    $0x10,%esp
80105481:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105486:	eb db                	jmp    80105463 <sys_chdir+0x73>
80105488:	90                   	nop
80105489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
80105490:	e8 eb d8 ff ff       	call   80102d80 <end_op>
    return -1;
80105495:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010549a:	eb c7                	jmp    80105463 <sys_chdir+0x73>
8010549c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801054a0 <sys_exec>:
  return 0;
}

int
sys_exec(void)
{
801054a0:	55                   	push   %ebp
801054a1:	89 e5                	mov    %esp,%ebp
801054a3:	57                   	push   %edi
801054a4:	56                   	push   %esi
801054a5:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801054a6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
  return 0;
}

int
sys_exec(void)
{
801054ac:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
801054b2:	50                   	push   %eax
801054b3:	6a 00                	push   $0x0
801054b5:	e8 c6 f4 ff ff       	call   80104980 <argstr>
801054ba:	83 c4 10             	add    $0x10,%esp
801054bd:	85 c0                	test   %eax,%eax
801054bf:	78 7f                	js     80105540 <sys_exec+0xa0>
801054c1:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
801054c7:	83 ec 08             	sub    $0x8,%esp
801054ca:	50                   	push   %eax
801054cb:	6a 01                	push   $0x1
801054cd:	e8 1e f4 ff ff       	call   801048f0 <argint>
801054d2:	83 c4 10             	add    $0x10,%esp
801054d5:	85 c0                	test   %eax,%eax
801054d7:	78 67                	js     80105540 <sys_exec+0xa0>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
801054d9:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801054df:	83 ec 04             	sub    $0x4,%esp
801054e2:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
801054e8:	68 80 00 00 00       	push   $0x80
801054ed:	6a 00                	push   $0x0
801054ef:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
801054f5:	50                   	push   %eax
801054f6:	31 db                	xor    %ebx,%ebx
801054f8:	e8 03 f1 ff ff       	call   80104600 <memset>
801054fd:	83 c4 10             	add    $0x10,%esp
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
80105500:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105506:	83 ec 08             	sub    $0x8,%esp
80105509:	57                   	push   %edi
8010550a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010550d:	50                   	push   %eax
8010550e:	e8 5d f3 ff ff       	call   80104870 <fetchint>
80105513:	83 c4 10             	add    $0x10,%esp
80105516:	85 c0                	test   %eax,%eax
80105518:	78 26                	js     80105540 <sys_exec+0xa0>
      return -1;
    if(uarg == 0){
8010551a:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105520:	85 c0                	test   %eax,%eax
80105522:	74 2c                	je     80105550 <sys_exec+0xb0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
80105524:	83 ec 08             	sub    $0x8,%esp
80105527:	56                   	push   %esi
80105528:	50                   	push   %eax
80105529:	e8 72 f3 ff ff       	call   801048a0 <fetchstr>
8010552e:	83 c4 10             	add    $0x10,%esp
80105531:	85 c0                	test   %eax,%eax
80105533:	78 0b                	js     80105540 <sys_exec+0xa0>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
80105535:	83 c3 01             	add    $0x1,%ebx
80105538:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
8010553b:	83 fb 20             	cmp    $0x20,%ebx
8010553e:	75 c0                	jne    80105500 <sys_exec+0x60>
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
80105540:	8d 65 f4             	lea    -0xc(%ebp),%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
80105543:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
80105548:	5b                   	pop    %ebx
80105549:	5e                   	pop    %esi
8010554a:	5f                   	pop    %edi
8010554b:	5d                   	pop    %ebp
8010554c:	c3                   	ret    
8010554d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80105550:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105556:	83 ec 08             	sub    $0x8,%esp
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
80105559:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105560:	00 00 00 00 
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80105564:	50                   	push   %eax
80105565:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010556b:	e8 a0 b4 ff ff       	call   80100a10 <exec>
80105570:	83 c4 10             	add    $0x10,%esp
}
80105573:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105576:	5b                   	pop    %ebx
80105577:	5e                   	pop    %esi
80105578:	5f                   	pop    %edi
80105579:	5d                   	pop    %ebp
8010557a:	c3                   	ret    
8010557b:	90                   	nop
8010557c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105580 <sys_pipe>:

int
sys_pipe(void)
{
80105580:	55                   	push   %ebp
80105581:	89 e5                	mov    %esp,%ebp
80105583:	57                   	push   %edi
80105584:	56                   	push   %esi
80105585:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105586:	8d 45 dc             	lea    -0x24(%ebp),%eax
  return exec(path, argv);
}

int
sys_pipe(void)
{
80105589:	83 ec 20             	sub    $0x20,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010558c:	6a 08                	push   $0x8
8010558e:	50                   	push   %eax
8010558f:	6a 00                	push   $0x0
80105591:	e8 9a f3 ff ff       	call   80104930 <argptr>
80105596:	83 c4 10             	add    $0x10,%esp
80105599:	85 c0                	test   %eax,%eax
8010559b:	78 48                	js     801055e5 <sys_pipe+0x65>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
8010559d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
801055a0:	83 ec 08             	sub    $0x8,%esp
801055a3:	50                   	push   %eax
801055a4:	8d 45 e0             	lea    -0x20(%ebp),%eax
801055a7:	50                   	push   %eax
801055a8:	e8 03 df ff ff       	call   801034b0 <pipealloc>
801055ad:	83 c4 10             	add    $0x10,%esp
801055b0:	85 c0                	test   %eax,%eax
801055b2:	78 31                	js     801055e5 <sys_pipe+0x65>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801055b4:	8b 5d e0             	mov    -0x20(%ebp),%ebx
801055b7:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801055be:	31 c0                	xor    %eax,%eax
    if(proc->ofile[fd] == 0){
801055c0:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
801055c4:	85 d2                	test   %edx,%edx
801055c6:	74 28                	je     801055f0 <sys_pipe+0x70>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801055c8:	83 c0 01             	add    $0x1,%eax
801055cb:	83 f8 10             	cmp    $0x10,%eax
801055ce:	75 f0                	jne    801055c0 <sys_pipe+0x40>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
    fileclose(rf);
801055d0:	83 ec 0c             	sub    $0xc,%esp
801055d3:	53                   	push   %ebx
801055d4:	e8 97 b9 ff ff       	call   80100f70 <fileclose>
    fileclose(wf);
801055d9:	58                   	pop    %eax
801055da:	ff 75 e4             	pushl  -0x1c(%ebp)
801055dd:	e8 8e b9 ff ff       	call   80100f70 <fileclose>
    return -1;
801055e2:	83 c4 10             	add    $0x10,%esp
801055e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055ea:	eb 45                	jmp    80105631 <sys_pipe+0xb1>
801055ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801055f0:	8d 34 81             	lea    (%ecx,%eax,4),%esi
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801055f3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801055f6:	31 d2                	xor    %edx,%edx
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
801055f8:	89 5e 28             	mov    %ebx,0x28(%esi)
801055fb:	90                   	nop
801055fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
80105600:	83 7c 91 28 00       	cmpl   $0x0,0x28(%ecx,%edx,4)
80105605:	74 19                	je     80105620 <sys_pipe+0xa0>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105607:	83 c2 01             	add    $0x1,%edx
8010560a:	83 fa 10             	cmp    $0x10,%edx
8010560d:	75 f1                	jne    80105600 <sys_pipe+0x80>
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
8010560f:	c7 46 28 00 00 00 00 	movl   $0x0,0x28(%esi)
80105616:	eb b8                	jmp    801055d0 <sys_pipe+0x50>
80105618:	90                   	nop
80105619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80105620:	89 7c 91 28          	mov    %edi,0x28(%ecx,%edx,4)
      proc->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
80105624:	8b 4d dc             	mov    -0x24(%ebp),%ecx
80105627:	89 01                	mov    %eax,(%ecx)
  fd[1] = fd1;
80105629:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010562c:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
8010562f:	31 c0                	xor    %eax,%eax
}
80105631:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105634:	5b                   	pop    %ebx
80105635:	5e                   	pop    %esi
80105636:	5f                   	pop    %edi
80105637:	5d                   	pop    %ebp
80105638:	c3                   	ret    
80105639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105640 <sys_set>:



//__________Set func___________________________________
int sys_set(void)
{
80105640:	55                   	push   %ebp
80105641:	89 e5                	mov    %esp,%ebp
80105643:	57                   	push   %edi
80105644:	56                   	push   %esi
80105645:	53                   	push   %ebx
80105646:	83 ec 38             	sub    $0x38,%esp
  char *pDirs;
  int numOfDirs=0;
   int numOfChars=0;


cprintf("1");
80105649:	68 ba 79 10 80       	push   $0x801079ba
8010564e:	e8 0d b0 ff ff       	call   80100660 <cprintf>
 if(argstr(0, &path) < 0){
80105653:	5e                   	pop    %esi
80105654:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105657:	5f                   	pop    %edi
80105658:	50                   	push   %eax
80105659:	6a 00                	push   $0x0
8010565b:	e8 20 f3 ff ff       	call   80104980 <argstr>
80105660:	83 c4 10             	add    $0x10,%esp
80105663:	85 c0                	test   %eax,%eax
80105665:	0f 88 ed 00 00 00    	js     80105758 <sys_set+0x118>
	cprintf("111");
     return -1;
}

cprintf("2");
8010566b:	83 ec 0c             	sub    $0xc,%esp
8010566e:	68 e3 79 10 80       	push   $0x801079e3
80105673:	e8 e8 af ff ff       	call   80100660 <cprintf>
 if(argstr(1, &dirs) < 0){
80105678:	59                   	pop    %ecx
80105679:	8d 45 e4             	lea    -0x1c(%ebp),%eax
8010567c:	5b                   	pop    %ebx
8010567d:	50                   	push   %eax
8010567e:	6a 01                	push   $0x1
80105680:	e8 fb f2 ff ff       	call   80104980 <argstr>
80105685:	83 c4 10             	add    $0x10,%esp
80105688:	85 c0                	test   %eax,%eax
8010568a:	0f 88 df 00 00 00    	js     8010576f <sys_set+0x12f>
80105690:	bb a0 2d 11 80       	mov    $0x80112da0,%ebx
80105695:	89 d8                	mov    %ebx,%eax
80105697:	89 f6                	mov    %esi,%esi
80105699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
	cprintf("222");
     return -2;
}

for(int i =0;i<10;i++){    //reset the global arg
   gPath[i][0]='\0';		
801056a0:	c6 00 00             	movb   $0x0,(%eax)
801056a3:	05 e8 03 00 00       	add    $0x3e8,%eax
 if(argstr(1, &dirs) < 0){
	cprintf("222");
     return -2;
}

for(int i =0;i<10;i++){    //reset the global arg
801056a8:	3d b0 54 11 80       	cmp    $0x801154b0,%eax
801056ad:	75 f1                	jne    801056a0 <sys_set+0x60>
   gPath[i][0]='\0';		
}

 pDirs=dirs;
801056af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 //cprintf("  pDirs %s ", pDirs); 
 while(*pDirs != '\0'  ){    //'\0' is the end of a string
801056b2:	31 f6                	xor    %esi,%esi
801056b4:	31 ff                	xor    %edi,%edi

for(int i =0;i<10;i++){    //reset the global arg
   gPath[i][0]='\0';		
}

 pDirs=dirs;
801056b6:	89 c1                	mov    %eax,%ecx
 //cprintf("  pDirs %s ", pDirs); 
 while(*pDirs != '\0'  ){    //'\0' is the end of a string
801056b8:	0f b6 00             	movzbl (%eax),%eax
801056bb:	84 c0                	test   %al,%al
801056bd:	74 51                	je     80105710 <sys_set+0xd0>
801056bf:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
801056c2:	89 cb                	mov    %ecx,%ebx
801056c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 //cprintf("while 1 "); 
   while (*pDirs != ':'){
801056c8:	31 c9                	xor    %ecx,%ecx
801056ca:	3c 3a                	cmp    $0x3a,%al
801056cc:	89 da                	mov    %ebx,%edx
801056ce:	74 14                	je     801056e4 <sys_set+0xa4>
   //cprintf("while 2 \n");
   //cprintf("pDirs2 %s\n ", pDirs);  
     gPath[numOfDirs][numOfChars]=*pDirs;
     numOfChars++;
     pDirs++;
801056d0:	83 c2 01             	add    $0x1,%edx
 while(*pDirs != '\0'  ){    //'\0' is the end of a string
 //cprintf("while 1 "); 
   while (*pDirs != ':'){
   //cprintf("while 2 \n");
   //cprintf("pDirs2 %s\n ", pDirs);  
     gPath[numOfDirs][numOfChars]=*pDirs;
801056d3:	88 84 0e a0 2d 11 80 	mov    %al,-0x7feed260(%esi,%ecx,1)
     numOfChars++;
801056da:	83 c1 01             	add    $0x1,%ecx

 pDirs=dirs;
 //cprintf("  pDirs %s ", pDirs); 
 while(*pDirs != '\0'  ){    //'\0' is the end of a string
 //cprintf("while 1 "); 
   while (*pDirs != ':'){
801056dd:	0f b6 02             	movzbl (%edx),%eax
801056e0:	3c 3a                	cmp    $0x3a,%al
801056e2:	75 ec                	jne    801056d0 <sys_set+0x90>
     pDirs++;
    
   }	
   pDirs++;  //skip the ':'
   //cprintf("  gPath %s ", pDirs);
   gPath[numOfDirs][numOfChars]='\0';
801056e4:	69 c7 e8 03 00 00    	imul   $0x3e8,%edi,%eax
801056ea:	81 c6 e8 03 00 00    	add    $0x3e8,%esi
   numOfDirs++;
801056f0:	83 c7 01             	add    $0x1,%edi
     gPath[numOfDirs][numOfChars]=*pDirs;
     numOfChars++;
     pDirs++;
    
   }	
   pDirs++;  //skip the ':'
801056f3:	8d 5a 01             	lea    0x1(%edx),%ebx
   //cprintf("  gPath %s ", pDirs);
   gPath[numOfDirs][numOfChars]='\0';
801056f6:	c6 84 01 a0 2d 11 80 	movb   $0x0,-0x7feed260(%ecx,%eax,1)
801056fd:	00 
   gPath[i][0]='\0';		
}

 pDirs=dirs;
 //cprintf("  pDirs %s ", pDirs); 
 while(*pDirs != '\0'  ){    //'\0' is the end of a string
801056fe:	0f b6 42 01          	movzbl 0x1(%edx),%eax
80105702:	84 c0                	test   %al,%al
80105704:	75 c2                	jne    801056c8 <sys_set+0x88>
80105706:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
80105709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
   numOfChars=0;
 } 


for(int i =0;i<10;i++){
    cprintf("\n");
80105710:	83 ec 0c             	sub    $0xc,%esp
80105713:	68 66 77 10 80       	push   $0x80107766
80105718:	e8 43 af ff ff       	call   80100660 <cprintf>
    cprintf("gPath: %s ",gPath[i]);
8010571d:	58                   	pop    %eax
8010571e:	5a                   	pop    %edx
8010571f:	53                   	push   %ebx
80105720:	68 e5 79 10 80       	push   $0x801079e5
80105725:	81 c3 e8 03 00 00    	add    $0x3e8,%ebx
8010572b:	e8 30 af ff ff       	call   80100660 <cprintf>
   numOfDirs++;
   numOfChars=0;
 } 


for(int i =0;i<10;i++){
80105730:	83 c4 10             	add    $0x10,%esp
80105733:	81 fb b0 54 11 80    	cmp    $0x801154b0,%ebx
80105739:	75 d5                	jne    80105710 <sys_set+0xd0>
    cprintf("gPath: %s ",gPath[i]);
}
 


 cprintf("  Path %s ", path);   //"sysFile_set got:" + 
8010573b:	83 ec 08             	sub    $0x8,%esp
8010573e:	ff 75 e0             	pushl  -0x20(%ebp)
80105741:	68 f0 79 10 80       	push   $0x801079f0
80105746:	e8 15 af ff ff       	call   80100660 <cprintf>
 //cprintf("  Dir: %s ", dirs);
 return 0;
8010574b:	83 c4 10             	add    $0x10,%esp
8010574e:	31 c0                	xor    %eax,%eax
}
80105750:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105753:	5b                   	pop    %ebx
80105754:	5e                   	pop    %esi
80105755:	5f                   	pop    %edi
80105756:	5d                   	pop    %ebp
80105757:	c3                   	ret    
   int numOfChars=0;


cprintf("1");
 if(argstr(0, &path) < 0){
	cprintf("111");
80105758:	83 ec 0c             	sub    $0xc,%esp
8010575b:	68 dd 79 10 80       	push   $0x801079dd
80105760:	e8 fb ae ff ff       	call   80100660 <cprintf>
     return -1;
80105765:	83 c4 10             	add    $0x10,%esp
80105768:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010576d:	eb e1                	jmp    80105750 <sys_set+0x110>
}

cprintf("2");
 if(argstr(1, &dirs) < 0){
	cprintf("222");
8010576f:	83 ec 0c             	sub    $0xc,%esp
80105772:	68 e1 79 10 80       	push   $0x801079e1
80105777:	e8 e4 ae ff ff       	call   80100660 <cprintf>
     return -2;
8010577c:	83 c4 10             	add    $0x10,%esp
8010577f:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
80105784:	eb ca                	jmp    80105750 <sys_set+0x110>
80105786:	66 90                	xchg   %ax,%ax
80105788:	66 90                	xchg   %ax,%ax
8010578a:	66 90                	xchg   %ax,%ax
8010578c:	66 90                	xchg   %ax,%ax
8010578e:	66 90                	xchg   %ax,%ax

80105790 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
80105790:	55                   	push   %ebp
80105791:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105793:	5d                   	pop    %ebp
#include "proc.h"

int
sys_fork(void)
{
  return fork();
80105794:	e9 97 e3 ff ff       	jmp    80103b30 <fork>
80105799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801057a0 <sys_exit>:
}

/* new version of sys_exit */
int
sys_exit(void)
{
801057a0:	55                   	push   %ebp
801057a1:	89 e5                	mov    %esp,%ebp
801057a3:	83 ec 20             	sub    $0x20,%esp
  int status;
  argint(0, &status);
801057a6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801057a9:	50                   	push   %eax
801057aa:	6a 00                	push   $0x0
801057ac:	e8 3f f1 ff ff       	call   801048f0 <argint>
  exit(status);
801057b1:	58                   	pop    %eax
801057b2:	ff 75 f4             	pushl  -0xc(%ebp)
801057b5:	e8 e6 e5 ff ff       	call   80103da0 <exit>
  return 0;  // not reached
}
801057ba:	31 c0                	xor    %eax,%eax
801057bc:	c9                   	leave  
801057bd:	c3                   	ret    
801057be:	66 90                	xchg   %ax,%ax

801057c0 <sys_wait>:

/* new version of sys_wait */
int
sys_wait(void)
{
801057c0:	55                   	push   %ebp
801057c1:	89 e5                	mov    %esp,%ebp
801057c3:	83 ec 1c             	sub    $0x1c,%esp
  int *status;
  argptr(0,(char **)&status, 4);
801057c6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801057c9:	6a 04                	push   $0x4
801057cb:	50                   	push   %eax
801057cc:	6a 00                	push   $0x0
801057ce:	e8 5d f1 ff ff       	call   80104930 <argptr>
  return wait(status);
801057d3:	58                   	pop    %eax
801057d4:	ff 75 f4             	pushl  -0xc(%ebp)
801057d7:	e8 24 e8 ff ff       	call   80104000 <wait>
}
801057dc:	c9                   	leave  
801057dd:	c3                   	ret    
801057de:	66 90                	xchg   %ax,%ax

801057e0 <sys_kill>:

int
sys_kill(void)
{
801057e0:	55                   	push   %ebp
801057e1:	89 e5                	mov    %esp,%ebp
801057e3:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
801057e6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801057e9:	50                   	push   %eax
801057ea:	6a 00                	push   $0x0
801057ec:	e8 ff f0 ff ff       	call   801048f0 <argint>
801057f1:	83 c4 10             	add    $0x10,%esp
801057f4:	85 c0                	test   %eax,%eax
801057f6:	78 18                	js     80105810 <sys_kill+0x30>
    return -1;
  return kill(pid);
801057f8:	83 ec 0c             	sub    $0xc,%esp
801057fb:	ff 75 f4             	pushl  -0xc(%ebp)
801057fe:	e8 4d e9 ff ff       	call   80104150 <kill>
80105803:	83 c4 10             	add    $0x10,%esp
}
80105806:	c9                   	leave  
80105807:	c3                   	ret    
80105808:	90                   	nop
80105809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
80105810:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
80105815:	c9                   	leave  
80105816:	c3                   	ret    
80105817:	89 f6                	mov    %esi,%esi
80105819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105820 <sys_getpid>:

int
sys_getpid(void)
{
  return proc->pid;
80105820:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return kill(pid);
}

int
sys_getpid(void)
{
80105826:	55                   	push   %ebp
80105827:	89 e5                	mov    %esp,%ebp
  return proc->pid;
80105829:	8b 40 10             	mov    0x10(%eax),%eax
}
8010582c:	5d                   	pop    %ebp
8010582d:	c3                   	ret    
8010582e:	66 90                	xchg   %ax,%ax

80105830 <sys_sbrk>:

int
sys_sbrk(void)
{
80105830:	55                   	push   %ebp
80105831:	89 e5                	mov    %esp,%ebp
80105833:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105834:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return proc->pid;
}

int
sys_sbrk(void)
{
80105837:	83 ec 1c             	sub    $0x1c,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
8010583a:	50                   	push   %eax
8010583b:	6a 00                	push   $0x0
8010583d:	e8 ae f0 ff ff       	call   801048f0 <argint>
80105842:	83 c4 10             	add    $0x10,%esp
80105845:	85 c0                	test   %eax,%eax
80105847:	78 27                	js     80105870 <sys_sbrk+0x40>
    return -1;
  addr = proc->sz;
80105849:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  if(growproc(n) < 0)
8010584f:	83 ec 0c             	sub    $0xc,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
80105852:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105854:	ff 75 f4             	pushl  -0xc(%ebp)
80105857:	e8 64 e2 ff ff       	call   80103ac0 <growproc>
8010585c:	83 c4 10             	add    $0x10,%esp
8010585f:	85 c0                	test   %eax,%eax
80105861:	78 0d                	js     80105870 <sys_sbrk+0x40>
    return -1;
  return addr;
80105863:	89 d8                	mov    %ebx,%eax
}
80105865:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105868:	c9                   	leave  
80105869:	c3                   	ret    
8010586a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
80105870:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105875:	eb ee                	jmp    80105865 <sys_sbrk+0x35>
80105877:	89 f6                	mov    %esi,%esi
80105879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105880 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
80105880:	55                   	push   %ebp
80105881:	89 e5                	mov    %esp,%ebp
80105883:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
80105884:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return addr;
}

int
sys_sleep(void)
{
80105887:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
8010588a:	50                   	push   %eax
8010588b:	6a 00                	push   $0x0
8010588d:	e8 5e f0 ff ff       	call   801048f0 <argint>
80105892:	83 c4 10             	add    $0x10,%esp
80105895:	85 c0                	test   %eax,%eax
80105897:	0f 88 8a 00 00 00    	js     80105927 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
8010589d:	83 ec 0c             	sub    $0xc,%esp
801058a0:	68 00 74 11 80       	push   $0x80117400
801058a5:	e8 26 eb ff ff       	call   801043d0 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801058aa:	8b 55 f4             	mov    -0xc(%ebp),%edx
801058ad:	83 c4 10             	add    $0x10,%esp
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
801058b0:	8b 1d 40 7c 11 80    	mov    0x80117c40,%ebx
  while(ticks - ticks0 < n){
801058b6:	85 d2                	test   %edx,%edx
801058b8:	75 27                	jne    801058e1 <sys_sleep+0x61>
801058ba:	eb 54                	jmp    80105910 <sys_sleep+0x90>
801058bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
801058c0:	83 ec 08             	sub    $0x8,%esp
801058c3:	68 00 74 11 80       	push   $0x80117400
801058c8:	68 40 7c 11 80       	push   $0x80117c40
801058cd:	e8 6e e6 ff ff       	call   80103f40 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801058d2:	a1 40 7c 11 80       	mov    0x80117c40,%eax
801058d7:	83 c4 10             	add    $0x10,%esp
801058da:	29 d8                	sub    %ebx,%eax
801058dc:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801058df:	73 2f                	jae    80105910 <sys_sleep+0x90>
    if(proc->killed){
801058e1:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801058e7:	8b 40 24             	mov    0x24(%eax),%eax
801058ea:	85 c0                	test   %eax,%eax
801058ec:	74 d2                	je     801058c0 <sys_sleep+0x40>
      release(&tickslock);
801058ee:	83 ec 0c             	sub    $0xc,%esp
801058f1:	68 00 74 11 80       	push   $0x80117400
801058f6:	e8 b5 ec ff ff       	call   801045b0 <release>
      return -1;
801058fb:	83 c4 10             	add    $0x10,%esp
801058fe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
80105903:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105906:	c9                   	leave  
80105907:	c3                   	ret    
80105908:	90                   	nop
80105909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
80105910:	83 ec 0c             	sub    $0xc,%esp
80105913:	68 00 74 11 80       	push   $0x80117400
80105918:	e8 93 ec ff ff       	call   801045b0 <release>
  return 0;
8010591d:	83 c4 10             	add    $0x10,%esp
80105920:	31 c0                	xor    %eax,%eax
}
80105922:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105925:	c9                   	leave  
80105926:	c3                   	ret    
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
80105927:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010592c:	eb d5                	jmp    80105903 <sys_sleep+0x83>
8010592e:	66 90                	xchg   %ax,%ax

80105930 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105930:	55                   	push   %ebp
80105931:	89 e5                	mov    %esp,%ebp
80105933:	53                   	push   %ebx
80105934:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105937:	68 00 74 11 80       	push   $0x80117400
8010593c:	e8 8f ea ff ff       	call   801043d0 <acquire>
  xticks = ticks;
80105941:	8b 1d 40 7c 11 80    	mov    0x80117c40,%ebx
  release(&tickslock);
80105947:	c7 04 24 00 74 11 80 	movl   $0x80117400,(%esp)
8010594e:	e8 5d ec ff ff       	call   801045b0 <release>
  return xticks;
}
80105953:	89 d8                	mov    %ebx,%eax
80105955:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105958:	c9                   	leave  
80105959:	c3                   	ret    
8010595a:	66 90                	xchg   %ax,%ax
8010595c:	66 90                	xchg   %ax,%ax
8010595e:	66 90                	xchg   %ax,%ax

80105960 <timerinit>:
#define TIMER_RATEGEN   0x04    // mode 2, rate generator
#define TIMER_16BIT     0x30    // r/w counter 16 bits, LSB first

void
timerinit(void)
{
80105960:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105961:	ba 43 00 00 00       	mov    $0x43,%edx
80105966:	b8 34 00 00 00       	mov    $0x34,%eax
8010596b:	89 e5                	mov    %esp,%ebp
8010596d:	83 ec 14             	sub    $0x14,%esp
80105970:	ee                   	out    %al,(%dx)
80105971:	ba 40 00 00 00       	mov    $0x40,%edx
80105976:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
8010597b:	ee                   	out    %al,(%dx)
8010597c:	b8 2e 00 00 00       	mov    $0x2e,%eax
80105981:	ee                   	out    %al,(%dx)
  // Interrupt 100 times/sec.
  outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
  outb(IO_TIMER1, TIMER_DIV(100) % 256);
  outb(IO_TIMER1, TIMER_DIV(100) / 256);
  picenable(IRQ_TIMER);
80105982:	6a 00                	push   $0x0
80105984:	e8 57 da ff ff       	call   801033e0 <picenable>
}
80105989:	83 c4 10             	add    $0x10,%esp
8010598c:	c9                   	leave  
8010598d:	c3                   	ret    

8010598e <alltraps>:
8010598e:	1e                   	push   %ds
8010598f:	06                   	push   %es
80105990:	0f a0                	push   %fs
80105992:	0f a8                	push   %gs
80105994:	60                   	pusha  
80105995:	66 b8 10 00          	mov    $0x10,%ax
80105999:	8e d8                	mov    %eax,%ds
8010599b:	8e c0                	mov    %eax,%es
8010599d:	66 b8 18 00          	mov    $0x18,%ax
801059a1:	8e e0                	mov    %eax,%fs
801059a3:	8e e8                	mov    %eax,%gs
801059a5:	54                   	push   %esp
801059a6:	e8 e5 00 00 00       	call   80105a90 <trap>
801059ab:	83 c4 04             	add    $0x4,%esp

801059ae <trapret>:
801059ae:	61                   	popa   
801059af:	0f a9                	pop    %gs
801059b1:	0f a1                	pop    %fs
801059b3:	07                   	pop    %es
801059b4:	1f                   	pop    %ds
801059b5:	83 c4 08             	add    $0x8,%esp
801059b8:	cf                   	iret   
801059b9:	66 90                	xchg   %ax,%ax
801059bb:	66 90                	xchg   %ax,%ax
801059bd:	66 90                	xchg   %ax,%ax
801059bf:	90                   	nop

801059c0 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
801059c0:	31 c0                	xor    %eax,%eax
801059c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
801059c8:	8b 14 85 0c a0 10 80 	mov    -0x7fef5ff4(,%eax,4),%edx
801059cf:	b9 08 00 00 00       	mov    $0x8,%ecx
801059d4:	c6 04 c5 44 74 11 80 	movb   $0x0,-0x7fee8bbc(,%eax,8)
801059db:	00 
801059dc:	66 89 0c c5 42 74 11 	mov    %cx,-0x7fee8bbe(,%eax,8)
801059e3:	80 
801059e4:	c6 04 c5 45 74 11 80 	movb   $0x8e,-0x7fee8bbb(,%eax,8)
801059eb:	8e 
801059ec:	66 89 14 c5 40 74 11 	mov    %dx,-0x7fee8bc0(,%eax,8)
801059f3:	80 
801059f4:	c1 ea 10             	shr    $0x10,%edx
801059f7:	66 89 14 c5 46 74 11 	mov    %dx,-0x7fee8bba(,%eax,8)
801059fe:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
801059ff:	83 c0 01             	add    $0x1,%eax
80105a02:	3d 00 01 00 00       	cmp    $0x100,%eax
80105a07:	75 bf                	jne    801059c8 <tvinit+0x8>
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105a09:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a0a:	ba 08 00 00 00       	mov    $0x8,%edx
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105a0f:	89 e5                	mov    %esp,%ebp
80105a11:	83 ec 10             	sub    $0x10,%esp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a14:	a1 0c a1 10 80       	mov    0x8010a10c,%eax

  initlock(&tickslock, "time");
80105a19:	68 fb 79 10 80       	push   $0x801079fb
80105a1e:	68 00 74 11 80       	push   $0x80117400
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105a23:	66 89 15 42 76 11 80 	mov    %dx,0x80117642
80105a2a:	c6 05 44 76 11 80 00 	movb   $0x0,0x80117644
80105a31:	66 a3 40 76 11 80    	mov    %ax,0x80117640
80105a37:	c1 e8 10             	shr    $0x10,%eax
80105a3a:	c6 05 45 76 11 80 ef 	movb   $0xef,0x80117645
80105a41:	66 a3 46 76 11 80    	mov    %ax,0x80117646

  initlock(&tickslock, "time");
80105a47:	e8 64 e9 ff ff       	call   801043b0 <initlock>
}
80105a4c:	83 c4 10             	add    $0x10,%esp
80105a4f:	c9                   	leave  
80105a50:	c3                   	ret    
80105a51:	eb 0d                	jmp    80105a60 <idtinit>
80105a53:	90                   	nop
80105a54:	90                   	nop
80105a55:	90                   	nop
80105a56:	90                   	nop
80105a57:	90                   	nop
80105a58:	90                   	nop
80105a59:	90                   	nop
80105a5a:	90                   	nop
80105a5b:	90                   	nop
80105a5c:	90                   	nop
80105a5d:	90                   	nop
80105a5e:	90                   	nop
80105a5f:	90                   	nop

80105a60 <idtinit>:

void
idtinit(void)
{
80105a60:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80105a61:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105a66:	89 e5                	mov    %esp,%ebp
80105a68:	83 ec 10             	sub    $0x10,%esp
80105a6b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105a6f:	b8 40 74 11 80       	mov    $0x80117440,%eax
80105a74:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105a78:	c1 e8 10             	shr    $0x10,%eax
80105a7b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
80105a7f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105a82:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105a85:	c9                   	leave  
80105a86:	c3                   	ret    
80105a87:	89 f6                	mov    %esi,%esi
80105a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105a90 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105a90:	55                   	push   %ebp
80105a91:	89 e5                	mov    %esp,%ebp
80105a93:	57                   	push   %edi
80105a94:	56                   	push   %esi
80105a95:	53                   	push   %ebx
80105a96:	83 ec 0c             	sub    $0xc,%esp
80105a99:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
80105a9c:	8b 43 30             	mov    0x30(%ebx),%eax
80105a9f:	83 f8 40             	cmp    $0x40,%eax
80105aa2:	0f 84 f8 00 00 00    	je     80105ba0 <trap+0x110>
    if(proc->killed)
      exit(0);
    return;
  }

  switch(tf->trapno){
80105aa8:	83 e8 20             	sub    $0x20,%eax
80105aab:	83 f8 1f             	cmp    $0x1f,%eax
80105aae:	77 68                	ja     80105b18 <trap+0x88>
80105ab0:	ff 24 85 a4 7a 10 80 	jmp    *-0x7fef855c(,%eax,4)
80105ab7:	89 f6                	mov    %esi,%esi
80105ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
80105ac0:	e8 6b cd ff ff       	call   80102830 <cpunum>
80105ac5:	85 c0                	test   %eax,%eax
80105ac7:	0f 84 c3 01 00 00    	je     80105c90 <trap+0x200>
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
    lapiceoi();
80105acd:	e8 fe cd ff ff       	call   801028d0 <lapiceoi>
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105ad2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105ad8:	85 c0                	test   %eax,%eax
80105ada:	74 2d                	je     80105b09 <trap+0x79>
80105adc:	8b 50 24             	mov    0x24(%eax),%edx
80105adf:	85 d2                	test   %edx,%edx
80105ae1:	0f 85 86 00 00 00    	jne    80105b6d <trap+0xdd>
    exit(0);

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105ae7:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105aeb:	0f 84 ef 00 00 00    	je     80105be0 <trap+0x150>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105af1:	8b 40 24             	mov    0x24(%eax),%eax
80105af4:	85 c0                	test   %eax,%eax
80105af6:	74 11                	je     80105b09 <trap+0x79>
80105af8:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105afc:	83 e0 03             	and    $0x3,%eax
80105aff:	66 83 f8 03          	cmp    $0x3,%ax
80105b03:	0f 84 c1 00 00 00    	je     80105bca <trap+0x13a>
    exit(0);
}
80105b09:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b0c:	5b                   	pop    %ebx
80105b0d:	5e                   	pop    %esi
80105b0e:	5f                   	pop    %edi
80105b0f:	5d                   	pop    %ebp
80105b10:	c3                   	ret    
80105b11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
80105b18:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80105b1f:	85 c9                	test   %ecx,%ecx
80105b21:	0f 84 9d 01 00 00    	je     80105cc4 <trap+0x234>
80105b27:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105b2b:	0f 84 93 01 00 00    	je     80105cc4 <trap+0x234>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105b31:	0f 20 d7             	mov    %cr2,%edi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105b34:	8b 73 38             	mov    0x38(%ebx),%esi
80105b37:	e8 f4 cc ff ff       	call   80102830 <cpunum>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105b3c:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105b43:	57                   	push   %edi
80105b44:	56                   	push   %esi
80105b45:	50                   	push   %eax
80105b46:	ff 73 34             	pushl  0x34(%ebx)
80105b49:	ff 73 30             	pushl  0x30(%ebx)
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105b4c:	8d 42 6c             	lea    0x6c(%edx),%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105b4f:	50                   	push   %eax
80105b50:	ff 72 10             	pushl  0x10(%edx)
80105b53:	68 60 7a 10 80       	push   $0x80107a60
80105b58:	e8 03 ab ff ff       	call   80100660 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
            rcr2());
    proc->killed = 1;
80105b5d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105b63:	83 c4 20             	add    $0x20,%esp
80105b66:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105b6d:	0f b7 53 3c          	movzwl 0x3c(%ebx),%edx
80105b71:	83 e2 03             	and    $0x3,%edx
80105b74:	66 83 fa 03          	cmp    $0x3,%dx
80105b78:	0f 85 69 ff ff ff    	jne    80105ae7 <trap+0x57>
    exit(0);
80105b7e:	83 ec 0c             	sub    $0xc,%esp
80105b81:	6a 00                	push   $0x0
80105b83:	e8 18 e2 ff ff       	call   80103da0 <exit>
80105b88:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105b8e:	83 c4 10             	add    $0x10,%esp
80105b91:	85 c0                	test   %eax,%eax
80105b93:	0f 85 4e ff ff ff    	jne    80105ae7 <trap+0x57>
80105b99:	e9 6b ff ff ff       	jmp    80105b09 <trap+0x79>
80105b9e:	66 90                	xchg   %ax,%ax
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
80105ba0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105ba6:	8b 70 24             	mov    0x24(%eax),%esi
80105ba9:	85 f6                	test   %esi,%esi
80105bab:	0f 85 bf 00 00 00    	jne    80105c70 <trap+0x1e0>
      exit(0);
    proc->tf = tf;
80105bb1:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
80105bb4:	e8 47 ee ff ff       	call   80104a00 <syscall>
    if(proc->killed)
80105bb9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105bbf:	8b 58 24             	mov    0x24(%eax),%ebx
80105bc2:	85 db                	test   %ebx,%ebx
80105bc4:	0f 84 3f ff ff ff    	je     80105b09 <trap+0x79>
      exit(0);
80105bca:	c7 45 08 00 00 00 00 	movl   $0x0,0x8(%ebp)
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit(0);
}
80105bd1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105bd4:	5b                   	pop    %ebx
80105bd5:	5e                   	pop    %esi
80105bd6:	5f                   	pop    %edi
80105bd7:	5d                   	pop    %ebp
    if(proc->killed)
      exit(0);
    proc->tf = tf;
    syscall();
    if(proc->killed)
      exit(0);
80105bd8:	e9 c3 e1 ff ff       	jmp    80103da0 <exit>
80105bdd:	8d 76 00             	lea    0x0(%esi),%esi
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit(0);

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105be0:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105be4:	0f 85 07 ff ff ff    	jne    80105af1 <trap+0x61>
    yield();
80105bea:	e8 11 e3 ff ff       	call   80103f00 <yield>
80105bef:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105bf5:	85 c0                	test   %eax,%eax
80105bf7:	0f 85 f4 fe ff ff    	jne    80105af1 <trap+0x61>
80105bfd:	e9 07 ff ff ff       	jmp    80105b09 <trap+0x79>
80105c02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
80105c08:	e8 03 cb ff ff       	call   80102710 <kbdintr>
    lapiceoi();
80105c0d:	e8 be cc ff ff       	call   801028d0 <lapiceoi>
    break;
80105c12:	e9 bb fe ff ff       	jmp    80105ad2 <trap+0x42>
80105c17:	89 f6                	mov    %esi,%esi
80105c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  case T_IRQ0 + IRQ_COM1:
    uartintr();
80105c20:	e8 3b 02 00 00       	call   80105e60 <uartintr>
80105c25:	e9 a3 fe ff ff       	jmp    80105acd <trap+0x3d>
80105c2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105c30:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80105c34:	8b 7b 38             	mov    0x38(%ebx),%edi
80105c37:	e8 f4 cb ff ff       	call   80102830 <cpunum>
80105c3c:	57                   	push   %edi
80105c3d:	56                   	push   %esi
80105c3e:	50                   	push   %eax
80105c3f:	68 08 7a 10 80       	push   $0x80107a08
80105c44:	e8 17 aa ff ff       	call   80100660 <cprintf>
            cpunum(), tf->cs, tf->eip);
    lapiceoi();
80105c49:	e8 82 cc ff ff       	call   801028d0 <lapiceoi>
    break;
80105c4e:	83 c4 10             	add    $0x10,%esp
80105c51:	e9 7c fe ff ff       	jmp    80105ad2 <trap+0x42>
80105c56:	8d 76 00             	lea    0x0(%esi),%esi
80105c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
80105c60:	e8 1b c5 ff ff       	call   80102180 <ideintr>
    lapiceoi();
80105c65:	e8 66 cc ff ff       	call   801028d0 <lapiceoi>
    break;
80105c6a:	e9 63 fe ff ff       	jmp    80105ad2 <trap+0x42>
80105c6f:	90                   	nop
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
      exit(0);
80105c70:	83 ec 0c             	sub    $0xc,%esp
80105c73:	6a 00                	push   $0x0
80105c75:	e8 26 e1 ff ff       	call   80103da0 <exit>
80105c7a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105c80:	83 c4 10             	add    $0x10,%esp
80105c83:	e9 29 ff ff ff       	jmp    80105bb1 <trap+0x121>
80105c88:	90                   	nop
80105c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
80105c90:	83 ec 0c             	sub    $0xc,%esp
80105c93:	68 00 74 11 80       	push   $0x80117400
80105c98:	e8 33 e7 ff ff       	call   801043d0 <acquire>
      ticks++;
      wakeup(&ticks);
80105c9d:	c7 04 24 40 7c 11 80 	movl   $0x80117c40,(%esp)

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
      ticks++;
80105ca4:	83 05 40 7c 11 80 01 	addl   $0x1,0x80117c40
      wakeup(&ticks);
80105cab:	e8 40 e4 ff ff       	call   801040f0 <wakeup>
      release(&tickslock);
80105cb0:	c7 04 24 00 74 11 80 	movl   $0x80117400,(%esp)
80105cb7:	e8 f4 e8 ff ff       	call   801045b0 <release>
80105cbc:	83 c4 10             	add    $0x10,%esp
80105cbf:	e9 09 fe ff ff       	jmp    80105acd <trap+0x3d>
80105cc4:	0f 20 d7             	mov    %cr2,%edi

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105cc7:	8b 73 38             	mov    0x38(%ebx),%esi
80105cca:	e8 61 cb ff ff       	call   80102830 <cpunum>
80105ccf:	83 ec 0c             	sub    $0xc,%esp
80105cd2:	57                   	push   %edi
80105cd3:	56                   	push   %esi
80105cd4:	50                   	push   %eax
80105cd5:	ff 73 30             	pushl  0x30(%ebx)
80105cd8:	68 2c 7a 10 80       	push   $0x80107a2c
80105cdd:	e8 7e a9 ff ff       	call   80100660 <cprintf>
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
80105ce2:	83 c4 14             	add    $0x14,%esp
80105ce5:	68 00 7a 10 80       	push   $0x80107a00
80105cea:	e8 81 a6 ff ff       	call   80100370 <panic>
80105cef:	90                   	nop

80105cf0 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105cf0:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
80105cf5:	55                   	push   %ebp
80105cf6:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105cf8:	85 c0                	test   %eax,%eax
80105cfa:	74 1c                	je     80105d18 <uartgetc+0x28>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105cfc:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105d01:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105d02:	a8 01                	test   $0x1,%al
80105d04:	74 12                	je     80105d18 <uartgetc+0x28>
80105d06:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105d0b:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105d0c:	0f b6 c0             	movzbl %al,%eax
}
80105d0f:	5d                   	pop    %ebp
80105d10:	c3                   	ret    
80105d11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

static int
uartgetc(void)
{
  if(!uart)
    return -1;
80105d18:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(!(inb(COM1+5) & 0x01))
    return -1;
  return inb(COM1+0);
}
80105d1d:	5d                   	pop    %ebp
80105d1e:	c3                   	ret    
80105d1f:	90                   	nop

80105d20 <uartputc.part.0>:
  for(p="xv6...\n"; *p; p++)
    uartputc(*p);
}

void
uartputc(int c)
80105d20:	55                   	push   %ebp
80105d21:	89 e5                	mov    %esp,%ebp
80105d23:	57                   	push   %edi
80105d24:	56                   	push   %esi
80105d25:	53                   	push   %ebx
80105d26:	89 c7                	mov    %eax,%edi
80105d28:	bb 80 00 00 00       	mov    $0x80,%ebx
80105d2d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105d32:	83 ec 0c             	sub    $0xc,%esp
80105d35:	eb 1b                	jmp    80105d52 <uartputc.part.0+0x32>
80105d37:	89 f6                	mov    %esi,%esi
80105d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
80105d40:	83 ec 0c             	sub    $0xc,%esp
80105d43:	6a 0a                	push   $0xa
80105d45:	e8 a6 cb ff ff       	call   801028f0 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105d4a:	83 c4 10             	add    $0x10,%esp
80105d4d:	83 eb 01             	sub    $0x1,%ebx
80105d50:	74 07                	je     80105d59 <uartputc.part.0+0x39>
80105d52:	89 f2                	mov    %esi,%edx
80105d54:	ec                   	in     (%dx),%al
80105d55:	a8 20                	test   $0x20,%al
80105d57:	74 e7                	je     80105d40 <uartputc.part.0+0x20>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105d59:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105d5e:	89 f8                	mov    %edi,%eax
80105d60:	ee                   	out    %al,(%dx)
    microdelay(10);
  outb(COM1+0, c);
}
80105d61:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105d64:	5b                   	pop    %ebx
80105d65:	5e                   	pop    %esi
80105d66:	5f                   	pop    %edi
80105d67:	5d                   	pop    %ebp
80105d68:	c3                   	ret    
80105d69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105d70 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
80105d70:	55                   	push   %ebp
80105d71:	31 c9                	xor    %ecx,%ecx
80105d73:	89 c8                	mov    %ecx,%eax
80105d75:	89 e5                	mov    %esp,%ebp
80105d77:	57                   	push   %edi
80105d78:	56                   	push   %esi
80105d79:	53                   	push   %ebx
80105d7a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105d7f:	89 da                	mov    %ebx,%edx
80105d81:	83 ec 0c             	sub    $0xc,%esp
80105d84:	ee                   	out    %al,(%dx)
80105d85:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105d8a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105d8f:	89 fa                	mov    %edi,%edx
80105d91:	ee                   	out    %al,(%dx)
80105d92:	b8 0c 00 00 00       	mov    $0xc,%eax
80105d97:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105d9c:	ee                   	out    %al,(%dx)
80105d9d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105da2:	89 c8                	mov    %ecx,%eax
80105da4:	89 f2                	mov    %esi,%edx
80105da6:	ee                   	out    %al,(%dx)
80105da7:	b8 03 00 00 00       	mov    $0x3,%eax
80105dac:	89 fa                	mov    %edi,%edx
80105dae:	ee                   	out    %al,(%dx)
80105daf:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105db4:	89 c8                	mov    %ecx,%eax
80105db6:	ee                   	out    %al,(%dx)
80105db7:	b8 01 00 00 00       	mov    $0x1,%eax
80105dbc:	89 f2                	mov    %esi,%edx
80105dbe:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105dbf:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105dc4:	ec                   	in     (%dx),%al
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
80105dc5:	3c ff                	cmp    $0xff,%al
80105dc7:	74 5a                	je     80105e23 <uartinit+0xb3>
    return;
  uart = 1;
80105dc9:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105dd0:	00 00 00 
80105dd3:	89 da                	mov    %ebx,%edx
80105dd5:	ec                   	in     (%dx),%al
80105dd6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105ddb:	ec                   	in     (%dx),%al

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  picenable(IRQ_COM1);
80105ddc:	83 ec 0c             	sub    $0xc,%esp
80105ddf:	6a 04                	push   $0x4
80105de1:	e8 fa d5 ff ff       	call   801033e0 <picenable>
  ioapicenable(IRQ_COM1, 0);
80105de6:	59                   	pop    %ecx
80105de7:	5b                   	pop    %ebx
80105de8:	6a 00                	push   $0x0
80105dea:	6a 04                	push   $0x4
80105dec:	bb 24 7b 10 80       	mov    $0x80107b24,%ebx
80105df1:	e8 ea c5 ff ff       	call   801023e0 <ioapicenable>
80105df6:	83 c4 10             	add    $0x10,%esp
80105df9:	b8 78 00 00 00       	mov    $0x78,%eax
80105dfe:	eb 0a                	jmp    80105e0a <uartinit+0x9a>

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105e00:	83 c3 01             	add    $0x1,%ebx
80105e03:	0f be 03             	movsbl (%ebx),%eax
80105e06:	84 c0                	test   %al,%al
80105e08:	74 19                	je     80105e23 <uartinit+0xb3>
void
uartputc(int c)
{
  int i;

  if(!uart)
80105e0a:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105e10:	85 d2                	test   %edx,%edx
80105e12:	74 ec                	je     80105e00 <uartinit+0x90>
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105e14:	83 c3 01             	add    $0x1,%ebx
80105e17:	e8 04 ff ff ff       	call   80105d20 <uartputc.part.0>
80105e1c:	0f be 03             	movsbl (%ebx),%eax
80105e1f:	84 c0                	test   %al,%al
80105e21:	75 e7                	jne    80105e0a <uartinit+0x9a>
    uartputc(*p);
}
80105e23:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105e26:	5b                   	pop    %ebx
80105e27:	5e                   	pop    %esi
80105e28:	5f                   	pop    %edi
80105e29:	5d                   	pop    %ebp
80105e2a:	c3                   	ret    
80105e2b:	90                   	nop
80105e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105e30 <uartputc>:
void
uartputc(int c)
{
  int i;

  if(!uart)
80105e30:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105e36:	55                   	push   %ebp
80105e37:	89 e5                	mov    %esp,%ebp
  int i;

  if(!uart)
80105e39:	85 d2                	test   %edx,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105e3b:	8b 45 08             	mov    0x8(%ebp),%eax
  int i;

  if(!uart)
80105e3e:	74 10                	je     80105e50 <uartputc+0x20>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
  outb(COM1+0, c);
}
80105e40:	5d                   	pop    %ebp
80105e41:	e9 da fe ff ff       	jmp    80105d20 <uartputc.part.0>
80105e46:	8d 76 00             	lea    0x0(%esi),%esi
80105e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105e50:	5d                   	pop    %ebp
80105e51:	c3                   	ret    
80105e52:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105e59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105e60 <uartintr>:
  return inb(COM1+0);
}

void
uartintr(void)
{
80105e60:	55                   	push   %ebp
80105e61:	89 e5                	mov    %esp,%ebp
80105e63:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105e66:	68 f0 5c 10 80       	push   $0x80105cf0
80105e6b:	e8 80 a9 ff ff       	call   801007f0 <consoleintr>
}
80105e70:	83 c4 10             	add    $0x10,%esp
80105e73:	c9                   	leave  
80105e74:	c3                   	ret    

80105e75 <vector0>:
80105e75:	6a 00                	push   $0x0
80105e77:	6a 00                	push   $0x0
80105e79:	e9 10 fb ff ff       	jmp    8010598e <alltraps>

80105e7e <vector1>:
80105e7e:	6a 00                	push   $0x0
80105e80:	6a 01                	push   $0x1
80105e82:	e9 07 fb ff ff       	jmp    8010598e <alltraps>

80105e87 <vector2>:
80105e87:	6a 00                	push   $0x0
80105e89:	6a 02                	push   $0x2
80105e8b:	e9 fe fa ff ff       	jmp    8010598e <alltraps>

80105e90 <vector3>:
80105e90:	6a 00                	push   $0x0
80105e92:	6a 03                	push   $0x3
80105e94:	e9 f5 fa ff ff       	jmp    8010598e <alltraps>

80105e99 <vector4>:
80105e99:	6a 00                	push   $0x0
80105e9b:	6a 04                	push   $0x4
80105e9d:	e9 ec fa ff ff       	jmp    8010598e <alltraps>

80105ea2 <vector5>:
80105ea2:	6a 00                	push   $0x0
80105ea4:	6a 05                	push   $0x5
80105ea6:	e9 e3 fa ff ff       	jmp    8010598e <alltraps>

80105eab <vector6>:
80105eab:	6a 00                	push   $0x0
80105ead:	6a 06                	push   $0x6
80105eaf:	e9 da fa ff ff       	jmp    8010598e <alltraps>

80105eb4 <vector7>:
80105eb4:	6a 00                	push   $0x0
80105eb6:	6a 07                	push   $0x7
80105eb8:	e9 d1 fa ff ff       	jmp    8010598e <alltraps>

80105ebd <vector8>:
80105ebd:	6a 08                	push   $0x8
80105ebf:	e9 ca fa ff ff       	jmp    8010598e <alltraps>

80105ec4 <vector9>:
80105ec4:	6a 00                	push   $0x0
80105ec6:	6a 09                	push   $0x9
80105ec8:	e9 c1 fa ff ff       	jmp    8010598e <alltraps>

80105ecd <vector10>:
80105ecd:	6a 0a                	push   $0xa
80105ecf:	e9 ba fa ff ff       	jmp    8010598e <alltraps>

80105ed4 <vector11>:
80105ed4:	6a 0b                	push   $0xb
80105ed6:	e9 b3 fa ff ff       	jmp    8010598e <alltraps>

80105edb <vector12>:
80105edb:	6a 0c                	push   $0xc
80105edd:	e9 ac fa ff ff       	jmp    8010598e <alltraps>

80105ee2 <vector13>:
80105ee2:	6a 0d                	push   $0xd
80105ee4:	e9 a5 fa ff ff       	jmp    8010598e <alltraps>

80105ee9 <vector14>:
80105ee9:	6a 0e                	push   $0xe
80105eeb:	e9 9e fa ff ff       	jmp    8010598e <alltraps>

80105ef0 <vector15>:
80105ef0:	6a 00                	push   $0x0
80105ef2:	6a 0f                	push   $0xf
80105ef4:	e9 95 fa ff ff       	jmp    8010598e <alltraps>

80105ef9 <vector16>:
80105ef9:	6a 00                	push   $0x0
80105efb:	6a 10                	push   $0x10
80105efd:	e9 8c fa ff ff       	jmp    8010598e <alltraps>

80105f02 <vector17>:
80105f02:	6a 11                	push   $0x11
80105f04:	e9 85 fa ff ff       	jmp    8010598e <alltraps>

80105f09 <vector18>:
80105f09:	6a 00                	push   $0x0
80105f0b:	6a 12                	push   $0x12
80105f0d:	e9 7c fa ff ff       	jmp    8010598e <alltraps>

80105f12 <vector19>:
80105f12:	6a 00                	push   $0x0
80105f14:	6a 13                	push   $0x13
80105f16:	e9 73 fa ff ff       	jmp    8010598e <alltraps>

80105f1b <vector20>:
80105f1b:	6a 00                	push   $0x0
80105f1d:	6a 14                	push   $0x14
80105f1f:	e9 6a fa ff ff       	jmp    8010598e <alltraps>

80105f24 <vector21>:
80105f24:	6a 00                	push   $0x0
80105f26:	6a 15                	push   $0x15
80105f28:	e9 61 fa ff ff       	jmp    8010598e <alltraps>

80105f2d <vector22>:
80105f2d:	6a 00                	push   $0x0
80105f2f:	6a 16                	push   $0x16
80105f31:	e9 58 fa ff ff       	jmp    8010598e <alltraps>

80105f36 <vector23>:
80105f36:	6a 00                	push   $0x0
80105f38:	6a 17                	push   $0x17
80105f3a:	e9 4f fa ff ff       	jmp    8010598e <alltraps>

80105f3f <vector24>:
80105f3f:	6a 00                	push   $0x0
80105f41:	6a 18                	push   $0x18
80105f43:	e9 46 fa ff ff       	jmp    8010598e <alltraps>

80105f48 <vector25>:
80105f48:	6a 00                	push   $0x0
80105f4a:	6a 19                	push   $0x19
80105f4c:	e9 3d fa ff ff       	jmp    8010598e <alltraps>

80105f51 <vector26>:
80105f51:	6a 00                	push   $0x0
80105f53:	6a 1a                	push   $0x1a
80105f55:	e9 34 fa ff ff       	jmp    8010598e <alltraps>

80105f5a <vector27>:
80105f5a:	6a 00                	push   $0x0
80105f5c:	6a 1b                	push   $0x1b
80105f5e:	e9 2b fa ff ff       	jmp    8010598e <alltraps>

80105f63 <vector28>:
80105f63:	6a 00                	push   $0x0
80105f65:	6a 1c                	push   $0x1c
80105f67:	e9 22 fa ff ff       	jmp    8010598e <alltraps>

80105f6c <vector29>:
80105f6c:	6a 00                	push   $0x0
80105f6e:	6a 1d                	push   $0x1d
80105f70:	e9 19 fa ff ff       	jmp    8010598e <alltraps>

80105f75 <vector30>:
80105f75:	6a 00                	push   $0x0
80105f77:	6a 1e                	push   $0x1e
80105f79:	e9 10 fa ff ff       	jmp    8010598e <alltraps>

80105f7e <vector31>:
80105f7e:	6a 00                	push   $0x0
80105f80:	6a 1f                	push   $0x1f
80105f82:	e9 07 fa ff ff       	jmp    8010598e <alltraps>

80105f87 <vector32>:
80105f87:	6a 00                	push   $0x0
80105f89:	6a 20                	push   $0x20
80105f8b:	e9 fe f9 ff ff       	jmp    8010598e <alltraps>

80105f90 <vector33>:
80105f90:	6a 00                	push   $0x0
80105f92:	6a 21                	push   $0x21
80105f94:	e9 f5 f9 ff ff       	jmp    8010598e <alltraps>

80105f99 <vector34>:
80105f99:	6a 00                	push   $0x0
80105f9b:	6a 22                	push   $0x22
80105f9d:	e9 ec f9 ff ff       	jmp    8010598e <alltraps>

80105fa2 <vector35>:
80105fa2:	6a 00                	push   $0x0
80105fa4:	6a 23                	push   $0x23
80105fa6:	e9 e3 f9 ff ff       	jmp    8010598e <alltraps>

80105fab <vector36>:
80105fab:	6a 00                	push   $0x0
80105fad:	6a 24                	push   $0x24
80105faf:	e9 da f9 ff ff       	jmp    8010598e <alltraps>

80105fb4 <vector37>:
80105fb4:	6a 00                	push   $0x0
80105fb6:	6a 25                	push   $0x25
80105fb8:	e9 d1 f9 ff ff       	jmp    8010598e <alltraps>

80105fbd <vector38>:
80105fbd:	6a 00                	push   $0x0
80105fbf:	6a 26                	push   $0x26
80105fc1:	e9 c8 f9 ff ff       	jmp    8010598e <alltraps>

80105fc6 <vector39>:
80105fc6:	6a 00                	push   $0x0
80105fc8:	6a 27                	push   $0x27
80105fca:	e9 bf f9 ff ff       	jmp    8010598e <alltraps>

80105fcf <vector40>:
80105fcf:	6a 00                	push   $0x0
80105fd1:	6a 28                	push   $0x28
80105fd3:	e9 b6 f9 ff ff       	jmp    8010598e <alltraps>

80105fd8 <vector41>:
80105fd8:	6a 00                	push   $0x0
80105fda:	6a 29                	push   $0x29
80105fdc:	e9 ad f9 ff ff       	jmp    8010598e <alltraps>

80105fe1 <vector42>:
80105fe1:	6a 00                	push   $0x0
80105fe3:	6a 2a                	push   $0x2a
80105fe5:	e9 a4 f9 ff ff       	jmp    8010598e <alltraps>

80105fea <vector43>:
80105fea:	6a 00                	push   $0x0
80105fec:	6a 2b                	push   $0x2b
80105fee:	e9 9b f9 ff ff       	jmp    8010598e <alltraps>

80105ff3 <vector44>:
80105ff3:	6a 00                	push   $0x0
80105ff5:	6a 2c                	push   $0x2c
80105ff7:	e9 92 f9 ff ff       	jmp    8010598e <alltraps>

80105ffc <vector45>:
80105ffc:	6a 00                	push   $0x0
80105ffe:	6a 2d                	push   $0x2d
80106000:	e9 89 f9 ff ff       	jmp    8010598e <alltraps>

80106005 <vector46>:
80106005:	6a 00                	push   $0x0
80106007:	6a 2e                	push   $0x2e
80106009:	e9 80 f9 ff ff       	jmp    8010598e <alltraps>

8010600e <vector47>:
8010600e:	6a 00                	push   $0x0
80106010:	6a 2f                	push   $0x2f
80106012:	e9 77 f9 ff ff       	jmp    8010598e <alltraps>

80106017 <vector48>:
80106017:	6a 00                	push   $0x0
80106019:	6a 30                	push   $0x30
8010601b:	e9 6e f9 ff ff       	jmp    8010598e <alltraps>

80106020 <vector49>:
80106020:	6a 00                	push   $0x0
80106022:	6a 31                	push   $0x31
80106024:	e9 65 f9 ff ff       	jmp    8010598e <alltraps>

80106029 <vector50>:
80106029:	6a 00                	push   $0x0
8010602b:	6a 32                	push   $0x32
8010602d:	e9 5c f9 ff ff       	jmp    8010598e <alltraps>

80106032 <vector51>:
80106032:	6a 00                	push   $0x0
80106034:	6a 33                	push   $0x33
80106036:	e9 53 f9 ff ff       	jmp    8010598e <alltraps>

8010603b <vector52>:
8010603b:	6a 00                	push   $0x0
8010603d:	6a 34                	push   $0x34
8010603f:	e9 4a f9 ff ff       	jmp    8010598e <alltraps>

80106044 <vector53>:
80106044:	6a 00                	push   $0x0
80106046:	6a 35                	push   $0x35
80106048:	e9 41 f9 ff ff       	jmp    8010598e <alltraps>

8010604d <vector54>:
8010604d:	6a 00                	push   $0x0
8010604f:	6a 36                	push   $0x36
80106051:	e9 38 f9 ff ff       	jmp    8010598e <alltraps>

80106056 <vector55>:
80106056:	6a 00                	push   $0x0
80106058:	6a 37                	push   $0x37
8010605a:	e9 2f f9 ff ff       	jmp    8010598e <alltraps>

8010605f <vector56>:
8010605f:	6a 00                	push   $0x0
80106061:	6a 38                	push   $0x38
80106063:	e9 26 f9 ff ff       	jmp    8010598e <alltraps>

80106068 <vector57>:
80106068:	6a 00                	push   $0x0
8010606a:	6a 39                	push   $0x39
8010606c:	e9 1d f9 ff ff       	jmp    8010598e <alltraps>

80106071 <vector58>:
80106071:	6a 00                	push   $0x0
80106073:	6a 3a                	push   $0x3a
80106075:	e9 14 f9 ff ff       	jmp    8010598e <alltraps>

8010607a <vector59>:
8010607a:	6a 00                	push   $0x0
8010607c:	6a 3b                	push   $0x3b
8010607e:	e9 0b f9 ff ff       	jmp    8010598e <alltraps>

80106083 <vector60>:
80106083:	6a 00                	push   $0x0
80106085:	6a 3c                	push   $0x3c
80106087:	e9 02 f9 ff ff       	jmp    8010598e <alltraps>

8010608c <vector61>:
8010608c:	6a 00                	push   $0x0
8010608e:	6a 3d                	push   $0x3d
80106090:	e9 f9 f8 ff ff       	jmp    8010598e <alltraps>

80106095 <vector62>:
80106095:	6a 00                	push   $0x0
80106097:	6a 3e                	push   $0x3e
80106099:	e9 f0 f8 ff ff       	jmp    8010598e <alltraps>

8010609e <vector63>:
8010609e:	6a 00                	push   $0x0
801060a0:	6a 3f                	push   $0x3f
801060a2:	e9 e7 f8 ff ff       	jmp    8010598e <alltraps>

801060a7 <vector64>:
801060a7:	6a 00                	push   $0x0
801060a9:	6a 40                	push   $0x40
801060ab:	e9 de f8 ff ff       	jmp    8010598e <alltraps>

801060b0 <vector65>:
801060b0:	6a 00                	push   $0x0
801060b2:	6a 41                	push   $0x41
801060b4:	e9 d5 f8 ff ff       	jmp    8010598e <alltraps>

801060b9 <vector66>:
801060b9:	6a 00                	push   $0x0
801060bb:	6a 42                	push   $0x42
801060bd:	e9 cc f8 ff ff       	jmp    8010598e <alltraps>

801060c2 <vector67>:
801060c2:	6a 00                	push   $0x0
801060c4:	6a 43                	push   $0x43
801060c6:	e9 c3 f8 ff ff       	jmp    8010598e <alltraps>

801060cb <vector68>:
801060cb:	6a 00                	push   $0x0
801060cd:	6a 44                	push   $0x44
801060cf:	e9 ba f8 ff ff       	jmp    8010598e <alltraps>

801060d4 <vector69>:
801060d4:	6a 00                	push   $0x0
801060d6:	6a 45                	push   $0x45
801060d8:	e9 b1 f8 ff ff       	jmp    8010598e <alltraps>

801060dd <vector70>:
801060dd:	6a 00                	push   $0x0
801060df:	6a 46                	push   $0x46
801060e1:	e9 a8 f8 ff ff       	jmp    8010598e <alltraps>

801060e6 <vector71>:
801060e6:	6a 00                	push   $0x0
801060e8:	6a 47                	push   $0x47
801060ea:	e9 9f f8 ff ff       	jmp    8010598e <alltraps>

801060ef <vector72>:
801060ef:	6a 00                	push   $0x0
801060f1:	6a 48                	push   $0x48
801060f3:	e9 96 f8 ff ff       	jmp    8010598e <alltraps>

801060f8 <vector73>:
801060f8:	6a 00                	push   $0x0
801060fa:	6a 49                	push   $0x49
801060fc:	e9 8d f8 ff ff       	jmp    8010598e <alltraps>

80106101 <vector74>:
80106101:	6a 00                	push   $0x0
80106103:	6a 4a                	push   $0x4a
80106105:	e9 84 f8 ff ff       	jmp    8010598e <alltraps>

8010610a <vector75>:
8010610a:	6a 00                	push   $0x0
8010610c:	6a 4b                	push   $0x4b
8010610e:	e9 7b f8 ff ff       	jmp    8010598e <alltraps>

80106113 <vector76>:
80106113:	6a 00                	push   $0x0
80106115:	6a 4c                	push   $0x4c
80106117:	e9 72 f8 ff ff       	jmp    8010598e <alltraps>

8010611c <vector77>:
8010611c:	6a 00                	push   $0x0
8010611e:	6a 4d                	push   $0x4d
80106120:	e9 69 f8 ff ff       	jmp    8010598e <alltraps>

80106125 <vector78>:
80106125:	6a 00                	push   $0x0
80106127:	6a 4e                	push   $0x4e
80106129:	e9 60 f8 ff ff       	jmp    8010598e <alltraps>

8010612e <vector79>:
8010612e:	6a 00                	push   $0x0
80106130:	6a 4f                	push   $0x4f
80106132:	e9 57 f8 ff ff       	jmp    8010598e <alltraps>

80106137 <vector80>:
80106137:	6a 00                	push   $0x0
80106139:	6a 50                	push   $0x50
8010613b:	e9 4e f8 ff ff       	jmp    8010598e <alltraps>

80106140 <vector81>:
80106140:	6a 00                	push   $0x0
80106142:	6a 51                	push   $0x51
80106144:	e9 45 f8 ff ff       	jmp    8010598e <alltraps>

80106149 <vector82>:
80106149:	6a 00                	push   $0x0
8010614b:	6a 52                	push   $0x52
8010614d:	e9 3c f8 ff ff       	jmp    8010598e <alltraps>

80106152 <vector83>:
80106152:	6a 00                	push   $0x0
80106154:	6a 53                	push   $0x53
80106156:	e9 33 f8 ff ff       	jmp    8010598e <alltraps>

8010615b <vector84>:
8010615b:	6a 00                	push   $0x0
8010615d:	6a 54                	push   $0x54
8010615f:	e9 2a f8 ff ff       	jmp    8010598e <alltraps>

80106164 <vector85>:
80106164:	6a 00                	push   $0x0
80106166:	6a 55                	push   $0x55
80106168:	e9 21 f8 ff ff       	jmp    8010598e <alltraps>

8010616d <vector86>:
8010616d:	6a 00                	push   $0x0
8010616f:	6a 56                	push   $0x56
80106171:	e9 18 f8 ff ff       	jmp    8010598e <alltraps>

80106176 <vector87>:
80106176:	6a 00                	push   $0x0
80106178:	6a 57                	push   $0x57
8010617a:	e9 0f f8 ff ff       	jmp    8010598e <alltraps>

8010617f <vector88>:
8010617f:	6a 00                	push   $0x0
80106181:	6a 58                	push   $0x58
80106183:	e9 06 f8 ff ff       	jmp    8010598e <alltraps>

80106188 <vector89>:
80106188:	6a 00                	push   $0x0
8010618a:	6a 59                	push   $0x59
8010618c:	e9 fd f7 ff ff       	jmp    8010598e <alltraps>

80106191 <vector90>:
80106191:	6a 00                	push   $0x0
80106193:	6a 5a                	push   $0x5a
80106195:	e9 f4 f7 ff ff       	jmp    8010598e <alltraps>

8010619a <vector91>:
8010619a:	6a 00                	push   $0x0
8010619c:	6a 5b                	push   $0x5b
8010619e:	e9 eb f7 ff ff       	jmp    8010598e <alltraps>

801061a3 <vector92>:
801061a3:	6a 00                	push   $0x0
801061a5:	6a 5c                	push   $0x5c
801061a7:	e9 e2 f7 ff ff       	jmp    8010598e <alltraps>

801061ac <vector93>:
801061ac:	6a 00                	push   $0x0
801061ae:	6a 5d                	push   $0x5d
801061b0:	e9 d9 f7 ff ff       	jmp    8010598e <alltraps>

801061b5 <vector94>:
801061b5:	6a 00                	push   $0x0
801061b7:	6a 5e                	push   $0x5e
801061b9:	e9 d0 f7 ff ff       	jmp    8010598e <alltraps>

801061be <vector95>:
801061be:	6a 00                	push   $0x0
801061c0:	6a 5f                	push   $0x5f
801061c2:	e9 c7 f7 ff ff       	jmp    8010598e <alltraps>

801061c7 <vector96>:
801061c7:	6a 00                	push   $0x0
801061c9:	6a 60                	push   $0x60
801061cb:	e9 be f7 ff ff       	jmp    8010598e <alltraps>

801061d0 <vector97>:
801061d0:	6a 00                	push   $0x0
801061d2:	6a 61                	push   $0x61
801061d4:	e9 b5 f7 ff ff       	jmp    8010598e <alltraps>

801061d9 <vector98>:
801061d9:	6a 00                	push   $0x0
801061db:	6a 62                	push   $0x62
801061dd:	e9 ac f7 ff ff       	jmp    8010598e <alltraps>

801061e2 <vector99>:
801061e2:	6a 00                	push   $0x0
801061e4:	6a 63                	push   $0x63
801061e6:	e9 a3 f7 ff ff       	jmp    8010598e <alltraps>

801061eb <vector100>:
801061eb:	6a 00                	push   $0x0
801061ed:	6a 64                	push   $0x64
801061ef:	e9 9a f7 ff ff       	jmp    8010598e <alltraps>

801061f4 <vector101>:
801061f4:	6a 00                	push   $0x0
801061f6:	6a 65                	push   $0x65
801061f8:	e9 91 f7 ff ff       	jmp    8010598e <alltraps>

801061fd <vector102>:
801061fd:	6a 00                	push   $0x0
801061ff:	6a 66                	push   $0x66
80106201:	e9 88 f7 ff ff       	jmp    8010598e <alltraps>

80106206 <vector103>:
80106206:	6a 00                	push   $0x0
80106208:	6a 67                	push   $0x67
8010620a:	e9 7f f7 ff ff       	jmp    8010598e <alltraps>

8010620f <vector104>:
8010620f:	6a 00                	push   $0x0
80106211:	6a 68                	push   $0x68
80106213:	e9 76 f7 ff ff       	jmp    8010598e <alltraps>

80106218 <vector105>:
80106218:	6a 00                	push   $0x0
8010621a:	6a 69                	push   $0x69
8010621c:	e9 6d f7 ff ff       	jmp    8010598e <alltraps>

80106221 <vector106>:
80106221:	6a 00                	push   $0x0
80106223:	6a 6a                	push   $0x6a
80106225:	e9 64 f7 ff ff       	jmp    8010598e <alltraps>

8010622a <vector107>:
8010622a:	6a 00                	push   $0x0
8010622c:	6a 6b                	push   $0x6b
8010622e:	e9 5b f7 ff ff       	jmp    8010598e <alltraps>

80106233 <vector108>:
80106233:	6a 00                	push   $0x0
80106235:	6a 6c                	push   $0x6c
80106237:	e9 52 f7 ff ff       	jmp    8010598e <alltraps>

8010623c <vector109>:
8010623c:	6a 00                	push   $0x0
8010623e:	6a 6d                	push   $0x6d
80106240:	e9 49 f7 ff ff       	jmp    8010598e <alltraps>

80106245 <vector110>:
80106245:	6a 00                	push   $0x0
80106247:	6a 6e                	push   $0x6e
80106249:	e9 40 f7 ff ff       	jmp    8010598e <alltraps>

8010624e <vector111>:
8010624e:	6a 00                	push   $0x0
80106250:	6a 6f                	push   $0x6f
80106252:	e9 37 f7 ff ff       	jmp    8010598e <alltraps>

80106257 <vector112>:
80106257:	6a 00                	push   $0x0
80106259:	6a 70                	push   $0x70
8010625b:	e9 2e f7 ff ff       	jmp    8010598e <alltraps>

80106260 <vector113>:
80106260:	6a 00                	push   $0x0
80106262:	6a 71                	push   $0x71
80106264:	e9 25 f7 ff ff       	jmp    8010598e <alltraps>

80106269 <vector114>:
80106269:	6a 00                	push   $0x0
8010626b:	6a 72                	push   $0x72
8010626d:	e9 1c f7 ff ff       	jmp    8010598e <alltraps>

80106272 <vector115>:
80106272:	6a 00                	push   $0x0
80106274:	6a 73                	push   $0x73
80106276:	e9 13 f7 ff ff       	jmp    8010598e <alltraps>

8010627b <vector116>:
8010627b:	6a 00                	push   $0x0
8010627d:	6a 74                	push   $0x74
8010627f:	e9 0a f7 ff ff       	jmp    8010598e <alltraps>

80106284 <vector117>:
80106284:	6a 00                	push   $0x0
80106286:	6a 75                	push   $0x75
80106288:	e9 01 f7 ff ff       	jmp    8010598e <alltraps>

8010628d <vector118>:
8010628d:	6a 00                	push   $0x0
8010628f:	6a 76                	push   $0x76
80106291:	e9 f8 f6 ff ff       	jmp    8010598e <alltraps>

80106296 <vector119>:
80106296:	6a 00                	push   $0x0
80106298:	6a 77                	push   $0x77
8010629a:	e9 ef f6 ff ff       	jmp    8010598e <alltraps>

8010629f <vector120>:
8010629f:	6a 00                	push   $0x0
801062a1:	6a 78                	push   $0x78
801062a3:	e9 e6 f6 ff ff       	jmp    8010598e <alltraps>

801062a8 <vector121>:
801062a8:	6a 00                	push   $0x0
801062aa:	6a 79                	push   $0x79
801062ac:	e9 dd f6 ff ff       	jmp    8010598e <alltraps>

801062b1 <vector122>:
801062b1:	6a 00                	push   $0x0
801062b3:	6a 7a                	push   $0x7a
801062b5:	e9 d4 f6 ff ff       	jmp    8010598e <alltraps>

801062ba <vector123>:
801062ba:	6a 00                	push   $0x0
801062bc:	6a 7b                	push   $0x7b
801062be:	e9 cb f6 ff ff       	jmp    8010598e <alltraps>

801062c3 <vector124>:
801062c3:	6a 00                	push   $0x0
801062c5:	6a 7c                	push   $0x7c
801062c7:	e9 c2 f6 ff ff       	jmp    8010598e <alltraps>

801062cc <vector125>:
801062cc:	6a 00                	push   $0x0
801062ce:	6a 7d                	push   $0x7d
801062d0:	e9 b9 f6 ff ff       	jmp    8010598e <alltraps>

801062d5 <vector126>:
801062d5:	6a 00                	push   $0x0
801062d7:	6a 7e                	push   $0x7e
801062d9:	e9 b0 f6 ff ff       	jmp    8010598e <alltraps>

801062de <vector127>:
801062de:	6a 00                	push   $0x0
801062e0:	6a 7f                	push   $0x7f
801062e2:	e9 a7 f6 ff ff       	jmp    8010598e <alltraps>

801062e7 <vector128>:
801062e7:	6a 00                	push   $0x0
801062e9:	68 80 00 00 00       	push   $0x80
801062ee:	e9 9b f6 ff ff       	jmp    8010598e <alltraps>

801062f3 <vector129>:
801062f3:	6a 00                	push   $0x0
801062f5:	68 81 00 00 00       	push   $0x81
801062fa:	e9 8f f6 ff ff       	jmp    8010598e <alltraps>

801062ff <vector130>:
801062ff:	6a 00                	push   $0x0
80106301:	68 82 00 00 00       	push   $0x82
80106306:	e9 83 f6 ff ff       	jmp    8010598e <alltraps>

8010630b <vector131>:
8010630b:	6a 00                	push   $0x0
8010630d:	68 83 00 00 00       	push   $0x83
80106312:	e9 77 f6 ff ff       	jmp    8010598e <alltraps>

80106317 <vector132>:
80106317:	6a 00                	push   $0x0
80106319:	68 84 00 00 00       	push   $0x84
8010631e:	e9 6b f6 ff ff       	jmp    8010598e <alltraps>

80106323 <vector133>:
80106323:	6a 00                	push   $0x0
80106325:	68 85 00 00 00       	push   $0x85
8010632a:	e9 5f f6 ff ff       	jmp    8010598e <alltraps>

8010632f <vector134>:
8010632f:	6a 00                	push   $0x0
80106331:	68 86 00 00 00       	push   $0x86
80106336:	e9 53 f6 ff ff       	jmp    8010598e <alltraps>

8010633b <vector135>:
8010633b:	6a 00                	push   $0x0
8010633d:	68 87 00 00 00       	push   $0x87
80106342:	e9 47 f6 ff ff       	jmp    8010598e <alltraps>

80106347 <vector136>:
80106347:	6a 00                	push   $0x0
80106349:	68 88 00 00 00       	push   $0x88
8010634e:	e9 3b f6 ff ff       	jmp    8010598e <alltraps>

80106353 <vector137>:
80106353:	6a 00                	push   $0x0
80106355:	68 89 00 00 00       	push   $0x89
8010635a:	e9 2f f6 ff ff       	jmp    8010598e <alltraps>

8010635f <vector138>:
8010635f:	6a 00                	push   $0x0
80106361:	68 8a 00 00 00       	push   $0x8a
80106366:	e9 23 f6 ff ff       	jmp    8010598e <alltraps>

8010636b <vector139>:
8010636b:	6a 00                	push   $0x0
8010636d:	68 8b 00 00 00       	push   $0x8b
80106372:	e9 17 f6 ff ff       	jmp    8010598e <alltraps>

80106377 <vector140>:
80106377:	6a 00                	push   $0x0
80106379:	68 8c 00 00 00       	push   $0x8c
8010637e:	e9 0b f6 ff ff       	jmp    8010598e <alltraps>

80106383 <vector141>:
80106383:	6a 00                	push   $0x0
80106385:	68 8d 00 00 00       	push   $0x8d
8010638a:	e9 ff f5 ff ff       	jmp    8010598e <alltraps>

8010638f <vector142>:
8010638f:	6a 00                	push   $0x0
80106391:	68 8e 00 00 00       	push   $0x8e
80106396:	e9 f3 f5 ff ff       	jmp    8010598e <alltraps>

8010639b <vector143>:
8010639b:	6a 00                	push   $0x0
8010639d:	68 8f 00 00 00       	push   $0x8f
801063a2:	e9 e7 f5 ff ff       	jmp    8010598e <alltraps>

801063a7 <vector144>:
801063a7:	6a 00                	push   $0x0
801063a9:	68 90 00 00 00       	push   $0x90
801063ae:	e9 db f5 ff ff       	jmp    8010598e <alltraps>

801063b3 <vector145>:
801063b3:	6a 00                	push   $0x0
801063b5:	68 91 00 00 00       	push   $0x91
801063ba:	e9 cf f5 ff ff       	jmp    8010598e <alltraps>

801063bf <vector146>:
801063bf:	6a 00                	push   $0x0
801063c1:	68 92 00 00 00       	push   $0x92
801063c6:	e9 c3 f5 ff ff       	jmp    8010598e <alltraps>

801063cb <vector147>:
801063cb:	6a 00                	push   $0x0
801063cd:	68 93 00 00 00       	push   $0x93
801063d2:	e9 b7 f5 ff ff       	jmp    8010598e <alltraps>

801063d7 <vector148>:
801063d7:	6a 00                	push   $0x0
801063d9:	68 94 00 00 00       	push   $0x94
801063de:	e9 ab f5 ff ff       	jmp    8010598e <alltraps>

801063e3 <vector149>:
801063e3:	6a 00                	push   $0x0
801063e5:	68 95 00 00 00       	push   $0x95
801063ea:	e9 9f f5 ff ff       	jmp    8010598e <alltraps>

801063ef <vector150>:
801063ef:	6a 00                	push   $0x0
801063f1:	68 96 00 00 00       	push   $0x96
801063f6:	e9 93 f5 ff ff       	jmp    8010598e <alltraps>

801063fb <vector151>:
801063fb:	6a 00                	push   $0x0
801063fd:	68 97 00 00 00       	push   $0x97
80106402:	e9 87 f5 ff ff       	jmp    8010598e <alltraps>

80106407 <vector152>:
80106407:	6a 00                	push   $0x0
80106409:	68 98 00 00 00       	push   $0x98
8010640e:	e9 7b f5 ff ff       	jmp    8010598e <alltraps>

80106413 <vector153>:
80106413:	6a 00                	push   $0x0
80106415:	68 99 00 00 00       	push   $0x99
8010641a:	e9 6f f5 ff ff       	jmp    8010598e <alltraps>

8010641f <vector154>:
8010641f:	6a 00                	push   $0x0
80106421:	68 9a 00 00 00       	push   $0x9a
80106426:	e9 63 f5 ff ff       	jmp    8010598e <alltraps>

8010642b <vector155>:
8010642b:	6a 00                	push   $0x0
8010642d:	68 9b 00 00 00       	push   $0x9b
80106432:	e9 57 f5 ff ff       	jmp    8010598e <alltraps>

80106437 <vector156>:
80106437:	6a 00                	push   $0x0
80106439:	68 9c 00 00 00       	push   $0x9c
8010643e:	e9 4b f5 ff ff       	jmp    8010598e <alltraps>

80106443 <vector157>:
80106443:	6a 00                	push   $0x0
80106445:	68 9d 00 00 00       	push   $0x9d
8010644a:	e9 3f f5 ff ff       	jmp    8010598e <alltraps>

8010644f <vector158>:
8010644f:	6a 00                	push   $0x0
80106451:	68 9e 00 00 00       	push   $0x9e
80106456:	e9 33 f5 ff ff       	jmp    8010598e <alltraps>

8010645b <vector159>:
8010645b:	6a 00                	push   $0x0
8010645d:	68 9f 00 00 00       	push   $0x9f
80106462:	e9 27 f5 ff ff       	jmp    8010598e <alltraps>

80106467 <vector160>:
80106467:	6a 00                	push   $0x0
80106469:	68 a0 00 00 00       	push   $0xa0
8010646e:	e9 1b f5 ff ff       	jmp    8010598e <alltraps>

80106473 <vector161>:
80106473:	6a 00                	push   $0x0
80106475:	68 a1 00 00 00       	push   $0xa1
8010647a:	e9 0f f5 ff ff       	jmp    8010598e <alltraps>

8010647f <vector162>:
8010647f:	6a 00                	push   $0x0
80106481:	68 a2 00 00 00       	push   $0xa2
80106486:	e9 03 f5 ff ff       	jmp    8010598e <alltraps>

8010648b <vector163>:
8010648b:	6a 00                	push   $0x0
8010648d:	68 a3 00 00 00       	push   $0xa3
80106492:	e9 f7 f4 ff ff       	jmp    8010598e <alltraps>

80106497 <vector164>:
80106497:	6a 00                	push   $0x0
80106499:	68 a4 00 00 00       	push   $0xa4
8010649e:	e9 eb f4 ff ff       	jmp    8010598e <alltraps>

801064a3 <vector165>:
801064a3:	6a 00                	push   $0x0
801064a5:	68 a5 00 00 00       	push   $0xa5
801064aa:	e9 df f4 ff ff       	jmp    8010598e <alltraps>

801064af <vector166>:
801064af:	6a 00                	push   $0x0
801064b1:	68 a6 00 00 00       	push   $0xa6
801064b6:	e9 d3 f4 ff ff       	jmp    8010598e <alltraps>

801064bb <vector167>:
801064bb:	6a 00                	push   $0x0
801064bd:	68 a7 00 00 00       	push   $0xa7
801064c2:	e9 c7 f4 ff ff       	jmp    8010598e <alltraps>

801064c7 <vector168>:
801064c7:	6a 00                	push   $0x0
801064c9:	68 a8 00 00 00       	push   $0xa8
801064ce:	e9 bb f4 ff ff       	jmp    8010598e <alltraps>

801064d3 <vector169>:
801064d3:	6a 00                	push   $0x0
801064d5:	68 a9 00 00 00       	push   $0xa9
801064da:	e9 af f4 ff ff       	jmp    8010598e <alltraps>

801064df <vector170>:
801064df:	6a 00                	push   $0x0
801064e1:	68 aa 00 00 00       	push   $0xaa
801064e6:	e9 a3 f4 ff ff       	jmp    8010598e <alltraps>

801064eb <vector171>:
801064eb:	6a 00                	push   $0x0
801064ed:	68 ab 00 00 00       	push   $0xab
801064f2:	e9 97 f4 ff ff       	jmp    8010598e <alltraps>

801064f7 <vector172>:
801064f7:	6a 00                	push   $0x0
801064f9:	68 ac 00 00 00       	push   $0xac
801064fe:	e9 8b f4 ff ff       	jmp    8010598e <alltraps>

80106503 <vector173>:
80106503:	6a 00                	push   $0x0
80106505:	68 ad 00 00 00       	push   $0xad
8010650a:	e9 7f f4 ff ff       	jmp    8010598e <alltraps>

8010650f <vector174>:
8010650f:	6a 00                	push   $0x0
80106511:	68 ae 00 00 00       	push   $0xae
80106516:	e9 73 f4 ff ff       	jmp    8010598e <alltraps>

8010651b <vector175>:
8010651b:	6a 00                	push   $0x0
8010651d:	68 af 00 00 00       	push   $0xaf
80106522:	e9 67 f4 ff ff       	jmp    8010598e <alltraps>

80106527 <vector176>:
80106527:	6a 00                	push   $0x0
80106529:	68 b0 00 00 00       	push   $0xb0
8010652e:	e9 5b f4 ff ff       	jmp    8010598e <alltraps>

80106533 <vector177>:
80106533:	6a 00                	push   $0x0
80106535:	68 b1 00 00 00       	push   $0xb1
8010653a:	e9 4f f4 ff ff       	jmp    8010598e <alltraps>

8010653f <vector178>:
8010653f:	6a 00                	push   $0x0
80106541:	68 b2 00 00 00       	push   $0xb2
80106546:	e9 43 f4 ff ff       	jmp    8010598e <alltraps>

8010654b <vector179>:
8010654b:	6a 00                	push   $0x0
8010654d:	68 b3 00 00 00       	push   $0xb3
80106552:	e9 37 f4 ff ff       	jmp    8010598e <alltraps>

80106557 <vector180>:
80106557:	6a 00                	push   $0x0
80106559:	68 b4 00 00 00       	push   $0xb4
8010655e:	e9 2b f4 ff ff       	jmp    8010598e <alltraps>

80106563 <vector181>:
80106563:	6a 00                	push   $0x0
80106565:	68 b5 00 00 00       	push   $0xb5
8010656a:	e9 1f f4 ff ff       	jmp    8010598e <alltraps>

8010656f <vector182>:
8010656f:	6a 00                	push   $0x0
80106571:	68 b6 00 00 00       	push   $0xb6
80106576:	e9 13 f4 ff ff       	jmp    8010598e <alltraps>

8010657b <vector183>:
8010657b:	6a 00                	push   $0x0
8010657d:	68 b7 00 00 00       	push   $0xb7
80106582:	e9 07 f4 ff ff       	jmp    8010598e <alltraps>

80106587 <vector184>:
80106587:	6a 00                	push   $0x0
80106589:	68 b8 00 00 00       	push   $0xb8
8010658e:	e9 fb f3 ff ff       	jmp    8010598e <alltraps>

80106593 <vector185>:
80106593:	6a 00                	push   $0x0
80106595:	68 b9 00 00 00       	push   $0xb9
8010659a:	e9 ef f3 ff ff       	jmp    8010598e <alltraps>

8010659f <vector186>:
8010659f:	6a 00                	push   $0x0
801065a1:	68 ba 00 00 00       	push   $0xba
801065a6:	e9 e3 f3 ff ff       	jmp    8010598e <alltraps>

801065ab <vector187>:
801065ab:	6a 00                	push   $0x0
801065ad:	68 bb 00 00 00       	push   $0xbb
801065b2:	e9 d7 f3 ff ff       	jmp    8010598e <alltraps>

801065b7 <vector188>:
801065b7:	6a 00                	push   $0x0
801065b9:	68 bc 00 00 00       	push   $0xbc
801065be:	e9 cb f3 ff ff       	jmp    8010598e <alltraps>

801065c3 <vector189>:
801065c3:	6a 00                	push   $0x0
801065c5:	68 bd 00 00 00       	push   $0xbd
801065ca:	e9 bf f3 ff ff       	jmp    8010598e <alltraps>

801065cf <vector190>:
801065cf:	6a 00                	push   $0x0
801065d1:	68 be 00 00 00       	push   $0xbe
801065d6:	e9 b3 f3 ff ff       	jmp    8010598e <alltraps>

801065db <vector191>:
801065db:	6a 00                	push   $0x0
801065dd:	68 bf 00 00 00       	push   $0xbf
801065e2:	e9 a7 f3 ff ff       	jmp    8010598e <alltraps>

801065e7 <vector192>:
801065e7:	6a 00                	push   $0x0
801065e9:	68 c0 00 00 00       	push   $0xc0
801065ee:	e9 9b f3 ff ff       	jmp    8010598e <alltraps>

801065f3 <vector193>:
801065f3:	6a 00                	push   $0x0
801065f5:	68 c1 00 00 00       	push   $0xc1
801065fa:	e9 8f f3 ff ff       	jmp    8010598e <alltraps>

801065ff <vector194>:
801065ff:	6a 00                	push   $0x0
80106601:	68 c2 00 00 00       	push   $0xc2
80106606:	e9 83 f3 ff ff       	jmp    8010598e <alltraps>

8010660b <vector195>:
8010660b:	6a 00                	push   $0x0
8010660d:	68 c3 00 00 00       	push   $0xc3
80106612:	e9 77 f3 ff ff       	jmp    8010598e <alltraps>

80106617 <vector196>:
80106617:	6a 00                	push   $0x0
80106619:	68 c4 00 00 00       	push   $0xc4
8010661e:	e9 6b f3 ff ff       	jmp    8010598e <alltraps>

80106623 <vector197>:
80106623:	6a 00                	push   $0x0
80106625:	68 c5 00 00 00       	push   $0xc5
8010662a:	e9 5f f3 ff ff       	jmp    8010598e <alltraps>

8010662f <vector198>:
8010662f:	6a 00                	push   $0x0
80106631:	68 c6 00 00 00       	push   $0xc6
80106636:	e9 53 f3 ff ff       	jmp    8010598e <alltraps>

8010663b <vector199>:
8010663b:	6a 00                	push   $0x0
8010663d:	68 c7 00 00 00       	push   $0xc7
80106642:	e9 47 f3 ff ff       	jmp    8010598e <alltraps>

80106647 <vector200>:
80106647:	6a 00                	push   $0x0
80106649:	68 c8 00 00 00       	push   $0xc8
8010664e:	e9 3b f3 ff ff       	jmp    8010598e <alltraps>

80106653 <vector201>:
80106653:	6a 00                	push   $0x0
80106655:	68 c9 00 00 00       	push   $0xc9
8010665a:	e9 2f f3 ff ff       	jmp    8010598e <alltraps>

8010665f <vector202>:
8010665f:	6a 00                	push   $0x0
80106661:	68 ca 00 00 00       	push   $0xca
80106666:	e9 23 f3 ff ff       	jmp    8010598e <alltraps>

8010666b <vector203>:
8010666b:	6a 00                	push   $0x0
8010666d:	68 cb 00 00 00       	push   $0xcb
80106672:	e9 17 f3 ff ff       	jmp    8010598e <alltraps>

80106677 <vector204>:
80106677:	6a 00                	push   $0x0
80106679:	68 cc 00 00 00       	push   $0xcc
8010667e:	e9 0b f3 ff ff       	jmp    8010598e <alltraps>

80106683 <vector205>:
80106683:	6a 00                	push   $0x0
80106685:	68 cd 00 00 00       	push   $0xcd
8010668a:	e9 ff f2 ff ff       	jmp    8010598e <alltraps>

8010668f <vector206>:
8010668f:	6a 00                	push   $0x0
80106691:	68 ce 00 00 00       	push   $0xce
80106696:	e9 f3 f2 ff ff       	jmp    8010598e <alltraps>

8010669b <vector207>:
8010669b:	6a 00                	push   $0x0
8010669d:	68 cf 00 00 00       	push   $0xcf
801066a2:	e9 e7 f2 ff ff       	jmp    8010598e <alltraps>

801066a7 <vector208>:
801066a7:	6a 00                	push   $0x0
801066a9:	68 d0 00 00 00       	push   $0xd0
801066ae:	e9 db f2 ff ff       	jmp    8010598e <alltraps>

801066b3 <vector209>:
801066b3:	6a 00                	push   $0x0
801066b5:	68 d1 00 00 00       	push   $0xd1
801066ba:	e9 cf f2 ff ff       	jmp    8010598e <alltraps>

801066bf <vector210>:
801066bf:	6a 00                	push   $0x0
801066c1:	68 d2 00 00 00       	push   $0xd2
801066c6:	e9 c3 f2 ff ff       	jmp    8010598e <alltraps>

801066cb <vector211>:
801066cb:	6a 00                	push   $0x0
801066cd:	68 d3 00 00 00       	push   $0xd3
801066d2:	e9 b7 f2 ff ff       	jmp    8010598e <alltraps>

801066d7 <vector212>:
801066d7:	6a 00                	push   $0x0
801066d9:	68 d4 00 00 00       	push   $0xd4
801066de:	e9 ab f2 ff ff       	jmp    8010598e <alltraps>

801066e3 <vector213>:
801066e3:	6a 00                	push   $0x0
801066e5:	68 d5 00 00 00       	push   $0xd5
801066ea:	e9 9f f2 ff ff       	jmp    8010598e <alltraps>

801066ef <vector214>:
801066ef:	6a 00                	push   $0x0
801066f1:	68 d6 00 00 00       	push   $0xd6
801066f6:	e9 93 f2 ff ff       	jmp    8010598e <alltraps>

801066fb <vector215>:
801066fb:	6a 00                	push   $0x0
801066fd:	68 d7 00 00 00       	push   $0xd7
80106702:	e9 87 f2 ff ff       	jmp    8010598e <alltraps>

80106707 <vector216>:
80106707:	6a 00                	push   $0x0
80106709:	68 d8 00 00 00       	push   $0xd8
8010670e:	e9 7b f2 ff ff       	jmp    8010598e <alltraps>

80106713 <vector217>:
80106713:	6a 00                	push   $0x0
80106715:	68 d9 00 00 00       	push   $0xd9
8010671a:	e9 6f f2 ff ff       	jmp    8010598e <alltraps>

8010671f <vector218>:
8010671f:	6a 00                	push   $0x0
80106721:	68 da 00 00 00       	push   $0xda
80106726:	e9 63 f2 ff ff       	jmp    8010598e <alltraps>

8010672b <vector219>:
8010672b:	6a 00                	push   $0x0
8010672d:	68 db 00 00 00       	push   $0xdb
80106732:	e9 57 f2 ff ff       	jmp    8010598e <alltraps>

80106737 <vector220>:
80106737:	6a 00                	push   $0x0
80106739:	68 dc 00 00 00       	push   $0xdc
8010673e:	e9 4b f2 ff ff       	jmp    8010598e <alltraps>

80106743 <vector221>:
80106743:	6a 00                	push   $0x0
80106745:	68 dd 00 00 00       	push   $0xdd
8010674a:	e9 3f f2 ff ff       	jmp    8010598e <alltraps>

8010674f <vector222>:
8010674f:	6a 00                	push   $0x0
80106751:	68 de 00 00 00       	push   $0xde
80106756:	e9 33 f2 ff ff       	jmp    8010598e <alltraps>

8010675b <vector223>:
8010675b:	6a 00                	push   $0x0
8010675d:	68 df 00 00 00       	push   $0xdf
80106762:	e9 27 f2 ff ff       	jmp    8010598e <alltraps>

80106767 <vector224>:
80106767:	6a 00                	push   $0x0
80106769:	68 e0 00 00 00       	push   $0xe0
8010676e:	e9 1b f2 ff ff       	jmp    8010598e <alltraps>

80106773 <vector225>:
80106773:	6a 00                	push   $0x0
80106775:	68 e1 00 00 00       	push   $0xe1
8010677a:	e9 0f f2 ff ff       	jmp    8010598e <alltraps>

8010677f <vector226>:
8010677f:	6a 00                	push   $0x0
80106781:	68 e2 00 00 00       	push   $0xe2
80106786:	e9 03 f2 ff ff       	jmp    8010598e <alltraps>

8010678b <vector227>:
8010678b:	6a 00                	push   $0x0
8010678d:	68 e3 00 00 00       	push   $0xe3
80106792:	e9 f7 f1 ff ff       	jmp    8010598e <alltraps>

80106797 <vector228>:
80106797:	6a 00                	push   $0x0
80106799:	68 e4 00 00 00       	push   $0xe4
8010679e:	e9 eb f1 ff ff       	jmp    8010598e <alltraps>

801067a3 <vector229>:
801067a3:	6a 00                	push   $0x0
801067a5:	68 e5 00 00 00       	push   $0xe5
801067aa:	e9 df f1 ff ff       	jmp    8010598e <alltraps>

801067af <vector230>:
801067af:	6a 00                	push   $0x0
801067b1:	68 e6 00 00 00       	push   $0xe6
801067b6:	e9 d3 f1 ff ff       	jmp    8010598e <alltraps>

801067bb <vector231>:
801067bb:	6a 00                	push   $0x0
801067bd:	68 e7 00 00 00       	push   $0xe7
801067c2:	e9 c7 f1 ff ff       	jmp    8010598e <alltraps>

801067c7 <vector232>:
801067c7:	6a 00                	push   $0x0
801067c9:	68 e8 00 00 00       	push   $0xe8
801067ce:	e9 bb f1 ff ff       	jmp    8010598e <alltraps>

801067d3 <vector233>:
801067d3:	6a 00                	push   $0x0
801067d5:	68 e9 00 00 00       	push   $0xe9
801067da:	e9 af f1 ff ff       	jmp    8010598e <alltraps>

801067df <vector234>:
801067df:	6a 00                	push   $0x0
801067e1:	68 ea 00 00 00       	push   $0xea
801067e6:	e9 a3 f1 ff ff       	jmp    8010598e <alltraps>

801067eb <vector235>:
801067eb:	6a 00                	push   $0x0
801067ed:	68 eb 00 00 00       	push   $0xeb
801067f2:	e9 97 f1 ff ff       	jmp    8010598e <alltraps>

801067f7 <vector236>:
801067f7:	6a 00                	push   $0x0
801067f9:	68 ec 00 00 00       	push   $0xec
801067fe:	e9 8b f1 ff ff       	jmp    8010598e <alltraps>

80106803 <vector237>:
80106803:	6a 00                	push   $0x0
80106805:	68 ed 00 00 00       	push   $0xed
8010680a:	e9 7f f1 ff ff       	jmp    8010598e <alltraps>

8010680f <vector238>:
8010680f:	6a 00                	push   $0x0
80106811:	68 ee 00 00 00       	push   $0xee
80106816:	e9 73 f1 ff ff       	jmp    8010598e <alltraps>

8010681b <vector239>:
8010681b:	6a 00                	push   $0x0
8010681d:	68 ef 00 00 00       	push   $0xef
80106822:	e9 67 f1 ff ff       	jmp    8010598e <alltraps>

80106827 <vector240>:
80106827:	6a 00                	push   $0x0
80106829:	68 f0 00 00 00       	push   $0xf0
8010682e:	e9 5b f1 ff ff       	jmp    8010598e <alltraps>

80106833 <vector241>:
80106833:	6a 00                	push   $0x0
80106835:	68 f1 00 00 00       	push   $0xf1
8010683a:	e9 4f f1 ff ff       	jmp    8010598e <alltraps>

8010683f <vector242>:
8010683f:	6a 00                	push   $0x0
80106841:	68 f2 00 00 00       	push   $0xf2
80106846:	e9 43 f1 ff ff       	jmp    8010598e <alltraps>

8010684b <vector243>:
8010684b:	6a 00                	push   $0x0
8010684d:	68 f3 00 00 00       	push   $0xf3
80106852:	e9 37 f1 ff ff       	jmp    8010598e <alltraps>

80106857 <vector244>:
80106857:	6a 00                	push   $0x0
80106859:	68 f4 00 00 00       	push   $0xf4
8010685e:	e9 2b f1 ff ff       	jmp    8010598e <alltraps>

80106863 <vector245>:
80106863:	6a 00                	push   $0x0
80106865:	68 f5 00 00 00       	push   $0xf5
8010686a:	e9 1f f1 ff ff       	jmp    8010598e <alltraps>

8010686f <vector246>:
8010686f:	6a 00                	push   $0x0
80106871:	68 f6 00 00 00       	push   $0xf6
80106876:	e9 13 f1 ff ff       	jmp    8010598e <alltraps>

8010687b <vector247>:
8010687b:	6a 00                	push   $0x0
8010687d:	68 f7 00 00 00       	push   $0xf7
80106882:	e9 07 f1 ff ff       	jmp    8010598e <alltraps>

80106887 <vector248>:
80106887:	6a 00                	push   $0x0
80106889:	68 f8 00 00 00       	push   $0xf8
8010688e:	e9 fb f0 ff ff       	jmp    8010598e <alltraps>

80106893 <vector249>:
80106893:	6a 00                	push   $0x0
80106895:	68 f9 00 00 00       	push   $0xf9
8010689a:	e9 ef f0 ff ff       	jmp    8010598e <alltraps>

8010689f <vector250>:
8010689f:	6a 00                	push   $0x0
801068a1:	68 fa 00 00 00       	push   $0xfa
801068a6:	e9 e3 f0 ff ff       	jmp    8010598e <alltraps>

801068ab <vector251>:
801068ab:	6a 00                	push   $0x0
801068ad:	68 fb 00 00 00       	push   $0xfb
801068b2:	e9 d7 f0 ff ff       	jmp    8010598e <alltraps>

801068b7 <vector252>:
801068b7:	6a 00                	push   $0x0
801068b9:	68 fc 00 00 00       	push   $0xfc
801068be:	e9 cb f0 ff ff       	jmp    8010598e <alltraps>

801068c3 <vector253>:
801068c3:	6a 00                	push   $0x0
801068c5:	68 fd 00 00 00       	push   $0xfd
801068ca:	e9 bf f0 ff ff       	jmp    8010598e <alltraps>

801068cf <vector254>:
801068cf:	6a 00                	push   $0x0
801068d1:	68 fe 00 00 00       	push   $0xfe
801068d6:	e9 b3 f0 ff ff       	jmp    8010598e <alltraps>

801068db <vector255>:
801068db:	6a 00                	push   $0x0
801068dd:	68 ff 00 00 00       	push   $0xff
801068e2:	e9 a7 f0 ff ff       	jmp    8010598e <alltraps>
801068e7:	66 90                	xchg   %ax,%ax
801068e9:	66 90                	xchg   %ax,%ax
801068eb:	66 90                	xchg   %ax,%ax
801068ed:	66 90                	xchg   %ax,%ax
801068ef:	90                   	nop

801068f0 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
801068f0:	55                   	push   %ebp
801068f1:	89 e5                	mov    %esp,%ebp
801068f3:	57                   	push   %edi
801068f4:	56                   	push   %esi
801068f5:	53                   	push   %ebx
801068f6:	89 d3                	mov    %edx,%ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
801068f8:	c1 ea 16             	shr    $0x16,%edx
801068fb:	8d 3c 90             	lea    (%eax,%edx,4),%edi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
801068fe:	83 ec 0c             	sub    $0xc,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
80106901:	8b 07                	mov    (%edi),%eax
80106903:	a8 01                	test   $0x1,%al
80106905:	74 29                	je     80106930 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106907:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010690c:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106912:	8d 65 f4             	lea    -0xc(%ebp),%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106915:	c1 eb 0a             	shr    $0xa,%ebx
80106918:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
8010691e:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
}
80106921:	5b                   	pop    %ebx
80106922:	5e                   	pop    %esi
80106923:	5f                   	pop    %edi
80106924:	5d                   	pop    %ebp
80106925:	c3                   	ret    
80106926:	8d 76 00             	lea    0x0(%esi),%esi
80106929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106930:	85 c9                	test   %ecx,%ecx
80106932:	74 2c                	je     80106960 <walkpgdir+0x70>
80106934:	e8 97 bc ff ff       	call   801025d0 <kalloc>
80106939:	85 c0                	test   %eax,%eax
8010693b:	89 c6                	mov    %eax,%esi
8010693d:	74 21                	je     80106960 <walkpgdir+0x70>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
8010693f:	83 ec 04             	sub    $0x4,%esp
80106942:	68 00 10 00 00       	push   $0x1000
80106947:	6a 00                	push   $0x0
80106949:	50                   	push   %eax
8010694a:	e8 b1 dc ff ff       	call   80104600 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
8010694f:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106955:	83 c4 10             	add    $0x10,%esp
80106958:	83 c8 07             	or     $0x7,%eax
8010695b:	89 07                	mov    %eax,(%edi)
8010695d:	eb b3                	jmp    80106912 <walkpgdir+0x22>
8010695f:	90                   	nop
  }
  return &pgtab[PTX(va)];
}
80106960:	8d 65 f4             	lea    -0xc(%ebp),%esp
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
80106963:	31 c0                	xor    %eax,%eax
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106965:	5b                   	pop    %ebx
80106966:	5e                   	pop    %esi
80106967:	5f                   	pop    %edi
80106968:	5d                   	pop    %ebp
80106969:	c3                   	ret    
8010696a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106970 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106970:	55                   	push   %ebp
80106971:	89 e5                	mov    %esp,%ebp
80106973:	57                   	push   %edi
80106974:	56                   	push   %esi
80106975:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106976:	89 d3                	mov    %edx,%ebx
80106978:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
8010697e:	83 ec 1c             	sub    $0x1c,%esp
80106981:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106984:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106988:	8b 7d 08             	mov    0x8(%ebp),%edi
8010698b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106990:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106993:	8b 45 0c             	mov    0xc(%ebp),%eax
80106996:	29 df                	sub    %ebx,%edi
80106998:	83 c8 01             	or     $0x1,%eax
8010699b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010699e:	eb 15                	jmp    801069b5 <mappages+0x45>
  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
801069a0:	f6 00 01             	testb  $0x1,(%eax)
801069a3:	75 45                	jne    801069ea <mappages+0x7a>
      panic("remap");
    *pte = pa | perm | PTE_P;
801069a5:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
801069a8:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
801069ab:	89 30                	mov    %esi,(%eax)
    if(a == last)
801069ad:	74 31                	je     801069e0 <mappages+0x70>
      break;
    a += PGSIZE;
801069af:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
801069b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801069b8:	b9 01 00 00 00       	mov    $0x1,%ecx
801069bd:	89 da                	mov    %ebx,%edx
801069bf:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
801069c2:	e8 29 ff ff ff       	call   801068f0 <walkpgdir>
801069c7:	85 c0                	test   %eax,%eax
801069c9:	75 d5                	jne    801069a0 <mappages+0x30>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
801069cb:	8d 65 f4             	lea    -0xc(%ebp),%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
801069ce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
801069d3:	5b                   	pop    %ebx
801069d4:	5e                   	pop    %esi
801069d5:	5f                   	pop    %edi
801069d6:	5d                   	pop    %ebp
801069d7:	c3                   	ret    
801069d8:	90                   	nop
801069d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801069e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
801069e3:	31 c0                	xor    %eax,%eax
}
801069e5:	5b                   	pop    %ebx
801069e6:	5e                   	pop    %esi
801069e7:	5f                   	pop    %edi
801069e8:	5d                   	pop    %ebp
801069e9:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
801069ea:	83 ec 0c             	sub    $0xc,%esp
801069ed:	68 2c 7b 10 80       	push   $0x80107b2c
801069f2:	e8 79 99 ff ff       	call   80100370 <panic>
801069f7:	89 f6                	mov    %esi,%esi
801069f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a00 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a00:	55                   	push   %ebp
80106a01:	89 e5                	mov    %esp,%ebp
80106a03:	57                   	push   %edi
80106a04:	56                   	push   %esi
80106a05:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106a06:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a0c:	89 c7                	mov    %eax,%edi
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106a0e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106a14:	83 ec 1c             	sub    $0x1c,%esp
80106a17:	89 4d e0             	mov    %ecx,-0x20(%ebp)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106a1a:	39 d3                	cmp    %edx,%ebx
80106a1c:	73 60                	jae    80106a7e <deallocuvm.part.0+0x7e>
80106a1e:	89 d6                	mov    %edx,%esi
80106a20:	eb 3d                	jmp    80106a5f <deallocuvm.part.0+0x5f>
80106a22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a += (NPTENTRIES - 1) * PGSIZE;
    else if((*pte & PTE_P) != 0){
80106a28:	8b 10                	mov    (%eax),%edx
80106a2a:	f6 c2 01             	test   $0x1,%dl
80106a2d:	74 26                	je     80106a55 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80106a2f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106a35:	74 52                	je     80106a89 <deallocuvm.part.0+0x89>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106a37:	83 ec 0c             	sub    $0xc,%esp
80106a3a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106a40:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106a43:	52                   	push   %edx
80106a44:	e8 d7 b9 ff ff       	call   80102420 <kfree>
      *pte = 0;
80106a49:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106a4c:	83 c4 10             	add    $0x10,%esp
80106a4f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106a55:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106a5b:	39 f3                	cmp    %esi,%ebx
80106a5d:	73 1f                	jae    80106a7e <deallocuvm.part.0+0x7e>
    pte = walkpgdir(pgdir, (char*)a, 0);
80106a5f:	31 c9                	xor    %ecx,%ecx
80106a61:	89 da                	mov    %ebx,%edx
80106a63:	89 f8                	mov    %edi,%eax
80106a65:	e8 86 fe ff ff       	call   801068f0 <walkpgdir>
    if(!pte)
80106a6a:	85 c0                	test   %eax,%eax
80106a6c:	75 ba                	jne    80106a28 <deallocuvm.part.0+0x28>
      a += (NPTENTRIES - 1) * PGSIZE;
80106a6e:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106a74:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106a7a:	39 f3                	cmp    %esi,%ebx
80106a7c:	72 e1                	jb     80106a5f <deallocuvm.part.0+0x5f>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106a7e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106a81:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106a84:	5b                   	pop    %ebx
80106a85:	5e                   	pop    %esi
80106a86:	5f                   	pop    %edi
80106a87:	5d                   	pop    %ebp
80106a88:	c3                   	ret    
    if(!pte)
      a += (NPTENTRIES - 1) * PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
80106a89:	83 ec 0c             	sub    $0xc,%esp
80106a8c:	68 92 74 10 80       	push   $0x80107492
80106a91:	e8 da 98 ff ff       	call   80100370 <panic>
80106a96:	8d 76 00             	lea    0x0(%esi),%esi
80106a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106aa0 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106aa0:	55                   	push   %ebp
80106aa1:	89 e5                	mov    %esp,%ebp
80106aa3:	53                   	push   %ebx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106aa4:	31 db                	xor    %ebx,%ebx

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106aa6:	83 ec 14             	sub    $0x14,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106aa9:	e8 82 bd ff ff       	call   80102830 <cpunum>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106aae:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80106ab4:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106ab9:	8d 90 a0 27 11 80    	lea    -0x7feed860(%eax),%edx
80106abf:	c6 80 1d 28 11 80 9a 	movb   $0x9a,-0x7feed7e3(%eax)
80106ac6:	c6 80 1e 28 11 80 cf 	movb   $0xcf,-0x7feed7e2(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106acd:	c6 80 25 28 11 80 92 	movb   $0x92,-0x7feed7db(%eax)
80106ad4:	c6 80 26 28 11 80 cf 	movb   $0xcf,-0x7feed7da(%eax)
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106adb:	66 89 4a 78          	mov    %cx,0x78(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106adf:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106ae4:	66 89 5a 7a          	mov    %bx,0x7a(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106ae8:	66 89 8a 80 00 00 00 	mov    %cx,0x80(%edx)
80106aef:	31 db                	xor    %ebx,%ebx
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106af1:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106af6:	66 89 9a 82 00 00 00 	mov    %bx,0x82(%edx)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106afd:	66 89 8a 90 00 00 00 	mov    %cx,0x90(%edx)
80106b04:	31 db                	xor    %ebx,%ebx
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b06:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b0b:	66 89 9a 92 00 00 00 	mov    %bx,0x92(%edx)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b12:	31 db                	xor    %ebx,%ebx
80106b14:	66 89 8a 98 00 00 00 	mov    %cx,0x98(%edx)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106b1b:	8d 88 54 28 11 80    	lea    -0x7feed7ac(%eax),%ecx
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b21:	66 89 9a 9a 00 00 00 	mov    %bx,0x9a(%edx)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106b28:	31 db                	xor    %ebx,%ebx
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b2a:	c6 80 35 28 11 80 fa 	movb   $0xfa,-0x7feed7cb(%eax)
80106b31:	c6 80 36 28 11 80 cf 	movb   $0xcf,-0x7feed7ca(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106b38:	66 89 9a 88 00 00 00 	mov    %bx,0x88(%edx)
80106b3f:	66 89 8a 8a 00 00 00 	mov    %cx,0x8a(%edx)
80106b46:	89 cb                	mov    %ecx,%ebx
80106b48:	c1 e9 18             	shr    $0x18,%ecx
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106b4b:	c6 80 3d 28 11 80 f2 	movb   $0xf2,-0x7feed7c3(%eax)
80106b52:	c6 80 3e 28 11 80 cf 	movb   $0xcf,-0x7feed7c2(%eax)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106b59:	88 8a 8f 00 00 00    	mov    %cl,0x8f(%edx)
80106b5f:	c6 80 2d 28 11 80 92 	movb   $0x92,-0x7feed7d3(%eax)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80106b66:	b9 37 00 00 00       	mov    $0x37,%ecx
80106b6b:	c6 80 2e 28 11 80 c0 	movb   $0xc0,-0x7feed7d2(%eax)

  lgdt(c->gdt, sizeof(c->gdt));
80106b72:	05 10 28 11 80       	add    $0x80112810,%eax
80106b77:	66 89 4d f2          	mov    %cx,-0xe(%ebp)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106b7b:	c1 eb 10             	shr    $0x10,%ebx
  pd[1] = (uint)p;
80106b7e:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106b82:	c1 e8 10             	shr    $0x10,%eax
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106b85:	c6 42 7c 00          	movb   $0x0,0x7c(%edx)
80106b89:	c6 42 7f 00          	movb   $0x0,0x7f(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106b8d:	c6 82 84 00 00 00 00 	movb   $0x0,0x84(%edx)
80106b94:	c6 82 87 00 00 00 00 	movb   $0x0,0x87(%edx)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106b9b:	c6 82 94 00 00 00 00 	movb   $0x0,0x94(%edx)
80106ba2:	c6 82 97 00 00 00 00 	movb   $0x0,0x97(%edx)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106ba9:	c6 82 9c 00 00 00 00 	movb   $0x0,0x9c(%edx)
80106bb0:	c6 82 9f 00 00 00 00 	movb   $0x0,0x9f(%edx)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106bb7:	88 9a 8c 00 00 00    	mov    %bl,0x8c(%edx)
80106bbd:	66 89 45 f6          	mov    %ax,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
80106bc1:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106bc4:	0f 01 10             	lgdtl  (%eax)
}

static inline void
loadgs(ushort v)
{
  asm volatile("movw %0, %%gs" : : "r" (v));
80106bc7:	b8 18 00 00 00       	mov    $0x18,%eax
80106bcc:	8e e8                	mov    %eax,%gs
  lgdt(c->gdt, sizeof(c->gdt));
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
  proc = 0;
80106bce:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80106bd5:	00 00 00 00 

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106bd9:	65 89 15 00 00 00 00 	mov    %edx,%gs:0x0
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
  proc = 0;
}
80106be0:	83 c4 14             	add    $0x14,%esp
80106be3:	5b                   	pop    %ebx
80106be4:	5d                   	pop    %ebp
80106be5:	c3                   	ret    
80106be6:	8d 76 00             	lea    0x0(%esi),%esi
80106be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106bf0 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80106bf0:	55                   	push   %ebp
80106bf1:	89 e5                	mov    %esp,%ebp
80106bf3:	56                   	push   %esi
80106bf4:	53                   	push   %ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80106bf5:	e8 d6 b9 ff ff       	call   801025d0 <kalloc>
80106bfa:	85 c0                	test   %eax,%eax
80106bfc:	74 52                	je     80106c50 <setupkvm+0x60>
    return 0;
  memset(pgdir, 0, PGSIZE);
80106bfe:	83 ec 04             	sub    $0x4,%esp
80106c01:	89 c6                	mov    %eax,%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106c03:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
80106c08:	68 00 10 00 00       	push   $0x1000
80106c0d:	6a 00                	push   $0x0
80106c0f:	50                   	push   %eax
80106c10:	e8 eb d9 ff ff       	call   80104600 <memset>
80106c15:	83 c4 10             	add    $0x10,%esp
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106c18:	8b 43 04             	mov    0x4(%ebx),%eax
80106c1b:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106c1e:	83 ec 08             	sub    $0x8,%esp
80106c21:	8b 13                	mov    (%ebx),%edx
80106c23:	ff 73 0c             	pushl  0xc(%ebx)
80106c26:	50                   	push   %eax
80106c27:	29 c1                	sub    %eax,%ecx
80106c29:	89 f0                	mov    %esi,%eax
80106c2b:	e8 40 fd ff ff       	call   80106970 <mappages>
80106c30:	83 c4 10             	add    $0x10,%esp
80106c33:	85 c0                	test   %eax,%eax
80106c35:	78 19                	js     80106c50 <setupkvm+0x60>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106c37:	83 c3 10             	add    $0x10,%ebx
80106c3a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106c40:	75 d6                	jne    80106c18 <setupkvm+0x28>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
80106c42:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106c45:	89 f0                	mov    %esi,%eax
80106c47:	5b                   	pop    %ebx
80106c48:	5e                   	pop    %esi
80106c49:	5d                   	pop    %ebp
80106c4a:	c3                   	ret    
80106c4b:	90                   	nop
80106c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106c50:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
80106c53:	31 c0                	xor    %eax,%eax
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
80106c55:	5b                   	pop    %ebx
80106c56:	5e                   	pop    %esi
80106c57:	5d                   	pop    %ebp
80106c58:	c3                   	ret    
80106c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106c60 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80106c60:	55                   	push   %ebp
80106c61:	89 e5                	mov    %esp,%ebp
80106c63:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106c66:	e8 85 ff ff ff       	call   80106bf0 <setupkvm>
80106c6b:	a3 44 7c 11 80       	mov    %eax,0x80117c44
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106c70:	05 00 00 00 80       	add    $0x80000000,%eax
80106c75:	0f 22 d8             	mov    %eax,%cr3
  switchkvm();
}
80106c78:	c9                   	leave  
80106c79:	c3                   	ret    
80106c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106c80 <switchkvm>:
80106c80:	a1 44 7c 11 80       	mov    0x80117c44,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80106c85:	55                   	push   %ebp
80106c86:	89 e5                	mov    %esp,%ebp
80106c88:	05 00 00 00 80       	add    $0x80000000,%eax
80106c8d:	0f 22 d8             	mov    %eax,%cr3
  lcr3(V2P(kpgdir));   // switch to the kernel page table
}
80106c90:	5d                   	pop    %ebp
80106c91:	c3                   	ret    
80106c92:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106ca0 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80106ca0:	55                   	push   %ebp
80106ca1:	89 e5                	mov    %esp,%ebp
80106ca3:	53                   	push   %ebx
80106ca4:	83 ec 04             	sub    $0x4,%esp
80106ca7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
80106caa:	e8 81 d8 ff ff       	call   80104530 <pushcli>
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106caf:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80106cb5:	b9 67 00 00 00       	mov    $0x67,%ecx
80106cba:	8d 50 08             	lea    0x8(%eax),%edx
80106cbd:	66 89 88 a0 00 00 00 	mov    %cx,0xa0(%eax)
80106cc4:	c6 80 a6 00 00 00 40 	movb   $0x40,0xa6(%eax)
  cpu->gdt[SEG_TSS].s = 0;
80106ccb:	c6 80 a5 00 00 00 89 	movb   $0x89,0xa5(%eax)
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106cd2:	66 89 90 a2 00 00 00 	mov    %dx,0xa2(%eax)
80106cd9:	89 d1                	mov    %edx,%ecx
80106cdb:	c1 ea 18             	shr    $0x18,%edx
80106cde:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
80106ce4:	ba 10 00 00 00       	mov    $0x10,%edx
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106ce9:	c1 e9 10             	shr    $0x10,%ecx
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
80106cec:	66 89 50 10          	mov    %dx,0x10(%eax)
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
80106cf0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106cf7:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
80106cfd:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
80106d02:	8b 52 08             	mov    0x8(%edx),%edx
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
80106d05:	66 89 48 6e          	mov    %cx,0x6e(%eax)
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
80106d09:	81 c2 00 10 00 00    	add    $0x1000,%edx
80106d0f:	89 50 0c             	mov    %edx,0xc(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
80106d12:	b8 30 00 00 00       	mov    $0x30,%eax
80106d17:	0f 00 d8             	ltr    %ax
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  if(p->pgdir == 0)
80106d1a:	8b 43 04             	mov    0x4(%ebx),%eax
80106d1d:	85 c0                	test   %eax,%eax
80106d1f:	74 11                	je     80106d32 <switchuvm+0x92>
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106d21:	05 00 00 00 80       	add    $0x80000000,%eax
80106d26:	0f 22 d8             	mov    %eax,%cr3
    panic("switchuvm: no pgdir");
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
}
80106d29:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80106d2c:	c9                   	leave  
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
80106d2d:	e9 2e d8 ff ff       	jmp    80104560 <popcli>
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
80106d32:	83 ec 0c             	sub    $0xc,%esp
80106d35:	68 32 7b 10 80       	push   $0x80107b32
80106d3a:	e8 31 96 ff ff       	call   80100370 <panic>
80106d3f:	90                   	nop

80106d40 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106d40:	55                   	push   %ebp
80106d41:	89 e5                	mov    %esp,%ebp
80106d43:	57                   	push   %edi
80106d44:	56                   	push   %esi
80106d45:	53                   	push   %ebx
80106d46:	83 ec 1c             	sub    $0x1c,%esp
80106d49:	8b 75 10             	mov    0x10(%ebp),%esi
80106d4c:	8b 45 08             	mov    0x8(%ebp),%eax
80106d4f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *mem;

  if(sz >= PGSIZE)
80106d52:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106d58:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *mem;

  if(sz >= PGSIZE)
80106d5b:	77 49                	ja     80106da6 <inituvm+0x66>
    panic("inituvm: more than a page");
  mem = kalloc();
80106d5d:	e8 6e b8 ff ff       	call   801025d0 <kalloc>
  memset(mem, 0, PGSIZE);
80106d62:	83 ec 04             	sub    $0x4,%esp
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
80106d65:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106d67:	68 00 10 00 00       	push   $0x1000
80106d6c:	6a 00                	push   $0x0
80106d6e:	50                   	push   %eax
80106d6f:	e8 8c d8 ff ff       	call   80104600 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106d74:	58                   	pop    %eax
80106d75:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106d7b:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106d80:	5a                   	pop    %edx
80106d81:	6a 06                	push   $0x6
80106d83:	50                   	push   %eax
80106d84:	31 d2                	xor    %edx,%edx
80106d86:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106d89:	e8 e2 fb ff ff       	call   80106970 <mappages>
  memmove(mem, init, sz);
80106d8e:	89 75 10             	mov    %esi,0x10(%ebp)
80106d91:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106d94:	83 c4 10             	add    $0x10,%esp
80106d97:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106d9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d9d:	5b                   	pop    %ebx
80106d9e:	5e                   	pop    %esi
80106d9f:	5f                   	pop    %edi
80106da0:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
80106da1:	e9 0a d9 ff ff       	jmp    801046b0 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
80106da6:	83 ec 0c             	sub    $0xc,%esp
80106da9:	68 46 7b 10 80       	push   $0x80107b46
80106dae:	e8 bd 95 ff ff       	call   80100370 <panic>
80106db3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106dc0 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80106dc0:	55                   	push   %ebp
80106dc1:	89 e5                	mov    %esp,%ebp
80106dc3:	57                   	push   %edi
80106dc4:	56                   	push   %esi
80106dc5:	53                   	push   %ebx
80106dc6:	83 ec 0c             	sub    $0xc,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80106dc9:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106dd0:	0f 85 91 00 00 00    	jne    80106e67 <loaduvm+0xa7>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80106dd6:	8b 75 18             	mov    0x18(%ebp),%esi
80106dd9:	31 db                	xor    %ebx,%ebx
80106ddb:	85 f6                	test   %esi,%esi
80106ddd:	75 1a                	jne    80106df9 <loaduvm+0x39>
80106ddf:	eb 6f                	jmp    80106e50 <loaduvm+0x90>
80106de1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106de8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106dee:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106df4:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106df7:	76 57                	jbe    80106e50 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106df9:	8b 55 0c             	mov    0xc(%ebp),%edx
80106dfc:	8b 45 08             	mov    0x8(%ebp),%eax
80106dff:	31 c9                	xor    %ecx,%ecx
80106e01:	01 da                	add    %ebx,%edx
80106e03:	e8 e8 fa ff ff       	call   801068f0 <walkpgdir>
80106e08:	85 c0                	test   %eax,%eax
80106e0a:	74 4e                	je     80106e5a <loaduvm+0x9a>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106e0c:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106e0e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
80106e11:	bf 00 10 00 00       	mov    $0x1000,%edi
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106e16:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106e1b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106e21:	0f 46 fe             	cmovbe %esi,%edi
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106e24:	01 d9                	add    %ebx,%ecx
80106e26:	05 00 00 00 80       	add    $0x80000000,%eax
80106e2b:	57                   	push   %edi
80106e2c:	51                   	push   %ecx
80106e2d:	50                   	push   %eax
80106e2e:	ff 75 10             	pushl  0x10(%ebp)
80106e31:	e8 3a ac ff ff       	call   80101a70 <readi>
80106e36:	83 c4 10             	add    $0x10,%esp
80106e39:	39 c7                	cmp    %eax,%edi
80106e3b:	74 ab                	je     80106de8 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
80106e3d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
80106e40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80106e45:	5b                   	pop    %ebx
80106e46:	5e                   	pop    %esi
80106e47:	5f                   	pop    %edi
80106e48:	5d                   	pop    %ebp
80106e49:	c3                   	ret    
80106e4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106e50:	8d 65 f4             	lea    -0xc(%ebp),%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
80106e53:	31 c0                	xor    %eax,%eax
}
80106e55:	5b                   	pop    %ebx
80106e56:	5e                   	pop    %esi
80106e57:	5f                   	pop    %edi
80106e58:	5d                   	pop    %ebp
80106e59:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
80106e5a:	83 ec 0c             	sub    $0xc,%esp
80106e5d:	68 60 7b 10 80       	push   $0x80107b60
80106e62:	e8 09 95 ff ff       	call   80100370 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
80106e67:	83 ec 0c             	sub    $0xc,%esp
80106e6a:	68 04 7c 10 80       	push   $0x80107c04
80106e6f:	e8 fc 94 ff ff       	call   80100370 <panic>
80106e74:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106e7a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106e80 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106e80:	55                   	push   %ebp
80106e81:	89 e5                	mov    %esp,%ebp
80106e83:	57                   	push   %edi
80106e84:	56                   	push   %esi
80106e85:	53                   	push   %ebx
80106e86:	83 ec 0c             	sub    $0xc,%esp
80106e89:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
80106e8c:	85 ff                	test   %edi,%edi
80106e8e:	0f 88 ca 00 00 00    	js     80106f5e <allocuvm+0xde>
    return 0;
  if(newsz < oldsz)
80106e94:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80106e97:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
80106e9a:	0f 82 82 00 00 00    	jb     80106f22 <allocuvm+0xa2>
    return oldsz;

  a = PGROUNDUP(oldsz);
80106ea0:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106ea6:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106eac:	39 df                	cmp    %ebx,%edi
80106eae:	77 43                	ja     80106ef3 <allocuvm+0x73>
80106eb0:	e9 bb 00 00 00       	jmp    80106f70 <allocuvm+0xf0>
80106eb5:	8d 76 00             	lea    0x0(%esi),%esi
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80106eb8:	83 ec 04             	sub    $0x4,%esp
80106ebb:	68 00 10 00 00       	push   $0x1000
80106ec0:	6a 00                	push   $0x0
80106ec2:	50                   	push   %eax
80106ec3:	e8 38 d7 ff ff       	call   80104600 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106ec8:	58                   	pop    %eax
80106ec9:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106ecf:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106ed4:	5a                   	pop    %edx
80106ed5:	6a 06                	push   $0x6
80106ed7:	50                   	push   %eax
80106ed8:	89 da                	mov    %ebx,%edx
80106eda:	8b 45 08             	mov    0x8(%ebp),%eax
80106edd:	e8 8e fa ff ff       	call   80106970 <mappages>
80106ee2:	83 c4 10             	add    $0x10,%esp
80106ee5:	85 c0                	test   %eax,%eax
80106ee7:	78 47                	js     80106f30 <allocuvm+0xb0>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106ee9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106eef:	39 df                	cmp    %ebx,%edi
80106ef1:	76 7d                	jbe    80106f70 <allocuvm+0xf0>
    mem = kalloc();
80106ef3:	e8 d8 b6 ff ff       	call   801025d0 <kalloc>
    if(mem == 0){
80106ef8:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
80106efa:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106efc:	75 ba                	jne    80106eb8 <allocuvm+0x38>
      cprintf("allocuvm out of memory\n");
80106efe:	83 ec 0c             	sub    $0xc,%esp
80106f01:	68 7e 7b 10 80       	push   $0x80107b7e
80106f06:	e8 55 97 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106f0b:	83 c4 10             	add    $0x10,%esp
80106f0e:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106f11:	76 4b                	jbe    80106f5e <allocuvm+0xde>
80106f13:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106f16:	8b 45 08             	mov    0x8(%ebp),%eax
80106f19:	89 fa                	mov    %edi,%edx
80106f1b:	e8 e0 fa ff ff       	call   80106a00 <deallocuvm.part.0>
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
80106f20:	31 c0                	xor    %eax,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106f22:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f25:	5b                   	pop    %ebx
80106f26:	5e                   	pop    %esi
80106f27:	5f                   	pop    %edi
80106f28:	5d                   	pop    %ebp
80106f29:	c3                   	ret    
80106f2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
80106f30:	83 ec 0c             	sub    $0xc,%esp
80106f33:	68 96 7b 10 80       	push   $0x80107b96
80106f38:	e8 23 97 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106f3d:	83 c4 10             	add    $0x10,%esp
80106f40:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106f43:	76 0d                	jbe    80106f52 <allocuvm+0xd2>
80106f45:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106f48:	8b 45 08             	mov    0x8(%ebp),%eax
80106f4b:	89 fa                	mov    %edi,%edx
80106f4d:	e8 ae fa ff ff       	call   80106a00 <deallocuvm.part.0>
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
80106f52:	83 ec 0c             	sub    $0xc,%esp
80106f55:	56                   	push   %esi
80106f56:	e8 c5 b4 ff ff       	call   80102420 <kfree>
      return 0;
80106f5b:	83 c4 10             	add    $0x10,%esp
    }
  }
  return newsz;
}
80106f5e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
80106f61:	31 c0                	xor    %eax,%eax
    }
  }
  return newsz;
}
80106f63:	5b                   	pop    %ebx
80106f64:	5e                   	pop    %esi
80106f65:	5f                   	pop    %edi
80106f66:	5d                   	pop    %ebp
80106f67:	c3                   	ret    
80106f68:	90                   	nop
80106f69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f70:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106f73:	89 f8                	mov    %edi,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106f75:	5b                   	pop    %ebx
80106f76:	5e                   	pop    %esi
80106f77:	5f                   	pop    %edi
80106f78:	5d                   	pop    %ebp
80106f79:	c3                   	ret    
80106f7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106f80 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106f80:	55                   	push   %ebp
80106f81:	89 e5                	mov    %esp,%ebp
80106f83:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f86:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106f89:	8b 45 08             	mov    0x8(%ebp),%eax
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106f8c:	39 d1                	cmp    %edx,%ecx
80106f8e:	73 10                	jae    80106fa0 <deallocuvm+0x20>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106f90:	5d                   	pop    %ebp
80106f91:	e9 6a fa ff ff       	jmp    80106a00 <deallocuvm.part.0>
80106f96:	8d 76 00             	lea    0x0(%esi),%esi
80106f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106fa0:	89 d0                	mov    %edx,%eax
80106fa2:	5d                   	pop    %ebp
80106fa3:	c3                   	ret    
80106fa4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106faa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106fb0 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106fb0:	55                   	push   %ebp
80106fb1:	89 e5                	mov    %esp,%ebp
80106fb3:	57                   	push   %edi
80106fb4:	56                   	push   %esi
80106fb5:	53                   	push   %ebx
80106fb6:	83 ec 0c             	sub    $0xc,%esp
80106fb9:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106fbc:	85 f6                	test   %esi,%esi
80106fbe:	74 59                	je     80107019 <freevm+0x69>
80106fc0:	31 c9                	xor    %ecx,%ecx
80106fc2:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106fc7:	89 f0                	mov    %esi,%eax
80106fc9:	e8 32 fa ff ff       	call   80106a00 <deallocuvm.part.0>
80106fce:	89 f3                	mov    %esi,%ebx
80106fd0:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106fd6:	eb 0f                	jmp    80106fe7 <freevm+0x37>
80106fd8:	90                   	nop
80106fd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106fe0:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106fe3:	39 fb                	cmp    %edi,%ebx
80106fe5:	74 23                	je     8010700a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106fe7:	8b 03                	mov    (%ebx),%eax
80106fe9:	a8 01                	test   $0x1,%al
80106feb:	74 f3                	je     80106fe0 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
80106fed:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106ff2:	83 ec 0c             	sub    $0xc,%esp
80106ff5:	83 c3 04             	add    $0x4,%ebx
80106ff8:	05 00 00 00 80       	add    $0x80000000,%eax
80106ffd:	50                   	push   %eax
80106ffe:	e8 1d b4 ff ff       	call   80102420 <kfree>
80107003:	83 c4 10             	add    $0x10,%esp
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80107006:	39 fb                	cmp    %edi,%ebx
80107008:	75 dd                	jne    80106fe7 <freevm+0x37>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
8010700a:	89 75 08             	mov    %esi,0x8(%ebp)
}
8010700d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107010:	5b                   	pop    %ebx
80107011:	5e                   	pop    %esi
80107012:	5f                   	pop    %edi
80107013:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80107014:	e9 07 b4 ff ff       	jmp    80102420 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
80107019:	83 ec 0c             	sub    $0xc,%esp
8010701c:	68 b2 7b 10 80       	push   $0x80107bb2
80107021:	e8 4a 93 ff ff       	call   80100370 <panic>
80107026:	8d 76 00             	lea    0x0(%esi),%esi
80107029:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107030 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80107030:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107031:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80107033:	89 e5                	mov    %esp,%ebp
80107035:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107038:	8b 55 0c             	mov    0xc(%ebp),%edx
8010703b:	8b 45 08             	mov    0x8(%ebp),%eax
8010703e:	e8 ad f8 ff ff       	call   801068f0 <walkpgdir>
  if(pte == 0)
80107043:	85 c0                	test   %eax,%eax
80107045:	74 05                	je     8010704c <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80107047:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
8010704a:	c9                   	leave  
8010704b:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
8010704c:	83 ec 0c             	sub    $0xc,%esp
8010704f:	68 c3 7b 10 80       	push   $0x80107bc3
80107054:	e8 17 93 ff ff       	call   80100370 <panic>
80107059:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107060 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80107060:	55                   	push   %ebp
80107061:	89 e5                	mov    %esp,%ebp
80107063:	57                   	push   %edi
80107064:	56                   	push   %esi
80107065:	53                   	push   %ebx
80107066:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80107069:	e8 82 fb ff ff       	call   80106bf0 <setupkvm>
8010706e:	85 c0                	test   %eax,%eax
80107070:	89 45 e0             	mov    %eax,-0x20(%ebp)
80107073:	0f 84 b2 00 00 00    	je     8010712b <copyuvm+0xcb>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107079:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010707c:	85 c9                	test   %ecx,%ecx
8010707e:	0f 84 9c 00 00 00    	je     80107120 <copyuvm+0xc0>
80107084:	31 f6                	xor    %esi,%esi
80107086:	eb 4a                	jmp    801070d2 <copyuvm+0x72>
80107088:	90                   	nop
80107089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80107090:	83 ec 04             	sub    $0x4,%esp
80107093:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80107099:	68 00 10 00 00       	push   $0x1000
8010709e:	57                   	push   %edi
8010709f:	50                   	push   %eax
801070a0:	e8 0b d6 ff ff       	call   801046b0 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
801070a5:	58                   	pop    %eax
801070a6:	5a                   	pop    %edx
801070a7:	8d 93 00 00 00 80    	lea    -0x80000000(%ebx),%edx
801070ad:	8b 45 e0             	mov    -0x20(%ebp),%eax
801070b0:	ff 75 e4             	pushl  -0x1c(%ebp)
801070b3:	b9 00 10 00 00       	mov    $0x1000,%ecx
801070b8:	52                   	push   %edx
801070b9:	89 f2                	mov    %esi,%edx
801070bb:	e8 b0 f8 ff ff       	call   80106970 <mappages>
801070c0:	83 c4 10             	add    $0x10,%esp
801070c3:	85 c0                	test   %eax,%eax
801070c5:	78 3e                	js     80107105 <copyuvm+0xa5>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
801070c7:	81 c6 00 10 00 00    	add    $0x1000,%esi
801070cd:	39 75 0c             	cmp    %esi,0xc(%ebp)
801070d0:	76 4e                	jbe    80107120 <copyuvm+0xc0>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
801070d2:	8b 45 08             	mov    0x8(%ebp),%eax
801070d5:	31 c9                	xor    %ecx,%ecx
801070d7:	89 f2                	mov    %esi,%edx
801070d9:	e8 12 f8 ff ff       	call   801068f0 <walkpgdir>
801070de:	85 c0                	test   %eax,%eax
801070e0:	74 5a                	je     8010713c <copyuvm+0xdc>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
801070e2:	8b 18                	mov    (%eax),%ebx
801070e4:	f6 c3 01             	test   $0x1,%bl
801070e7:	74 46                	je     8010712f <copyuvm+0xcf>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
801070e9:	89 df                	mov    %ebx,%edi
    flags = PTE_FLAGS(*pte);
801070eb:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
801070f1:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
801070f4:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
801070fa:	e8 d1 b4 ff ff       	call   801025d0 <kalloc>
801070ff:	85 c0                	test   %eax,%eax
80107101:	89 c3                	mov    %eax,%ebx
80107103:	75 8b                	jne    80107090 <copyuvm+0x30>
      goto bad;
  }
  return d;

bad:
  freevm(d);
80107105:	83 ec 0c             	sub    $0xc,%esp
80107108:	ff 75 e0             	pushl  -0x20(%ebp)
8010710b:	e8 a0 fe ff ff       	call   80106fb0 <freevm>
  return 0;
80107110:	83 c4 10             	add    $0x10,%esp
80107113:	31 c0                	xor    %eax,%eax
}
80107115:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107118:	5b                   	pop    %ebx
80107119:	5e                   	pop    %esi
8010711a:	5f                   	pop    %edi
8010711b:	5d                   	pop    %ebp
8010711c:	c3                   	ret    
8010711d:	8d 76 00             	lea    0x0(%esi),%esi
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107120:	8b 45 e0             	mov    -0x20(%ebp),%eax
  return d;

bad:
  freevm(d);
  return 0;
}
80107123:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107126:	5b                   	pop    %ebx
80107127:	5e                   	pop    %esi
80107128:	5f                   	pop    %edi
80107129:	5d                   	pop    %ebp
8010712a:	c3                   	ret    
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
8010712b:	31 c0                	xor    %eax,%eax
8010712d:	eb e6                	jmp    80107115 <copyuvm+0xb5>
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
8010712f:	83 ec 0c             	sub    $0xc,%esp
80107132:	68 e7 7b 10 80       	push   $0x80107be7
80107137:	e8 34 92 ff ff       	call   80100370 <panic>

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
8010713c:	83 ec 0c             	sub    $0xc,%esp
8010713f:	68 cd 7b 10 80       	push   $0x80107bcd
80107144:	e8 27 92 ff ff       	call   80100370 <panic>
80107149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107150 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107150:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107151:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107153:	89 e5                	mov    %esp,%ebp
80107155:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107158:	8b 55 0c             	mov    0xc(%ebp),%edx
8010715b:	8b 45 08             	mov    0x8(%ebp),%eax
8010715e:	e8 8d f7 ff ff       	call   801068f0 <walkpgdir>
  if((*pte & PTE_P) == 0)
80107163:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
80107165:	89 c2                	mov    %eax,%edx
80107167:	83 e2 05             	and    $0x5,%edx
8010716a:	83 fa 05             	cmp    $0x5,%edx
8010716d:	75 11                	jne    80107180 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
8010716f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
}
80107174:	c9                   	leave  
  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80107175:	05 00 00 00 80       	add    $0x80000000,%eax
}
8010717a:	c3                   	ret    
8010717b:	90                   	nop
8010717c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
80107180:	31 c0                	xor    %eax,%eax
  return (char*)P2V(PTE_ADDR(*pte));
}
80107182:	c9                   	leave  
80107183:	c3                   	ret    
80107184:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010718a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107190 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107190:	55                   	push   %ebp
80107191:	89 e5                	mov    %esp,%ebp
80107193:	57                   	push   %edi
80107194:	56                   	push   %esi
80107195:	53                   	push   %ebx
80107196:	83 ec 1c             	sub    $0x1c,%esp
80107199:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010719c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010719f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801071a2:	85 db                	test   %ebx,%ebx
801071a4:	75 40                	jne    801071e6 <copyout+0x56>
801071a6:	eb 70                	jmp    80107218 <copyout+0x88>
801071a8:	90                   	nop
801071a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
801071b0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801071b3:	89 f1                	mov    %esi,%ecx
801071b5:	29 d1                	sub    %edx,%ecx
801071b7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
801071bd:	39 d9                	cmp    %ebx,%ecx
801071bf:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
801071c2:	29 f2                	sub    %esi,%edx
801071c4:	83 ec 04             	sub    $0x4,%esp
801071c7:	01 d0                	add    %edx,%eax
801071c9:	51                   	push   %ecx
801071ca:	57                   	push   %edi
801071cb:	50                   	push   %eax
801071cc:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801071cf:	e8 dc d4 ff ff       	call   801046b0 <memmove>
    len -= n;
    buf += n;
801071d4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801071d7:	83 c4 10             	add    $0x10,%esp
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
801071da:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
801071e0:	01 cf                	add    %ecx,%edi
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801071e2:	29 cb                	sub    %ecx,%ebx
801071e4:	74 32                	je     80107218 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
801071e6:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801071e8:	83 ec 08             	sub    $0x8,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
801071eb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801071ee:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801071f4:	56                   	push   %esi
801071f5:	ff 75 08             	pushl  0x8(%ebp)
801071f8:	e8 53 ff ff ff       	call   80107150 <uva2ka>
    if(pa0 == 0)
801071fd:	83 c4 10             	add    $0x10,%esp
80107200:	85 c0                	test   %eax,%eax
80107202:	75 ac                	jne    801071b0 <copyout+0x20>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80107204:	8d 65 f4             	lea    -0xc(%ebp),%esp
  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
80107207:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
8010720c:	5b                   	pop    %ebx
8010720d:	5e                   	pop    %esi
8010720e:	5f                   	pop    %edi
8010720f:	5d                   	pop    %ebp
80107210:	c3                   	ret    
80107211:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107218:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
8010721b:	31 c0                	xor    %eax,%eax
}
8010721d:	5b                   	pop    %ebx
8010721e:	5e                   	pop    %esi
8010721f:	5f                   	pop    %edi
80107220:	5d                   	pop    %ebp
80107221:	c3                   	ret    
