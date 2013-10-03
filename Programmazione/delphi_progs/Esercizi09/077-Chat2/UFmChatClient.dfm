object FmChatClient: TFmChatClient
  Left = 340
  Top = 171
  Width = 543
  Height = 297
  Caption = 'Chat Client'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object EtSend: TEdit
    Left = 0
    Top = 41
    Width = 535
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Enabled = False
    TabOrder = 0
    Text = 'Salve a tutti!'
    OnKeyDown = EtSendKeyDown
  end
  object CkActive: TCheckBox
    Left = 432
    Top = 112
    Width = 97
    Height = 17
    Caption = 'Active'
    TabOrder = 1
  end
  object EtChat: TRichEdit
    Left = 0
    Top = 63
    Width = 535
    Height = 207
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object PnTools: TPanel
    Left = 0
    Top = 0
    Width = 535
    Height = 41
    Align = alTop
    TabOrder = 3
    object Label1: TLabel
      Left = 192
      Top = 14
      Width = 48
      Height = 13
      Caption = 'Nickname'
      FocusControl = EtNickName
    end
    object SbConnessione: TSpeedButton
      Left = 376
      Top = 9
      Width = 49
      Height = 22
      Caption = 'Entra'
      OnClick = SbConnessioneClick
    end
    object Label2: TLabel
      Left = 8
      Top = 14
      Width = 44
      Height = 13
      Caption = 'Server IP'
      FocusControl = EtServerIP
    end
    object EtNickName: TEdit
      Left = 248
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Ospite'
      OnChange = ValidateInputParams
    end
    object EtServerIP: TEdit
      Left = 64
      Top = 9
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '127.0.0.1'
      OnChange = ValidateInputParams
    end
  end
  object ClientSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 6711
    OnConnect = ClientSocketConnect
    OnDisconnect = ClientSocketDisconnect
    OnRead = ClientSocketRead
    Left = 370
    Top = 77
  end
end
