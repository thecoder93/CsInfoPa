object Form1: TForm1
  Left = 202
  Top = 71
  Width = 686
  Height = 641
  Caption = 'Form1'
  Color = clMoneyGreen
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 23
  object Label1: TLabel
    Left = 408
    Top = 336
    Width = 123
    Height = 23
    Caption = 'Nome giocatore: '
  end
  object Label2: TLabel
    Left = 408
    Top = 400
    Width = 162
    Height = 23
    Caption = 'Nome configurazione: '
  end
  object DrawGrid1: TDrawGrid
    Left = 48
    Top = 16
    Width = 344
    Height = 553
    ColCount = 31
    DefaultColWidth = 10
    DefaultRowHeight = 10
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 50
    FixedRows = 0
    ScrollBars = ssNone
    TabOrder = 0
    OnSelectCell = DrawGrid1SelectCell
  end
  object Button1: TButton
    Left = 464
    Top = 96
    Width = 129
    Height = 49
    Caption = 'RANDOM'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 464
    Top = 160
    Width = 113
    Height = 33
    Caption = 'Salva Livello'
    TabOrder = 2
    OnClick = SalvaLivello1Click
  end
  object Button3: TButton
    Left = 464
    Top = 208
    Width = 113
    Height = 33
    Caption = 'Carica Livello'
    TabOrder = 3
    OnClick = CaricaLivello1Click
  end
  object Button4: TButton
    Left = 464
    Top = 256
    Width = 129
    Height = 49
    Caption = 'RESET'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 464
    Top = 32
    Width = 121
    Height = 49
    Caption = 'START'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Edit1: TEdit
    Left = 536
    Top = 328
    Width = 129
    Height = 34
    AutoSize = False
    TabOrder = 6
  end
  object Edit2: TEdit
    Left = 440
    Top = 440
    Width = 201
    Height = 33
    AutoSize = False
    TabOrder = 7
  end
  object Button6: TButton
    Left = 488
    Top = 496
    Width = 121
    Height = 41
    Caption = 'HISTORY'
    TabOrder = 8
    OnClick = Button6Click
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.cel'
    Filter = 
      'File configurazione(*.cel)|*.cel|Any file(*.*)|*.*|TextFile(*.tx' +
      't)|*.txt'
    Left = 8
    Top = 56
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.cel'
    Filter = 
      'File configurazione(*.cel)|*.cel|Any File(*.*)|*.*|TextFile(*.tx' +
      't)|*.txt'
    Left = 8
    Top = 96
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 144
    object File1: TMenuItem
      Caption = 'File'
      object SalvaLivello1: TMenuItem
        Caption = 'Salva Livello'
        OnClick = SalvaLivello1Click
      end
      object CaricaLivello1: TMenuItem
        Caption = 'Carica Livello'
        OnClick = CaricaLivello1Click
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 8
    Top = 192
  end
end
