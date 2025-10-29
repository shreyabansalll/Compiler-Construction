%{
#include "prac9_144.tab.h"
%}

%%
"for"        return FOR;
"("          return LPAREN;
")"          return RPAREN;
"{"          return LBRACE;
"}"          return RBRACE;
";"          return SEMI;
"="          return ASSIGN;
"++"         return PLUSPLUS;
"--"         return MINUSMINUS;
"+"          return PLUS;
"-"          return MINUS;
"<"          return LT;
">"          return GT;

[0-9]+       { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]*   return ID;
[ \t\n]      ;
.            { printf("Invalid character: %s\n", yytext); }
%%

int yywrap() { return 1; }