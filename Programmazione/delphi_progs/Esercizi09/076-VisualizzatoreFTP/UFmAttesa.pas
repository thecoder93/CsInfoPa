unit UFmAttesa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFmAttesa = class(TForm)
    StAttesa: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure Attesa(Messaggio: string);
procedure FineAttesa;

implementation

{$R *.DFM}

var
  FmAttesa: TFmAttesa;

procedure Attesa(Messaggio: string);
begin
  // Chiudo un'eventuale finestra di attesa aperta.
  FineAttesa;
  // Creo e mostro la form.
  FmAttesa := TFmAttesa.Create(Application);
  try
    FmAttesa.StAttesa.Caption := Messaggio;
    FmAttesa.Show;
  except
    // In caso di errori distruggo la form.
    FineAttesa;
    raise;
  end;
end;

procedure FineAttesa;
begin
  FreeAndNil(FmAttesa);
  // FmAttesa.Free;
  // FmAttesa := nil;
end;

end.
