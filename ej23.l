 // Autores: Carlota Moncasi NIP:839841, Paula Soriano NIP:843710
 // Práctica 3 - Ejercicio 2.3


/* calcMejor.l fichero para la practica 3 de Teoria de la Computacion */
%{
#include "y.tab.h"
%}
%%
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
"acum" {return(ACUM);}
":="	{return(EQU);}
%%
