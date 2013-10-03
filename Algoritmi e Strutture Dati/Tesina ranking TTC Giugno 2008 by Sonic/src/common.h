/* RANKING
 *
 * Tesina di Teoria e Tecniche di Compilazione (Giugno 2008)
 *
 * autore: Dario Banno' <captainsonic@gmail.com>
 */


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>


#ifndef bool
#define bool	char
#endif

#ifndef TRUE
#define TRUE	1
#endif

#ifndef FALSE
#define FALSE	0
#endif

#ifndef DEBUG
#define DEBUG_LEVEL	0
#else
#ifndef DEBUG_LEVEL
#define DEBUG_LEVEL	1
#endif
#endif


#define DEFAULT_MAXDEPTH	2

#include "y.tab.h" /* must be placed after YYSTYPE definition (if any) */



/* Immagini JPG, PNG */
#define JPG		".jpg"
#define JPEG	".jpeg"
#define PNG		".png"
#define SCORE_JPG	2


/* Immagini GIF */
#define GIF	".gif"
#define SCORE_GIF	1


/* Sorgenti C, C++ */
#define C	".c"
#define CPP	".cpp"
#define SCORE_C	5


/* Sorgenti JAVA */
#define JAVA	".java"
#define SCORE_JAVA	5


/* Archivi ZIP/RAR/TAR/GZ/... */
#define ZIP		".zip"
#define RAR		".rar"
#define TAR		".tar"
#define GZIP	".gz"
#define BZIP2	".bz2"
#define CAB		".cab"	/* Microsoft Cabinet */
#define ACE		".ace"
#define SEVZIP	".7z"
#define DMG		".dmg"
#define SCORE_ZIP	5


/* Documenti PDF */
#define PDF	".pdf"
#define SCORE_PDF	4


/* Documenti di testo generici */
#define TXT	".txt"
#define XML	".xml"
#define SCORE_TXT	4


/* Documenti Office, OpenOffice */
#define RTF		".rtf"
#define RTFD	".rtfd"
#define DOC		".doc"
#define DOCX	".docx"
#define DOCM	".docm"
#define ODF		".odf"
#define ODT		".odt"
#define PPT		".ppt"
#define SCORE_DOC	3


/* Eseguibili o script */
#define EXE		".exe"		/* Windows Executive */
#define APP		".app"		/* Symbian OS, SkyOS, GNUstep and Mac OS X application */
#define BIN		".bin"		/* Unix Executable File */
#define BAT		".bat"		/* DOS Batch script */
#define ESH		".esh"		/* DOS Extended Shell Batch File */
#define CMD		".cmd"		/* Windows Command File */
#define WS		".ws"		/* Windows Script */
#define COMMAND	".command"	/* Mac OS X bash script */
#define SCPT	".scpt"		/* AppleScript */
#define SH		".sh"		/* SH/Bash script */
#define CSH		".csh"		/* C Shell script */
#define KSH		".ksh"		/* Korn Shell script */
#define PERL	".pl"		/* Perl script */
#define PYTHON	".py"		/* Python script */
#define AWK		".awk"		/* Awk script */
#define CGI		".cgi"		/* Common Gateway Interface Script */
#define SCORE_EXE	2


/* Pagine web */
#define HTML	".html"	/* HTML web page */
#define HTM		".htm"	/* HTML web page */
#define PHP		".php"	/* PHP web page  */


/* Altri punteggi */
#define SCORE_CSS	10	/* CSS */
#define SCORE_JS	5	/* JavaScript */
#define SCORE_PHP	5	/* PHP */


/* Errori */
#define ERROR_TAGMISS	2	/* Tag Mismatch ERROR */


/* Fattori peso */
#define RATIO_MAIN	1
#define RATIO_LINK1	0.75
#define RATIO_LINK2	0.5
#define RATIO_LINK3	0.25
#define RATIO_LINK4	0.1


/* Struttura per la memorizzazione delle URI
 *
 * val = puntatore alla stringa
 * level = memorizza il livello di profondita'
 */
typedef struct __urilist
{
	char * val;
	int level;
	struct __urilist * next;
} urilist;



int errors;		/* Contatore errori */
int depth;		/* Profondita' attuale */
int max_depth;	/* Profondita' massima */

float score;	/* Contatore punteggio */
float ratio;	/* Fattore peso */	

urilist * head;	/* Puntatore testa URIlist */
urilist * tail;	/* Puntatore coda URIlist */

#ifdef DEBUG
extern int yylineno;	/* contatore di linea lexer */
char linebuf[256];		/* buffer di linea lexer */
#endif

extern void assign( int score_l );		/* funzione assegnazione punteggio */
void check_attr( char * attr );	/* funzione controllo attributo */
int yyerror( char * message );	/* funzione errore parser */

extern int yylex();		/* Avoid yylex declaration warning in y.tab.c, Note: it doesn't work with -p prefix */
extern int yyparse();	/* Note: it doesn't work with -p prefix */

int scan_open(char  * file);
int scan_close();
