%{
#include <stdio.h>
int line = 0;
%}

%%
^.*COM$ {line++; printf("line %d string end with COM: %s",line, yytext);} 
^.+$ {line++;}
\n {} 
%%
int yywrap(){return 1;}
int main(){
	yylex();
	return 0;
}
