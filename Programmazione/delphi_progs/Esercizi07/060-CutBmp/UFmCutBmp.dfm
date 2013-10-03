object FmCutBmp: TFmCutBmp
  Left = 224
  Top = 144
  Width = 289
  Height = 220
  Caption = 'L'#39'affetta-bitmap'
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
    Top = 7
    Width = 144
    Height = 13
    Caption = 'Nome del file BMP da affettare'
  end
  object Label2: TLabel
    Left = 8
    Top = 55
    Width = 131
    Height = 13
    Caption = 'Nome base per i file prodotti'
  end
  object Label3: TLabel
    Left = 8
    Top = 104
    Width = 28
    Height = 13
    Caption = 'Righe'
  end
  object Label4: TLabel
    Left = 80
    Top = 104
    Width = 39
    Height = 13
    Caption = 'Colonne'
  end
  object ImCurrent: TImage
    Left = 160
    Top = 104
    Width = 113
    Height = 81
    Anchors = [akLeft, akTop, akRight, akBottom]
    Stretch = True
  end
  object EtSrcFileName: TEdit
    Left = 8
    Top = 23
    Width = 201
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object EtDestFileName: TEdit
    Left = 8
    Top = 71
    Width = 201
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object PbBrowseSrc: TButton
    Left = 215
    Top = 19
    Width = 58
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Sfoglia...'
    TabOrder = 2
    OnClick = PbBrowseSrcClick
  end
  object PbBrowseDest: TButton
    Left = 215
    Top = 67
    Width = 58
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Sfoglia...'
    TabOrder = 3
    OnClick = PbBrowseDestClick
  end
  object PbGo: TButton
    Left = 32
    Top = 151
    Width = 89
    Height = 25
    Caption = 'Affetta!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = PbGoClick
  end
  object EtY: TSpinEdit
    Left = 8
    Top = 120
    Width = 65
    Height = 22
    MaxLength = 2
    MaxValue = 10
    MinValue = 2
    TabOrder = 5
    Value = 4
  end
  object EtX: TSpinEdit
    Left = 80
    Top = 120
    Width = 65
    Height = 22
    MaxLength = 2
    MaxValue = 10
    MinValue = 2
    TabOrder = 6
    Value = 4
  end
  object OdSrc: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 128
    Top = 8
  end
  object SdDest: TSavePictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 128
    Top = 64
  end
end
