object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'OOP - 2'
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
  object FlowPanelControles: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 622
    Height = 436
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 224
    ExplicitWidth = 185
    ExplicitHeight = 41
    object ButtonCadastro: TBitBtn
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 184
      Height = 64
      Caption = 'Cadastro'
      TabOrder = 0
      OnClick = ButtonCadastroClick
    end
    object ButtonInstancia: TBitBtn
      AlignWithMargins = True
      Left = 194
      Top = 4
      Width = 184
      Height = 64
      Caption = 'Inst'#226'ncia vs Class'
      TabOrder = 1
      OnClick = ButtonInstanciaClick
    end
  end
end
