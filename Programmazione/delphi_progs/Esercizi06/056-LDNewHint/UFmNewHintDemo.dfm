object FmNewHintDemo: TFmNewHintDemo
  Left = 213
  Top = 137
  Width = 221
  Height = 159
  Hint = 'La form contiene componenti, non tutti inutili'
  Caption = 'NewHintWindow Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 141
    Height = 13
    Hint = 'Ha solo qualche Hint'
    Caption = 'Questa form non serve a nulla'
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 193
    Height = 21
    Hint = 'Digitare qualcosa di diverso da '#39'Edit1'#39
    TabOrder = 0
    Text = 'Edit1'
  end
  object TbDelay: TTrackBar
    Left = 8
    Top = 72
    Width = 193
    Height = 45
    Hint = 'Imposta il ritardo per la scomparsa degli Hint'
    Max = 20
    Orientation = trHorizontal
    Frequency = 1
    Position = 10
    SelEnd = 0
    SelStart = 0
    TabOrder = 1
    TickMarks = tmTopLeft
    TickStyle = tsAuto
    OnChange = TbDelayChange
  end
end
