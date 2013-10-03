object fmEditor: TfmEditor
  Left = 204
  Top = 159
  Width = 696
  Height = 480
  Caption = 'fmEditor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 121
    Top = 0
    Width = 3
    Height = 434
    Cursor = crHSplit
  end
  object etTesto: TMemo
    Left = 124
    Top = 0
    Width = 564
    Height = 434
    Align = alClient
    Lines.Strings = (
      'etTesto')
    ScrollBars = ssVertical
    TabOrder = 0
    OnChange = etTestoChange
  end
  object lsParole: TListBox
    Left = 0
    Top = 0
    Width = 121
    Height = 434
    Align = alLeft
    ItemHeight = 13
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 144
    Top = 72
    object File1: TMenuItem
      Caption = '&File'
      object Nuovo1: TMenuItem
        Caption = '&Nuovo'
        OnClick = Nuovo1Click
      end
      object Apri1: TMenuItem
        Caption = '&Apri...'
        OnClick = Apri1Click
      end
      object Salva1: TMenuItem
        Caption = '&Salva...'
        OnClick = Salva1Click
      end
      object Esci1: TMenuItem
        Caption = '&Esci'
        OnClick = Esci1Click
      end
    end
    object Formato1: TMenuItem
      Caption = 'F&ormato'
      object Carattere1: TMenuItem
        Caption = '&Carattere'
        OnClick = Carattere1Click
      end
    end
    object Enumeraparole1: TMenuItem
      Caption = '&Enumera parole'
      OnClick = Enumeraparole1Click
    end
  end
  object odApri: TOpenDialog
    Filter = 'File di testo (*.txt)|*.txt|Tutti i file (*.*)|*.*'
    Left = 296
    Top = 56
  end
  object sdSalva: TSaveDialog
    DefaultExt = '*.txt'
    Filter = 'File di testo (*.txt)|*.txt|Tutti i file (*.*)|*.*'
    Left = 296
    Top = 112
  end
  object fdCarattere: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 232
    Top = 80
  end
end
