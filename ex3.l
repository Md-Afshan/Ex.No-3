%{
#include "y.tab.h"
%}

%%

"=" { printf("\n Operator is EQUAL"); return '='; } 
"+" { printf("\n Operator is PLUS"); return PLUS; } 
"-" { printf("\n Operator is MINUS"); return MINUS; } 
"/" { printf("\n Operator is DIVISION"); return DIVISION; } 
"*" { printf("\n Operator is MULTIPLICATION"); return MULTIPLICATION; } 
[a-zA-Z][a-zA-Z0-9]* { printf("\n Identifier is %s", yytext); return ID; }
. { return yytext[0]; }
\n { return 0; }

%%

int yywrap() { return 1; }
