object frmInstancia: TfrmInstancia
  Left = 0
  Top = 0
  Caption = 'Inst'#226'ncia'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Button1: TButton
    Left = 64
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ButtonAviso: TButton
    Left = 48
    Top = 360
    Width = 105
    Height = 41
    Caption = 'Aviso'
    TabOrder = 1
    OnClick = ButtonAvisoClick
  end
  object ButtonErro: TButton
    Left = 264
    Top = 360
    Width = 105
    Height = 41
    Caption = 'Erro'
    TabOrder = 2
    OnClick = ButtonErroClick
  end
  object ButtonConfirmacao: TButton
    Left = 472
    Top = 360
    Width = 97
    Height = 41
    Caption = 'Confirma'#231#227'o'
    TabOrder = 3
    OnClick = ButtonConfirmacaoClick
  end
  object Button2: TButton
    Left = 280
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 4
    OnClick = Button2Click
  end
end
