object FmLDMultiTimerDemo: TFmLDMultiTimerDemo
  Left = 296
  Top = 148
  Width = 450
  Height = 189
  Caption = 'LDMultiTimerDemo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ShRandom: TShape
    Left = 264
    Top = 72
    Width = 129
    Height = 73
  end
  object StTime: TLabel
    Left = 40
    Top = 96
    Width = 70
    Height = 24
    Caption = 'StTime'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 420
    Height = 39
    Caption = 
      'In questa form, un componente LDMultiTimer controlla tre tempori' +
      'zzazioni: ogni secondo, viene rinfrescata l'#39'ora mostrata in una ' +
      'label; ogni due secondi, il componente Shape cambia colore e ogn' +
      'i tre secondi forma.'
    WordWrap = True
  end
  object LDMultiTimer1: TLDMultiTimer
    SubTimers = <
      item
        OnTimer = LDMultiTimer1SubTimers0Timer
      end
      item
        Interval = 2000
        OnTimer = LDMultiTimer1SubTimers1Timer
      end
      item
        Interval = 3000
        OnTimer = LDMultiTimer1SubTimers2Timer
      end>
    Enabled = True
    Left = 168
    Top = 80
  end
end
