

eins.out: zs2vy_D2test-lex scanner 
	./scanner < zs2vy_D2test-lex > eins.out

lex.yy.o:  lex.yy.c token.h symtab.h
	gcc -c lex.yy.c

lex.yy.c: turtle_zs2vy.l
	flex turtle_zs2vy.l
	
scanner:  lex.yy.o symtab.c
	gcc lex.yy.o symtab.c -lfl -o scanner 

clean:
	rm -f scanner lex.* 

