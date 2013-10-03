program crea_grafo_lista_loop;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type

    PArco=^TArco;

    PNodo=^TNodo;

    TArco=record
      indice : PNodo;
      succ   : PArco;
    end;

    TNodo=record
      next : PNodo;
      inf  : integer;
      adia : PArco;
      visitato : string;
    end;

var
  grafo : PNodo;
  paus : PArco;
  ele:integer;
//------------------------------------------------------------------------------
//                          Crea Grafo
//------------------------------------------------------------------------------

  procedure crealistaadiacenze (var g:PNodo; q:PNodo);

    begin
      if g^.adia=NIL then
        begin
          new(g^.adia);
          g^.adia.indice:=q;
          g^.adia.succ:=NIL;
          paus:=g^.adia;
        end
      else
        begin
          new(paus^.succ);
          paus:=paus^.succ;
          paus^.indice:=q;
          paus^.succ:=NIL;
        end;
    end;


  procedure crea (var g : PNodo; x : integer);

    begin
      if g=NIL then
        begin
          new(g);
          g^.next:=NIL;
          g^.inf:=x;
          g^.visitato:='bianco';
          g^.adia:=NIL;
        end
      else
        crea(g^.next,x);
    end;

  procedure creagrafo (var g : PNodo);

    var
      testa,aux : PNodo;
      x,i,n,y : integer;
      ans:char;

    begin
      write('quanti nodi vuoi inserire? ');
      readln(n);
      for i:=1 to n do
        begin
          write ('inserire il ',i,'§ nodo ');
          readln(x);
          crea(g,x);
        end;
      testa:=grafo;
      for i:=1 to n do
        begin
          repeat
          aux:=grafo;
          write('vuoi inserire i nodi adiacenti a ',testa^.inf,'? S/N');
          readln(ans);
          if ans='s' then
            begin
              write('inserire nodo adiacente a ',testa^.inf,':   ');
              readln(y);
              while (aux<>NIL) and (aux^.inf<>y) do
                aux:=aux^.next;
              if aux=NIL then
                writeln('spiacente,non puoi collegare il nodo ',testa^.inf,' a un nodo che non esiste')
              else
                crealistaadiacenze(testa,aux);
            end;
          until ans='n';
          testa:=testa^.next;
        end;
    end;

//------------------------------------------------------------------------------
//                            Visita BFS
//------------------------------------------------------------------------------

procedure BFS (g : PNodo; indicesorgente : integer);
  type
    Pcoda=^Tcoda;
    Tcoda=record
      inf:PNodo;
      next:Pcoda;
    end;

  var
    testa,paus:Pcoda;
    i:integer;
    arc: PArco;
    indicecorrente,aux: PNodo;

      procedure enqueue (x : PNodo);
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

      procedure dequeue (var testa:Pcoda);
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
    writeln('----- BFS : Visita per Livelli -----');
    aux:=g;
    while (aux<>NIL) and (aux^.inf<>indicesorgente) do
      aux:=aux^.next;
    testa:=NIL;
    aux^.visitato:='grigio';
    enqueue(aux);
    while testa<>NIL do
      begin
        indicecorrente:=testa^.inf;
        arc:=indicecorrente^.adia;
        while arc<>NIL do
          if arc^.indice.visitato='bianco' then
            begin
              arc^.indice.visitato:='grigio';
              enqueue(arc^.indice);
              arc:=arc^.succ;
            end
          else
            arc:=arc^.succ;
        dequeue(testa);
        indicecorrente^.visitato:='nero';
        write (indicecorrente^.inf);
        write(' --> '); 
      end;
  end;

//------------------------------------------------------------------------------
//                            Visita DFS
//------------------------------------------------------------------------------
  procedure DFS (g : PNodo;indicesorgente : integer);

    procedure dfs_visit (var aux:PNodo);
      var
        arc:PArco;
      begin
        aux^.visitato:='grigio';
        write(aux^.inf);
        write(' --> ');
        arc:=aux^.adia;
        while arc<>NIL do
          if arc^.indice.visitato='bianco' then
            begin
              dfs_visit(arc^.indice);
              arc:=arc^.succ;
            end
          else
            arc:=arc^.succ;
      end;

    var
      aux:PNodo;
    begin
      writeln;
      writeln('----- DFS : Visita in Profondita'' ');
      aux:=g;
      //riporto i campi a 'bianco'
      while aux<>NIL do
        begin
          aux^.visitato:='bianco';
          aux:=aux^.next;
        end;

      aux:=g;
      while (aux<>NIL) and (aux^.inf<>indicesorgente) do
        aux:=aux^.next;
      if aux^.visitato='bianco' then
        dfs_visit(aux);

    end;



begin
  creagrafo(grafo);
  write('da quale nodo vuoi partire? ');
  readln(ele);
  BFS(grafo,ele);
  DFS(grafo,ele);
  readln;
end.
