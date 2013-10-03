unit UFmProfiler;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Contnrs;

type
  TFmProfiler = class(TForm)
    EtMemo: TMemo;
    BtMoltiplicazioni: TButton;
    BtProfiler: TButton;
    BtObject: TButton;
    BtQueryPC: TButton;
    procedure BtMoltiplicazioniClick(Sender: TObject);
    procedure BtProfilerClick(Sender: TObject);
    procedure BtObjectClick(Sender: TObject);
    procedure BtQueryPCClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmProfiler: TFmProfiler;

implementation

{$R *.DFM}

uses
  UProfiler;

procedure TFmProfiler.BtProfilerClick(Sender: TObject);
var
  i: integer;
begin
  EtMemo.Clear;
  Profiler.Inizia;
  for i := 1 to 100 do begin
    Profiler.Misura;
  end;
  Profiler.Finisci;
  Profiler.Rapporto( EtMemo.Lines );
end;

procedure TFmProfiler.BtMoltiplicazioniClick(Sender: TObject);
var
  res: Extended;
  i, j: integer;
begin
  EtMemo.Clear;
  Randomize;
  res := 0;
  Profiler.Inizia;
  for i := 1 to 1000 do begin
    Profiler.Misura;
    for j := 1 to 1000 do
      res := res / ( Random * Random + Random - Random );
  end;
  Profiler.Finisci;
  Profiler.Rapporto( EtMemo.Lines );
end;

procedure TFmProfiler.BtObjectClick(Sender: TObject);
var
  i: integer;
  list: TObjectList;
begin
  EtMemo.Clear;
  List := TObjectList.Create( True );
  try
    Profiler.Inizia;
    for i := 1 to 100 do begin
      Profiler.Misura;
      List.Add( TObject.Create );
    end;
    Profiler.Finisci;
    Profiler.Rapporto( EtMemo.Lines );
  finally
    List.Free;
  end;
end;

procedure TFmProfiler.BtQueryPCClick(Sender: TObject);
var
  i: integer;
  r: int64;
begin
  EtMemo.Clear;
  Randomize;
  Profiler.Inizia;
  for i := 1 to 100 do begin
    Profiler.Misura;
    QueryPerformanceCounter( r );
  end;
  Profiler.Finisci;
  Profiler.Rapporto( EtMemo.Lines );
end;

end.
