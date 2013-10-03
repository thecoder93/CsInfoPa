unit UfmContaParole;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFmContaParole = class(TForm)
    lbRisultato: TLabel;
    btConta: TButton;
    dlgApri: TOpenDialog;
    procedure btContaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmContaParole: TFmContaParole;

implementation

{$R *.DFM}

uses
  Stringhe;

procedure TFmContaParole.btContaClick(Sender: TObject);
begin
  // uso un dialog per caricare il file di testo
  if dlgApri.Execute then
    lbRisultato.Caption :=
      IntToStr( ContaParoleInFile( dlgApri.FileName ) ) +
      ' parole in ' + dlgApri.FileName;
end;

end.
