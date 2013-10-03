unit UfmMovimenti;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, DBCtrls, Mask, Grids, DBGrids, ExtCtrls, DBCGrids,
  Contnrs, Buttons, Printers;

type
  TfmMovimenti = class(TForm)
    dsRigheMov: TDataSource;
    dsMovimenti: TDataSource;
    Label2: TLabel;
    dbetData: TDBEdit;
    Label3: TLabel;
    dbetMotivo: TDBEdit;
    Label4: TLabel;
    dbetRiferimento: TDBEdit;
    Label5: TLabel;
    dbetNote: TDBMemo;
    DBNavigator1: TDBNavigator;
    dbrgTipo: TDBRadioGroup;
    dsMastrini: TDataSource;
    SbFrame: TScrollBox;
    BtAggiungi: TBitBtn;
    DsPortafogli: TDataSource;
    BtStampa: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtAggiungiClick(Sender: TObject);
    procedure BtStampaClick(Sender: TObject);
  private
    RigheDaSalvare: boolean;
    ListaFrame: TComponentList;
    procedure AggiungiRiga( Nuova: Boolean);
    procedure tbMovimentiBeforePost(DataSet: TDataSet);
    procedure AggiornaRighe;
    procedure EliminaRiga(Sender: TObject);
    procedure RigheEdit(Sender: TObject);
    procedure RicalcolaNumeroRiga;
    procedure SistemaRange(DataSet: TDataSet);
    procedure SalvaRighe( NumeroMovimento: integer );
    procedure tbMovimentiAfterPost(DataSet: TDataSet);
    procedure CalcolaImportoTotale;
    procedure RangeMastrini;
    function NumeroRighe: integer;
    procedure SistemaTipo;
    procedure ControlliCambioRighe;
  public
    procedure StampaMovimenti;
  end;

function CreaCarattere( Cnv: TCanvas; Altezza, Larghezza: integer ): THandle;

var
  fmMovimenti: TfmMovimenti;

implementation

{$R *.DFM}
uses
  UdmDati, UfrRighe;

procedure TfmMovimenti.FormCreate(Sender: TObject);
begin
  Caption := 'Movimenti Contabilità familiare';
  // inizializzo le variabili
  ListaFrame := TComponentList.Create;
  RigheDaSalvare := false;
end;

procedure TfmMovimenti.FormDestroy(Sender: TObject);
begin
  ListaFrame.Free;
end;

procedure TfmMovimenti.FormShow(Sender: TObject);
begin
  // collego i controlli prima e dopo il Post sui Movimenti
  dmDati.tbMovimenti.BeforePost := tbMovimentiBeforePost;
  dmDati.tbMovimenti.AfterPost := tbMovimentiAfterPost;
  // collego i controlli per caricare le righe
  dmDati.tbMovimenti.AfterScroll := SistemaRange;
  dmDati.tbMovimenti.AfterCancel := SistemaRange;
  // carico le righe del primo record
  AggiornaRighe;
end;

procedure TfmMovimenti.tbMovimentiBeforePost(DataSet: TDataSet);
var
  i: integer;
begin
  // controlli da effettuare prima della conferma del movimento
  // deve essere assegnato un tipo...
  if dbrgTipo.ItemIndex < 0 then begin
    MessageBeep(0);
    (dbrgTipo.Components[0] as TWinControl).SetFocus;
    dbrgTipo.ItemIndex := - 1;
    Abort;
    end
  // ...ed un motivo per la spesa
  else if dbetMotivo.Text = '' then begin
    MessageBeep(0);
    dbetMotivo.SetFocus;
    Abort;
    end
  // ci devono essere almeno due righe in un movimento valido
  else if NumeroRighe < 2 then begin
    ShowMessage( 'Inserire almeno due righe per movimento');
    Abort;
    end
  else begin
    for i := 0 to ListaFrame.Count - 1 do
      if TFrRighe( ListaFrame[ i ] ).Visible then
      // non possono esserci mastrini vuoti nelle righe
        if TFrRighe( ListaFrame[ i ] ).EtMastrini.Text = '' then begin
          MessageBeep(0);
          TFrRighe( ListaFrame[ i ] ).EtMastrini.SetFocus;
          Abort;
        end;
  end;
end;

function TfmMovimenti.NumeroRighe: integer;
var
  i: integer;
begin
  // conto le righe visibili
  result := 0;
  for i := 0 to ListaFrame.Count - 1 do
    if TfrRighe( ListaFrame[ i ] ).Visible then
      Inc( Result );
end;

procedure TfmMovimenti.tbMovimentiAfterPost(DataSet: TDataSet);
begin
// dopo aver salvato il movimento controllo se devo salvare anche le righe
// salvo le righe solo se sono intervenuti cambiamenti
  if RigheDaSalvare then
    SalvaRighe( dmDati.tbMovimentiID_Movimento.AsInteger );
end;

procedure TfmMovimenti.SalvaRighe( NumeroMovimento: integer );
var
  i: integer;
  fm: TFrRighe;
begin
// procedura per salvare tutte le righe visibili
// prima cancello i record relativi dalla tabella
  while not dmDati.tbRigheMov.IsEmpty do
    dmDati.tbRigheMov.Delete;
// per evitare sovrapposizioni
  RigheDaSalvare := False;
// salvo le righe una alla volta leggendole dai frame visibili
  for i := 0 to ListaFrame.Count - 1 do
    if TfrRighe( ListaFrame[ i ] ).Visible then
      with dmDati do begin
        tbRigheMov.Insert;
        tbRigheMovID_Movimento.Value := NumeroMovimento;
        fm := TfrRighe( ListaFrame[ i ] );
        tbRigheMovID_Riga.AsString := fm.LbProg.Caption;
        tbRigheMovID_Mastrino.Value := fm.EtMastrini.KeyValue;
        tbRigheMovImporto.AsString := fm.EtImporto.Text;
        tbRigheMov.Post;
      end;
end;

procedure TfmMovimenti.SistemaRange(DataSet: TDataSet);
begin
// carico le righe nuove
  if not DataSet.ControlsDisabled then
    AggiornaRighe;
end;

procedure TfmMovimenti.AggiornaRighe;
begin
  // elimino i vecchi frame
  ListaFrame.Clear;
  // per ogni record della tabella creo una riga
  dmDati.tbRigheMov.First;
  while not dmDati.tbRigheMov.Eof do begin
    AggiungiRiga( False );
    dmDati.tbRigheMov.Next;
  end;
  // imposto le righe come salvate
  RigheDaSalvare := False;
  SistemaTipo;
end;

procedure TfmMovimenti.SistemaTipo;
begin
  // posso cambiare il tipo solo se non ci sono righe
  dbrgTipo.ReadOnly := NumeroRighe > 1;
end;

procedure TfmMovimenti.AggiungiRiga( Nuova: boolean );
var
  fm: TFrRighe;
begin
// limito la scelta ai mastrini del tipo corretto
  RangeMastrini;
// creo un nuovo frame
  fm := TFrRighe.Create( nil );
// lo aggiungo alla lista e lo posiziono nello ScrollBox
  ListaFrame.Add( fm );
  fm.Parent :=  sbFrame;
  fm.Align := alTop;
  fm.Top := ListaFrame.Count * fm.Height;
  // scrivo il numero della riga
  fm.LbProg.Caption := IntToStr( ListaFrame.Count );
  with fm.EtImporto do begin
   // carico il valore adatto nel Text
    if Nuova then
      Text := '0'
    else
      Text := dmDati.tbRigheMovImporto.AsString;
  // l'importo della prima riga deve essere Read-Only
    if ListaFrame.Count = 1 then begin
      ParentColor := true;
      ReadOnly := true;
      end
    else
    // altrimenti collego il gestore per le modifiche
    // dei campi delle righe
      OnChange := RigheEdit;
  end;
  with fm.EtMastrini do begin
  // collego la sorgente di lookup corretta
    if ListaFrame.Count = 1 then
      ListSource := dsPortafogli
    else
      ListSource := dsMastrini;
    ListField := 'Descrizione';
    KeyField := 'ID_Mastrino';
    KeyValue := dmDati.tbRigheMovID_Mastrino.Value;
  // se appena creata ci posiziono il focus
    if Nuova then
      SetFocus;
  // collego l'evento per le modifiche dei campi delle righe
    OnClick := RigheEdit;
  end;
  // collego i bottoni al metodo EliminaRiga, tranne il primo
  // (si possono eliminare tutte le righe tranne la prima)
  if ListaFrame.Count = 1 then
    fm.BtMeno.Visible := False
  else
    fm.BtMeno.OnClick := EliminaRiga;
end;

procedure TfmMovimenti.RangeMastrini;
begin
  // a seconda del movimento seleziono
  // solo i mastrini di un determinato tipo
  with dmDati do begin
    if tbMovimentiTipo.AsString = 'S' then
      tbMastrini.SetRange( ['S'], ['S'] )
    else if tbMovimentiTipo.AsString = 'R' then
      tbMastrini.SetRange( ['R'], ['R'] )
    else if tbMovimentiTipo.AsString = 'T' then
      tbMastrini.SetRange( ['P'], ['P'] );
    end;
end;

procedure TfmMovimenti.EliminaRiga(Sender: TObject);
begin
  // per eliminare una riga ci limitiamo a farla diventare invisibile
  if (Sender is TComponent) and (TComponent(Sender).Owner is TFrRighe) then
    TFrRighe( TComponent( Sender ).Owner ).Visible := false
  else // se non riconosciamo il Sender eliminiamo l'ultima
    TFrRighe( ListaFrame.Count - 1 ).Visible := false;
  ControlliCambioRighe;
end;

procedure TfmMovimenti.ControlliCambioRighe;
begin
// controlli da fare ogni volta che aggiungiamo
// o togliamo righe
// risistemiamo i numeri riga
  RicalcolaNumeroRiga;
// sistemiamo il tipo
  SistemaTipo;
// e facciamo i controlli dell'edit delle righe
  RigheEdit( self );
end;

procedure TfmMovimenti.RicalcolaNumeroRiga;
var
  i, Num: integer;
begin
  Num := 0;
  // per ogni riga visibile mostro un numero progressivo nella Label
  for i := 0 to ListaFrame.Count - 1 do
    if TfrRighe( ListaFrame[ i ] ).Visible then begin
      Inc( Num );
      TfrRighe( ListaFrame[ i ] ).LbProg.Caption := IntToStr( Num );
    end;
end;

procedure TfmMovimenti.RigheEdit(Sender: TObject);
begin
// ogni volta che viene modificato un campo delle righe
// le imposto come "da salvare" e ricalcolo l'importo
  RigheDaSalvare := True;
  CalcolaImportoTotale;
// portiamo il dataset dei Movimenti in modalità Edit
  if not( dsMovimenti.State in [dsEdit, dsInsert] ) then begin
    dsMovimenti.Edit;
  // forziamo un cambiamento nel record corrente
  // per essere sicuri che vengano chiamati gli eventi
  // del Post in modo da poter salvare le righe
    dbetData.Field.Value := dbetData.Field.Value;
  end;
end;

procedure TfmMovimenti.CalcolaImportoTotale;
var
  tot: Currency;
  i: integer;
begin
// procedura per ricalcolare l'importo della prima riga
// solo se ci sono almeno due righe
  if ListaFrame.Count > 1 then begin
    tot := 0;
    // per ogni riga del movimento corrente sommo l'importo...
    for i := 1 to ListaFrame.Count - 1 do
    // solo se visibile
      if TFrRighe( ListaFrame[ i ] ).Visible then
        tot := tot + StrToCurr(TFrRighe(ListaFrame[ i ]).EtImporto.Text);
    // ...e lo riporto (eventualmente cambiato di segno)
    // nella prima riga
    if dbrgTipo.ItemIndex <> 1 then
        tot := -tot;
    TFrRighe( ListaFrame[ 0 ] ).EtImporto.Text := CurrToStr( tot );
  end;
end;

procedure TfmMovimenti.BtAggiungiClick(Sender: TObject);
begin
// controllo che sia stato scelto il tipo movimento
  if dbrgTipo.ItemIndex < 0 then
    ShowMessage( 'Occorre scegliere prima il tipo' )
  else begin // aggiungio una nuova riga
    AggiungiRiga( True );
// sistemo le righe
  ControlliCambioRighe;
  end;
end;

procedure TfmMovimenti.BtStampaClick(Sender: TObject);
var
  nomei: string;
  curmov: TBookmarkStr;
begin
  with dmDati do try
  // memorizzo la posizione di partenza
    curmov := tbMovimenti.Bookmark;
  // disabilito i controlli
    tbMovimenti.DisableControls;
    try
      tbRigheMov.DisableControls;
      try
        tbMastrini.DisableControls;
        try
        // uso l'indice primario dei mastrini
          nomei := tbMastrini.IndexName;
          tbMastrini.IndexName := '';
          try
          // stampo tutto
            StampaMovimenti;
          finally
          // ripristino l'indice precedente
            tbMastrini.IndexName := nomei;
          end;
        finally
        // riattivo i controlli
          tbMastrini.EnableControls;
        end;
      finally
        tbRigheMov.EnableControls;
      end;
    finally
      tbMovimenti.EnableControls;
    end;
  finally
  // mi riporto alla posizione precedente
    dmDati.tbMovimenti.Bookmark := curmov;
  end;
end;

procedure TfmMovimenti.StampaMovimenti;
var
  FileStampa: TextFile;
  riga: string;
  i : integer;
  sl : TStringList;
begin
// creo una StringList temporanea per le note
  sl := TStringList.Create;
  try
  // uso AssignPrn per stampare come su un file di testo
    AssignPrn(FileStampa);
  // preparo la stampa
    Rewrite(FileStampa);
  // uso un font non proporzionale
    Printer.Canvas.Font.Name := 'Courier New';
  // ricavo il nuovo font per 133 colonne e 60 righe
    Printer.Canvas.Font.Handle := CreaCarattere( Printer.Canvas,
       Printer.PageHeight div 60, Printer.PageWidth div 133 );
    with dmDati do try
    // stampo titolo e data
      riga := 'STAMPA MOVIMENTI - ' + DateToStr( Now );
      Writeln(FileStampa, riga);
    // scandisco tutti i movimenti dal primo
      tbMovimenti.First;
      while not tbMovimenti.Eof do begin
      // stampo una riga di separazione
        riga := StringOfChar('-', 133);
        Writeln(FileStampa, riga);
      // preparo i dati della testata del movimento
        riga := FormatFloat('00000',
                tbMovimentiID_Movimento.AsInteger);
        riga := riga + ' ' + tbMovimentiData.AsString;
        riga := riga + ' ' + tbMovimentiTipo.AsString;
        riga := riga + ' ' + Format('%-30s',
                [tbMovimentiMotivo.AsString]);
        riga := riga + '  ' + tbMovimentiRiferimento.AsString;
      // stampo la testata del movimento
        Writeln(FileStampa, riga);
      // stampo le note del movimento
        sl.Text := WrapText(tbMovimentiNote.AsString, 30);
        for i := 0 to sl.Count - 1 do
          Writeln(FileStampa, StringOfChar(' ', 50) + sl[i]);

      // seleziono le righe del movimento corrente
        tbRigheMov.SetRange([ tbMovimentiID_Movimento],
              [tbMovimentiID_Movimento]);
      // scorro le righe di ogni movimento
        tbRigheMov.First;
        while not dmDati.tbRigheMov.Eof do begin
        // sincronizzo i Mastini alla riga corrente
          if not tbMastrini.FindKey(
                [tbRigheMovID_Mastrino.AsInteger]) then
            raise Exception.Create('Mastrino non trovato!');
        // preparo i dati della riga del movimento
          riga := StringOfChar(' ', 80);
          riga := riga + ' ' + tbMastriniTipo.AsString;
          riga := riga + ' ' + Format('%30s',
               [tbMastriniDescrizione.AsString]);
          riga := riga + ' ' + Format( '%19.2n',
               [tbRigheMovImporto.AsCurrency]);

        // stampo la riga del movimento
          Writeln(FileStampa, riga);
        // passo alla riga successiva
          tbRigheMov.Next;
        end;
      // passo al movimento successivo
        tbMovimenti.Next;
      end;
    // stampo riga finale
      riga := StringOfChar('-', 133);
      Writeln(FileStampa, riga);
    finally
    // chiudo la stampa
      System.CloseFile(FileStampa);
    end;
  finally
  // distruggo la StringList
    sl.Free;
  end;
end;

function CreaCarattere( Cnv: TCanvas; Altezza,
    Larghezza: integer ): THandle;
begin
// creo un nuovo font con le caratteristiche di quello
// del Canvas Cnv ma con determinate larghezza e altezza.
// Funziona solo con i font TrueType.
  result:= CreateFont( Altezza, Larghezza, 0, 0, 0, 0, 0, 0,
       0, 0, 0, 0, 0, Pchar(Cnv.Font.Name) );
end;

end.
