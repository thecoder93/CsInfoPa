/* TESINA DI TEORIE E TECNICHE DI COMPILAZIONE
 * Ranking - Scanner
 *
 * XHTML 1.0 Transitional
 * Note: XHTML is case-sensitive: not to be launched with -i option
 *
 * Giugno 2008 - Dario Banno
 */

%{
#include "common.h"


bool is_scorable;
bool is_style;
bool is_script;
bool is_href;

int token_close;
int caller;

void requires(int);
%}

/* OPTIONS */	
%option noyywrap
%option nounput
%option lex-compat
/* %option yylineno // use for extra debug output only */

/* START CONDITIONS */
%x COMMENT
%x ATTRLIST
%x ATTRLIST_EMPTY
%x QUOTATION1
%x QUOTATION2
%x INSTRUCTION



/* SGML Basic Values */
blanks	[ \t\n]+
id		[a-zA-Z][a-zA-Z0-9\-_:.]*
number	[0-9]+



/* ACTIONS */
%%

^{blanks}*	;	/* eat up indentations */

"<!--"							{ BEGIN( COMMENT ); }
"<?xml"							{ BEGIN( INSTRUCTION ); }
"<?php"							{ BEGIN( INSTRUCTION ); assign( SCORE_PHP ); printf( "PHP block code detected\n" ); }
"<?"							{ BEGIN( INSTRUCTION ); assign( SCORE_PHP ); printf( "PHP block code detected\n" ); }
"<!DOCTYPE"[^>]*">"				;

"<a"							{ is_scorable = TRUE; BEGIN( ATTRLIST ); return(ANCHOR_OPEN); }	/* 						anchor */
"</a"{blanks}*">"				{ return(ANCHOR_CLOSE); }
"<abbr"							{ BEGIN( ATTRLIST ); return(ABBR_OPEN); }						/* 						abbreviated form (e.g., WWW, HTTP, etc.)*/
"</abbr"{blanks}*">"			{ return(ABBR_CLOSE); }
"<acronym"						{ BEGIN( ATTRLIST ); return(ACRONYM_OPEN); }
"</acronym"{blanks}*">"			{ return(ACRONYM_CLOSE); }
"<address"						{ BEGIN( ATTRLIST ); return(ADDRESS_OPEN); } 									/* 						information on author */
"</address"{blanks}*">"			{ return(ADDRESS_CLOSE); }
"<applet"						{ BEGIN( ATTRLIST ); return(APPLET_OPEN); }			 		/*				 D	L	Java applet */
"</applet"{blanks}*">"			{ return(APPLET_CLOSE); }
"<area"							{ BEGIN( ATTRLIST_EMPTY ); requires(AREA_CLOSE); return(AREA_OPEN); }		 					/* 		F	E	 	 	client-side image map area */
"</area"{blanks}*">"			{ return(AREA_CLOSE); }
"<b"							{ BEGIN( ATTRLIST ); return(B_OPEN);	}	  									/*						bold text style */
"</b"{blanks}*">"				{ return(B_CLOSE);	}
"<base"							{ BEGIN( ATTRLIST_EMPTY ); requires(BASE_CLOSE); return(BASE_OPEN); }			 				/* 		F	E	 	 	document base URI */
"</base"{blanks}*">"			{ return(BASE_CLOSE); }
"<basefont"						{ BEGIN( ATTRLIST_EMPTY ); requires(BASEFONT_CLOSE); return(BASEFONT_OPEN); }										/*	 	F	E	D	L	base font size */
"</basefont"{blanks}*">"		{ return(BASEFONT_CLOSE); }
"<bdo"							{ BEGIN( ATTRLIST ); return(BDO_OPEN); }						/*	 	 	 	 	 	I18N BiDi over-ride */
"</bdo"{blanks}*">"				{ return(BDO_CLOSE); }
"<big"							{ BEGIN( ATTRLIST ); return(BIG_OPEN); }										/*	 	 	 	 	 	large text style */
"</big"{blanks}*">"				{ return(BIG_CLOSE); }
"<blockquote"					{ BEGIN( ATTRLIST ); return(BLOCKQUOTE_OPEN); }				/*	 	 	 	 	 	long quotation */
"</blockquote"{blanks}*">"		{ return(BLOCKQUOTE_CLOSE); }
"<body"							{ BEGIN( ATTRLIST ); return(BODY_OPEN); }						/*	O	O	 	 	 	document body */
"</body"{blanks}*">"			{ return(BODY_CLOSE); }
"<br"							{ BEGIN( ATTRLIST_EMPTY ); requires(BR_CLOSE); return(BR_OPEN); }												/*	 	F	E	 	 	forced line break */
"</br"{blanks}*">"				{ return(BR_CLOSE); }
"<button"						{ BEGIN( ATTRLIST ); return(BUTTON_OPEN); }					/*	 	 	 	 	 	push button */
"</button"{blanks}*">"			{ return(BUTTON_CLOSE); }
"<caption"						{ BEGIN( ATTRLIST ); return(CAPTION_OPEN); }									/*	 	 	 	 	 	table caption */
"</caption"{blanks}*">"			{ return(CAPTION_CLOSE); }
"<center"						{ BEGIN( ATTRLIST ); return(CENTER_OPEN); }									/*	 	 	 	D	L	shorthand for DIV align=center */
"</center"{blanks}*">"			{ return(CENTER_CLOSE); }
"<cite"							{ BEGIN( ATTRLIST ); return(CITE_OPEN); }										/*	 	 	 	 	 	citation */
"</cite"{blanks}*">"			{ return(CITE_CLOSE); }
"<code"							{ BEGIN( ATTRLIST ); return(CODE_OPEN); }										/*	 	 	 	 	 	computer code fragment */
"</code"{blanks}*">"			{ return(CODE_CLOSE); }
"<col"							{ BEGIN( ATTRLIST_EMPTY ); requires(COL_CLOSE); return(COL_OPEN); }							/*	 	F	E	 	 	table column */
"</col"{blanks}*">"				{ return(COL_CLOSE); }
"<colgroup"						{ BEGIN( ATTRLIST ); return(COLGROUP_OPEN); }					/*	 	O	 	 	 	table column group */
"</colgroup"{blanks}*">"		{ return(COLGROUP_CLOSE); }
"<dd"							{ BEGIN( ATTRLIST ); return(DD_OPEN); }										/*	 	O	 	 	 	definition description */
"</dd"{blanks}*">"				{ return(DD_CLOSE); }
"<del"							{ BEGIN( ATTRLIST ); return(DEL_OPEN); }						/*	 	 	 	 	 	deleted text */
"</del"{blanks}*">"				{ return(DEL_CLOSE); }
"<dfn"							{ BEGIN( ATTRLIST ); return(DFN_OPEN); }										/*	 	 	 	 	 	instance definition */
"</dfn"{blanks}*">"				{ return(DFN_CLOSE); }
"<dir"							{ BEGIN( ATTRLIST ); return(DIR_OPEN); }						/*	 	 	 	D	L	directory list */
"</dir"{blanks}*">"				{ return(DIR_CLOSE); }
"<div"							{ BEGIN( ATTRLIST ); return(DIV_OPEN); }										/*	 	 	 	 	 	generic language/style container */
"</div"{blanks}*">"				{ return(DIV_CLOSE); }
"<dl"							{ BEGIN( ATTRLIST ); return(DL_OPEN); }										/*	 	 	 	 	 	definition list */
"</dl"{blanks}*">"				{ return(DL_CLOSE); }
"<dt"							{ BEGIN( ATTRLIST ); return(DT_OPEN); }										/*	 	O	 	 	 	definition term */
"</dt"{blanks}*">"				{ return(DT_CLOSE); }
"<em"							{ BEGIN( ATTRLIST ); return(EM_OPEN); }										/*	 	 	 	 	 	emphasis */
"</em"{blanks}*">"				{ return(EM_CLOSE); }
"<fieldset"						{ BEGIN( ATTRLIST ); return(FIELDSET_OPEN); }									/*	 	 	 	 	 	form control group */
"</fieldset"{blanks}*">"		{ return(FIELDSET_CLOSE); }
"<font"							{ BEGIN( ATTRLIST ); return(FONT_OPEN); }						/*	 	 	 	D	L	local change to font */
"</font"{blanks}*">"			{ return(FONT_CLOSE); }
"<form"							{ BEGIN( ATTRLIST ); return(FORM_OPEN); }						/*	 	 	 	 	 	interactive form */
"</form"{blanks}*">"			{ return(FORM_CLOSE); }
"<frame"						{ BEGIN( ATTRLIST ); return(FRAME_OPEN); }							/*	 	F	E	 	F	subwindow */
"</frame"{blanks}*">"			{ return(FRAME_CLOSE); }
"<frameset"						{ BEGIN( ATTRLIST ); return(FRAMESET_OPEN); }					/*	 	 	 	 	F	window subdivision */
"</frameset"{blanks}*">"		{ return(FRAMESET_CLOSE); }
"<h1"							{ BEGIN( ATTRLIST ); return(H1_OPEN); }										/*	 	 	 	 	 	heading */
"</h1"{blanks}*">"				{ return(H1_CLOSE); }
"<h2"							{ BEGIN( ATTRLIST ); return(H2_OPEN); }										/*	 	 	 	 	 	heading */
"</h2"{blanks}*">"				{ return(H2_CLOSE); }
"<h3"							{ BEGIN( ATTRLIST ); return(H3_OPEN); }										/*	 	 	 	 	 	heading */
"</h3"{blanks}*">"				{ return(H3_CLOSE); }
"<h4"							{ BEGIN( ATTRLIST ); return(H4_OPEN); }										/*	 	 	 	 	 	heading */
"</h4"{blanks}*">"				{ return(H4_CLOSE); }
"<h5"							{ BEGIN( ATTRLIST ); return(H5_OPEN); }										/*	 	 	 	 	 	heading */
"</h5"{blanks}*">"				{ return(H5_CLOSE); }
"<h6"							{ BEGIN( ATTRLIST ); return(H6_OPEN); }										/*	 	 	 	 	 	heading */
"</h6"{blanks}*">"				{ return(H6_CLOSE); }
"<head"							{ BEGIN( ATTRLIST ); return(HEAD_OPEN); }						/*	O	O	 	 	 	document head */
"</head"{blanks}*">"			{ return(HEAD_CLOSE); }
"<hr"							{ BEGIN( ATTRLIST_EMPTY ); requires(HR_CLOSE); return(HR_OPEN); }												/*	 	F	E	 	 	horizontal rule */
"</hr"{blanks}*">"				{ return(HR_CLOSE); }
"<html"							{ BEGIN( ATTRLIST ); return(HTML_OPEN); }						/*	O	O	 	 	 	document root element */
"</html"{blanks}*">"			{ return(HTML_CLOSE); }
"<i"							{ BEGIN( ATTRLIST ); return(I_OPEN); }											/*	 	 	 	 	 	italic text style */
"</i"{blanks}*">"				{ return(I_CLOSE); }
"<iframe"						{ BEGIN( ATTRLIST ); return(IFRAME_OPEN); }					/*	 	 	 	 	L	inline subwindow */
"</iframe"{blanks}*">"			{ return(IFRAME_CLOSE); }
"<img"							{ BEGIN( ATTRLIST_EMPTY ); requires(IMG_CLOSE); return(IMG_OPEN); }							/*	 	F	E	 	 	Embedded image */
"</img"{blanks}*">"				{ return(IMG_CLOSE); }
"<input"						{ BEGIN( ATTRLIST_EMPTY ); requires(INPUT_CLOSE); return(INPUT_OPEN); }							/*	 	F	E	 	 	form control */
"</input"{blanks}*">"			{ return(INPUT_CLOSE); }
"<ins"							{ BEGIN( ATTRLIST ); return(INS_OPEN); }						/*	 	 	 	 	 	inserted text */
"</ins"{blanks}*">"				{ return(INS_CLOSE); }
"<isindex"						{ BEGIN( ATTRLIST_EMPTY ); requires(ISINDEX_CLOSE); return(ISINDEX_OPEN); }						/*	 	F	E	D	L	single line prompt */
"</isindex"{blanks}*">"			{ return(ISINDEX_CLOSE); }
"<kbd"							{ BEGIN( ATTRLIST ); return(KBD_OPEN); }						/*	 	 	 	 	 	text to be entered by the user */
"</kbd"{blanks}*">"				{ return(KBD_CLOSE); }
"<label"						{ BEGIN( ATTRLIST ); return(LABEL_OPEN); }						/*	 	 	 	 	 	form field label text */
"</label"{blanks}*">"			{ return(LABEL_CLOSE); }
"<legend"						{ BEGIN( ATTRLIST ); return(LEGEND_OPEN); }					/*	 	 	 	 	 	fieldset legend */
"</legend"{blanks}*">"			{ return(LEGEND_CLOSE); }
"<li"							{ BEGIN( ATTRLIST ); return(LI_OPEN); }										/*	 	O	 	 	 	list item */
"</li"{blanks}*">"				{ return(LI_CLOSE); }
"<link"							{ is_style = TRUE; BEGIN( ATTRLIST_EMPTY ); requires(LINK_CLOSE); return(LINK_OPEN); }							/*	 	F	E	 	 	a media-independent link */
"</link"{blanks}*">"			{ return(LINK_CLOSE); }
"<map"							{ BEGIN( ATTRLIST ); return(MAP_OPEN); }						/*	 	 	 	 	 	client-side image map */
"</map"{blanks}*">"				{ return(MAP_CLOSE); }
"<menu"							{ BEGIN( ATTRLIST ); return(MENU_OPEN); }						/*	 	 	 	D	L	menu list */
"</menu"{blanks}*">"			{ return(MENU_CLOSE); }
"<meta"							{ BEGIN( ATTRLIST_EMPTY ); requires(META_CLOSE); return(META_OPEN); }							/*	 	F	E	 	 	generic metainformation */
"</meta"{blanks}*">"			{ return(META_CLOSE); }
"<noframes"						{ BEGIN( ATTRLIST ); return(NOFRAMES_OPEN); }									/*	 	 	 	 	F	alternate content container for non frame-based rendering */
"</noframes"{blanks}*">"		{ return(NOFRAMES_CLOSE); }
"<noscript"						{ BEGIN( ATTRLIST ); return(NOSCRIPT_OPEN); }									/*	 	 	 	 	 	alternate content container for non script-based rendering */
"</noscript"{blanks}*">"		{ return(NOSCRIPT_CLOSE); }
"<object"						{ BEGIN( ATTRLIST ); return(OBJECT_OPEN); }					/*	 	 	 	 	 	generic embedded object */
"</object"{blanks}*">"			{ return(OBJECT_CLOSE); }
"<ol"							{ BEGIN( ATTRLIST ); return(OL_OPEN); }										/*	 	 	 	 	 	ordered list */
"</ol"{blanks}*">"				{ return(OL_CLOSE); }
"<optgroup"						{ BEGIN( ATTRLIST ); return(OPTGROUP_OPEN); }					/*	 	 	 	 	 	option group */
"</optgroup"{blanks}*">"		{ return(OPTGROUP_CLOSE); }
"<option"						{ BEGIN( ATTRLIST ); return(OPTION_OPEN); }					/*	 	O	 	 	 	selectable choice */
"</option"{blanks}*">"			{ return(OPTION_CLOSE); }
"<p"							{ BEGIN( ATTRLIST ); return(P_OPEN); }											/*	 	O	 	 	 	paragraph */
"</p"{blanks}*">"				{ return(P_CLOSE); }
"<param"						{ BEGIN( ATTRLIST_EMPTY ); requires(PARAM_CLOSE); return(PARAM_OPEN); }							/*	 	F	E	 	 	named property value */
"</param"{blanks}*">"			{ return(PARAM_CLOSE); }
"<pre"							{ BEGIN( ATTRLIST ); return(PRE_OPEN); }										/*	 	 	 	 	 	preformatted text */
"</pre"{blanks}*">"				{ return(PRE_CLOSE); }
"<q"							{ BEGIN( ATTRLIST ); return(Q_OPEN); }							/*	 	 	 	 	 	short inline quotation */
"</q"{blanks}*">"				{ return(Q_CLOSE); }
"<s"							{ BEGIN( ATTRLIST ); return(S_OPEN); }											/*	 	 	 	D	L	strike-through text style */
"</s"{blanks}*">"				{ return(S_CLOSE); }
"<samp"							{ BEGIN( ATTRLIST ); return(SAMP_OPEN); }										/*	 	 	 	 	 	sample program output, scripts, etc. */
"</samp"{blanks}*">"			{ return(SAMP_CLOSE); }
"<script"						{ is_script = TRUE; BEGIN( ATTRLIST ); return(SCRIPT_OPEN); }					/*	 	 	 	 	 	script statements */
"</script"{blanks}*">"			{ return(SCRIPT_CLOSE); }
"<select"						{ BEGIN( ATTRLIST ); return(SELECT_OPEN); }					/*	 	 	 	 	 	option selector */
"</select"{blanks}*">"			{ return(SELECT_CLOSE); }
"<small"						{ BEGIN( ATTRLIST ); return(SMALL_OPEN); }										/*	 	 	 	 	 	small text style */
"</small"{blanks}*">"			{ return(SMALL_CLOSE); }
"<span"							{ BEGIN( ATTRLIST ); return(SPAN_OPEN); }										/*	 	 	 	 	 	generic language/style container */
"</span"{blanks}*">"			{ return(SPAN_CLOSE); }
"<strike"						{ BEGIN( ATTRLIST ); return(STRIKE_OPEN); }									/*	 	 	 	D	L	strike-through text */
"</strike"{blanks}*">"			{ return(STRIKE_CLOSE); }
"<strong"						{ BEGIN( ATTRLIST ); return(STRONG_OPEN); }									/*	 	 	 	 	 	strong emphasis */
"</strong"{blanks}*">"			{ return(STRONG_CLOSE); }
"<style"						{ is_style = TRUE; BEGIN( ATTRLIST ); return(STYLE_OPEN); }						/*	 	 	 	 	 	style info */
"</style"{blanks}*">"			{ return(STYLE_CLOSE); }
"<sub"							{ BEGIN( ATTRLIST ); return(SUB_OPEN); }										/*	 	 	 	 	 	subscript */
"</sub"{blanks}*">"				{ return(SUB_CLOSE); }
"<sup"							{ BEGIN( ATTRLIST ); return(SUP_OPEN); }										/*	 	 	 	 	 	superscript */
"</sup"{blanks}*">"				{ return(SUP_CLOSE); }
"<table"						{ BEGIN( ATTRLIST ); return(TABLE_OPEN); }
"</table"{blanks}*">"			{ return(TABLE_CLOSE); }
"<tbody"						{ BEGIN( ATTRLIST ); return(TBODY_OPEN); }										/*	O	O	 	 	 	table body */
"</tbody"{blanks}*">"			{ return(TBODY_CLOSE); }
"<td"							{ BEGIN( ATTRLIST ); return(TD_OPEN); }						/*	 	O	 	 	 	table data cell */
"</td"{blanks}*">"				{ return(TD_CLOSE); }
"<textarea"						{ BEGIN( ATTRLIST ); return(TEXTAREA_OPEN); }					/*	 	 	 	 	 	multi-line text field */
"</textarea"{blanks}*">"		{ return(TEXTAREA_CLOSE); }
"<tfoot"						{ BEGIN( ATTRLIST ); return(TFOOT_OPEN); }										/*	 	O	 	 	 	table footer */
"</tfoot"{blanks}*">"			{ return(TFOOT_CLOSE); }
"<th"							{ BEGIN( ATTRLIST ); return(TH_OPEN); }						/*	 	O	 	 	 	table header cell */
"</th"{blanks}*">"				{ return(TH_CLOSE); }
"<thead"						{ BEGIN( ATTRLIST ); return(THEAD_OPEN); }										/*	 	O	 	 	 	table header */
"</thead"{blanks}*">"			{ return(THEAD_CLOSE); }
"<title"						{ BEGIN( ATTRLIST ); return(TITLE_OPEN); }										/*	 	 	 	 	 	document title */
"</title"{blanks}*">"			{ return(TITLE_CLOSE); }
"<tr"							{ BEGIN( ATTRLIST ); return(TR_OPEN); }						/*	 	O	 	 	 	table row */
"</tr"{blanks}*">"				{ return(TR_CLOSE); }
"<tt"							{ BEGIN( ATTRLIST ); return(TT_OPEN); }										/*	 	 	 	 	 	teletype or monospaced text style */
"</tt"{blanks}*">"				{ return(TT_CLOSE); }
"<u"							{ BEGIN( ATTRLIST ); return(U_OPEN); }										/*	 	 	 	D	L	underlined text style */
"</u"{blanks}*">"				{ return(U_CLOSE); }
"<ul"							{ BEGIN( ATTRLIST ); return(UL_OPEN); }										/*	 	 	 	 	 	unordered list */
"</ul"{blanks}*">"				{ return(UL_CLOSE); }
"<var"							{ BEGIN( ATTRLIST ); return(VAR_OPEN); }										/*	 	 	 	 	 	instance of a variable or program argument */
"</var"{blanks}*">"				{ return(VAR_CLOSE); }
"<xmp"							{ BEGIN( ATTRLIST ); return(XMP_OPEN); }										/*	xmp -- deprecated  */
"</xmp"{blanks}*">"				{ return(XMP_CLOSE); }

<<EOF>>							{ return(END); }
\n								;
.								;
	/* \n.*							{ yylineno++; snprintf( linebuf, sizeof( linebuf ), "%s", yytext + 1 ); yyless(1); } // use for extra debug output only -- must handle with extremely care */



	/* START CONDITIONS */
 
<COMMENT>[^-]*									;
<COMMENT>"-"+[^->]*								;
<COMMENT>"-"+"->"								{ BEGIN( INITIAL ); }


<INSTRUCTION>[^?]*								;
<INSTRUCTION>"?"+">"							{ BEGIN( INITIAL ); }


<ATTRLIST>{blanks}*								;
<ATTRLIST>"type"{blanks}*"="{blanks}*\""text/javascript"\"		{ if ( is_script == TRUE ) { assign( SCORE_JS ); printf( "JAVASCRIPT block code detected\n" ); is_script = FALSE; } }
<ATTRLIST>"type"{blanks}*"="{blanks}*\'"text/javascript"\'		{ if ( is_script == TRUE ) { assign( SCORE_JS ); printf( "JAVASCRIPT block code detected\n" ); is_script = FALSE; } }
<ATTRLIST>"src"{blanks}*"="{blanks}*\"[^"]*".js"\"		{ if ( is_script == TRUE ) { assign( SCORE_JS ); printf( "JAVASCRIPT block code detected\n" ); is_script = FALSE; } }
<ATTRLIST>"src"{blanks}*"="{blanks}*\'[^']*".js"\'		{ if ( is_script == TRUE ) { assign( SCORE_JS ); printf( "JAVASCRIPT block code detected\n" ); is_script = FALSE; } }
<ATTRLIST>"type"{blanks}*"="{blanks}*\""text/css"\"		{ if ( is_style == TRUE ) { assign( SCORE_CSS ); printf( "CSS block code detected\n" ); is_style = FALSE; } }
<ATTRLIST>"type"{blanks}*"="{blanks}*\'"text/css"\'		{ if ( is_style == TRUE ) { assign( SCORE_CSS ); printf( "CSS block code detected\n" ); is_style = FALSE; } }
<ATTRLIST>"href"{blanks}*"="{blanks}*\"			{ is_href = TRUE; caller = ATTRLIST; BEGIN( QUOTATION1 ); }
<ATTRLIST>"href"{blanks}*"="{blanks}*\'			{ is_href = TRUE; caller = ATTRLIST; BEGIN( QUOTATION2 ); }
<ATTRLIST>{id}{blanks}*"="{blanks}*\"			{ caller = ATTRLIST; BEGIN( QUOTATION1 ); }
<ATTRLIST>{id}{blanks}*"="{blanks}*\'			{ caller = ATTRLIST; BEGIN( QUOTATION2 ); } 
<ATTRLIST>">"									{ BEGIN( INITIAL ); }	/* reset scanner state */
<ATTRLIST>.										;						/* eat up anything else */


<ATTRLIST_EMPTY>{blanks}*								;
<ATTRLIST_EMPTY>"type"{blanks}*"="{blanks}*\""text/css"\"		{ if ( is_style == TRUE ) { assign( SCORE_CSS ); printf( "CSS block code detected\n" ); is_style = FALSE; } }
<ATTRLIST_EMPTY>"type"{blanks}*"="{blanks}*\'"text/css"\'		{ if ( is_style == TRUE ) { assign( SCORE_CSS ); printf( "CSS block code detected\n" ); is_style = FALSE; } }
<ATTRLIST_EMPTY>{id}{blanks}*"="{blanks}*\"				{ caller = ATTRLIST_EMPTY; BEGIN( QUOTATION1 ); }
<ATTRLIST_EMPTY>{id}{blanks}*"="{blanks}*\'				{ caller = ATTRLIST_EMPTY; BEGIN( QUOTATION2 ); } 
<ATTRLIST_EMPTY>"/>"									{ BEGIN( INITIAL ); return(token_close); }	/* reset scanner state */
<ATTRLIST_EMPTY>">"										{ BEGIN( INITIAL ); }						/* reset scanner state */
<ATTRLIST_EMPTY>.										;											/* eat up anything else */


<QUOTATION1>[^"]*/\"		{ if ( ( is_scorable == TRUE ) && ( is_href == TRUE ) ) { check_attr( yytext ); is_scorable = FALSE; is_href = FALSE; } BEGIN( caller ); } /* input(); non e' necessario per smaltire il trailing quotation mark (caller: . ;) */


<QUOTATION2>[^']*/\'		{ if ( ( is_scorable == TRUE ) && ( is_href == TRUE ) ) { check_attr( yytext ); is_scorable = FALSE; is_href = FALSE; } BEGIN( caller ); } /* input(); non e' necessario per smaltire il trailing quotation mark (caller: . ;) */


%%

void
requires( int val )
{
	extern int token_close;
	
	token_close = val;
}


int
scan_open( char * file )
{
	printf( "\n--\nOpening URI: '%s'\n", file );

	yyin = fopen( file, "r" );

	if ( ! yyin ) return 1;

	return 0;
}


int
scan_close()
{
	if ( fclose( yyin ) != 0 ) return 1;
	
	return 0;
}
