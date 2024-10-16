  // Autores: Carlota Moncasi NIP:839841, Paula Soriano NIP:843710
  // Práctica 2 - Ejercicio 2
%{
int AVL=0;
int AVR =0;
int DTIFA =0;
int DTIMD =0;
int FFSL=0;
int FFSX=0;
int PET=0;
int CSF=0;
%}

%%
_[0-9][0-9]_[0-9][0-9]_[0-9][0-9].*\n {printf("\n");}
(_LH_|LEFT).*UCBERKELEYAV {AVL++; printf(yytext);}
(_RH_|RIGHT).*UCBERKELEYAV {AVR++;  printf(yytext);}
^FA.*DTIROI {DTIFA++; printf(yytext);}
^MD.*DTIROI {DTIMD++; printf(yytext);}
UCSFFSL {FFSL++; printf(yytext);}
UCSFFSX {FFSX++; printf(yytext);}
BAIPETNMRC {PET++; printf(yytext);}
UPENNBIOMK9 {CSF++; printf(yytext);}
%%

int main(){
int error = yylex();
if(error == 0) {
	
        printf("FFSL: %d\n", FFSL);
	printf("FFSX: %d\n", FFSX);
	printf("PET: %d\n", PET);
        printf("AV-L: %d\n", AVL);
        printf("AV-R: %d\n", AVR);
        printf("DTI-FA: %d\n", DTIFA );
        printf("DTI-MD: %d\n", DTIMD);
	printf("CSF: %d\n", CSF);

        }
        return error;
}

