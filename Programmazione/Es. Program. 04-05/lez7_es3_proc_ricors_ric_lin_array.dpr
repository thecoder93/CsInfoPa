program lez7_es3_proc_ricors_ric_lin_array;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const n=6;
var a:array [0..n] of integer;
    pos:array [0..n] of integer;
    x,j,i,k: integer;


procedure ricerca (a:array of integer; x:integer; var k:integer);
begin

  if j<=length(a) then
    begin
      if x=a[j] then
        begin
          pos[k]:=j;
          j:=j+1;
          k:=k+1;
          ricerca (a,x,k);
        end
      else
        j:=j+1;
        ricerca (a,x,k);
    end;

end;


begin


  for i:=1 to n do
    begin
      write('Inserisci il ',i,'^ elemento dell''array: ');
      readln(a[i]);
    end;

  writeln;
  writeln;
  write('Inserisci l''intero da cercare: ');
  readln(x);
  writeln;
  writeln;

  j:=0;
  k:=0;

  ricerca(a,x,k);
  write('L''elemento e'' presente nelle posizioni: ');

  for i:=0 to k-1 do
    write(pos[i], ' ');

readln;
end.
