object FmStampaMemo: TFmStampaMemo
  Left = 192
  Top = 107
  Width = 524
  Height = 401
  Caption = 'FmStampaMemo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 6
    Width = 98
    Height = 13
    Caption = 'Stampanti disponibili:'
  end
  object BtStampa: TButton
    Left = 4
    Top = 343
    Width = 165
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Stampa'
    TabOrder = 0
    OnClick = BtStampaClick
  end
  object LsStampanti: TListBox
    Left = 4
    Top = 24
    Width = 163
    Height = 253
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 13
    TabOrder = 1
  end
  object EtTesto: TMemo
    Left = 172
    Top = 4
    Width = 340
    Height = 364
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'la rana in spagna'
      'gracida in campagna'
      ''
      'the rain in Spain'
      'stays mostly in the plains')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object BtFont: TButton
    Left = 4
    Top = 313
    Width = 165
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Cambia Font'
    TabOrder = 4
    OnClick = BtFontClick
  end
  object BtCarica: TButton
    Left = 4
    Top = 283
    Width = 165
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Carica Testo'
    TabOrder = 3
    OnClick = BtCaricaClick
  end
  object DlgFont: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 120
    Top = 112
  end
  object DlgCarica: TOpenDialog
    Filter = 'File di testo (*.txt)|*.txt|Tutti i file (*.*)|*.*'
    Left = 222
    Top = 114
  end
end
