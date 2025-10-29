%{
#include <stdio.h>
int lc = 0 , sc = 0 , kc = 0  , ic = 0 , ch = 0 , cc = 0;
%}

%%
"//".*                           { cc++; ch += yyleng; } // Single-line comment
"/"([^]|\+[^/])\+\/        { cc++; ch += yyleng; } // Multi-line comment

\n                               { lc++; ch += yyleng; }
[ ]                              { sc++; ch += yyleng; }

if|else|while|for|do|break|printf|return {
                                    kc++; ch += yyleng;
}

[a-zA-Z_][a-zA-Z0-9_]*           { ic++; ch += yyleng; }



.                                { ch += yyleng; }  // Any other character

%%

int yywrap() { return 1; }

int main() {
    printf("Enter input (Ctrl+D to end):\n");
    yylex();
    printf("\nKeywords     : %d\n", kc);
    printf("Identifiers  : %d\n", ic);
    printf("Spaces       : %d\n", sc);
    printf("Lines        : %d\n", lc);
    printf("Comments     : %d\n", cc);
    printf("Characters   : %d\n", ch);
    return 0;
}