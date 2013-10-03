program testvett;
{$APPTYPE CONSOLE}
uses
  SysUtils;

var a: array [1..100] of integer;
  i, n :integer; t: boolean;
begin
  writeln ('inserisci la dimensione del vettore');
  readln (n);
  for i:=1 to n do readln (a[i]);
  t:= true;    i:=1;
  while t and (i <= n) do
  begin
  if   a[i] <= 0 then t:= false;
  i:= i+1
  end;
  writeln (t);
  readln
end.