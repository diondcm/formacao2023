object frmTestHelper: TfrmTestHelper
  Left = 0
  Top = 0
  Caption = 'Helpers'
  ClientHeight = 565
  ClientWidth = 724
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 194
    Top = 44
    Width = 527
    Height = 518
    Align = alClient
    Color = clInfoBk
    TabOrder = 0
    ExplicitWidth = 521
    ExplicitHeight = 509
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 724
    Height = 41
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 718
    object Button1: TButton
      AlignWithMargins = True
      Left = 576
      Top = 4
      Width = 144
      Height = 33
      Align = alRight
      Caption = 'Reverte String'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 570
    end
    object ButtonUnZip: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 85
      Height = 33
      Align = alLeft
      Caption = 'Un Zip'
      TabOrder = 1
      OnClick = ButtonUnZipClick
    end
    object ButtonZip: TButton
      AlignWithMargins = True
      Left = 95
      Top = 4
      Width = 75
      Height = 33
      Align = alLeft
      Caption = 'Zippar'
      TabOrder = 2
      OnClick = ButtonZipClick
    end
    object ButtonAviso: TButton
      AlignWithMargins = True
      Left = 495
      Top = 4
      Width = 75
      Height = 33
      Align = alRight
      Caption = 'Aviso'
      TabOrder = 3
      OnClick = ButtonAvisoClick
      ExplicitLeft = 489
    end
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 44
    Width = 185
    Height = 518
    Align = alLeft
    TabOrder = 2
    ExplicitHeight = 509
    object Button2: TButton
      Left = 32
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 32
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
end
