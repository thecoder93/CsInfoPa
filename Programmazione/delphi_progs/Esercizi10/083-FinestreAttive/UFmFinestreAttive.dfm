object FmFinestreAttive: TFmFinestreAttive
  Left = 192
  Top = 107
  Width = 537
  Height = 483
  Caption = 'FmFinestreAttive'
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
  object SgFinestre: TStringGrid
    Left = 82
    Top = 2
    Width = 443
    Height = 453
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 4
    DefaultColWidth = 100
    DefaultRowHeight = 18
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    TabOrder = 0
  end
  object BtMostra: TBitBtn
    Left = 2
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Mostra'
    TabOrder = 1
    OnClick = BtMostraClick
  end
  object BtNascondi: TBitBtn
    Left = 2
    Top = 58
    Width = 75
    Height = 25
    Caption = 'Nascondi'
    TabOrder = 2
    OnClick = BtNascondiClick
  end
  object Timer: TTimer
    Interval = 10000
    OnTimer = AggiornaFinestre
    Left = 28
    Top = 102
  end
end
