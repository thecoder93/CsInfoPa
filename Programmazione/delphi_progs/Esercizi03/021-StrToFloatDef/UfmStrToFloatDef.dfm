object Form1: TForm1
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'FmStrToFloatDef'
  ClientHeight = 71
  ClientWidth = 333
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
  object LbRisultato: TLabel
    Left = 12
    Top = 48
    Width = 53
    Height = 13
    Caption = 'LbRisultato'
  end
  object etFloat: TEdit
    Left = 10
    Top = 12
    Width = 159
    Height = 21
    TabOrder = 0
    Text = 'etFloat'
  end
  object Bt10000Volte: TButton
    Left = 177
    Top = 12
    Width = 146
    Height = 25
    Caption = '10000 Volte con eccezioni'
    TabOrder = 1
    OnClick = Bt10000VolteClick
  end
  object Bt10000VolteSenza: TButton
    Left = 177
    Top = 40
    Width = 146
    Height = 25
    Caption = '10000 Volte senza eccezioni'
    TabOrder = 2
    OnClick = Bt10000VolteSenzaClick
  end
end
