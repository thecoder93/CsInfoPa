/* RANKING
 *
 * Tesina di Teoria e Tecniche di Compilazione (Giugno 2008)
 *
 * autore: Dario Banno' <captainsonic@gmail.com>
 */


#include "common.h"



int main( int argc, char * argv[] );
void usage();
void ranking_init();
int yyerror( char * message );
float ratio_eval( int level );
inline void assign( int score_l );
void check_attr( char * attr );
int file_parse( char * filename );
void parse_queue();

#ifndef HAVE_STRCASESTR
char * strcasestr( char * haystack, char * needle );
#endif

#ifndef HAVE_STRCASECMP
int strcasecmp( const char * s1, const char * s2 );
#endif

void uri_print( urilist * item );
void uri_add( char * uri );
char * uri_extract();



int
main( int argc, char * argv[] )
{
	ranking_init();

	if ( ( argc < 2 ) || ( argc > 3 ) )
	{
		usage();
		return 1;
	}
	
	if ( argc == 3 )
	{
		max_depth = (int) strtol( argv[2], (char * *) NULL, 10 );
#ifdef DEBUG
		printf( "Requested max depth = %d\n\n", max_depth );
#endif
	}


	/* Parse first URI */
#ifdef DEBUG
	printf( "\n\n<!>parsing file:'%s' depth:'%d'\n", argv[1], depth );
#endif
	file_parse( argv[1] );

	parse_queue(); 	/* Parse queued URIs */


#ifdef DEBUG
	uri_print( head );
#endif


	printf( "\n\n-----\n" );
	printf( "FINAL SCORE = %.2f\n", score );


	return 0;
}



void
ranking_init()
{
	errors = 0;
	score = 0;
	depth = 0;

	ratio = RATIO_MAIN;
	max_depth = DEFAULT_MAXDEPTH;

	head = NULL;
	tail = NULL;
}



void
parse_queue()
{
	char * file;


	while ( head != NULL ) 
	{
		file = uri_extract();

#ifdef DEBUG
		printf( "\n\n<!>parsing file:'%s' depth:'%d'\n", file, depth );
#endif

		file_parse( file );
	}
}



int
yyerror( char * message )
{
#ifdef DEBUG
	fprintf( stderr,"%s on line %d: %s\n", message, yylineno, linebuf );
#else
	fprintf( stderr,"%s\n", message );
#endif

	return 0;
}



/* strcasestr() reimplementation
 *
 * strcasestr() is usually implemented in glibc and BSD-libc but
 * some OSes still may miss it, so here is a reimplementation.
 *
 * use -DHAVE_STRCASESTR from Makefile to not ovverride
 */
#ifndef HAVE_STRCASESTR

#define ap_tolower(c)	tolower( (unsigned char) c )
#define ap_toupper(c)	toupper( (unsigned char) c )

char *
strcasestr( char * haystack, char * needle )
{
	char * a;
	char * e;
	
	
	a = haystack;
	e = needle;

	if ( ( ! haystack ) || ( ! * haystack ) || ( ! needle ) || ( ! * needle ) )
		return 0;
		
	while ( * a && * e )
	{
		if ( ap_toupper( * a ) != ap_toupper ( * e ) )
		{
			haystack++;
			a = haystack;
			e = needle;
		}
		else
		{
			a++;
			e++;
		}
	}


	if ( * e ) return NULL;

	
	return haystack;
}
#endif



/* strcasecmp() reimplementation
 *
 * Code below is adapted from DragonFly BSD libc (strcasecmp.c)
 *
 * @(#)strcasecmp.c     8.1 (Berkeley) 6/4/93
 * $FreeBSD: src/lib/libc/string/strcasecmp.c,v 1.2.8.1 2001/07/09 23:30:03 obrien Exp $
 * $DragonFly: src/lib/libc/string/strcasecmp.c,v 1.8 2005/04/29 16:12:52 dillon Exp $
 *
 * use -DHAVE_STRCASECMP from Makefile to not ovverride
 */
#ifndef HAVE_STRCASECMP

int
strcasecmp( const char * s1, const char * s2 )
{
	while ( tolower( (unsigned char) * s1 ) == tolower( (unsigned char) * s2++ ) )
		if ( * s1++ == '\0' )
			return 0;

	return ( tolower( (unsigned char) * s1 ) - tolower( (unsigned char) * --s2 ) );
}
#endif



float
ratio_eval( int level )
{
	switch( level )
	{
		case 0:
				return RATIO_MAIN;
				break;
			
		case 1:
				return RATIO_LINK1;
				break;
			
		case 2:
				return RATIO_LINK2;
				break;
			
		case 3:
				return RATIO_LINK3;
				break;
			
		default:
				return RATIO_LINK4;
				break;
	}
}



inline void
assign( int score_l )
{
	score += ( ratio * score_l );
}



void
check_attr( char * attr )
{
	char * dot;
	bool is_http;


	dot = strrchr( attr, '.' );	// Look for the extension dot

	is_http = FALSE;
	if ( strcasestr( attr, "http://" ) == attr ) // Look fot "http://" at the beginning of attr
	{
		is_http = TRUE;
	}

#ifdef DEBUG
	if ( is_http == TRUE ) printf("http attribute recognized\n");
#endif


	if ( dot != NULL )
	{
		if ( ( strcasecmp( dot, JPG ) == 0 ) ||
			 ( strcasecmp( dot, JPEG ) == 0 ) ||
			 ( strcasecmp( dot, PNG ) == 0 ) )
		{
			assign( SCORE_JPG );
			printf( "JPG, PNG image score assigned\n" );
		}
		else
		if ( ( strcasecmp( dot, GIF ) == 0 ) )
		{
			assign( SCORE_GIF );
			printf( "GIF image score assigned\n" );
		}
		else
		if ( ( strcasecmp( dot, C ) == 0 ) ||
			 ( strcasecmp( dot, CPP ) == 0 ) )
		{
			assign( SCORE_C );
			printf( "C, CPP source score assigned\n" );
		}
		else
		if ( ( strcasecmp( dot, JAVA ) == 0 ) )
		{
			assign( SCORE_JAVA );
			printf( "JAVA source score assigned\n" );
		}
		else
		if ( ( strcasecmp( dot, ZIP ) == 0 ) ||
			 ( strcasecmp( dot, RAR ) == 0 ) ||
			 ( strcasecmp( dot, TAR ) == 0 ) ||
			 ( strcasecmp( dot, GZIP ) == 0 ) ||
			 ( strcasecmp( dot, BZIP2 ) == 0 ) ||
			 ( strcasecmp( dot, CAB ) == 0 ) ||
			 ( strcasecmp( dot, ACE ) == 0 ) ||
			 ( strcasecmp( dot, SEVZIP ) == 0 ) ||
			 ( strcasecmp( dot, DMG ) == 0 ) )
		{
			assign( SCORE_ZIP );
			printf( "Compressed archive score assigned\n" );
		}
		else
		if ( ( strcasecmp( dot, PDF ) == 0 ) )
		{
			assign( SCORE_PDF );
			printf( "PDF document score assigned\n" );
		}
		else
		if ( ( strcasecmp( dot, TXT ) == 0 ) ||
			 ( strcasecmp( dot, XML ) == 0 ) )
		{
			assign( SCORE_TXT );
			printf( "TXT, XML score assigned\n" );
		}
		else
		if ( ( strcasecmp( dot, RTF ) == 0 ) ||
			 ( strcasecmp( dot, RTFD ) == 0 ) ||
			 ( strcasecmp( dot, DOC ) == 0 ) ||
			 ( strcasecmp( dot, DOCX ) == 0 ) ||
			 ( strcasecmp( dot, ODF ) == 0 ) ||
			 ( strcasecmp( dot, ODT ) == 0 ) ||
			 ( strcasecmp( dot, PPT ) == 0 ) )
		{
			assign( SCORE_DOC );
			printf( "Office document score assigned\n" );
		}
		else
		if ( ( strcasecmp( dot, EXE ) == 0 ) ||
			 ( strcasecmp( dot, APP ) == 0 ) ||
			 ( strcasecmp( dot, BIN ) == 0 ) ||
			 ( strcasecmp( dot, BAT ) == 0 ) ||
			 ( strcasecmp( dot, ESH ) == 0 ) ||
			 ( strcasecmp( dot, CMD ) == 0 ) ||
			 ( strcasecmp( dot, WS ) == 0 ) ||
			 ( strcasecmp( dot, COMMAND ) == 0 ) ||
			 ( strcasecmp( dot, SCPT ) == 0 ) ||
			 ( strcasecmp( dot, SH ) == 0 ) ||
			 ( strcasecmp( dot, CSH ) == 0 ) ||
			 ( strcasecmp( dot, KSH ) == 0 ) ||
			 ( strcasecmp( dot, PERL ) == 0 ) ||
			 ( strcasecmp( dot, PYTHON ) == 0 ) ||
			 ( strcasecmp( dot, AWK ) == 0 ) ||
			 ( strcasecmp( dot, CGI ) == 0 ) )
		{
			assign( SCORE_EXE );
			printf( "Executable, script score assigned\n" );
		}
		else
		if ( ( strcasecmp( dot, HTM ) == 0 ) ||
			 ( strcasecmp( dot, HTML ) == 0 ) ||
			 ( strcasecmp( dot, PHP ) == 0 ) )
		{
			if ( ( is_http == FALSE ) && ( depth < max_depth ) )
			{
				uri_add( attr );
				printf( "Local web page recognized: '%s'\n", attr );
			}
		}

	}
	else // dot is NULL
	{
		// something
	}

#ifdef DEBUG
	printf( "checkattr:%s\n", attr );
	printf( "index=%d\n", ( int ) dot );
#endif
}



void
usage()
{
    printf(
			"Usage: ranking URI [depth]\n\n"
            "URI is a path for the web file to be analyzed\n"
            "depth (optional) stands for the max depth which can be retrieved\n"
            "\nCreated by Dario Banno (2008)\n"
			);
}



int
file_parse( char * filename )
{
	if ( scan_open( filename ) != 0 )
	{
		fprintf( stderr, "Error opening file: '%s'\n", filename );
		return 1;
	}
	
	yyparse();

	if ( scan_close() != 0 )
	{
		fprintf( stderr, "Error closing file: '%s'\n", filename );		
		return 1;
	}

	score -= ( errors * ERROR_TAGMISS * ratio );

	printf( "\n" );
	printf( "depth = %d\n", depth );
	printf( "ratio = %.2f\n", ratio );
	printf( "page errors = %d\n", errors );
	printf( "actual score = %.2f\n", score );

	errors = 0; /* reset errors counter */

	return 0;
}



/** Begin of URI urilist related methods **/
void
uri_print( urilist * item )
{
	if ( item == NULL )
		fprintf( stderr, "urilist is empty\n" );
	else
	{
		while ( item != NULL ) 
		{
			printf( "URIlist:%s\n", item->val );
			item = item -> next;
		}
		printf( "\n" );
	}
}


/* uri_add : enqueue an urilist item
 *
 * Note: item->level is dynamically allocated and is able to store URI strings without any a priori limit on its length as specified by RFC-2068
 * ( for more informations see http://www.ietf.org/rfc/rfc2068.txt?number=2068 (Section 3.2.1: General Syntax) )
 */
void
uri_add( char * uri )
{
	urilist * item;


	item = (urilist *) malloc( sizeof(urilist) );

	if ( item != NULL ) 
	{ 
		item->val = (char *) malloc( strlen(uri) + 1 ); // allocate memory for uri (+1 for NUL char)
		strcpy( item->val, uri );	// use of strcpy here is buffer overflow safe due to previous strlen+1 control

		item->level = depth + 1;
		item->next = NULL;

		if ( head == NULL )
		{
			head = item;
			tail = item;
		}
		else 
		{
			tail->next = item;
			tail = item;
		}
	}
	else 
		fprintf( stderr, "URIlist error: memory overflow!\n" );
}


char *
uri_extract()
{
	urilist * item;
	char * uri;


	if ( head == NULL )
	{
		fprintf( stderr, "URIlist error: memory overflow!\n" );
		return NULL;
	}
	else
	{
		uri = head->val;
		depth = head->level;
		ratio = ratio_eval( depth );

		item = head;
		head = head->next;
		free( item );

#ifdef DEBUG
		printf( "-->ASSIGNED DEPTH=%d\n", depth );
		printf( "-->ASSIGNED RATIO=%f\n", ratio );
#endif

		return uri;
	}
}
/** End of URI queue related methods **/
