unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, Buttons, StdCtrls;

type
  matrice=array[0..20,0..12] of 0..4;
  persona = record
             nome: string[20];
             punteggio: integer;
             tempo: integer;
            end;
  punt = ^elemento;
  elemento = record
              rec: persona;
              next: punt;
             end;
  TForm1 = class(TForm)
    DrawGrid1: TDrawGrid;
    Timer1: TTimer;
    SpeedButton1: TSpeedButton;
    tlSecondi: TLabel;
    nSecondi: TLabel;
    Timer2: TTimer;
    sbDX: TSpeedButton;
    sbSX: TSpeedButton;
    tlPunteggio: TLabel;
    nPunteggio: TLabel;
    tlNomeGiocatore: TLabel;
    tlNome: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    sbClassifica: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure sbSXClick(Sender: TObject);
    procedure tlNomeClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sbClassificaClick(Sender: TObject);
  private
    procedure colora(i,j,k:integer);
    function controllo:boolean;
    procedure tripletta;
    procedure AggiornaClassifica;
    procedure Inserisci(var p: punt;var g: persona);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  mappa:matrice;
  cadendo:boolean;
  colore:TColor;
  t:TRect;
  posX,posY,posCOL:integer;

implementation

uses Classifica;

{$R *.dfm}

procedure TForm1.colora(i, j, k: integer);
begin
 case k of
  0: colore:=clWhite;
  1: colore:=clRed;
  2: colore:=clBlue;
  3: colore:=clGreen;
  4: colore:=clYellow;
 end;
 t:=DrawGrid1.CellRect(j,i);
 with DrawGrid1.Canvas do
  begin
   brush.color:=colore;
   pen.Color:=colore;
   rectangle(t);
  end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var i,j:integer;
begin
 randomize;
 Timer1.Enabled:=False;
 Timer2.Enabled:=False;
 nSecondi.Caption:='0';
 nPunteggio.Caption:='0';
 for i:=0 to 20 do
  for j:=0 to 12 do
   begin
    mappa[i,j]:=0;
    colora(i,j,0);
   end;
 Timer1.Enabled:=True;
 Timer2.Enabled:=True;
 cadendo:=False;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
 if not cadendo then
  if controllo then
   ShowMessage('Game Over!')
  else
   begin
    posX:=0;
    posY:=random(13);
    posCOL:=random(4)+1;
    cadendo:=true;
   end
 else
  if (mappa[posX+1,posY]=0) and (posX<20) then
   posX:=posX+1
  else
   begin
    mappa[posX,posY]:=posCOL;
    tripletta;
    cadendo:=false;
   end;
 FormPaint(self);
end;

procedure TForm1.FormPaint(Sender: TObject);
var i,j:integer;
begin
 for i:=0 to 20 do
  for j:=0 to 12 do
   colora(i,j,mappa[i,j]);
 colora(posX,posY,posCOL);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
 nSecondi.Caption:=IntToStr(StrToInt(nSecondi.Caption)+1);
end;

function TForm1.controllo: boolean;
var j:integer;
begin
 controllo:=false;
 for j:=0 to 12 do
  if mappa[0,j]<>0 then
   begin
    controllo:=true;
    timer1.Enabled:=false;
    timer2.Enabled:=false;
    AggiornaClassifica;
   end;
end;

procedure TForm1.sbSXClick(Sender: TObject);
begin
 case (Sender as TSpeedButton).Tag of
  0: if (mappa[posX,posY-1]=0) and (posY>=1)then
      posY:=posY-1;
  1: if (mappa[posX,posY+1]=0) and (posY<=11)then
      posY:=posY+1;
 end;
end;

procedure TForm1.tripletta;
var i:integer;
begin
 if ((mappa[posX,posY-1]=posCOL) and (mappa[posX,posY+1]=posCOL)) and ((posY<>0) and (posY<>12)) then
  begin
   nPunteggio.Caption:=IntToStr(StrToInt(nPunteggio.Caption)+1);
   for i:=posX downto 2 do
    begin
     mappa[i,posY-1]:=mappa[i-1,posY-1];
     mappa[posX,posY]:=0;
     mappa[i,posY+1]:=mappa[i-1,posY+1];
    end;
  end
 else
  if ((mappa[posX,posY-1]=posCOL) and (mappa[posX,posY-2]=posCOL)) and (posY<>0) then
   begin
     nPunteggio.Caption:=IntToStr(StrToInt(nPunteggio.Caption)+1);
     for i:=posX downto 2 do
      begin
       mappa[i,posY-1]:=mappa[i-1,posY-1];
       mappa[i,posY-2]:=mappa[i-1,posY-2];
       mappa[posX,posY]:=0;
      end;
   end
  else
   if ((mappa[posX,posY+1]=posCOL) and (mappa[posX,posY+2]=posCOL)) and (posY<>12) then
     begin
       nPunteggio.Caption:=IntToStr(StrToInt(nPunteggio.Caption)+1);
       for i:=posX downto 2 do
        begin
         mappa[posX,posY]:=0;
         mappa[i,posY+1]:=mappa[i-1,posY+1];
         mappa[i,posY+2]:=mappa[i-1,posY+2];
        end;
     end
end;

procedure TForm1.tlNomeClick(Sender: TObject);
begin
 if nSecondi.Caption='0' then
  begin
   tlNome.Visible:=False;
   Edit1.Visible:=True;
   Button1.Visible:=True;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 if Edit1.Text<>'' then
  begin
   Edit1.Visible:=False;
   Button1.Visible:=False;
   tlNome.Caption:=Edit1.Text;
   tlNome.Visible:=True;
  end;
end;

procedure TForm1.AggiornaClassifica;
var g: persona;
    f: file of persona;
begin
 g.nome:= tlNome.Caption;
 g.punteggio:= StrToInt(nPunteggio.Caption);
 g.tempo:=StrToInt(nSecondi.Caption);
 assignfile(f,'classifica.treperuno');
  if fileexists('classifica.treperuno') then
   begin
    reset(f);
    seek(f,filesize(f));
   end
  else
    rewrite(f);
  write(f,g);
  closefile(f);
end;

procedure TForm1.Inserisci(var p: punt; var g: persona);
var paus:punt;
begin
 if p=nil then
  begin
   new(p);
   p^.rec:=g;
   p^.next:=nil;
  end
 else
   if p^.rec.punteggio<=g.punteggio then
    begin
     new(paus);
     paus^.rec:=g;
     paus^.next:=p;
     p:=paus;
    end
   else
    Inserisci(p^.next,g);
end;

procedure TForm1.sbClassificaClick(Sender: TObject);
var g: persona;
    f: file of persona;
    p:punt;
    i:integer;
begin
 Form2.ListBox1.Clear;
 p:=Nil;
 AssignFile(f,'classifica.treperuno');
 Reset(f);
 while not eof(f) do
  begin
   read(f,g);
   inserisci(p,g);
  end;
 closefile(f);
 Form2.show;
 for i:=1 to 10 do
  with Form2 do
   if p<>Nil then
    begin
     ListBox1.AddItem(IntToStr(i)+'. '+p^.rec.nome+'     '+IntToStr(p^.rec.punteggio)+'     '+IntToStr(p^.rec.tempo),Self);
     p:=p^.next;
    end;
end;

end.
