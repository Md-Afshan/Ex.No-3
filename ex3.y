
%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *s);
%}

%token ID PLUS MINUS MULTIPLICATION DIVISION

%%
statement: ID '=' E {
    printf("\nValid arithmetic expression\n");
    $$ = $3;
}
;

E: E PLUS ID
 | E MINUS ID
 | E MULTIPLICATION ID
 | E DIVISION ID
 | ID
;

%%

extern FILE* yyin;

int main() {
    yyin = stdin;
    do {
        yyparse();
    } while (!feof(yyin));
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

