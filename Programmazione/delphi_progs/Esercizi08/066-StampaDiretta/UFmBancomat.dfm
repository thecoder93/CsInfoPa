object FmBancomat: TFmBancomat
  Left = 192
  Top = 183
  Width = 265
  Height = 428
  Caption = 'Euro Bancomat'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 80
    Width = 87
    Height = 13
    Caption = 'Importo desiderato'
  end
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 223
    Height = 64
    Caption = 
      'Digitare l'#39'importo desiderato e premere il pulsante Preleva per ' +
      'avere il denaro (si fa per dire) e lo scontrino.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Bevel1: TBevel
    Left = 16
    Top = 136
    Width = 225
    Height = 9
    Shape = bsTopLine
  end
  object Label3: TLabel
    Left = 16
    Top = 152
    Width = 45
    Height = 13
    Caption = 'Scontrino'
  end
  object EtImporto: TEdit
    Left = 16
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object BtPreleva: TButton
    Left = 152
    Top = 92
    Width = 89
    Height = 25
    Caption = 'Preleva'
    TabOrder = 1
    OnClick = BtPrelevaClick
  end
  object EtScontrino: TMemo
    Left = 16
    Top = 168
    Width = 225
    Height = 185
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object BtStampa: TButton
    Left = 112
    Top = 364
    Width = 129
    Height = 25
    Caption = 'Stampa scontrino'
    TabOrder = 3
    OnClick = BtStampaClick
  end
end
