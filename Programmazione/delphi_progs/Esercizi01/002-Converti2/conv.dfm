object fmConverti: TfmConverti
  Left = 192
  Top = 107
  BorderStyle = bsToolWindow
  Caption = 'fmConverti'
  ClientHeight = 168
  ClientWidth = 271
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
  object lbUnit1: TLabel
    Left = 8
    Top = 120
    Width = 27
    Height = 13
    Caption = 'Pollici'
  end
  object lbUnit2: TLabel
    Left = 144
    Top = 120
    Width = 46
    Height = 13
    Caption = 'Centimetri'
  end
  object etPollici: TEdit
    Left = 8
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'etPollici'
    OnChange = etPolliciChange
  end
  object etCentimetri: TEdit
    Left = 144
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'etCentimetri'
    OnChange = etCentimetriChange
  end
  object rgMisure: TRadioGroup
    Left = 8
    Top = 8
    Width = 185
    Height = 81
    Caption = 'Converti: '
    ItemIndex = 0
    Items.Strings = (
      'pollici/centimetri'
      'piedi/metri'
      'iarde/metri'
      'miglia/chilometri')
    TabOrder = 2
    OnClick = rgMisureClick
  end
  object kbArrotonda: TCheckBox
    Left = 8
    Top = 96
    Width = 97
    Height = 17
    Caption = 'Arrotonda'
    TabOrder = 3
  end
end
