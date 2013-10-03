object Form1: TForm1
  Left = 346
  Top = 154
  Width = 354
  Height = 502
  Caption = 'Il Solitario Delle Pedine'
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
  object tlPunteggio: TLabel
    Left = 56
    Top = 360
    Width = 78
    Height = 13
    Caption = 'PUNTEGGIO:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object nPunteggio: TLabel
    Left = 144
    Top = 360
    Width = 6
    Height = 13
    Caption = '0'
  end
  object tlSecondi: TLabel
    Left = 72
    Top = 384
    Width = 60
    Height = 13
    Caption = 'SECONDI:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object nSecondi: TLabel
    Left = 144
    Top = 384
    Width = 6
    Height = 13
    Caption = '0'
  end
  object tlNome: TLabel
    Left = 16
    Top = 408
    Width = 117
    Height = 13
    Caption = 'NOME GIOCATORE:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DrawGrid1: TDrawGrid
    Left = 24
    Top = 40
    Width = 300
    Height = 300
    Color = clSilver
    ColCount = 7
    Ctl3D = False
    DefaultColWidth = 40
    DefaultRowHeight = 40
    DefaultDrawing = False
    FixedCols = 0
    RowCount = 7
    FixedRows = 0
    GridLineWidth = 3
    ParentCtl3D = False
    TabOrder = 0
    OnSelectCell = DrawGrid1SelectCell
  end
  object teNome: TEdit
    Left = 144
    Top = 400
    Width = 113
    Height = 21
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    object Menu1: TMenuItem
      Caption = 'Menu'
      object SalvaLivello1: TMenuItem
        Caption = 'Salva Livello'
        OnClick = SalvaLivello1Click
      end
      object CaricaLivello1: TMenuItem
        Caption = 'Carica Livello'
        OnClick = CaricaLivello1Click
      end
      object Start1: TMenuItem
        Caption = 'Start'
        OnClick = Start1Click
      end
      object Classifica1: TMenuItem
        Caption = 'Classifica'
        OnClick = Classifica1Click
      end
    end
    object Reset1: TMenuItem
      Caption = 'Reset'
      OnClick = Reset1Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.liv'
    Filter = 'Livello (*.liv)|*.liv|All (*.*)|*.*'
    Left = 32
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.liv'
    Filter = 'Livello (*.liv)|*.liv|All (*.*)|*.*'
    Left = 64
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 16
    Top = 344
  end
end
