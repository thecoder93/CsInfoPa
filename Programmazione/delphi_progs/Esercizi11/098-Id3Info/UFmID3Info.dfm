object FmID3Info: TFmID3Info
  Left = 307
  Top = 189
  BorderStyle = bsDialog
  Caption = 'Informazioni ID3 su %s'
  ClientHeight = 169
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 26
    Height = 13
    Caption = 'Titolo'
  end
  object Label2: TLabel
    Left = 8
    Top = 36
    Width = 31
    Height = 13
    Caption = 'Autore'
  end
  object Label3: TLabel
    Left = 8
    Top = 60
    Width = 29
    Height = 13
    Caption = 'Album'
  end
  object Label4: TLabel
    Left = 8
    Top = 108
    Width = 50
    Height = 13
    Caption = 'Commento'
  end
  object Label5: TLabel
    Left = 8
    Top = 84
    Width = 25
    Height = 13
    Caption = 'Anno'
  end
  object Label6: TLabel
    Left = 266
    Top = 84
    Width = 36
    Height = 13
    Caption = 'Traccia'
  end
  object Label7: TLabel
    Left = 120
    Top = 84
    Width = 35
    Height = 13
    Caption = 'Genere'
  end
  object Label8: TLabel
    Left = 356
    Top = 84
    Width = 10
    Height = 13
    Caption = 'V.'
  end
  object EtTitolo: TEdit
    Left = 72
    Top = 8
    Width = 329
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  object EtAutore: TEdit
    Left = 72
    Top = 32
    Width = 329
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 1
  end
  object EtAlbum: TEdit
    Left = 72
    Top = 56
    Width = 329
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object EtCommento: TEdit
    Left = 72
    Top = 104
    Width = 329
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 3
  end
  object EtAnno: TEdit
    Left = 72
    Top = 80
    Width = 41
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 4
  end
  object EtNrTraccia: TEdit
    Left = 310
    Top = 80
    Width = 33
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
  end
  object EtGenere: TEdit
    Left = 161
    Top = 80
    Width = 97
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 6
  end
  object EtVersioneID3: TEdit
    Left = 371
    Top = 80
    Width = 30
    Height = 21
    TabStop = False
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 7
  end
  object BtOK: TButton
    Left = 326
    Top = 136
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 8
    OnClick = BtOKClick
  end
end
