unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, ExtCtrls;

type
  livello=array[0..6,0..6] of 0..1;
  persona=Record
           nome:string[15];
           punti:integer;
          end;
  lista=^elemento;
  elemento=Record
            inf:persona;
            next:lista;
           End;
  TForm1 = class(TForm)
    DrawGrid1: TDrawGrid;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    SalvaLivello1: TMenuItem;
    CaricaLivello1: TMenuItem;
    Start1: TMenuItem;
    Classifica1: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    tlPunteggio: TLabel;
    nPunteggio: TLabel;
    Timer1: TTimer;
    tlSecondi: TLabel;
    nSecondi: TLabel;
    teNome: TEdit;
    tlNome: TLabel;
    Reset1: TMenuItem;
    procedure DrawGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SalvaLivello1Click(Sender: TObject);
    procedure CaricaLivello1Click(Sender: TObject);
    procedure Start1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Classifica1Click(Sender: TObject);
    procedure Reset1Click(Sender: TObject);
  private
    procedure vittoria;
    procedure sconfitta;
    procedure AggiornaClassifica;
    procedure inserisci(var classlist:lista; classificato:persona);

    { Private declarations }
  public
    procedure visualizza;
    { Public declarations }
  end;

var
  Form1: TForm1;
  griglia:livello;
  colore:array[0..1] of TColor;
  giocando:boolean;
  posX,posY:integer;
  classlist:lista;

implementation

uses ClassificaUnit;

{$R *.dfm}

procedure TForm1.DrawGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var t:TRect;
begin
 if not giocando then
  begin
   t:=DrawGrid1.CellRect(Acol,ARow);
   with DrawGrid1.Canvas do
    begin
     brush.Color:=clBlue;
     pen.Color:=clBlack;
     ellipse(t);
    end;
   griglia[ARow,ACol]:=1;
  end
 else
  if (griglia[ARow,ACol]=0) and (griglia[posX,posY]=1) then  //codice per mangiare la pedina
   begin
    if (ARow=posX+2) and (griglia[posX+1,posY]=1) then  //mangia in su
     begin
      griglia[posX,posY]:=0;
      griglia[ARow,ACol]:=1;
      griglia[posX+1,posY]:=0;
      nPunteggio.Caption:=IntToStr(StrToInt(nPunteggio.Caption)+1);
     end
    else
     if (ARow=posX-2) and (griglia[posX-1,posY]=1) then //mangia in giù
      begin
       griglia[posX,posY]:=0;
       griglia[ARow,ACol]:=1;
       griglia[posX-1,posY]:=0;
       nPunteggio.Caption:=IntToStr(StrToInt(nPunteggio.Caption)+1);
      end
     else
      if (ACol=posY-2) and (griglia[posX,posY-1]=1) then // mangia a sx
       begin
        griglia[posX,posY]:=0;
        griglia[ARow,ACol]:=1;
        griglia[posX,posY-1]:=0;
        nPunteggio.Caption:=IntToStr(StrToInt(nPunteggio.Caption)+1);
       end
      else
       if (ACol=posY+2) and (griglia[posX,posY+1]=1) then // mangia dx
        begin
         griglia[posX,posY]:=0;
         griglia[ARow,ACol]:=1;
         griglia[posX,posY+1]:=0;
         nPunteggio.Caption:=IntToStr(StrToInt(nPunteggio.Caption)+1);
        end;
    posX:=ARow;
    posY:=ACol;
   end
  else
   begin
    posX:=ARow;
    posY:=ACol;
   end;
 FormPaint(Self);
 if giocando then vittoria;
end;

procedure TForm1.FormCreate(Sender: TObject);
var i,j:shortint;
begin
 giocando:=false;
 colore[0]:=clSilver;
 colore[1]:=clBlue;
 for i:=0 to 6 do
  for j:=0 to 6 do
   griglia[i,j]:=0;
end;

procedure TForm1.FormPaint(Sender: TObject);
var i,j:shortint;
    t:TRect;
begin
 for i:=0 to 6 do
  for j:=0 to 6 do
   begin
    t:=DrawGrid1.CellRect(j,i);
    if griglia[i,j]=1 then
     with DrawGrid1.Canvas do
      begin
       brush.Color:=colore[1];
       pen.Color:=clBlack;
       ellipse(t);
      end
    else
     with DrawGrid1.Canvas do
      begin
       brush.Color:=colore[0];
       pen.Color:=clBlack;
       rectangle(t);
      end;
   end;
 if griglia[posX,posY]=1 then
  begin
   t:=DrawGrid1.CellRect(posY,posX);
   with DrawGrid1.Canvas do
    begin
     brush.Color:=clRed;
     pen.Color:=clBlack;
     ellipse(t);
    end;
  end;
end;

procedure TForm1.SalvaLivello1Click(Sender: TObject);
var f:file of livello;
begin
 if SaveDialog1.Execute then
  begin
   AssignFile(f,SaveDialog1.FileName);
   Rewrite(f);
   write(f,griglia);
   CloseFile(f);
  end;
end;

procedure TForm1.CaricaLivello1Click(Sender: TObject);
var f:file of livello;
begin
 if OpenDialog1.Execute then
  begin
   AssignFile(f,OpenDialog1.FileName);
   Reset(f);
   Read(f,griglia);
   CloseFile(f);
   FormPaint(Self);
  end;
end;

procedure TForm1.Start1Click(Sender: TObject);
var i,j:shortint;
    controllo:boolean;
begin
 controllo:=false;
 timer1.Enabled:=false;
 nSecondi.Caption:='0';
 nPunteggio.Caption:='0';
 teNome.Enabled:=true;
 for i:=0 to 6 do
  for j:=0 to 6 do
   if griglia[i,j]=1 then
    controllo:=true;
 if not controllo then
  ShowMessage('Devi prima posizionare almeno una pedina!')
 else
  if teNome.Text='' then
   ShowMessage('Inserisci il nome del giocatore!')
  else
   begin
    teNome.Enabled:=false;
    giocando:=true;
    timer1.Enabled:=true;
   end;
 FormPaint(Self);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 if nSecondi.Caption='20' then
  sconfitta
 else
  nSecondi.Caption:=FloatToStr(StrToFloat(nSecondi.Caption)+0.5);
end;

procedure TForm1.vittoria;
var i,j,cont:shortint;
begin
 cont:=0;
 for i:=0 to 6 do
  for j:=0 to 6 do
   if griglia[i,j]=1 then
    inc(cont);
 if cont=1 then
  begin
   timer1.Enabled:=false;
   if (posX=3) and (posY=3) then
    nPunteggio.Caption:=IntToStr(StrToInt(nPunteggio.Caption)+5);
   DrawGrid1.Enabled:=False;
   ShowMessage('Hai Vinto');
   AggiornaClassifica;
   FormPaint(Self);
  end;
end;

procedure TForm1.sconfitta;
begin
 timer1.Enabled:=false;
 DrawGrid1.Enabled:=False;
 ShowMessage('Game Over! E'' finito il tempo!');
 FormPaint(Self);
end;

procedure TForm1.AggiornaClassifica;
var classifica:file of persona;
    classificato:persona;
begin
 classificato.nome:=teNome.Text;
 classificato.punti:=StrToInt(nPunteggio.Caption);
 AssignFile(classifica,'classifica.gas');
 if FileExists('classifica.gas') then
  Reset(classifica)
 else
  Rewrite(classifica);
 Seek(classifica,filesize(classifica));
 write(classifica,classificato);
 CloseFile(classifica);
end;

procedure TForm1.Classifica1Click(Sender: TObject);
var classifica:file of persona;
    classificato:persona;
begin
 classlist:=nil;
 AssignFile(classifica,'classifica.gas');
 if FileExists('classifica.gas') then
  begin
   Reset(classifica);
   while not eof(classifica) do
    begin
     read(classifica,classificato);
     inserisci(classlist,classificato);
    end;
  end;
 visualizza;
end;

procedure TForm1.inserisci(var classlist: lista; classificato: persona);
var paux:lista;
begin
 if classlist=nil then
  begin
   new(classlist);
   classlist^.inf:=classificato;
   classlist^.next:=nil;
  end
 else
  if classlist^.inf.punti<=classificato.punti then
   begin
    new(paux);
    paux^.inf:=classificato;
    paux^.next:=classlist;
    classlist:=paux;
   end
  else inserisci(classlist^.next,classificato);
end;

procedure TForm1.visualizza;
var i:integer;
    new:tform2;
begin
 new:=Tform2.Create(Application);
 with new do
 for i:=1 to 5 do
  if classlist<>nil then
     begin
      TLabel(FindComponent('tlGiocatore'+IntToStr(i))).Caption:=classlist^.inf.nome;
      TLabel(FindComponent('tlPunti'+IntToStr(i))).Caption:=IntToStr(classlist^.inf.punti);
      classlist:=classlist^.next;
     end
    else
     begin
      TLabel(FindComponent('tlGiocatore'+IntToStr(i))).Caption:='Giocatore '+IntToStr(i);
      TLabel(FindComponent('tlPunti'+IntToStr(i))).Caption:='0';
     end;
 try
  new.ShowModal;
 finally
  new.Free;
 end;
end;

procedure TForm1.Reset1Click(Sender: TObject);
var i,j:shortint;
begin
 timer1.Enabled:=false;
 DrawGrid1.Enabled:=true;
 giocando:=false;
 posX:=-1;
 posY:=-1;
 teNome.Text:='';
 teNome.Enabled:=true;
 nSecondi.Caption:='0';
 nPunteggio.Caption:='0';
 for i:=0 to 6 do
  for j:=0 to 6 do
   griglia[i,j]:=0;
 FormPaint(Self);
end;

end.
