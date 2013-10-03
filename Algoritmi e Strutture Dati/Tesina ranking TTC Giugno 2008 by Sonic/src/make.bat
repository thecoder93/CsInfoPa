@echo off
rem  RANKING  --  make.bat
rem
rem  Usage: make
rem  Usage: make clean
rem
rem  -- Dario Banno' 2008


if (%1) == (all)		goto all
if (%1) == (ranking)	goto all
if (%1) == ()			goto all
if (%1) == (clean)		goto clean

echo %0: *** No rule to make target '%1'.	Stop.
goto end


:all
goto ranking


:ranking
flex -v lexer.l
bison -v -d -y parser.y
gcc -o ranking -std=c99 -O3 *.c
goto end


:clean
del /q lex.yy.c y.tab.* *.output *.dSYM ranking.exe
goto end


:end
