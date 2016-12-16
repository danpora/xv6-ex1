#include "types.h"
#include "user.h"


int
main(int argc, char *argv[])
{

    set(argv[1],argv[2]);  //set argv[1](=Path) argv[2](=string of dirs)
    printf(2, "set.c file: %s\n", argv[1]);
    printf(2, "set.c file: %s\n", argv[2]);
    exit(0);
}
