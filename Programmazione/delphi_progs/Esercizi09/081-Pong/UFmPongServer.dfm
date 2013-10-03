object FmPongServer: TFmPongServer
  Left = 174
  Top = 184
  Width = 641
  Height = 464
  Caption = 'Server Pong'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 320
    Top = 224
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object StStato: TLabel
    Left = 8
    Top = 8
    Width = 35
    Height = 13
    Caption = 'StStato'
  end
  inline FrCampo: TFrCampoDiGioco
    Left = 8
    Top = 32
  end
  object PnPunti: TPanel
    Left = 496
    Top = 32
    Width = 129
    Height = 400
    BevelOuter = bvLowered
    Color = clGray
    TabOrder = 1
    object StPunti1: TLabel
      Left = 8
      Top = 8
      Width = 111
      Height = 32
      Caption = 'StPunti1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clLime
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object StPunti2: TLabel
      Left = 8
      Top = 360
      Width = 111
      Height = 32
      Caption = 'StPunti2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -27
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object TmPalla: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TmPallaTimer
    Left = 48
    Top = 64
  end
  object SsPong: TServerSocket
    Active = False
    Port = 6711
    ServerType = stNonBlocking
    OnListen = SsPongListen
    OnClientConnect = SsPongClientConnect
    OnClientDisconnect = SsPongClientDisconnect
    OnClientRead = SsPongClientRead
    Left = 112
    Top = 64
  end
end
