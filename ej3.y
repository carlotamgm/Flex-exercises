 // Autores: Carlota Moncasi NIP:839841, Paula Soriano NIP:843710
 // Pr�ctica 3 - Ejercicio 3


//Fichero ej3.y Pr�ctica 3- teor�a de la computaci�n
%{ #include <stdio.h>
%}

%token X Y Z EOL
%start gramatica

%%
gramatica: /*nada*/
		| gramatica c X s EOL
		| EOL
		;
s: /*nada*/
	|c X s
	;
b: X c Y
	| X c
	;
c: X b X 
	| Z
	;
%%
int yyerror(char* s) {
	printf("\n%s\n", s);
	return 0;
}
int main() {
	yyparse();
}