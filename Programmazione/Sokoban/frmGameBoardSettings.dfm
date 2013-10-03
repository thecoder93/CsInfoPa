object GameBoardSettingsForm: TGameBoardSettingsForm
  Left = 215
  Top = 121
  Width = 360
  Height = 396
  Caption = 'GameBoardSettingsForm'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 360
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 352
    Height = 321
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 16
      Top = 88
      Width = 305
      Height = 433
      Caption = ' Style '
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 20
        Width = 38
        Height = 13
        Caption = 'Cell size'
      end
      object Label4: TLabel
        Left = 184
        Top = 20
        Width = 26
        Height = 13
        Caption = 'pixels'
      end
      object numCellSize: TSpinEdit
        Left = 56
        Top = 16
        Width = 121
        Height = 22
        MaxValue = 100
        MinValue = 5
        TabOrder = 0
        Value = 20
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 144
        Width = 289
        Height = 65
        Caption = ' Free cells '
        TabOrder = 1
        object Label5: TLabel
          Left = 88
          Top = 30
          Width = 45
          Height = 13
          Caption = 'Image file'
        end
        object btnFreeColor: TButton
          Left = 16
          Top = 24
          Width = 49
          Height = 25
          Caption = 'Color'
          TabOrder = 0
          OnClick = btnFreeColorClick
        end
        object txtFreePicture: TEdit
          Left = 136
          Top = 26
          Width = 145
          Height = 21
          TabOrder = 1
        end
        object pnlFreeColor: TPanel
          Left = 64
          Top = 24
          Width = 17
          Height = 25
          Color = clBlack
          TabOrder = 2
        end
      end
      object chkDoubleBuffer: TCheckBox
        Left = 144
        Top = 48
        Width = 97
        Height = 17
        Caption = 'Double buffer'
        TabOrder = 2
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 72
        Width = 289
        Height = 65
        Caption = ' Wall cells '
        TabOrder = 3
        object Label6: TLabel
          Left = 88
          Top = 30
          Width = 45
          Height = 13
          Caption = 'Image file'
        end
        object btnWallColor: TButton
          Left = 16
          Top = 24
          Width = 49
          Height = 25
          Caption = 'Color'
          TabOrder = 0
          OnClick = btnWallColorClick
        end
        object txtWallPicture: TEdit
          Left = 136
          Top = 26
          Width = 145
          Height = 21
          TabOrder = 1
        end
        object pnlWallColor: TPanel
          Left = 64
          Top = 24
          Width = 17
          Height = 25
          Color = clBlack
          TabOrder = 2
        end
      end
      object GroupBox5: TGroupBox
        Left = 8
        Top = 216
        Width = 289
        Height = 65
        Caption = ' Goal cells '
        TabOrder = 4
        object Label7: TLabel
          Left = 88
          Top = 30
          Width = 45
          Height = 13
          Caption = 'Image file'
        end
        object btnGoalColor: TButton
          Left = 16
          Top = 24
          Width = 49
          Height = 25
          Caption = 'Color'
          TabOrder = 0
          OnClick = btnGoalColorClick
        end
        object txtGoalPicture: TEdit
          Left = 136
          Top = 26
          Width = 145
          Height = 21
          TabOrder = 1
        end
        object pnlGoalColor: TPanel
          Left = 64
          Top = 24
          Width = 17
          Height = 25
          Color = clBlack
          TabOrder = 2
        end
      end
      object GroupBox7: TGroupBox
        Left = 8
        Top = 288
        Width = 289
        Height = 65
        Caption = ' Boxes '
        TabOrder = 5
        object Label9: TLabel
          Left = 88
          Top = 30
          Width = 45
          Height = 13
          Caption = 'Image file'
        end
        object btnBoxColor: TButton
          Left = 16
          Top = 24
          Width = 49
          Height = 25
          Caption = 'Color'
          TabOrder = 0
          OnClick = btnBoxColorClick
        end
        object txtBoxPicture: TEdit
          Left = 136
          Top = 26
          Width = 145
          Height = 21
          TabOrder = 1
        end
        object pnlBoxColor: TPanel
          Left = 64
          Top = 24
          Width = 17
          Height = 25
          Color = clBlack
          TabOrder = 2
        end
      end
      object GroupBox6: TGroupBox
        Left = 8
        Top = 360
        Width = 289
        Height = 65
        Caption = ' Player '
        TabOrder = 6
        object Label8: TLabel
          Left = 88
          Top = 30
          Width = 45
          Height = 13
          Caption = 'Image file'
        end
        object btnPlayerColor: TButton
          Left = 16
          Top = 24
          Width = 49
          Height = 25
          Caption = 'Color'
          TabOrder = 0
          OnClick = btnPlayerColorClick
        end
        object txtPlayerPicture: TEdit
          Left = 136
          Top = 26
          Width = 145
          Height = 21
          TabOrder = 1
        end
        object pnlPlayerColor: TPanel
          Left = 64
          Top = 24
          Width = 17
          Height = 25
          Color = clBlack
          TabOrder = 2
        end
      end
      object chkVisibleGridLines: TCheckBox
        Left = 8
        Top = 48
        Width = 105
        Height = 17
        Caption = 'Visible grid lines'
        TabOrder = 7
      end
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 8
      Width = 305
      Height = 73
      Caption = ' Board settings '
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 27
        Height = 13
        Caption = 'Rows'
      end
      object Label2: TLabel
        Left = 8
        Top = 44
        Width = 40
        Height = 13
        Caption = 'Columns'
      end
      object numRows: TSpinEdit
        Left = 72
        Top = 16
        Width = 121
        Height = 22
        MaxValue = 1000
        MinValue = 5
        TabOrder = 0
        Value = 5
      end
      object numColumns: TSpinEdit
        Left = 72
        Top = 40
        Width = 121
        Height = 22
        MaxValue = 1000
        MinValue = 5
        TabOrder = 1
        Value = 5
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 321
    Width = 352
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnCancel: TButton
      Left = 256
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Cancel'
      ModalResult = 2
      TabOrder = 0
    end
    object btnOK: TButton
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Ok'
      ModalResult = 1
      TabOrder = 1
    end
  end
  object ColorDialog1: TColorDialog
    Left = 8
    Top = 328
  end
end
