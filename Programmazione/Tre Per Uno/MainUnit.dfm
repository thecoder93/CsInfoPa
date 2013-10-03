object Form1: TForm1
  Tag = 1
  Left = 396
  Top = 142
  Width = 528
  Height = 530
  Caption = 'TRE PER UNO'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 312
    Top = 112
    Width = 73
    Height = 30
    Caption = 'Start'
    OnClick = SpeedButton1Click
  end
  object tlSecondi: TLabel
    Left = 320
    Top = 72
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
    Left = 376
    Top = 72
    Width = 6
    Height = 13
    Caption = '0'
  end
  object sbDX: TSpeedButton
    Tag = 1
    Left = 160
    Top = 456
    Width = 23
    Height = 22
    Caption = 'DX'
    OnClick = sbSXClick
  end
  object sbSX: TSpeedButton
    Left = 120
    Top = 456
    Width = 23
    Height = 22
    Caption = 'SX'
    OnClick = sbSXClick
  end
  object tlPunteggio: TLabel
    Left = 304
    Top = 48
    Width = 66
    Height = 13
    Caption = ' Punteggio:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object nPunteggio: TLabel
    Left = 376
    Top = 48
    Width = 6
    Height = 13
    Caption = '0'
  end
  object tlNomeGiocatore: TLabel
    Left = 304
    Top = 24
    Width = 64
    Height = 13
    Caption = ' Giocatore:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object tlNome: TLabel
    Left = 376
    Top = 24
    Width = 46
    Height = 13
    Caption = 'Giocatore'
    OnClick = tlNomeClick
  end
  object sbClassifica: TSpeedButton
    Left = 312
    Top = 144
    Width = 73
    Height = 33
    Caption = 'Classifica'
    OnClick = sbClassificaClick
  end
  object DrawGrid1: TDrawGrid
    Left = 16
    Top = 8
    Width = 275
    Height = 444
    ColCount = 13
    Ctl3D = False
    DefaultColWidth = 20
    DefaultRowHeight = 20
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 21
    FixedRows = 0
    ParentCtl3D = False
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 376
    Top = 16
    Width = 97
    Height = 21
    TabOrder = 1
    Visible = False
  end
  object Button1: TButton
    Left = 472
    Top = 16
    Width = 33
    Height = 25
    Caption = 'ok'
    TabOrder = 2
    Visible = False
    OnClick = Button1Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 392
    Top = 112
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 424
    Top = 112
  end
end
