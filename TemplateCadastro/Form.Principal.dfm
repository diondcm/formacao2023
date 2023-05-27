object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Template Cadastro'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenuPrincipal
  Position = poScreenCenter
  TextHeight = 15
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 628
    Height = 121
    ButtonHeight = 78
    ButtonWidth = 63
    Caption = 'ToolBar1'
    Color = clBtnFace
    Images = dmdImages.ImageListPrincipal
    ParentColor = False
    ShowCaptions = True
    TabOrder = 0
    object ToolButtonCliente: TToolButton
      Left = 0
      Top = 0
      Action = ActionCliente
    end
    object ToolButtonProduto: TToolButton
      Left = 63
      Top = 0
      Action = ActionProduto
    end
  end
  object MainMenuPrincipal: TMainMenu
    Images = dmdImages.ImageListPrincipal
    Left = 440
    Top = 216
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Cliente1: TMenuItem
        Action = ActionCliente
      end
      object Produto1: TMenuItem
        Action = ActionProduto
      end
    end
  end
  object ActionListPrincipal: TActionList
    Images = dmdImages.ImageListPrincipal
    Left = 400
    Top = 288
    object ActionCliente: TAction
      Caption = 'Cliente'
      ImageIndex = 0
      OnExecute = ActionClienteExecute
    end
    object ActionProduto: TAction
      Caption = 'Produto'
      ImageIndex = 1
      OnExecute = ActionProdutoExecute
    end
    object ActionPedido: TAction
      Caption = 'Pedido'
    end
  end
end
