object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'OOP'
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
  object PanelControles: TPanel
    AlignWithMargins = True
    Left = 440
    Top = 3
    Width = 185
    Height = 436
    Align = alRight
    TabOrder = 0
    ExplicitLeft = 434
    ExplicitHeight = 427
    object ButtonInstancia: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 177
      Height = 37
      Align = alTop
      Caption = 'Inst'#226'ncia'
      TabOrder = 0
      OnClick = ButtonInstanciaClick
    end
    object ButtonImpPessoa: TButton
      AlignWithMargins = True
      Left = 4
      Top = 47
      Width = 177
      Height = 37
      Align = alTop
      Caption = 'Imprime Pessoa'
      TabOrder = 1
      OnClick = ButtonImpPessoaClick
    end
    object ButtonNovaTela: TButton
      AlignWithMargins = True
      Left = 4
      Top = 395
      Width = 177
      Height = 37
      Align = alBottom
      Caption = 'Nova Tela'
      TabOrder = 2
      OnClick = ButtonNovaTelaClick
      ExplicitTop = 407
    end
    object ButtonVisualiza: TButton
      AlignWithMargins = True
      Left = 4
      Top = 90
      Width = 177
      Height = 37
      Align = alTop
      Caption = 'Visualiza'
      TabOrder = 3
      OnClick = ButtonVisualizaClick
    end
    object ButtonEscopos: TButton
      AlignWithMargins = True
      Left = 4
      Top = 352
      Width = 177
      Height = 37
      Align = alBottom
      Caption = 'Escopo'
      TabOrder = 4
      OnClick = ButtonEscoposClick
      ExplicitTop = 364
    end
    object ButtonDB: TButton
      AlignWithMargins = True
      Left = 4
      Top = 133
      Width = 177
      Height = 37
      Align = alTop
      Caption = 'Pessoa DB'
      TabOrder = 5
      OnClick = ButtonDBClick
    end
  end
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 431
    Height = 436
    Align = alClient
    Color = clScrollBar
    TabOrder = 1
    ExplicitWidth = 425
    ExplicitHeight = 427
  end
end
