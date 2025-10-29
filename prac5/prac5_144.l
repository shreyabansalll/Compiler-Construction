%{
#include <stdio.h>
#include <stdlib.h>

void decToHex(int num) {
    char hex[20];
    int i = 0;

    if (num == 0) { printf("0\n"); return; }

    while (num > 0) {
        int r = num % 16;
        hex[i++] = (r < 10) ? r + '0' : r - 10 + 'A';
        num /= 16;
    }
    while (--i >= 0) printf("%c", hex[i]);
    printf("\n");
}
%}

%%
[0-9]+  { int n = atoi(yytext);
          printf("Decimal: %d  Hex: ", n);
          decToHex(n);
        }
[ \t\n] ;  // ignore spaces/newlines
.        { printf("Invalid: %s\n", yytext); }
%%

int main() { yylex(); }
int yywrap() { return 1; }
