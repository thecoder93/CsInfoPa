unit LDUnitCounter;

interface

// Non serve esportare nulla da questa unit, se non la procedura Register.

procedure Register;

implementation

uses
  Windows, SysUtils, Classes, ToolsAPI, Dialogs;

type
  // Derivo da TNotifierObject perché implementa convenientemente
  // alcune interfacce che a me non interessano.
  // Aggiungo che sono uno IOTAWizard, e precisamente uno IOTAMenuWizard.
  TLDUnitCounter = class(TNotifierObject, IOTAWizard, IOTAMenuWizard)
  private
    // Restituisce un riferimento all'interfaccia del
    // progetto correntemente aperto nell'IDE, oppure nil.
    function ProgettoCorrente: IOTAProject;
  protected
    // Metodi di IOTAWizard.
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
    // metodo di IOTAMenuWizard.
    function GetMenuText: string;
  public
  end;

var
  // Un riferimento al Wizard registrato, serve per poterlo rimuovere.
  IndiceWizard: Integer;

procedure Register;
begin
  // Registro un'istanza del mio Wizard.
  IndiceWizard :=
    (BorlandIDEServices as IOTAWizardServices).AddWizard(
      TLDUnitCounter.Create);
end;

{ TLDUnitCounter }

function TLDUnitCounter.GetIDString: string;
begin
  // Un identificativo univoco.
  Result := 'LabDelphi.UnitCounter';
end;

function TLDUnitCounter.GetMenuText: string;
begin
  // Testo della voce aggiunta al menu Help.
  Result := 'Conta unit e form...';
end;

function TLDUnitCounter.GetName: string;
begin
  // Nome descrittivo mostrato nella lista Design Packages
  // sotto Component/Install Packages.
  Result := 'LabDelphi UnitCounter';
end;

function TLDUnitCounter.GetState: TWizardState;
begin
  // La voce di menu è attiva solo se esiste un progetto corrente.
  Result := [];
  if ProgettoCorrente <> nil then
    Include(Result, wsEnabled);
end;

function TLDUnitCounter.ProgettoCorrente: IOTAProject;
var
  g: Integer;
  PG: IOTAProjectGroup;
begin
  Result := nil;
  // Se almeno uno dei moduli aperti implementa l'interfaccia
  // IOTAProjectGroup, allora ottengo l'interfaccia al progetto
  // corrente del gruppo e la restituisco.
  with BorlandIDEServices as IOTAModuleServices do
    for g := 0 to Pred(ModuleCount) do
      if Modules[g].QueryInterface(IOTAProjectGroup, PG) = S_OK then begin
        Result := PG.ActiveProject;
        Break;
      end;
end;

// Metodo principale: conta unit e form e mostra i totali
// in una finestra di dialogo.
procedure TLDUnitCounter.Execute;
var
  P: IOTAProject;
  g: Integer;
  NrUnit, NrForm: Integer;
  MI: IOTAModuleInfo;
begin
  NrUnit := 0;
  NrForm := 0;
  P := ProgettoCorrente;
  if P <> nil then begin
    // Scorro i moduli del progetto, ottenendo per ciascuno
    // un'interfaccia IOTAModuleInfo.
    for g := 0 to Pred(P.GetModuleCount) do begin
      MI := P.GetModule(g);
      // Se è un file pas, è una unit...
      if SameText(ExtractFileExt(MI.GetFileName), '.pas') then
        Inc(NrUnit);
      // ...se ha un FormName, è anche una form.
      if MI.GetFormName <> '' then
        Inc(NrForm);
    end;
    // Mostro i totali.
    ShowMessage(Format('Ci sono %d unit e %d form nel progetto %s.',
      [NrUnit, NrForm, ExtractFileName(P.GetFileName)]));
  end
  else
    // Se non c'è un progetto corrente, non ho nulla da contare.
    ShowMessage('Nessun progetto corrente.');
end;

initialization

finalization
  // Rimuovo l'istanza registrata nella procedura Register.
  // Non è necessario distruggere l'oggetto (a cui peraltro non
  // possiedo alcun riferimento!) perché è gestito dal reference
  // counting.
  (BorlandIDEServices as IOTAWizardServices).RemoveWizard(IndiceWizard);

end.
