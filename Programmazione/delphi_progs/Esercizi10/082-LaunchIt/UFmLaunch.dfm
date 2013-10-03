object FmLaunch: TFmLaunch
  Left = 215
  Top = 142
  BorderStyle = bsDialog
  Caption = 'Lancio di file esterni'
  ClientHeight = 89
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 116
    Height = 13
    Caption = 'Nome del file da lanciare'
  end
  object SbFileName: TSpeedButton
    Left = 320
    Top = 32
    Width = 23
    Height = 22
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = SbFileNameClick
  end
  object EtFileName: TEdit
    Left = 8
    Top = 32
    Width = 305
    Height = 21
    TabOrder = 0
  end
  object BbStart: TBitBtn
    Left = 352
    Top = 32
    Width = 57
    Height = 49
    Caption = 'Lancia'
    TabOrder = 2
    OnClick = BbStartClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
      00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
      70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
      70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
      70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
      70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
      70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
      00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
    Layout = blGlyphTop
    NumGlyphs = 2
  end
  object CkWait: TCheckBox
    Left = 8
    Top = 64
    Width = 305
    Height = 17
    Caption = 'Attendi che il processo lanciato termini'
    TabOrder = 1
  end
end
