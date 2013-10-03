object FmChatMain: TFmChatMain
  Left = 225
  Top = 137
  Width = 560
  Height = 423
  Caption = 'Chat a due'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 380
    Top = 0
    Width = 4
    Height = 339
    Cursor = crHSplit
    Align = alRight
  end
  object EtChat: TMemo
    Left = 0
    Top = 0
    Width = 380
    Height = 339
    TabStop = False
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object LbUsers: TListBox
    Left = 384
    Top = 0
    Width = 168
    Height = 339
    TabStop = False
    Align = alRight
    ItemHeight = 13
    TabOrder = 1
  end
  object PnTools: TPanel
    Left = 0
    Top = 339
    Width = 552
    Height = 57
    Align = alBottom
    TabOrder = 2
    object Nickname: TLabel
      Left = 8
      Top = 8
      Width = 48
      Height = 13
      Caption = 'Nickname'
    end
    object Label1: TLabel
      Left = 112
      Top = 8
      Width = 22
      Height = 13
      Caption = 'Host'
    end
    object Label2: TLabel
      Left = 216
      Top = 8
      Width = 51
      Height = 13
      Caption = 'Messaggio'
    end
    object EtNick: TEdit
      Left = 8
      Top = 24
      Width = 97
      Height = 21
      TabOrder = 0
    end
    object EtHost: TEdit
      Left = 112
      Top = 24
      Width = 97
      Height = 21
      TabOrder = 1
    end
    object EtMessage: TEdit
      Left = 216
      Top = 24
      Width = 329
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Text = 'Ciao!'
      OnKeyUp = EtMessageKeyUp
    end
  end
  object Client: TNMMsg
    Port = 6711
    ReportLevel = 0
    Left = 112
    Top = 88
  end
  object Server: TNMMSGServ
    Port = 6711
    ReportLevel = 0
    OnMSG = ServerMSG
    Left = 168
    Top = 88
  end
end
