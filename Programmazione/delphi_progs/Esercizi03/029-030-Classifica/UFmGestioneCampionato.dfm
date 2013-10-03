object FmGestioneCampionato: TFmGestioneCampionato
  Left = 227
  Top = 151
  Width = 681
  Height = 412
  Caption = 'Gestione Campionato'
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
  object GbClassifica: TGroupBox
    Left = 8
    Top = 8
    Width = 249
    Height = 369
    Caption = 'Creazione nuova classifica'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 74
      Height = 13
      Caption = 'Elenco squadre'
    end
    object EtElencoSquadre: TMemo
      Left = 16
      Top = 40
      Width = 217
      Height = 289
      TabOrder = 0
    end
    object BtCreaClassifica: TButton
      Left = 104
      Top = 336
      Width = 129
      Height = 25
      Caption = 'Crea file classifica...'
      TabOrder = 1
      OnClick = BtCreaClassificaClick
    end
  end
  object GbTurno: TGroupBox
    Left = 264
    Top = 8
    Width = 401
    Height = 369
    Caption = 'Creazione nuovo turno'
    TabOrder = 1
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 37
      Height = 13
      Caption = 'Risultati'
    end
    object SgTurno: TStringGrid
      Left = 16
      Top = 40
      Width = 369
      Height = 289
      ColCount = 4
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
    end
    object BtCreaTurno: TButton
      Left = 256
      Top = 336
      Width = 129
      Height = 25
      Caption = 'Crea file turno...'
      TabOrder = 1
      OnClick = BtCreaTurnoClick
    end
  end
end
