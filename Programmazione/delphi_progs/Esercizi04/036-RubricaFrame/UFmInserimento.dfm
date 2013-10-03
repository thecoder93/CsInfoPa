object FmInserimento: TFmInserimento
  Left = 380
  Top = 157
  BorderStyle = bsDialog
  Caption = 'Nuovo indirizzo'
  ClientHeight = 147
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 106
    Width = 504
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 160
      Top = 8
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 264
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Annulla'
      TabOrder = 1
      Kind = bkCancel
    end
  end
  inline FrDataEntry1: TFrDataEntry
    Width = 504
    Height = 106
    Align = alClient
    TabOrder = 1
    inherited EtNome: TDBEdit
      DataSource = FmRubricaFrame.DsRubrica
    end
    inherited EtIndirizzo: TDBEdit
      Width = 286
      DataSource = FmRubricaFrame.DsRubrica
    end
    inherited EtEMail: TDBEdit
      DataSource = FmRubricaFrame.DsRubrica
    end
    inherited EtTelefono: TDBEdit
      DataSource = FmRubricaFrame.DsRubrica
    end
    inherited EtCellulare: TDBEdit
      Width = 134
      DataSource = FmRubricaFrame.DsRubrica
    end
  end
end
