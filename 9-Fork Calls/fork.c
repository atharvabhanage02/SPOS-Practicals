#include<unistd.h>
#include<stdlib.h>
#include<stdio.h>
#include<sys/types.h>
#include<sys/wait.h>

int main(int argc,char * argv[]){
char * lsArgs[3] = {"ls","-l",NULL};
pid_t cPid,pid;
int status,id;
cPid = fork();
if(cPid==0){
id = getpid();
printf("Child id is %d \n",id);
printf("Child executing ls : \n");
execvp(lsArgs[0],lsArgs);
perror("execve failed ");
}else if(cPid>0){
	if((pid = wait(&status))<0){
		perror("wait");
		_exit(1);
	}
	id = getpid();
	printf("Parent id is %d \n",id);
	printf("parent: finished \n");
}else{
perror("fork failed");
_exit(1);
}
return 0;
}
