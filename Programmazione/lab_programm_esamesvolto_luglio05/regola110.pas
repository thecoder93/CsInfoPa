unit regola110;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Menus, ExtCtrls;

type
mat=array[0..49,0..30] of 0..1;
  rec=record
    n:string[15];
  co:string[20];
 end;
  TForm1 = class(TForm)
    DrawGrid1: TDrawGrid;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    SalvaLivello1: TMenuItem;
    CaricaLivello1: TMenuItem;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Timer1: TTimer;
    Button5: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button6: TButton;
    procedure FormPaint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DrawGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure CaricaLivello1Click(Sender: TObject);
    procedure SalvaLivello1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    matrice:mat;
  public
    { Public declarations }
  end;

var
  c:0..1;
  cont:integer;
  f,g:file of mat;
  Form1: TForm1;
  s:string[20];

implementation

{$R *.dfm}
type lista=^ele;
      ele=record
     nome:string[15];
     conf:string[20];
     next:lista;
    end;

procedure TForm1.FormPaint(Sender: TObject);
var r:Trect;
    i,j:integer;
begin
 for i:=0 to 49 do
  for j:=0 to 30 do begin
    c:=matrice[i,j];
    case c of
 0:begin
   r:=DrawGrid1.CellRect(j,i);
 with DrawGrid1.Canvas do begin
  Brush.Color:=clWhite;
  Pen.Color:=clWhite;
  rectangle(r);
  end;
  end;
 1:begin
    r:=DrawGrid1.CellRect(j,i);
 with DrawGrid1.Canvas do begin
  Brush.Color:=clBlack;
  Pen.Color:=clBlack;
  rectangle(r);
  end;
  end;
 end;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var i,j:integer;
begin
for i:=0 to 49 do
   for j:=0 to 30 do begin
    matrice[i,j]:=0;
  end;
end;

procedure TForm1.DrawGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var t:Trect;
begin
 if (ARow>1) and (ARow<=49) then
 ShowMessage('Puoi selezionare solo caselle nella prima riga!') else begin
 if matrice[0,Acol]=0 then
  matrice[0,Acol]:=1 else
 if matrice[0,Acol]=1 then
  matrice[0,Acol]:=0;
 FormPaint(sender);
 end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i,j:integer;
begin
 randomize;
 i:=0;
 for j:=0 to 30 do begin
  matrice[i,j]:=random(2);
  end;
  FormPaint(sender);
end;

procedure TForm1.CaricaLivello1Click(Sender: TObject);
begin
 if OpenDialog1.Execute then begin
  AssignFile(g,OpenDialog1.FileName);
 if fileexists(OpenDialog1.FileName) then
  reset(g);
  read(g,matrice);
 closefile(g);
 FormPaint(sender);
 end;
end;

procedure TForm1.SalvaLivello1Click(Sender: TObject);
begin
  if Edit2.Text<>'' then begin
  AssignFile(f,Edit2.Text+'.cel');
 rewrite(f);
 write(f,matrice);
 closefile(f);
 end else
 Showmessage('Inserisci un nome per la configurazione!');
end;

procedure TForm1.Button4Click(Sender: TObject);
var i,j:integer;
begin
  for i:=0 to 49 do
   for j:=0 to 30 do
    matrice[i,j]:=0;
    FormPaint(sender);
  Edit1.Text:='';
  Edit2.Text:='';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i,j:integer;
begin
 inc(cont);
 if (cont>0) and (cont<=49) then begin
  i:=cont;
   if j=0 then
    j:=30;
   if j=30 then
    j:=0;
    for j:=0 to 30 do begin
   if (matrice[i-1,j-1]=1) and (matrice[i-1,j]=1) and (matrice[i-1,j+1]=1) then
    matrice[i,j]:=0;
   if (matrice[i-1,j-1]=1) and (matrice[i-1,j]=1) and (matrice[i-1,j+1]=0) then
    matrice[i,j]:=1;
   if (matrice[i-1,j-1]=1) and (matrice[i-1,j]=0) and (matrice[i-1,j+1]=1) then
    matrice[i,j]:=1;
   if (matrice[i-1,j-1]=1) and (matrice[i-1,j]=0) and (matrice[i-1,j+1]=0) then
    matrice[i,j]:=0;
   if (matrice[i-1,j-1]=0) and (matrice[i-1,j]=1) and (matrice[i-1,j+1]=1) then
    matrice[i,j]:=1;
   if (matrice[i-1,j-1]=0) and (matrice[i-1,j]=1) and (matrice[i-1,j+1]=0) then
    matrice[i,j]:=1;
   if (matrice[i-1,j-1]=0) and (matrice[i-1,j]=0) and (matrice[i-1,j+1]=1) then
    matrice[i,j]:=1;
   if (matrice[i-1,j-1]=0) and (matrice[i-1,j]=0) and (matrice[i-1,j+1]=0) then
    matrice[i,j]:=0;
   end;
  FormPaint(sender);
  end;
end;

procedure ins_ord(var l:lista;g:rec);
var aus:lista;
 begin
  if l=nil then begin
   new(l);
  l^.nome:=g.n;
  l^.conf:=g.co;
  l^.next:=nil;
 end else
  if l^.nome<=g.n then
  ins_ord(l^.next,g) else begin
  aus:=l;
  new(l);
  l^.nome:=g.n;
  l^.conf:=g.co;
  l^.next:=aus;
  end;
 end;

procedure dafilealista(var l:lista);
var h:file of rec;
    c:rec;
begin
  l:=nil;
  assignfile(h,'history.txt');
  if fileexists('history.txt') then begin
   reset(h);
   while not eof(h) do begin
    read(h,c);
    ins_ord(l,c);end;
    closefile(h);
   end;
   end;

procedure dalistaafile(l:lista);
var h:file of rec;
    c:rec;
    i:integer;
  begin
   assignfile(h,'history.txt');
    i:=1;
    rewrite(h);
    while (l<>nil) and (i<=10) do begin
     c.co:=l^.conf;
     c.n:=l^.nome;
    write(h,c);
    inc(i);
    l:=l^.next;
    end;
   closefile(h);
   end; 

procedure TForm1.Button5Click(Sender: TObject);
var h:file of rec;
    persona:rec;
begin
 if Button5.Caption='START' then begin
  if Edit1.Text='' then
  Showmessage('Inserisci il tuo nome!')
  else if Edit2.Text='' then
  Showmessage('Dai un nome alla configurazione!') else begin
  persona.n:=Edit1.Text;
  persona.co:=Edit2.Text;
 assignfile(h,'history.txt');
 if fileexists('history.txt') then begin
  reset(h);
  seek(h,filesize(h));
  end else
  rewrite(h);
  write(h,persona);
  closefile(h);
 Timer1.Enabled:=true;
 cont:=0;
 Button5.Caption:='STOP';
 end;
 end else begin
 Timer1.Enabled:=false;
 Button5.Caption:='START';
 end;
end;

procedure TForm1.Button6Click(Sender: TObject);
var graduatoria:TForm;
    l:lista;
    i,k:integer;
    spazio1,spazio2:string[5];
begin
 graduatoria:=TForm.Create(self);
 graduatoria.Caption:='History ultimi giocatori';
 graduatoria.Left:=250;
 graduatoria.Top:=240;
 graduatoria.ClientHeight:=400;
 graduatoria.Color:=clYellow;
 dafilealista(l);
 dalistaafile(l);
 spazio1:='°: ';
 spazio2:='   ';
 k:=5;
 i:=1;
 while (l<>nil) and (i<=10) do begin
 with TLabel.Create(self) do begin
  parent:=graduatoria;
  Caption:=IntToStr(i)+spazio1+l^.nome+spazio2+l^.conf;
  Font.Name:='Comic Sans MS';
  Font.Color:=clPurple;
  Font.Height:=30;
  Left:=20;
  Height:=35;
  Top:=k+(i-1)*height+15;
  end;
  l:=l^.next;
  inc(i);
  end;
  graduatoria.ShowModal;
  graduatoria.Free;
end;

end.
