unit UFmStampaMemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls;

type
  TFmStampaMemo = class(TForm)
    BtStampa: TButton;
    LsStampanti: TListBox;
    EtTesto: TMemo;
    BtFont: TButton;
    DlgFont: TFontDialog;
    Label1: TLabel;
    BtCarica: TButton;
    DlgCarica: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure BtStampaClick(Sender: TObject);
    procedure BtFontClick(Sender: TObject);
    procedure BtCaricaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmStampaMemo: TFmStampaMemo;

implementation

{$R *.DFM}

uses
  UStampa;

procedure TFmStampaMemo.FormCreate(Sender: TObject);
begin
// inizializza la lista delle stampanti
  CaricaStampanti( LsStampanti.Items );
// seleziona la prima
  LsStampanti.ItemIndex := 0;
end;

procedure TFmStampaMemo.BtStampaClick(Sender: TObject);
begin
  StampaMemo( EtTesto, LsStampanti.Items[ LsStampanti.ItemIndex ] );
  ShowMessage( 'Stampa effettuata' );
end;

procedure TFmStampaMemo.BtFontClick(Sender: TObject);
begin
// cambia il font del Memo
  DlgFont.Font := EtTesto.Font;
  if DlgFont.Execute then
    EtTesto.Font := DlgFont.Font;
end;

procedure TFmStampaMemo.BtCaricaClick(Sender: TObject);
begin
// carica un testo
  if DlgCarica.Execute then
    EtTesto.Lines.LoadFromFile( DlgCarica.FileName );
end;

end.
