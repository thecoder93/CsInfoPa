program crea_alb_random_ricorsivo;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  puntatore=^albero;
  albero=record
    inf:integer;
    dx,sx:puntatore;
  end;

var
  alb,aux:puntatore;
  alt:integer;
  ans:char;

//------------------------------------------------------------------------------
//                              Crea ABR random ricorsivo
//------------------------------------------------------------------------------
  procedure crea_alb (var a:puntatore);
    var
      x:integer;

    procedure crea(var a:puntatore;x:integer);
      begin
        if a=Nil then
          begin
            new(a);
            a^.inf:=x;
            a^.sx:=nil;
            a^.dx:=nil;
          end
        else
          if a^.inf<x then
            crea(a^.dx,x)
          else
            if a^.inf>x then
              crea(a^.sx,x);
      end;

    begin
      randomize;
      x:=random(10);
      crea(a,x);
      if x<>0 then crea_alb(a);
    end;

//------------------------------------------------------------------------------
//                        Visita in ALTEZZA
//------------------------------------------------------------------------------

  //trovo il massimo tra due cammini
  function max(a,b:integer):integer;
    begin
      if a>b then
        max:=a
      else
        max:=b;
    end;

  //trovo la altezza massima di un nodo dato
  procedure altezza_nodo (p : puntatore;x:integer);
    function altezza (p : puntatore):integer;
      begin
        if p<>NIL then
          if (p^.sx<>NIL) or (p^.dx<>NIL) then
            altezza:=max(altezza(p^.sx),altezza(p^.dx))+1
          else
            altezza:=0
        else
          altezza:=-1;
      end;

    begin
      if altezza(p)=-1 then
        writeln('Non posso trovare l''altezza,nodo non presente')
      else
        writeln('l''altezza del nodo ',x,' e'' ',altezza(p));
    end;

  //trovo un nodo dato a partire dalla radice
  function trova (p:puntatore;x:integer):puntatore;
    begin
      if p<>NIL then
        if p^.inf<>x then
          begin
            //dato che è un ABR,cerco solo nel sottoalbero interessato.
            if p^.inf>x then
              trova:=trova(p^.sx,x)
            else
              trova:=trova(p^.dx,x);
          end
        else trova:=p
      else
        trova:=NIL;
    end;

//------------------------------------------------------------------------------
//                        Visita per LIVELLI
//------------------------------------------------------------------------------

  procedure ampiezza (p : puntatore);
    type
      coda=^Tcoda;
      Tcoda=record
        inf:puntatore;
        next:coda;
      end;

    var
      n:puntatore;
      testa,paus:coda;

      procedure enqueue (x : puntatore);
        begin
          if testa=NIL then
            begin
              new(testa);
              testa^.inf:=x;
              paus:=testa;
              testa^.next:=NIL;
            end
          else
            begin
              while paus^.next<>NIL do
                paus:=paus^.next;
              new(paus^.next);
              paus:=paus^.next;
              paus^.inf:=x;
              paus^.next:=NIL;
            end;
        end;

      procedure dequeue (var testa:coda);
        begin
          if testa<>NIL then
            begin
              paus:=testa;
              testa:=testa^.next;
              dispose(paus);
              paus:=testa;
            end;
        end;

    begin
      //stampo la visita per livelli
      testa:=NIL;
      enqueue(p);
      write('visita per livelli : ');
      while testa<>NIL do
        begin
          n:=testa^.inf;
          write(n^.inf,' ');
          dequeue(testa);
          if (n^.sx <> nil) then
            enqueue(n^.sx);
          if (n^.dx <> nil) then
            enqueue(n^.dx);
      end;
    end;

//------------------------------------------------------------------------------
//                        Trova Profondità
//------------------------------------------------------------------------------

  procedure profondo (p:puntatore;livello,x:integer);
    begin
      if p<>NIL then
        if p^.inf<>x then
          begin
            if p^.inf<x then
              profondo(p^.dx,livello+1,x)
            else
              profondo(p^.sx,livello+1,x)
          end
        else
          write('il livello del nodo ',x,' e'' ',livello)
     else
      write ('non posso trovare la Profondita'',nodo non presente.');
      end;

//------------------------------------------------------------------------------
//                 Visita in Preordine,Postordine e Simmetrica
//------------------------------------------------------------------------------

  //preordine o ordine anticipato
  procedure preordine (p : puntatore);
    begin
      if p<>NIl then
        begin
          write(p^.inf);
          write('->');
          preordine(p^.sx);
          preordine(p^.dx);
        end;
    end;

  //postordine o ordine posticipato.
  procedure postordine (p : puntatore);
  begin
    if p<>NIl then
      begin
        postordine(p^.sx);
        postordine(p^.dx);
        write(p^.inf);
        write('->');
      end;
  end;

  //inordine o ordine simmetrico
  procedure inordine (p : puntatore);
  begin
    if p<>NIl then
      begin
        inordine(p^.sx);
        write(p^.inf);
        write('->');
        inordine(p^.dx);
      end;
  end;

//------------------------------------------------------------------------------
//                 cancellare un elemento di un ABR
//------------------------------------------------------------------------------
  function cancellaminimo (var p: puntatore):integer;
    begin
      if p^.sx=NIL then
        begin
          cancellaminimo:=p^.inf;
          p:=p^.dx;
        end
      else
        cancellaminimo:=cancellaminimo(p^.sx);
    end;

  procedure cancella_nodo(var p : puntatore;x : integer);
    begin
      if p<>NIL then
        if x<p^.inf then
          cancella_nodo(p^.sx,x)
        else
          if x>p^.inf then
            cancella_nodo(p^.dx,x)
          else
            if p^.sx=NIL then
              p:=p^.dx
            else
              if p^.dx=NIL then
                p:=p^.sx
              else
                p^.inf:=cancellaminimo(p^.dx);
    end;

//------------------------------------------------------------------------------
//                    Verifica se un ABR è completo
//------------------------------------------------------------------------------

  function ABR_Complete (p : puntatore):boolean;
    begin
      if p<>NIL then
        if ((p^.sx=NIL) and (p^.dx=NIL)) or ((p^.sx<>NIL) and (p^.dx<>NIL)) then
          begin
            ABR_Complete:=ABR_Complete(p^.sx);
            ABR_Complete:=ABR_Complete(p^.dx);
          end
        else
          ABR_Complete:=false
      else
        ABR_Complete:=true;
    end;

//------------------------------------------------------------------------------
//                          Conta i nodi di un ABR
//------------------------------------------------------------------------------

  procedure contanodi (p :puntatore);
    var
      count:integer;

      procedure conta (p:puntatore;var count:integer);
        begin
          if p<>NIl then
            begin
              count:=count+1;
              conta(p^.sx,count);
              conta(p^.dx,count);
            end;
        end;
    begin
      count:=0;
      conta(p,count);
      writeln('il numero dei nodi e'' ',count);
    end;

//------------------------------------------------------------------------------
//                          Conta le foglie di un ABR
//------------------------------------------------------------------------------

  procedure contafoglie (p :puntatore);
    var
      count:integer;

      procedure conta (p:puntatore;var count:integer);
        begin
          if p<>NIl then
            if (p^.sx<>NIL) and (p^.dx<>NIL) then
              begin
                conta(p^.sx,count);
                conta(p^.dx,count);
              end
            else
              count:=count+1;
        end;
    begin
      count:=0;
      conta(p,count);
      writeln('il numero delle foglie e'' ',count);
    end;


  //MAIN del Listato
  begin
    crea_alb(alb);
    writeln;
    repeat
    write('Visita in preordine  : ');
    preordine(alb);
    writeln;
    write('Visita in postordine : ');
    postordine(alb);
    writeln;
    write('Visita in ordine     : ');
    inordine(alb);
    writeln;
    ampiezza(alb);
    writeln;
    write('inserire nodo ');
    readln(alt);
    aux:=trova(alb,alt);
    altezza_nodo(aux,alt);
    profondo(alb,0,alt);
    writeln;
    write ('vuoi cancellare il nodo ',alt,'? S/N');
    readln(ans);
    if ans='s' then
    cancella_nodo(alb,alt);
    if ABR_Complete(alb)=true then
      writeln('ABR Completo')
    else
      writeln('ABR Non Completo');
    contanodi(alb);
    contafoglie(alb);
    write('vuoi controllare un altro valore? S/N  ');
    readln(ans);
    until (ans='n') or (ans='N');
  end.

