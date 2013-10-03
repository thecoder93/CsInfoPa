unit conv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfmConverti = class(TForm)
    etPollici: TEdit;
    etCentimetri: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure etCentimetriChange(Sender: TObject);
    procedure etPolliciChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmConverti: TfmConverti;

implementation

{$R *.DFM}

procedure TfmConverti.etCentimetriChange(Sender: TObject);
begin
  if etCentimetri.focused then // per evitare cambiamenti a cascata
    // 0.39 = 1/ 2.54
    etPollici.text := floattostr( 0.39 * strtofloat( etCentimetri.Text ) );
end;

procedure TfmConverti.etPolliciChange(Sender: TObject);
begin
  if etPollici.focused then // per evitare cambiamenti a cascata
    etCentimetri.text := floattostr( 2.54 * strtofloat( etPollici.Text ) );
end;

procedure TfmConverti.FormCreate(Sender: TObject);
begin
  // inizializzo i campi di testo
  etCentimetri.text := '0';
  etPollici.text := '0';
end;

end.
