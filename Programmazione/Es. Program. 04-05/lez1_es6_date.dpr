program es.date;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var a,giorno1,mese1,anno1,giorno2,mese2,anno2,i:integer;

function verificadata(g,m,a:integer):boolean;
  begin
    verificadata := true;
    if (g<1) or (m<1) then verificadata := false;

    if m=2 then
      if (a mod 4 = 0) then begin
        if g > 29 then
          verificadata := false;
        end
      else
        if g>28 then
        verificadata:=false;

    if (m=4) or (m=6) or (m=9) or (m=11) then
      if g > 30 then verificadata := false;

    if g > 31 then verificadata := false;


  end;

begin

  write('Inserisci il giorno della prima data: ');
  read(giorno1);
  write('Inserisci il mese della prima data: ');
  read(mese1);
  write('Inserisci l''anno della prima data: ');
  read(anno1);
  writeln;
  writeln;
  write('Inserisci il giorno della seconda data: ');
  read(giorno2);
  write('Inserisci il mese della seconda data: ');
  read(mese2);
  write('Inserisci l''anno della seconda data: ');
  read(anno2);

  writeln;
  writeln;

  writeln('ECCO IL RESPONSO: ');

  writeln;
  writeln;

  if verificadata(giorno1,mese1,anno1) then
    writeln('La prima data e'' corretta ')
  else
    writeln('La prima data e'' sbagliata ');
  if verificadata(giorno2,mese2,anno2) then
    writeln('La seconda data e'' corretta ')
  else writeln('La seconda data e'' sbagliata ');

  if anno1>anno2 then
    writeln('La prima data e'' piu'' recente della seconda.')
  else
    if anno2>anno1 then
      writeln('La seconda data e'' piu'' recente della prima.')
    else
      if mese1>mese2 then
        writeln('La prima data e'' piu'' recente della seconda.')
      else
        if mese2>mese1 then
          writeln('La seconda data e'' piu'' recente della prima')
        else
          if giorno1>giorno2 then
            writeln('La prima data e'' piu'' recente della seconda.')
          else
            if giorno2>giorno1 then
              writeln('La seconda data e'' più recente della prima')
            else
              writeln('Le due date sono uguali...pinna!!!');




readln;
readln;

end.
