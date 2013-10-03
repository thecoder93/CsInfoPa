unit UWmTOD;

interface

uses
  Windows, SysUtils, HTTPApp, Classes, LDTipOfTheDay;

type
  TWmTOD = class(TWebModule)
    TOD: TLDTipOfTheDay;
    PrTOD: TPageProducer;
    procedure WebModuleCreate(Sender: TObject);
    procedure PrTODHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
  end;

var
  WmTOD: TWmTOD;

implementation

{$R *.DFM}

procedure TWmTOD.WebModuleCreate(Sender: TObject);
begin
  // Punto al file di Tip.
  TOD.TipFileName := ExtractFilePath(ParamStr(0)) + 'tips.ini';
end;

procedure TWmTOD.PrTODHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
begin
  // Sostituisco i tag variabili: il Tip e il link.
  if SameText(TagString, 'TOD') then
    ReplaceText := TOD.NextTip
  else if SameText(TagString, 'EXENAME') then
    ReplaceText := ExtractFileName(ParamStr(0));
end;

end.
