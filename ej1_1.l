 // Autores: Carlota Moncasi NIP:839841, Paula Soriano NIP:843710
 // Práctica 2 - Ejercicio 1.1 
%%
>.\n {printf("%s", yytext);}
A{2,} {printf("A"); printf("%d", yyleng);}
G{2,} {printf("G"); printf("%d", yyleng);}
T{2,} {printf("T"); printf("%d", yyleng);}
C{2,} {printf("C"); printf("%d", yyleng);}
[AGTC] {printf("%s", yytext);}
\n {printf("\n");}
%% 
