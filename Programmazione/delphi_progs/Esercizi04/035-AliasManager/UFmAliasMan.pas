unit UFmAliasMan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFmAliasMan = class(TForm)
    EtNomeFile: TEdit;
    Label1: TLabel;
    BtSfoglia: TButton;
    BtVai: TButton;
    OdNomeFile: TOpenDialog;
    procedure BtSfogliaClick(Sender: TObject);
    procedure BtVaiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmAliasMan: TFmAliasMan;

implementation

{$R *.DFM}

uses
  IniFiles, DBTables;

// Restituisce true se l'Alias indicato esiste,
// False in caso contrario.
function AliasEsistente(Nome: string): Boolean;
var
  AliasInSessione: TStrings;
begin
  AliasInSessione := TStringList.Create;
  try
    // Leggo l'elenco degli Alias della sessione...
    Session.GetAliasNames(AliasInSessione);
    // ... per stabilire se quello che cerco esiste già.
    Result := AliasInSessione.IndexOf(Nome) <> -1;
  finally
    AliasInSessione.Free;
  end;
end;

procedure AliasManager(NomeFile: string);
var
  ElencoAlias, ParametriAlias: TStrings;
  g: Integer;
begin
  with TIniFile.Create(NomeFile) do begin
    try
      ElencoAlias := TStringList.Create;
      try
        // Leggo l'elenco degli Alias da trattare.
        ReadSections(ElencoAlias);
        // Per ciascun nome indicato...
        for g := 0 to Pred(ElencoAlias.Count) do begin
          ParametriAlias := TStringList.Create;
          try
            // ...leggo i parametri da impostare...
            ReadSectionValues(ElencoAlias[g], ParametriAlias);
            if AliasEsistente(ElencoAlias[g]) then
              // ...e li modifico...
              Session.ModifyAlias(ElencoAlias[g], ParametriAlias)
            else
              // ...oppure creo un nuovo Alias.
              Session.AddAlias(ElencoAlias[g],
                ParametriAlias.Values['Type'],
                ParametriAlias);
          finally
            ParametriAlias.Free;
          end;
        end;
      finally
        ElencoAlias.Free;
      end;
    finally
      Free;
    end;
  end;
  // Salvo le modifiche.
  Session.SaveConfigFile;
end;

procedure TFmAliasMan.BtSfogliaClick(Sender: TObject);
begin
  if OdNomeFile.Execute then
    EtNomeFile.Text := OdNomeFile.FileName;
end;

procedure TFmAliasMan.BtVaiClick(Sender: TObject);
begin
  if EtNomeFile.Text <> '' then
    AliasManager(EtNomeFile.Text);
end;

end.
