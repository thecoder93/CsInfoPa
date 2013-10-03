program lez4_es3_selectionsort;

{$APPTYPE CONSOLE}

uses
  SysUtils;

  var
    a:array[1..6] of integer;
    i,aus,min,j,pos:integer;

begin

  for i:=1 to 6 do begin
    write('Inserisci il ',i,' valore dell''array: ');
    read(a[i]);
  end;
  writeln;

  pos:=0;

  for i:=1 to 5 do begin
    min:=a[i];
    for j:=(i+1) to 6 do begin
      if a[j]<min then begin
        min:=a[j];
        pos:=j;
      end;
    end;
    aus:=a[i];
    a[i]:=min;
    a[pos]:=aus;
  end;

  for i:=1 to 6 do
    write(a[i],'  ');

readln;
readln;
end.
