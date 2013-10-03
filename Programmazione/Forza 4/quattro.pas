unit quattro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Buttons, ExtCtrls, StdCtrls,sts;

type
  TForm1 = class(TForm)
    DrawGrid1: TDrawGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Button3: TButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    matrice:array[0..6,0..7]of 0..2;
    turno:boolean;
    winr,winb:integer;
    procedure controllo(var conto:integer; i,j,movx,movy,colore:integer);
    procedure vittoria(q:integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.SpeedButton1Click(Sender: TObject);
var i,num:integer;
    f:1..2;
    t:Trect;
    g:Tcolor;
begin
i:=5;
if turno then
  begin
  g:=clred;
  f:=1;
  end
else
  begin
  g:=clblue;
  f:=2;
  end;


while (i>=0) and (matrice[(Sender as TSpeedButton).tag ,i]<>0) do
  i:=i-1;
  if i>=0 then
    begin
    t:=drawgrid1.cellrect((Sender as TSpeedButton).tag,i);
    with drawgrid1.canvas do
      begin
      brush.color:=g;
      pen.color:=clgray;
      ellipse(t);
      end;
    num:=1;
    controllo(num,i-1,(sender as Tspeedbutton).Tag-1,-1,-1,f);//controllo diagonale principale
    controllo(num,i+1,(sender as Tspeedbutton).Tag+1,1,1,f);//controllo diagonale principale
    if num=4 then
      vittoria(f)
    else
      begin
      num:=1;
      controllo(num,i-1,(sender as Tspeedbutton).Tag+1,-1,1,f);//controllo diagonale secondaria
      controllo(num,i+1,(sender as tspeedbutton).Tag-1,1,-1,f);//controllo diagonale secondaria
      if num=4 then
        vittoria(f)
      else
        begin
        num:=1;
        controllo(num,i,(sender as Tspeedbutton).Tag-1,0,-1,f);//controllo orizzontale
        controllo(num,i,(sender as Tspeedbutton).Tag+1,0,1,f);//controllo orizzontale
        if num=4 then
          vittoria(f)
        else
          begin
          num:=1;
          controllo(num,i+1,(sender as Tspeedbutton).Tag,1,0,f);//controllo verticale
          if num=4 then
            vittoria(f);
          end;
        end;
      end;
    if turno then
      matrice[(Sender as TSpeedButton).tag,i]:=1
    else
      matrice[(Sender as TSpeedButton).tag,i]:=2;
    turno:=not turno;
    end;
end;

procedure TForm1.FormPaint(Sender: TObject);
var i,j:integer; g:Tcolor;
begin
for i:=0 to 5 do
  for j:=0 to 6 do
    begin
    case matrice[j,i] of
    0:g:=clwhite;
    1:g:=clred;
    2:g:=clblue;
    end;

  drawgrid1.canvas.brush.color:=g;
  drawgrid1.canvas.pen.color:=g;
  drawgrid1.canvas.ellipse(drawgrid1.cellrect(j,i));
  end;

end;

procedure TForm1.controllo(var conto: integer; i, j, movx, movy,colore: integer);
begin
if (i>=0) and (i<=5) and (j<=6) and (j>=0) and (conto<4) then
  if matrice[j,i]=colore then
    begin
    conto:=conto+1;
    controllo(conto,i+movx,j+movy,movx,movy,colore);
    end;
end;

procedure TForm1.vittoria(q:integer);
var i:integer;
begin
for i:=0 to Componentcount-1 do
  if components[i] is TSpeedButton then
    TSpeedButton(components[i]).Enabled:=false;

if q=1 then
  begin
  label2.Font.Color:=clred;
  label2.Caption:='Forza 4!! Ha vinto il rosso';
  winr:=winr+1
  end
else if q=2 then
  begin
  label2.Font.Color:=clblue;
  label2.Caption:='Forza 4!! Ha vinto il blu';
  winb:=winb+1
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i,j:integer;
    p:Trect;
begin
for i:=0 to 5 do
  for j:=0 to 6 do
  begin
  matrice[j,i]:=0;
  drawgrid1.Canvas.pen.Color:=clwhite;
  drawgrid1.Canvas.Brush.Color:=clwhite;
  p:=drawgrid1.CellRect(j,i);
  drawgrid1.Canvas.Ellipse(p);
  end;

for i:=0 to componentcount-1 do
  if components[i] is tspeedbutton then
    tspeedbutton(components[i]).Enabled:=true;

label2.Caption:='';
end;

procedure TForm1.Button2Click(Sender: TObject);
var stat:Tform2;
begin
stat:= TForm2.create(self);
stat.aggiorna(winr,winb);
stat.showmodal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
winr:=0;
winb:=0;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
showmessage('Grazie per aver giocato a Forza 4!!   Copyright 2005 by Mauro Zambito');
form1.Close;
end;

end.
