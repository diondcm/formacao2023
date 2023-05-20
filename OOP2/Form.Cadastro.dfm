object frmCadastro: TfrmCadastro
  Left = 0
  Top = 0
  Caption = 'Cadastro'
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
  object ButtonBaleia: TButton
    Left = 24
    Top = 24
    Width = 153
    Height = 49
    Caption = 'Baleia'
    TabOrder = 0
    OnClick = ButtonBaleiaClick
  end
  object ButtonCachorro: TButton
    Left = 24
    Top = 88
    Width = 153
    Height = 49
    Caption = 'Cachorro'
    TabOrder = 1
    OnClick = ButtonCachorroClick
  end
  object ButtonMorcego: TButton
    Left = 24
    Top = 152
    Width = 153
    Height = 49
    Caption = 'Morcego'
    TabOrder = 2
    OnClick = ButtonMorcegoClick
  end
  object ButtonGenerico: TButton
    Left = 368
    Top = 90
    Width = 145
    Height = 45
    Caption = 'Gen'#233'rico'
    TabOrder = 3
    OnClick = ButtonGenericoClick
  end
  object ButtonInterface: TButton
    Left = 368
    Top = 232
    Width = 185
    Height = 49
    Caption = 'Interface'
    TabOrder = 4
    OnClick = ButtonInterfaceClick
  end
  object CheckBoxAddRef: TCheckBox
    Left = 256
    Top = 248
    Width = 97
    Height = 17
    Caption = 'Add Ref'
    TabOrder = 5
  end
  object Button1: TButton
    Left = 368
    Top = 287
    Width = 75
    Height = 25
    Caption = 'Ref -> nil'
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 368
    Top = 334
    Width = 185
    Height = 51
    Caption = 'Cachorro - Free'
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 40
    Top = 333
    Width = 137
    Height = 54
    Caption = 'Button3'
    TabOrder = 8
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 232
    Top = 362
    Width = 75
    Height = 25
    Caption = 'Button4'
    TabOrder = 9
  end
end
