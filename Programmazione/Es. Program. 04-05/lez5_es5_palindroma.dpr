program lez5_es5_palindroma;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  s : string [99];
  x,n,i:integer;
  veridicita:boolean;

begin

  write('Inserisci la stringa: ');
  readln(s);
  writeln;

  n:=length(s);
  veridicita:=false;
  i:=1;

  repeat
    if s[i]=s[n] then
        veridicita:=true;
        n:=n-1;
        i:=i+1;
  until (i>=n);

  writeln;
  if veridicita then
    writeln('La parola e'' palindroma.')
  else
    writeln('La parola non e'' palindroma.');

readln;
end.
