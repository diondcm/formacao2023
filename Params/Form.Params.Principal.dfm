object frmParamsPrincipal: TfrmParamsPrincipal
  Left = 0
  Top = 0
  Caption = 'Params'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Button1: TButton
    Left = 8
    Top = 24
    Width = 129
    Height = 33
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 152
    Top = 24
    Width = 137
    Height = 33
    Caption = 'Button2'
    TabOrder = 1
    OnClick = Button2Click
  end
end
