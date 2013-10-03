object fmMovimenti: TfmMovimenti
  Left = 254
  Top = 172
  BorderStyle = bsDialog
  Caption = 'fmMovimenti'
  ClientHeight = 390
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
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
    Width = 56
    Height = 13
    Caption = 'Num di rifer.'
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
    Top = 100
    Width = 380
    Height = 27
    DataSource = dsMovimenti
    TabOrder = 4
  end
  object dbrgTipo: TDBRadioGroup
    Left = 6
    Top = 12
    Width = 155
    Height = 115
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
    TabOrder = 5
    Values.Strings = (
      'S'
      'R'
      'T')
  end
  object SbFrame: TScrollBox
    Left = 106
    Top = 132
    Width = 443
    Height = 234
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 6
  end
  object BtAggiungi: TBitBtn
    Left = 276
    Top = 368
    Width = 137
    Height = 21
    Anchors = [akLeft, akBottom]
    Caption = '&Aggiungi una riga'
    TabOrder = 7
    OnClick = BtAggiungiClick
  end
  object dsRigheMov: TDataSource
    DataSet = dmDati.tbRigheMov
    Left = 8
    Top = 168
  end
  object dsMovimenti: TDataSource
    DataSet = dmDati.tbMovimenti
    Left = 8
    Top = 136
  end
  object dsMastrini: TDataSource
    DataSet = dmDati.tbMastrini
    Left = 8
    Top = 200
  end
  object DsPortafogli: TDataSource
    DataSet = dmDati.tbPortafogli
    Left = 8
    Top = 230
  end
end
