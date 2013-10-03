program NumeraRighe;

{$APPTYPE CONSOLE}

uses
  UNumeraRighe in 'UNumeraRighe.pas';

begin
  // emettiamo una riga vuota
  Writeln( '' );
  // se i parametri sono in numero sbagliato stampiamo
  // delle brevi istruzioni per l'uso
  if ( ParamCount < 1 ) or ( ParamCount > 2 ) then
    Writeln( 'Usare: NumeraRighe Nome_file_origine ' +
      '[Nome_File_Destinazione]' )
  else
    // altrimenti elaboriamo le righe e stampiamo un
    // messaggio con il risultato dell'operazione
    if ElaboraRighe( ParamStr( 1 ), ParamStr( 2 ) ) then
      Writeln( 'Operazione riuscita' )
    else
      Writeln( 'Errore' );
end.
