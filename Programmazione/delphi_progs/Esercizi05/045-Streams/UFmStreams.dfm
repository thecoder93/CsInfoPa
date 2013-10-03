object FmStreams: TFmStreams
  Left = 235
  Top = 155
  Width = 497
  Height = 484
  Caption = 'Demo Stream'
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
    Width = 61
    Height = 13
    Caption = 'Nome del file'
  end
  object Label2: TLabel
    Left = 8
    Top = 96
    Width = 82
    Height = 13
    Caption = 'Contenuto del file'
  end
  object Label3: TLabel
    Left = 8
    Top = 48
    Width = 47
    Height = 13
    Caption = 'Leggi con'
  end
  object EtFile: TMemo
    Left = 8
    Top = 112
    Width = 473
    Height = 337
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 4
  end
  object EtNomeFile: TEdit
    Left = 8
    Top = 24
    Width = 473
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    Text = 'c:\autoexec.bat'
  end
  object PbLeggiUpperCase: TButton
    Left = 104
    Top = 64
    Width = 137
    Height = 25
    Caption = 'TUpperCaseFileStream'
    TabOrder = 2
    OnClick = PbLeggiUpperCaseClick
  end
  object PbLeggiConDecorator: TButton
    Left = 248
    Top = 64
    Width = 233
    Height = 25
    Caption = 'TFileStream + TUpperCaseStreamDecorator'
    TabOrder = 3
    OnClick = PbLeggiConDecoratorClick
  end
  object PbLeggi: TButton
    Left = 8
    Top = 64
    Width = 89
    Height = 25
    Caption = 'TFileStream'
    TabOrder = 1
    OnClick = PbLeggiClick
  end
end
