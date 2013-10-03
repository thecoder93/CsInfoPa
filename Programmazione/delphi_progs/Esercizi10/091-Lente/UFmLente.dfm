object FmLente: TFmLente
  Left = 338
  Top = 124
  BorderStyle = bsDialog
  Caption = 'FmLente'
  ClientHeight = 373
  ClientWidth = 392
  Color = clBtnFace
  Constraints.MaxHeight = 400
  Constraints.MaxWidth = 400
  Constraints.MinHeight = 400
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ImZoom: TImage
    Left = 0
    Top = 0
    Width = 392
    Height = 373
    Align = alClient
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 46
    Top = 26
  end
end
