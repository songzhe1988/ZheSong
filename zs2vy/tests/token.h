
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
#define WHILE  282
#define PROCEDURE 283
#define COMMA 284
#define IF 285
#define ELSE 286
#define THEN 287
#define BOPEN 288
#define BCLOSE 289
#define GREATER 290
#define SMALLER 291
#define GE 292
#define SE 293
#define OR 294
#define AND 295
#define EQUAL 296



typedef union YYSTYPE
{ int i; node *n; double d;}
        YYSTYPE;
YYSTYPE yylval;

