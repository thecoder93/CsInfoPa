object ScoreBoardForm: TScoreBoardForm
  Left = 206
  Top = 152
  Width = 439
  Height = 327
  Caption = 'Sokoban - Score Board'
  Color = clBtnFace
  Constraints.MinHeight = 327
  Constraints.MinWidth = 439
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 253
    Width = 431
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      431
      40)
    object btnClose: TButton
      Left = 350
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Ok'
      TabOrder = 0
      OnClick = btnCloseClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 431
    Height = 253
    Align = alClient
    TabOrder = 1
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 429
      Height = 18
      Align = alTop
      Alignment = taCenter
      Caption = 'Best scores'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ListView1: TListView
      Left = 1
      Top = 19
      Width = 429
      Height = 233
      Align = alClient
      Columns = <
        item
          Caption = '#'
          Width = 25
        end
        item
          Caption = 'Player'
          Width = 150
        end
        item
          Caption = 'Scores'
          Width = 70
        end
        item
          Caption = 'Game time'
          Width = 70
        end
        item
          Caption = 'Date'
          Width = 110
        end>
      GridLines = True
      ReadOnly = True
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
end
