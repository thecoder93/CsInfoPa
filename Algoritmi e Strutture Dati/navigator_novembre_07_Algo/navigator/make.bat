flex scanner.fl
bison -d parser.y --verbose
gcc -ansi -o navigator.exe lex.yy.c parser.tab.c libreria.c libreria.h
