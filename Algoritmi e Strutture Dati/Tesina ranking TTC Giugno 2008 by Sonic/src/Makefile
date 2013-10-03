## RANKING  --  Makefile

BIN = ranking
CC = gcc
LEX = flex
YACC = bison
CFLAGS = -std=c99 $(ANSI_EXTENSIONS)
DBGFLAGS = -DDEBUG -ggdb3 -pedantic -Wall
OBJS = lex.yy.c y.tab.c main.c
OPTFLAGS = -O3
LEXFLAGS = -v
YACCFLAGS = -v -d
BISONFLAGS = $(YACCFLAGS) -y
RM = rm -vfr
TAR = tar cfvz
INSTALL = /usr/bin/install -c
INSTALLDIR = /usr/bin

## (resolve lib)
## to be used with SCO UnixWare and SINIX/Reliant UNIX platforms
RESOLVELIB = -lresolve

## some functions like strcasestr() are usually implemented in glibc
## and BSD-libc but are not standard and some OSes still may miss it.
##
## use ANSI_EXTENSIONS on CFLAGS to not override them.
ANSI_EXTENSIONS = -DHAVE_STRCASESTR -DHAVE_STRCASECMP


##
all : ranking

ranking : $(OBJS)
	$(CC) -o $(BIN) $(OBJS) $(CFLAGS) $(OPTFLAGS)

debug : $(OBJS)
	$(CC) -o $(BIN) $(OBJS) $(CFLAGS) $(DBGFLAGS)

lex.yy.c : lexer.l 
	$(LEX) $(LEXFLAGS) lexer.l

y.tab.c : parser.y
	$(YACC) $(BISONFLAGS) parser.y

clean : 
	-$(RM) *.o lex.yy.c y.tab.* *.output *.dSYM $(BIN)

# create a tar.gz snapshot with time info
tar : clean
	$(TAR) $(BIN)_`date +%y%m%d_%H%M`.tar.gz .

# installation
install : 
	$(INSTALL) $(BIN) $(INSTALLDIR)

