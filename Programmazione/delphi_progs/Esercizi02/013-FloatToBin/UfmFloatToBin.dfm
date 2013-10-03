object fmFloatToBin: TfmFloatToBin
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'fmFloatToBin'
  ClientHeight = 152
  ClientWidth = 522
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
  object lbBinario: TLabel
    Left = 8
    Top = 122
    Width = 40
    Height = 13
    Caption = 'lbBinario'
  end
  object etNumero: TEdit
    Left = 6
    Top = 94
    Width = 187
    Height = 21
    TabOrder = 0
    Text = 'etNumero'
    OnChange = etNumeroChange
  end
  object rgKind: TRadioGroup
    Left = 6
    Top = 6
    Width = 185
    Height = 81
    ItemIndex = 2
    Items.Strings = (
      'Single'
      'Double'
      'Extended')
    TabOrder = 1
    OnClick = etNumeroChange
  end
end
