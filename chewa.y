%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <stdarg.h>
	#include "calc.h"

	const int MAX_VARS = 26;	// Vars are stored in letters a to z

	nodeType *operation(int operator, int numOperands, ...);
	nodeType *variable(char *name);
	nodeType *constant(double value);

	void freeNode(nodeType *);

	int ex(nodeType *node);

	int yylex(void);
	void yyerror(char *);

	extern int yylineno;
%}

%union {
	double number;
	char *name;
	node *nodePtr;
}

%token <name> VARIABLE
%token <number> NUMBER
%token NGATI LEMBA GE LE EQ NE;
%type <nodePtr> expr stmt stmt_list

%%

program: function 					{ exit(EXIT_SUCCESS); }
		 ;

function: function stmt				{ ex($2); freenode($2); }
		  | /* NULL */
		  ;

stmt: ';'							{ $$ = operation(';', 2, NULL, NULL); }
	  | expr ';'					{ $$ = $1; }
	  | VARIABLE '=' expr ';'		{ $$ = operation('=', 2, $1, $3); }
	  | NGATI expr block KAPENA bloc

statement: expr						{ $$ = $1; }
		   | VARIABLE '=' expr		{ sym[$1] = $3; }

expr: expr '+' exprP				{ $$ = $1 + $3; }
	  | expr '-' exprP				{ $$ = $1 - $3; }
	  | exprP						{ $$ = $1; }

exprP: exprP '*' exprM				{ $$ = $1 * $3; }
	   | exprP '/' exprM			{ $$ = $1 / $3; }
	   | exprM						{ $$ = $1; }
	   
exprM: NUMBER
	   | VARIABLE					{ $$ = sym[$1]; }
	   | '(' expr ')'				{ $$ = $2; }
	   | '-' exprM					{ $$ = - $2; }

%%

void yyerror(char *s) {
	fprintf(stderr, "Error on line #%d: %s\n", yylineno, s);
}

int sym[26];

int main(void) {
	yyparse();
	return 0;
}
