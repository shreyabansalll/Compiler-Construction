%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token FOR LPAREN RPAREN LBRACE RBRACE SEMI ID NUMBER
%token ASSIGN LT GT PLUS MINUS PLUSPLUS MINUSMINUS

%%
program:
    for_stmt
    ;

for_stmt:
    FOR LPAREN init SEMI cond SEMI inc RPAREN block
    { printf("Correct 'for' loop format!\n"); }
    ;

init:
    ID ASSIGN NUMBER
    ;

cond:
    ID LT NUMBER
  | ID GT NUMBER
    ;

inc:
    ID ASSIGN ID PLUS NUMBER
  | ID ASSIGN ID MINUS NUMBER
  | ID PLUSPLUS
  | ID MINUSMINUS
    ;

block:
    LBRACE stmt_list RBRACE
    ;

stmt_list:
      /* empty */
    | stmt_list statement
    ;

statement:
    ID ASSIGN ID PLUS NUMBER SEMI
  | ID ASSIGN ID MINUS NUMBER SEMI
  | ID ASSIGN NUMBER SEMI
    ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Format error: %s\n", s);
}

int main(void) {
    printf("Enter a for loop:\n");
    yyparse();}