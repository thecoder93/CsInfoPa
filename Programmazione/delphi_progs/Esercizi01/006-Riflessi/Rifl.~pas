unit Rifl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfmRiflessi = class(TForm)
    pnCampo: TPanel;
    pnComandi: TPanel;
    btInizia: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    lbPunteggio: TLabel;
    lbTempo: TLabel;
    shCerchio: TShape;
    tmCrono: TTimer;
    procedure btIniziaClick(Sender: TObject);
    procedure tmCronoTimer(Sender: TObject);
    procedure shCerchioMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
  private
    procedure IniziaGioco;
    procedure FineGioco;
    procedure SpostaCerchio;
  public
  end;

var
  fmRiflessi: TfmRiflessi;

implementation

{$R *.DFM}

procedure TfmRiflessi.IniziaGioco;
begin
  Randomize; // per avere un posizionamento casuale
  btInizia.Enabled := false; // disabilita il bottone
  lbPunteggio.Caption := '0';
  lbTempo.caption := '20';
  tmCrono.Enabled := true; // abilita il timer per il gioco
  SpostaCerchio; // sposta il cerchio a caso...
  shCerchio.Visible := true; // ...e lo rende visibile
end;

procedure TfmRiflessi.SpostaCerchio;
begin
  // sposta a caso il cerchio usando il range x e y del pannello
  shCerchio.Top := random( pnCampo.Height - shCerchio.Height );
  shCerchio.Left := random( pnCampo.Width - shCerchio.Width );
end;

procedure TfmRiflessi.FineGioco;
begin
  shCerchio.Visible := false; // nasconde il cerchio
  btInizia.Enabled := true; // abilita il bottone
  tmCrono.Enabled := false; // disabilita il timer
end;

procedure TfmRiflessi.tmCronoTimer(Sender: TObject);
begin
  if lbTempo.caption = '0' then // se è finito il tempo
    FineGioco
  else // altrimenti diminuisce il tempo
    lbTempo.caption := inttostr( strtoint( lbTempo.caption ) - 1 );
end;

procedure TfmRiflessi.shCerchioMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // gestisco OnMouseUp (e non OnMouseDown) perché più simile a OnClick
  if Button = mbLeft then begin
    // prendo in considerazione solo il tasto sinistro.
    lbPunteggio.Caption := inttostr( strtoint( lbPunteggio.caption ) + 1 );
    SpostaCerchio;
  end;
end;

procedure TfmRiflessi.FormCreate(Sender: TObject);
begin
  FineGioco; // reset (come a partita finita)
  Caption := 'Un gioco di riflessi';
end;

procedure TfmRiflessi.btIniziaClick(Sender: TObject);
begin
  IniziaGioco;
end;

end.
