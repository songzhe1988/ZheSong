
%{
#include <stdio.h>
#include "symtab.h"
%}

%union { int i; node *n; double d;}

%token GO TURN VAR JUMP
%token FOR STEP TO DO
%token IF ELSE WHILE PROCEDURE CALL PARAM
%token EQUAL LESS GREATER NL NG NOT NE
%token COPEN CCLOSE
%token SOPEN SCLOSE
%token SIN COS SQRT
%token <d> FLOAT
%token <n> ID               
%token <i> NUMBER       
%token SEMICOLON PLUS MINUS TIMES DIV OPEN CLOSE ASSIGN

%type <n> decl
%type <n> decllist
%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE
%%
program: head decllist stmtlist tail;

head: { printf("%%!PS Adobe\n"
               "\n"
	       "newpath 0 0 moveto\n"
	       );
      };

tail: { printf("stroke\n"); };

decllist: ;
decllist: decllist decl;

decl: VAR ID SEMICOLON { printf("/tlt%s 0 def\n",$2->symbol);} ;


stmtlist: ;
stmtlist: stmtlist stmt ;

stmt: ID ASSIGN expr SEMICOLON {printf("/tlt%s exch store\n",$1->symbol);} ;
stmt: GO expr SEMICOLON {printf("0 rlineto\n");};
stmt: JUMP expr SEMICOLON {printf("0 rmoveto\n");};
stmt: TURN expr SEMICOLON {printf("rotate\n");};
stmt: TURN PARAM SEMICOLON {printf("rotate\n");}; 

stmt: FOR ID ASSIGN expr 
          STEP expr
	  TO expr
	  DO {printf("{ /tlt%s exch store\n",$2->symbol);} 
	   stmt {printf("} for\n");};


stmt: IF OPEN compr CLOSE      
       {printf("{");}
       | theif 
       | theel
       {printf("} {");}
       stmt {printf("} ifelse\n");};
theif: stmt{printf("} if\n");};
theel: stmt ELSE;

stmt: WHILE
       {printf("{");}
       OPEN compr CLOSE 
       {printf("{} {exit} ifelse\n");}
       stmt{printf("} loop\n");};

stmt: PROCEDURE ID
      {printf("/proc%s {\n",$2->symbol);}
      stmt{printf("} def\n");};

stmt: CALL ID expr expr expr expr SEMICOLON
     {printf(" proc%s\n",$2->symbol);};

stmt: COPEN stmtlist CCLOSE;	
stmt: SOPEN stmtlist SCLOSE;

compr: ID EQUAL NUMBER {printf("tlt%s %d eq \n",$1->symbol,$3);}
       | ID LESS NUMBER {printf("tlt%s %d lt \n",$1->symbol,$3);}
       | ID GREATER NUMBER {printf("tlt%s %d gt \n",$1->symbol,$3);}
       | ID NL NUMBER {printf("tlt%s %d ge \n",$1->symbol,$3);}
       | ID NG NUMBER {printf("tlt%s %d le \n",$1->symbol,$3);};

expr: expr PLUS term { printf("add ");};
expr: expr MINUS term { printf("sub ");};
expr: term;
expr: PARAM { printf("");};



term: term TIMES factor { printf("mul ");};
term: term DIV factor { printf("div ");};
term: factor;

factor: MINUS atomic { printf("neg ");};
factor: PLUS atomic;
factor: SIN factor { printf("sin ");};
factor: COS factor { printf("cos ");};
factor: SQRT factor { printf("sqrt ");};
factor: atomic;



atomic: OPEN expr CLOSE;
atomic: NUMBER {printf("%d ",$1);};
atomic: FLOAT {printf("%f ",$1);};
atomic: ID {printf("tlt%s ", $1->symbol);};


%%
int yyerror(char *msg)
{  fprintf(stderr,"TheError: %s\n",msg);
   return 0;
}

int main(void)
{   yyparse();
    return 0;
}

