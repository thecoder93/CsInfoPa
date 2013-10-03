CC = gcc
CFLAGS = -ansi
EXEC = navigator

all :$(EXEC)

navigator : lex.yy.c parser.tab.c libreria.c libreria.h
	 $(CC) -o $(EXEC) $^ -g $(CFLAGS)

lex.yy.c : scanner.fl 
	 flex scanner.fl

parser.tab.c : parser.y
	     bison -d parser.y --verbose

clean : 
	rm -rf *.o lex.yy.c parser.tab.* *.output *.dSYM
