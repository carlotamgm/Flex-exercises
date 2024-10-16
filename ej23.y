 // Autores: Carlota Moncasi NIP:839841, Paula Soriano NIP:843710
 // Práctica 3 - Ejercicio 2.3


/* calcMejor.y fichero para la practica 3 de Teoria de la Computacion  */
%{
#include <stdio.h>
int acum = 0;
%}
%token NUMBER EOL CP OP ACUM EQU
%start calclist
%token ADD SUB
%token MUL DIV
%%

calclist : /* nada */
        | calclist exp EOL { printf("=%d\n", $2); }
	| calclist ACUM EQU exp EOL { acum = $4; }
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
		| ACUM {$$ = acum;}
		;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
int main() {
  yyparse();
}

