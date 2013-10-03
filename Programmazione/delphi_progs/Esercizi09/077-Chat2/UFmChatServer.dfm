object FmChatServer: TFmChatServer
  Left = 256
  Top = 431
  Width = 570
  Height = 278
  Caption = 'Chat Server'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LbMsgs: TListBox
    Left = 0
    Top = 0
    Width = 562
    Height = 232
    Align = alClient
    ItemHeight = 13
    TabOrder = 0
  end
  object ServerSocket: TServerSocket
    Active = False
    Port = 6711
    ServerType = stNonBlocking
    OnClientDisconnect = ServerSocketClientDisconnect
    OnClientRead = ServerSocketClientRead
    Left = 107
    Top = 78
  end
  object MainMenu1: TMainMenu
    Left = 192
    Top = 48
    object Opzioni1: TMenuItem
      Caption = 'Opzioni'
      object MiLogging: TMenuItem
        Caption = 'Logging'
        Checked = True
        OnClick = MiLoggingClick
      end
    end
  end
end
