object FmMain: TFmMain
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'Gioco di memoria'
  ClientHeight = 391
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PnParametri: TPanel
    Left = 0
    Top = 0
    Width = 555
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 79
      Height = 13
      Caption = 'Larghezza griglia'
    end
    object Label2: TLabel
      Left = 168
      Top = 12
      Width = 64
      Height = 13
      Caption = 'Altezza griglia'
    end
    object StPunteggio: TLabel
      Left = 480
      Top = 9
      Width = 66
      Height = 24
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EtLarghezza: TEdit
      Left = 96
      Top = 8
      Width = 49
      Height = 21
      TabOrder = 0
      Text = '4'
    end
    object EtAltezza: TEdit
      Left = 240
      Top = 8
      Width = 49
      Height = 21
      TabOrder = 1
      Text = '3'
    end
    object SbInizia: TButton
      Left = 304
      Top = 8
      Width = 49
      Height = 25
      Caption = 'Inizia'
      TabOrder = 2
      OnClick = SbIniziaClick
    end
  end
  object PnGriglia: TPanel
    Left = 0
    Top = 41
    Width = 555
    Height = 350
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
  end
end
