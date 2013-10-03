object FmModuleListDemo: TFmModuleListDemo
  Left = 180
  Top = 171
  Width = 449
  Height = 452
  Caption = 'Elenco dei moduli caricati'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RgKind: TRadioGroup
    Left = 8
    Top = 8
    Width = 289
    Height = 49
    Anchors = [akLeft, akTop, akRight]
    Caption = 'API da usare'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Usa ToolHelp32'
      'Usa PSAPI')
    TabOrder = 0
  end
  object PbGo: TButton
    Left = 304
    Top = 8
    Width = 129
    Height = 49
    Anchors = [akTop, akRight]
    Caption = 'Mostra elenco'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = PbGoClick
  end
  object EtList: TMemo
    Left = 8
    Top = 64
    Width = 425
    Height = 353
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
  end
end
