object frmPrincipalCliente: TfrmPrincipalCliente
  Left = 0
  Top = 0
  Caption = 'Testes'
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
  object FlowPanel1: TFlowPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 622
    Height = 436
    Align = alClient
    BevelOuter = bvNone
    Color = clMenu
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 616
    ExplicitHeight = 427
    object ButtonConceitosOO: TBitBtn
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 200
      Height = 80
      Caption = 'Conceitos OO'
      TabOrder = 0
      OnClick = ButtonConceitosOOClick
    end
    object ButtonVisualiza: TBitBtn
      AlignWithMargins = True
      Left = 209
      Top = 3
      Width = 200
      Height = 80
      Caption = 'Visualiza'
      TabOrder = 1
      OnClick = ButtonVisualizaClick
    end
    object ButtonCompPanel: TBitBtn
      AlignWithMargins = True
      Left = 415
      Top = 3
      Width = 200
      Height = 80
      Caption = 'Comp Panel'
      TabOrder = 2
      OnClick = ButtonCompPanelClick
    end
  end
end
