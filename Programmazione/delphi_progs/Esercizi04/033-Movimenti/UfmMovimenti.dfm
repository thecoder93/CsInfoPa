object fmMovimenti: TfmMovimenti
  Left = 254
  Top = 172
  BorderStyle = bsDialog
  Caption = 'fmMovimenti'
  ClientHeight = 389
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 168
    Top = 48
    Width = 23
    Height = 13
    Caption = 'Data'
    FocusControl = dbetData
  end
  object Label3: TLabel
    Left = 168
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Motivo'
    FocusControl = dbetMotivo
  end
  object Label4: TLabel
    Left = 256
    Top = 48
    Width = 53
    Height = 13
    Caption = 'Riferimento'
    FocusControl = dbetRiferimento
  end
  object Label5: TLabel
    Left = 366
    Top = 8
    Width = 23
    Height = 13
    Caption = 'Note'
    FocusControl = dbetNote
  end
  object Label1: TLabel
    Left = 170
    Top = 88
    Width = 94
    Height = 13
    Caption = 'Portafoglio da usare'
    FocusControl = dbetRiferimento
  end
  object Label6: TLabel
    Left = 362
    Top = 88
    Width = 30
    Height = 13
    Caption = 'Totale'
  end
  object lbTotale: TLabel
    Left = 364
    Top = 106
    Width = 47
    Height = 13
    Caption = 'lbTotale'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbetData: TDBEdit
    Left = 168
    Top = 62
    Width = 64
    Height = 21
    DataField = 'Data'
    DataSource = dsMovimenti
    TabOrder = 0
  end
  object dbetMotivo: TDBEdit
    Left = 168
    Top = 22
    Width = 184
    Height = 21
    DataField = 'Motivo'
    DataSource = dsMovimenti
    TabOrder = 1
  end
  object dbetRiferimento: TDBEdit
    Left = 256
    Top = 62
    Width = 64
    Height = 21
    DataField = 'Riferimento'
    DataSource = dsMovimenti
    TabOrder = 2
  end
  object dbetNote: TDBMemo
    Left = 362
    Top = 22
    Width = 185
    Height = 65
    DataField = 'Note'
    DataSource = dsMovimenti
    TabOrder = 3
  end
  object DBNavigator1: TDBNavigator
    Left = 168
    Top = 134
    Width = 380
    Height = 27
    DataSource = dsMovimenti
    TabOrder = 4
  end
  object dbetPortafoglio: TDBLookupComboBox
    Left = 168
    Top = 102
    Width = 187
    Height = 21
    DataField = 'ID_Mastrino'
    DataSource = dsMovimenti
    KeyField = 'ID_Mastrino'
    ListField = 'Descrizione'
    ListSource = dsPortafogli
    TabOrder = 5
  end
  object dbrgTipo: TDBRadioGroup
    Left = 6
    Top = 12
    Width = 155
    Height = 149
    Caption = 'Tipo movimento:'
    DataField = 'Tipo'
    DataSource = dsMovimenti
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Items.Strings = (
      'Spesa / Uscita'
      'Ricavo / Entrata'
      'Trasferimento')
    ParentFont = False
    TabOrder = 6
    Values.Strings = (
      'S'
      'R'
      'T')
  end
  object DbgrRighe: TDBGrid
    Left = 168
    Top = 166
    Width = 381
    Height = 217
    DataSource = dsRigheMov
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DescMastrino'
        Title.Caption = 'Descrizione Mastrino'
        Width = 224
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Importo'
        Title.Alignment = taRightJustify
        Width = 119
        Visible = True
      end>
  end
  object dsRigheMov: TDataSource
    DataSet = dmDati.tbRigheMov
    Left = 110
    Top = 228
  end
  object dsMovimenti: TDataSource
    DataSet = dmDati.tbMovimenti
    OnDataChange = dsMovimentiDataChange
    Left = 110
    Top = 196
  end
  object dsMastrini: TDataSource
    DataSet = dmDati.tbMastrini
    OnDataChange = dsMovimentiDataChange
    Left = 110
    Top = 260
  end
  object dsPortafogli: TDataSource
    DataSet = dmDati.tbPortafogli
    Left = 110
    Top = 292
  end
end
