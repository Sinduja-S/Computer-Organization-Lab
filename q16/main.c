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
    fptr = fopen(folder, "w+");
    fputs("Santosh Sinduja. S \n COE18B046",fptr);
    fclose(fptr);

 }
void print_user() {
    FILE *fptr;
    fptr = fopen(folder, "r");
    char c[1000],a[100];

    fgets(c,1000,fptr);
    fclose(fptr);
    fptr = fopen(folder, "w");
    int i=0;
    while(1){
        fputc(c[i],fptr);
        if((c[i]=='\n')||(c[i]==eof)){
           break;}
        i++;
    }
    printf("Enter text: ");
    scanf("%s",a);
    fputs(a,fptr);
    fclose(fptr);
 }
int main()
{
    create_folder();
    print_user();
    return 0;
}
