object FmEstratti: TFmEstratti
  Left = 158
  Top = 118
  Width = 405
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
    Width = 388
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
    OnCellClick = DbGrMastriniClick
  end
  object DbGrEstratti: TDBGrid
    Left = 4
    Top = 180
    Width = 388
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
  object QrMastrini: TQuery
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
end
