inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro de Produto'
  ClientWidth = 806
  OnCreate = FormCreate
  ExplicitLeft = 2
  ExplicitTop = 2
  ExplicitWidth = 818
  TextHeight = 15
  inherited PanelControles: TPanel
    Width = 800
    inherited ShapeSeparador: TShape
      ExplicitLeft = 254
      ExplicitTop = 4
    end
    inherited BitBtn3: TBitBtn
      ExplicitLeft = 121
      ExplicitTop = 5
    end
    inherited BitBtn4: TBitBtn
      ExplicitLeft = 275
      ExplicitTop = 5
    end
    inherited BitBtn6: TBitBtn
      ExplicitLeft = 616
      ExplicitTop = 5
    end
  end
  inherited PageControlCadastro: TPageControl
    Width = 806
    inherited TabPesquisa: TTabSheet
      ExplicitWidth = 798
      inherited DBGridCadastro: TDBGrid
        Width = 798
      end
    end
    inherited TabCadastro: TTabSheet
      ExplicitWidth = 798
    end
  end
end
