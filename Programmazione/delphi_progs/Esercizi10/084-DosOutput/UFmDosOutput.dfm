object FmDosOutput: TFmDosOutput
  Left = 288
  Top = 160
  Width = 545
  Height = 340
  Caption = 'Output di programmi DOS'
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
    Top = 8
    Width = 135
    Height = 13
    Caption = 'Riga di comando da lanciare'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 32
    Height = 13
    Caption = 'Output'
  end
  object EtCmdLine: TEdit
    Left = 8
    Top = 24
    Width = 521
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    OnKeyDown = EtCmdLineKeyDown
  end
  object EtOutput: TMemo
    Left = 8
    Top = 72
    Width = 521
    Height = 233
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clBlack
    Font.Charset = OEM_CHARSET
    Font.Color = clSilver
    Font.Height = -12
    Font.Name = 'Terminal'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
    WordWrap = False
  end
end
