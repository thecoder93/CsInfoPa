object fmMetalinguaggio: TfmMetalinguaggio
  Left = 250
  Top = 103
  Width = 592
  Height = 387
  Caption = 'fmMetalinguaggio'
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
  object btSfoglia: TSpeedButton
    Left = 226
    Top = 8
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = btSfogliaClick
  end
  object EtFile: TEdit
    Left = 14
    Top = 8
    Width = 204
    Height = 21
    TabOrder = 0
    Text = 'EtFile'
  end
  object btElabora: TButton
    Left = 255
    Top = 8
    Width = 75
    Height = 23
    Caption = 'Elabora'
    TabOrder = 1
    OnClick = btElaboraClick
  end
  object EtInput: TMemo
    Left = 14
    Top = 40
    Width = 315
    Height = 313
    Anchors = [akLeft, akTop, akBottom]
    Lines.Strings = (
      'EtInput')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object EtOutput: TMemo
    Left = 336
    Top = 8
    Width = 241
    Height = 347
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'EtOutput')
    TabOrder = 3
  end
  object DlgApri: TOpenDialog
    Filter = 'Text file (*.txt)|*.txt'
    Left = 418
    Top = 126
  end
end
