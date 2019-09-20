%{
	#include<stdio.h>
%}

%token NAME NUMBER
%left GE LE NE EQ '<' '>' '%'
%left '-' '+'
%left '*' '/'
%nonassoc UMINUS

%%

statement : NAME '=' exp
	 
	|exp {printf("=%d\n",$1);}
	;

exp : NUMBER {$$ == $1;}
	|exp '+' exp {$$ = $1 + $3 ;}
	|exp '-' exp {$$ = $1 - $3 ;}
	|exp '*' exp {$$ = $1 * $3 ;}
	|exp '/' exp {$$ = $1 / $3 ;}
	|exp '<' exp {$$ = $1 < $3 ;}
	|exp '>' exp {$$ = $1 > $3 ;}
	|exp '%' exp {$$ = $1 % $3 ;}
	|exp GE exp {$$ = $1 >= $3 ;}
	|exp LE exp {$$ = $1 <= $3 ;}
	|exp EQ exp {$$ = $1 == $3 ;}
	|exp NE exp {$$ = $1 != $3 ;}
	|exp '-' exp %prec UMINUS {$$ = -$2 ;}
	|'(' exp ')' {$$ = $2 ;}
;

%%

int main()
{
yyparse();
}

int yyerror()
{
}

int yywrap()
{
return 1;
}
