object FmVisualizzatore: TFmVisualizzatore
  Left = 226
  Top = 169
  Width = 675
  Height = 480
  Caption = 'Visualizzatore FTP'
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
    Left = 185
    Top = 55
    Width = 5
    Height = 398
    Cursor = crHSplit
  end
  object Splitter2: TSplitter
    Left = 333
    Top = 55
    Width = 5
    Height = 398
    Cursor = crHSplit
  end
  object SbImmagine: TScrollBox
    Left = 338
    Top = 55
    Width = 329
    Height = 398
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
  object LbFiles: TListBox
    Left = 190
    Top = 55
    Width = 143
    Height = 398
    Align = alLeft
    ItemHeight = 13
    Sorted = True
    TabOrder = 1
    OnClick = LbFilesClick
  end
  object PnTop: TPanel
    Left = 0
    Top = 0
    Width = 667
    Height = 55
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 2
    object LbNomeFile: TLabel
      Left = 576
      Top = 4
      Width = 86
      Height = 18
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'LbNomeFile'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 60
      Height = 13
      Caption = 'Nome server'
    end
    object Label2: TLabel
      Left = 136
      Top = 8
      Width = 61
      Height = 13
      Caption = 'Nome utente'
    end
    object Label3: TLabel
      Left = 240
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Password'
    end
    object CbAdatta: TCheckBox
      Left = 560
      Top = 31
      Width = 102
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = 'Adatta immagine'
      TabOrder = 5
      OnClick = CbAdattaClick
    end
    object BtConnessione: TButton
      Left = 344
      Top = 6
      Width = 89
      Height = 21
      Caption = 'Connessione'
      TabOrder = 3
      OnClick = BtConnessioneClick
    end
    object BtDisconnessione: TButton
      Left = 344
      Top = 27
      Width = 89
      Height = 21
      Caption = 'Disconnessione'
      TabOrder = 4
      OnClick = BtDisconnessioneClick
    end
    object EtNomeServer: TEdit
      Left = 8
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object EtNomeUtente: TEdit
      Left = 136
      Top = 24
      Width = 97
      Height = 21
      TabOrder = 1
      Text = 'anonymous'
    end
    object EtPassword: TEdit
      Left = 240
      Top = 24
      Width = 81
      Height = 21
      PasswordChar = '*'
      TabOrder = 2
    end
  end
  object LbCartelle: TListBox
    Left = 0
    Top = 55
    Width = 185
    Height = 398
    Align = alLeft
    ItemHeight = 13
    Sorted = True
    TabOrder = 3
    OnClick = LbCartelleClick
  end
  object FTP: TNMFTP
    Port = 21
    TimeOut = 5000
    ReportLevel = 0
    OnDisconnect = FTPDisconnect
    OnConnect = FTPConnect
    OnFailure = FTPFailure
    OnSuccess = FTPSuccess
    Vendor = 2411
    ParseList = True
    ProxyPort = 0
    Passive = False
    FirewallType = FTUser
    FWAuthenticate = False
    Left = 460
    Top = 261
  end
end
