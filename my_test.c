
#include "types.h"
#include "stat.h"
#include "user.h"

int
main(void)
{
	int pid;
	int p = 15;

	if ((pid = fork()) < 0) 
	{
		// if fork has errors
		printf(1, "Unable to fork!\n");
		exit(-1);
	}
	if (pid == 0) {
		//process child goes in here
		printf(1,"I'm a child process..now exiting\n");
		exit(3);
	}
	printf(1,"Parent process is now waiting for childs to finish\n");
	wait(&p);
	printf(1,"Parent process is now returning int 144\n");
	return 144;
}