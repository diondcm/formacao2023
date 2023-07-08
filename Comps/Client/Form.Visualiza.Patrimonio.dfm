object frmVisualizaPatrimonio: TfrmVisualizaPatrimonio
  Left = 0
  Top = 0
  Caption = 'Visualiza Patrim'#244'nio'
  ClientHeight = 442
  ClientWidth = 541
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object LabelTotal: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 408
    Width = 535
    Height = 31
    Align = alBottom
    Caption = 'Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    ExplicitLeft = 4
    ExplicitTop = 401
    ExplicitWidth = 57
  end
  inline fraCliente1: TfraCliente
    Left = 0
    Top = 0
    Width = 321
    Height = 178
    TabOrder = 0
    ExplicitWidth = 321
    ExplicitHeight = 178
    inherited PanelHeaderCliente: TPanel
      Width = 315
      ExplicitWidth = 315
    end
    inherited PanelDadosCliente: TPanel
      Width = 315
      Height = 125
      ExplicitWidth = 315
      ExplicitHeight = 125
      inherited Label1: TLabel
        Width = 313
      end
      inherited Label2: TLabel
        Width = 313
        ExplicitTop = 19
      end
      inherited PanelAcoes: TPanel
        Top = 83
        Width = 313
        ExplicitTop = 83
        ExplicitWidth = 313
        inherited ButtonLigar: TButton
          OnClick = fraCliente1ButtonLigarClick
        end
      end
    end
  end
end
