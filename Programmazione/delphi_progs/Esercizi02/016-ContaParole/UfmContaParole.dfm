object FmContaParole: TFmContaParole
  Left = 192
  Top = 107
  Width = 348
  Height = 103
  Caption = 'FmContaParole'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbRisultato: TLabel
    Left = 10
    Top = 48
    Width = 41
    Height = 13
    Caption = 'Risultato'
  end
  object btConta: TButton
    Left = 8
    Top = 12
    Width = 137
    Height = 25
    Caption = 'Conta parole in file'
    TabOrder = 0
    OnClick = btContaClick
  end
  object dlgApri: TOpenDialog
    Filter = 'File di testo (*.txt)|*.txt|Tutti i file (*.*)|*.*'
    Left = 184
    Top = 26
  end
end
