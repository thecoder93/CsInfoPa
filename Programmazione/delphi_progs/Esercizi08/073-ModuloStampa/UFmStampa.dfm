object FmStampa: TFmStampa
  Left = 255
  Top = 161
  BorderStyle = bsDialog
  Caption = 'Stampa Indirizzi'
  ClientHeight = 297
  ClientWidth = 274
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
  object StTipoStampa: TLabel
    Left = 8
    Top = 8
    Width = 100
    Height = 16
    Caption = 'StTipoStampa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 32
    Width = 37
    Height = 13
    Caption = 'Modello'
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 83
    Height = 13
    Caption = 'Formato carattere'
  end
  object Label3: TLabel
    Left = 8
    Top = 128
    Width = 51
    Height = 13
    Caption = 'Stampante'
  end
  object EtModello: TEdit
    Left = 8
    Top = 48
    Width = 232
    Height = 21
    TabOrder = 0
  end
  object BtScegliModello: TButton
    Left = 240
    Top = 48
    Width = 25
    Height = 21
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BtScegliModelloClick
  end
  object EtFont: TEdit
    Left = 8
    Top = 96
    Width = 232
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object BtScegliFont: TButton
    Left = 240
    Top = 96
    Width = 25
    Height = 21
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BtScegliFontClick
  end
  object LbStampanti: TListBox
    Left = 8
    Top = 144
    Width = 257
    Height = 89
    ItemHeight = 13
    TabOrder = 4
  end
  object BtStampa: TButton
    Left = 48
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Stampa'
    Default = True
    TabOrder = 5
    OnClick = BtStampaClick
  end
  object BtAnnulla: TButton
    Left = 152
    Top = 256
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Annulla'
    ModalResult = 2
    TabOrder = 6
  end
  object OdModello: TOpenDialog
    Filter = 'File Modello (*.ini)|*.ini|Tutti i file (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 176
    Top = 24
  end
  object FdStampa: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Device = fdPrinter
    MinFontSize = 0
    MaxFontSize = 0
    Left = 176
    Top = 80
  end
end
