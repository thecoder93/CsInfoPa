unit UFmStreams;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFmStreams = class(TForm)
    EtFile: TMemo;
    Label1: TLabel;
    EtNomeFile: TEdit;
    PbLeggiUpperCase: TButton;
    PbLeggiConDecorator: TButton;
    Label2: TLabel;
    Label3: TLabel;
    PbLeggi: TButton;
    procedure PbLeggiUpperCaseClick(Sender: TObject);
    procedure PbLeggiClick(Sender: TObject);
    procedure PbLeggiConDecoratorClick(Sender: TObject);
  private
    procedure LeggiDaStream(Stream: TStream);
  public
  end;

var
  FmStreams: TFmStreams;

implementation

{$R *.DFM}

uses
  LabStreams;

procedure TFmStreams.LeggiDaStream(Stream: TStream);
var
  Buffer: array[0..4095] of Char;
begin
  EtFile.Lines.Clear;
  FillChar(Buffer, SizeOf(Buffer), #0);
  with Stream do
    while Read(Buffer, SizeOf(Buffer)) > 0 do begin
      EtFile.Lines.Text := EtFile.Lines.Text + Buffer;
      FillChar(Buffer, SizeOf(Buffer), #0);
    end;
end;

procedure TFmStreams.PbLeggiClick(Sender: TObject);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(EtNomeFile.Text, fmOpenRead or fmShareDenyNone);
  try
    LeggiDaStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TFmStreams.PbLeggiUpperCaseClick(Sender: TObject);
var
  Stream: TStream;
begin
  Stream := TUpperCaseFileStream.Create(EtNomeFile.Text, fmOpenRead or fmShareDenyNone);
  try
    LeggiDaStream(Stream);
  finally
    Stream.Free;
  end;
end;


procedure TFmStreams.PbLeggiConDecoratorClick(Sender: TObject);
var
  Stream: TStream;
begin
  Stream := TUpperCaseStreamDecorator.Create(
    TFileStream.Create(EtNomeFile.Text, fmOpenRead or fmShareDenyNone));
  try
    LeggiDaStream(Stream);
  finally
    Stream.Free;
  end;
end;

end.
