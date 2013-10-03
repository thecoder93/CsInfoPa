object fmSelettore: TfmSelettore
  Left = 192
  Top = 107
  Width = 642
  Height = 422
  Caption = 'fmSelettore'
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
  object Splitter1: TSplitter
    Left = 228
    Top = 0
    Width = 3
    Height = 395
    Cursor = crHSplit
  end
  object Splitter2: TSplitter
    Left = 153
    Top = 0
    Width = 3
    Height = 395
    Cursor = crHSplit
  end
  object lbCaratteri: TListBox
    Left = 0
    Top = 0
    Width = 153
    Height = 395
    Align = alLeft
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListeClick
  end
  object lbDimensioni: TListBox
    Left = 156
    Top = 0
    Width = 72
    Height = 395
    Align = alLeft
    ItemHeight = 13
    TabOrder = 1
    OnClick = ListeClick
  end
  object reTesto: TRichEdit
    Left = 231
    Top = 0
    Width = 403
    Height = 395
    Align = alClient
    HideSelection = False
    Lines.Strings = (
      'reTesto')
    TabOrder = 2
  end
end
