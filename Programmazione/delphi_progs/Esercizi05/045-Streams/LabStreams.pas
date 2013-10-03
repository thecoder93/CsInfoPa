unit LabStreams;

interface

uses
  Classes;

// Soluzione specifica: TUpperCaseFileStream.
// Un TFileStream che converte in maiuscolo i caratteri letti.
type
  TUpperCaseFileStream = class(TFileStream)
  public
    function Read(var Buffer; Count: Longint): Longint; override;
  end;

// Soluzione generale: TUpperCaseStreamDecorator.
// Può essere accoppiato a qualunque TStream; converte in maiuscolo i
// caratteri letti.
type
  TUpperCaseStreamDecorator = class(TStream)
  private
    FStream: TStream;
  public
    constructor Create(AStream: TStream);
    destructor Destroy; override;
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    function Seek(Offset: Longint; Origin: Word): Longint; override;
  end;

implementation

uses
  SysUtils;

// Questa procedura contiene il codice per convertire in maiuscolo
// un buffer di caratteri di lunghezza data.
procedure UpperCaseBuffer(var Buffer; Count: Integer);
type
  // Serve per trattare il buffer come array di caratteri illimitato.
  TCharArray = array [0..0] of Char;
var
  g: Integer;
begin
  // Scorro i caratteri letti (solo da 0 a Count - 1), convertendo
  // ciascuno di essi in maiuscolo.
  for g := 0 to Pred(Count) do
    TCharArray(Buffer)[g] := AnsiUpperCase(TCharArray(Buffer)[g])[1];
end;

{ TUpperCaseFileStream }

function TUpperCaseFileStream.Read(var Buffer; Count: Integer): Longint;
begin
  // Affido alla classe base la lettura dei dati.
  Result := inherited Read(Buffer, Count);
  // Converto il buffer in maiuscolo.
  UpperCaseBuffer(Buffer, Result);
end;

{ TUpperCaseStreamDecorator }

constructor TUpperCaseStreamDecorator.Create(AStream: TStream);
begin
  FStream := AStream;
  if not Assigned(FStream) then
    raise Exception.Create('TUpperCaseStreamDecorator.Create: AStream non può essere nil.');
end;

destructor TUpperCaseStreamDecorator.Destroy;
begin
  // Per comodità, distruggo lo stream decorato.
  if Assigned(FStream) then
    FStream.Free;
  inherited;
end;

function TUpperCaseStreamDecorator.Read(var Buffer; Count: Integer): Longint;
begin
  // Affido allo Stream interno la lettura dei dati.
  Result := FStream.Read(Buffer, Count);
  // Converto il buffer in maiuscolo.
  UpperCaseBuffer(Buffer, Result);
end;

// Affido allo Stream interno le operazioni che non mi interessa decorare.

function TUpperCaseStreamDecorator.Seek(Offset: Integer; Origin: Word): Longint;
begin
  Result := FStream.Seek(Offset, Origin);
end;

function TUpperCaseStreamDecorator.Write(const Buffer; Count: Integer): Longint;
begin
  Result := FStream.Write(Buffer, Count);
end;

end.
