#include <stdio.h>
#define MAXLINE 1024 

int main(int argc, char* argv[])
{
	// ��������� 
	if(argc == 1)
	{
		printf("�������ļ���\n");
		return 0;
	}
	
	// �ļ�ָ�� 
	FILE *fp;
	// �Ը��ӷ�ʽ�򿪿ɶ�д���ļ���
	// ���ļ������ڣ���ᴴ�����ļ��� 
	// ����ļ����ڣ�д������ݻᱻ�ӵ��ļ�ĩβ��
	fp = fopen(argv[1], "a+"); 
	
	// ������ 
	char buff[MAXLINE];
	// ����׼������ stdin
	// ѭ������
	// buff �������� 
	while(fgets(buff, MAXLINE, stdin))
	{
		printf("%s", buff);
		fprintf(fp, "%s", buff);
	}
	
	// �ر��ļ� 
	fclose(fp);
	
	return 0;
}

