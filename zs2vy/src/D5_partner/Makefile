
all: turtle eins.ps

eins.ps: eins.tlt turtle
	./turtle < eins.tlt > eins.ps

lex.yy.o:  lex.yy.c turtle.tab.h symtab.h
	gcc -c lex.yy.c

lex.yy.c: turtle_wz6pc.l
	flex turtle_wz6pc.l
	
turtle.tab.h: turtle_wz6pc.y
	bison -d turtle_wz6pc.y
	
turtle.tab.c: turtle_wz6pc.y
	bison -d turtle_wz6pc.y
	
turtle.tab.o: turtle.tab.c symtab.h
	gcc -c turtle_wz6pc.tab.c

turtle: turtle.tab.o lex.yy.o symtab.c
	gcc lex.yy.o turtle_wz6pc.tab.o symtab.c -lfl -o turtle

clean:
	rm -f turtle lex.* turtle_wz6pc.tab.* *.o eins.ps

