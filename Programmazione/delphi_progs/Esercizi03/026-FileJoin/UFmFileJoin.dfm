object FmFileJoin: TFmFileJoin
  Left = 245
  Top = 189
  Width = 353
  Height = 267
  Caption = 'Concatenazione di file'
  Color = clBtnFace
  Constraints.MinHeight = 208
  Constraints.MinWidth = 210
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 135
    Height = 13
    Caption = 'Nomi dei file da concatenare'
  end
  object Label2: TLabel
    Left = 8
    Top = 167
    Width = 106
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Nome del file risultante'
  end
  object LbFileNames: TListBox
    Left = 8
    Top = 24
    Width = 249
    Height = 136
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 0
  end
  object PbAddFile: TButton
    Left = 264
    Top = 24
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Aggiungi...'
    TabOrder = 1
    OnClick = PbAddFileClick
  end
  object PbDeleteFile: TButton
    Left = 264
    Top = 56
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Elimina'
    TabOrder = 2
    OnClick = PbDeleteFileClick
  end
  object EtDestFileName: TEdit
    Left = 8
    Top = 183
    Width = 249
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 4
  end
  object PbBrowse: TButton
    Left = 264
    Top = 179
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Sfoglia...'
    TabOrder = 5
    OnClick = PbBrowseClick
  end
  object PbJoin: TProgressBar
    Left = 56
    Top = 215
    Width = 281
    Height = 16
    Anchors = [akLeft, akRight, akBottom]
    Min = 0
    Max = 100
    Smooth = True
    Step = 1
    TabOrder = 7
  end
  object PbDeleteAllFiles: TButton
    Left = 264
    Top = 88
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Elimina tutto'
    TabOrder = 3
    OnClick = PbDeleteAllFilesClick
  end
  object PbGo: TButton
    Left = 8
    Top = 209
    Width = 41
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Vai!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = PbGoClick
  end
end
