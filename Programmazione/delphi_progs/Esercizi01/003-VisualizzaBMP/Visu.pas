unit Visu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, ExtDlgs;

type
  TfmVisualizza = class(TForm)
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    Image1: TImage;
    btChiudi: TBitBtn;
    btApri: TBitBtn;
    btSalva: TBitBtn;
    opdApri: TOpenPictureDialog;
    spdSalva: TSavePictureDialog;
    procedure btChiudiClick(Sender: TObject);
    procedure btApriClick(Sender: TObject);
    procedure btSalvaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmVisualizza: TfmVisualizza;

implementation

{$R *.DFM}

procedure TfmVisualizza.btChiudiClick(Sender: TObject);
begin
  Close; // chiude la form e il programma
end;

procedure TfmVisualizza.btApriClick(Sender: TObject);
begin
  if opdApri.Execute then // l'utente ha scelto un file
  begin
    Image1.picture.LoadFromFile( opdApri.filename ); // carico l'immagine
    btSalva.Enabled := true; // attivo il bottone Salva
    Caption := opdApri.filename;
  end;
end;

procedure TfmVisualizza.btSalvaClick(Sender: TObject);
begin
  if spdSalva.Execute then // l'utente ha scelto un file
  begin
    Image1.picture.SaveToFile( spdSalva.filename ); // salvo l'immagine
    Caption := spdSalva.filename;
  end;
end;

end.
