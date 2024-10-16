 // Autores: Carlota Moncasi NIP:839841, Paula Soriano NIP:843710
 // Práctica 3 - Ejercicio 2.1 


%{
#include <stdio.h>
#include <math.h>
int b = 10;
%}
%token NUMBER BASE EOL CP OP B
%start calclist
%token ADD SUB EQ
%token MUL DIV
%%

calclist : /* nada */
        | calclist exp EOL { printf("=%d\n", $2); }
	| calclist B EQ NUMBER EOL { b = $4; }
        ;
exp :   factor
        | exp ADD factor { $$ = $1 + $3; }
        | exp SUB factor { $$ = $1 - $3; }	
        ;
factor :        factor MUL factorsimple { $$ = $1 * $3; }
                | factor DIV factorsimple { $$ = $1 / $3; }
                | factorsimple 
                ;
factorsimple :  OP exp CP { $$ = $2; }
                | NUMBER
		;

%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
int main() {
	yyparse();
}


