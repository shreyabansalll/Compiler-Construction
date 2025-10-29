%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}
%token NUMBER
%left '+' '-'
%left '*' '/'
%right UMINUS
%%
input:
    | input line
    ;
line:
    '\n'
    | expr '\n'     { printf("= %d\n", $1); }
    | error '\n'    { yyerror("Invalid expression, try again"); yyerrok; }
    ;
expr:
    NUMBER
    | expr '+' expr     { $$ = $1 + $3; }
    | expr '-' expr     { $$ = $1 - $3; }
    | expr '*' expr     { $$ = $1 * $3; }
    | expr '/' expr     { $$ = $3 ? $1 / $3 : (yyerror("Divide by zero"), 0); }
    | '-' expr %prec UMINUS { $$ = -$2; }
    | '(' expr ')'      { $$ = $2; }
    ;
%%
void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}
int main() {
    printf("Enter expression:\n");
    yyparse();
    return 0;
}

