object FmMain: TFmMain
  Left = 185
  Top = 170
  Width = 369
  Height = 124
  Caption = 'Visualizzazione informazioni ID3'
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
    Left = 8
    Top = 8
    Width = 127
    Height = 13
    Caption = 'Nome del file da esaminare'
  end
  object EtNomeFile: TEdit
    Left = 8
    Top = 24
    Width = 313
    Height = 21
    TabOrder = 0
  end
  object BtSfoglia: TButton
    Left = 328
    Top = 24
    Width = 25
    Height = 21
    Caption = '...'
    TabOrder = 1
    OnClick = BtSfogliaClick
  end
  object BtMostra: TButton
    Left = 136
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Mostra ID3'
    TabOrder = 2
    OnClick = BtMostraClick
  end
  object OdNomeFile: TOpenDialog
    Left = 264
    Top = 16
  end
end
