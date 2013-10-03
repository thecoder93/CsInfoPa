object Form1: TForm1
  Left = 248
  Top = 283
  Width = 474
  Height = 198
  Caption = 'INDOVINA LA COMBINAZIONE'
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
  object tlNome: TLabel
    Left = 16
    Top = 16
    Width = 136
    Height = 20
    Caption = 'Nome Giocatore:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object tlCodGenerato: TLabel
    Left = 168
    Top = 48
    Width = 160
    Height = 20
    Caption = 'CODICE SEGRETO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object tlCodGenerato2: TLabel
    Left = 176
    Top = 72
    Width = 141
    Height = 20
    Caption = 'NON GENERATO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object teNome: TEdit
    Left = 160
    Top = 8
    Width = 177
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object tbOkNome: TButton
    Left = 352
    Top = 16
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = tbOkNomeClick
  end
  object tbRandom: TButton
    Left = 352
    Top = 56
    Width = 75
    Height = 25
    Caption = 'RANDOM'
    Enabled = False
    TabOrder = 2
    OnClick = tbRandomClick
  end
  object tbStart: TButton
    Left = 176
    Top = 104
    Width = 107
    Height = 41
    Caption = 'START'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = tbStartClick
  end
end
