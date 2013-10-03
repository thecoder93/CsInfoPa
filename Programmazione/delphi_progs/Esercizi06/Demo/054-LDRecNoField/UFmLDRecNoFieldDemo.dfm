object Form1: TForm1
  Left = 188
  Top = 147
  Width = 465
  Height = 204
  Caption = 'FmLDRecNoFieldDemo'
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 441
    Height = 161
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'RecNo'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SIZE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WEIGHT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AREA'
        Visible = True
      end>
  end
  object Table1: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'animals.dbf'
    Left = 64
    Top = 56
    object Table1NAME: TStringField
      FieldName = 'NAME'
      Size = 10
    end
    object Table1SIZE: TSmallintField
      FieldName = 'SIZE'
    end
    object Table1WEIGHT: TSmallintField
      FieldName = 'WEIGHT'
    end
    object Table1AREA: TStringField
      FieldName = 'AREA'
    end
    object Table1RecNo: TLDRecNoField
      FieldName = 'RecNo'
    end
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 112
    Top = 56
  end
end
