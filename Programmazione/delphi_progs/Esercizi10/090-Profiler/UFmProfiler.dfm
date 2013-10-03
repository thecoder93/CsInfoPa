object FmProfiler: TFmProfiler
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'FmProfiler'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object EtMemo: TMemo
    Left = 160
    Top = 0
    Width = 528
    Height = 453
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object BtMoltiplicazioni: TButton
    Left = 4
    Top = 36
    Width = 149
    Height = 25
    Caption = 'Moltiplicazioni casuali'
    TabOrder = 1
    OnClick = BtMoltiplicazioniClick
  end
  object BtProfiler: TButton
    Left = 4
    Top = 6
    Width = 149
    Height = 25
    Caption = 'Profiler.Misura'
    TabOrder = 2
    OnClick = BtProfilerClick
  end
  object BtObject: TButton
    Left = 4
    Top = 66
    Width = 149
    Height = 25
    Caption = 'TObject.Create'
    TabOrder = 3
    OnClick = BtObjectClick
  end
  object BtQueryPC: TButton
    Left = 4
    Top = 96
    Width = 149
    Height = 25
    Caption = 'QueryPerformanceCounter'
    TabOrder = 4
    OnClick = BtQueryPCClick
  end
end
