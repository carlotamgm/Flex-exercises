 // Autores: Carlota Moncasi NIP:839841, Paula Soriano NIP:843710
 // Práctica 3 - Ejercicio 3 


/* ej3.l fichero para la practica 3 de Teoria de la Computacion */
%{
#include "y.tab.h"
%}
%%
"x"	{return(X);}
"y"	{return(Y);}
"z"	{return(Z);}
\n	{return(EOL);}
%%
