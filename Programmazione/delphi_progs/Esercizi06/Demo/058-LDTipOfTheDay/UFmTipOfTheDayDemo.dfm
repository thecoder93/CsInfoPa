object FmTipOfTheDay: TFmTipOfTheDay
  Left = 356
  Top = 173
  Width = 353
  Height = 180
  Caption = 'Tip Of The Day'
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
  object Bevel1: TBevel
    Left = 7
    Top = 23
    Width = 331
    Height = 91
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 125
    Height = 13
    Caption = 'Non tutti sanno che...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object StTip: TLabel
    Left = 11
    Top = 27
    Width = 323
    Height = 83
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object BtNextTip: TButton
    Left = 232
    Top = 120
    Width = 106
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Prossimo Tip >>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = BtNextTipClick
  end
  object TOD: TLDTipOfTheDay
    Left = 224
    Top = 40
  end
end
