object GameForm: TGameForm
  Left = 201
  Top = 135
  AutoScroll = False
  Caption = 'Sokoban'
  ClientHeight = 200
  ClientWidth = 332
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 340
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 332
    Height = 33
    Align = alTop
    TabOrder = 0
    DesignSize = (
      332
      33)
    object chkDoubleSize: TCheckBox
      Left = 252
      Top = 8
      Width = 77
      Height = 17
      Anchors = [akTop, akRight]
      Caption = '&Double size'
      TabOrder = 0
      OnClick = chkDoubleSizeClick
    end
    object btnResetGame: TButton
      Left = 8
      Top = 4
      Width = 73
      Height = 25
      Caption = 'New game'
      TabOrder = 1
      OnClick = btnResetGameClick
    end
    object btnScoreBoard: TButton
      Left = 168
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Score board'
      TabOrder = 2
      OnClick = btnScoreBoardClick
    end
    object btnRestartLevel: TButton
      Left = 88
      Top = 4
      Width = 73
      Height = 25
      Caption = 'Restart level'
      TabOrder = 3
      OnClick = btnRestartLevelClick
    end
  end
  object pnlGame: TPanel
    Left = 0
    Top = 93
    Width = 332
    Height = 107
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 33
    Width = 332
    Height = 60
    Align = alTop
    BevelInner = bvLowered
    BorderWidth = 1
    TabOrder = 2
    object Shape1: TShape
      Left = 123
      Top = 3
      Width = 1
      Height = 54
      Align = alLeft
      Pen.Color = clBtnShadow
    end
    object Panel4: TPanel
      Left = 3
      Top = 3
      Width = 120
      Height = 54
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      BorderWidth = 3
      Constraints.MinWidth = 120
      TabOrder = 0
      object lblPlayerMoves: TLabel
        Left = 3
        Top = 4
        Width = 71
        Height = 13
        Caption = 'lblPlayerMoves'
      end
      object lblBoxMoves: TLabel
        Left = 3
        Top = 20
        Width = 60
        Height = 13
        Caption = 'lblBoxMoves'
      end
      object lblTime: TLabel
        Left = 3
        Top = 36
        Width = 33
        Height = 13
        Caption = 'lblTime'
      end
    end
    object Panel5: TPanel
      Left = 231
      Top = 3
      Width = 98
      Height = 54
      Align = alRight
      AutoSize = True
      BevelOuter = bvNone
      BorderWidth = 5
      TabOrder = 1
      object lblLevelNumber: TLabel
        Left = 19
        Top = 22
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = 'lblLevelNumber'
      end
      object lblLevelName: TLabel
        Left = 5
        Top = 6
        Width = 88
        Height = 16
        Alignment = taRightJustify
        Caption = 'lblLevelName'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblGameState: TLabel
        Left = 29
        Top = 38
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'lblGameState'
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 8
    Top = 96
  end
  object XPManifest1: TXPManifest
    Left = 40
    Top = 96
  end
end
