object dmDati: TdmDati
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 232
  Top = 394
  Height = 480
  Width = 696
  object tbMovimenti: TTable
    AfterInsert = tbMovimentiAfterInsert
    BeforeDelete = tbMovimentiBeforeDelete
    IndexDefs = <
      item
        Name = 'tbMovimentiIndex1'
        Fields = 'ID_Movimento'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'Data'
        Fields = 'Data'
      end
      item
        Name = 'TipoData'
        Fields = 'Tipo;Data'
      end
      item
        Name = 'TipoRiferimento'
        Fields = 'Tipo;Riferimento'
      end>
    StoreDefs = True
    TableName = 'Movimenti'
    Left = 116
    Top = 10
    object tbMovimentiID_Movimento: TAutoIncField
      FieldName = 'ID_Movimento'
    end
    object tbMovimentiTipo: TStringField
      FieldName = 'Tipo'
      Required = True
      Size = 1
    end
    object tbMovimentiData: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'Data'
      Required = True
    end
    object tbMovimentiMotivo: TStringField
      FieldName = 'Motivo'
      Size = 30
    end
    object tbMovimentiRiferimento: TIntegerField
      FieldName = 'Riferimento'
    end
    object tbMovimentiNote: TMemoField
      FieldName = 'Note'
      BlobType = ftMemo
      Size = 10
    end
  end
  object tbRigheMov: TTable
    IndexDefs = <
      item
        Name = 'tbRigheMovIndex1'
        Fields = 'ID_Movimento;ID_Riga'
        Options = [ixPrimary, ixUnique]
      end>
    MasterFields = 'ID_Movimento'
    MasterSource = dsMovimenti
    StoreDefs = True
    TableName = 'RigheMov'
    Left = 198
    Top = 16
    object tbRigheMovID_Movimento: TIntegerField
      FieldName = 'ID_Movimento'
    end
    object tbRigheMovID_Riga: TAutoIncField
      FieldName = 'ID_Riga'
    end
    object tbRigheMovID_Mastrino: TIntegerField
      FieldName = 'ID_Mastrino'
      Required = True
    end
    object tbRigheMovImporto: TCurrencyField
      FieldName = 'Importo'
      Required = True
    end
  end
  object tbMastrini: TTable
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
    Left = 290
    Top = 44
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
  object dsMovimenti: TDataSource
    DataSet = tbMovimenti
    Left = 154
    Top = 74
  end
  object tbPortafogli: TTable
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
    Left = 338
    Top = 10
  end
end
