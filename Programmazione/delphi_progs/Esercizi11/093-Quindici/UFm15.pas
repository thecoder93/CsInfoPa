unit UFm15;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, ExtCtrls;

type
  TFm15 = class(TForm)
    SgGame: TStringGrid;
    PbNewGame: TButton;
    Label1: TLabel;
    StElapsedTime: TLabel;
    TmGame: TTimer;
    procedure PbNewGameClick(Sender: TObject);
    procedure TmGameTimer(Sender: TObject);
    procedure SgGameClick(Sender: TObject);
    procedure SgGameDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    FInitialTime: TDateTime;
    procedure SwapCells(AColSrc, ARowSrc, AColDest, ARowDest: Integer);
    procedure NewGame;
    procedure FillGrid;
    procedure ShuffleGrid;
    function GameCompleted: Boolean;
    procedure EndGame;
  public
  end;

var
  Fm15: TFm15;

implementation

{$R *.DFM}

procedure TFm15.SwapCells(AColSrc, ARowSrc, AColDest, ARowDest: Integer);
var
  TempStr: string;
begin
  TempStr := SgGame.Cells[AColSrc, ARowSrc];
  SgGame.Cells[AColSrc, ARowSrc] :=
    SgGame.Cells[AColDest, ARowDest];
  SgGame.Cells[AColDest, ARowDest] := TempStr;
end;

procedure TFm15.FormCreate(Sender: TObject);
begin
  FillGrid;
end;

procedure TFm15.FillGrid;
var
  g: Integer;
begin
  // Riempio la griglia con i numeri da 1 a 15,
  // lasciando vuota la cella in basso a destra.
  for g := 0 to Pred(15) do
    SgGame.Cells[g mod 4, g div 4] := IntToStr(g + 1);
  SgGame.Cells[3, 3] := '';
end;

procedure TFm15.PbNewGameClick(Sender: TObject);
begin
  NewGame;
end;

procedure TFm15.NewGame;
begin
  FInitialTime := Now;
  TmGame.Enabled := True;
  ShuffleGrid;
end;

procedure TFm15.TmGameTimer(Sender: TObject);
begin
  StElapsedTime.Caption := FormatDateTime('nn:ss', Now - FInitialTime);
end;

procedure TFm15.SgGameClick(Sender: TObject);
var
  ACol, ARow: Integer;

  procedure Move(ACol, ARow: Integer);
  var
    DestCell: TGridCoord;

    function CanMove(ACol, ARow: Integer): TGridCoord;
    var
      X, Y: Integer;
    begin
      Result.X := -1;
      Result.Y := -1;
      // Controllo la colonna.
      for Y := ARow - 1 to ARow + 1 do begin
        if (Y >= 0) and (Y < SgGame.RowCount) and
           (SgGame.Cells[ACol, Y] = '') then begin
          Result.X := ACol;
          Result.Y := Y;
          Exit;
        end;
      end;
      // Controllo la riga.
      for X := ACol - 1 to ACol + 1 do begin
        if (X >= 0) and (X < SgGame.ColCount) and
           (SgGame.Cells[X, ARow] = '') then begin
          Result.X := X;
          Result.Y := ARow;
          Exit;
        end;
      end;
    end;

  begin
    DestCell := CanMove(ACol, ARow);
    if (DestCell.X <> -1) and (DestCell.Y <> -1) then
      SwapCells(ACol, ARow, DestCell.X, DestCell.Y);
  end;

begin
  if TmGame.Enabled then begin
    Move(SgGame.Selection.TopLeft.X, SgGame.Selection.TopLeft.Y);
    if GameCompleted then
      EndGame;
  end;
end;

procedure TFm15.ShuffleGrid;
var
  g: Integer;
begin
  // Mescolo la griglia scambiando 1000 volte
  // coppie di celle a caso.
  Randomize;
  for g := 0 to 999 do begin
    SwapCells(Random(SgGame.ColCount), Random(SgGame.RowCount),
      Random(SgGame.ColCount), Random(SgGame.RowCount));
    // Mostro l'effetto del rimescolamento man mano che procede.
    Update;
  end;
end;

function TFm15.GameCompleted: Boolean;
var
  g: Integer;
begin
  // Verifico che la griglia contenga, in ordine, i numeri
  // da 1 a 15, con la cella in basso a destra vuota.
  Result := True;
  for g := 0 to Pred(15) do
    if SgGame.Cells[g mod 4, g div 4] <> IntToStr(g + 1) then
      Result := False;
  if SgGame.Cells[3, 3] <> '' then
    Result := False;
end;

procedure TFm15.EndGame;
begin
  // Concludo il gioco (disattivando il timer)
  // e mostro il punteggio.
  TmGame.Enabled := False;
  ShowMessage(Format('Gioco completato. Tempo trascorso: %s',
    [StElapsedTime.Caption]));
end;

procedure TFm15.SgGameDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  CurrentString: string;
begin
  // Coloro di blu scuro la cella vuota,
  // di blu chiaro le altre.
  CurrentString := SgGame.Cells[ACol, ARow];
  with SgGame.Canvas do begin
    Font := SgGame.Font;
    if CurrentString = '' then
      Brush.Color := clNavy
    else
      Brush.Color := SgGame.Color;
    // Disegno il numero centrandolo all'interno della cella.
    FillRect(Rect);
    DrawText(Handle, PChar(SgGame.Cells[ACol, ARow]),
      -1, Rect, DT_CENTER + DT_VCENTER);
  end;
end;

end.
