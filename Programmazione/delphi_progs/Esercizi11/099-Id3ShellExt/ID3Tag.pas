unit ID3Tag;

interface

type
  // Formato del tag ID3.
  TID3Tag = packed record
    ID: array[0..2] of char;
    Titolo: array[0..29] of char;
    Autore: array[0..29] of char;
    Album: array[0..29] of char;
    Anno: array[0..3] of char;
    Commento: array[0..29] of char;
    Genere: Byte;
  end;

type
  // Classe che incapsula un tag ID3.
  TID3TagInfo = class(TObject)
  private
    FTag: TID3Tag;
    FTagValido: Boolean;
    function GetAlbum: string;
    function GetAnno: Integer;
    function GetAutore: string;
    function GetCommento: string;
    function GetGenere: string;
    function GetNumeroTraccia: Integer;
    function GetTitolo: string;
    function GetVersione: Integer;
  public
    // Carica le informazioni dal file indicato.
    procedure CaricaTag(NomeFile: string);
    // True se le informazioni caricate sono valide.
    property TagValido: Boolean read FTagValido;
    // Informazioni ID3.
    property Titolo: string read GetTitolo;
    property Autore: string read GetAutore;
    property Album: string read GetAlbum;
    property Commento: string read GetCommento;
    property Genere: string read GetGenere;
    property Anno: Integer read GetAnno;
    // Solo per ID3 versione 1.1, altrimenti vale 0.
    property NumeroTraccia: Integer read GetNumeroTraccia;
    // 0 per ID3 versione 1.0, 1 per ID3 versione 1.1.
    property Versione: Integer read GetVersione;
  end;

// Restituisce True se il file contiene un tag ID3.
function ID3Presente(NomeFile: string): Boolean;

implementation

uses
  SysUtils, Classes;

const
  // Descrizioni dei generi.
  Generi: array[0..125] of string = (
    'Blues','Classic Rock','Country','Dance','Disco','Funk','Grunge',
    'Hip-Hop','Jazz','Metal','New Age','Oldies','Other','Pop','R&B',
    'Rap','Reggae','Rock','Techno','Industrial','Alternative','Ska',
    'Death Metal','Pranks','Soundtrack','Euro-Techno','Ambient',
    'Trip-Hop','Vocal','Jazz+Funk','Fusion','Trance','Classical',
    'Instrumental','Acid','House','Game','Sound Clip','Gospel',
    'Noise','AlternRock','Bass','Soul','Punk','Space','Meditative',
    'Instrumental Pop','Instrumental Rock','Ethnic','Gothic',
    'Darkwave','Techno-Industrial','Electronic','Pop-Folk',
    'Eurodance','Dream','Southern Rock','Comedy','Cult','Gangsta',
    'Top 40','Christian Rap','Pop/Funk','Jungle','Native American',
    'Cabaret','New Wave','Psychadelic','Rave','Showtunes','Trailer',
    'Lo-Fi','Tribal','Acid Punk','Acid Jazz','Polka','Retro',
    'Musical','Rock & Roll','Hard Rock','Folk','Folk-Rock',
    'National Folk','Swing','Fast Fusion','Bebob','Latin','Revival',
    'Celtic','Bluegrass','Avantgarde','Gothic Rock','Progressive Rock',
    'Psychedelic Rock','Symphonic Rock','Slow Rock','Big Band',
    'Chorus','Easy Listening','Acoustic','Humour','Speech','Chanson',
    'Opera','Chamber Music','Sonata','Symphony','Booty Bass','Primus',
    'Porn Groove','Satire','Slow Jam','Club','Tango','Samba',
    'Folklore','Ballad','Power Ballad','Rhythmic Soul','Freestyle',
    'Duet','Punk Rock','Drum Solo','Acapella','Euro-House','Dance Hall');

function ID3Presente(NomeFile: string): Boolean;
var
  ID3: TID3TagInfo;
begin
  ID3 := TID3TagInfo.Create;
  try
    ID3.CaricaTag(NomeFile);
    Result := ID3.TagValido;
  finally
    ID3.Free;
  end;
end;

{ TID3TagInfo }

procedure TID3TagInfo.CaricaTag(NomeFile: string);
var
  S: TStream;
begin
  // Carico gli ultimi 128 byte del file in FTag.
  S := TFileStream.Create(NomeFile, fmOpenRead or fmShareDenyWrite);
  try
    S.Seek(-SizeOf(FTag), soFromEnd);
    S.ReadBuffer(FTag, SizeOf(FTag));
    // Verifico la validità di quanto caricato.
    FTagValido := FTag.ID = 'TAG';
  finally
    S.Free;
  end;
end;

function TID3TagInfo.GetAlbum: string;
begin
  Result := Trim(FTag.Album);
end;

function TID3TagInfo.GetAnno: Integer;
begin
  Result := StrToIntDef(Trim(FTag.Anno), 0);
end;

function TID3TagInfo.GetAutore: string;
begin
  Result := Trim(FTag.Autore);
end;

function TID3TagInfo.GetCommento: string;
begin
  Result := Trim(FTag.Commento);
end;

function TID3TagInfo.GetGenere: string;
begin
  if FTag.Genere <= High(Generi) then
    Result := Generi[FTag.Genere]
  else
    Result := 'Sconosciuto';
end;

function TID3TagInfo.GetNumeroTraccia: Integer;
begin
  if Versione = 1 then
    Result := Ord(FTag.Commento[29])
  else
    Result := 0;
end;

function TID3TagInfo.GetTitolo: string;
begin
  Result := Trim(FTag.Titolo);
end;

function TID3TagInfo.GetVersione: Integer;
begin
  if (FTag.Commento[28] = #0) and
     (FTag.Commento[29] <> #0) then
    Result := 1 // Versione 1.1
  else
    Result := 0; // Versione 1.0
end;

end.
