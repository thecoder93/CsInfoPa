object Fm15: TFm15
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Il gioco del quindici'
  ClientHeight = 249
  ClientWidth = 281
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
    Left = 104
    Top = 16
    Width = 82
    Height = 13
    Caption = 'Tempo trascorso:'
  end
  object StElapsedTime: TLabel
    Left = 192
    Top = 8
    Width = 79
    Height = 24
    Alignment = taRightJustify
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SgGame: TStringGrid
    Left = 8
    Top = 40
    Width = 263
    Height = 199
    Color = clBlue
    ColCount = 4
    DefaultRowHeight = 48
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 4
    FixedRows = 0
    Font.Charset = ANSI_CHARSET
    Font.Color = clYellow
    Font.Height = -37
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goThumbTracking]
    ParentFont = False
    ScrollBars = ssNone
    TabOrder = 1
    OnClick = SgGameClick
    OnDrawCell = SgGameDrawCell
  end
  object PbNewGame: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Nuovo gioco'
    TabOrder = 0
    OnClick = PbNewGameClick
  end
  object TmGame: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TmGameTimer
    Left = 120
    Top = 40
  end
end
