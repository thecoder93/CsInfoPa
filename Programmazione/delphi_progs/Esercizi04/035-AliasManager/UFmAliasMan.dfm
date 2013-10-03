object FmAliasMan: TFmAliasMan
  Left = 130
  Top = 160
  Width = 377
  Height = 148
  Caption = 'BDE Alias Manager'
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
    Top = 8
    Width = 123
    Height = 13
    Caption = 'Nome del file da elaborare'
  end
  object EtNomeFile: TEdit
    Left = 16
    Top = 24
    Width = 305
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
  object BtVai: TButton
    Left = 144
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Elabora'
    TabOrder = 2
    OnClick = BtVaiClick
  end
  object OdNomeFile: TOpenDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 280
    Top = 56
  end
end
