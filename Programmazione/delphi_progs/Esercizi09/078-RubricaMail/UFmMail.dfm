object FmMail: TFmMail
  Left = 58
  Top = 108
  Width = 657
  Height = 276
  Caption = 'Invio di messaggi e-mail'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 56
    Height = 13
    Caption = 'Destinatario'
  end
  object Label3: TLabel
    Left = 328
    Top = 8
    Width = 51
    Height = 13
    Caption = 'Messaggio'
  end
  object Label4: TLabel
    Left = 8
    Top = 56
    Width = 38
    Height = 13
    Caption = 'Allegato'
  end
  object Label2: TLabel
    Left = 8
    Top = 104
    Width = 38
    Height = 13
    Caption = 'Oggetto'
  end
  object EtMessaggio: TMemo
    Left = 328
    Top = 24
    Width = 313
    Height = 217
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object BtInvia: TButton
    Left = 72
    Top = 160
    Width = 161
    Height = 25
    Caption = 'Invia'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BtInviaClick
  end
  object BtChiudi: TButton
    Left = 72
    Top = 200
    Width = 161
    Height = 25
    Cancel = True
    Caption = 'Chiudi'
    ModalResult = 2
    TabOrder = 6
  end
  object BtScegliAllegato: TButton
    Left = 294
    Top = 72
    Width = 27
    Height = 21
    Caption = '...'
    TabOrder = 2
    OnClick = BtScegliAllegatoClick
  end
  object EtOggetto: TEdit
    Left = 8
    Top = 120
    Width = 313
    Height = 21
    TabOrder = 3
  end
  object EtDestinatario: TEdit
    Left = 8
    Top = 24
    Width = 313
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  object EtAllegato: TEdit
    Left = 8
    Top = 72
    Width = 281
    Height = 21
    TabOrder = 1
  end
  object OdAllegati: TOpenDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 208
    Top = 48
  end
end
