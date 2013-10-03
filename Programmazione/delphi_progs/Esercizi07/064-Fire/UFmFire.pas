unit UFmFire;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	ExtCtrls, StdCtrls, ComCtrls, ExtDlgs, TypInfo;

type
  TFmFire = class(TForm)
    ImFire: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ImFireClick(Sender: TObject);
	private
    procedure PreparaFire;
    procedure CicloFire;
	public
    procedure Fire;
	end;

var
	FmFire: TFmFire;

implementation

{$R *.DFM}

procedure CreaFirePalette(ABmp: TBitmap);
// creo una nuova palette ad hoc e la assegno alla bitmap passata
var
  pal: PMaxLogPalette;
  hpal: HPALETTE;
  i: Integer;
begin
// alloco la memoria per la struttura dati con i singoli colori
// al puntatore di tutta la nuova palette
  GetMem(pal, sizeof(TMaxLogPalette));
  try
  // versione interna della palette
    pal.palVersion := $300;
  // numero dei colori da rifare (tutti)
    pal.palNumEntries := 256;
  // creo le sfumature dal bianco al giallo
    for i := 0 to 63 do begin
      pal.palPalEntry[i].peRed := 255;
      pal.palPalEntry[i].peGreen := 255;
      pal.palPalEntry[i].peBlue := 255-i*4;
      pal.palPalEntry[i].peFlags := 0; // colore normale
    end;
  // dal giallo al rosso
    for i := 64 to 127 do begin
      pal.palPalEntry[i].peRed := 255;
      pal.palPalEntry[i].peGreen := 255-(i-64)*4;
      pal.palPalEntry[i].peBlue := 0;
      pal.palPalEntry[i].peFlags := 0;
    end;
  // dal rosso al giallo
    for i := 128 to 191 do begin
      pal.palPalEntry[i].peRed := 255;
      pal.palPalEntry[i].peGreen := (i-128)*4;
      pal.palPalEntry[i].peBlue := 0;
      pal.palPalEntry[i].peFlags := 0;
    end;
  // dal blu scuro al nero
    for i := 192 to 255 do begin
      pal.palPalEntry[i].peRed := 0;
      pal.palPalEntry[i].peGreen := 0;
      pal.palPalEntry[i].peBlue := 128-(i-192)*2;
      pal.palPalEntry[i].peFlags := 0;
    end;
  // creo la palette passando i dati dei singoli colori...
    hpal := CreatePalette(PLogPalette(pal)^);
  // ...e la assegno all'immagine bitmap
    if hpal > 32 then
      Abmp.Palette := hpal
    else
      raise Exception.Create( 'Impossibile creare la palette' );
  finally
  // libero la struttura dati
    FreeMem(pal);
  end;
end;

procedure TFmFire.PreparaFire;
begin
	with ImFire.Picture.Bitmap do begin
  // la bitmap deve avere 8 bit di profondità
  // altrimenti non posso attaccarci la palette
    PixelFormat := pf8bit;
  // la bitmap deve occupare tutta l'area del
  // componente Image, più una porzione invisibile
  // da usare come area di lavoro
    Width := ImFire.ClientWidth;
    Height := ImFire.ClientHeight + 4;
  end;
// collego la palette
	CreaFirePalette(ImFire.Picture.Bitmap);
end;

procedure TFmFire.FormCreate(Sender: TObject);
begin
// preparo le variabili
  PreparaFire;
end;

procedure TFmFire.CicloFire;
var
  p0,p1,p2,p3,p4,kx,ky: integer;
  ddownrow,downRow, currRow: PByteArray;
  W, H: integer;
  Bmp: TBitmap;
begin
// inizializzo le variabili locali
	Bmp := ImFire.Picture.Bitmap;
	W := Bmp.Width;
	H := Bmp.Height;
// disegno a caso la riga in basso
  currRow := Bmp.ScanLine[H-1];
  for kx:=0 to W-1 do
    currRow[kx] := Random(256);
// ciclo dall'alto in basso
  for ky:=0 to H-2 do	begin
  // preparo i puntatori alle scanline
    currRow := Bmp.ScanLine[ky];
    downRow := Bmp.ScanLine[ky+1];
    if ky < H-3 then
      ddownRow := Bmp.ScanLine[ky+2]
    else
      ddownRow := downRow;
  // ciclo della riga
    for kx:=0 to W-1 do begin
    // carico i valori di 4 punti sottostanti
      if kx > 1 then
        p1 := downRow[kx-1]
      else
        p1 := downRow[W-1];
      p2 := downRow[kx];
      if kx < W-1 then
        p3 := downRow[kx+1]
      else
        p3 := downRow[0];
      p4 := ddownRow[kx];

    // faccio la media e aggiungo una quantità a caso tra 0 e 2
      p0 := (p1 + p2 + p3 + p4 ) shr 2 + random(3);
    // pongo il valore calcolato nel pixel corrente
      if p0 < 255 then
        currRow[kx] := p0
      else
        currRow[kx] := 255;
    end;
  end;
// alla fine ridisegno
  ImFire.Refresh;
end;

procedure TFmFire.Fire;
begin
// ciclo fino alla chiusura dell'applicazione
  while not Application.Terminated do begin
  // eseguo un ciclo fire
    CicloFire;
  // per permettere di chiudere l'applicazione
    Application.ProcessMessages;
  end;
end;

procedure TFmFire.ImFireClick(Sender: TObject);
begin
// faccio partire l'animazione
  Fire;
end;

end.
