object Form2: TForm2
  Left = 289
  Top = 64
  Width = 404
  Height = 631
  Caption = 'IL CODICE SEGRETO E'#39'...'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object tlSecondi: TLabel
    Left = 304
    Top = 88
    Width = 81
    Height = 20
    Caption = 'SECONDI'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object nSecondi: TLabel
    Left = 328
    Top = 112
    Width = 33
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object tbScore: TButton
    Left = 16
    Top = 88
    Width = 89
    Height = 25
    Caption = 'SCORE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = tbScoreClick
  end
  object Panel1: TPanel
    Left = 112
    Top = 80
    Width = 169
    Height = 409
    Color = clSilver
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object Prova1_1: TShape
      Left = 8
      Top = 8
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova1_2: TShape
      Tag = 1
      Left = 40
      Top = 8
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova1_3: TShape
      Tag = 2
      Left = 72
      Top = 8
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova1_4: TShape
      Tag = 3
      Left = 104
      Top = 8
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova2_1: TShape
      Left = 8
      Top = 48
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova2_2: TShape
      Tag = 1
      Left = 40
      Top = 48
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova2_3: TShape
      Tag = 2
      Left = 72
      Top = 48
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova2_4: TShape
      Tag = 3
      Left = 104
      Top = 48
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova3_1: TShape
      Left = 8
      Top = 88
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova3_2: TShape
      Tag = 1
      Left = 40
      Top = 88
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova3_3: TShape
      Tag = 2
      Left = 72
      Top = 88
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova3_4: TShape
      Tag = 3
      Left = 104
      Top = 88
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova4_1: TShape
      Left = 8
      Top = 128
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova4_2: TShape
      Tag = 1
      Left = 40
      Top = 128
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova4_3: TShape
      Tag = 2
      Left = 72
      Top = 128
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova4_4: TShape
      Tag = 3
      Left = 104
      Top = 128
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova5_1: TShape
      Left = 8
      Top = 168
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova5_2: TShape
      Tag = 1
      Left = 40
      Top = 168
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova5_3: TShape
      Tag = 2
      Left = 72
      Top = 168
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova5_4: TShape
      Tag = 3
      Left = 104
      Top = 168
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova6_1: TShape
      Left = 8
      Top = 208
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova6_2: TShape
      Tag = 1
      Left = 40
      Top = 208
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova6_3: TShape
      Tag = 2
      Left = 72
      Top = 208
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova6_4: TShape
      Tag = 3
      Left = 104
      Top = 208
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova7_1: TShape
      Left = 8
      Top = 248
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova7_2: TShape
      Tag = 1
      Left = 40
      Top = 248
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova7_3: TShape
      Tag = 2
      Left = 72
      Top = 248
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova7_4: TShape
      Tag = 2
      Left = 104
      Top = 248
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova8_1: TShape
      Left = 8
      Top = 288
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova8_2: TShape
      Tag = 1
      Left = 40
      Top = 288
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova8_3: TShape
      Tag = 2
      Left = 72
      Top = 288
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova8_4: TShape
      Tag = 3
      Left = 104
      Top = 288
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova9_1: TShape
      Left = 8
      Top = 328
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova9_2: TShape
      Tag = 1
      Left = 40
      Top = 328
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova9_3: TShape
      Tag = 2
      Left = 72
      Top = 328
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova9_4: TShape
      Tag = 3
      Left = 104
      Top = 328
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova10_1: TShape
      Left = 8
      Top = 368
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova10_2: TShape
      Tag = 1
      Left = 40
      Top = 368
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova10_3: TShape
      Tag = 2
      Left = 72
      Top = 368
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Prova10_4: TShape
      Tag = 3
      Left = 104
      Top = 368
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object Check1_1: TShape
      Left = 135
      Top = 8
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check1_2: TShape
      Left = 151
      Top = 8
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check1_3: TShape
      Left = 135
      Top = 24
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check1_4: TShape
      Left = 151
      Top = 24
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check2_1: TShape
      Left = 135
      Top = 48
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check2_2: TShape
      Left = 151
      Top = 48
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check2_3: TShape
      Left = 135
      Top = 64
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check2_4: TShape
      Left = 151
      Top = 64
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check3_1: TShape
      Left = 135
      Top = 88
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check3_2: TShape
      Left = 151
      Top = 88
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check3_3: TShape
      Left = 135
      Top = 104
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check3_4: TShape
      Left = 151
      Top = 104
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check4_1: TShape
      Left = 135
      Top = 128
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check4_2: TShape
      Left = 151
      Top = 128
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check4_3: TShape
      Left = 135
      Top = 144
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check4_4: TShape
      Left = 151
      Top = 144
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check5_1: TShape
      Left = 135
      Top = 168
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check5_2: TShape
      Left = 151
      Top = 168
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check5_3: TShape
      Left = 135
      Top = 184
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check5_4: TShape
      Left = 151
      Top = 184
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check6_1: TShape
      Left = 135
      Top = 208
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check6_2: TShape
      Left = 151
      Top = 208
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check6_3: TShape
      Left = 135
      Top = 224
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check6_4: TShape
      Left = 151
      Top = 224
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check7_1: TShape
      Left = 135
      Top = 248
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check7_2: TShape
      Left = 151
      Top = 248
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check7_3: TShape
      Left = 135
      Top = 264
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check7_4: TShape
      Left = 151
      Top = 264
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check8_1: TShape
      Left = 135
      Top = 288
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check8_2: TShape
      Left = 151
      Top = 288
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check8_3: TShape
      Left = 135
      Top = 304
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check8_4: TShape
      Left = 151
      Top = 304
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check9_1: TShape
      Left = 135
      Top = 328
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check9_2: TShape
      Left = 151
      Top = 328
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check9_3: TShape
      Left = 135
      Top = 344
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check9_4: TShape
      Left = 151
      Top = 344
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check10_1: TShape
      Left = 135
      Top = 368
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check10_2: TShape
      Left = 151
      Top = 367
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check10_3: TShape
      Left = 135
      Top = 383
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
    object Check10_4: TShape
      Left = 151
      Top = 383
      Width = 10
      Height = 10
      Brush.Color = clBlack
      Pen.Color = clGray
      Shape = stCircle
    end
  end
  object Panel2: TPanel
    Left = 80
    Top = 8
    Width = 233
    Height = 65
    Color = clSilver
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object tlColorPanel: TLabel
      Left = 15
      Top = 9
      Width = 201
      Height = 24
      Alignment = taCenter
      Caption = 'PANNELLO DEI COLORI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object tsColor0: TShape
      Left = 24
      Top = 32
      Width = 25
      Height = 25
      Brush.Color = clRed
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = tsColor0MouseDown
    end
    object tsColor1: TShape
      Tag = 1
      Left = 56
      Top = 32
      Width = 25
      Height = 25
      Brush.Color = clBlue
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = tsColor0MouseDown
    end
    object tsColor2: TShape
      Tag = 2
      Left = 88
      Top = 32
      Width = 25
      Height = 25
      Brush.Color = clGreen
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = tsColor0MouseDown
    end
    object tsColor3: TShape
      Tag = 3
      Left = 120
      Top = 32
      Width = 25
      Height = 25
      Brush.Color = clFuchsia
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = tsColor0MouseDown
    end
    object tsColor4: TShape
      Tag = 4
      Left = 152
      Top = 32
      Width = 25
      Height = 25
      Brush.Color = clYellow
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = tsColor0MouseDown
    end
    object tsColor5: TShape
      Tag = 5
      Left = 184
      Top = 32
      Width = 25
      Height = 25
      Brush.Color = clAqua
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = tsColor0MouseDown
    end
  end
  object Panel3: TPanel
    Left = 104
    Top = 496
    Width = 185
    Height = 81
    Color = clSilver
    TabOrder = 3
    Visible = False
    object secret1: TShape
      Left = 32
      Top = 40
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object secret2: TShape
      Left = 64
      Top = 40
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object secret3: TShape
      Left = 96
      Top = 40
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object secret4: TShape
      Left = 128
      Top = 40
      Width = 25
      Height = 25
      Brush.Color = clBlack
      Enabled = False
      Pen.Color = clGray
      Shape = stCircle
      OnMouseDown = Prova1_1MouseDown
    end
    object tlSecretCode: TLabel
      Left = 14
      Top = 12
      Width = 160
      Height = 20
      Caption = 'CODICE SEGRETO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object tbExit: TButton
    Left = 320
    Top = 8
    Width = 65
    Height = 65
    Caption = 'Exit'
    TabOrder = 4
    OnClick = tbExitClick
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 288
    Top = 112
  end
end
