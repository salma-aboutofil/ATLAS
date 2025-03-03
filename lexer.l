%{
#include<stdio.h>
#include<stdlib.h>
%}
%%
[0-9]+ {printf("Number:%s",yytext);}
"CONST"|"TYPE"|"VAR"|"SOUS_PROG"|"DEBUT"|"FIN"|"Programme" {printf("Keywords:%s",yytext);}
%%
int main() {
    yylex();  
    return 0;
}

int yywrap() { return 1; }