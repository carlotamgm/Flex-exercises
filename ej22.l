 // Autores: Carlota Moncasi NIP:839841, Paula Soriano NIP:843710
 // Práctica 3 - Ejercicio 2.2 


/* calcMejor.l fichero para la practica 3 de Teoria de la Computacion */
%{
#include "y.tab.h"
#include <math.h>
#include <stdio.h>
extern int b;
%}
%%
";"	{return(PC);}
";b"	{return(PCB);}
"+"	{return(ADD);}
"-"	{return(SUB);}
"="	{return(EQ);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
"b"	{return(B);}
[0-9]+"b" {yylval=atoi(yytext);
	int result=0;
	int base=b;
	result += (yylval%10);
	yylval/=10;
	while(yylval!=0) {
		result += (yylval%10)*b;
		b=base*b;
		yylval/=10;
	}
	yylval = result;
	return(NUMBER);}
[0-9]+	{yylval=atoi(yytext); return(NUMBER);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
