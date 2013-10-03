program lez3_es1_som_vettori;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  a,b,s,p:array[1..5] of integer;
  i:integer;


begin

  for i:=1 to 5 do begin
    write('Inserisci il ',i,' elemento del primo vettore: ');
    readln(a[i]);
  end;

  writeln;

  for i:=1 to 5 do begin
    write('Inserisci il ',i,' elemento del secondo vettore: ');
    readln(b[i]);
  end;

  writeln;
  writeln;
  writeln('SOMMA DEL VETTORE');
  writeln;

  for i:=1 to 5 do begin
    s[i]:=a[i]+b[i];
    writeln('L''elemento ',i, ' del vettore somma e'' uguale a: ', s[i]);
  end;

  writeln;
  writeln;
  writeln('PRODOTTO SCALARE DEL VETTORE');
  writeln;


  for i:=1 to 5 do begin
    p[i]:=a[i]*b[i];
    writeln('L''elemento ',i, ' del vettore prodotto scalare e'' uguale a: ', p[i]);
  end;


readln;
end.
 