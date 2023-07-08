object frmControlePatrimonio: TfrmControlePatrimonio
  Left = 0
  Top = 0
  Caption = 'Controle de Patrim'#244'nio'
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
  object PanelBasePatrimonio: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 310
    Height = 436
    Align = alLeft
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 0
    ExplicitHeight = 427
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 302
      Height = 31
      Align = alTop
      Caption = 'Patrim'#244'nio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ExplicitWidth = 121
    end
    object LabelTotal: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 401
      Width = 302
      Height = 31
      Align = alBottom
      Caption = 'Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      ExplicitWidth = 57
    end
    object PanelAddPatrimonio: TPanel
      Left = 1
      Top = 38
      Width = 308
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object ButtonCriaPatrimonio: TButton
        Left = 8
        Top = 7
        Width = 113
        Height = 25
        Caption = 'Cria Patrim'#244'nio'
        TabOrder = 0
        OnClick = ButtonCriaPatrimonioClick
      end
    end
    object ScrollBox1: TScrollBox
      Left = 1
      Top = 79
      Width = 308
      Height = 319
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 1
      ExplicitHeight = 310
      object FlowPanelListaPatrimonio: TFlowPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 302
        Height = 96
        Align = alTop
        AutoSize = True
        BevelOuter = bvLowered
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 0
        object PanelCardPatrimonio: TPanel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 205
          Height = 88
          TabOrder = 0
          Visible = False
          object LabelCardTipo: TLabel
            Left = 1
            Top = 1
            Width = 203
            Height = 15
            Align = alTop
            Caption = 'Tipo: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitWidth = 30
          end
          object LabelCardValor: TLabel
            Left = 1
            Top = 16
            Width = 203
            Height = 15
            Align = alTop
            Caption = 'Valor:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 29
          end
          object LabelCardDataCompra: TLabel
            Left = 1
            Top = 31
            Width = 203
            Height = 15
            Align = alTop
            Caption = 'Data Compra:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 73
          end
          object LabelCardDeprec: TLabel
            Left = 1
            Top = 46
            Width = 203
            Height = 15
            Align = alTop
            Caption = 'Data Deprecia'#231#227'o:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitWidth = 95
          end
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 316
    Top = 0
    Width = 312
    Height = 442
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 306
    ExplicitHeight = 433
    inline fraCliente1: TfraCliente
      Left = 1
      Top = 1
      Width = 310
      Height = 149
      Align = alTop
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 304
      ExplicitHeight = 149
      inherited PanelHeaderCliente: TPanel
        Width = 304
        ExplicitWidth = 298
      end
      inherited PanelDadosCliente: TPanel
        Width = 304
        Height = 96
        ExplicitWidth = 298
        ExplicitHeight = 96
        inherited Label1: TLabel
          Width = 302
        end
        inherited Label2: TLabel
          Width = 302
        end
        inherited PanelAcoes: TPanel
          Top = 54
          Width = 302
          ExplicitTop = 54
          ExplicitWidth = 296
          inherited ButtonImprimir: TButton
            Left = 4
            ExplicitLeft = 4
          end
          inherited ButtonLigar: TButton
            Left = 85
            Width = 69
            ExplicitLeft = 85
            ExplicitWidth = 69
          end
        end
      end
    end
  end
end
