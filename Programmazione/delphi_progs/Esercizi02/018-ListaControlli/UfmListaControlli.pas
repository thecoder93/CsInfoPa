unit UfmListaControlli;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TfmListaControlli = class(TForm)
    etLista: TMemo;
    btLista: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    procedure btListaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CreaLista( Controllo: TControl; Lista: TStrings;
      Indentazione: integer = 0);
  public
    { Public declarations }
  end;

var
  fmListaControlli: TfmListaControlli;

implementation

{$R *.DFM}

procedure TfmListaControlli.btListaClick(Sender: TObject);
var
  i : integer;
begin
  etLista.Clear;
  // aggiunge alla lista i componenti presenti in
  // tutte le form dell'applicazione
  for i := 0 to Screen.FormCount - 1 do
    CreaLista( Screen.Forms[ i ], etLista.Lines );
end;

procedure TfmListaControlli.CreaLista( Controllo: TControl;
  Lista: TStrings; Indentazione: integer = 0);
var
  i: integer;
begin
  // procedura chiamata ricorsivamente per aggiungere tutti
  // i controlli figli di quello corrente con una certa indentazione.
  Lista.Add( StringOfChar( ' ', Indentazione ) + Controllo.Name +
    ' : ' + Controllo.ClassName );
  // se è un TWinControl può avere figli
  if Controllo is TWinControl then
    for i := 0 to TWinControl( Controllo ).ControlCount - 1 do
    begin
      // richiama la procedura per ogni figlio
      // aumentando l'indentazione di due
      CreaLista( TWinControl( Controllo ).Controls[ i ],
        Lista, Indentazione + 2 );
    end;
end;

procedure TfmListaControlli.FormCreate(Sender: TObject);
begin
  // pulisce la lista
  etLista.Clear;
end;

end.
