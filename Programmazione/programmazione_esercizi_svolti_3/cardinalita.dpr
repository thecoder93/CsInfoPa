program cardinalita;
{$APPTYPE CONSOLE}
uses
  SysUtils;

type insieme = set of 1..90;
 var s:insieme; n, car,i :integer;
begin
 writeln ('inserisci gli elementi nel set');
 S:= [];
 readln (n);
 while (n>=1) and (n<= 90)do
 begin
 S:= S + [n];
 readln (n)

 end;
 car:= 0;
 for i:=1 to 90 do
 if i in S then car:= car + 1;
 writeln ('S ha cardinalita'' =  ',car);
 readln
end. 