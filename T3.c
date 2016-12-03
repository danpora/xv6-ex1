#include "types.h"
#include "user.h"
#include "fcntl.h"

// our own atoi() function - convert string to int
int ourAtoi(char *str)
{

    int res = 0;  // Initialize result
    int sign = 1;  // Initialize sign as positive
    int i = 0;  // Initialize index of first digit
      
    // If number is negative, then update sign
    if (str[0] == '-')
    {
        sign = -1;  
        i++;  // Also update index of first digit
    }
      
    // Iterate through all digits and update the result
    for (; str[i] != '\0'; ++i)
        res = res*10 + str[i] - '0';
    
    // Return result with sign
    return sign*res;
}

//revers string 
void my_reverse(char str[], int len)
{
    int start, end;
    char temp;
    for(start=0, end=len-1; start < end; start++, end--) {
        temp = *(str+start);
        *(str+start) = *(str+end);
        *(str+end) = temp;
    }
}


void cleanArray(char* ArratToClean, int size){

 for(int i=0;i<size;i++){
    ArratToClean[i]='\0';
 }
}

// Implementation of itoa() - convert int to String 
char* itoa(int num, char* str, int base)
{
    int i = 0;
    int isNegative = 0;  //false
 
    /* Handle 0 explicitely, otherwise empty string is printed for 0 */
    if (num == 0)
    {
        str[i++] = '0';
        str[i] = '\0';
        return str;
    }
 
    // In standard itoa(), negative numbers are handled only with 
    // base 10. Otherwise numbers are considered unsigned.
    if (num < 0 && base == 10)
    {
        isNegative = 1; //true
        num = -num;
    }
 
    // Process individual digits
    while (num != 0)
    {
        int rem = num % base;
        str[i++] = (rem > 9)? (rem-10) + 'a' : rem + '0';
        num = num/base;
    }
 
    // If number is negative, append '-'
    if (isNegative)
        str[i++] = '-';
 
    str[i] = '\0'; // Append string terminator
 
    // Reverse the string
    my_reverse(str, i);
 
    return str;
}


//children code as function
//every child read from a different pipe(fd_ChildePipe_Array[i]) just for him
//all childs write to the same pipe (fd_ProducerPipe)


void ChildCode(int* readFromPipe,int* writeToPipe,int numToAdd){
       
    char readNum[15]={'\0'}; 
    int childNum=0;
    //printf(0,"child1\n");
    dup(readFromPipe[0]); //dup just the pipe child1 read from
    cleanArray(readNum, 15);  
    while ((read(readFromPipe[0], readNum, 15)) != 0){         
	//printf(1,"readNum1= %s \n",readNum);
	//printf(0,"child1 after read\n");
	childNum= numToAdd+ ourAtoi(readNum);
        cleanArray(readNum, 15);  
	//printf(1,"numToAdd=%d \n",numToAdd);
	//printf(1,"ourAtoi(readNum)=%d \n",ourAtoi(readNum));
	//printf(1,"childNum2=%d \n",childNum);
	write(writeToPipe[1], &childNum, sizeof(childNum));

   }
}




void
Task3Action(int ToAddNumber,int textFD,int tempFileFD ){
//
 int pidArray[3];
 int fd_ChildePipe_Array[3][2]; 
 int numOfChildren=3;
 int digitNum=0;
 char readChar='\0';
 char prevReadChar='\0';
 char readNum[15]={'\0'}; 
 int res=0; 
 char wrResToFile[15];	


 int fd_ProducerPipe[2];   //read and write FD
 pipe(fd_ProducerPipe);  //producer only write to this pipe (in [0])

 for(int j=0; j<numOfChildren;j++){  //children pipes
  pipe(fd_ChildePipe_Array[j]); 
 }


 for(int i=0; i<numOfChildren;i++){
   
   pidArray[i] = fork();

   if(pidArray[i]<0){
       //printf(1,"fork error occured\n");
       exit(0);
   }
   else if(pidArray[i]==0){  //do child task
       //printf(0,"child no.%d \n",i);
       ChildCode(fd_ChildePipe_Array[i],fd_ProducerPipe,ToAddNumber);
	//printf(1,"child no.%d is done \n",i); 
	//exit(0);
   }
    
 }
//do producer code

 for(int i=0; i<numOfChildren;i++){
   cleanArray(readNum, 15);  //clean readNum from prev
   while (read(textFD, &readChar, 1) != 0){
	
      //printf(1,"readChar=%c \n",readChar); 
      if('0'<readChar && readChar<'9'){
	  readNum[digitNum] = readChar;
	  digitNum++;
	  prevReadChar=readChar;
      }

      else if ((readChar<'0' || readChar>'9')&& ('0'>prevReadChar || prevReadChar>'9')) {
	  write(tempFileFD, &readChar, 1);
          cleanArray(readNum, 15);  //clean readNum from prev
	  prevReadChar=readChar;

      }
 
      else if ((readChar<'0' || readChar>'9') && ('0'<prevReadChar && prevReadChar<'9')){
	  //printf(1,"readNum0= %s \n",readNum);
	  write(fd_ChildePipe_Array[i][1], readNum, digitNum);
          cleanArray(readNum, 15);  //clean readNum from prev
	  read(fd_ProducerPipe[0], &res,sizeof(int));
	  //printf(1,"res=%d \n",res );
	  itoa(res,wrResToFile,10);
	  write(tempFileFD, wrResToFile, sizeof(wrResToFile));
	  write(tempFileFD, &readChar, 1);
	  prevReadChar=readChar; 
	  digitNum=0;	      
     }
   }
 }
//close pipes

 close(fd_ProducerPipe[0]);
 close(fd_ProducerPipe[1]);
 for(int j=0; j<numOfChildren;j++){  //close children pipes
    close(fd_ChildePipe_Array[j][0]);
    close(fd_ChildePipe_Array[j][1]); 
 }

	
}





//producer process:
int
main(int argc, char *argv[])
{
 char* fileName=argv[1];
 //printf(1,"numToAdd %s\n", argv[2]);
 int numToAdd=ourAtoi(argv[2]);
 char copyResToOrgFile='\0';//[15];	


 //printf(0," open file= %s\n", fileName);
 int textFileDesc = open (fileName, O_RDWR);
 //temp file to write to the result + non-number chars      
 int tempF = open ("tempFile",O_CREATE | O_RDWR);  

 Task3Action(numToAdd,textFileDesc,tempF);
 printf(1,"modifing the given %s file...\n",fileName);

 close(textFileDesc);
 textFileDesc = open (fileName,O_CREATE | O_RDWR);  
 close(tempF);
 tempF = open ("tempFile",O_CREATE | O_RDWR);  


  while ((read(tempF, &copyResToOrgFile, 1)) != 0){
     write(textFileDesc, &copyResToOrgFile, 1);
  }	

unlink("tempFile");  //deleting the temp file after copping it to the ogiven file

close(tempF);
close(textFileDesc);
 exit(0);

}
