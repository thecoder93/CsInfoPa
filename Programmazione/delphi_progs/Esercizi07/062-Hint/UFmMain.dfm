object FmMain: TFmMain
  Left = 228
  Top = 151
  Width = 313
  Height = 212
  Caption = 'Prova Hint'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Edit1: TEdit
    Left = 16
    Top = 24
    Width = 81
    Height = 21
    Hint = 'Questo è un Edit molto stretto'
    TabOrder = 0
    Text = 'Edit1'
  end
  object Memo1: TMemo
    Left = 104
    Top = 24
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 16
    Top = 120
    Width = 273
    Height = 21
    TabOrder = 2
    Text = 'Un testo molto lungo, talmente lungo che non entra nella casella'
  end
  object Edit3: TEdit
    Left = 16
    Top = 152
    Width = 273
    Height = 21
    Hint = 'Io ho anche un mio Hint, a differenza dell'#39'Edit sopra'
    TabOrder = 3
    Text = 'Un testo molto lungo, talmente lungo che non entra nella casella'
  end
end
