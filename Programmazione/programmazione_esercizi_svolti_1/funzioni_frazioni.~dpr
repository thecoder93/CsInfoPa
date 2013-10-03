program funzioni_frazioni;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type frazione=array[1..2]of integer;
var
a,b,sum,prod:frazione;

procedure caricamento(var fraz:frazione);
var i:integer;
begin
for i:=1 to 2 do begin
writeln('Inserisci elemento ',i);
readln(fraz[i]);
end;
end;

procedure stampa(fraz:frazione);
var i:integer;
begin
for i:=1 to 2 do
writeln(fraz[i]);
end;

function prodotto(a,b:frazione):frazione;
var num,den:integer;
begin
num:=a[1]*b[1];
den:=a[2]*b[2];
prodotto[1]:=num;
prodotto[2]:=den;
end;

function somma(a,b:frazione):frazione;
var num,den:integer;
begin
den:=1;
if (a[2]=b[2])or ((a[2]>b[2])and(a[2] mod b[2]=0))then
den:=a[2];
if (b[2]>a[2])and (b[2] mod a[2]=0)then
den:=b[2];
if (a[2] mod b[2]<>0)and(b[2] mod a[2]<>0)then
den:=(a[2]*b[2]);
num:=((den div a[2])*a[1])+((den div b[2])*b[1]);
somma[1]:=num;
somma[2]:=den;
end;


procedure semplifica(var fraz:frazione);
function mcd(a,b:integer):integer;
begin
if a mod b=0 then
mcd:=b
else
mcd:=mcd(b,a mod b);
end;
var maxdiv:integer;
begin
maxdiv:=mcd(fraz[1],fraz[2]);
fraz[1]:=fraz[1]div(maxdiv);
fraz[2]:=fraz[2]div(maxdiv);
end;

begin
caricamento(a);
caricamento(b);
prod:=prodotto(a,b);
writeln('Il prodotto e'' :');
stampa(prod);
semplifica(prod);
writeln('Il prodotto semplificato e'' :');
stampa(prod);
sum:=somma(a,b);
writeln('La somma e'' :');
stampa(sum);
semplifica(sum);
writeln('La somma semplificata e'' :');
stampa(sum);
readln;
end.
