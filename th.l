%{
	//Autores: Paula Soriano, NIP:843710 y Carlota Moncasi, NIP:839841
#include "y.tab.h"
#include <string.h>
%}
%%
[0-9]+	{yylval.nombre=strdup(yytext);return(N);}
"("	{return(OP);}
")"	{return(CP);}
\n	{return(EOL);}
","	{return(C);}
";"	{return(PC);}
[ \t]	{	}
"->"	{return(F);}
.
%%

