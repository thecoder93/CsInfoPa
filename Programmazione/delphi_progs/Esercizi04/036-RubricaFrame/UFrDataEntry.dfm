object FrDataEntry: TFrDataEntry
  Left = 0
  Top = 0
  Width = 515
  Height = 105
  TabOrder = 0
  object StNome: TLabel
    Left = 8
    Top = 8
    Width = 28
    Height = 13
    Caption = 'Nome'
    FocusControl = EtNome
  end
  object StIndirizzo: TLabel
    Left = 208
    Top = 8
    Width = 38
    Height = 13
    Caption = 'Indirizzo'
    FocusControl = EtIndirizzo
  end
  object StEMail: TLabel
    Left = 8
    Top = 56
    Width = 26
    Height = 13
    Caption = 'EMail'
    FocusControl = EtEMail
  end
  object StTelefono: TLabel
    Left = 208
    Top = 56
    Width = 42
    Height = 13
    Caption = 'Telefono'
    FocusControl = EtTelefono
  end
  object StCellulare: TLabel
    Left = 360
    Top = 56
    Width = 40
    Height = 13
    Caption = 'Cellulare'
    FocusControl = EtCellulare
  end
  object EtNome: TDBEdit
    Left = 8
    Top = 24
    Width = 193
    Height = 21
    DataField = 'Nome'
    TabOrder = 0
  end
  object EtIndirizzo: TDBEdit
    Left = 208
    Top = 24
    Width = 297
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'Indirizzo'
    TabOrder = 1
  end
  object EtEMail: TDBEdit
    Left = 8
    Top = 72
    Width = 193
    Height = 21
    DataField = 'EMail'
    TabOrder = 2
  end
  object EtTelefono: TDBEdit
    Left = 208
    Top = 72
    Width = 145
    Height = 21
    DataField = 'Telefono'
    TabOrder = 3
  end
  object EtCellulare: TDBEdit
    Left = 360
    Top = 72
    Width = 145
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'Cellulare'
    TabOrder = 4
  end
end
