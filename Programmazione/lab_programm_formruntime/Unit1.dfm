object Form1: TForm1
  Left = 192
  Top = 150
  Width = 544
  Height = 375
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 168
    Top = 104
    Width = 89
    Height = 41
    Caption = 'Modale'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 168
    Top = 184
    Width = 121
    Height = 49
    Caption = 'Non Modale'
    TabOrder = 1
    OnClick = Button2Click
  end
  object tantefinestre: TButton
    Left = 336
    Top = 88
    Width = 81
    Height = 57
    Caption = 'Tante finestre'
    TabOrder = 2
    OnClick = tantefinestreClick
  end
  object Button3: TButton
    Left = 24
    Top = 40
    Width = 73
    Height = 49
    Hint = 'Mostra la Form3 creata al'#39'avvio dell'#39'applicazione'
    Caption = 'MostraForm3'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 336
    Top = 232
    Width = 97
    Height = 57
    Hint = 'Si vuole mostrare solo una copia di una form non modale'
    Caption = 'Singola Istanza'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Button4Click
  end
end
