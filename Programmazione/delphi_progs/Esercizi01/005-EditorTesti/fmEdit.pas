unit fmEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls;

type
  TfmEditor = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Nuovo1: TMenuItem;
    Apri1: TMenuItem;
    Salva1: TMenuItem;
    Esci1: TMenuItem;
    Formato1: TMenuItem;
    Carattere1: TMenuItem;
    etTesto: TMemo;
    odApri: TOpenDialog;
    sdSalva: TSaveDialog;
    fdCarattere: TFontDialog;
    procedure Nuovo1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Apri1Click(Sender: TObject);
    procedure Salva1Click(Sender: TObject);
    procedure Esci1Click(Sender: TObject);
    procedure etTestoChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Carattere1Click(Sender: TObject);
  private
    NomeFile: string;
    Salvato: boolean;
    procedure FileApri;
    procedure FileNuovo;
    procedure FileSalva;
    function Conferma: boolean;
    procedure FormatoCarattere;
  public
    procedure SetNomeFile(const value: string );
    procedure SetSalvato(const value: boolean );
  end;

var
  fmEditor: TfmEditor;

implementation

{$R *.DFM}

procedure TfmEditor.Nuovo1Click(Sender: TObject);
begin
  FileNuovo;
end;

procedure TfmEditor.Apri1Click(Sender: TObject);
begin
  FileApri;
end;

procedure TfmEditor.Salva1Click(Sender: TObject);
begin
  FileSalva;
end;

procedure TfmEditor.Carattere1Click(Sender: TObject);
begin
  FormatoCarattere;
end;

procedure TfmEditor.Esci1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmEditor.FileNuovo;
begin
  if not Conferma then // prima controllo se c'è da confermare
    exit; // eventualmente esco e non faccio nulla
  etTesto.Clear; // pulisco il testo
  SetNomeFile( 'Nuovo' ); // imposto il nome
  SetSalvato( true ); // ed il flag
end;

procedure TfmEditor.FileSalva;
begin
  sdSalva.FileName := NomeFile; // propongo il nome file attuale
  if sdSalva.Execute then
  begin // se l'utente ha scelto un nome
    etTesto.Lines.SaveToFile( sdSalva.FileName ); // salvo il testo
    SetNomeFile( sdSalva.FileName ); // imposto il nome
    SetSalvato( true ); // ed il flag
  end;
end;

procedure TfmEditor.FileApri;
begin
  if not Conferma then // prima controllo se c'è da confermare
    exit; // eventualmente esco e non faccio nulla
  if odApri.Execute then
  begin // se l'utente ha scelto un file
    etTesto.Lines.LoadFromFile( odApri.FileName ); // lo carico nel Memo
    SetNomeFile( odApri.FileName ); // imposto il nome
    SetSalvato( true ); // e lo considero salvato
  end;
end;

procedure TfmEditor.FormCreate(Sender: TObject);
begin
  // imposto il flag per evitare la richiesta
  // di conferma all'apertura
  SetSalvato( true ); 
  FileNuovo;
end;

procedure TfmEditor.etTestoChange(Sender: TObject);
begin
  // ripulisco il flag dopo ogni cambiamento del testo
  SetSalvato( false ); 
end;

procedure TfmEditor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := Conferma; // chiudo solo dopo conferma
end;

function TfmEditor.Conferma: boolean;
var
  risposta: word;
begin
  result := True; // normalmente si può procedere
  if not salvato then
  begin
    risposta := MessageDlg( 'Salvo il testo?', mtConfirmation, mbYesNoCancel, 0 );
    case risposta of
      mrCancel: result := false; // annulla tutto
      mrYes: FileSalva; // prima salva
    end;
  end;
end;

procedure TfmEditor.SetNomeFile(const value: string);
begin // uso una funzione per impostare la variabile interna
  NomeFile := value;
  Caption := value + ' - Semplice editor'; // ...la Caption della form
  Application.Title := Caption; // ... e il titolo dell'applicazione
end;

procedure TfmEditor.SetSalvato(const value: boolean);
begin  // uso una funzione per impostare la variabile interna
  Salvato := value;
  Salva1.Enabled := not Salvato; // e lo stato del MenuItem
end;

procedure TfmEditor.FormatoCarattere;
begin
  fdCarattere.Font := etTesto.Font;
  if fdCarattere.Execute then
    etTesto.Font := fdCarattere.Font;
end;

end.
