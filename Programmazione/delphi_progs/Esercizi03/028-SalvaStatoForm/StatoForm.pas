unit StatoForm;

interface

uses
  Forms;

procedure SalvaStatoForm(UnaForm: TForm);
procedure RipristinaStatoForm(UnaForm: TForm);

implementation

uses
  Registry, TypInfo;

const
  PERCORSO_BASE = 'Software\LabDelphi\StatoForm\';

procedure SalvaStatoForm(UnaForm: TForm);
begin
  // Creo un'istanza di TRegistry per scrivere
  // nel Registro di Configurazione.
  with TRegistry.Create do begin
    try
      if OpenKey(PERCORSO_BASE + UnaForm.Name, True) then begin
        WriteInteger('Left', UnaForm.Left);
        WriteInteger('Top', UnaForm.Top);
        WriteInteger('Width', UnaForm.Width);
        WriteInteger('Height', UnaForm.Height);
        // Salvo lo stato sotto forma di stringa, in modo che
        // sia comprensibile.
        WriteString('WindowState',
          GetEnumName(TypeInfo(TWindowState), Ord(UnaForm.WindowState)));
      end;
    finally
      Free;
    end;
  end;
end;

procedure RipristinaStatoForm(UnaForm: TForm);
begin
  // Creo un'istanza di TRegistry per leggere
  // dal Registro di Configurazione.
  with TRegistry.Create do begin
    try
      if OpenKey(PERCORSO_BASE + UnaForm.Name, False) then begin
        UnaForm.Left := ReadInteger('Left');
        UnaForm.Top := ReadInteger('Top');
        UnaForm.Width := ReadInteger('Width');
        UnaForm.Height := ReadInteger('Height');
        // Lo stato è salvato sotto forma di stringa, quindi
        // deve essere decodificato.
        UnaForm.WindowState :=
          TWindowState(GetEnumValue(TypeInfo(TWindowState),
          ReadString('WindowState')));
      end;
    finally
      Free;
    end;
  end;
end;

end.
