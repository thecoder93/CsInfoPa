program Equazione_secondo_grado;
{$APPTYPE CONSOLE}
uses
  SysUtils;
var
a,x,x1,x2,b,c,delta:real;
begin
delta:=0;
writeln ('Inserisci il parametro a');
readln (a);
writeln ('Inserisci il parametro b');
readln (b);
writeln ('Inserisci il parametro c');
readln (c);

if a=0 then
begin
x:=-c/b;
writeln ('L''equazione ha grado uno e ha soluzione uguale a',x);
readln;
end
else
begin
delta:=(b*b)-(4*a*c);
writeln ('Delta ha valore',(delta));
writeln ('Premi un tasto per avere le soluzioni dell''equazione');
readln;
end;

if delta>0 then
begin
x1:=(-b+sqrt(delta))/(2*a);
x2:=(-b-sqrt(delta))/(2*a);
writeln ('La prima soluzione ha valore',x1);
writeln ('La seconda soluzione ha valore',x2);
end
else
if delta=0 then
begin
x1:=(-b+sqrt(delta))/(2*a);
writeln ('Le soluzioni sono coincidenti e hanno valore',x1);
end
else
writeln ('L''equazione non ha soluzioni reali');
readln;
end.
