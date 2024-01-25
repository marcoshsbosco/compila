%{
    #include <stdio.h>
%}


%token <id> ID
%token INT STR FLOAT CHAR
%token TYPE
%token ATTR
%token EOL

%union {
    char *id;
    int intval;
    float floatval;
    char *strval;
    char charval;
}

%type<intval> INT
%type<floatval> FLOAT
%type<strval> STR
%type<charval> CHAR


%%

main:
    /* lambda */
    | statements
    ;

statements:
    statements statement
    | /* lambda */
    ;

statement:
    TYPE ID ATTR expression { printf("[parser] %s recebe algo.\n", $2); }
    ;

expression:
    INT | STR | FLOAT | CHAR | ID
    ;

%%


int main (int argc, char **argv) {
    extern FILE *yyin;
    char filename[50] = "entrada.bosk";
    yyin = fopen(filename, "r");

    yyparse();
}

int yyerror (char *s) {
    fprintf(stderr, "%s\n", s);
}
