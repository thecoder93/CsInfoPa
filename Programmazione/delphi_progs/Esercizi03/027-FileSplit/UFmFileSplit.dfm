object FmFileSplit: TFmFileSplit
  Left = 275
  Top = 114
  Width = 353
  Height = 180
  Caption = 'Suddivisione di file'
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
    Top = 7
    Width = 121
    Height = 13
    Caption = 'Nome del file da spezzare'
  end
  object Label2: TLabel
    Left = 8
    Top = 55
    Width = 158
    Height = 13
    Caption = 'Nome da dare al primo frammento'
  end
  object Label3: TLabel
    Left = 8
    Top = 104
    Width = 103
    Height = 13
    Caption = 'Dimensione frammenti'
  end
  object EtSrcFileName: TEdit
    Left = 8
    Top = 23
    Width = 249
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object PbBrowseSrc: TButton
    Left = 264
    Top = 19
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Sfoglia...'
    TabOrder = 1
    OnClick = PbBrowseSrcClick
  end
  object EtDestFileName: TEdit
    Left = 8
    Top = 71
    Width = 249
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object PbBrowseDest: TButton
    Left = 264
    Top = 67
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Sfoglia...'
    TabOrder = 3
    OnClick = PbBrowseDestClick
  end
  object PbGo: TButton
    Left = 120
    Top = 116
    Width = 41
    Height = 25
    Caption = 'Vai!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = PbGoClick
  end
  object PbSplit: TProgressBar
    Left = 168
    Top = 116
    Width = 169
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Min = 0
    Max = 100
    Smooth = True
    Step = 1
    TabOrder = 5
  end
  object CbSliceSize: TComboBox
    Left = 8
    Top = 120
    Width = 105
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Text = '1000'
    Items.Strings = (
      '1000'
      '10000'
      '100000'
      '737280'
      '1000000'
      '1474560')
  end
end
