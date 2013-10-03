unit ClassificaUtils;

interface

uses
  SysUtils, Classes;

type
  TNomeSquadra = string[20];

  TClassifica = packed record
    NomeSquadra: TNomeSquadra;
    Giocate: Cardinal;
    Vittorie: Cardinal;
    Pareggi: Cardinal;
    Sconfitte: Cardinal;
    Punteggio: Cardinal;
  end;

  FileClassifica = file of TClassifica;

  TTurno = packed record
    NomeSquadraInCasa: TNomeSquadra;
    PunteggioSquadraInCasa: Cardinal;
    NomeSquadraInTrasferta: TNomeSquadra;
    PunteggioSquadraInTrasferta: Cardinal;
  end;

  FileTurno = file of TTurno;

const
  NUMERO_SQUADRE = 18;
  NUMERO_INCONTRI = NUMERO_SQUADRE div 2;

type
  TIndiceClassifica = 1..NUMERO_SQUADRE;
  TIndiceTurno = 1..NUMERO_INCONTRI;

type
  TMemClassifica = array[TIndiceClassifica] of TClassifica;
  TMemTurno = array[TIndiceTurno] of TTurno;

// Legge una classifica dal file indicato nell'array Destinazione.
procedure LeggiClassifica(NomeFile: string; var Destinazione: TMemClassifica);
// Scrive la classifica indicata sul file di output.
procedure ScriviClassifica(NomeFile: string; Sorgente: TMemClassifica);
// Stampa la classifica sulla console.
procedure StampaClassifica(Sorgente: TMemClassifica);
// Legge un elenco di nomi di squadre e lo trasforma in un file di
// record contenente una classifica iniziale.
procedure CreaNuovaClassifica(NomeFile: string; ElencoSquadre: TStrings);
// Ordina la classifica indicata per punteggio, discendente.
procedure OrdinaClassifica(var Classifica: TMemClassifica);

// Legge un turno dal file indicato nell'array Destinazione.
procedure LeggiTurno(NomeFile: string; var Destinazione: TMemTurno);
// Scrive il turno indicato sul file di output.
procedure ScriviTurno(NomeFile: string; Sorgente: TMemTurno);
// Stampa i risultati sulla console.
procedure StampaTurno(Sorgente: TMemTurno);

implementation

// Uso interno; aggiunge spazi in coda ad una stringa per
// farle raggiungere un determinato numero di caratteri.
function PadStr(Str: string; Caratteri: Integer): string;
begin
  if Length(Str) > Caratteri then
    Result := Copy(Str, 1, Caratteri)
  else
    Result := Str + StringOfChar(' ', Caratteri - Length(Str));
end;

procedure LeggiClassifica(NomeFile: string;
  var Destinazione: TMemClassifica);
var
  FC: FileClassifica;
  IndiceClassifica: TIndiceClassifica;
begin
  AssignFile(FC, NomeFile);
  Reset(FC);
  try
    IndiceClassifica := Low(IndiceClassifica);
    // Leggo i record finché il file non è finito o
    // sono giunto al limite del mio array.
    while not EOF(FC) do begin
      Read(FC, Destinazione[IndiceClassifica]);
      if IndiceClassifica = High(IndiceClassifica) then
        Break
      else
        Inc(IndiceClassifica);
    end;
  finally
    CloseFile(FC);
  end;
end;

procedure ScriviClassifica(NomeFile: string; Sorgente: TMemClassifica);
var
  FC: FileClassifica;
  i: TIndiceClassifica;
begin
  AssignFile(FC, NomeFile);
  Rewrite(FC);
  try
    for i := Low(Sorgente) to High(Sorgente) do begin
      // Salto gli eventuali record vuoti.
      if Sorgente[i].NomeSquadra <> '' then
        Write(FC, Sorgente[i]);
    end;
  finally
    CloseFile(FC);
  end;
end;

procedure StampaClassifica(Sorgente: TMemClassifica);
var
  i: TIndiceClassifica;
begin
  // Stampo prima l'intestazione...
  WriteLn('Nome squadra       '#9'G'#9'V'#9'N'#9'S'#9'P');
  WriteLn(StringOfChar('-', 60));
  // ...e poi i dati.
  for i := Low(Sorgente) to High(Sorgente) do begin
    // Salto gli eventuali record vuoti.
    if Sorgente[i].NomeSquadra <> '' then
      WriteLn(PadStr(Sorgente[i].NomeSquadra, 20) + #9 +
        IntToStr(Sorgente[i].Giocate) + #9 +
        IntToStr(Sorgente[i].Vittorie) + #9 +
        IntToStr(Sorgente[i].Pareggi) + #9 +
        IntToStr(Sorgente[i].Sconfitte) + #9 +
        IntToStr(Sorgente[i].Punteggio));
  end;
end;

procedure CreaNuovaClassifica(NomeFile: string; ElencoSquadre: TStrings);
var
  i: TIndiceClassifica;
  g: Integer;
  NomeSquadra: TNomeSquadra;
  ArraySquadre: TMemClassifica;
begin
  if Assigned(ElencoSquadre) then begin
    // Inizializzo l'array locale.
    FillChar(ArraySquadre, SizeOf(ArraySquadre), #0);
    // Aggiungo i nomi delle squadre finché
    // c'è posto nell'array.
    i := Low(i);
    for g := 0 to Pred(ElencoSquadre.Count) do begin
      NomeSquadra := ElencoSquadre[g];
      // Salto le eventuali righe vuote.
      if NomeSquadra <> '' then begin
        ArraySquadre[i].NomeSquadra := NomeSquadra;
        if i = High(i) then
          Break
        else
          Inc(i);
      end;
    end;
    // Scrivo l'array su file.
    ScriviClassifica(NomeFile, ArraySquadre);
  end;
end;

procedure OrdinaClassifica(var Classifica: TMemClassifica);
var
  I, J: TIndiceClassifica;
  T: TClassifica;
begin
  // Applico un classico Bubble Sort.
  for I := High(Classifica) downto Low(Classifica) do
    for J := Low(Classifica) to High(Classifica) - 1 do
      if Classifica[J].Punteggio < Classifica[J + 1].Punteggio then begin
        T := Classifica[J];
        Classifica[J] := Classifica[J + 1];
        Classifica[J + 1] := T;
      end;
end;

procedure LeggiTurno(NomeFile: string; var Destinazione: TMemTurno);
var
  FT: FileTurno;
  IndiceTurno: TIndiceTurno;
begin
  AssignFile(FT, NomeFile);
  Reset(FT);
  try
    IndiceTurno := Low(IndiceTurno);
    // Leggo i record finché il file non è finito o
    // sono giunto al limite del mio array.
    while not EOF(FT) do begin
      Read(FT, Destinazione[IndiceTurno]);
      if IndiceTurno = High(IndiceTurno) then
        Break
      else
        Inc(IndiceTurno);
    end;
  finally
    CloseFile(FT);
  end;
end;

procedure ScriviTurno(NomeFile: string; Sorgente: TMemTurno);
var
  FT: FileTurno;
  i: TIndiceTurno;
begin
  AssignFile(FT, NomeFile);
  Rewrite(FT);
  try
    for i := Low(Sorgente) to High(Sorgente) do begin
      // Salto gli eventuali record incompleti.
      if (Sorgente[i].NomeSquadraInCasa <> '') and
         (Sorgente[i].NomeSquadraInTrasferta <> '') then
        Write(FT, Sorgente[i]);
    end;
  finally
    CloseFile(FT);
  end;
end;

procedure StampaTurno(Sorgente: TMemTurno);
var
  i: TIndiceTurno;
begin
  for i := Low(Sorgente) to High(Sorgente) do begin
    // Salto gli eventuali record vuoti.
    WriteLn(PadStr(Sorgente[i].NomeSquadraInCasa, 20) + ' - ' +
      PadStr(Sorgente[i].NomeSquadraInTrasferta, 20) + ' ' +
      PadStr(IntToStr(Sorgente[i].PunteggioSquadraInCasa), 3) +
      PadStr(IntToStr(Sorgente[i].PunteggioSquadraInTrasferta), 3));
  end;
end;

end.
