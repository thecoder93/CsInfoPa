object FmPongClient: TFmPongClient
  Left = 143
  Top = 165
  Width = 641
  Height = 491
  Caption = 'Client Pong'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 87
    Height = 13
    Caption = 'Indirizzo del server'
  end
  inline FrCampo: TFrCampoDiGioco
    Left = 8
    Top = 56
  end
  object BtGioca: TButton
    Left = 176
    Top = 20
    Width = 153
    Height = 25
    Caption = 'Inizia/Interrompi partita'
    TabOrder = 1
    OnClick = BtGiocaClick
  end
  object EtIndirizzoServer: TEdit
    Left = 8
    Top = 24
    Width = 161
    Height = 21
    TabOrder = 2
  end
  object PnPunti: TPanel
    Left = 496
    Top = 56
    Width = 129
    Height = 400
    BevelOuter = bvLowered
    Color = clGray
    TabOrder = 3
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
  object CsPong: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 6711
    OnRead = CsPongRead
    Left = 120
    Top = 120
  end
end
