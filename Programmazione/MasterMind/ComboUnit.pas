unit ComboUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm2 = class(TForm)
    tbScore: TButton;
    Panel1: TPanel;
    Prova1_1: TShape;
    Prova1_2: TShape;
    Prova1_3: TShape;
    Prova1_4: TShape;
    Prova2_1: TShape;
    Prova2_2: TShape;
    Prova2_3: TShape;
    Prova2_4: TShape;
    Prova3_1: TShape;
    Prova3_2: TShape;
    Prova3_3: TShape;
    Prova3_4: TShape;
    Prova4_1: TShape;
    Prova4_2: TShape;
    Prova4_3: TShape;
    Prova4_4: TShape;
    Prova5_1: TShape;
    Prova5_2: TShape;
    Prova5_3: TShape;
    Prova5_4: TShape;
    Prova6_1: TShape;
    Prova6_2: TShape;
    Prova6_3: TShape;
    Prova6_4: TShape;
    Prova7_1: TShape;
    Prova7_2: TShape;
    Prova7_3: TShape;
    Prova7_4: TShape;
    Prova8_1: TShape;
    Prova8_2: TShape;
    Prova8_3: TShape;
    Prova8_4: TShape;
    Prova9_1: TShape;
    Prova9_2: TShape;
    Prova9_3: TShape;
    Prova9_4: TShape;
    Prova10_1: TShape;
    Prova10_2: TShape;
    Prova10_3: TShape;
    Prova10_4: TShape;
    Check1_1: TShape;
    Check1_2: TShape;
    Check1_3: TShape;
    Check1_4: TShape;
    Check2_1: TShape;
    Check2_2: TShape;
    Check2_3: TShape;
    Check2_4: TShape;
    Check3_1: TShape;
    Check3_2: TShape;
    Check3_3: TShape;
    Check3_4: TShape;
    Check4_1: TShape;
    Check4_2: TShape;
    Check4_3: TShape;
    Check4_4: TShape;
    Check5_1: TShape;
    Check5_2: TShape;
    Check5_3: TShape;
    Check5_4: TShape;
    Check6_1: TShape;
    Check6_2: TShape;
    Check6_3: TShape;
    Check6_4: TShape;
    Check7_1: TShape;
    Check7_2: TShape;
    Check7_3: TShape;
    Check7_4: TShape;
    Check8_1: TShape;
    Check8_2: TShape;
    Check8_3: TShape;
    Check8_4: TShape;
    Check9_1: TShape;
    Check9_2: TShape;
    Check9_3: TShape;
    Check9_4: TShape;
    Check10_1: TShape;
    Check10_2: TShape;
    Check10_3: TShape;
    Check10_4: TShape;
    Panel2: TPanel;
    tsColor0: TShape;
    tsColor1: TShape;
    tsColor2: TShape;
    tsColor3: TShape;
    tsColor4: TShape;
    tsColor5: TShape;
    Panel3: TPanel;
    secret1: TShape;
    secret2: TShape;
    secret3: TShape;
    secret4: TShape;
    tlSecretCode: TLabel;
    tlColorPanel: TLabel;
    tbExit: TButton;
    tlSecondi: TLabel;
    nSecondi: TLabel;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure tsColor0MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Prova1_1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbScoreClick(Sender: TObject);
    procedure tbExitClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure BloccaSblocca;
    procedure SalvaSuFile;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  Selezione,Tentativo:integer;
  Combinazione:array[0..3] of 0..5;

implementation

uses MainUnit;

{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
var i,j:integer;
begin
 Timer1.Enabled:=False;
 nSecondi.Caption:='0';
 tbScore.Top:=88;
 tbScore.Enabled:=True;
 for i:=1 to 10 do
  for j:=1 to 4 do
   begin
    TShape(FindComponent('Prova'+IntToStr(i)+'_'+IntToStr(j))).Brush.Color:=clBlack;
    TShape(FindComponent('Check'+IntToStr(i)+'_'+IntToStr(j))).Brush.Color:=clBlack;
    TShape(FindComponent('Prova'+IntToStr(i)+'_'+IntToStr(j))).Enabled:=False;
   end;
 Panel3.Visible:=False;
 with Form1 do
  begin
   teNome.Text:='';
   teNome.Enabled:=True;
   tbRandom.Enabled:=False;
   tbStart.Enabled:=False;
   tlCodGenerato2.Caption:='NON GENERATO'
  end;
end;

procedure TForm2.FormActivate(Sender: TObject);
var i:integer;
begin
 selezione:=-1;
 tentativo:=1;
 for i:=1 to 4 do
   begin
    TShape(FindComponent('Prova'+IntToStr(Tentativo)+'_'+IntToStr(i))).Enabled:=True;
    TShape(FindComponent('secret'+IntToStr(i))).Brush.Color:=colore[secret[i-1]];
   end;
end;


procedure TForm2.tsColor0MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Selezione:=(Sender as TShape).tag;
end;

procedure TForm2.Prova1_1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if selezione<>-1 then
  begin
   (Sender as TShape).Brush.Color:=Colore[selezione];
   Combinazione[(Sender as TShape).Tag]:=selezione;
   if not timer1.Enabled then
    timer1.Enabled:=True;
  end;
end;

procedure TForm2.tbScoreClick(Sender: TObject);
var uguale:boolean;
    i,j:integer;
begin
 for i:=1 to 4 do
  if TShape(FindComponent('Prova'+IntToStr(tentativo)+'_'+IntToStr(i))).Brush.Color=clBlack then
   exit;
 uguale:=true;
 for i:=3 downto 0 do
  begin
   if combinazione[i]=secret[i] then
    TShape(FindComponent('Check'+IntToStr(tentativo)+'_'+IntToStr(i+1))).Brush.Color:=clRed
   else
    for j:=3 downto 0 do
     if combinazione[i]=secret[j] then
       TShape(FindComponent('Check'+IntToStr(tentativo)+'_'+IntToStr(i+1))).Brush.Color:=clWhite;
   if combinazione[i]<>secret[i] then
    uguale:=false;
  end;
 if uguale then
  begin
   Timer1.Enabled:=False;
   ShowMessage('Hai indovinato la combinazione');
   Panel3.Visible:=True;
   tbScore.Enabled:=False;
   SalvaSuFile;
  end
 else
  if tentativo<>10 then
   BloccaSblocca
  else
   begin
    Timer1.Enabled:=False;
    ShowMessage('I tentativi a tua disposizione sono terminati');
    Panel3.Visible:=True;
   end;
end;

procedure TForm2.BloccaSblocca;
var i:integer;
begin
 for i:=1 to 4 do
  begin
   TShape(FindComponent('Prova'+IntToStr(Tentativo)+'_'+IntToStr(i))).Enabled:=False;
   TShape(FindComponent('Prova'+IntToStr(Tentativo+1)+'_'+IntToStr(i))).Enabled:=True;
  end;
 inc(Tentativo);
 selezione:=-1;
 tbScore.Top:=tbScore.Top+40;
end;

procedure TForm2.tbExitClick(Sender: TObject);
begin
 close;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
 nSecondi.Caption:=IntToStr(StrToInt(nSecondi.Caption)+1);
end;

procedure TForm2.SalvaSuFile;
var vittoria:textfile;
    stringa:string;
begin
 AssignFile(vittoria,'vittoria.txt');
 Rewrite(vittoria);
 stringa:=Form1.teNome.Text+' ha scoperto il codice segreto in '+IntToStr(Tentativo)+' tentativi e in un totale di '+nSecondi.Caption+' secondi';
 write(vittoria,stringa);
 CloseFile(vittoria);
end;

end.
