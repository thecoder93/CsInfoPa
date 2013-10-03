unit UfmFloatToBin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfmFloatToBin = class(TForm)
    etNumero: TEdit;
    lbBinario: TLabel;
    rgKind: TRadioGroup;
    procedure etNumeroChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmFloatToBin: TfmFloatToBin;

implementation

{$R *.DFM}

uses
  Stringhe;

procedure TfmFloatToBin.etNumeroChange(Sender: TObject);
var
  s: string;
  sing: single;
  doub: double;
  ext: extended;
begin
  // uso TextToFloat che restituisce false se la stringa non contiene
  // un numero valido, e poi FloatToBin con il parametro del tipo
  // indicato dal RadioGroup.
  ext := 0;
  s := etNumero.Text;
  if TextToFloat( pchar( s ), ext, fvExtended ) then
  case rgKind.ItemIndex of
    0:
      begin
        sing := ext;
        s := FloatToBin( sing );
      end;
    1:
      begin
        doub := ext;
        s := FloatToBin( doub );
      end;
    2: s := FloatToBin( ext );
  end
  else
    // non mostro nulla se il numero non è valido
    s := '';
  // alla fine assegno il risultato alla label
  lbBinario.Caption := s;
end;

procedure TfmFloatToBin.FormCreate(Sender: TObject);
begin
  // inizializzo il campo di testo
  etNumero.Text := '0';
end;

end.
