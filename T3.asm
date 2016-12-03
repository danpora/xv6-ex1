
_T3:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:


//producer process:
int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 28             	sub    $0x28,%esp
  14:	8b 41 04             	mov    0x4(%ecx),%eax
 char* fileName=argv[1];
 //printf(1,"numToAdd %s\n", argv[2]);
 int numToAdd=ourAtoi(argv[2]);
  17:	8b 50 08             	mov    0x8(%eax),%edx

//producer process:
int
main(int argc, char *argv[])
{
 char* fileName=argv[1];
  1a:	8b 70 04             	mov    0x4(%eax),%esi
    int res = 0;  // Initialize result
    int sign = 1;  // Initialize sign as positive
    int i = 0;  // Initialize index of first digit
      
    // If number is negative, then update sign
    if (str[0] == '-')
  1d:	31 c0                	xor    %eax,%eax
  1f:	80 3a 2d             	cmpb   $0x2d,(%edx)
  22:	0f 94 c0             	sete   %al
  25:	0f 95 c3             	setne  %bl
  28:	89 c1                	mov    %eax,%ecx
        sign = -1;  
        i++;  // Also update index of first digit
    }
      
    // Iterate through all digits and update the result
    for (; str[i] != '\0'; ++i)
  2a:	0f be 04 02          	movsbl (%edx,%eax,1),%eax
    int res = 0;  // Initialize result
    int sign = 1;  // Initialize sign as positive
    int i = 0;  // Initialize index of first digit
      
    // If number is negative, then update sign
    if (str[0] == '-')
  2e:	0f b6 db             	movzbl %bl,%ebx
  31:	8d 5c 1b ff          	lea    -0x1(%ebx,%ebx,1),%ebx
        sign = -1;  
        i++;  // Also update index of first digit
    }
      
    // Iterate through all digits and update the result
    for (; str[i] != '\0'; ++i)
  35:	84 c0                	test   %al,%al
  37:	0f 84 ee 00 00 00    	je     12b <main+0x12b>
  3d:	01 d1                	add    %edx,%ecx
  3f:	31 d2                	xor    %edx,%edx
  41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        res = res*10 + str[i] - '0';
  48:	8d 14 92             	lea    (%edx,%edx,4),%edx
  4b:	83 c1 01             	add    $0x1,%ecx
  4e:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
        sign = -1;  
        i++;  // Also update index of first digit
    }
      
    // Iterate through all digits and update the result
    for (; str[i] != '\0'; ++i)
  52:	0f be 01             	movsbl (%ecx),%eax
  55:	84 c0                	test   %al,%al
  57:	75 ef                	jne    48 <main+0x48>
 int numToAdd=ourAtoi(argv[2]);
 char copyResToOrgFile='\0';//[15];	


 //printf(0," open file= %s\n", fileName);
 int textFileDesc = open (fileName, O_RDWR);
  59:	83 ec 08             	sub    $0x8,%esp
main(int argc, char *argv[])
{
 char* fileName=argv[1];
 //printf(1,"numToAdd %s\n", argv[2]);
 int numToAdd=ourAtoi(argv[2]);
 char copyResToOrgFile='\0';//[15];	
  5c:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)


 //printf(0," open file= %s\n", fileName);
 int textFileDesc = open (fileName, O_RDWR);
  60:	6a 02                	push   $0x2
  62:	56                   	push   %esi
    // Iterate through all digits and update the result
    for (; str[i] != '\0'; ++i)
        res = res*10 + str[i] - '0';
    
    // Return result with sign
    return sign*res;
  63:	0f af da             	imul   %edx,%ebx
 int numToAdd=ourAtoi(argv[2]);
 char copyResToOrgFile='\0';//[15];	


 //printf(0," open file= %s\n", fileName);
 int textFileDesc = open (fileName, O_RDWR);
  66:	e8 57 08 00 00       	call   8c2 <open>
  6b:	89 c7                	mov    %eax,%edi
 //temp file to write to the result + non-number chars      
 int tempF = open ("tempFile",O_CREATE | O_RDWR);  
  6d:	58                   	pop    %eax
  6e:	5a                   	pop    %edx
  6f:	68 02 02 00 00       	push   $0x202
  74:	68 f0 0c 00 00       	push   $0xcf0
  79:	e8 44 08 00 00       	call   8c2 <open>

 Task3Action(numToAdd,textFileDesc,tempF);
  7e:	83 c4 0c             	add    $0xc,%esp
  81:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  84:	50                   	push   %eax
  85:	57                   	push   %edi
  86:	53                   	push   %ebx
  87:	e8 64 03 00 00       	call   3f0 <Task3Action>
 printf(1,"modifing the given %s file...\n",fileName);
  8c:	83 c4 0c             	add    $0xc,%esp
  8f:	56                   	push   %esi
  90:	68 fc 0c 00 00       	push   $0xcfc
  95:	6a 01                	push   $0x1
  97:	e8 34 09 00 00       	call   9d0 <printf>

 close(textFileDesc);
  9c:	89 3c 24             	mov    %edi,(%esp)
  9f:	e8 06 08 00 00       	call   8aa <close>
 textFileDesc = open (fileName,O_CREATE | O_RDWR);  
  a4:	59                   	pop    %ecx
  a5:	5b                   	pop    %ebx
  a6:	68 02 02 00 00       	push   $0x202
  ab:	56                   	push   %esi
  ac:	8d 5d e7             	lea    -0x19(%ebp),%ebx
  af:	e8 0e 08 00 00       	call   8c2 <open>
 close(tempF);
  b4:	8b 55 d4             	mov    -0x2c(%ebp),%edx

 Task3Action(numToAdd,textFileDesc,tempF);
 printf(1,"modifing the given %s file...\n",fileName);

 close(textFileDesc);
 textFileDesc = open (fileName,O_CREATE | O_RDWR);  
  b7:	89 c7                	mov    %eax,%edi
 close(tempF);
  b9:	89 14 24             	mov    %edx,(%esp)
  bc:	e8 e9 07 00 00       	call   8aa <close>
 tempF = open ("tempFile",O_CREATE | O_RDWR);  
  c1:	5e                   	pop    %esi
  c2:	58                   	pop    %eax
  c3:	68 02 02 00 00       	push   $0x202
  c8:	68 f0 0c 00 00       	push   $0xcf0
  cd:	e8 f0 07 00 00       	call   8c2 <open>


  while ((read(tempF, &copyResToOrgFile, 1)) != 0){
  d2:	83 c4 10             	add    $0x10,%esp
 printf(1,"modifing the given %s file...\n",fileName);

 close(textFileDesc);
 textFileDesc = open (fileName,O_CREATE | O_RDWR);  
 close(tempF);
 tempF = open ("tempFile",O_CREATE | O_RDWR);  
  d5:	89 c6                	mov    %eax,%esi


  while ((read(tempF, &copyResToOrgFile, 1)) != 0){
  d7:	eb 16                	jmp    ef <main+0xef>
  d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     write(textFileDesc, &copyResToOrgFile, 1);
  e0:	83 ec 04             	sub    $0x4,%esp
  e3:	6a 01                	push   $0x1
  e5:	53                   	push   %ebx
  e6:	57                   	push   %edi
  e7:	e8 b6 07 00 00       	call   8a2 <write>
  ec:	83 c4 10             	add    $0x10,%esp
 textFileDesc = open (fileName,O_CREATE | O_RDWR);  
 close(tempF);
 tempF = open ("tempFile",O_CREATE | O_RDWR);  


  while ((read(tempF, &copyResToOrgFile, 1)) != 0){
  ef:	83 ec 04             	sub    $0x4,%esp
  f2:	6a 01                	push   $0x1
  f4:	53                   	push   %ebx
  f5:	56                   	push   %esi
  f6:	e8 9f 07 00 00       	call   89a <read>
  fb:	83 c4 10             	add    $0x10,%esp
  fe:	85 c0                	test   %eax,%eax
 100:	75 de                	jne    e0 <main+0xe0>
     write(textFileDesc, &copyResToOrgFile, 1);
  }	

unlink("tempFile");  //deleting the temp file after copping it to the ogiven file
 102:	83 ec 0c             	sub    $0xc,%esp
 105:	68 f0 0c 00 00       	push   $0xcf0
 10a:	e8 c3 07 00 00       	call   8d2 <unlink>

close(tempF);
 10f:	89 34 24             	mov    %esi,(%esp)
 112:	e8 93 07 00 00       	call   8aa <close>
close(textFileDesc);
 117:	89 3c 24             	mov    %edi,(%esp)
 11a:	e8 8b 07 00 00       	call   8aa <close>
 exit(0);
 11f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 126:	e8 57 07 00 00       	call   882 <exit>
        sign = -1;  
        i++;  // Also update index of first digit
    }
      
    // Iterate through all digits and update the result
    for (; str[i] != '\0'; ++i)
 12b:	31 d2                	xor    %edx,%edx
 12d:	e9 27 ff ff ff       	jmp    59 <main+0x59>
 132:	66 90                	xchg   %ax,%ax
 134:	66 90                	xchg   %ax,%ax
 136:	66 90                	xchg   %ax,%ax
 138:	66 90                	xchg   %ax,%ax
 13a:	66 90                	xchg   %ax,%ax
 13c:	66 90                	xchg   %ax,%ax
 13e:	66 90                	xchg   %ax,%ax

00000140 <itoa.part.0>:
    ArratToClean[i]='\0';
 }
}

// Implementation of itoa() - convert int to String 
char* itoa(int num, char* str, int base)
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	56                   	push   %esi
 145:	53                   	push   %ebx
 146:	89 d3                	mov    %edx,%ebx
        return str;
    }
 
    // In standard itoa(), negative numbers are handled only with 
    // base 10. Otherwise numbers are considered unsigned.
    if (num < 0 && base == 10)
 148:	89 c2                	mov    %eax,%edx
 14a:	c1 ea 1f             	shr    $0x1f,%edx
    ArratToClean[i]='\0';
 }
}

// Implementation of itoa() - convert int to String 
char* itoa(int num, char* str, int base)
 14d:	83 ec 0c             	sub    $0xc,%esp
        return str;
    }
 
    // In standard itoa(), negative numbers are handled only with 
    // base 10. Otherwise numbers are considered unsigned.
    if (num < 0 && base == 10)
 150:	84 d2                	test   %dl,%dl
    ArratToClean[i]='\0';
 }
}

// Implementation of itoa() - convert int to String 
char* itoa(int num, char* str, int base)
 152:	89 4d ec             	mov    %ecx,-0x14(%ebp)
        return str;
    }
 
    // In standard itoa(), negative numbers are handled only with 
    // base 10. Otherwise numbers are considered unsigned.
    if (num < 0 && base == 10)
 155:	0f 84 8d 00 00 00    	je     1e8 <itoa.part.0+0xa8>
 15b:	83 f9 0a             	cmp    $0xa,%ecx
 15e:	0f 85 84 00 00 00    	jne    1e8 <itoa.part.0+0xa8>
    {
        isNegative = 1; //true
        num = -num;
 164:	f7 d8                	neg    %eax
 
    // In standard itoa(), negative numbers are handled only with 
    // base 10. Otherwise numbers are considered unsigned.
    if (num < 0 && base == 10)
    {
        isNegative = 1; //true
 166:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)

// Implementation of itoa() - convert int to String 
char* itoa(int num, char* str, int base)
{
    int i = 0;
    int isNegative = 0;  //false
 16d:	31 ff                	xor    %edi,%edi
 16f:	89 5d f0             	mov    %ebx,-0x10(%ebp)
 172:	89 fb                	mov    %edi,%ebx
 174:	eb 0c                	jmp    182 <itoa.part.0+0x42>
 176:	8d 76 00             	lea    0x0(%esi),%esi
 179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 
    // Process individual digits
    while (num != 0)
    {
        int rem = num % base;
        str[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
 180:	89 fb                	mov    %edi,%ebx
    }
 
    // Process individual digits
    while (num != 0)
    {
        int rem = num % base;
 182:	99                   	cltd   
        str[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
 183:	8d 7b 01             	lea    0x1(%ebx),%edi
    }
 
    // Process individual digits
    while (num != 0)
    {
        int rem = num % base;
 186:	f7 7d ec             	idivl  -0x14(%ebp)
        str[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
 189:	8d 72 57             	lea    0x57(%edx),%esi
 18c:	8d 4a 30             	lea    0x30(%edx),%ecx
 18f:	83 fa 0a             	cmp    $0xa,%edx
 192:	0f 4d ce             	cmovge %esi,%ecx
 195:	8b 75 f0             	mov    -0x10(%ebp),%esi
        isNegative = 1; //true
        num = -num;
    }
 
    // Process individual digits
    while (num != 0)
 198:	85 c0                	test   %eax,%eax
    {
        int rem = num % base;
        str[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
 19a:	88 4c 3e ff          	mov    %cl,-0x1(%esi,%edi,1)
        isNegative = 1; //true
        num = -num;
    }
 
    // Process individual digits
    while (num != 0)
 19e:	75 e0                	jne    180 <itoa.part.0+0x40>
        str[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
        num = num/base;
    }
 
    // If number is negative, append '-'
    if (isNegative)
 1a0:	8b 55 e8             	mov    -0x18(%ebp),%edx
 1a3:	89 d8                	mov    %ebx,%eax
 1a5:	89 f3                	mov    %esi,%ebx
 1a7:	85 d2                	test   %edx,%edx
 1a9:	74 55                	je     200 <itoa.part.0+0xc0>
 1ab:	89 c2                	mov    %eax,%edx
        str[i++] = '-';
 1ad:	c6 04 3e 2d          	movb   $0x2d,(%esi,%edi,1)
 1b1:	89 f8                	mov    %edi,%eax
 1b3:	83 c2 02             	add    $0x2,%edx
 
    str[i] = '\0'; // Append string terminator
 1b6:	c6 04 13 00          	movb   $0x0,(%ebx,%edx,1)
//revers string 
void my_reverse(char str[], int len)
{
    int start, end;
    char temp;
    for(start=0, end=len-1; start < end; start++, end--) {
 1ba:	31 d2                	xor    %edx,%edx
 1bc:	85 c0                	test   %eax,%eax
 1be:	74 1a                	je     1da <itoa.part.0+0x9a>
        temp = *(str+start);
 1c0:	0f b6 3c 13          	movzbl (%ebx,%edx,1),%edi
        *(str+start) = *(str+end);
 1c4:	0f b6 0c 03          	movzbl (%ebx,%eax,1),%ecx
 1c8:	88 0c 13             	mov    %cl,(%ebx,%edx,1)
        *(str+end) = temp;
 1cb:	89 f9                	mov    %edi,%ecx
//revers string 
void my_reverse(char str[], int len)
{
    int start, end;
    char temp;
    for(start=0, end=len-1; start < end; start++, end--) {
 1cd:	83 c2 01             	add    $0x1,%edx
        temp = *(str+start);
        *(str+start) = *(str+end);
        *(str+end) = temp;
 1d0:	88 0c 03             	mov    %cl,(%ebx,%eax,1)
//revers string 
void my_reverse(char str[], int len)
{
    int start, end;
    char temp;
    for(start=0, end=len-1; start < end; start++, end--) {
 1d3:	83 e8 01             	sub    $0x1,%eax
 1d6:	39 c2                	cmp    %eax,%edx
 1d8:	7c e6                	jl     1c0 <itoa.part.0+0x80>
 
    // Reverse the string
    my_reverse(str, i);
 
    return str;
}
 1da:	83 c4 0c             	add    $0xc,%esp
 1dd:	31 c0                	xor    %eax,%eax
 1df:	5b                   	pop    %ebx
 1e0:	5e                   	pop    %esi
 1e1:	5f                   	pop    %edi
 1e2:	5d                   	pop    %ebp
 1e3:	c3                   	ret    
 1e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        isNegative = 1; //true
        num = -num;
    }
 
    // Process individual digits
    while (num != 0)
 1e8:	85 c0                	test   %eax,%eax

// Implementation of itoa() - convert int to String 
char* itoa(int num, char* str, int base)
{
    int i = 0;
    int isNegative = 0;  //false
 1ea:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
        isNegative = 1; //true
        num = -num;
    }
 
    // Process individual digits
    while (num != 0)
 1f1:	0f 85 76 ff ff ff    	jne    16d <itoa.part.0+0x2d>
 
    // If number is negative, append '-'
    if (isNegative)
        str[i++] = '-';
 
    str[i] = '\0'; // Append string terminator
 1f7:	c6 03 00             	movb   $0x0,(%ebx)
 1fa:	eb de                	jmp    1da <itoa.part.0+0x9a>
 1fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        str[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
        num = num/base;
    }
 
    // If number is negative, append '-'
    if (isNegative)
 200:	89 fa                	mov    %edi,%edx
 202:	eb b2                	jmp    1b6 <itoa.part.0+0x76>
 204:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 20a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000210 <ourAtoi>:
#include "user.h"
#include "fcntl.h"

// our own atoi() function - convert string to int
int ourAtoi(char *str)
{
 210:	55                   	push   %ebp
    int res = 0;  // Initialize result
    int sign = 1;  // Initialize sign as positive
    int i = 0;  // Initialize index of first digit
      
    // If number is negative, then update sign
    if (str[0] == '-')
 211:	31 d2                	xor    %edx,%edx
#include "user.h"
#include "fcntl.h"

// our own atoi() function - convert string to int
int ourAtoi(char *str)
{
 213:	89 e5                	mov    %esp,%ebp
 215:	53                   	push   %ebx
 216:	8b 45 08             	mov    0x8(%ebp),%eax
    int res = 0;  // Initialize result
    int sign = 1;  // Initialize sign as positive
    int i = 0;  // Initialize index of first digit
      
    // If number is negative, then update sign
    if (str[0] == '-')
 219:	80 38 2d             	cmpb   $0x2d,(%eax)
 21c:	0f 94 c2             	sete   %dl
 21f:	0f 95 c3             	setne  %bl
 222:	89 d1                	mov    %edx,%ecx
        sign = -1;  
        i++;  // Also update index of first digit
    }
      
    // Iterate through all digits and update the result
    for (; str[i] != '\0'; ++i)
 224:	0f be 14 10          	movsbl (%eax,%edx,1),%edx
 228:	84 d2                	test   %dl,%dl
 22a:	74 2b                	je     257 <ourAtoi+0x47>
 22c:	0f b6 db             	movzbl %bl,%ebx
 22f:	01 c1                	add    %eax,%ecx
 231:	31 c0                	xor    %eax,%eax
 233:	8d 5c 1b ff          	lea    -0x1(%ebx,%ebx,1),%ebx
 237:	89 f6                	mov    %esi,%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        res = res*10 + str[i] - '0';
 240:	8d 04 80             	lea    (%eax,%eax,4),%eax
 243:	83 c1 01             	add    $0x1,%ecx
 246:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
        sign = -1;  
        i++;  // Also update index of first digit
    }
      
    // Iterate through all digits and update the result
    for (; str[i] != '\0'; ++i)
 24a:	0f be 11             	movsbl (%ecx),%edx
 24d:	84 d2                	test   %dl,%dl
 24f:	75 ef                	jne    240 <ourAtoi+0x30>
 251:	0f af c3             	imul   %ebx,%eax
        res = res*10 + str[i] - '0';
    
    // Return result with sign
    return sign*res;
}
 254:	5b                   	pop    %ebx
 255:	5d                   	pop    %ebp
 256:	c3                   	ret    
        sign = -1;  
        i++;  // Also update index of first digit
    }
      
    // Iterate through all digits and update the result
    for (; str[i] != '\0'; ++i)
 257:	31 c0                	xor    %eax,%eax
 259:	eb f9                	jmp    254 <ourAtoi+0x44>
 25b:	90                   	nop
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000260 <my_reverse>:
    return sign*res;
}

//revers string 
void my_reverse(char str[], int len)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	56                   	push   %esi
 264:	53                   	push   %ebx
    int start, end;
    char temp;
    for(start=0, end=len-1; start < end; start++, end--) {
 265:	8b 45 0c             	mov    0xc(%ebp),%eax
    return sign*res;
}

//revers string 
void my_reverse(char str[], int len)
{
 268:	8b 4d 08             	mov    0x8(%ebp),%ecx
    int start, end;
    char temp;
    for(start=0, end=len-1; start < end; start++, end--) {
 26b:	83 e8 01             	sub    $0x1,%eax
 26e:	85 c0                	test   %eax,%eax
 270:	7e 20                	jle    292 <my_reverse+0x32>
 272:	31 d2                	xor    %edx,%edx
 274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        temp = *(str+start);
 278:	0f b6 34 11          	movzbl (%ecx,%edx,1),%esi
        *(str+start) = *(str+end);
 27c:	0f b6 1c 01          	movzbl (%ecx,%eax,1),%ebx
 280:	88 1c 11             	mov    %bl,(%ecx,%edx,1)
        *(str+end) = temp;
 283:	89 f3                	mov    %esi,%ebx
//revers string 
void my_reverse(char str[], int len)
{
    int start, end;
    char temp;
    for(start=0, end=len-1; start < end; start++, end--) {
 285:	83 c2 01             	add    $0x1,%edx
        temp = *(str+start);
        *(str+start) = *(str+end);
        *(str+end) = temp;
 288:	88 1c 01             	mov    %bl,(%ecx,%eax,1)
//revers string 
void my_reverse(char str[], int len)
{
    int start, end;
    char temp;
    for(start=0, end=len-1; start < end; start++, end--) {
 28b:	83 e8 01             	sub    $0x1,%eax
 28e:	39 c2                	cmp    %eax,%edx
 290:	7c e6                	jl     278 <my_reverse+0x18>
        temp = *(str+start);
        *(str+start) = *(str+end);
        *(str+end) = temp;
    }
}
 292:	5b                   	pop    %ebx
 293:	5e                   	pop    %esi
 294:	5d                   	pop    %ebp
 295:	c3                   	ret    
 296:	8d 76 00             	lea    0x0(%esi),%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <cleanArray>:


void cleanArray(char* ArratToClean, int size){
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 2a6:	8b 45 08             	mov    0x8(%ebp),%eax

 for(int i=0;i<size;i++){
 2a9:	85 c9                	test   %ecx,%ecx
 2ab:	8d 14 08             	lea    (%eax,%ecx,1),%edx
 2ae:	7e 0a                	jle    2ba <cleanArray+0x1a>
    ArratToClean[i]='\0';
 2b0:	c6 00 00             	movb   $0x0,(%eax)
 2b3:	83 c0 01             	add    $0x1,%eax
}


void cleanArray(char* ArratToClean, int size){

 for(int i=0;i<size;i++){
 2b6:	39 d0                	cmp    %edx,%eax
 2b8:	75 f6                	jne    2b0 <cleanArray+0x10>
    ArratToClean[i]='\0';
 }
}
 2ba:	5d                   	pop    %ebp
 2bb:	c3                   	ret    
 2bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002c0 <itoa>:

// Implementation of itoa() - convert int to String 
char* itoa(int num, char* str, int base)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 45 08             	mov    0x8(%ebp),%eax
 2c7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
    int i = 0;
    int isNegative = 0;  //false
 
    /* Handle 0 explicitely, otherwise empty string is printed for 0 */
    if (num == 0)
 2ca:	85 c0                	test   %eax,%eax
 2cc:	74 12                	je     2e0 <itoa+0x20>
 2ce:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2d1:	89 da                	mov    %ebx,%edx
 2d3:	e8 68 fe ff ff       	call   140 <itoa.part.0>
 
    // Reverse the string
    my_reverse(str, i);
 
    return str;
}
 2d8:	89 d8                	mov    %ebx,%eax
 2da:	5b                   	pop    %ebx
 2db:	5d                   	pop    %ebp
 2dc:	c3                   	ret    
 2dd:	8d 76 00             	lea    0x0(%esi),%esi
    int isNegative = 0;  //false
 
    /* Handle 0 explicitely, otherwise empty string is printed for 0 */
    if (num == 0)
    {
        str[i++] = '0';
 2e0:	c6 03 30             	movb   $0x30,(%ebx)
        str[i] = '\0';
 2e3:	c6 43 01 00          	movb   $0x0,0x1(%ebx)
 
    // Reverse the string
    my_reverse(str, i);
 
    return str;
}
 2e7:	89 d8                	mov    %ebx,%eax
 2e9:	5b                   	pop    %ebx
 2ea:	5d                   	pop    %ebp
 2eb:	c3                   	ret    
 2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002f0 <ChildCode>:
//children code as function
//every child read from a different pipe(fd_ChildePipe_Array[i]) just for him
//all childs write to the same pipe (fd_ProducerPipe)


void ChildCode(int* readFromPipe,int* writeToPipe,int numToAdd){
 2f0:	55                   	push   %ebp
       
    char readNum[15]={'\0'}; 
 2f1:	31 c0                	xor    %eax,%eax
//children code as function
//every child read from a different pipe(fd_ChildePipe_Array[i]) just for him
//all childs write to the same pipe (fd_ProducerPipe)


void ChildCode(int* readFromPipe,int* writeToPipe,int numToAdd){
 2f3:	89 e5                	mov    %esp,%ebp
 2f5:	57                   	push   %edi
 2f6:	56                   	push   %esi
 2f7:	53                   	push   %ebx
 2f8:	8d 5d d9             	lea    -0x27(%ebp),%ebx
 2fb:	8d 75 e8             	lea    -0x18(%ebp),%esi
 2fe:	83 ec 38             	sub    $0x38,%esp
       
    char readNum[15]={'\0'}; 
 301:	66 89 45 e5          	mov    %ax,-0x1b(%ebp)
    int childNum=0;
    //printf(0,"child1\n");
    dup(readFromPipe[0]); //dup just the pipe child1 read from
 305:	8b 45 08             	mov    0x8(%ebp),%eax
//all childs write to the same pipe (fd_ProducerPipe)


void ChildCode(int* readFromPipe,int* writeToPipe,int numToAdd){
       
    char readNum[15]={'\0'}; 
 308:	c7 45 d9 00 00 00 00 	movl   $0x0,-0x27(%ebp)
 30f:	c7 45 dd 00 00 00 00 	movl   $0x0,-0x23(%ebp)
 316:	c7 45 e1 00 00 00 00 	movl   $0x0,-0x1f(%ebp)
 31d:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
    int childNum=0;
    //printf(0,"child1\n");
    dup(readFromPipe[0]); //dup just the pipe child1 read from
 321:	ff 30                	pushl  (%eax)


void ChildCode(int* readFromPipe,int* writeToPipe,int numToAdd){
       
    char readNum[15]={'\0'}; 
    int childNum=0;
 323:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    //printf(0,"child1\n");
    dup(readFromPipe[0]); //dup just the pipe child1 read from
 32a:	e8 cb 05 00 00       	call   8fa <dup>
 32f:	83 c4 10             	add    $0x10,%esp
 332:	89 d8                	mov    %ebx,%eax
 334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi


void cleanArray(char* ArratToClean, int size){

 for(int i=0;i<size;i++){
    ArratToClean[i]='\0';
 338:	c6 00 00             	movb   $0x0,(%eax)
 33b:	83 c0 01             	add    $0x1,%eax
}


void cleanArray(char* ArratToClean, int size){

 for(int i=0;i<size;i++){
 33e:	39 f0                	cmp    %esi,%eax
 340:	75 f6                	jne    338 <ChildCode+0x48>
 342:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    char readNum[15]={'\0'}; 
    int childNum=0;
    //printf(0,"child1\n");
    dup(readFromPipe[0]); //dup just the pipe child1 read from
    cleanArray(readNum, 15);  
    while ((read(readFromPipe[0], readNum, 15)) != 0){         
 348:	8b 45 08             	mov    0x8(%ebp),%eax
 34b:	83 ec 04             	sub    $0x4,%esp
 34e:	6a 0f                	push   $0xf
 350:	53                   	push   %ebx
 351:	ff 30                	pushl  (%eax)
 353:	e8 42 05 00 00       	call   89a <read>
 358:	83 c4 10             	add    $0x10,%esp
 35b:	85 c0                	test   %eax,%eax
 35d:	74 7f                	je     3de <ChildCode+0xee>
    int res = 0;  // Initialize result
    int sign = 1;  // Initialize sign as positive
    int i = 0;  // Initialize index of first digit
      
    // If number is negative, then update sign
    if (str[0] == '-')
 35f:	0f be 45 d9          	movsbl -0x27(%ebp),%eax
int ourAtoi(char *str)
{

    int res = 0;  // Initialize result
    int sign = 1;  // Initialize sign as positive
    int i = 0;  // Initialize index of first digit
 363:	31 d2                	xor    %edx,%edx
// our own atoi() function - convert string to int
int ourAtoi(char *str)
{

    int res = 0;  // Initialize result
    int sign = 1;  // Initialize sign as positive
 365:	bf 01 00 00 00       	mov    $0x1,%edi
    int i = 0;  // Initialize index of first digit
      
    // If number is negative, then update sign
    if (str[0] == '-')
 36a:	3c 2d                	cmp    $0x2d,%al
 36c:	74 5a                	je     3c8 <ChildCode+0xd8>
        sign = -1;  
        i++;  // Also update index of first digit
    }
      
    // Iterate through all digits and update the result
    for (; str[i] != '\0'; ++i)
 36e:	84 c0                	test   %al,%al
 370:	74 68                	je     3da <ChildCode+0xea>
 372:	8d 4c 13 01          	lea    0x1(%ebx,%edx,1),%ecx
 376:	31 d2                	xor    %edx,%edx
 378:	90                   	nop
 379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        res = res*10 + str[i] - '0';
 380:	8d 14 92             	lea    (%edx,%edx,4),%edx
 383:	83 c1 01             	add    $0x1,%ecx
 386:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
        sign = -1;  
        i++;  // Also update index of first digit
    }
      
    // Iterate through all digits and update the result
    for (; str[i] != '\0'; ++i)
 38a:	0f be 41 ff          	movsbl -0x1(%ecx),%eax
 38e:	84 c0                	test   %al,%al
 390:	75 ee                	jne    380 <ChildCode+0x90>
 392:	0f af d7             	imul   %edi,%edx
    dup(readFromPipe[0]); //dup just the pipe child1 read from
    cleanArray(readNum, 15);  
    while ((read(readFromPipe[0], readNum, 15)) != 0){         
	//printf(1,"readNum1= %s \n",readNum);
	//printf(0,"child1 after read\n");
	childNum= numToAdd+ ourAtoi(readNum);
 395:	03 55 10             	add    0x10(%ebp),%edx
 398:	89 d8                	mov    %ebx,%eax
 39a:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 39d:	8d 76 00             	lea    0x0(%esi),%esi


void cleanArray(char* ArratToClean, int size){

 for(int i=0;i<size;i++){
    ArratToClean[i]='\0';
 3a0:	c6 00 00             	movb   $0x0,(%eax)
 3a3:	83 c0 01             	add    $0x1,%eax
}


void cleanArray(char* ArratToClean, int size){

 for(int i=0;i<size;i++){
 3a6:	39 c6                	cmp    %eax,%esi
 3a8:	75 f6                	jne    3a0 <ChildCode+0xb0>
	childNum= numToAdd+ ourAtoi(readNum);
        cleanArray(readNum, 15);  
	//printf(1,"numToAdd=%d \n",numToAdd);
	//printf(1,"ourAtoi(readNum)=%d \n",ourAtoi(readNum));
	//printf(1,"childNum2=%d \n",childNum);
	write(writeToPipe[1], &childNum, sizeof(childNum));
 3aa:	8d 45 d4             	lea    -0x2c(%ebp),%eax
 3ad:	83 ec 04             	sub    $0x4,%esp
 3b0:	6a 04                	push   $0x4
 3b2:	50                   	push   %eax
 3b3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b6:	ff 70 04             	pushl  0x4(%eax)
 3b9:	e8 e4 04 00 00       	call   8a2 <write>
 3be:	83 c4 10             	add    $0x10,%esp
 3c1:	eb 85                	jmp    348 <ChildCode+0x58>
 3c3:	90                   	nop
 3c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3c8:	0f be 45 da          	movsbl -0x26(%ebp),%eax
      
    // If number is negative, then update sign
    if (str[0] == '-')
    {
        sign = -1;  
        i++;  // Also update index of first digit
 3cc:	ba 01 00 00 00       	mov    $0x1,%edx
    int i = 0;  // Initialize index of first digit
      
    // If number is negative, then update sign
    if (str[0] == '-')
    {
        sign = -1;  
 3d1:	bf ff ff ff ff       	mov    $0xffffffff,%edi
        i++;  // Also update index of first digit
    }
      
    // Iterate through all digits and update the result
    for (; str[i] != '\0'; ++i)
 3d6:	84 c0                	test   %al,%al
 3d8:	75 98                	jne    372 <ChildCode+0x82>
 3da:	31 d2                	xor    %edx,%edx
 3dc:	eb b7                	jmp    395 <ChildCode+0xa5>
	//printf(1,"ourAtoi(readNum)=%d \n",ourAtoi(readNum));
	//printf(1,"childNum2=%d \n",childNum);
	write(writeToPipe[1], &childNum, sizeof(childNum));

   }
}
 3de:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3e1:	5b                   	pop    %ebx
 3e2:	5e                   	pop    %esi
 3e3:	5f                   	pop    %edi
 3e4:	5d                   	pop    %ebp
 3e5:	c3                   	ret    
 3e6:	8d 76 00             	lea    0x0(%esi),%esi
 3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003f0 <Task3Action>:




void
Task3Action(int ToAddNumber,int textFD,int tempFileFD ){
 3f0:	55                   	push   %ebp
 int fd_ChildePipe_Array[3][2]; 
 int numOfChildren=3;
 int digitNum=0;
 char readChar='\0';
 char prevReadChar='\0';
 char readNum[15]={'\0'}; 
 3f1:	31 c9                	xor    %ecx,%ecx




void
Task3Action(int ToAddNumber,int textFD,int tempFileFD ){
 3f3:	89 e5                	mov    %esp,%ebp
 3f5:	57                   	push   %edi
 3f6:	56                   	push   %esi
 3f7:	53                   	push   %ebx
 int res=0; 
 char wrResToFile[15];	


 int fd_ProducerPipe[2];   //read and write FD
 pipe(fd_ProducerPipe);  //producer only write to this pipe (in [0])
 3f8:	8d 75 a8             	lea    -0x58(%ebp),%esi

 for(int j=0; j<numOfChildren;j++){  //children pipes
  pipe(fd_ChildePipe_Array[j]); 
 3fb:	8d 5d d0             	lea    -0x30(%ebp),%ebx




void
Task3Action(int ToAddNumber,int textFD,int tempFileFD ){
 3fe:	83 ec 78             	sub    $0x78,%esp
 int fd_ChildePipe_Array[3][2]; 
 int numOfChildren=3;
 int digitNum=0;
 char readChar='\0';
 char prevReadChar='\0';
 char readNum[15]={'\0'}; 
 401:	66 89 4d be          	mov    %cx,-0x42(%ebp)
//
 int pidArray[3];
 int fd_ChildePipe_Array[3][2]; 
 int numOfChildren=3;
 int digitNum=0;
 char readChar='\0';
 405:	c6 45 a3 00          	movb   $0x0,-0x5d(%ebp)
 int res=0; 
 char wrResToFile[15];	


 int fd_ProducerPipe[2];   //read and write FD
 pipe(fd_ProducerPipe);  //producer only write to this pipe (in [0])
 409:	56                   	push   %esi
 int fd_ChildePipe_Array[3][2]; 
 int numOfChildren=3;
 int digitNum=0;
 char readChar='\0';
 char prevReadChar='\0';
 char readNum[15]={'\0'}; 
 40a:	c7 45 b2 00 00 00 00 	movl   $0x0,-0x4e(%ebp)

 int fd_ProducerPipe[2];   //read and write FD
 pipe(fd_ProducerPipe);  //producer only write to this pipe (in [0])

 for(int j=0; j<numOfChildren;j++){  //children pipes
  pipe(fd_ChildePipe_Array[j]); 
 411:	89 df                	mov    %ebx,%edi
 int fd_ChildePipe_Array[3][2]; 
 int numOfChildren=3;
 int digitNum=0;
 char readChar='\0';
 char prevReadChar='\0';
 char readNum[15]={'\0'}; 
 413:	c7 45 b6 00 00 00 00 	movl   $0x0,-0x4a(%ebp)
 41a:	c7 45 ba 00 00 00 00 	movl   $0x0,-0x46(%ebp)
 421:	c6 45 c0 00          	movb   $0x0,-0x40(%ebp)
 int res=0; 
 425:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
 char wrResToFile[15];	


 int fd_ProducerPipe[2];   //read and write FD
 pipe(fd_ProducerPipe);  //producer only write to this pipe (in [0])
 42c:	e8 61 04 00 00       	call   892 <pipe>

 for(int j=0; j<numOfChildren;j++){  //children pipes
  pipe(fd_ChildePipe_Array[j]); 
 431:	89 1c 24             	mov    %ebx,(%esp)
 434:	e8 59 04 00 00       	call   892 <pipe>
 439:	8d 45 d8             	lea    -0x28(%ebp),%eax
 43c:	89 04 24             	mov    %eax,(%esp)
 43f:	e8 4e 04 00 00       	call   892 <pipe>
 444:	8d 45 e0             	lea    -0x20(%ebp),%eax
 447:	89 04 24             	mov    %eax,(%esp)
 44a:	e8 43 04 00 00       	call   892 <pipe>
 44f:	89 5d 8c             	mov    %ebx,-0x74(%ebp)
 452:	83 c4 10             	add    $0x10,%esp
 }


 for(int i=0; i<numOfChildren;i++){
   
   pidArray[i] = fork();
 455:	e8 20 04 00 00       	call   87a <fork>

   if(pidArray[i]<0){
 45a:	85 c0                	test   %eax,%eax
 45c:	0f 88 c7 01 00 00    	js     629 <Task3Action+0x239>
       //printf(1,"fork error occured\n");
       exit(0);
   }
   else if(pidArray[i]==0){  //do child task
 462:	0f 84 98 01 00 00    	je     600 <Task3Action+0x210>
 for(int j=0; j<numOfChildren;j++){  //children pipes
  pipe(fd_ChildePipe_Array[j]); 
 }


 for(int i=0; i<numOfChildren;i++){
 468:	8d 45 e8             	lea    -0x18(%ebp),%eax
 46b:	83 c7 08             	add    $0x8,%edi
 46e:	39 c7                	cmp    %eax,%edi
 470:	75 e3                	jne    455 <Task3Action+0x65>
 472:	89 5d 90             	mov    %ebx,-0x70(%ebp)
 475:	8d 7d a3             	lea    -0x5d(%ebp),%edi
 478:	8d 5d c1             	lea    -0x3f(%ebp),%ebx
 47b:	c6 45 97 00          	movb   $0x0,-0x69(%ebp)
 47f:	31 f6                	xor    %esi,%esi

 int fd_ProducerPipe[2];   //read and write FD
 pipe(fd_ProducerPipe);  //producer only write to this pipe (in [0])

 for(int j=0; j<numOfChildren;j++){  //children pipes
  pipe(fd_ChildePipe_Array[j]); 
 481:	8d 45 b2             	lea    -0x4e(%ebp),%eax
 484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi


void cleanArray(char* ArratToClean, int size){

 for(int i=0;i<size;i++){
    ArratToClean[i]='\0';
 488:	c6 00 00             	movb   $0x0,(%eax)
 48b:	83 c0 01             	add    $0x1,%eax
}


void cleanArray(char* ArratToClean, int size){

 for(int i=0;i<size;i++){
 48e:	39 d8                	cmp    %ebx,%eax
 490:	75 f6                	jne    488 <Task3Action+0x98>
 492:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 }
//do producer code

 for(int i=0; i<numOfChildren;i++){
   cleanArray(readNum, 15);  //clean readNum from prev
   while (read(textFD, &readChar, 1) != 0){
 498:	83 ec 04             	sub    $0x4,%esp
 49b:	6a 01                	push   $0x1
 49d:	57                   	push   %edi
 49e:	ff 75 0c             	pushl  0xc(%ebp)
 4a1:	e8 f4 03 00 00       	call   89a <read>
 4a6:	83 c4 10             	add    $0x10,%esp
 4a9:	85 c0                	test   %eax,%eax
 4ab:	0f 84 bf 00 00 00    	je     570 <Task3Action+0x180>
	
      //printf(1,"readChar=%c \n",readChar); 
      if('0'<readChar && readChar<'9'){
 4b1:	0f b6 45 a3          	movzbl -0x5d(%ebp),%eax
 4b5:	8d 50 cf             	lea    -0x31(%eax),%edx
 4b8:	80 fa 07             	cmp    $0x7,%dl
 4bb:	77 13                	ja     4d0 <Task3Action+0xe0>
	  readNum[digitNum] = readChar;
 4bd:	88 44 35 b2          	mov    %al,-0x4e(%ebp,%esi,1)
 4c1:	88 45 97             	mov    %al,-0x69(%ebp)
	  digitNum++;
 4c4:	83 c6 01             	add    $0x1,%esi
 4c7:	eb cf                	jmp    498 <Task3Action+0xa8>
 4c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
	  prevReadChar=readChar;
      }

      else if ((readChar<'0' || readChar>'9')&& ('0'>prevReadChar || prevReadChar>'9')) {
 4d0:	83 e8 30             	sub    $0x30,%eax
 4d3:	3c 09                	cmp    $0x9,%al
 4d5:	76 c1                	jbe    498 <Task3Action+0xa8>
 4d7:	0f b6 45 97          	movzbl -0x69(%ebp),%eax
 4db:	83 e8 30             	sub    $0x30,%eax
 4de:	3c 09                	cmp    $0x9,%al
 4e0:	0f 87 e2 00 00 00    	ja     5c8 <Task3Action+0x1d8>
          cleanArray(readNum, 15);  //clean readNum from prev
	  prevReadChar=readChar;

      }
 
      else if ((readChar<'0' || readChar>'9') && ('0'<prevReadChar && prevReadChar<'9')){
 4e6:	0f b6 45 97          	movzbl -0x69(%ebp),%eax
 4ea:	83 e8 31             	sub    $0x31,%eax
 4ed:	3c 07                	cmp    $0x7,%al
 4ef:	77 a7                	ja     498 <Task3Action+0xa8>
	  //printf(1,"readNum0= %s \n",readNum);
	  write(fd_ChildePipe_Array[i][1], readNum, digitNum);
 4f1:	8d 45 b2             	lea    -0x4e(%ebp),%eax
 4f4:	83 ec 04             	sub    $0x4,%esp
 4f7:	56                   	push   %esi
 4f8:	50                   	push   %eax
 4f9:	8b 45 90             	mov    -0x70(%ebp),%eax
 4fc:	ff 70 04             	pushl  0x4(%eax)
 4ff:	e8 9e 03 00 00       	call   8a2 <write>
 504:	8d 45 b2             	lea    -0x4e(%ebp),%eax
 507:	83 c4 10             	add    $0x10,%esp
 50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi


void cleanArray(char* ArratToClean, int size){

 for(int i=0;i<size;i++){
    ArratToClean[i]='\0';
 510:	c6 00 00             	movb   $0x0,(%eax)
 513:	83 c0 01             	add    $0x1,%eax
}


void cleanArray(char* ArratToClean, int size){

 for(int i=0;i<size;i++){
 516:	39 d8                	cmp    %ebx,%eax
 518:	75 f6                	jne    510 <Task3Action+0x120>
 
      else if ((readChar<'0' || readChar>'9') && ('0'<prevReadChar && prevReadChar<'9')){
	  //printf(1,"readNum0= %s \n",readNum);
	  write(fd_ChildePipe_Array[i][1], readNum, digitNum);
          cleanArray(readNum, 15);  //clean readNum from prev
	  read(fd_ProducerPipe[0], &res,sizeof(int));
 51a:	8d 45 a4             	lea    -0x5c(%ebp),%eax
 51d:	83 ec 04             	sub    $0x4,%esp
 520:	6a 04                	push   $0x4
 522:	50                   	push   %eax
 523:	ff 75 a8             	pushl  -0x58(%ebp)
 526:	e8 6f 03 00 00       	call   89a <read>
	  //printf(1,"res=%d \n",res );
	  itoa(res,wrResToFile,10);
 52b:	8b 45 a4             	mov    -0x5c(%ebp),%eax
{
    int i = 0;
    int isNegative = 0;  //false
 
    /* Handle 0 explicitely, otherwise empty string is printed for 0 */
    if (num == 0)
 52e:	83 c4 10             	add    $0x10,%esp
 531:	85 c0                	test   %eax,%eax
 533:	0f 85 df 00 00 00    	jne    618 <Task3Action+0x228>
    {
        str[i++] = '0';
 539:	c6 45 c1 30          	movb   $0x30,-0x3f(%ebp)
        str[i] = '\0';
 53d:	c6 45 c2 00          	movb   $0x0,-0x3e(%ebp)
	  write(fd_ChildePipe_Array[i][1], readNum, digitNum);
          cleanArray(readNum, 15);  //clean readNum from prev
	  read(fd_ProducerPipe[0], &res,sizeof(int));
	  //printf(1,"res=%d \n",res );
	  itoa(res,wrResToFile,10);
	  write(tempFileFD, wrResToFile, sizeof(wrResToFile));
 541:	83 ec 04             	sub    $0x4,%esp
	  write(tempFileFD, &readChar, 1);
	  prevReadChar=readChar; 
	  digitNum=0;	      
 544:	31 f6                	xor    %esi,%esi
	  write(fd_ChildePipe_Array[i][1], readNum, digitNum);
          cleanArray(readNum, 15);  //clean readNum from prev
	  read(fd_ProducerPipe[0], &res,sizeof(int));
	  //printf(1,"res=%d \n",res );
	  itoa(res,wrResToFile,10);
	  write(tempFileFD, wrResToFile, sizeof(wrResToFile));
 546:	6a 0f                	push   $0xf
 548:	53                   	push   %ebx
 549:	ff 75 10             	pushl  0x10(%ebp)
 54c:	e8 51 03 00 00       	call   8a2 <write>
	  write(tempFileFD, &readChar, 1);
 551:	83 c4 0c             	add    $0xc,%esp
 554:	6a 01                	push   $0x1
 556:	57                   	push   %edi
 557:	ff 75 10             	pushl  0x10(%ebp)
 55a:	e8 43 03 00 00       	call   8a2 <write>
	  prevReadChar=readChar; 
 55f:	0f b6 45 a3          	movzbl -0x5d(%ebp),%eax
 563:	83 c4 10             	add    $0x10,%esp
 566:	88 45 97             	mov    %al,-0x69(%ebp)
 569:	e9 2a ff ff ff       	jmp    498 <Task3Action+0xa8>
 56e:	66 90                	xchg   %ax,%ax
 570:	83 45 90 08          	addl   $0x8,-0x70(%ebp)
   }
    
 }
//do producer code

 for(int i=0; i<numOfChildren;i++){
 574:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 577:	8b 45 90             	mov    -0x70(%ebp),%eax
 57a:	39 c8                	cmp    %ecx,%eax
 57c:	0f 85 ff fe ff ff    	jne    481 <Task3Action+0x91>
     }
   }
 }
//close pipes

 close(fd_ProducerPipe[0]);
 582:	83 ec 0c             	sub    $0xc,%esp
 585:	ff 75 a8             	pushl  -0x58(%ebp)
 588:	e8 1d 03 00 00       	call   8aa <close>
 close(fd_ProducerPipe[1]);
 58d:	5a                   	pop    %edx
 58e:	ff 75 ac             	pushl  -0x54(%ebp)
 591:	e8 14 03 00 00       	call   8aa <close>
 596:	8b 5d 8c             	mov    -0x74(%ebp),%ebx
 599:	83 c4 10             	add    $0x10,%esp
 for(int j=0; j<numOfChildren;j++){  //close children pipes
    close(fd_ChildePipe_Array[j][0]);
 59c:	83 ec 0c             	sub    $0xc,%esp
 59f:	ff 33                	pushl  (%ebx)
 5a1:	83 c3 08             	add    $0x8,%ebx
 5a4:	e8 01 03 00 00       	call   8aa <close>
    close(fd_ChildePipe_Array[j][1]); 
 5a9:	58                   	pop    %eax
 5aa:	ff 73 fc             	pushl  -0x4(%ebx)
 5ad:	e8 f8 02 00 00       	call   8aa <close>
 }
//close pipes

 close(fd_ProducerPipe[0]);
 close(fd_ProducerPipe[1]);
 for(int j=0; j<numOfChildren;j++){  //close children pipes
 5b2:	8d 45 e8             	lea    -0x18(%ebp),%eax
 5b5:	83 c4 10             	add    $0x10,%esp
 5b8:	39 c3                	cmp    %eax,%ebx
 5ba:	75 e0                	jne    59c <Task3Action+0x1ac>
    close(fd_ChildePipe_Array[j][0]);
    close(fd_ChildePipe_Array[j][1]); 
 }

	
}
 5bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5bf:	5b                   	pop    %ebx
 5c0:	5e                   	pop    %esi
 5c1:	5f                   	pop    %edi
 5c2:	5d                   	pop    %ebp
 5c3:	c3                   	ret    
 5c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	  digitNum++;
	  prevReadChar=readChar;
      }

      else if ((readChar<'0' || readChar>'9')&& ('0'>prevReadChar || prevReadChar>'9')) {
	  write(tempFileFD, &readChar, 1);
 5c8:	83 ec 04             	sub    $0x4,%esp
 5cb:	6a 01                	push   $0x1
 5cd:	57                   	push   %edi
 5ce:	ff 75 10             	pushl  0x10(%ebp)
 5d1:	e8 cc 02 00 00       	call   8a2 <write>
 5d6:	8d 45 b2             	lea    -0x4e(%ebp),%eax
 5d9:	83 c4 10             	add    $0x10,%esp
 5dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi


void cleanArray(char* ArratToClean, int size){

 for(int i=0;i<size;i++){
    ArratToClean[i]='\0';
 5e0:	c6 00 00             	movb   $0x0,(%eax)
 5e3:	83 c0 01             	add    $0x1,%eax
}


void cleanArray(char* ArratToClean, int size){

 for(int i=0;i<size;i++){
 5e6:	39 c3                	cmp    %eax,%ebx
 5e8:	75 f6                	jne    5e0 <Task3Action+0x1f0>
      }

      else if ((readChar<'0' || readChar>'9')&& ('0'>prevReadChar || prevReadChar>'9')) {
	  write(tempFileFD, &readChar, 1);
          cleanArray(readNum, 15);  //clean readNum from prev
	  prevReadChar=readChar;
 5ea:	0f b6 45 a3          	movzbl -0x5d(%ebp),%eax
 5ee:	88 45 97             	mov    %al,-0x69(%ebp)
 5f1:	e9 a2 fe ff ff       	jmp    498 <Task3Action+0xa8>
 5f6:	8d 76 00             	lea    0x0(%esi),%esi
 5f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
       //printf(1,"fork error occured\n");
       exit(0);
   }
   else if(pidArray[i]==0){  //do child task
       //printf(0,"child no.%d \n",i);
       ChildCode(fd_ChildePipe_Array[i],fd_ProducerPipe,ToAddNumber);
 600:	83 ec 04             	sub    $0x4,%esp
 603:	ff 75 08             	pushl  0x8(%ebp)
 606:	56                   	push   %esi
 607:	57                   	push   %edi
 608:	e8 e3 fc ff ff       	call   2f0 <ChildCode>
 60d:	83 c4 10             	add    $0x10,%esp
 610:	e9 53 fe ff ff       	jmp    468 <Task3Action+0x78>
 615:	8d 76 00             	lea    0x0(%esi),%esi
 618:	b9 0a 00 00 00       	mov    $0xa,%ecx
 61d:	89 da                	mov    %ebx,%edx
 61f:	e8 1c fb ff ff       	call   140 <itoa.part.0>
 624:	e9 18 ff ff ff       	jmp    541 <Task3Action+0x151>
   
   pidArray[i] = fork();

   if(pidArray[i]<0){
       //printf(1,"fork error occured\n");
       exit(0);
 629:	83 ec 0c             	sub    $0xc,%esp
 62c:	6a 00                	push   $0x0
 62e:	e8 4f 02 00 00       	call   882 <exit>
 633:	66 90                	xchg   %ax,%ax
 635:	66 90                	xchg   %ax,%ax
 637:	66 90                	xchg   %ax,%ax
 639:	66 90                	xchg   %ax,%ax
 63b:	66 90                	xchg   %ax,%ax
 63d:	66 90                	xchg   %ax,%ax
 63f:	90                   	nop

00000640 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	53                   	push   %ebx
 644:	8b 45 08             	mov    0x8(%ebp),%eax
 647:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 64a:	89 c2                	mov    %eax,%edx
 64c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 650:	83 c1 01             	add    $0x1,%ecx
 653:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 657:	83 c2 01             	add    $0x1,%edx
 65a:	84 db                	test   %bl,%bl
 65c:	88 5a ff             	mov    %bl,-0x1(%edx)
 65f:	75 ef                	jne    650 <strcpy+0x10>
    ;
  return os;
}
 661:	5b                   	pop    %ebx
 662:	5d                   	pop    %ebp
 663:	c3                   	ret    
 664:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 66a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000670 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	56                   	push   %esi
 674:	53                   	push   %ebx
 675:	8b 55 08             	mov    0x8(%ebp),%edx
 678:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 67b:	0f b6 02             	movzbl (%edx),%eax
 67e:	0f b6 19             	movzbl (%ecx),%ebx
 681:	84 c0                	test   %al,%al
 683:	75 1e                	jne    6a3 <strcmp+0x33>
 685:	eb 29                	jmp    6b0 <strcmp+0x40>
 687:	89 f6                	mov    %esi,%esi
 689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 690:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 693:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 696:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 699:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 69d:	84 c0                	test   %al,%al
 69f:	74 0f                	je     6b0 <strcmp+0x40>
 6a1:	89 f1                	mov    %esi,%ecx
 6a3:	38 d8                	cmp    %bl,%al
 6a5:	74 e9                	je     690 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 6a7:	29 d8                	sub    %ebx,%eax
}
 6a9:	5b                   	pop    %ebx
 6aa:	5e                   	pop    %esi
 6ab:	5d                   	pop    %ebp
 6ac:	c3                   	ret    
 6ad:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 6b0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 6b2:	29 d8                	sub    %ebx,%eax
}
 6b4:	5b                   	pop    %ebx
 6b5:	5e                   	pop    %esi
 6b6:	5d                   	pop    %ebp
 6b7:	c3                   	ret    
 6b8:	90                   	nop
 6b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006c0 <strlen>:

uint
strlen(char *s)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 6c6:	80 39 00             	cmpb   $0x0,(%ecx)
 6c9:	74 12                	je     6dd <strlen+0x1d>
 6cb:	31 d2                	xor    %edx,%edx
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
 6d0:	83 c2 01             	add    $0x1,%edx
 6d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 6d7:	89 d0                	mov    %edx,%eax
 6d9:	75 f5                	jne    6d0 <strlen+0x10>
    ;
  return n;
}
 6db:	5d                   	pop    %ebp
 6dc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 6dd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 6df:	5d                   	pop    %ebp
 6e0:	c3                   	ret    
 6e1:	eb 0d                	jmp    6f0 <memset>
 6e3:	90                   	nop
 6e4:	90                   	nop
 6e5:	90                   	nop
 6e6:	90                   	nop
 6e7:	90                   	nop
 6e8:	90                   	nop
 6e9:	90                   	nop
 6ea:	90                   	nop
 6eb:	90                   	nop
 6ec:	90                   	nop
 6ed:	90                   	nop
 6ee:	90                   	nop
 6ef:	90                   	nop

000006f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 6f0:	55                   	push   %ebp
 6f1:	89 e5                	mov    %esp,%ebp
 6f3:	57                   	push   %edi
 6f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 6f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 6fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 6fd:	89 d7                	mov    %edx,%edi
 6ff:	fc                   	cld    
 700:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 702:	89 d0                	mov    %edx,%eax
 704:	5f                   	pop    %edi
 705:	5d                   	pop    %ebp
 706:	c3                   	ret    
 707:	89 f6                	mov    %esi,%esi
 709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000710 <strchr>:

char*
strchr(const char *s, char c)
{
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	53                   	push   %ebx
 714:	8b 45 08             	mov    0x8(%ebp),%eax
 717:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 71a:	0f b6 10             	movzbl (%eax),%edx
 71d:	84 d2                	test   %dl,%dl
 71f:	74 1d                	je     73e <strchr+0x2e>
    if(*s == c)
 721:	38 d3                	cmp    %dl,%bl
 723:	89 d9                	mov    %ebx,%ecx
 725:	75 0d                	jne    734 <strchr+0x24>
 727:	eb 17                	jmp    740 <strchr+0x30>
 729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 730:	38 ca                	cmp    %cl,%dl
 732:	74 0c                	je     740 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 734:	83 c0 01             	add    $0x1,%eax
 737:	0f b6 10             	movzbl (%eax),%edx
 73a:	84 d2                	test   %dl,%dl
 73c:	75 f2                	jne    730 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 73e:	31 c0                	xor    %eax,%eax
}
 740:	5b                   	pop    %ebx
 741:	5d                   	pop    %ebp
 742:	c3                   	ret    
 743:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000750 <gets>:

char*
gets(char *buf, int max)
{
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	57                   	push   %edi
 754:	56                   	push   %esi
 755:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 756:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 758:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 75b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 75e:	eb 29                	jmp    789 <gets+0x39>
    cc = read(0, &c, 1);
 760:	83 ec 04             	sub    $0x4,%esp
 763:	6a 01                	push   $0x1
 765:	57                   	push   %edi
 766:	6a 00                	push   $0x0
 768:	e8 2d 01 00 00       	call   89a <read>
    if(cc < 1)
 76d:	83 c4 10             	add    $0x10,%esp
 770:	85 c0                	test   %eax,%eax
 772:	7e 1d                	jle    791 <gets+0x41>
      break;
    buf[i++] = c;
 774:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 778:	8b 55 08             	mov    0x8(%ebp),%edx
 77b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 77d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 77f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 783:	74 1b                	je     7a0 <gets+0x50>
 785:	3c 0d                	cmp    $0xd,%al
 787:	74 17                	je     7a0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 789:	8d 5e 01             	lea    0x1(%esi),%ebx
 78c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 78f:	7c cf                	jl     760 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 791:	8b 45 08             	mov    0x8(%ebp),%eax
 794:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 798:	8d 65 f4             	lea    -0xc(%ebp),%esp
 79b:	5b                   	pop    %ebx
 79c:	5e                   	pop    %esi
 79d:	5f                   	pop    %edi
 79e:	5d                   	pop    %ebp
 79f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 7a0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 7a3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 7a5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 7a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7ac:	5b                   	pop    %ebx
 7ad:	5e                   	pop    %esi
 7ae:	5f                   	pop    %edi
 7af:	5d                   	pop    %ebp
 7b0:	c3                   	ret    
 7b1:	eb 0d                	jmp    7c0 <stat>
 7b3:	90                   	nop
 7b4:	90                   	nop
 7b5:	90                   	nop
 7b6:	90                   	nop
 7b7:	90                   	nop
 7b8:	90                   	nop
 7b9:	90                   	nop
 7ba:	90                   	nop
 7bb:	90                   	nop
 7bc:	90                   	nop
 7bd:	90                   	nop
 7be:	90                   	nop
 7bf:	90                   	nop

000007c0 <stat>:

int
stat(char *n, struct stat *st)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	56                   	push   %esi
 7c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 7c5:	83 ec 08             	sub    $0x8,%esp
 7c8:	6a 00                	push   $0x0
 7ca:	ff 75 08             	pushl  0x8(%ebp)
 7cd:	e8 f0 00 00 00       	call   8c2 <open>
  if(fd < 0)
 7d2:	83 c4 10             	add    $0x10,%esp
 7d5:	85 c0                	test   %eax,%eax
 7d7:	78 27                	js     800 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 7d9:	83 ec 08             	sub    $0x8,%esp
 7dc:	ff 75 0c             	pushl  0xc(%ebp)
 7df:	89 c3                	mov    %eax,%ebx
 7e1:	50                   	push   %eax
 7e2:	e8 f3 00 00 00       	call   8da <fstat>
 7e7:	89 c6                	mov    %eax,%esi
  close(fd);
 7e9:	89 1c 24             	mov    %ebx,(%esp)
 7ec:	e8 b9 00 00 00       	call   8aa <close>
  return r;
 7f1:	83 c4 10             	add    $0x10,%esp
 7f4:	89 f0                	mov    %esi,%eax
}
 7f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
 7f9:	5b                   	pop    %ebx
 7fa:	5e                   	pop    %esi
 7fb:	5d                   	pop    %ebp
 7fc:	c3                   	ret    
 7fd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 800:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 805:	eb ef                	jmp    7f6 <stat+0x36>
 807:	89 f6                	mov    %esi,%esi
 809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000810 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	53                   	push   %ebx
 814:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 817:	0f be 11             	movsbl (%ecx),%edx
 81a:	8d 42 d0             	lea    -0x30(%edx),%eax
 81d:	3c 09                	cmp    $0x9,%al
 81f:	b8 00 00 00 00       	mov    $0x0,%eax
 824:	77 1f                	ja     845 <atoi+0x35>
 826:	8d 76 00             	lea    0x0(%esi),%esi
 829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 830:	8d 04 80             	lea    (%eax,%eax,4),%eax
 833:	83 c1 01             	add    $0x1,%ecx
 836:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 83a:	0f be 11             	movsbl (%ecx),%edx
 83d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 840:	80 fb 09             	cmp    $0x9,%bl
 843:	76 eb                	jbe    830 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 845:	5b                   	pop    %ebx
 846:	5d                   	pop    %ebp
 847:	c3                   	ret    
 848:	90                   	nop
 849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000850 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	56                   	push   %esi
 854:	53                   	push   %ebx
 855:	8b 5d 10             	mov    0x10(%ebp),%ebx
 858:	8b 45 08             	mov    0x8(%ebp),%eax
 85b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 85e:	85 db                	test   %ebx,%ebx
 860:	7e 14                	jle    876 <memmove+0x26>
 862:	31 d2                	xor    %edx,%edx
 864:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 868:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 86c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 86f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 872:	39 da                	cmp    %ebx,%edx
 874:	75 f2                	jne    868 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 876:	5b                   	pop    %ebx
 877:	5e                   	pop    %esi
 878:	5d                   	pop    %ebp
 879:	c3                   	ret    

0000087a <fork>:
 87a:	b8 01 00 00 00       	mov    $0x1,%eax
 87f:	cd 40                	int    $0x40
 881:	c3                   	ret    

00000882 <exit>:
 882:	b8 02 00 00 00       	mov    $0x2,%eax
 887:	cd 40                	int    $0x40
 889:	c3                   	ret    

0000088a <wait>:
 88a:	b8 03 00 00 00       	mov    $0x3,%eax
 88f:	cd 40                	int    $0x40
 891:	c3                   	ret    

00000892 <pipe>:
 892:	b8 04 00 00 00       	mov    $0x4,%eax
 897:	cd 40                	int    $0x40
 899:	c3                   	ret    

0000089a <read>:
 89a:	b8 05 00 00 00       	mov    $0x5,%eax
 89f:	cd 40                	int    $0x40
 8a1:	c3                   	ret    

000008a2 <write>:
 8a2:	b8 10 00 00 00       	mov    $0x10,%eax
 8a7:	cd 40                	int    $0x40
 8a9:	c3                   	ret    

000008aa <close>:
 8aa:	b8 15 00 00 00       	mov    $0x15,%eax
 8af:	cd 40                	int    $0x40
 8b1:	c3                   	ret    

000008b2 <kill>:
 8b2:	b8 06 00 00 00       	mov    $0x6,%eax
 8b7:	cd 40                	int    $0x40
 8b9:	c3                   	ret    

000008ba <exec>:
 8ba:	b8 07 00 00 00       	mov    $0x7,%eax
 8bf:	cd 40                	int    $0x40
 8c1:	c3                   	ret    

000008c2 <open>:
 8c2:	b8 0f 00 00 00       	mov    $0xf,%eax
 8c7:	cd 40                	int    $0x40
 8c9:	c3                   	ret    

000008ca <mknod>:
 8ca:	b8 11 00 00 00       	mov    $0x11,%eax
 8cf:	cd 40                	int    $0x40
 8d1:	c3                   	ret    

000008d2 <unlink>:
 8d2:	b8 12 00 00 00       	mov    $0x12,%eax
 8d7:	cd 40                	int    $0x40
 8d9:	c3                   	ret    

000008da <fstat>:
 8da:	b8 08 00 00 00       	mov    $0x8,%eax
 8df:	cd 40                	int    $0x40
 8e1:	c3                   	ret    

000008e2 <link>:
 8e2:	b8 13 00 00 00       	mov    $0x13,%eax
 8e7:	cd 40                	int    $0x40
 8e9:	c3                   	ret    

000008ea <mkdir>:
 8ea:	b8 14 00 00 00       	mov    $0x14,%eax
 8ef:	cd 40                	int    $0x40
 8f1:	c3                   	ret    

000008f2 <chdir>:
 8f2:	b8 09 00 00 00       	mov    $0x9,%eax
 8f7:	cd 40                	int    $0x40
 8f9:	c3                   	ret    

000008fa <dup>:
 8fa:	b8 0a 00 00 00       	mov    $0xa,%eax
 8ff:	cd 40                	int    $0x40
 901:	c3                   	ret    

00000902 <getpid>:
 902:	b8 0b 00 00 00       	mov    $0xb,%eax
 907:	cd 40                	int    $0x40
 909:	c3                   	ret    

0000090a <sbrk>:
 90a:	b8 0c 00 00 00       	mov    $0xc,%eax
 90f:	cd 40                	int    $0x40
 911:	c3                   	ret    

00000912 <sleep>:
 912:	b8 0d 00 00 00       	mov    $0xd,%eax
 917:	cd 40                	int    $0x40
 919:	c3                   	ret    

0000091a <uptime>:
 91a:	b8 0e 00 00 00       	mov    $0xe,%eax
 91f:	cd 40                	int    $0x40
 921:	c3                   	ret    

00000922 <set>:
 922:	b8 16 00 00 00       	mov    $0x16,%eax
 927:	cd 40                	int    $0x40
 929:	c3                   	ret    
 92a:	66 90                	xchg   %ax,%ax
 92c:	66 90                	xchg   %ax,%ax
 92e:	66 90                	xchg   %ax,%ax

00000930 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
 933:	57                   	push   %edi
 934:	56                   	push   %esi
 935:	53                   	push   %ebx
 936:	89 c6                	mov    %eax,%esi
 938:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 93b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 93e:	85 db                	test   %ebx,%ebx
 940:	74 7e                	je     9c0 <printint+0x90>
 942:	89 d0                	mov    %edx,%eax
 944:	c1 e8 1f             	shr    $0x1f,%eax
 947:	84 c0                	test   %al,%al
 949:	74 75                	je     9c0 <printint+0x90>
    neg = 1;
    x = -xx;
 94b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 94d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 954:	f7 d8                	neg    %eax
 956:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 959:	31 ff                	xor    %edi,%edi
 95b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 95e:	89 ce                	mov    %ecx,%esi
 960:	eb 08                	jmp    96a <printint+0x3a>
 962:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 968:	89 cf                	mov    %ecx,%edi
 96a:	31 d2                	xor    %edx,%edx
 96c:	8d 4f 01             	lea    0x1(%edi),%ecx
 96f:	f7 f6                	div    %esi
 971:	0f b6 92 24 0d 00 00 	movzbl 0xd24(%edx),%edx
  }while((x /= base) != 0);
 978:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 97a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 97d:	75 e9                	jne    968 <printint+0x38>
  if(neg)
 97f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 982:	8b 75 c0             	mov    -0x40(%ebp),%esi
 985:	85 c0                	test   %eax,%eax
 987:	74 08                	je     991 <printint+0x61>
    buf[i++] = '-';
 989:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 98e:	8d 4f 02             	lea    0x2(%edi),%ecx
 991:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 995:	8d 76 00             	lea    0x0(%esi),%esi
 998:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 99b:	83 ec 04             	sub    $0x4,%esp
 99e:	83 ef 01             	sub    $0x1,%edi
 9a1:	6a 01                	push   $0x1
 9a3:	53                   	push   %ebx
 9a4:	56                   	push   %esi
 9a5:	88 45 d7             	mov    %al,-0x29(%ebp)
 9a8:	e8 f5 fe ff ff       	call   8a2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 9ad:	83 c4 10             	add    $0x10,%esp
 9b0:	39 df                	cmp    %ebx,%edi
 9b2:	75 e4                	jne    998 <printint+0x68>
    putc(fd, buf[i]);
}
 9b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 9b7:	5b                   	pop    %ebx
 9b8:	5e                   	pop    %esi
 9b9:	5f                   	pop    %edi
 9ba:	5d                   	pop    %ebp
 9bb:	c3                   	ret    
 9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 9c0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 9c2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 9c9:	eb 8b                	jmp    956 <printint+0x26>
 9cb:	90                   	nop
 9cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009d0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
 9d3:	57                   	push   %edi
 9d4:	56                   	push   %esi
 9d5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9d6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 9d9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9dc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 9df:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9e2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 9e5:	0f b6 1e             	movzbl (%esi),%ebx
 9e8:	83 c6 01             	add    $0x1,%esi
 9eb:	84 db                	test   %bl,%bl
 9ed:	0f 84 b0 00 00 00    	je     aa3 <printf+0xd3>
 9f3:	31 d2                	xor    %edx,%edx
 9f5:	eb 39                	jmp    a30 <printf+0x60>
 9f7:	89 f6                	mov    %esi,%esi
 9f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 a00:	83 f8 25             	cmp    $0x25,%eax
 a03:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 a06:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 a0b:	74 18                	je     a25 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a0d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 a10:	83 ec 04             	sub    $0x4,%esp
 a13:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 a16:	6a 01                	push   $0x1
 a18:	50                   	push   %eax
 a19:	57                   	push   %edi
 a1a:	e8 83 fe ff ff       	call   8a2 <write>
 a1f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 a22:	83 c4 10             	add    $0x10,%esp
 a25:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 a28:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 a2c:	84 db                	test   %bl,%bl
 a2e:	74 73                	je     aa3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 a30:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 a32:	0f be cb             	movsbl %bl,%ecx
 a35:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 a38:	74 c6                	je     a00 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 a3a:	83 fa 25             	cmp    $0x25,%edx
 a3d:	75 e6                	jne    a25 <printf+0x55>
      if(c == 'd'){
 a3f:	83 f8 64             	cmp    $0x64,%eax
 a42:	0f 84 f8 00 00 00    	je     b40 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 a48:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 a4e:	83 f9 70             	cmp    $0x70,%ecx
 a51:	74 5d                	je     ab0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 a53:	83 f8 73             	cmp    $0x73,%eax
 a56:	0f 84 84 00 00 00    	je     ae0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 a5c:	83 f8 63             	cmp    $0x63,%eax
 a5f:	0f 84 ea 00 00 00    	je     b4f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 a65:	83 f8 25             	cmp    $0x25,%eax
 a68:	0f 84 c2 00 00 00    	je     b30 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a6e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 a71:	83 ec 04             	sub    $0x4,%esp
 a74:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 a78:	6a 01                	push   $0x1
 a7a:	50                   	push   %eax
 a7b:	57                   	push   %edi
 a7c:	e8 21 fe ff ff       	call   8a2 <write>
 a81:	83 c4 0c             	add    $0xc,%esp
 a84:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 a87:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 a8a:	6a 01                	push   $0x1
 a8c:	50                   	push   %eax
 a8d:	57                   	push   %edi
 a8e:	83 c6 01             	add    $0x1,%esi
 a91:	e8 0c fe ff ff       	call   8a2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 a96:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a9a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 a9d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 a9f:	84 db                	test   %bl,%bl
 aa1:	75 8d                	jne    a30 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 aa3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 aa6:	5b                   	pop    %ebx
 aa7:	5e                   	pop    %esi
 aa8:	5f                   	pop    %edi
 aa9:	5d                   	pop    %ebp
 aaa:	c3                   	ret    
 aab:	90                   	nop
 aac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 ab0:	83 ec 0c             	sub    $0xc,%esp
 ab3:	b9 10 00 00 00       	mov    $0x10,%ecx
 ab8:	6a 00                	push   $0x0
 aba:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 abd:	89 f8                	mov    %edi,%eax
 abf:	8b 13                	mov    (%ebx),%edx
 ac1:	e8 6a fe ff ff       	call   930 <printint>
        ap++;
 ac6:	89 d8                	mov    %ebx,%eax
 ac8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 acb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 acd:	83 c0 04             	add    $0x4,%eax
 ad0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 ad3:	e9 4d ff ff ff       	jmp    a25 <printf+0x55>
 ad8:	90                   	nop
 ad9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 ae0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 ae3:	8b 18                	mov    (%eax),%ebx
        ap++;
 ae5:	83 c0 04             	add    $0x4,%eax
 ae8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 aeb:	b8 1c 0d 00 00       	mov    $0xd1c,%eax
 af0:	85 db                	test   %ebx,%ebx
 af2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 af5:	0f b6 03             	movzbl (%ebx),%eax
 af8:	84 c0                	test   %al,%al
 afa:	74 23                	je     b1f <printf+0x14f>
 afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b00:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 b03:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 b06:	83 ec 04             	sub    $0x4,%esp
 b09:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 b0b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 b0e:	50                   	push   %eax
 b0f:	57                   	push   %edi
 b10:	e8 8d fd ff ff       	call   8a2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 b15:	0f b6 03             	movzbl (%ebx),%eax
 b18:	83 c4 10             	add    $0x10,%esp
 b1b:	84 c0                	test   %al,%al
 b1d:	75 e1                	jne    b00 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 b1f:	31 d2                	xor    %edx,%edx
 b21:	e9 ff fe ff ff       	jmp    a25 <printf+0x55>
 b26:	8d 76 00             	lea    0x0(%esi),%esi
 b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 b30:	83 ec 04             	sub    $0x4,%esp
 b33:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 b36:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 b39:	6a 01                	push   $0x1
 b3b:	e9 4c ff ff ff       	jmp    a8c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 b40:	83 ec 0c             	sub    $0xc,%esp
 b43:	b9 0a 00 00 00       	mov    $0xa,%ecx
 b48:	6a 01                	push   $0x1
 b4a:	e9 6b ff ff ff       	jmp    aba <printf+0xea>
 b4f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 b52:	83 ec 04             	sub    $0x4,%esp
 b55:	8b 03                	mov    (%ebx),%eax
 b57:	6a 01                	push   $0x1
 b59:	88 45 e4             	mov    %al,-0x1c(%ebp)
 b5c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 b5f:	50                   	push   %eax
 b60:	57                   	push   %edi
 b61:	e8 3c fd ff ff       	call   8a2 <write>
 b66:	e9 5b ff ff ff       	jmp    ac6 <printf+0xf6>
 b6b:	66 90                	xchg   %ax,%ax
 b6d:	66 90                	xchg   %ax,%ax
 b6f:	90                   	nop

00000b70 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b70:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b71:	a1 f4 10 00 00       	mov    0x10f4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 b76:	89 e5                	mov    %esp,%ebp
 b78:	57                   	push   %edi
 b79:	56                   	push   %esi
 b7a:	53                   	push   %ebx
 b7b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b7e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 b80:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b83:	39 c8                	cmp    %ecx,%eax
 b85:	73 19                	jae    ba0 <free+0x30>
 b87:	89 f6                	mov    %esi,%esi
 b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 b90:	39 d1                	cmp    %edx,%ecx
 b92:	72 1c                	jb     bb0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b94:	39 d0                	cmp    %edx,%eax
 b96:	73 18                	jae    bb0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 b98:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b9a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b9c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b9e:	72 f0                	jb     b90 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 ba0:	39 d0                	cmp    %edx,%eax
 ba2:	72 f4                	jb     b98 <free+0x28>
 ba4:	39 d1                	cmp    %edx,%ecx
 ba6:	73 f0                	jae    b98 <free+0x28>
 ba8:	90                   	nop
 ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 bb0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 bb3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 bb6:	39 d7                	cmp    %edx,%edi
 bb8:	74 19                	je     bd3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 bba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 bbd:	8b 50 04             	mov    0x4(%eax),%edx
 bc0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 bc3:	39 f1                	cmp    %esi,%ecx
 bc5:	74 23                	je     bea <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 bc7:	89 08                	mov    %ecx,(%eax)
  freep = p;
 bc9:	a3 f4 10 00 00       	mov    %eax,0x10f4
}
 bce:	5b                   	pop    %ebx
 bcf:	5e                   	pop    %esi
 bd0:	5f                   	pop    %edi
 bd1:	5d                   	pop    %ebp
 bd2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 bd3:	03 72 04             	add    0x4(%edx),%esi
 bd6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 bd9:	8b 10                	mov    (%eax),%edx
 bdb:	8b 12                	mov    (%edx),%edx
 bdd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 be0:	8b 50 04             	mov    0x4(%eax),%edx
 be3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 be6:	39 f1                	cmp    %esi,%ecx
 be8:	75 dd                	jne    bc7 <free+0x57>
    p->s.size += bp->s.size;
 bea:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 bed:	a3 f4 10 00 00       	mov    %eax,0x10f4
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 bf2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 bf5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 bf8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 bfa:	5b                   	pop    %ebx
 bfb:	5e                   	pop    %esi
 bfc:	5f                   	pop    %edi
 bfd:	5d                   	pop    %ebp
 bfe:	c3                   	ret    
 bff:	90                   	nop

00000c00 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 c00:	55                   	push   %ebp
 c01:	89 e5                	mov    %esp,%ebp
 c03:	57                   	push   %edi
 c04:	56                   	push   %esi
 c05:	53                   	push   %ebx
 c06:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c09:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 c0c:	8b 15 f4 10 00 00    	mov    0x10f4,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 c12:	8d 78 07             	lea    0x7(%eax),%edi
 c15:	c1 ef 03             	shr    $0x3,%edi
 c18:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 c1b:	85 d2                	test   %edx,%edx
 c1d:	0f 84 a3 00 00 00    	je     cc6 <malloc+0xc6>
 c23:	8b 02                	mov    (%edx),%eax
 c25:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 c28:	39 cf                	cmp    %ecx,%edi
 c2a:	76 74                	jbe    ca0 <malloc+0xa0>
 c2c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 c32:	be 00 10 00 00       	mov    $0x1000,%esi
 c37:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 c3e:	0f 43 f7             	cmovae %edi,%esi
 c41:	ba 00 80 00 00       	mov    $0x8000,%edx
 c46:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 c4c:	0f 46 da             	cmovbe %edx,%ebx
 c4f:	eb 10                	jmp    c61 <malloc+0x61>
 c51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c58:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 c5a:	8b 48 04             	mov    0x4(%eax),%ecx
 c5d:	39 cf                	cmp    %ecx,%edi
 c5f:	76 3f                	jbe    ca0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 c61:	39 05 f4 10 00 00    	cmp    %eax,0x10f4
 c67:	89 c2                	mov    %eax,%edx
 c69:	75 ed                	jne    c58 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 c6b:	83 ec 0c             	sub    $0xc,%esp
 c6e:	53                   	push   %ebx
 c6f:	e8 96 fc ff ff       	call   90a <sbrk>
  if(p == (char*)-1)
 c74:	83 c4 10             	add    $0x10,%esp
 c77:	83 f8 ff             	cmp    $0xffffffff,%eax
 c7a:	74 1c                	je     c98 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 c7c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 c7f:	83 ec 0c             	sub    $0xc,%esp
 c82:	83 c0 08             	add    $0x8,%eax
 c85:	50                   	push   %eax
 c86:	e8 e5 fe ff ff       	call   b70 <free>
  return freep;
 c8b:	8b 15 f4 10 00 00    	mov    0x10f4,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 c91:	83 c4 10             	add    $0x10,%esp
 c94:	85 d2                	test   %edx,%edx
 c96:	75 c0                	jne    c58 <malloc+0x58>
        return 0;
 c98:	31 c0                	xor    %eax,%eax
 c9a:	eb 1c                	jmp    cb8 <malloc+0xb8>
 c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 ca0:	39 cf                	cmp    %ecx,%edi
 ca2:	74 1c                	je     cc0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 ca4:	29 f9                	sub    %edi,%ecx
 ca6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 ca9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 cac:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 caf:	89 15 f4 10 00 00    	mov    %edx,0x10f4
      return (void*)(p + 1);
 cb5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 cb8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 cbb:	5b                   	pop    %ebx
 cbc:	5e                   	pop    %esi
 cbd:	5f                   	pop    %edi
 cbe:	5d                   	pop    %ebp
 cbf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 cc0:	8b 08                	mov    (%eax),%ecx
 cc2:	89 0a                	mov    %ecx,(%edx)
 cc4:	eb e9                	jmp    caf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 cc6:	c7 05 f4 10 00 00 f8 	movl   $0x10f8,0x10f4
 ccd:	10 00 00 
 cd0:	c7 05 f8 10 00 00 f8 	movl   $0x10f8,0x10f8
 cd7:	10 00 00 
    base.s.size = 0;
 cda:	b8 f8 10 00 00       	mov    $0x10f8,%eax
 cdf:	c7 05 fc 10 00 00 00 	movl   $0x0,0x10fc
 ce6:	00 00 00 
 ce9:	e9 3e ff ff ff       	jmp    c2c <malloc+0x2c>
