object LevelsEditorForm: TLevelsEditorForm
  Left = 215
  Top = 186
  Width = 400
  Height = 300
  Caption = 'Sokoban Levels editor'
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 196
    Width = 392
    Height = 70
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnDeleteRow: TButton
      Left = 8
      Top = 36
      Width = 73
      Height = 25
      Caption = 'Delete row'
      TabOrder = 0
      OnClick = btnDeleteRowClick
    end
    object btnOpenInEditor: TButton
      Left = 176
      Top = 4
      Width = 105
      Height = 25
      Caption = 'Open map in editor'
      TabOrder = 1
      OnClick = btnOpenInEditorClick
    end
    object btnMoveDown: TButton
      Left = 88
      Top = 36
      Width = 75
      Height = 25
      Caption = 'Move down'
      TabOrder = 2
      OnClick = btnMoveDownClick
    end
    object btnMoveUp: TButton
      Left = 88
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Move up'
      TabOrder = 3
      OnClick = btnMoveUpClick
    end
    object btnClear: TButton
      Left = 8
      Top = 4
      Width = 73
      Height = 25
      Caption = 'Clear'
      TabOrder = 4
      OnClick = btnClearClick
    end
    object btnNewMap: TButton
      Left = 176
      Top = 36
      Width = 105
      Height = 25
      Caption = 'Create new map'
      TabOrder = 5
      OnClick = btnNewMapClick
    end
    object btnOk: TButton
      Left = 304
      Top = 4
      Width = 81
      Height = 25
      Caption = 'Ok'
      TabOrder = 6
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 304
      Top = 36
      Width = 81
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 7
    end
  end
  object ValueListEditor1: TValueListEditor
    Left = 0
    Top = 0
    Width = 392
    Height = 196
    Align = alClient
    KeyOptions = [keyEdit, keyAdd, keyDelete]
    Strings.Strings = (
      '')
    TabOrder = 1
    TitleCaptions.Strings = (
      'Map filename'
      'Description')
    ColWidths = (
      141
      245)
  end
end
