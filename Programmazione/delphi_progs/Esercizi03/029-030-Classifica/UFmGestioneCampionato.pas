unit UFmGestioneCampionato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls;

type
  TFmGestioneCampionato = class(TForm)
    GbClassifica: TGroupBox;
    EtElencoSquadre: TMemo;
    Label1: TLabel;
    BtCreaClassifica: TButton;
    GbTurno: TGroupBox;
    SgTurno: TStringGrid;
    Label3: TLabel;
    BtCreaTurno: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtCreaClassificaClick(Sender: TObject);
    procedure BtCreaTurnoClick(Sender: TObject);
  private
    { Private declarations }
    function ScegliNomeFile(var NomeFile: string): Boolean;
  public
    { Public declarations }
  end;

var
  FmGestioneCampionato: TFmGestioneCampionato;

implementation

{$R *.DFM}

uses
  ClassificaUtils;

procedure TFmGestioneCampionato.FormCreate(Sender: TObject);

  procedure AggiungiRisultato(Riga: Integer; SquadraInCasa,
    SquadraInTrasferta: string; PuntInCasa, PuntInTrasferta: Cardinal);
  begin
    SgTurno.Cells[0, Riga] := SquadraInCasa;
    SgTurno.Cells[1, Riga] := SquadraInTrasferta;
    SgTurno.Cells[2, Riga] := IntToStr(PuntInCasa);
    SgTurno.Cells[3, Riga] := IntToStr(PuntInTrasferta);
  end;

begin
  // Imposto la StringGrid
  SgTurno.RowCount := NUMERO_INCONTRI + 1;
  SgTurno.Cells[0, 0] := 'Squadra in casa';
  SgTurno.ColWidths[0] := 140;
  SgTurno.Cells[1, 0] := 'Squadra in trasferta';
  SgTurno.ColWidths[1] := 140;
  SgTurno.Cells[2, 0] := 'Punt.';
  SgTurno.ColWidths[2] := 30;
  SgTurno.Cells[3, 0] := 'Punt.';
  SgTurno.ColWidths[3] := 30;
  // Predispongo dei dati di esempio.
  EtElencoSquadre.Lines.Add('Atalanta');
  EtElencoSquadre.Lines.Add('Bari');
  EtElencoSquadre.Lines.Add('Bologna');
  EtElencoSquadre.Lines.Add('Brescia');
  EtElencoSquadre.Lines.Add('Fiorentina');
  EtElencoSquadre.Lines.Add('Inter');
  EtElencoSquadre.Lines.Add('Juventus');
  EtElencoSquadre.Lines.Add('Lazio');
  EtElencoSquadre.Lines.Add('Lecce');
  EtElencoSquadre.Lines.Add('Milan');
  EtElencoSquadre.Lines.Add('Napoli');
  EtElencoSquadre.Lines.Add('Parma');
  EtElencoSquadre.Lines.Add('Perugia');
  EtElencoSquadre.Lines.Add('Reggina');
  EtElencoSquadre.Lines.Add('Roma');
  EtElencoSquadre.Lines.Add('Udinese');
  EtElencoSquadre.Lines.Add('Verona');
  EtElencoSquadre.Lines.Add('Vicenza');
  AggiungiRisultato(1, 'Atalanta', 'Lazio', 1, 3);
  AggiungiRisultato(2, 'Bari', 'Verona', 1, 0);
  AggiungiRisultato(3, 'Milan', 'Vicenza', 3, 2);
  AggiungiRisultato(4, 'Napoli', 'Juventus', 1, 2);
  AggiungiRisultato(5, 'Parma', 'Fiorentina', 2, 2);
  AggiungiRisultato(6, 'Perugia', 'Lecce', 0, 3);
  AggiungiRisultato(7, 'Reggina', 'Inter', 1, 4);
  AggiungiRisultato(8, 'Roma', 'Bologna', 1, 0);
  AggiungiRisultato(9, 'Udinese', 'Brescia', 1, 1);
end;

function TFmGestioneCampionato.ScegliNomeFile(var NomeFile: string): Boolean;
begin
  with TSaveDialog.Create(nil) do begin
    try
      Options := Options + [ofPathMustExist];
      Result := Execute;
      if Result then
        NomeFile := FileName;
    finally
      Free;
    end;
  end;
end;

procedure TFmGestioneCampionato.BtCreaClassificaClick(Sender: TObject);
var
  NomeFile: string;
begin
  if EtElencoSquadre.Lines.Count > NUMERO_SQUADRE then
    raise Exception.Create('Troppe squadre.');
  if ScegliNomeFile(NomeFile) then begin
    CreaNuovaClassifica(NomeFile, EtElencoSquadre.Lines);
    ShowMessage('Classifica creata.');
  end;
end;

procedure TFmGestioneCampionato.BtCreaTurnoClick(Sender: TObject);
var
  ArrayIncontri: TMemTurno;
  g: TIndiceTurno;
  NomeFile: string;
begin
  if ScegliNomeFile(NomeFile) then begin
    FillChar(ArrayIncontri, SizeOf(ArrayIncontri), #0);
    for g := Low(ArrayIncontri) to High(ArrayIncontri) do begin
      ArrayIncontri[g].NomeSquadraInCasa :=
        SgTurno.Cells[0, g];
      ArrayIncontri[g].NomeSquadraInTrasferta :=
        SgTurno.Cells[1, g];
      ArrayIncontri[g].PunteggioSquadraInCasa :=
        StrToInt(SgTurno.Cells[2, g]);
      ArrayIncontri[g].PunteggioSquadraInTrasferta :=
        StrToInt(SgTurno.Cells[3, g]);
    end;
    ScriviTurno(NomeFile, ArrayIncontri);
    ShowMessage('Turno creato.');
  end;
end;

end.
