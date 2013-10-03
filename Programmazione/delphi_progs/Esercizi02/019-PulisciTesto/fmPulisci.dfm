object fmPuliscitesto: TfmPuliscitesto
  Left = 269
  Top = 175
  Width = 352
  Height = 351
  Caption = 'fmPuliscitesto'
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
  object BtSfoglia: TSpeedButton
    Left = 224
    Top = 18
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = BtSfogliaClick
  end
  object EtFile: TEdit
    Left = 14
    Top = 18
    Width = 205
    Height = 21
    TabOrder = 0
    Text = 'EtFile'
  end
  object btProc: TButton
    Left = 252
    Top = 18
    Width = 75
    Height = 23
    Caption = 'Pulisci'
    TabOrder = 1
    OnClick = btProcClick
  end
  object EtOutput: TMemo
    Left = 14
    Top = 46
    Width = 320
    Height = 271
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'EtOutput')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object DlgApri: TOpenDialog
    Filter = 'Text file (*.txt)|*.txt'
    Left = 162
    Top = 86
  end
end
