object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Packages VS DLLs'
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
  object PanelDLL: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 185
    Height = 436
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 427
    object LabelTotal: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 177
      Height = 31
      Align = alTop
      Caption = 'DLL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ExplicitWidth = 41
    end
    object Button1: TButton
      Left = 4
      Top = 149
      Width = 145
      Height = 25
      Caption = 'Gera Token Num.'
      TabOrder = 0
      OnClick = Button1Click
    end
    object EditValor: TEdit
      Left = 4
      Top = 120
      Width = 121
      Height = 23
      NumbersOnly = True
      TabOrder = 1
      TextHint = 'Informe um valor'
    end
    object ButtonGetValor: TButton
      Left = 85
      Top = 89
      Width = 75
      Height = 25
      Caption = 'Get'
      TabOrder = 2
      OnClick = ButtonGetValorClick
    end
    object ButtonSetValor: TButton
      Left = 4
      Top = 89
      Width = 75
      Height = 25
      Caption = 'Set'
      TabOrder = 3
      OnClick = ButtonSetValorClick
    end
    object ButtonLoad: TButton
      Left = 4
      Top = 58
      Width = 75
      Height = 25
      Caption = 'Load'
      TabOrder = 4
      OnClick = ButtonLoadClick
    end
    object ButtonFree: TButton
      Left = 85
      Top = 58
      Width = 75
      Height = 25
      Caption = 'Free'
      TabOrder = 5
      OnClick = ButtonFreeClick
    end
    object ButtonDobro: TButton
      Left = 4
      Top = 180
      Width = 75
      Height = 25
      Caption = 'Dobro'
      TabOrder = 6
      OnClick = ButtonDobroClick
    end
  end
  object PanelPackage: TPanel
    AlignWithMargins = True
    Left = 194
    Top = 3
    Width = 185
    Height = 436
    Align = alLeft
    TabOrder = 1
    ExplicitHeight = 427
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 177
      Height = 31
      Align = alTop
      Caption = 'Package'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ExplicitWidth = 92
    end
    object EditValorPkg: TEdit
      Left = 12
      Top = 120
      Width = 125
      Height = 23
      NumbersOnly = True
      TabOrder = 0
      TextHint = 'Informe um valor'
    end
    object ButtonGeraQuadrado: TButton
      Left = 12
      Top = 149
      Width = 125
      Height = 25
      Caption = 'Gera Quadrado'
      TabOrder = 1
      OnClick = ButtonGeraQuadradoClick
    end
    object ButtonValMin: TButton
      Left = 12
      Top = 180
      Width = 125
      Height = 25
      Caption = 'Valor Min'
      TabOrder = 2
      OnClick = ButtonValMinClick
    end
  end
  object MemoLog: TMemo
    AlignWithMargins = True
    Left = 385
    Top = 3
    Width = 240
    Height = 436
    Align = alClient
    Color = clInactiveCaption
    TabOrder = 2
    ExplicitWidth = 234
    ExplicitHeight = 427
  end
end
