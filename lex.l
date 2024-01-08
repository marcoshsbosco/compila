%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    #define TK_KW_INT 0
    #define TK_ATTR 1
    #define TK_KW_FLOAT 2
    #define TK_KW_CHAR 3
    #define TK_KW_STRING 4
    #define TK_ID 5
    #define TK_NUM_Z 6
    #define TK_NUM_R 7
    #define TK_STR 8
    #define TK_CHAR 9

    int linha = 1;
%}

%%
\n                   {linha++;}
inteiro              {printf("Achei um keyword inteiro (%s).\n", yytext); TK_KW_INT;}
quebrado             {printf("Achei um keyword float (%s).\n", yytext); TK_KW_FLOAT;}
personagem           {printf("Achei um keyword char (%s).\n", yytext); TK_KW_CHAR;}
linha                {printf("Achei um keyword string (%s).\n", yytext); TK_KW_STRING;}
[=^=]                {printf("Achei uma atribuição (%s).\n", yytext); TK_ATTR;}
[a-zA-Z][a-zA-Z0-9]* {printf("Achei uma variável (%s).\n", yytext); TK_ID;}
[0-9]+               {printf("Achei um literal inteiro (%s).\n", yytext); TK_NUM_Z;}
[0-9]*[.][0-9]+      {printf("Achei um literal real (%s).\n", yytext); TK_NUM_R;}
["][^"]*["]          {printf("Achei uma string (%s).\n", yytext); TK_STR;}
['][a-zA-Z0-9][']    {printf("Achei um char (%s).\n", yytext); TK_CHAR;}
[ \t]
.                    {printf("[ERRO] Caracter não reconhecido na linha %d: %s\n", linha, yytext); return -1;}
%%

int yywrap() {}
int main() {

    FILE *fp;
    char filename[50] = "entrada.bosk";
    fp = fopen(filename, "r");
    yyin = fp;

    yylex();

    0;
}
