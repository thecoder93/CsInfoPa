program Libro_Alberi_listato_AlberoOrdinato_to_AlberoBinario;

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


   p_bin = ^alb2;
  alb2 = record
    inf : char;
    sin: p_bin;
    des: p_bin;
  end;

var radice: p_alb;          //puntatore alla radice dell'albero
    radix2: p_bin;          //puntatore alla radice dell'albero binario


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


//crea albero binario associato. Ritorna al chiamante la radice dell'albero binario creato
function crea_bin ( p: p_alb): p_bin;

type
  p_pila2 = ^pila2;
    pila2 = record
      alb : p_alb;
      bin : p_bin;
      pun : p_pila2;
    end;

var
  rad : p_bin;      //puntatore radice binario
  q : p_bin;        //puntatore di appoggio
  pl2: p_pila2;     //puntatore alla pila

    // Inserisci un elemento nella pila2

    function inser_pila2(p: p_alb; q: p_bin; x: p_pila2): p_pila2;
    var elem: p_pila2;
    begin
      new(elem);
      elem^.alb:= p;
      elem^.bin:= q;
      elem^.pun:= x;
      inser_pila2:= elem;
    end;

    // Cancella un elemento della pila2
    procedure estrai_pila2(var p: p_pila2);
    var
      q: p_pila2;
    begin
      q:= p;
      p:= p^.pun;
      dispose(q);
    end;

begin

  new(rad);                 // creazione puntatore radice bin
  rad^.inf:= p^.inf ;       // inizializzazione ...
  rad^.sin:= NIL;           // ...radice...
  rad^.des:= NIL;           // ...albero binario.

  new(pl2);                 // creazione
  pl2^.alb:= p;             // inizializzazione...
  pl2^.bin:= rad;           // ...primo elemento...
  pl2^.pun:= NIL;           // ...pila2.


  //Ciclo creazione elementi albero binario associati a pila 2

  repeat
    q:= pl2^.bin;
    p:= (pl2^.alb)^.p_arco;
    estrai_pila2(pl2);


    //Creazione primo figlio nodo corrente

    if p<> NIL then begin
      new(q^.sin);
      q:= q^.sin;
      q^.inf:= (p^.figlio)^.inf;
      pl2:= inser_pila2(p^.figlio, q, pl2);

    //Creazione fratelli primo figlio nodo corrente

      repeat
        p:= p^.p_arco;
        if p<> NIL then begin
          new(q^.des);
          q:= q^.des;
          q^.inf:= (p^.figlio)^.inf;
          pl2:= inser_pila2(p^.figlio, q, pl2);
          end
        else   // FINE figlio nodo corrente
          q^.des:= NIL;
      until p = NIL;
      end
    else      // Il nodo corrente non ha figli
      q^.sin:= NIL;
  until pl2 = NIL;


  crea_bin:= rad;  // Ritorna alla radice
end;

//Visita/visualizza l'albero binario in ordine anticipato

procedure anticipato2(pb: p_bin);
begin
  if pb <> NIL then begin
    write(pb^.inf,' ' );
    anticipato2(pb^.sin);
    anticipato2(pb^.des);
  end;
end;

//visita/visualizzazione dell'albero binario in forma a
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
  radix2:= crea_bin(radice);   //trasforma l'albero in albero binario

  writeln;
  writeln;
  writeln('           VISITA IN ORDINE ANTICIPATO ALBERO ORDINATO');
  writeln('Visualizzazione dell''albero in forma parentetica:');
  writeln;

  anticipato(radice);
  writeln;
  writeln;
  writeln;
  writeln('           VISITA IN ORDINE ANTICIPATO ALBERO BINARIO');
  writeln('Visualizzazione dell''albero binario associato');
  writeln;
  anticipato2(radix2);
  writeln;
  writeln;
  write('Premere INVIO per terminare');
  readln;
end.
