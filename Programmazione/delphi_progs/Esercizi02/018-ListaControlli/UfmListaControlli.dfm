object fmListaControlli: TfmListaControlli
  Left = 192
  Top = 107
  Width = 312
  Height = 365
  Caption = 'fmListaControlli'
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
  object etLista: TMemo
    Left = 84
    Top = 6
    Width = 217
    Height = 328
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'etLista')
    ParentFont = False
    TabOrder = 0
  end
  object btLista: TButton
    Left = 4
    Top = 6
    Width = 75
    Height = 25
    Caption = 'Crea Lista'
    TabOrder = 1
    OnClick = btListaClick
  end
  object Panel1: TPanel
    Left = 10
    Top = 44
    Width = 69
    Height = 259
    Caption = 'Panel1'
    TabOrder = 2
    object Label1: TLabel
      Left = 10
      Top = 110
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 8
      Top = 132
      Width = 32
      Height = 13
      Caption = 'Label2'
    end
    object Label3: TLabel
      Left = 10
      Top = 150
      Width = 32
      Height = 13
      Caption = 'Label3'
    end
    object Panel2: TPanel
      Left = 12
      Top = 18
      Width = 47
      Height = 79
      Caption = 'Panel2'
      TabOrder = 0
      object Button1: TButton
        Left = 12
        Top = 18
        Width = 17
        Height = 35
        Caption = 'Button1'
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      Left = 8
      Top = 176
      Width = 51
      Height = 75
      Caption = 'Panel3'
      TabOrder = 1
      object SpeedButton1: TSpeedButton
        Left = 8
        Top = 6
        Width = 23
        Height = 22
      end
      object SpeedButton2: TSpeedButton
        Left = 8
        Top = 44
        Width = 23
        Height = 22
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 6
    Top = 310
    Width = 69
    Height = 21
    Caption = 'BitBtn1'
    TabOrder = 3
  end
end
