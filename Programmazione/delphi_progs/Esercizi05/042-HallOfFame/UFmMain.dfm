object FmMain: TFmMain
  Left = 268
  Top = 222
  Width = 473
  Height = 300
  Caption = 'Hall Of Fame'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object EtHallOfFame: TMemo
    Left = 8
    Top = 8
    Width = 297
    Height = 257
    TabOrder = 0
  end
  object PbRiempi: TButton
    Left = 312
    Top = 8
    Width = 145
    Height = 25
    Caption = 'Riempi Hall Of Fame'
    TabOrder = 1
    OnClick = PbRiempiClick
  end
  object PbMostra: TButton
    Left = 312
    Top = 40
    Width = 145
    Height = 25
    Caption = 'Mostra Hall Of Fame'
    TabOrder = 2
    OnClick = PbMostraClick
  end
end
