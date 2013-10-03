object FmEstratti: TFmEstratti
  Left = 203
  Top = 114
  Width = 370
  Height = 435
  Caption = 'FmEstratti'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DbGrMastrini: TDBGrid
    Left = 3
    Top = 32
    Width = 353
    Height = 141
    Anchors = [akLeft, akTop, akRight]
    DataSource = dsMastrini
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DbGrEstratti: TDBGrid
    Left = 4
    Top = 180
    Width = 353
    Height = 223
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DsEstratti
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object BtExcel: TButton
    Left = 4
    Top = 2
    Width = 105
    Height = 25
    Caption = 'Esporta su Excel'
    TabOrder = 2
    OnClick = BtExcelClick
  end
  object QrMastrini: TQuery
    AfterScroll = QrMastriniAfterScroll
    Left = 118
    Top = 46
  end
  object dsMastrini: TDataSource
    DataSet = QrMastrini
    Left = 156
    Top = 48
  end
  object QrEstratti: TQuery
    Left = 124
    Top = 218
  end
  object DsEstratti: TDataSource
    DataSet = QrEstratti
    Left = 170
    Top = 222
  end
  object DlgSalva: TSaveDialog
    DefaultExt = 'xls'
    Filter = 'Documenti Excel (*.xls)|*.xls|Tutti i file (*.*)|*.*'
    Left = 226
    Top = 48
  end
end
