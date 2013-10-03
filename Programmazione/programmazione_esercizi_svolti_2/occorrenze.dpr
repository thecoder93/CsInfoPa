program occorrenze;
{$APPTYPE CONSOLE}
uses
  SysUtils;

var a: array['a'..'z'] of integer;
  c, ch : char;
begin
for ch:= 'a' to 'z' do
a [ch] := 0;
writeln ('inserisci la parola. ( * per terminare)');
readln (c);
while (c >= 'a') and ( c<= 'z' ) do
begin
a[c] := a[c]+ 1;
readln (c)
end;
if c = '*' then
for ch := 'a' to 'z' do writeln ( ch, '    ', a[ch])
else writeln ('carattere non valido');
readln
end.