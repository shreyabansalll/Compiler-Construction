%{
#include <stdio.h>
int ac =0 ;
%}
%%
[aA][a-zA-Z]* {ac++;}
[b-zB-Z][a-zA-Z]* { }
%%
int yywrap(){return 1;}
int main(){
	printf("Enter input: ");
	yylex();
	printf("count of a: %d", ac);
	return 0;
}
