unit conv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfmConverti = class(TForm)
    etPollici: TEdit;
    etCentimetri: TEdit;
    lbUnit1: TLabel;
    lbUnit2: TLabel;
    rgMisure: TRadioGroup;
    kbArrotonda: TCheckBox;
    procedure etCentimetriChange(Sender: TObject);
    procedure etPolliciChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgMisureClick(Sender: TObject);
  private
    Conv: extended; // fattore di conversione (usato internamente)
  public
  end;

var
  fmConverti: TfmConverti;

implementation

{$R *.DFM}

procedure TfmConverti.FormCreate(Sender: TObject);
begin
  Conv := 2.54; // inizio dai pollici
  // inizializzo i campi di testo
  etCentimetri.text := '0';
  etPollici.text := '0';
end;

procedure TfmConverti.etCentimetriChange(Sender: TObject);
var
  val: extended;
begin
  if etCentimetri.focused then // per evitare cambiamenti a cascata
  begin
    val :=strtofloat( etCentimetri.Text ) / Conv;
    if kbArrotonda.Checked then
      val := round( val ); // arrotondamento se necessario
    etPollici.text := floattostr( val );
  end;
end;

procedure TfmConverti.etPolliciChange(Sender: TObject);
var
  val: extended;
begin
  if etPollici.focused then // per evitare cambiamenti a cascata
  begin
    val := Conv * strtofloat( etPollici.Text );
    if kbArrotonda.Checked then
      val := round( val ); // arrotondamento se necessario
    etCentimetri.text := floattostr( val );
  end;
end;

procedure TfmConverti.rgMisureClick(Sender: TObject);
begin
  case rgMisure.ItemIndex of // a seconda dell'item selezionato
    0:begin                  // regolo le label e il fattore di conversione
      Conv := 2.54; // pollici
      lbUnit1.caption := 'Pollici';
      lbUnit2.Caption := 'Centimetri';
      end;
    1:begin
      Conv := 0.30; // piedi
      lbUnit1.caption := 'Piedi';
      lbUnit2.Caption := 'Metri';
      end;
    2:begin
      Conv := 0.9; // iarde
      lbUnit1.caption := 'Iarde';
      lbUnit2.Caption := 'Metri';
      end;
    3:begin
      Conv := 1.5; // miglia
      lbUnit1.caption := 'Miglia';
      lbUnit2.Caption := 'Chilometri';
      end;
    end;
  etPollici.Text := '0';
  etCentimetri.Text := '0';
end;

end.
