unit tkb_bst;

{Binary Search Tree - by TheKaneB
Versione modificata per l'esercizio "Il Pedaggio"}

interface

type bst_inf = char;
    t_bst = ^bst_node;
     bst_node = record
          id: integer;
          inf: bst_inf;
          sx: t_bst;
          dx: t_bst;
          end;

procedure bst_insert(var a: t_bst; x: bst_inf);
procedure bst_dispose(var a: t_bst);
procedure bst_print(a: t_bst);  // Utile per il debugging
function bst_assign_ids(a: t_bst): integer;
function bst_get_id_from_inf(a: t_bst; x: bst_inf): integer;

implementation

{Inserisco un nodo nell'albero in ordine alfabetico crescente}
procedure bst_insert(var a: t_bst; x: bst_inf);
begin
     if a<>nil then begin{Visito l'albero per cercare la posizione di inserimento}
        if x < a^.inf then bst_insert(a^.sx, x)
        else if x > a^.inf then bst_insert(a^.dx, x)
     end
          {Non inserirsco duplicati}
     else begin {Inserisco l'elemento al posto giusto}
        new(a);
        a^.inf := x;
        a^.id := 0;
        a^.sx := nil;
        a^.dx := nil;
     end;
end;

{In questo albero modificato gli ID servono a creare una corrispondenza
tra i nodi dell'albero etichettati come char e i nodi del grafo etichettati
come numeri interi. Gli ID sono numeri progressivi da 0 a #nodi - 1.
Restituisce il numero di nodi dell'albero.}
function bst_assign_ids(a: t_bst): integer;
var id: integer;

    procedure _assign_ids(a: t_bst);
    begin
         if a<>nil then begin
            _assign_ids(a^.sx);
            a^.id := id;
            inc(id);
            _assign_ids(a^.dx);
         end;
    end;

begin
     id := 0;
     _assign_ids(a);
     bst_assign_ids := id + 1;
end;

{Un po' di pulizia ;)}
procedure bst_dispose(var a: t_bst);
begin
     if a<>nil then begin
        bst_dispose(a^.sx);
        bst_dispose(a^.dx);
        dispose(a);
        a:=nil;
     end;
end;

{Cerca un'etichetta e ne restituisce il corrispondente ID.
Serve per creare gli archi nel grafo, etichettati nel file di input
come coppie di char.}
function bst_get_id_from_inf(a: t_bst; x: bst_inf): integer;
begin
     if a=nil then bst_get_id_from_inf := -1    {Albero vuoto, elemento non trovato}
     else
         if a^.inf = x then bst_get_id_from_inf := a^.id   {Elemento trovato}
         else
             if x < a^.inf then
                if a^.sx <> nil then
                   {Cerca a sinistra}
                   bst_get_id_from_inf := bst_get_id_from_inf(a^.sx, x)
                else bst_get_id_from_inf := -1
             else
                if a^.dx <> nil then
                   {Cerca a destra}
                   bst_get_id_from_inf := bst_get_id_from_inf(a^.dx, x)
                else bst_get_id_from_inf := -1;
end;

{Stampa in ordine dell'albero. Serve solo in fase di debugging,
per controllare che l'albero sia stato creato correttamente}
procedure bst_print(a: t_bst);
          procedure _print(a: t_bst);
          begin
               if a<>nil then begin
               _print(a^.sx);
               writeln(a^.inf, ' ', a^.id);
               _print(a^.dx);
               end;
          end;
begin
     _print(a);
     writeln('End');
end;

end.

