unit tkb_pri_queue;

{Priority Queue - by TheKaneB
Questa Unit implementa una coda dove l'elemento in testa è quello con
il minore peso di tutta la struttura. L'implementazione fa uso di una
struttura ad albero binario di ricerca, basata sulla unit tkb_bst.
La priorità degli elementi viene stabilita dal parametro w, cioè dal loro peso.}

interface

type pri_queue_inf = integer;
     pri_queue_w = integer;
     t_pri_queue = ^pri_queue_node;
     pri_queue_node = record
                    inf: pri_queue_inf;
                    w: pri_queue_w;
                    sx, dx: t_pri_queue;
                    end;

procedure pri_queue_push(var a: t_pri_queue; i: pri_queue_inf; w: pri_queue_w);
procedure pri_queue_init(var a: t_pri_queue);
procedure pri_queue_dispose(var a: t_pri_queue);
function pri_queue_pop(var a: t_pri_queue): pri_queue_inf;
function pri_queue_empty(a: t_pri_queue): boolean;

implementation

{Inserisco un nodo nella coda. I nodi sono ordinati in ordine crescente
secondo il peso w}
procedure pri_queue_push(var a: t_pri_queue; i: pri_queue_inf; w: pri_queue_w);
begin
     if a=nil then begin {Inserimento}
        new(a);
        a^.sx := nil;
        a^.dx := nil;
        a^.inf := i;
        a^.w := w;
     end
     else {Ricerca della posizione}
        if w < a^.w then
           pri_queue_push(a^.sx, i, w)
        else
           pri_queue_push(a^.dx, i, w);
end;

{Inizializzo la coda}
procedure pri_queue_init(var a: t_pri_queue);
begin
     a := nil;
end;

{Elimino la coda dall'heap}
procedure pri_queue_dispose(var a: t_pri_queue);
begin
     if a<>nil then begin
        pri_queue_dispose(a^.sx);
        pri_queue_dispose(a^.dx);
        dispose(a);
        a:=nil;
     end;
end;

{Restituisce l'elemento con peso minimo e lo cancella dalla coda.}
function pri_queue_pop(var a: t_pri_queue): pri_queue_inf;

    {Sostituisco un nodo con un figlio, e lo cancello}
    procedure _replace(var a1: t_pri_queue; a2: t_pri_queue);
    var aux: t_pri_queue;
    begin
         aux := a1;
         a1 := a2;
         dispose(aux);
    end;

begin
    {Eseguire esternamente il controllo pri_queue_empty !!!!! }
    
    {Elemento trovato, eseguo la cancellazione}
    if a^.sx = nil then begin
       pri_queue_pop := a^.inf;
       _replace(a, a^.dx);
    end
    else
       pri_queue_pop := pri_queue_pop(a^.sx);
end;

{Restituisce TRUE se la coda è vuota, altrimenti FALSE.}
function pri_queue_empty(a: t_pri_queue): boolean;
begin
     pri_queue_empty := (a = nil);
end;

end.

