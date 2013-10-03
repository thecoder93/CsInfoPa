object Form1: TForm1
  Left = 195
  Top = 74
  Width = 924
  Height = 649
  Caption = 'La Torre di Hanoi'
  Color = clScrollBar
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
  object LabDischi: TLabel
    Left = 64
    Top = 88
    Width = 143
    Height = 20
    Caption = 'Numero di dischi: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabTempo: TLabel
    Left = 32
    Top = 552
    Width = 65
    Height = 20
    Caption = 'Tempo: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabSecondi: TLabel
    Left = 104
    Top = 552
    Width = 11
    Height = 20
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabMosse: TLabel
    Left = 32
    Top = 408
    Width = 145
    Height = 20
    Caption = 'Mosse Effettuate:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabContMosse: TLabel
    Left = 192
    Top = 408
    Width = 11
    Height = 20
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabNome: TLabel
    Left = 304
    Top = 408
    Width = 141
    Height = 20
    Caption = 'Nome Giocatore: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabLivelli: TLabel
    Left = 232
    Top = 64
    Width = 137
    Height = 16
    Caption = '3      4      5      6      7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabTitolo: TLabel
    Left = 272
    Top = 0
    Width = 357
    Height = 27
    Caption = 'L A    T O R R E    D I    H A N O I'
    Font.Charset = ANSI_CHARSET
    Font.Color = clHotLight
    Font.Height = -19
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DrawGrid1: TDrawGrid
    Left = 32
    Top = 144
    Width = 817
    Height = 177
    BorderStyle = bsNone
    ColCount = 51
    DefaultColWidth = 15
    DefaultRowHeight = 15
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 11
    FixedRows = 0
    TabOrder = 0
  end
  object BStart: TButton
    Left = 472
    Top = 64
    Width = 121
    Height = 49
    Caption = 'START'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BStartClick
  end
  object BReset: TButton
    Left = 664
    Top = 64
    Width = 121
    Height = 49
    Caption = 'RESET'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BResetClick
  end
  object BTorre1: TButton
    Left = 144
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Torre 1'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BTorre1Click
  end
  object BTorre2: TButton
    Left = 408
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Torre 2'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BTorre2Click
  end
  object BTorre3: TButton
    Left = 664
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Torre 3'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BTorre3Click
  end
  object EditNome: TEdit
    Left = 456
    Top = 408
    Width = 185
    Height = 21
    TabOrder = 6
  end
  object BClassifica: TButton
    Left = 344
    Top = 464
    Width = 185
    Height = 49
    Caption = 'CLASSIFICA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = BClassificaClick
  end
  object TrackBar1: TTrackBar
    Left = 224
    Top = 80
    Width = 150
    Height = 45
    Max = 7
    Min = 3
    Position = 3
    TabOrder = 8
    OnChange = TrackBar1Change
  end
  object BSalva: TButton
    Left = 696
    Top = 400
    Width = 105
    Height = 33
    Caption = 'SALVA'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = BSalvaClick
  end
  object ProgressBar1: TProgressBar
    Left = 136
    Top = 552
    Width = 713
    Height = 25
    Max = 30
    TabOrder = 10
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 32
    Top = 512
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object SpiegazionedelGioco1: TMenuItem
      Caption = 'Help'
      object Spiegazionedelgioco2: TMenuItem
        Caption = 'Spiegazione del gioco'
        OnClick = Spiegazionedelgioco2Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Realizzatoda1: TMenuItem
        Caption = 'Realizzato da...'
        OnClick = Realizzatoda1Click
      end
    end
    object Soluzioni1: TMenuItem
      Caption = 'Soluzioni'
      object Per3dischi1: TMenuItem
        Caption = 'Per 3 dischi'
        OnClick = Per3dischi1Click
      end
      object Per4dischi1: TMenuItem
        Caption = 'Per 4 dischi'
        OnClick = Per4dischi1Click
      end
      object Per5dischi1: TMenuItem
        Caption = 'Per 5 dischi'
        OnClick = Per5dischi1Click
      end
      object Per6dischi1: TMenuItem
        Caption = 'Per 6 dischi'
        OnClick = Per6dischi1Click
      end
      object Per7dischi1: TMenuItem
        Caption = 'Per 7 dischi'
        OnClick = Per7dischi1Click
      end
    end
    object Esci2: TMenuItem
      Caption = 'Esci'
      OnClick = Esci2Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.cuc'
    Filter = 'Nome e Numero di mosse (*.cuc)|*.cuc'
    Left = 816
    Top = 408
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 864
    Top = 552
  end
end
