unit UFmMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFmMain = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Memo1: TMemo;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AppShowHint(var HintStr: String;
      var CanShow: Boolean; var HintInfo: THintInfo);
  public
    { Public declarations }
  end;

var
  FmMain: TFmMain;

implementation

{$R *.DFM}

procedure TFmMain.FormCreate(Sender: TObject);
begin
  // Collego la procedura per gestire la
  // visualizzazione degli Hint.
  Application.OnShowHint := AppShowHint;
end;

type
  // Per accedere ai membri protected di TControl.
  THackControl = class(TControl);

procedure TFmMain.AppShowHint(var HintStr: String;
  var CanShow: Boolean; var HintInfo: THintInfo);
var
  TmpBmp: TBitmap;
  Ctrl: THackControl;
begin
  inherited;
  // Agisco sugli Edit, ma non sul Memo (che è un TCustomEdit).
  if (HintInfo.HintControl is TCustomEdit) and not
     (HintInfo.HintControl is TMemo) then begin
    // Guadagno l'accesso alle proprietà protette del controllo.
    Ctrl := THackControl(HintInfo.HintControl);
    // Verifico se il controllo mostra tutto il testo,
    // misurandone la larghezza su un Canvas temporaneo.
    TmpBmp := TBitmap.Create;
    try
      // Per chimare TextWidth non serve spazio, quindi
      // basta anche un Canvas puntiforme.
      TmpBmp.Width := 1;
      TmpBmp.Height := 1;
      // Applico font e attributi del controllo
      // per rendere più precisa la misurazione.
      TmpBmp.Canvas.Font := Ctrl.Font;
      // Il "- 2" serve per tenere conto di un
      // bordo supplementare.
      if TmpBmp.Canvas.TextWidth(Ctrl.Text) >
         (Ctrl.ClientWidth - 2) then begin
        // Se il controllo aveva un suo Hint, ci accodo il
        // contenuto, altrimenti mostro solo quello.
        if HintStr <> '' then
          HintStr := HintStr + #13#10 + '[' + Ctrl.Text + ']'
        else
          HintStr := Ctrl.Text;
      end;
    finally
      TmpBmp.Free;
    end;
  end;
end;

end.
