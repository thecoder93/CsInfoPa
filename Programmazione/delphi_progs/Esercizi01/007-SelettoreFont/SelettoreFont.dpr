program SelettoreFont;

uses
  Forms,
  Selettore in 'Selettore.pas' {fmSelettore};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmSelettore, fmSelettore);
  Application.Run;
end.
