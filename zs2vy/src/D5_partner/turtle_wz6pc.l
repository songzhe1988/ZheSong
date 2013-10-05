
%{
#include "symtab.h"
#include "turtle_wz6pc.tab.h"
%}

%%

\/\/.*          ;
[[:space:]]     ;

GO              return GO;
TURN            return TURN; 
VAR             return VAR;
JUMP            return JUMP;
FOR             return FOR;
STEP            return STEP;
TO              return TO;
DO              return DO;
BEGIN           return COPEN;
END             return CCLOSE;

IF              return IF;
THEN            return THEN;
ELSE            return ELSE;

PROCEDURE       return PROCEDURE;
\{              return OPENCURLYBRACKET;
\}              return CLOSECURLYBRACKET;
,               return COMMA;
PARAM			return PARAM;
CALL			return CALL;

WHILE           return WHILE;

\>              return LARGER;
\<              return SMALLER;
UP              return UP;
DOWN            return DOWN;
NORTH           return NORTH;
EAST            return EAST;

sin             return SIN;
cos             return COS;
sqrt            return SQRT;

;               return SEMICOLON;
\+              return PLUS;
-               return MINUS;
\*              return TIMES;
\/              return DIV;
\(              return OPEN;
\)              return CLOSE;
=               return ASSIGN;

[a-z]+          { yylval.n = lookup(yytext); 
                  if (yylval.n==NULL)
		    yylval.n = insert(yytext);
                  return ID;
		}
    
[0-9]+\.[0-9]+  yylval.d = atof(yytext);  return FLOAT;
[0-9]+          yylval.i = atoi(yytext);  return NUMBER;

.               fprintf(stderr,"Unexpected character %c (%2X)\n",yytext[0],yytext[0]);

%%
