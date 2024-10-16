 // Autores: Carlota Moncasi NIP:839841, Paula Soriano NIP:843710
 // Práctica 3 - Ejercicio 2.2


%{
#include <stdio.h>
#include <math.h>
int b = 10;
%}
%token NUMBER EOL CP OP B PC
%start calclist
%token ADD SUB EQ PCB
%token MUL DIV
%%

calclist : /* nada */
        | calclist exp PC EOL { printf("=%d\n", $2); }
	| calclist B EQ NUMBER EOL { b = $4; }
	| calclist exp PCB EOL { int op = $2; 
                     const int MAX=100;
                                int res[MAX];
                                int cont=MAX-1;
                                while(op!=0){
                                    res[cont]= op%b;
                                    op /= b;
                                    cont--; 
                                }
                                printf("=");
                                for(int j=cont+1; j<100; j++){
                                    printf("%d",res[j]);
                                }
                                printf("\n");
                                }
        ;
exp :   factor
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$  = $1 - $3; }
	
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


