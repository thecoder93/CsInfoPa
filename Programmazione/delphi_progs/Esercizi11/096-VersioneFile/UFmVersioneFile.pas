unit UFmVersioneFile;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, FileCtrl;

type
  TFmVersioneFile = class(TForm)
    Label1: TLabel;
    EtCartellaLocale: TEdit;
    BtSfogliaLocale: TButton;
    SgLocale: TStringGrid;
    Label2: TLabel;
    EtCartellaRemota: TEdit;
    BtSfogliaRemota: TButton;
    SgRemota: TStringGrid;
    BtAggiorna: TButton;
    LbElencoFile: TListBox;
    Label3: TLabel;
    procedure BtSfogliaLocaleClick(Sender: TObject);
    procedure BtSfogliaRemotaClick(Sender: TObject);
    procedure EtCartellaLocaleChange(Sender: TObject);
    procedure EtCartellaRemotaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtAggiornaClick(Sender: TObject);
  private
    // Carica Griglia con l'elenco dei file in Cartella.
    procedure CaricaGriglia(Griglia: TStringGrid;
      const Cartella: string);
    // Confronta il contenuto delle due griglie per creare
    // l'elenco dei file da aggiornare.
    procedure ConfrontaGriglie;
    // Aggiorna tutti i file trovati.
    procedure AggiornaTuttiFile;
  public
  end;

var
  FmVersioneFile: TFmVersioneFile;

implementation

{$R *.DFM}

uses
  UVersioneFile;

procedure TFmVersioneFile.FormCreate(Sender: TObject);
begin
  // Per default uso la cartella dell'applicazione.
  EtCartellaLocale.Text := ExtractFilePath(Application.ExeName);
  EtCartellaRemota.Text := EtCartellaLocale.Text;
  // Imposto la larghezza delle colonne.
  SgLocale.ColWidths[0] := 140;
  SgLocale.ColWidths[1] := 108;
  SgLocale.ColWidths[2] := 56;
  SgRemota.ColWidths[0] := SgLocale.ColWidths[0];
  SgRemota.ColWidths[1] := SgLocale.ColWidths[1];
  SgRemota.ColWidths[2] := SgLocale.ColWidths[2];
end;

procedure TFmVersioneFile.BtSfogliaLocaleClick(Sender: TObject);
var
  s: string;
begin
  if SelectDirectory('Scegli la cartella da aggiornare', '', s) then
    EtCartellaLocale.Text := s;
end;

procedure TFmVersioneFile.EtCartellaLocaleChange(Sender: TObject);
begin
  // Ricarico la griglia.
  CaricaGriglia(SgLocale, EtCartellaLocale.Text);
end;

procedure TFmVersioneFile.BtSfogliaRemotaClick(Sender: TObject);
var
  s: string;
begin
  if SelectDirectory('Scegli la cartella di riferimento', '', s) then
    EtCartellaRemota.Text := s;
end;

procedure TFmVersioneFile.EtCartellaRemotaChange(Sender: TObject);
begin
  // Ricarico la griglia.
  CaricaGriglia(SgRemota, EtCartellaRemota.Text);
end;

procedure TFmVersioneFile.CaricaGriglia(Griglia: TStringGrid;
  const Cartella: string);
var
  SR: TSearchRec;
  ListaFile: TStringList;
  i: Integer;
begin
  // Ripulisco la lista dei file da aggiornare.
  LbElencoFile.Clear;
  // Creo la lista con i file della griglia.
  ListaFile := TStringList.Create;
  try
    // Cerco tutti i file eseguibili della cartella.
    if FindFirst(Cartella + '\*.exe',
         faAnyFile, SR) = 0 then begin
      try
        repeat
          // Carico i dati dei file nella griglia, sfruttando
          // la proprietà Objects per memorizzare la data di
          // modifica.
          ListaFile.AddObject(SR.Name, TObject(SR.Time));
        until FindNext(SR) <> 0;
      finally
        FindClose(SR);
      end;
    end;
    // Ordino la lista dei file per nome.
    ListaFile.Sort;
    // Inizializzo la griglia.
    Griglia.Rows[0].Clear;
    Griglia.RowCount := ListaFile.Count;
    // Carico la lista dei nomi di file nella griglia.
    for i := 0 to Pred(ListaFile.Count) do begin
      // Carico nome e data
      Griglia.Cells[0, i] := ListaFile[i];
      Griglia.Cells[1, i] := DateTimeToStr(
        FileDateToDateTime(Integer(ListaFile.Objects[i])));
      // Leggo il numero di versione direttamente dal file.
      Griglia.Cells[2, i] := VersioneFile(Cartella +
        '\' + ListaFile[i]);
    end;
  finally
    ListaFile.Free;
  end;
end;

procedure TFmVersioneFile.BtAggiornaClick(Sender: TObject);
var
  NumeroFile: Integer;
begin
  // Costruisco l'elenco dei file da aggiornare.
  ConfrontaGriglie;
  NumeroFile := LbElencoFile.Items.Count;
  if NumeroFile = 0 then
    ShowMessage('Nessun file da aggiornare.')
  // Chiedo conferma prima di aggiornare i file.
  else if MessageDlg('Sovrascrivo i ' + IntToStr(NumeroFile) +
    ' file trovati?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    AggiornaTuttiFile;
end;

procedure TFmVersioneFile.ConfrontaGriglie;
var
  Prossimo, iLocale, iRemota: Integer;
  NomeFile: string;
begin
  // Ripulisco la lista dei file da aggiornare.
  LbElencoFile.Clear;
  // Prossimo file da trovare
  Prossimo := 0;
  // Scorro la griglia di riferimento.
  for iRemota := 0 to Pred(SgRemota.RowCount) do begin
    NomeFile := SgRemota.Cells[0, iRemota];
    // Scorro la griglia locale a partire dal file successivo
    // all'ultimo trovato.
    for iLocale := Prossimo to Pred(SgLocale.RowCount) do
      // Se i nomi dei file solo uguali e la versione
      // o la data sono precedenti...
      if (SgLocale.Cells[0, iLocale] = NomeFile) then begin
        if VersionePrecedente(SgLocale.Cells[2, iLocale],
             SgRemota.Cells[2, iRemota]) or
           (StrToDateTime(SgLocale.Cells[1, iLocale]) <
            StrToDateTime(SgRemota.Cells[1, iRemota])) then begin
          // ...aggiungo il file alla ListBox.
          LbElencoFile.Items.Add(NomeFile);
          // Altro giro.
          Prossimo := Succ(iRemota);
          Break;
        end;
      end;
  end;
end;

procedure TFmVersioneFile.AggiornaTuttiFile;
var
  i: Integer;
begin
  for i := 0 to Pred(LbElencoFile.Items.Count) do begin
    if not CopyFile(
       PChar(EtCartellaRemota.Text + '\' + LbElencoFile.Items[i]),
       PChar(EtCartellaLocale.Text + '\' + LbElencoFile.Items[i]),
       False) then
      raise Exception.Create('Impossibile sostituire il file ' +
        LbElencoFile.Items[i] + '.');
  end;
  // Aggiorno la griglia dei file locali
  // per riflettere le modifiche.
  CaricaGriglia(SgLocale, EtCartellaLocale.Text);
end;

end.
