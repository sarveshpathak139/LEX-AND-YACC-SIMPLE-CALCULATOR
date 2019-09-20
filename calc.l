
%{
	#include<stdlib.h>
	#include "y.tab.h"
	extern int yylval;
%}

%%

[0-9]+ {yylval=atoi(yytext); return NUMBER;}

">=" return GE;
"<=" return LE;
"!=" return NE;
"==" return EQ;
[\n] return 0;
[\t]; 

. return yytext[0];

%%
