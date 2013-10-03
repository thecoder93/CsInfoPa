object Form1: TForm1
  Left = 286
  Top = 135
  BorderStyle = bsSingle
  Caption = 'Party Planner'
  ClientHeight = 456
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object tlSecondi: TLabel
    Left = 8
    Top = 48
    Width = 51
    Height = 13
    Caption = 'Secondi:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object nSecondi: TLabel
    Left = 64
    Top = 48
    Width = 6
    Height = 13
    Caption = '0'
  end
  object dgMappa: TDrawGrid
    Left = 132
    Top = 16
    Width = 331
    Height = 221
    ColCount = 30
    Ctl3D = False
    DefaultColWidth = 10
    DefaultRowHeight = 10
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 20
    FixedRows = 0
    ParentCtl3D = False
    TabOrder = 0
    OnSelectCell = dgMappaSelectCell
  end
  object sgTabella: TStringGrid
    Left = 8
    Top = 256
    Width = 460
    Height = 190
    ColCount = 9
    Ctl3D = False
    DefaultColWidth = 50
    DefaultRowHeight = 20
    RowCount = 9
    ParentCtl3D = False
    TabOrder = 1
    OnSelectCell = sgTabellaSelectCell
    RowHeights = (
      20
      20
      20
      20
      20
      20
      20
      20
      20)
  end
  object tbStart: TButton
    Left = 8
    Top = 88
    Width = 75
    Height = 25
    Caption = 'START'
    TabOrder = 2
    OnClick = tbStartClick
  end
  object tbStop: TButton
    Left = 8
    Top = 120
    Width = 75
    Height = 25
    Caption = 'STOP'
    TabOrder = 3
    OnClick = tbStopClick
  end
  object tbReset: TButton
    Left = 8
    Top = 152
    Width = 75
    Height = 25
    Caption = 'RESET'
    TabOrder = 4
    OnClick = tbResetClick
  end
  object tbRandom: TButton
    Left = 8
    Top = 184
    Width = 75
    Height = 25
    Caption = 'RANDOM'
    TabOrder = 5
    OnClick = tbRandomClick
  end
  object tbClassifica: TButton
    Left = 8
    Top = 216
    Width = 75
    Height = 25
    Caption = 'CLASSIFICA'
    TabOrder = 6
    OnClick = tbClassificaClick
  end
  object MainMenu1: TMainMenu
    object File1: TMenuItem
      Caption = 'File'
      object Apri1: TMenuItem
        Caption = 'Apri'
        OnClick = Apri1Click
      end
      object Salva1: TMenuItem
        Caption = 'Salva'
        OnClick = Salva1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.partyplanner'
    Filter = 'Tabella (*.partyplanner)|*.partyplanner|All (*.*)|*.*'
    Left = 32
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.partyplanner'
    Filter = 'Tabella (*.partyplanner)|*.partyplanner|All (*.*)|*.*'
    Left = 64
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 80
    Top = 40
  end
end
