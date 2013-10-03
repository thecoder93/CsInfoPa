object FmRubricaFrame: TFmRubricaFrame
  Left = 184
  Top = 114
  Width = 634
  Height = 411
  Caption = 'Rubrica con frame'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefaultPosOnly
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object GdRubrica: TDBGrid
    Left = 0
    Top = 25
    Width = 626
    Height = 235
    Align = alClient
    DataSource = DsRubrica
    Options = [dgAlwaysShowEditor, dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Indirizzo'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMail'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Telefono'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cellulare'
        Width = 100
        Visible = True
      end>
  end
  object NvRubrica: TDBNavigator
    Left = 0
    Top = 0
    Width = 626
    Height = 25
    DataSource = DsRubrica
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
    Align = alTop
    Flat = True
    TabOrder = 1
    OnClick = NvRubricaClick
  end
  inline FrModifica: TFrDataEntry
    Top = 260
    Width = 626
    Align = alBottom
    TabOrder = 2
    inherited EtNome: TDBEdit
      DataSource = DsRubrica
    end
    inherited EtIndirizzo: TDBEdit
      Width = 408
      DataSource = DsRubrica
    end
    inherited EtEMail: TDBEdit
      DataSource = DsRubrica
    end
    inherited EtTelefono: TDBEdit
      DataSource = DsRubrica
    end
    inherited EtCellulare: TDBEdit
      Width = 256
      DataSource = DsRubrica
    end
  end
  object MainMenu1: TMainMenu
    Left = 176
    Top = 32
    object File1: TMenuItem
      Caption = '&File'
      object Esci1: TMenuItem
        Caption = '&Esci'
        OnClick = Esci1Click
      end
    end
    object Indirizzo1: TMenuItem
      Caption = '&Indirizzo'
      object Aggiungi1: TMenuItem
        Caption = '&Aggiungi'
        OnClick = Aggiungi1Click
      end
      object Elimina1: TMenuItem
        Caption = '&Elimina'
        OnClick = Elimina1Click
      end
      object EliminaTutti1: TMenuItem
        Caption = 'Elimina &Tutti'
        OnClick = EliminaTutti1Click
      end
    end
  end
  object CdsRubrica: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 96
    object CdsRubricaNome: TStringField
      FieldName = 'Nome'
      Size = 40
    end
    object CdsRubricaIndirizzo: TStringField
      FieldName = 'Indirizzo'
      Size = 80
    end
    object CdsRubricaEMail: TStringField
      FieldName = 'EMail'
      Size = 40
    end
    object CdsRubricaTelefono: TStringField
      FieldName = 'Telefono'
    end
    object CdsRubricaCellulare: TStringField
      FieldName = 'Cellulare'
    end
  end
  object DsRubrica: TDataSource
    DataSet = CdsRubrica
    Left = 336
    Top = 96
  end
end
