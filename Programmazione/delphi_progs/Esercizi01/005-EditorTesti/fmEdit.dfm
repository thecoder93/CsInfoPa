object fmEditor: TfmEditor
  Left = 250
  Top = 103
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
  object etTesto: TMemo
    Left = 0
    Top = 0
    Width = 688
    Height = 434
    Align = alClient
    Lines.Strings = (
      'etTesto')
    TabOrder = 0
    OnChange = etTestoChange
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
  end
  object odApri: TOpenDialog
    Filter = 'File di testo (*.txt)|*.txt|Tutti i file (*.*)|*.*'
    Left = 296
    Top = 72
  end
  object sdSalva: TSaveDialog
    DefaultExt = '*.txt'
    Filter = 'File di testo (*.txt)|*.txt|Tutti i file (*.*)|*.*'
    Left = 280
    Top = 136
  end
  object fdCarattere: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 240
    Top = 80
  end
end
