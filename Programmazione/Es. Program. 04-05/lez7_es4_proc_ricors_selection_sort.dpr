program lez7_es4_proc_ricors_selection_sort;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const n=5;

var a: array [1..n] of integer;
    i: integer;

procedure selection_sort(var a:array of integer; pos: integer);
var i,j,min,aus: integer;

begin

  if pos< n then begin
    min:=a[pos];
    for i:=pos to n-1 do
      if a[i]<min then begin
        min:=a[i];
        j:=i;
        aus:=a[pos];
        a[pos]:=a[j];
        a[j]:=aus;
        end;
        
   selection_sort(a,pos+1);
  end;

end;



begin


   for i:=1 to n do begin
    write('Inserisci il ',i,' valore dell''array: ');
    readln(a[i]);
  end;
  writeln;
  writeln;

  selection_sort(a,0);

  for i:=1 to n do
    write(a[i],'  ');

readln;
end.
