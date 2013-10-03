
program bubblesort_es1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const max=10;

type vettore= array[1..max] of integer;

var vet: vettore;
    i,p,n,aux,x:integer;
    scambio:boolean;

begin

//immissione lunghessa vettore

  repeat
    writeln;
    write('Numero elementi: ');
    readln(n);
  until (n>=1) and (n<=10);
  x:=n;

//immissione elementi del vettore

  for i:=1 to n do begin
   writeln;
   write('Immettere ',i,'^ elemento: ');
   readln(vet[i]);
  end;

//ordinamento
  p:=n;
  repeat
    scambio:=false;
    for i:=1 to n-1 do
      if vet[i]>vet[i+1] then begin
        aux:=vet[i];
        vet[i]:=vet[i+1];
        vet[i+1]:=aux;
        scambio:=true;
        p:=i+1;
      end;
    n:=p;
  until
    scambio=false;


//visualizza vettore ordinato
  writeln;
  writeln;
  writeln('VETTORE ORDINATO: ');
  writeln;
  writeln;
  for i:=1 to x do
    write(vet[i],'  ');


readln;
end.
 