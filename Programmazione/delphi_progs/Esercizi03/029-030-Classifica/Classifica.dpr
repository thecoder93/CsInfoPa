program Classifica;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  ClassificaUtils in 'ClassificaUtils.pas';

var
  // Strutture per contenere i dati in memoria.
  MemClassifica: TMemClassifica;
  MemTurno: TMemTurno;

// Controlla i parametri in input per determinarne la
// correttezza.
function ControllaInput: Boolean;
begin
  if (ParamCount = 3) and
     FileExists(ParamStr(1)) and
     FileExists(ParamStr(2)) then
    Result := True
  else
    Result := False;
end;

// Incrementa il numero di partite giocate della squadra
// indicata, aggiornando anche le altre statistiche e il
// punteggio sulla base dei parametri.
procedure AggiornaSituazioneSquadra(const NomeSquadra: TNomeSquadra;
  Vittoria, Pareggio, Sconfitta: Boolean);
var
  i: TIndiceClassifica;
begin
  for i := Low(i) to High(i) do begin
    if MemClassifica[i].NomeSquadra = NomeSquadra then begin
      // La squadra ha comunque giocato.
      Inc(MemClassifica[i].Giocate);
      // Se ha vinto guadagna tre punti.
      if Vittoria then begin
        Inc(MemClassifica[i].Vittorie);
        Inc(MemClassifica[i].Punteggio, 3);
      end;
      // Se ha pareggiato guadagna un punto.
      if Pareggio then begin
        Inc(MemClassifica[i].Pareggi);
        Inc(MemClassifica[i].Punteggio, 1);
      end;
      // Se ha persono non guadagna punti.
      if Sconfitta then
        Inc(MemClassifica[i].Sconfitte);
      // Inutile proseguire il giro.
      Break;
    end;
  end;
end;

// Elabora i dati di input in memoria e produce
// l'array con la classifica aggiornata.
procedure ElaboraClassifica;
var
  i: TIndiceTurno;
begin
  // Per ciascun incontro...
  for i := Low(i) to High(i) do begin
    with MemTurno[i] do begin
      // ...aggiorno le statistiche della squadra in casa e
      // di quella in trasferta in base al punteggio.
      AggiornaSituazioneSquadra(
        NomeSquadraInCasa,
        PunteggioSquadraInCasa > PunteggioSquadraInTrasferta,
        PunteggioSquadraInCasa = PunteggioSquadraInTrasferta,
        PunteggioSquadraInCasa < PunteggioSquadraInTrasferta);
      AggiornaSituazioneSquadra(
        NomeSquadraInTrasferta,
        PunteggioSquadraInCasa < PunteggioSquadraInTrasferta,
        PunteggioSquadraInCasa = PunteggioSquadraInTrasferta,
        PunteggioSquadraInCasa > PunteggioSquadraInTrasferta);
    end;
  end;
end;

// Programma principale.

begin
  if ControllaInput then begin
    // Leggo la classifica.
    LeggiClassifica(ParamStr(1), MemClassifica);
    StampaClassifica(MemClassifica);
    WriteLn('');
    // Stessa cosa per il turno.
    LeggiTurno(ParamStr(2), MemTurno);
    StampaTurno(MemTurno);
    WriteLn('');
    // Applico il turno alla classifica.
    ElaboraClassifica;
    // Riordino la classifica.
    OrdinaClassifica(MemClassifica);
    // Scrivo il risultato.
    ScriviClassifica(ParamStr(3), MemClassifica);
    StampaClassifica(MemClassifica);
    WriteLn('');
    WriteLn('La classifica e'' stata aggiornata.');
  end
  else
    // Errore nel passaggio dei parametri.
    WriteLn('Sintassi: Classifica nome_file_classifica nome_file_turno ' +
        'nome_file_output');
end.
