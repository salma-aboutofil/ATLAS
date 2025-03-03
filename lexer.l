%{
    #include<stdio.h>
    #include<stdlib.h>
%}

constbool  vrai|faux  
keyword   alors|autre|ascii|bool|car|cas|chaine|chr|const|continuer|dbloc|de|debut|dfonct|div|dproc|drecord|dreel|ecrire|ecrirerc|ent|et|faire|fbloc|fcas|ffonct|fin|fixe|fonct|fproc|fpour|frecord|fsi|ftantque|jusqua|lire|lirerc|long|mod|modif|non|ou|parmis|partent|pas|pour|proc|programme|puiss|rc|record|repeter|retourner|sauter|si|sinon|sreel|struct|tableau|tantque|type|valabs|var|vaut|xou
number     [0-9]+ 
id         [a-zA-Z][0-9a-zA-Z]*   
plusOpr    "+"  
divOpr     "/"
mulOpr     "*"
subOpr     "-"
modOpr     "mod"
divEntOpr  "div"
puissOpr   "\^"
rcOpr      "rc"
factOpr    "!"
affectOpr  ":="
COMMENT    "%".*
SEMICOLON  ";"
car        \'([^\\']|\\.)\'  
ent        -?{number}
real       -?{number}(\.{number})?
chaine     \"[^\"]*\"
espace     " "
tabulation \t
newline    \n
datatype   (ent|real|sreel|dreel|chaine|car|bool) 
ARRAYTYPE  tableau \[[0-9]+\.\.[0-9]+\](\[[0-9]+\.\.[0-9]+\])? de {datatype}

%% 
{tabulation}  { printf("tabulation: %s\n", yytext); }
{newline}     { printf("newline: %s\n", yytext); }
{espace}      { printf("espace: %s\n", yytext); }
{constbool}   { printf("Boolean constant: %s\n", yytext); }
{id}          { printf("Identifier: %s\n", yytext); }
{keyword}     { printf("Keyword: %s\n", yytext); }
{SEMICOLON}   { printf("Semicolon: %s\n", yytext); }
{COMMENT}     { printf("Comment: %s\n", yytext); }
{car}         { printf("car: %s\n", yytext); }
{ent}         { printf("ent: %s\n", yytext); }
{real}        { printf("Real: %s\n", yytext); }
{chaine}      { printf("chaine: %s\n", yytext); }
{plusOpr}     { printf("plusOpr: %s\n", yytext); }
{divOpr}      { printf("divOpr: %s\n", yytext); }
{mulOpr}      { printf("mulOpr: %s\n", yytext); }
{subOpr}      { printf("subOpr: %s\n", yytext); }
{modOpr}      { printf("modOpr: %s\n", yytext); }
{divEntOpr}   { printf("divEntOpr: %s\n", yytext); }
{puissOpr}    { printf("puissOpr: %s\n", yytext); }
{rcOpr}       { printf("rcOpr: %s\n", yytext); }
{factOpr}     { printf("factOpr: %s\n", yytext); }
{affectOpr}   { printf("affectOpr: %s\n", yytext); }
.             { printf("Unknown token: %s\n", yytext); }

%%

int main() {
    yylex();  
    return 0;
}

int yywrap() { return 1; }