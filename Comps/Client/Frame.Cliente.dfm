object fraCliente: TfraCliente
  Left = 0
  Top = 0
  Width = 322
  Height = 167
  TabOrder = 0
  object PanelHeaderCliente: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 316
    Height = 41
    Align = alTop
    Alignment = taLeftJustify
    Caption = 'Cliente'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -20
    Font.Name = 'Microsoft JhengHei UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 311
  end
  object PanelDadosCliente: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 50
    Width = 316
    Height = 114
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 311
    ExplicitHeight = 209
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 314
      Height = 15
      Align = alTop
      Caption = 'Saldo dispon'#237'vel R$0,00'
      ExplicitWidth = 123
    end
    object Label2: TLabel
      Left = 1
      Top = 16
      Width = 314
      Height = 15
      Align = alTop
      Caption = 'Ativo: sim'
      ExplicitWidth = 53
    end
    object PanelAcoes: TPanel
      Left = 1
      Top = 72
      Width = 314
      Height = 41
      Align = alBottom
      TabOrder = 0
      ExplicitTop = 167
      ExplicitWidth = 309
      object ButtonImprimir: TButton
        AlignWithMargins = True
        Left = 111
        Top = 4
        Width = 75
        Height = 33
        Align = alLeft
        Caption = 'Imprimir'
        TabOrder = 0
        OnClick = ButtonImprimirClick
      end
      object ButtonLigar: TButton
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 101
        Height = 33
        Align = alLeft
        Caption = 'Ligar para'
        TabOrder = 1
        OnClick = ButtonLigarClick
      end
    end
  end
end
