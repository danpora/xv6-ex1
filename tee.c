#include "types.h"
#include "user.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{

//standard I/O read and write
 char inputString[254];
 printf(0, " write something for an input: \n");
 gets(inputString,254);
 printf(1, " you entered the string: %s \n",inputString);


//File's read and write:
 char* filename = argv[1];
// printf(1, "argv[1]= %s \n",argv[1]); 
 char* fInputString = inputString; 
// Open the file for writing. If it exists, append to it otherwise, create a new file   
 int fd = open (filename, O_WRONLY | O_CREATE | O_RDWR); 
// Compute the length of the fInputString string
 int length = strlen (fInputString); 
// Write the fInputString to the file 
 write (fd, fInputString, length); 
 close (fd);  

 exit(0);
}
