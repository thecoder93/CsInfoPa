object FmPrincipale: TFmPrincipale
  Left = 250
  Top = 102
  Width = 491
  Height = 337
  Caption = 'Principale'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SgForm: TStringGrid
    Left = 4
    Top = 4
    Width = 389
    Height = 303
    ColCount = 2
    DefaultColWidth = 180
    FixedCols = 0
    TabOrder = 0
  end
  object BtMastrini: TButton
    Left = 402
    Top = 6
    Width = 75
    Height = 25
    Caption = 'Mastrini'
    TabOrder = 1
    OnClick = BtMastriniClick
  end
  object BtEstratti: TButton
    Left = 402
    Top = 34
    Width = 75
    Height = 25
    Caption = 'Estratti'
    TabOrder = 2
    OnClick = BtEstrattiClick
  end
end
