#include <stdio.h>
#include <stdlib.h>
print_file() {
   FILE *fptr;
   char c;
   fptr = fopen("text.txt", "r");
   c=fgetc(fptr);
   while(c!=EOF){
   printf("%c",c);
    c=fgetc(fptr);
   }
   fclose(fptr);
}
int main()
{
    print_file();
    return 0;
}
