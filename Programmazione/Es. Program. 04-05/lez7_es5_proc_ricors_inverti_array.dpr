program lez7_es5_proc_ricors_inverti_array;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const n=6;


var a: array [0..n-1] of integer;
    c: array [0..n-1] of integer;
    i: integer;

procedure inversione (a:array of integer; var c: array of integer; i:integer);
begin

  if i<=n then begin
    c[(n-1)-i]:=a[i];
    inversione(a,c,i+1);
  end;

end;


begin


for i:=0 to n-1 do begin
    write('Inserisci il ',i+1,' valore dell''array: ');
    readln(a[i]);
  end;
  writeln;
  writeln;

  inversione(a,c,0);

  for i:=0 to n-1 do
    write(c[i],'  ');

readln;
end.
