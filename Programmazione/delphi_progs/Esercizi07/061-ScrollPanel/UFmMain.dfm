object FmMain: TFmMain
  Left = 192
  Top = 107
  Width = 535
  Height = 252
  Caption = 'Form con testo scorrevole'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PbScroll: TPaintBox
    Left = 96
    Top = 8
    Width = 425
    Height = 113
  end
  object Label1: TLabel
    Left = 8
    Top = 73
    Width = 34
    Height = 13
    Caption = 'Ritardo'
  end
  object PbComincia: TButton
    Left = 8
    Top = 8
    Width = 81
    Height = 25
    Caption = 'Comincia'
    TabOrder = 0
    OnClick = PbCominciaClick
  end
  object EtTesto: TMemo
    Left = 96
    Top = 128
    Width = 321
    Height = 89
    Lines.Strings = (
      'Testo da far scorrere'
      'nel PaintBox qui sopra.'
      'Per esempio un elenco di punteggi,'
      'i titoli iniziali di Star Wars o anche'
      'la lista della spesa.')
    TabOrder = 3
  end
  object PbInterrompi: TButton
    Left = 8
    Top = 40
    Width = 81
    Height = 25
    Caption = 'Interrompi'
    TabOrder = 1
    OnClick = PbInterrompiClick
  end
  object TbRitardo: TTrackBar
    Left = 48
    Top = 72
    Width = 41
    Height = 145
    Max = 50
    Orientation = trVertical
    Frequency = 2
    Position = 10
    SelEnd = 0
    SelStart = 0
    TabOrder = 2
    TickMarks = tmTopLeft
    TickStyle = tsAuto
    OnChange = TbRitardoChange
  end
end
