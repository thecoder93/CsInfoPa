unit UFmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFmMain = class(TForm)
    EtHallOfFame: TMemo;
    PbRiempi: TButton;
    PbMostra: TButton;
    procedure PbRiempiClick(Sender: TObject);
    procedure PbMostraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmMain: TFmMain;

implementation

{$R *.DFM}

uses
  HallOfFame;

procedure TFmMain.PbRiempiClick(Sender: TObject);
begin
  // Riempio in maniera casuale l'elenco dei
  // punteggi.
  Randomize;
  HallOfFameObj.AddScore(Random(1000000), 'Pippo');
  HallOfFameObj.AddScore(Random(1000000), 'Pluto');
  HallOfFameObj.AddScore(Random(1000000), 'Paperino');
  HallOfFameObj.AddScore(Random(1000000), 'Topolino');
  HallOfFameObj.AddScore(Random(1000000), 'Minnie');
end;

procedure TFmMain.PbMostraClick(Sender: TObject);
var
  g: Integer;
  Score: Integer;
  PlayerName: string;
begin
  EtHallOfFame.Lines.Clear;
  for g := 0 to Pred(HallOfFameObj.ScoreCount) do begin
    HallOfFameObj.GetScore(g, Score, PlayerName);
    EtHallOfFame.Lines.Add(Format('%d punti totalizzati da %s',
      [Score, PlayerName]));
  end;
end;

end.
