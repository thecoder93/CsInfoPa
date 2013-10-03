object FmRubrica: TFmRubrica
  Left = 192
  Top = 107
  Width = 696
  Height = 480
  Caption = 'FmRubrica'
  Color = clBtnFace
  Constraints.MinWidth = 600
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
  object sgIndir: TStringGrid
    Left = 0
    Top = 0
    Width = 688
    Height = 434
    Align = alClient
    DefaultColWidth = 120
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 176
    Top = 32
    object File1: TMenuItem
      Caption = '&File'
      object Esci1: TMenuItem
        Caption = '&Esci'
        OnClick = Esci1Click
      end
    end
    object Indirizzo1: TMenuItem
      Caption = '&Indirizzo'
      object Aggiungi1: TMenuItem
        Caption = '&Aggiungi'
        OnClick = Aggiungi1Click
      end
      object Elimina1: TMenuItem
        Caption = '&Elimina'
        OnClick = Elimina1Click
      end
      object EliminaTutti1: TMenuItem
        Caption = 'Elimina &Tutti'
        OnClick = EliminaTutti1Click
      end
    end
  end
end
