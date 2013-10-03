program sommaprodottomatrici;
{$APPTYPE CONSOLE}
uses
  SysUtils;

type mat= array[1..100,1..100]  of integer;
 var m1,m2,m3:mat; i,j,n,m,h,k,t:integer; c:char;

 procedure leggi(var matrice:mat; var x, y:integer);
 var h,k:integer;
 begin
 writeln('inserisci il numero di righe');
 readln(x);
 writeln('inserisci il numero di colonne');
 readln(y);
 writeln('inserisci gli elementi della matrice');
 for h:=1 to x do
 for k:=1 to y do
 readln (matrice[h,k])
 end;

 procedure stampa(matrice:mat; x,y:integer);
 var h,k:integer;
 begin
 for h:=1 to x do
 begin
 for k:=1 to y do
 write (matrice[h,k]:4);
 writeln
 end;
 end;

begin
  Leggi(m1,i,j);
  Leggi(m2,n,m);
  writeln('se vuoi sommare digita s, se vuoi fare il prodotto digita p');
  readln (c);
  case c of 's':begin
                if (i<>n) or (j<>m) then
                writeln ('le matrici hanno dimensione diversa e non si può fare la somma')
                else
                begin
                        for h:=1 to i do
                        for k:=1 to j do
                        m3[h,k]:= m1[h,k]+m2[h,k];
                        stampa(m3,i,j);
                        end;
                end;
             'p':begin if (i<>m) or (j<>n) then
                writeln ('le matrici hanno dimensione diversa e non si può fare la somma')
                else
                begin
                        for h:=1 to i do
                        for k:=1 to m do
                        begin m3[h,k]:=0;
                              for t:=1 to j do
                              m3[h,k]:=m3[h,k]+ m1[h,t]*m2[t,k]
                        end;

                end;
                stampa(m3,i,i);
                end;
             end;
  readln
end.