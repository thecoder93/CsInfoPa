program ascii;
{$APPTYPE CONSOLE}
uses
  SysUtils;

var a: array [1..100]of char;
 i, n : integer;
begin
  writeln ('inserisci la dimensione del vettore');
  readln (n);
  writeln ('inserisci gli elementi');
  for i := 1 to n do readln (a[i]);
  for i := 1 to n do writeln (ord(a[i]));
 readln
  end.
