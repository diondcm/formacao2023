inherited frmPrincipal: TfrmPrincipal
  Caption = 'Template Cadastro'
  Menu = MainMenuPrincipal
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitHeight = 505
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
    ExplicitWidth = 622
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
  object TimerLogin: TTimer
    Enabled = False
    OnTimer = TimerLoginTimer
    Left = 304
    Top = 240
  end
end
