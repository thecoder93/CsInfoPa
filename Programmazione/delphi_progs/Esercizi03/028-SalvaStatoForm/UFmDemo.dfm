object FmDemo: TFmDemo
  Left = 206
  Top = 195
  Width = 550
  Height = 106
  Caption = 'Salvataggio stato form'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 542
    Height = 79
    Align = alClient
    Alignment = taCenter
    Caption = 
      'Questa form non ha nessuna funzionalità, ma memorizza la posizio' +
      'ne e le dimensioni in cui la si lascia per ricordarle la prossim' +
      'a volta che si esegue l'#39'applicazione.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
end
