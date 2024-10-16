%{
	//Autores: Paula Soriano, NIP:843710 y Carlota Moncasi, NIP:839841
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>

#define PALOS 3
#define DIM 27 //DIMENSION DE LA MATRIZ DE ADYACENCIA
#define BUFF 4000


//tabla de adyacencia
char* tablaTr[DIM][DIM];
//puntero a fila
char* fil;

//inicializa una tabla cuadrada DIM x DIM con la cadena vacia
void iniTabla(char* tabla[DIM][DIM]) {
	for (int i = 0; i < DIM; i++) {
		for (int j = 0; j < DIM; j++) {
			tabla[i][j] = "";
		}
	}
}

/*
 * Calcula la multiplicacion simbolica de matrices 
 * cuadradas DIM x DIM: res = t1*t2
 *
 * CUIDADO: res DEBE SER UNA TABLA DISTINTA A t1 y t2
 * Por ejemplo, NO SE DEBE USAR en la forma:
 *           multiplicar(pot, t, pot); //mal
 */
void multiplicar(char* t1[DIM][DIM], char* t2[DIM][DIM], char* res[DIM][DIM]) {
	for (int i = 0; i < DIM; i++) {
		for (int j = 0; j < DIM; j++) {
			res[i][j] = (char*) calloc(BUFF, sizeof(char));
			for (int k = 0; k < DIM; k++) {
				if (strcmp(t1[i][k],"")!=0 && strcmp(t2[k][j],"") != 0) {
					strcat(strcat(res[i][j],t1[i][k]),"-");
					strcat(res[i][j],t2[k][j]);
				}
			}
		}
	}
}


/* 
Copia la tabla orig en la tabla copia
*/
void copiar(char* orig[DIM][DIM], char* copia[DIM][DIM]) {
	for (int i = 0; i < DIM; i++) {
		for (int j = 0; j < DIM; j++) {
			copia[i][j] = strdup(orig[i][j]);
		}
	}
}
/*
int elevar(int num1, int num2) {
	int pot = 1;
	for(int i=0; i<num2; i++) {
		pot=pot*num1;
	}
	return pot;
}

int a_BaseDiez(int n) {
	int resul=0, i=0;
	while(n!=0) {
		resul+=n%10*elevar(PALOS, i);
		n=n/10;
		i++;
	}
	return resul;
}

*/
/*
Covierte el entero n pasado como parï¿½metro de base PALOS a base decimal
*/
int a_BaseDiez (int n){

	int res = n%10;
	n=n/10;
	int i=1;
	int num=1;
	while(n!=0){

		for(int j=0; j<i; j++) { 
			num=PALOS*num;
		}
		res += num * (n%10);
		n = n/10;
		i++;
	}
	return res;
}


/*
Se pasan como parámetros el estado regular origen, vi, el estado regular destino, vj , 
la matriz de adyacencia del grafo, tablaTr que está copiada en "pot", y 
calcula la potencia k > 0 más pequeña de la matriz de adyacencia, Ck tal que
Ck-1[vi, vj ] = Ø y Ck[vi, vj ] ?= Ø. El valor devuelto por la función es Ck[vi, vj ]
que representa el conjunto de caminos de longitud k en el grafo que permiten
alcanzar vj desde vi, es decir, la matriz "pot"
*/
void numMovimientos(int origen, int destino, char* pot[][DIM]) {
		char* matriz[DIM][DIM];
		copiar(tablaTr, matriz);

		while(strcmp(pot[origen][destino],"")==0){
	
			multiplicar(tablaTr,matriz,pot);
			copiar(pot, matriz);
		}
}

%}

  //nuevo tipo de dato para yylval
%union{
	char* nombre;
}

%token N F C PC OP CP EOL //PONER TODOS LOS TOKENS DE LA GRAMATICA, POR EJEMPLO, ID
%start	state		//variable inicial 

%type<nombre> N  //lista de tokens y variables que su valor semantico,
                     //recogido mediante yylval, es 'nombre' (ver union anterior).
					 //Para estos tokens, yylval serÃ¡ de tipo char* en lugar de int.

%%
state: 
	| state origen F movements_list PC EOL

origen: N {fil=$1;}


movements_list: movement
		| movement C movements_list
	
movement: N OP N CP	{ int n=atoi(fil);
				int resFil=a_BaseDiez(n);
				int n2=atoi($1);
				int resCol=a_BaseDiez(n2);
				tablaTr[resFil][resCol]=$3;
			}

%%

int yyerror(char* s) {
	printf("%s\n");
	return -1;
}

int main() {

	//inicializar tabla de adyacencia
	iniTabla(tablaTr);

	//nodo inicial
	char* estadoIni = "000";
	int estadoInicial = atoi(estadoIni);

	//nodo final
	char* estadoFin = "222";
	int estadoFinal =  atoi(estadoFin);
	
	int error = yyparse();

	
	if (error == 0) {

		//matriz para guardar la potencia
		char* pot[DIM][DIM];
		iniTabla(pot);

		//matriz para guardar una copia de la matriz tablaTr
		copiar(tablaTr, pot);
	
		int origen = a_BaseDiez(estadoInicial);
		int destino = a_BaseDiez(estadoFinal);

		numMovimientos(origen, destino, pot);
		
		printf("Nodo inicial  : %s\n", estadoIni);
		//rellenar los ... con los indices adecuados a vuestro codigo
		printf("Movimientos   : %s\n", pot[origen][destino]);
		printf("Nodo final    : %s\n", estadoFin);

	}


	return error;
}
