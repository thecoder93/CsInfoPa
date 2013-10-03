program quicksort_libro;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const n=100;
type lista= array[1..n] of integer;
var v: lista;  //array contenente gli interi immessi
    i,x: integer;

//inizio della procedura ricorsiva "quick"

procedure quick (sin,des: integer);
var i,j,media: integer;

  procedure scambia (var a,b: integer);
  var aux: integer;
  begin
    aux:=a;
    a:=b;
    b:=aux;
  end;

begin
  media:=(v[sin] + v[des]) div 2;
  i:=sin;
  j:=des;

  repeat
    while v[i] < media do
      i:=i+1;
    while media < v[j] do
      j:=j-1;
    if i<=j then begin
      scambia(v[i], v[j]);
      i:=i+1;
      j:=j-1;
      end;
  until i>j;

  if sin<j then quick(sin,j);
  if i<des then quick(i,des);

end;

//inizio programma principale


begin
  repeat
    write('Quanti elementi vuoi inserire? (da 1 a 100):  ');
    readln(x);
  until x<=100;
  
  writeln;
  writeln('INSERIMENTO ELEMENTI: ');;
  writeln;
  for i:=1 to x do begin
    write('Inserire il ',i,'^ elemento: ');
    readln(v[i]);
  end;

  quick(1,x);    //chiama la procedura ricorsiva

  writeln;
  writeln('ELEMENTI ORDINATI: ');
  writeln;
  for i:=1 to x do
    write(v[i],'  ');

readln;

end.
 