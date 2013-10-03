program NumeraRigheEx;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  UNumeraRighe in 'UNumeraRighe.pas';

var
  m, FileOut: string;
  Modal: TModoNumeri;
  PrimaRiga: integer;
begin
  // saltiamo una riga
  Writeln( '' );
  // se se i parametri sono in numero sbagliato emettiamo la spiegazione
  if ( ParamCount < 1 ) or ( ParamCount > 4 ) then begin
    Writeln( 'Usare: NumeraRigheEx File_origine [File_Destinazione] ' +
      '[-Pnnnn] [-S|-A|-T]' );
    Writeln( '-Pxxxxx: Numero di riga da cui partire con la numerazione' );
    Writeln( '-S: sostituire i numeri riga se già presenti (default) ' +
      '-A: aggiungere i numeri riga -T: togliere tutti i numeri riga' );
  end
  else begin
    // il parametro relativo al numero da cui partire
    // può essere il secondo o il terzo
    if ( Copy( ParamStr( 2 ), 1, 2 ) = '-P' ) then begin
      FileOut := '';
      PrimaRiga := StrToIntDef( Copy( ParamStr( 2 ), 3, 5 ), 1 );
    end
    else if ( Copy( ParamStr( 3 ), 1, 2 ) = '-P' ) then begin
      FileOut := ParamStr( 2 );
      PrimaRiga := StrToIntDef( Copy( ParamStr( 3 ), 3, 5 ), 1 );
    end
    else
      PrimaRiga := 1;

    // la modalità può essere solo nell'ultimo parametro
    m := ParamStr( ParamCount );
    if m = '-A' then
      Modal := mdAgg
    else if m = '-T' then
      Modal := mdTogli
    else
      Modal := mdSost;

    // ora abbiamo i parametri e possiamo lanciare la funzione
    if ElaboraRighe( ParamStr( 1 ), FileOut, PrimaRiga, Modal ) then
      Writeln( 'Operazione riuscita' )
    else
      Writeln( 'Errore' );
   end;
end.
