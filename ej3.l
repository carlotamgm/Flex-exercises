
  // Autores: Carlota Moncasi NIP:839841, Paula Soriano NIP:843710
  // Práctica 2 - Ejercicio 3
%{
#include <stdio.h>
#include <stdbool.h>
int PJ=0;
int PC=0;
int cString=0;
int cFloat=0;
bool soloUnoIncl=true;
bool soloUnoImp=true;
%}
%x comentario
%%
"/*"	{BEGIN(comentario);}
<comentario>"*"+"/"	{BEGIN(INITIAL);}
#include	{ if(soloUnoIncl){
			PC+=10;
			soloUnoIncl=false;
	    	  }
		}
" "*import		{if(soloUnoImp){
				PJ+=10;
				soloUnoImp=false;
	    		 }
			}
String" "*([A-Za-z]|[0-9])+[A-Za-z]_	{if(cString<5){
						PJ++;
						cString++;
	    				 }
					}
int|char|float" "*&" "*([A-Za-z]|[0-9])+[A-Za-z]_	{if(cFloat<5){
								PC++;
								cFloat++;
	    						 }
							}
["][^"]+["]
"//".*\n							
<INITIAL,comentario>.
<INITIAL,comentario>\n
%%
int main(){
int error = yylex();
if(error == 0) {
	printf("PJ: %d\n", PJ);
	printf("PC: %d\n", PC);
	if(PC>PJ){
		printf("CLASIFICADO: C++\n");
	}
	else{
		printf("CLASIFICADO: JAVA\n");
	}
	return error;
}
}
