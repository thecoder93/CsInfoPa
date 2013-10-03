program lez5_es4_stringa_sost;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
  f,p1,p2 : string [99];
  x:integer;

begin

  write('Inserisci la prima frase: ');
  readln(f);
  writeln;
  write('Inserisci la parola da sostituire: ');
  readln(p1);
  writeln;
  write('Inserisci la nuova parola da immettere: ');
  readln(p2);

  writeln;
  if pos(p1,f)=0 then
    writeln('La parola non e'' contenuta nella frase')
  else begin
     x:=pos(p1,f);
     delete(f,x,(length(p1)));
     insert(p2,f,x);
     writeln;
     writeln('FRASE MODIFICATA: ');
     writeln;
     writeln(f);
   end;



readln;
end.
