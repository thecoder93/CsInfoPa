object FmVisualizzatore: TFmVisualizzatore
  Left = 216
  Top = 170
  Width = 675
  Height = 480
  Caption = 'FmVisualizzatore'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 185
    Top = 75
    Width = 5
    Height = 378
    Cursor = crHSplit
  end
  object Splitter2: TSplitter
    Left = 333
    Top = 75
    Width = 5
    Height = 378
    Cursor = crHSplit
  end
  object SbImmagine: TScrollBox
    Left = 338
    Top = 75
    Width = 329
    Height = 378
    Align = alClient
    TabOrder = 0
    OnResize = SbImmagineResize
    object Immagine: TImage
      Left = -2
      Top = 0
      Width = 105
      Height = 105
      AutoSize = True
    end
  end
  object PnLeft: TPanel
    Left = 0
    Top = 75
    Width = 185
    Height = 378
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'PnLeft'
    TabOrder = 1
    object DoFile: TDirectoryOutline
      Left = 2
      Top = 32
      Width = 181
      Height = 340
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      Options = [ooDrawFocusRect]
      PictureLeaf.Data = {
        46030000424D460300000000000036000000280000000E0000000E0000000100
        2000000000001003000000000000000000000000000000000000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080000000000000000000000000000000000000000000000000000000
        00000000000000000000000000008000800080008000800080000000000000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
        FF000000000080008000800080008000800000000000FFFFFF0000FFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000008000
        800080008000800080000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000080008000800080008000
        800000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
        FF0000FFFF00FFFFFF00000000008000800080008000800080000000000000FF
        FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
        FF000000000080008000800080008000800000000000FFFFFF0000FFFF00FFFF
        FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000008000
        8000800080008000800000000000000000000000000000000000000000000000
        0000000000000000000000000000000000008000800080008000800080008000
        80008000800000000000FFFFFF0000FFFF00FFFFFF0000FFFF00000000008000
        8000800080008000800080008000800080008000800080008000800080008080
        8000000000000000000000000000000000008080800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        8000800080008000800080008000800080008000800080008000800080008000
        80008000800080008000}
      TabOrder = 0
      OnChange = DoFileChange
      Data = {10}
    end
    object EtDischi: TDriveComboBox
      Left = 4
      Top = 6
      Width = 179
      Height = 19
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      OnChange = EtDischiChange
    end
  end
  object LbFiles: TFileListBox
    Left = 190
    Top = 75
    Width = 143
    Height = 378
    Align = alLeft
    ItemHeight = 13
    TabOrder = 2
    OnChange = LbFilesChange
  end
  object PnTop: TPanel
    Left = 0
    Top = 0
    Width = 667
    Height = 75
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 3
    object LbNomeFile: TLabel
      Left = 314
      Top = 4
      Width = 348
      Height = 18
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'LbNomeFile'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object LbValore: TLabel
      Left = 116
      Top = 57
      Width = 42
      Height = 13
      Caption = 'LbValore'
    end
    object CbAdatta: TCheckBox
      Left = 114
      Top = 4
      Width = 133
      Height = 17
      Caption = 'Adatta immagine'
      TabOrder = 4
      OnClick = CbAdattaClick
    end
    object RbLum: TRadioButton
      Left = 4
      Top = 4
      Width = 83
      Height = 17
      Caption = 'Luminosità'
      TabOrder = 0
      OnClick = CommonRadioClick
    end
    object RbContrasto: TRadioButton
      Left = 4
      Top = 36
      Width = 83
      Height = 17
      Caption = 'Contrasto'
      TabOrder = 2
      OnClick = CommonRadioClick
    end
    object RbGamma: TRadioButton
      Left = 4
      Top = 52
      Width = 83
      Height = 17
      Caption = 'Gamma'
      TabOrder = 3
      OnClick = CommonRadioClick
    end
    object SbProgr: TScrollBar
      Left = 112
      Top = 26
      Width = 547
      Height = 25
      LargeChange = 10
      PageSize = 0
      TabOrder = 5
      OnChange = SbProgrChange
    end
    object RbSaturazione: TRadioButton
      Left = 4
      Top = 20
      Width = 83
      Height = 17
      Caption = 'Saturazione'
      TabOrder = 1
      OnClick = CommonRadioClick
    end
  end
end
