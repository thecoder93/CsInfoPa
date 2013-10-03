object FmShapes: TFmShapes
  Left = 139
  Top = 153
  Width = 720
  Height = 480
  Caption = 'Shapes2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PnTools: TPanel
    Left = 509
    Top = 0
    Width = 203
    Height = 453
    Align = alRight
    TabOrder = 0
    object SbQuadrato: TSpeedButton
      Left = 8
      Top = 8
      Width = 185
      Height = 22
      GroupIndex = 1
      Caption = 'Quadrato'
      OnClick = SbQuadratoClick
    end
    object SbRettangolo: TSpeedButton
      Left = 8
      Top = 30
      Width = 185
      Height = 22
      GroupIndex = 1
      Caption = 'Rettangolo'
      OnClick = SbRettangoloClick
    end
    object SbCerchio: TSpeedButton
      Left = 7
      Top = 52
      Width = 186
      Height = 22
      GroupIndex = 1
      Caption = 'Cerchio'
      OnClick = SbCerchioClick
    end
    object SbEllisse: TSpeedButton
      Left = 7
      Top = 74
      Width = 186
      Height = 22
      GroupIndex = 1
      Caption = 'Ellisse'
      OnClick = SbEllisseClick
    end
    object SbRoundRect: TSpeedButton
      Left = 7
      Top = 96
      Width = 186
      Height = 22
      GroupIndex = 1
      Caption = 'Rettangolo con bordi arrotondati'
      OnClick = SbRoundRectClick
    end
  end
  object PnWorkArea: TPanel
    Left = 0
    Top = 0
    Width = 509
    Height = 453
    Align = alClient
    BevelOuter = bvLowered
    Color = clWindow
    TabOrder = 1
    OnMouseDown = PnWorkAreaMouseDown
    OnMouseMove = PnWorkAreaMouseMove
    OnMouseUp = PnWorkAreaMouseUp
  end
end
