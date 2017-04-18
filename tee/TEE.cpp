#include <stdio.h>
#define MAXLINE 1024 

int main(int argc, char* argv[])
{
	// 避免误操作 
	if(argc == 1)
	{
		printf("请输入文件名\n");
		return 0;
	}
	
	// 文件指针 
	FILE *fp;
	// 以附加方式打开可读写的文件。
	// 若文件不存在，则会创建该文件。 
	// 如果文件存在，写入的数据会被加到文件末尾。
	fp = fopen(argv[1], "a+"); 
	
	// 缓冲区 
	char buff[MAXLINE];
	// 将标准输入流 stdin
	// 循环读入
	// buff 缓冲区中 
	while(fgets(buff, MAXLINE, stdin))
	{
		printf("%s", buff);
		fprintf(fp, "%s", buff);
	}
	
	// 关闭文件 
	fclose(fp);
	
	return 0;
}

