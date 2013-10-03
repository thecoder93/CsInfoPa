unit ID3ContextMenu;

interface

uses
  Windows, ActiveX, Classes, ComObj, ShlObj, ShellAPI;

type
  // Object Factory usata per l'aggiornamento del Registry.
  TID3ContextMenuFactory = class(TComObjectFactory)
  public
    procedure UpdateRegistry(Register: Boolean); override;
  end;

type
  // Estensione della Shell.
  TID3ContextMenu = class(TComObject, IShellExtInit, IContextMenu)
  private
    FNomeFile: array[0..MAX_PATH] of Char;
    FIndiceVoceMenu: Cardinal;
  protected
    {Declare IShellExtInit methods here}
    function IShellExtInit.Initialize = InitShellExt;
    function InitShellExt(pidlFolder: PItemIDList; lpdobj: IDataObject;
      hKeyProgID: HKEY): HResult; stdcall;
    {Declare IContextMenu methods here}
    function QueryContextMenu(Menu: HMENU;
      indexMenu, idCmdFirst, idCmdLast, uFlags: UINT): HResult; stdcall;
    function GetCommandString(idCmd, uType: UINT; pwReserved: PUINT;
      pszName: LPSTR; cchMax: UINT): HResult; stdcall;
    function InvokeCommand(var lpici: TCMInvokeCommandInfo): HResult;
      stdcall;
  end;

const
  Class_TID3ContextMenu: TGUID = '{3EC5D2E5-8673-11D4-BD43-0010A4D09D3B}';

implementation

uses
  SysUtils, ComServ, UFmID3Info, ID3Tag, Registry;

{ TID3ContextMenu }

function TID3ContextMenu.InitShellExt(pidlFolder: PItemIDList;
  lpdobj: IDataObject; hKeyProgID: HKEY): HResult;
var
  FE: TFormatEtc;
  SM: TStgMedium;
begin
  // Questa funzione inizializza l'oggetto fornendo tra l'altro
  // il nome del file associato.
  try
    if Assigned(lpdobj) then begin
      // Preparo la struttura da passare a lpdobj.GetData.
      FE.cfFormat := CF_HDROP;
      FE.ptd := nil;
      FE.dwAspect := DVASPECT_CONTENT;
      FE.lindex := -1;
      FE.tymed := TYMED_HGLOBAL;
      // Leggo i dati puntati da lpdobj.
      Result := lpdobj.GetData(FE, SM);
      if not Failed(Result) then begin
        // Se non ci sono errori, recupero il nome del primo file.
        try
          // Supporto solo un file alla volta.
          if DragQueryFile(SM.hGlobal, $FFFFFFFF, nil, 0) = 1 then begin
            DragQueryFile(SM.hGlobal, 0, FNomeFile, SizeOf(FNomeFile));
            // Mostro la voce di menu solo per i file che
            // contengono un tag ID3.
            if ID3Presente(FNomeFile) then
              Result := NOERROR
            else
              Result := E_FAIL;
          end
          else
            Result := E_FAIL;
        finally
          ReleaseStgMedium(SM);
        end;
      end;
    end
    else
      Result := E_FAIL;
  except
    // Non posso in nessun caso lasciar trapelare eccezioni.
    Result := E_UNEXPECTED;
  end;
end;

function TID3ContextMenu.QueryContextMenu(Menu: HMENU; indexMenu,
  idCmdFirst, idCmdLast, uFlags: UINT): HResult;
begin
  // Inserisco la mia voce di menu nella giusta posizione...
  FIndiceVoceMenu := indexMenu;
  InsertMenu(Menu, FIndiceVoceMenu, MF_STRING or MF_BYPOSITION,
    idCmdFirst, 'Informazioni ID3...');
  // ...e restituisco la posizione incrementata di 1 per
  // consentire il caricamento in catena delle estensioni.
  Result := Succ(FIndiceVoceMenu);
end;

function TID3ContextMenu.GetCommandString(idCmd, uType: UINT;
  pwReserved: PUINT; pszName: LPSTR; cchMax: UINT): HResult;
begin
  Result := S_OK;
  try
    // Stringa di aiuto che la Shell mostrerà nella barra di stato.
    if (idCmd = FIndiceVoceMenu) and
       ((uType and GCS_HELPTEXT) <> 0) then
      StrLCopy(pszName, 'Visualizza le informazioni ID3 ' +
        'contenute nel file.', cchMax)
    else
      Result := E_INVALIDARG;
  except
    // Non posso in nessun caso lasciar trapelare eccezioni.
    Result := E_UNEXPECTED;
  end;
end;

function TID3ContextMenu.InvokeCommand(var lpici:
  TCMInvokeCommandInfo): HResult;
begin
  Result := S_OK;
  try
    // Verifico che la chiamata non provenga da un'applicazione.
    if HiWord(Cardinal(lpici.lpVerb)) = 0 then begin
      // Eseguo il comando richiesto, se è l'unico che ho.
      if LoWord(lpici.lpVerb) = FIndiceVoceMenu then
        MostraInfoID3(FNomeFile)
      else
        Result := E_INVALIDARG;
    end
    else
      Result := E_FAIL;
  except
    // Non posso in nessun caso lasciar trapelare eccezioni.
    Result := E_UNEXPECTED;
  end;
end;

{ TID3ContextMenuFactory }

procedure TID3ContextMenuFactory.UpdateRegistry(Register: Boolean);
begin
  inherited;
  with TRegistry.Create do begin
    try
      RootKey := HKEY_CLASSES_ROOT;
      if Register then begin
        // Aggiungo la chiave.
        OpenKey('\*\shellex\ContextMenuHandlers\ID3ContextMenu', True);
        WriteString('', GUIDToString(Class_TID3ContextMenu));
      end
      else
        // Elimino la chiave.
        DeleteKey('\*\shellex\ContextMenuHandlers\ID3ContextMenu');
    finally
      Free;
    end;
  end;
end;

initialization
  TID3ContextMenuFactory.Create(ComServer, TID3ContextMenu,
    Class_TID3ContextMenu, 'TID3ContextMenu',
    'Visualizzazione informazioni ID3v1 per file mp3',
    ciMultiInstance, tmApartment);

end.
