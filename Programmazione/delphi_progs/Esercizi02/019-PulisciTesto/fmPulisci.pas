unit fmPulisci;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls;
type
  TfmPuliscitesto = class(TForm)
    EtFile: TEdit;
    btProc: TButton;
    BtSfoglia: TSpeedButton;
    DlgApri: TOpenDialog;
    EtOutput: TMemo;
    procedure BtSfogliaClick(Sender: TObject);
    procedure btProcClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure PulisciTesto( var corrente: String );
    procedure SostituisciAccentate(var testo: String);
  public
    { Public declarations }
  end;

var
  fmPuliscitesto: TfmPuliscitesto;

implementation

{$R *.DFM}

procedure TfmPuliscitesto.BtSfogliaClick(Sender: TObject);
begin
if DlgApri.Execute then
  EtFile.Text := DlgApri.FileName;
end;

procedure TfmPuliscitesto.SostituisciAccentate( var testo: String );
begin
  // sostituisco una per una tutte le vocali accentate
  // con la coppia vocale più apostrofo.
  testo := StringReplace( testo, 'è', 'e''', [ rfReplaceAll ] );
  testo := StringReplace( testo, 'é', 'e''', [ rfReplaceAll ] );
  testo := StringReplace( testo, 'à', 'a''', [ rfReplaceAll ] );
  testo := StringReplace( testo, 'ò', 'o''', [ rfReplaceAll ] );
  testo := StringReplace( testo, 'ì', 'i''', [ rfReplaceAll ] );
  testo := StringReplace( testo, 'ù', 'u''', [ rfReplaceAll ] );
end;

procedure TfmPuliscitesto.PulisciTesto( var corrente: String );
var
  c: byte;
  k: integer;
begin
  k := 1; // indice del carattere da elaborare
  SostituisciAccentate( corrente );
  while k <= Length( corrente ) do // finché ci sono ancora caratteri...
    begin
      // ...leggiamo il carattere
      c := Ord( corrente[ k ] );
      if c = 13 then // se è un ritorno a capo...
        corrente[ k ] := '#' // ...mettiamo un "cancelletto"
      else if ( c > 96 ) and ( c < 123 ) then // se é una minuscola...
        corrente[ k ] := Chr( c - 32 ) // ...convertiamo in maiuscolo
      else if ( c < 32 ) or ( c > 90 ) then // se non è valido...
        Delete( corrente, k, 1 ) // ...lo eliminiamo.
      else
        Inc( k ); // altrimenti passiamo alla lettera seguente
    end;
end;

procedure TfmPuliscitesto.btProcClick(Sender: TObject);
var
  t: string;
begin
  // carichiamo tutto il testo nel Memo
  EtOutput.Lines.LoadFromFile( EtFile.Text );
  // carichiamo il testo in una variabile
  t := EtOutput.Text;
  // lo ripuliamo
  PulisciTesto( t );
  // e lo rimettiamo nel Memo
  EtOutput.Text := t;
end;

procedure TfmPuliscitesto.FormCreate(Sender: TObject);
begin
  // inizializziamo la form
  EtFile.Text := '';
  EtOutput.Text := '';
  Caption := 'Pulisci il testo';
end;

end.
