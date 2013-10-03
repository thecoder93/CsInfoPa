program sommavet;
{$APPTYPE CONSOLE}
uses
  SysUtils;

type vet = array [1..100] of integer;
 var a, b : vet; i, n : integer;
begin
writeln ('inserisci la dimensione dei vettori (deve essere < = 100)');
readln (n);
writeln ('inserisci gli elementi del primo vettore');
  for i:=1 to n do readln (a[i]);
writeln ( 'inserisci gli elementi del secondo vettore');
 for i:=1 to n do readln (b[i]);
 writeln ('il vettore somma : ');
 for i:= 1 to n do write (a[i]+ b[i]: 6);
  readln
end.