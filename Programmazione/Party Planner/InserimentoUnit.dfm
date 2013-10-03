object Form2: TForm2
  Left = 297
  Top = 590
  Width = 178
  Height = 105
  Caption = 'Inserimento'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object teInserimento: TEdit
    Left = 32
    Top = 8
    Width = 105
    Height = 21
    TabOrder = 0
  end
  object tbInserisci: TButton
    Left = 8
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Inserisci'
    TabOrder = 1
    OnClick = tbInserisciClick
  end
  object tbAnnulla: TButton
    Left = 88
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Annulla'
    TabOrder = 2
    OnClick = tbAnnullaClick
  end
end
