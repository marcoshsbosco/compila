%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "bosk.tab.h"

    int linha = 1;
%}

%%
\n                   {linha++;}
inteiro              {printf("[lexer] TYPE (int)\n"); return TYPE;}
quebrado             {printf("[lexer] TYPE (float)\n"); return TYPE;}
personagem           {printf("[lexer] TYPE (char)\n"); return TYPE;}
linha                {printf("[lexer] TYPE (str)\n"); return TYPE;}
[=^=]                {printf("[lexer] ATTR\n"); return ATTR;}
[a-zA-Z][a-zA-Z0-9]* {printf("[lexer] ID (%s)\n", yytext); yylval.id = (char *) strdup(yytext); return ID;}
[0-9]+               {printf("[lexer] INT\n"); yylval.intval = atoi(yytext); return INT;}
[0-9]*[.][0-9]+      {printf("[lexer] FLOAT\n"); return FLOAT;}
["][^"]*["]          {printf("[lexer] STR\n"); return STR;}
['][a-zA-Z0-9][']    {printf("[lexer] CHAR\n"); return CHAR;}
[ \t]
.                    {printf("[ERRO] Caracter não reconhecido na linha %d: %s\n", linha, yytext); return -1;}
%%

int yywrap() {}

