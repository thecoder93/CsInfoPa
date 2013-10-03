program TabReturn;

uses
  Forms,
  UFmTabReturn in 'UFmTabReturn.pas' {FmTabReturn},
  UTabReturn in 'UTabReturn.pas',
  Unit2 in 'Unit2.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFmTabReturn, FmTabReturn);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
