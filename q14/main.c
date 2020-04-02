#include <stdio.h>
#include <stdlib.h>
#include<dir.h>
#include<string.h>
char folder[1000];
void create_folder() {
    FILE *fptr;
    int flag;
    printf("Enter a directory path and name of file:");
    gets(folder);
    flag = mkdir(folder);

    if (!flag)
        printf("Folder created\n");

    else
    {
        printf("Unable to create folder");
    }
    strcat(folder,"/text.txt");
    fptr = fopen(folder, "w");
    fputs("Santosh Sinduja. S \n COE18B046",fptr);
    fclose(fptr);

 }
int main()
{
    create_folder();
    return 0;
}
