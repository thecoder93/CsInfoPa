unit UStampa;

interface

uses
  Classes, StdCtrls;

procedure CaricaStampanti(Stampanti: TStrings);
procedure StampaMemo(Memo: TMemo; const Stampante: string);

implementation

uses
  Windows, SysUtils, WinSpool, Graphics;

procedure CaricaStampanti(Stampanti: TStrings);
var
  Buffer, PrinterInfo: PChar;
  Flags, Count, NumInfo: DWORD;
  I: Integer;
  Level: Byte;
begin
// carico la lista delle stampanti di Windows
  if Assigned(Stampanti) then
  begin
  // pulisco la lista
    Stampanti.Clear;
  // per Windows NT occorre una struttura diversa (Level 5)
    if Win32Platform = VER_PLATFORM_WIN32_NT then begin
      Flags := PRINTER_ENUM_CONNECTIONS or PRINTER_ENUM_LOCAL;
      Level := 4;
    end else begin
      Flags := PRINTER_ENUM_LOCAL;
      Level := 5;
    end;
    Count := 0;
  // chiedo quante stampanti ci sono...
    EnumPrinters(Flags, nil, Level, nil, 0, Count, NumInfo);
    if Count = 0 then
      Exit;
  // ...e alloco la memoria necessaria per il buffer temporaneo
    GetMem(Buffer, Count);
    try
    // carico tutte le informazioni delle stampanti...
      if not EnumPrinters(Flags, nil, Level, PByte(Buffer),
           Count, Count, NumInfo) then
        Exit;
      PrinterInfo := Buffer;
    // ...e scandisco l'elenco
      for I := 0 to NumInfo - 1 do begin
      // carico il nome a seconda della struttura
        if Level = 4 then
          with PPrinterInfo4(PrinterInfo)^ do begin
            Stampanti.Add(pPrinterName);
            Inc(PrinterInfo, sizeof(TPrinterInfo4));
          end
        else
          with PPrinterInfo5(PrinterInfo)^ do begin
            Stampanti.Add(pPrinterName);
            Inc(PrinterInfo, sizeof(TPrinterInfo5));
          end;
      end;
    finally
    // libero il buffer temporaneo
      FreeMem(Buffer, Count);
    end;
  end;
end;

procedure StampaMemo(Memo: TMemo; const Stampante: string);
const
  margineX = 100;
  margineY = 100;
var
  docinfo: Tdocinfo;
  PrinterDC: HDC;
  AltezzaPagina, y, riga: integer;
  dimensione: TSize;
  NostroFont: TFont;
begin
// preparo le informazioni di base...
  docinfo.cbSize := sizeof( docinfo );
  docinfo.lpszDocName := 'documento';
  docinfo.lpszOutput := '';
  docinfo.lpszDatatype := '';
  docinfo.fwType := 0;
// ...e le uso per ottenere l'Handle al Device Context
  PrinterDC := CreateDC( nil, PChar( Stampante ), nil, @docinfo );
  if PrinterDC = 0 then
    raise Exception.Create('Errore nella creazione del DC');
  try
  // creo un nuovo font
    NostroFont := TFont.Create;
    try
      with NostroFont do begin
        // copio quello attuale
          Assign( Memo.Font );
        // assegno la risoluzione della stampante
          PixelsPerInch := GetDeviceCaps( PrinterDC, LOGPIXELSY );
        // ricopio la dimensione perché venga ricalcolata
          Size := Memo.Font.Size;
        // passo il font al DC
          SelectObject( PrinterDC, Handle );
      end;
    // chiedo l'altezza della pagina
      AltezzaPagina := GetDeviceCaps( PrinterDC, VERTRES );
    // inizio la stampa
      StartDoc( PrinterDC, docinfo );
      try
      // calcolo l'altezza della riga
        GetTextExtentPoint32( PrinterDC, 'Lp', 2, dimensione );
        StartPage( PrinterDC );
        y := margineY;
      // scorro tutte le righe del memo
        for riga := 0 to Memo.Lines.Count - 1 do begin
        // calcolo la nuova posizione Y
          y := y + dimensione.cy;
          if y > AltezzaPagina - dimensione.cy then begin
          // se ho superato l'altezza della pagina ne creo una nuova
            EndPage( PrinterDC );
            StartPage( PrinterDC );
            y := margineY;
          end;
        // stampo la riga corrente
          TextOut( PrinterDC, margineX, Y, PChar( Memo.Lines[riga] ),
             Length( Memo.Lines[riga] ));
        end;
      // chiudo la pagina
        EndPage( PrinterDC );
      // chiudo la stampa
      finally
        EndDoc( PrinterDC );
      end;
    finally
    // distruggo il font
      NostroFont.Free;
    end;
  // cancello l'hDC
  finally
    DeleteDC( PrinterDC );
  end;
end;

end.
