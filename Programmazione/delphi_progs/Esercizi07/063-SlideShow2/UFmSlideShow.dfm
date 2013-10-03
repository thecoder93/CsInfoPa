object FmSlideShow: TFmSlideShow
  Left = 177
  Top = 153
  Width = 778
  Height = 524
  Caption = 'Slide Show'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 119
    Top = 7
    Width = 642
    Height = 482
    Anchors = [akLeft, akTop, akRight, akBottom]
  end
  object ImSlideShow: TImage
    Left = 120
    Top = 8
    Width = 640
    Height = 480
    Anchors = [akLeft, akTop, akRight, akBottom]
    Stretch = True
  end
  object BtSlideShow: TButton
    Left = 8
    Top = 8
    Width = 105
    Height = 25
    Caption = 'Comincia...'
    TabOrder = 0
    OnClick = BtSlideShowClick
  end
  object BtInterrompi: TButton
    Left = 8
    Top = 40
    Width = 105
    Height = 25
    Caption = 'Interrompi'
    TabOrder = 1
    OnClick = BtInterrompiClick
  end
  object CkContinuo: TCheckBox
    Left = 8
    Top = 72
    Width = 105
    Height = 17
    Caption = 'Continuo'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object OdSlide: TOpenDialog
    Filter = 'File SlideShow (*.ini)|*.ini|Tutti i file (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 152
    Top = 32
  end
end
