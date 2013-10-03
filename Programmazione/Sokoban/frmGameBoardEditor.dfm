object GameBoardEditorForm: TGameBoardEditorForm
  Left = 252
  Top = 137
  Width = 600
  Height = 300
  Caption = 'Sokoban Map Editor'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 592
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      592
      41)
    object Label1: TLabel
      Left = 72
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Place'
    end
    object Label2: TLabel
      Left = 232
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Zoom'
    end
    object cmbObjectToPlace: TComboBox
      Left = 104
      Top = 12
      Width = 113
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'Wall cell'
      Items.Strings = (
        'Wall cell'
        'Free cell'
        'Goal cell'
        'Box'
        'Player')
    end
    object btnSettings: TButton
      Left = 8
      Top = 8
      Width = 57
      Height = 25
      Caption = 'Settings'
      TabOrder = 1
      OnClick = btnSettingsClick
    end
    object btnNew: TButton
      Left = 304
      Top = 8
      Width = 65
      Height = 25
      Caption = 'New board'
      TabOrder = 2
      OnClick = btnNewClick
    end
    object btnLoad: TButton
      Left = 376
      Top = 8
      Width = 65
      Height = 25
      Caption = 'Open file'
      TabOrder = 3
      OnClick = btnLoadClick
    end
    object btnSaveAs: TButton
      Left = 448
      Top = 8
      Width = 65
      Height = 25
      Caption = 'Save as'
      TabOrder = 4
      OnClick = btnSaveAsClick
    end
    object Button1: TButton
      Left = 528
      Top = 8
      Width = 59
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Exit'
      ModalResult = 1
      TabOrder = 5
      OnClick = Button1Click
    end
    object numZoom: TSpinEdit
      Left = 264
      Top = 12
      Width = 33
      Height = 22
      MaxValue = 8
      MinValue = 1
      TabOrder = 6
      Value = 1
      OnChange = numZoomChange
    end
  end
  object ScrollBox: TScrollBox
    Left = 0
    Top = 41
    Width = 592
    Height = 225
    Align = alClient
    TabOrder = 1
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.xml'
    Filter = 'XML files|*.xml|Text files|*.txt|All files|*.*'
    Options = [ofFileMustExist, ofEnableSizing]
    Left = 8
    Top = 48
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.xml'
    Filter = 'XML files|*.xml|Text files|*.txt|All files|*.*'
    Options = [ofOverwritePrompt, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 40
    Top = 48
  end
end
