program Libro_Alberi_listato_creaz_specifica_visita_anticipato;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  p_alb = ^nodo;
  nodo = record
    inf: char;
    figlio: p_alb;
    p_arco: p_alb;
  end;

  p_pila= ^pila;
  pila = record
    inf: char;
    alb: p_alb;
    pun: p_pila;
  end;

var radice: p_alb;          //puntatore alla radice dell'albero

//inserisce un elemento nella pila

function inser_pila (q: p_alb; p: p_pila): p_pila;
var elem: p_pila;
begin
  new(elem);
  write('Inserisci il valore del figlio: ');
  readln(elem^.inf);
  elem^.alb:=q;
  elem^.pun:=p;
  inser_pila:=elem;
end;


//cancella un elemento della pila
procedure estrai_pila (var p: p_pila);
var q: p_pila;
begin
  q:=p;
  p:=p^.pun;
  dispose(q);
end;


//crea l'albero e ritorna la radice dell'albero
function crea_alb: p_alb;
var
  rd: p_alb;    //puntatore alla radice
  q: p_alb;     //puntatore di appoggio
  pl: p_pila;   //puntatore alla pila
  i_nod: char;     //informazione del nodo
  risp: char;        //risposta alla domanda
  fine: boolean;

begin
  pl:=NIL;          //inizializzazione pila a NIL
  new(rd);           //creazione puntatore alla radice
  write('Inserisci il valore della radice: ');
  readln(i_nod);

  rd^.inf:=i_nod;       //inizializzazione...
  rd^.p_arco:=NIL;       //...campi...
  rd^.figlio:=NIL;        //...della radice

  q:= rd;
  fine:=FALSE;

  repeat
    writeln;
    write('Vuoi creare un primo figlio di ',i_nod, '? (s/n): ');
    readln(risp);
    while risp='s' do begin
      new(q^.p_arco);            //creazione e...
      q:=q^.p_arco;              //...inizializzazione...
      q^.p_arco:=NIL;             //...nodo arco

      pl:= inser_pila(q, pl);
      write('Vuoi creare un altro figlio di ',i_nod,'? (s/n): ');
      readln(risp);
    end;

    if pl=NIL then
      fine:=TRUE
    else begin
      i_nod:=pl^.inf;
      new(q);                        //creazione e...
      q^.inf:=i_nod;                 //...inizializzazione...
      q^.p_arco:=NIL;                //...nodo

      (pl^.alb)^.figlio:=q;          //assegnazione puntatore al figlio

      estrai_pila(pl);
    end;

  until fine;

crea_alb:=rd;           //ritorna la radice

end;

//visita/visualizzazione dell'albero binario in ordine anticipato
procedure anticipato(nd: p_alb);
var pf: p_alb;

begin
  write('(', nd^.inf);
  pf:=nd^.p_arco;

  repeat
    if pf<>NIL then begin
      anticipato(pf^.figlio);
      pf:=pf^.p_arco;
    end;
  until pf=NIL;

  write(')');
end;


begin

  radice:= crea_alb;           //invoca la funzione per la creazione dell'albero

  writeln;
  writeln('           VISITA IN ORDINE ANTICIPATO');
  writeln('Visualizzazione dell''albero in forma parentetica:');
  writeln;

  anticipato(radice);

  writeln;
  writeln;
  write('Premere INVIO per terminare.');

readln;

end.
 