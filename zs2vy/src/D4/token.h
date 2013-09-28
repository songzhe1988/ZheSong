
/* Tokens.  */
#define GO 258
#define TURN 259
#define VAR 260
#define JUMP 261
#define FOR 262
#define STEP 263
#define TO 264
#define DO 265
#define COPEN 266
#define CCLOSE 267
#define SIN 268
#define COS 269
#define SQRT 270
#define FLOAT 271
#define ID 272
#define NUMBER 273
#define SEMICOLON 274
#define PLUS 275
#define MINUS 276
#define TIMES 277
#define DIV 278
#define OPEN 279
#define CLOSE 280
#define ASSIGN 281
#define IF 282
#define WHILE 283
#define PROCEDURE 284
#define LESS 285
#define GREATER 286
#define NL 287
#define NG 288
#define NOT 289
#define NE 290
#define CALL 291
#define ELSE 292
#define EQUAL 293
#define PARAM 294



typedef union YYSTYPE
{ int i; node *n; double d;}
        YYSTYPE;
extern YYSTYPE yylval;

