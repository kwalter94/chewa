%{
#include <stdlib.h>
void yyerror(char *);
#include "calc.tab.h"
%}

%%
"ngati"			return NGATI;
"kapena"		return KAPENA;							
"lemba"			return LEMBA;

[_a-z]+			{
			    yylval.variable = yytext;
			    return VARIABLE;
			}

[1-9][0-9]*(\.[0-9]+)?	{
			    yylval.number = atof(yytext);
			    return NUMBER;
			}

0(\.[0-9]+)?		{
			    yylval.number = atof(yytext);
			    return NUMBER;
			}

[-+()<>=/*;]		{ return *yytext; }

">="			return GE;
"<="			return LE;
"=="			return EQ;
"!="			return NE;

[ \t\n]+		;	// Skip whitespace

%%

int yywrap(void) {
	return 1;
}
