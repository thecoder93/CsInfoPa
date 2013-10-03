object FmVoti: TFmVoti
  Left = 240
  Top = 150
  Width = 526
  Height = 301
  Caption = 'Primo quadrimestre'
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
  object GdVoti: TDBGrid
    Left = 0
    Top = 0
    Width = 518
    Height = 274
    Align = alClient
    DataSource = DsVoti
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = GdVotiDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Cognome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Voto1'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Voto2'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Voto3'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Voto4'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Voto5'
        Width = 32
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Media'
        Visible = True
      end>
  end
  object DsVoti: TDataSource
    DataSet = TbVoti
    Left = 104
    Top = 136
  end
  object TbVoti: TTable
    OnCalcFields = TbVotiCalcFields
    IndexDefs = <
      item
        Name = 'TbVotiIndex1'
        Fields = 'Cognome;Nome'
        Options = [ixPrimary]
      end>
    IndexFieldNames = 'Cognome;Nome'
    StoreDefs = True
    TableName = 'Voti'
    Left = 168
    Top = 136
    object TbVotiCognome: TStringField
      FieldName = 'Cognome'
    end
    object TbVotiNome: TStringField
      FieldName = 'Nome'
    end
    object TbVotiVoto1: TFloatField
      FieldName = 'Voto1'
      MaxValue = 10
      Precision = 3
    end
    object TbVotiVoto2: TFloatField
      FieldName = 'Voto2'
      MaxValue = 10
      Precision = 3
    end
    object TbVotiVoto3: TFloatField
      FieldName = 'Voto3'
      MaxValue = 10
      Precision = 3
    end
    object TbVotiVoto4: TFloatField
      FieldName = 'Voto4'
      MaxValue = 10
      Precision = 3
    end
    object TbVotiVoto5: TFloatField
      FieldName = 'Voto5'
      MaxValue = 10
      Precision = 3
    end
    object TbVotiMedia: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Media'
      Precision = 3
      Calculated = True
    end
  end
end
