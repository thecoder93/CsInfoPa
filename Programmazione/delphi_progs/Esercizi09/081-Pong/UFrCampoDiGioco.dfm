object FrCampoDiGioco: TFrCampoDiGioco
  Left = 0
  Top = 0
  Width = 480
  Height = 400
  AutoScroll = False
  Color = clBlack
  ParentColor = False
  TabOrder = 0
  object ShPlayer1: TShape
    Left = 190
    Top = 12
    Width = 100
    Height = 17
    Brush.Color = clBlack
    Pen.Color = clLime
    Pen.Width = 3
    Shape = stRoundRect
  end
  object ShPlayer2: TShape
    Left = 190
    Top = 372
    Width = 100
    Height = 17
    Brush.Color = clBlack
    Pen.Color = clRed
    Pen.Width = 3
    Shape = stRoundRect
  end
  object ShMediana: TShape
    Left = 0
    Top = 200
    Width = 480
    Height = 1
    Pen.Style = psDot
  end
  object ShPalla: TShape
    Left = 232
    Top = 192
    Width = 17
    Height = 17
    Brush.Color = clYellow
    Pen.Color = clBlue
    Pen.Width = 3
    Shape = stCircle
  end
  object ShMuroDx: TShape
    Left = 476
    Top = 4
    Width = 4
    Height = 392
    Align = alRight
    Pen.Color = clWhite
  end
  object ShMuroSx: TShape
    Left = 0
    Top = 4
    Width = 4
    Height = 392
    Align = alLeft
    Pen.Color = clWhite
  end
  object ShFondo1: TShape
    Left = 0
    Top = 0
    Width = 480
    Height = 4
    Align = alTop
    Brush.Color = clGray
    Pen.Color = clGray
  end
  object ShFondo2: TShape
    Left = 0
    Top = 396
    Width = 480
    Height = 4
    Align = alBottom
    Brush.Color = clGray
    Pen.Color = clGray
  end
end
