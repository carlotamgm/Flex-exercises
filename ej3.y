 // Autores: Carlota Moncasi NIP:839841, Paula Soriano NIP:843710
 // Práctica 3 - Ejercicio 3


//Fichero ej3.y Práctica 3- teoría de la computación
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