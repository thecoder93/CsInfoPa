object FrRighe: TFrRighe
  Left = 0
  Top = 0
  Width = 414
  Height = 35
  TabOrder = 0
  object LbProg: TLabel
    Left = 2
    Top = 12
    Width = 34
    Height = 13
    Caption = 'LbProg'
  end
  object BtMeno: TSpeedButton
    Left = 399
    Top = 6
    Width = 15
    Height = 21
    Caption = '-'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EtMastrini: TDBLookupComboBox
    Left = 22
    Top = 6
    Width = 233
    Height = 21
    TabOrder = 0
  end
  object EtImporto: TEdit
    Left = 260
    Top = 6
    Width = 135
    Height = 21
    TabOrder = 1
    Text = 'EtImporto'
    OnKeyPress = EtImportoKeyPress
  end
end
