program inverti_lista;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
    PLista=^Tlista;
    Tlista=record
      inf:integer;
      next:PLista;
    end;

  var
    testa,paus:PLista;
    count:integer;

    procedure enqueue (x : integer);
        begin
          if testa=NIL then
            begin
              new(testa);
              testa^.inf:=x;
              paus:=testa;
              testa^.next:=NIL;
            end
          else
            begin
              while paus^.next<>NIL do
                paus:=paus^.next;
              new(paus^.next);
              paus:=paus^.next;
              paus^.inf:=x;
              paus^.next:=NIL;
            end;
        end;

    procedure stampa (p : PLista);
      begin
        if p<>NIl then
          begin
            write(p^.inf);
            write('-->');
            stampa(p^.next);
          end;
      end;

    procedure inverti (var p : PLista);

        procedure inverti2 (corr,prec:PLista);
          begin
            if corr<>NIl then
              begin
                inverti2(corr^.next,corr);
                corr^.next:=prec;
              end
            else
              p:=prec;
          end;

      begin
        inverti2(p,NIL);
      end;


  begin
    randomize;
    count:=0;
    repeat
    enqueue(random(15)+1);
    count:=count+1;
    until count=10;
    stampa(testa);
    inverti(testa);
    writeln;
    stampa(testa);
    readln;
  end.
 