  // Autores: Carlota Moncasi NIP:839841, Paula Soriano NIP:843710
 // Práctica 2 - Ejercicio 1.2
%s texto
%s detecta_a
%s detecta_g
%s detecta_c
%s detecta_t
%%
>.*\n {BEGIN(texto); printf("%s", yytext);}
A {BEGIN(detecta_a); printf("%s", yytext);}
G {BEGIN(detecta_g); printf("%s", yytext);}
C {BEGIN(detecta_c); printf("%s", yytext);}
T {BEGIN(detecta_t); printf("%s", yytext);}
<detecta_a>[2-9] {for(int i=0; i < atoi(yytext)-1; i++) {printf("A");}}
<detecta_g>[2-9] {for(int i=0; i < atoi(yytext)-1; i++) {printf("G");}}
<detecta_c>[2-9] {for(int i=0; i < atoi(yytext)-1; i++) {printf("C");}}
<detecta_t>[2-9] {for(int i=0; i < atoi(yytext)-1; i++) {printf("T");}}

%%
