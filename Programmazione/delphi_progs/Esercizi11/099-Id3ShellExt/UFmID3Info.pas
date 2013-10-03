unit UFmID3Info;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFmID3Info = class(TForm)
    Label1: TLabel;
    EtTitolo: TEdit;
    Label2: TLabel;
    EtAutore: TEdit;
    Label3: TLabel;
    EtAlbum: TEdit;
    Label4: TLabel;
    EtCommento: TEdit;
    Label5: TLabel;
    EtAnno: TEdit;
    Label6: TLabel;
    EtNrTraccia: TEdit;
    Label7: TLabel;
    EtGenere: TEdit;
    Label8: TLabel;
    EtVersioneID3: TEdit;
    BtOK: TButton;
    procedure BtOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure MostraInfoID3(NomeFile: string);

//var
//  FmMp3Info: TFmMp3Info;

implementation

{$R *.DFM}

uses
  ID3Tag;

procedure MostraInfoID3(NomeFile: string);
var
  ID3: TID3TagInfo;
begin
  ID3 := TID3TagInfo.Create;
  try
    ID3.CaricaTag(NomeFile);
    if ID3.TagValido then begin
      with TFmID3Info.Create(Application) do begin
        Caption := Format(Caption,
          [ExtractFileName(NomeFile)]);
        EtTitolo.Text := ID3.Titolo;
        EtAutore.Text := ID3.Autore;
        EtAlbum.Text := ID3.Album;
        EtAnno.Text := IntToStr(ID3.Anno);
        EtGenere.Text := ID3.Genere;
        EtNrTraccia.Text := IntToStr(ID3.NumeroTraccia);
        EtVersioneID3.Text := Format('1.%d', [ID3.Versione]);
        EtCommento.Text := ID3.Commento;
        Show;
      end;
    end
    else
      MessageDlg('Informazioni ID3 non presenti nel file ' + NomeFile,
        mtError, [mbOK], 0); 
  finally
    ID3.Free;
  end;
end;

procedure TFmID3Info.BtOKClick(Sender: TObject);
begin
  Close;
end;

procedure TFmID3Info.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
