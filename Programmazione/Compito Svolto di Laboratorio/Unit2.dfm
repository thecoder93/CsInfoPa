object Form2: TForm2
  Left = 444
  Top = 124
  Width = 492
  Height = 486
  Caption = 'Spiegazione del Gioco'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 465
    Height = 449
    BorderStyle = bsNone
    Color = clScrollBar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Lines.Strings = (
      'LA TORRE DI HANOI'
      ''
      ''
      'SCOPO DEL GIOCO:'
      ''
      'L'#39'obiettivo del gioco consiste nello spostare la torre '
      'presente all'#39'inizio del gioco sul piolo pi'#249' a sinistra, nel '
      'piolo pi'#249' a destra (utilizzando il piolo centrale da '
      'appoggio).'
      'Alla fine del gioco la torre costruita sul piolo di destra '
      'dovr'#224' comparire esattamente come era all'#39'inizio, ossia '
      'con il disco pi'#249' grande sulla base del piolo e gli altri dischi '
      'progressivamente pi'#249' piccoli in cima.'
      ''
      ''
      'REGOLE DEL GIOCO:'
      ''
      'E'#39' possibile muovere soltanto un disco alla volta e '
      'soltanto dalla cima di una delle torri costruite durante il '
      'gioco.'
      'Non '#232' inoltre possibile posizionare un disco pi'#249' grande '
      'sopra uno pi'#249' piccolo.')
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
end
