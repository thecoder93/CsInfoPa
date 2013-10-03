program stampacaratteriordineinverso;
{$APPTYPE CONSOLE}
uses
  SysUtils;

var a: array [1..100] of integer;
 i, n : integer;
begin
writeln ('quanti elementi vuoi inserire? (non possono essere + di 100)');
readln (n);
writeln ('inserisci gli elementi');
  for i:=1 to n do readln (a[i]);
  for i:= n downto 1 do write (a[i]: 6);
  readln
end.