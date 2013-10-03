object FmMastrini: TFmMastrini
  Left = 197
  Top = 248
  BorderStyle = bsDialog
  Caption = 'FmMastrini'
  ClientHeight = 272
  ClientWidth = 507
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
  object Label1: TLabel
    Left = 262
    Top = 8
    Width = 55
    Height = 13
    Caption = 'Descrizione'
    FocusControl = DBEdit1
  end
  object Label3: TLabel
    Left = 262
    Top = 132
    Width = 58
    Height = 13
    Caption = 'Spiegazione'
    FocusControl = DBMemo1
  end
  object DBEdit1: TDBEdit
    Left = 262
    Top = 22
    Width = 184
    Height = 21
    DataField = 'Descrizione'
    DataSource = dsMastrini
    TabOrder = 0
  end
  object DBMemo1: TDBMemo
    Left = 262
    Top = 146
    Width = 185
    Height = 89
    DataField = 'Spiegazione'
    DataSource = dsMastrini
    TabOrder = 2
  end
  object DBNavigator1: TDBNavigator
    Left = 262
    Top = 242
    Width = 240
    Height = 25
    DataSource = dsMastrini
    TabOrder = 3
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 262
    Top = 50
    Width = 113
    Height = 73
    Caption = 'Tipo'
    DataField = 'Tipo'
    DataSource = dsMastrini
    Items.Strings = (
      'Portafoglio'
      'Spesa'
      'Ricavo')
    TabOrder = 1
    Values.Strings = (
      'P'
      'S'
      'R')
  end
  object DBGrid1: TDBGrid
    Left = 4
    Top = 10
    Width = 251
    Height = 255
    DataSource = dsMastrini
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Descrizione'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tipo'
        Visible = True
      end>
  end
  object tbMastrini: TTable
    IndexDefs = <
      item
        Fields = 'ID_Mastrino'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'TipoDescr'
        CaseInsFields = 'Tipo;Descrizione'
        Fields = 'Tipo;Descrizione'
        Options = [ixCaseInsensitive]
      end>
    StoreDefs = True
    TableName = 'Mastrini'
    Left = 438
    Top = 56
    object tbMastriniID_Mastrino: TAutoIncField
      FieldName = 'ID_Mastrino'
    end
    object tbMastriniDescrizione: TStringField
      FieldName = 'Descrizione'
      Required = True
      Size = 30
    end
    object tbMastriniTipo: TStringField
      FieldName = 'Tipo'
      Required = True
      Size = 1
    end
    object tbMastriniSpiegazione: TMemoField
      FieldName = 'Spiegazione'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dsMastrini: TDataSource
    DataSet = tbMastrini
    Left = 442
    Top = 106
  end
end
