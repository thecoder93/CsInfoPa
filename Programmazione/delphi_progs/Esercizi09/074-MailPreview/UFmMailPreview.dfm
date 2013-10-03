object FmMailPreview: TFmMailPreview
  Left = 147
  Top = 121
  Width = 766
  Height = 480
  Caption = 'Anteprima messaggi di posta elettronica'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 536
    Top = 57
    Width = 3
    Height = 377
    Cursor = crHSplit
    Align = alRight
  end
  object PnParams: TPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 77
      Height = 13
      Caption = 'Nome del server'
    end
    object Label2: TLabel
      Left = 216
      Top = 8
      Width = 79
      Height = 13
      Caption = 'Nome dell'#39'utente'
    end
    object Label3: TLabel
      Left = 344
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object EtServerName: TEdit
      Left = 8
      Top = 24
      Width = 201
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object EtUserName: TEdit
      Left = 216
      Top = 24
      Width = 121
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object EtPassword: TEdit
      Left = 344
      Top = 24
      Width = 121
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
    end
    object SbGo: TButton
      Left = 472
      Top = 21
      Width = 169
      Height = 25
      Caption = 'Scarica anteprima messaggi'
      TabOrder = 3
      OnClick = SbGoClick
    end
  end
  object SbStatus: TStatusBar
    Left = 0
    Top = 434
    Width = 758
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object LvMsgs: TListView
    Left = 0
    Top = 57
    Width = 536
    Height = 377
    Align = alClient
    Columns = <
      item
        Caption = 'Mittente'
        Width = 200
      end
      item
        Caption = 'Oggetto'
        Width = 150
      end
      item
        Caption = 'ID Messaggio'
        Width = 90
      end
      item
        Caption = 'Dimensione'
        Width = 70
      end>
    TabOrder = 2
    ViewStyle = vsReport
    OnChange = LvMsgsChange
  end
  object EtHeader: TMemo
    Left = 539
    Top = 57
    Width = 219
    Height = 377
    Align = alRight
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 3
    WordWrap = False
  end
  object POP: TNMPOP3
    Port = 110
    TimeOut = 20000
    ReportLevel = 0
    OnDisconnect = POPDisconnect
    OnConnect = POPConnect
    OnInvalidHost = POPInvalidHost
    OnHostResolved = POPHostResolved
    OnStatus = POPStatus
    OnConnectionFailed = POPConnectionFailed
    OnPacketRecvd = POPPacketRecvd
    Parse = False
    DeleteOnRead = False
    AttachFilePath = '.\'
    OnRetrieveStart = POPRetrieveStart
    OnRetrieveEnd = POPRetrieveEnd
    OnSuccess = POPSuccess
    OnFailure = POPFailure
    Left = 424
    Top = 152
  end
end
