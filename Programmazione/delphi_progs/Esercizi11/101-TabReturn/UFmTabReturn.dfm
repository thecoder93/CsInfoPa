object FmTabReturn: TFmTabReturn
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'FmTabReturn'
  ClientHeight = 129
  ClientWidth = 454
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
    Left = 6
    Top = 112
    Width = 236
    Height = 13
    Caption = 'Nei controlli Edit il tasto Invio funziona come il Tab'
  end
  object Edit1: TEdit
    Left = 4
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 4
    Top = 58
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 4
    Top = 84
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit3'
  end
  object Memo1: TMemo
    Left = 134
    Top = 4
    Width = 185
    Height = 101
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object ListBox1: TListBox
    Left = 326
    Top = 4
    Width = 121
    Height = 101
    ItemHeight = 13
    Items.Strings = (
      'aaa'
      'bbb'
      'ccc')
    TabOrder = 4
  end
  object BtShowForm2: TButton
    Left = 4
    Top = 4
    Width = 75
    Height = 25
    Caption = 'Form2.Show'
    TabOrder = 5
    OnClick = BtShowForm2Click
  end
end
