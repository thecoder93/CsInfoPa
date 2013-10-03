object FmMastrini: TFmMastrini
  Left = 196
  Top = 248
  BorderStyle = bsDialog
  Caption = 'Mastrini'
  ClientHeight = 271
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnDestra: TPanel
    Left = 148
    Top = 0
    Width = 490
    Height = 271
    Align = alRight
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 262
      Top = 242
      Width = 220
      Height = 25
      DataSource = dsMastrini
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 4
      Top = 10
      Width = 247
      Height = 255
      DataSource = dsMastrini
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
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
    object pnEdit: TPanel
      Left = 256
      Top = 4
      Width = 231
      Height = 231
      BevelOuter = bvNone
      TabOrder = 2
      object Label3: TLabel
        Left = 16
        Top = 122
        Width = 58
        Height = 13
        Caption = 'Spiegazione'
        FocusControl = DBMemo1
      end
      object Label1: TLabel
        Left = 16
        Top = 4
        Width = 55
        Height = 13
        Caption = 'Descrizione'
      end
      object dbetDescrizione: TDBEdit
        Left = 6
        Top = 18
        Width = 219
        Height = 21
        DataField = 'Descrizione'
        DataSource = dsMastrini
        TabOrder = 0
      end
      object DBMemo1: TDBMemo
        Left = 6
        Top = 136
        Width = 219
        Height = 89
        DataField = 'Spiegazione'
        DataSource = dsMastrini
        TabOrder = 2
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 8
        Top = 44
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
    end
  end
  object pnSinistra: TPanel
    Left = 0
    Top = 0
    Width = 148
    Height = 271
    Align = alClient
    TabOrder = 1
    object cbFiltro: TCheckBox
      Left = 6
      Top = 112
      Width = 127
      Height = 17
      Caption = 'Solo descrizione con:'
      TabOrder = 0
      OnClick = cbFiltroClick
    end
    object rgRange: TRadioGroup
      Left = 6
      Top = 6
      Width = 133
      Height = 97
      Caption = 'Tipo'
      ItemIndex = 0
      Items.Strings = (
        'Tutti'
        'solo Portafogli'
        'solo Spese'
        'solo Ricavi')
      TabOrder = 1
      OnClick = rgRangeClick
    end
    object etFiltroDescr: TEdit
      Left = 14
      Top = 134
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'etFiltroDescr'
      OnChange = etFiltroDescrChange
    end
  end
  object tbMastrini: TTable
    AfterInsert = tbMastriniAfterInsertEdit
    AfterEdit = tbMastriniAfterInsertEdit
    OnFilterRecord = tbMastriniFilterRecord
    IndexDefs = <
      item
        Name = 'tbMastriniIndex1'
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
    Left = 550
    Top = 54
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
    OnDataChange = dsMastriniDataChange
    Left = 552
    Top = 92
  end
end
