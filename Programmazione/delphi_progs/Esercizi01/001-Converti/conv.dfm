object fmConverti: TfmConverti
  Left = 192
  Top = 107
  BorderStyle = bsToolWindow
  Caption = 'fmConverti'
  ClientHeight = 66
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
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 27
    Height = 13
    Caption = 'Pollici'
  end
  object Label2: TLabel
    Left = 144
    Top = 16
    Width = 46
    Height = 13
    Caption = 'Centimetri'
  end
  object etPollici: TEdit
    Left = 8
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'etPollici'
    OnChange = etPolliciChange
  end
  object etCentimetri: TEdit
    Left = 144
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'etCentimetri'
    OnChange = etCentimetriChange
  end
end
