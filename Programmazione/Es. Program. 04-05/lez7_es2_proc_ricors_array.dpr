program lez7_es2_proc_ricors_array;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const n=5;

var a:array[0..n] of integer;
    i,x,j:integer;

function massimo (a:array of integer; pos : integer; mas : integer): integer;

 begin
  if (pos<=length(a)) then
    begin
      if a[pos]>mas then
        begin
          j:=pos;
          massimo := massimo(a,pos+1,a[pos])
        end
      else // non abbiamo un massimo
        massimo := massimo (a,pos+1,mas)
    end
  else
    massimo := mas
 end;



{  begin
    pos:=0;
    x:=length(a);
    for i:=0 to x-1 do
      if a[pos] < a[i] then begin
        pos:=i;
      end;
  posizione:=pos+1;
  end;

}
begin

  writeln;
  for i:=1 to n do
    begin
      write('Inserisci il ',i,'^ valore dell''array: ');
      readln(a[i]);
    end;
  for i:=1 to n do
    write(a[i],' ');
  writeln;
  writeln;
  j:=0;
  x:=massimo(a,1,0);
  writeln('Il valore massimo e'': ',x,' e si trova nella posizione: ',j);

readln;
end.
