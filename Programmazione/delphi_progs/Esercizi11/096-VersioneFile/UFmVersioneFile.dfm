object FmVersioneFile: TFmVersioneFile
  Left = 192
  Top = 107
  Width = 773
  Height = 478
  Caption = 'FmVersioneFile'
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
    Left = 4
    Top = 6
    Width = 66
    Height = 13
    Caption = 'Cartella locale'
  end
  object Label2: TLabel
    Left = 434
    Top = 6
    Width = 70
    Height = 13
    Caption = 'Cartella remota'
  end
  object Label3: TLabel
    Left = 336
    Top = 80
    Width = 84
    Height = 13
    Caption = 'File da aggiornare'
  end
  object EtCartellaLocale: TEdit
    Left = 4
    Top = 22
    Width = 300
    Height = 21
    TabOrder = 0
    OnChange = EtCartellaLocaleChange
  end
  object BtSfogliaLocale: TButton
    Left = 304
    Top = 22
    Width = 27
    Height = 21
    Caption = '...'
    TabOrder = 1
    OnClick = BtSfogliaLocaleClick
  end
  object SgLocale: TStringGrid
    Left = 4
    Top = 50
    Width = 327
    Height = 397
    ColCount = 3
    DefaultColWidth = 100
    DefaultRowHeight = 16
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 2
  end
  object EtCartellaRemota: TEdit
    Left = 434
    Top = 22
    Width = 300
    Height = 21
    TabOrder = 3
    OnChange = EtCartellaRemotaChange
  end
  object BtSfogliaRemota: TButton
    Left = 734
    Top = 22
    Width = 27
    Height = 21
    Caption = '...'
    TabOrder = 4
    OnClick = BtSfogliaRemotaClick
  end
  object SgRemota: TStringGrid
    Left = 434
    Top = 50
    Width = 327
    Height = 397
    ColCount = 3
    DefaultColWidth = 100
    DefaultRowHeight = 16
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 5
  end
  object BtAggiorna: TButton
    Left = 334
    Top = 50
    Width = 97
    Height = 25
    Caption = '<< Aggiorna'
    TabOrder = 6
    OnClick = BtAggiornaClick
  end
  object LbElencoFile: TListBox
    Left = 334
    Top = 94
    Width = 98
    Height = 353
    ItemHeight = 13
    TabOrder = 7
  end
end
