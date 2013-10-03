object fmTranscodifica: TfmTranscodifica
  Left = 172
  Top = 120
  Width = 696
  Height = 480
  Caption = 'fmTranscodifica'
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
  object btApri: TSpeedButton
    Left = 216
    Top = 2
    Width = 81
    Height = 49
    Caption = '&Carica testo'
    OnClick = btApriClick
  end
  object btTranscodifica: TSpeedButton
    Left = 216
    Top = 56
    Width = 81
    Height = 49
    Caption = '&Transcodifica'
    OnClick = btTranscodificaClick
  end
  object btSalva: TSpeedButton
    Left = 216
    Top = 110
    Width = 81
    Height = 49
    Caption = '&Salva testo'
    OnClick = btSalvaClick
  end
  object sgRegole: TStringGrid
    Left = 2
    Top = 2
    Width = 208
    Height = 447
    Anchors = [akLeft, akTop, akBottom]
    ColCount = 2
    DefaultColWidth = 100
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
    TabOrder = 0
    OnSetEditText = sgRegoleSetEditText
  end
  object etTesto: TMemo
    Left = 302
    Top = 4
    Width = 383
    Height = 445
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
  end
  object ckCase: TCheckBox
    Left = 216
    Top = 164
    Width = 83
    Height = 17
    Caption = 'Ignora maius.'
    TabOrder = 2
  end
  object dlgApri: TOpenDialog
    Filter = 'File di testo (*.txt)|*.txt|Tutti i file (*.*)|*.*'
    Left = 232
    Top = 184
  end
  object dlgSalva: TSaveDialog
    Filter = 'File di testo (*.txt)|*.txt|Tutti i file (*.*)|*.*'
    Left = 232
    Top = 238
  end
end
