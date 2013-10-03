object Form1: TForm1
  Left = 263
  Top = 154
  Width = 305
  Height = 188
  Caption = 'Form1'
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
    Left = 16
    Top = 16
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 45
    Height = 13
    Caption = 'Cognome'
  end
  object ShEditColor: TShape
    Left = 152
    Top = 32
    Width = 25
    Height = 25
    Brush.Color = clWindow
  end
  object Bevel1: TBevel
    Left = 144
    Top = 8
    Width = 9
    Height = 145
    Shape = bsLeftLine
  end
  object LDEdit1: TLDEdit
    Left = 16
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object LDEdit2: TLDEdit
    Left = 16
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 16
    Top = 112
    Width = 121
    Height = 25
    Caption = 'Apri form secondaria'
    TabOrder = 2
    OnClick = Button1Click
  end
  object SbChangeColor: TButton
    Left = 184
    Top = 32
    Width = 105
    Height = 25
    Caption = 'Cambia Colore...'
    TabOrder = 3
    OnClick = SbChangeColorClick
  end
  object CdEdit: TColorDialog
    Ctl3D = True
    Color = clWindow
    Left = 200
    Top = 72
  end
end
