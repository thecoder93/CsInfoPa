unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Menus, ExtCtrls;

type
  lista=^classific;
  classific=record
             nome:string;
             disagio:real;
             next:lista;
            end;
  persona=Record
           nome:string[10];
           rapporto:array[0..7] of integer;
          End;
  elemento=Record
            posX,posY:integer;
            disagio:real;
           end;
  TForm1 = class(TForm)
    dgMappa: TDrawGrid;
    sgTabella: TStringGrid;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Apri1: TMenuItem;
    Salva1: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    tbStart: TButton;
    Timer1: TTimer;
    tlSecondi: TLabel;
    nSecondi: TLabel;
    tbStop: TButton;
    tbReset: TButton;
    tbRandom: TButton;
    tbClassifica: TButton;
    procedure sgTabellaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Apri1Click(Sender: TObject);
    procedure Salva1Click(Sender: TObject);
    procedure dgMappaSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure tbStartClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure tbStopClick(Sender: TObject);
    procedure tbResetClick(Sender: TObject);
    procedure tbRandomClick(Sender: TObject);
    procedure tbClassificaClick(Sender: TObject);
  private
    procedure inserisci(var classificlist:lista;classificato:classific);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  tabella: file of persona;
  ACol2,ARow2:integer;
  turno:integer;
  colore:array[0..7] of TColor;
  posXY:array[0..7]of elemento;
  ideale:array[0..7,0..7] of integer;

implementation

uses InserimentoUnit, classifica;

{$R *.dfm}

procedure TForm1.sgTabellaSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
 ACol2:=ACol;
 ARow2:=ARow;
 Form2.ShowModal;
end;

procedure TForm1.Apri1Click(Sender: TObject);
var invitato:persona;
    i,j:integer;
begin
 if OpenDialog1.Execute then
  begin
   AssignFile(tabella,OpenDialog1.FileName);
   Reset(tabella);
   for i:=0 to 7 do
    begin
     read(tabella,invitato);
     sgTabella.Cells[i+1,0]:=invitato.nome;
     sgTabella.Cells[0,i+1]:=invitato.nome;
     for j:=0 to 7 do
     sgTabella.Cells[i+1,j+1]:=IntToStr(invitato.rapporto[j]);
    end;
   CloseFile(tabella);
   for i:=0 to 7 do
    for j:=0 to 7 do
     ideale[i,j]:=StrToInt(sgTabella.Cells[j+1,i+1]);
  end;
end;

procedure TForm1.Salva1Click(Sender: TObject);
var invitato:persona;
    i,j:integer;
begin
 if SaveDialog1.Execute then
  begin
   AssignFile(tabella,SaveDialog1.FileName);
   Rewrite(tabella);
   for i:=0 to 7 do
    begin
     invitato.nome:=sgTabella.Cells[i+1,0];
     for j:=0 to 7 do
     invitato.rapporto[j]:=StrToInt(sgTabella.Cells[i+1,j+1]);
     write(tabella,invitato);
    end;
  end;
 CloseFile(tabella);
end;

procedure TForm1.dgMappaSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var t:TRect;
begin
 if turno<=7 then
  begin
   t:=dgMappa.CellRect(ACol,ARow);
   posXY[turno].posX:=ARow;
   posXY[turno].posY:=ACol;
   with dgMappa.Canvas do
    begin
     brush.Color:=colore[turno];
     pen.Color:=colore[turno];
     ellipse(t);
     turno:=turno+1;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var invitato:persona;
    i,j:integer;
begin
 AssignFile(tabella,'tabella.partyplanner');
 Reset(tabella);
 for i:=0 to 7 do
  begin
   read(tabella,invitato);
   sgTabella.Cells[i+1,0]:=invitato.nome;
   sgTabella.Cells[0,i+1]:=invitato.nome;
   for j:=0 to 7 do
   sgTabella.Cells[i+1,j+1]:=IntToStr(invitato.rapporto[j]);
  end;
 CloseFile(tabella);
 for i:=0 to 7 do
  for j:=0 to 7 do
   ideale[i,j]:=StrToInt(sgTabella.Cells[j+1,i+1]);
 colore[0]:=clAqua;
 colore[1]:=clRed;
 colore[2]:=clGreen;
 colore[3]:=clFuchsia;
 colore[4]:=clYellow;
 colore[5]:=clGray;
 colore[6]:=clPurple;
 colore[7]:=clBlack;
end;

procedure TForm1.tbStartClick(Sender: TObject);
begin
 if turno<8 then
  ShowMessage('Completa l''inserimento degli invitati! (oppure devi fare il Reset)')
 else
  begin
   dgMappa.Enabled:=False;
   turno:=0;
   timer1.Enabled:=True;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i,j,spostamento:integer;
    disagiotmp,mindisagio:real;
begin
 nSecondi.Caption:=FloatToStr(StrToFloat(nSecondi.Caption)+0.1);
 disagiotmp:=0;
 mindisagio:=0;
 spostamento:=0;
 if turno=8 then
  turno:=0
 else
  begin
   for j:=0 to 7 do
    mindisagio:=mindisagio+abs(sqrt(sqr(posXY[turno].posX-posXY[j].posX)+sqr(posXY[turno].posY-posXY[j].posY))-ideale[turno,j]);
   spostamento:=5;
   if posXY[turno].posX<>0 then // controlla SU
    begin
     for j:=0 to 7 do
      disagiotmp:=disagiotmp+abs(sqrt(sqr((posXY[turno].posX-1)-posXY[j].posX)+sqr(posXY[turno].posY-posXY[j].posY))-ideale[turno,j]);
     if disagiotmp<mindisagio then
      begin
       mindisagio:=disagiotmp;
       spostamento:=2;
      end;
     disagiotmp:=0;
    end;
   if (posXY[turno].posY<>0) and (posXY[turno].posX<>0) then // controlla SU SX
    begin
     for j:=0 to 7 do
      disagiotmp:=disagiotmp+abs(sqrt(sqr((posXY[turno].posX-1)-posXY[j].posX)+sqr((posXY[turno].posY-1)-posXY[j].posY))-ideale[turno,j]);
     if disagiotmp<mindisagio then
      begin
       mindisagio:=disagiotmp;
       spostamento:=1;
      end;
     disagiotmp:=0;
    end;
   if posXY[turno].posY<>0 then // controlla SX
    begin
     for j:=0 to 7 do
      disagiotmp:=disagiotmp+abs(sqrt(sqr(posXY[turno].posX-posXY[j].posX)+sqr((posXY[turno].posY-1)-posXY[j].posY))-ideale[turno,j]);
     if disagiotmp<mindisagio then
      begin
       mindisagio:=disagiotmp;
       spostamento:=4;
      end;
     disagiotmp:=0;
    end;
   if posXY[turno].posX<>19 then  // controlla GIU'
    begin
     for j:=0 to 7 do
      disagiotmp:=disagiotmp+abs(sqrt(sqr((posXY[turno].posX+1)-posXY[j].posX)+sqr(posXY[turno].posY-posXY[j].posY))-ideale[turno,j]);
     if disagiotmp<mindisagio then
      begin
       mindisagio:=disagiotmp;
       spostamento:=8;
      end;
     disagiotmp:=0;
    end;
   if (posXY[turno].posX<>19) and (posXY[turno].posY<>0) then  // controlla GIU' SX
    begin
     for j:=0 to 7 do
      disagiotmp:=disagiotmp+abs(sqrt(sqr((posXY[turno].posX+1)-posXY[j].posX)+sqr((posXY[turno].posY-1)-posXY[j].posY))-ideale[turno,j]);
     if disagiotmp<mindisagio then
      begin
       mindisagio:=disagiotmp;
       spostamento:=7;
      end;
     disagiotmp:=0;
    end;
   if (posXY[turno].posX<>19) and (posXY[turno].posY<>29) then  // controlla GIU' DX
    begin
     for j:=0 to 7 do
      disagiotmp:=disagiotmp+abs(sqrt(sqr((posXY[turno].posX+1)-posXY[j].posX)+sqr((posXY[turno].posY+1)-posXY[j].posY))-ideale[turno,j]);
     if disagiotmp<mindisagio then
      begin
       mindisagio:=disagiotmp;
       spostamento:=9;
      end;
     disagiotmp:=0;
    end;
   if (posXY[turno].posX<>0) and (posXY[turno].posY<>29) then  // controlla SU DX
    begin
     for j:=0 to 7 do
      disagiotmp:=disagiotmp+abs(sqrt(sqr((posXY[turno].posX-1)-posXY[j].posX)+sqr((posXY[turno].posY+1)-posXY[j].posY))-ideale[turno,j]);
     if disagiotmp<mindisagio then
      begin
       mindisagio:=disagiotmp;
       spostamento:=3;
      end;
     disagiotmp:=0;
    end;
   if posXY[turno].posY<>29 then // controlla DX
    begin
     for j:=0 to 7 do
      disagiotmp:=disagiotmp+abs(sqrt(sqr(posXY[turno].posX-posXY[j].posX)+sqr((posXY[turno].posY+1)-posXY[j].posY))-ideale[turno,j]);
     if disagiotmp<mindisagio then
      begin
       mindisagio:=disagiotmp;
       spostamento:=6;
      end;
     disagiotmp:=0;
    end;
   case spostamento of
    1: begin // spostamento SU SX
        posXY[turno].posX:=posXY[turno].posX-1;
        posXY[turno].posY:=posXY[turno].posY-1;
       end;
    2: posXY[turno].posX:=posXY[turno].posX-1; // spostamento SU
    3: begin // spostamento SU DX
        posXY[turno].posX:=posXY[turno].posX-1;
        posXY[turno].posY:=posXY[turno].posY+1;
       end;
    4: posXY[turno].posY:=posXY[turno].posY-1; // spostamento SX
    5: ; // rimane dov'è
    6: posXY[turno].posY:=posXY[turno].posY+1; // spostamento DX
    7: begin // spostamento Giù SX
        posXY[turno].posX:=posXY[turno].posX+1;
        posXY[turno].posY:=posXY[turno].posY-1;
       end;
    8: posXY[turno].posX:=posXY[turno].posX+1; // spostamento Giù
    9: begin // spostamento Giù DX
        posXY[turno].posX:=posXY[turno].posX+1;
        posXY[turno].posY:=posXY[turno].posY+1;
       end;
   end;
   posXY[turno].disagio:=mindisagio;
   turno:=turno+1;
  end;
end;

procedure TForm1.FormPaint(Sender: TObject);
var i,j:integer;
    t:TRect;
begin
 for i:=0 to 19 do
  for j:=0 to 29 do
   begin
    t:=dgMappa.CellRect(j,i);
    with dgMappa.Canvas do
     begin
      brush.Color:=clWhite;
      pen.Color:=clWhite;
      rectangle(t);
     end;
   end;
 for i:=0 to 7 do
  begin
   t:=dgMappa.CellRect(posXY[i].posY,posXY[i].posX);
   with dgMappa.Canvas do
    begin
     brush.Color:=colore[i];
     pen.Color:=colore[i];
     ellipse(t);
    end;
  end;
end;

procedure TForm1.tbStopClick(Sender: TObject);
begin
 timer1.Enabled:=false;
end;

procedure TForm1.tbResetClick(Sender: TObject);
var i:integer;
begin
 if not timer1.Enabled then
  begin
   nSecondi.Caption:='0';
   dgMappa.Enabled:=True;
   for i:=0 to 7 do
    begin
     posXY[i].posX:=-1;
     posXY[i].posY:=-1;
    end;
   turno:=0;
   FormPaint(Self);
  end;
end;

procedure TForm1.tbRandomClick(Sender: TObject);
var i:integer;
begin
 randomize;
 for i:=0 to 7 do
  begin
   posXY[i].posX:=random(20);
   posXY[i].posY:=random(30);
  end;
 turno:=8;
 FormPaint(Self);
end;

procedure TForm1.tbClassificaClick(Sender: TObject);
var classificlist:lista;
    classificato:classific;
    i:integer;
begin
 if not timer1.enabled then
  begin
   Form3.lbClassifica.Clear;
   for i:=0 to 7 do
    begin
     classificato.nome:=sgTabella.Cells[i+1,0];
     classificato.disagio:=posXY[i].disagio;
     inserisci(classificlist,classificato);
    end;
   Form3.Show;
   for i:=0 to 7 do
    if classificlist<>Nil then
     begin
      Form3.lbClassifica.AddItem(IntToStr(i+1)+'.  '+classificlist.nome+'      disagio = '+FloatToStr(round(classificlist.disagio)),Self);
      classificlist:=classificlist^.next;
     end;
  end;
end;

procedure TForm1.inserisci(var classificlist: lista;
  classificato: classific);
var paus:lista;
begin
 if classificlist=Nil then
  begin
   new(classificlist);
   classificlist.disagio:=classificato.disagio;
   classificlist.nome:=classificato.nome;
   classificlist.next:=Nil;
  end
 else
  if classificlist.disagio>=classificato.disagio then
   begin
    new(paus);
    paus.nome:=classificato.nome;
    paus.disagio:=classificato.disagio;
    paus.next:=classificlist;
    classificlist:=paus;
   end
  else
   inserisci(classificlist.next,classificato);
end;

end.
