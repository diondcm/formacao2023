inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Cliente'
  ClientWidth = 858
  OnCreate = FormCreate
  ExplicitLeft = 2
  ExplicitTop = 2
  ExplicitWidth = 870
  TextHeight = 15
  inherited PanelControles: TPanel
    Width = 852
    ExplicitWidth = 846
    inherited ShapeSeparador: TShape
      ExplicitLeft = 210
      ExplicitTop = -15
    end
    inherited BitBtn1: TBitBtn
      ExplicitLeft = 534
      ExplicitTop = 4
    end
    inherited BitBtn2: TBitBtn
      ExplicitLeft = 4
    end
    inherited BitBtn3: TBitBtn
      ExplicitLeft = 132
      ExplicitTop = 5
    end
    inherited BitBtn4: TBitBtn
      ExplicitLeft = 366
      ExplicitTop = 5
    end
    inherited BitBtn5: TBitBtn
      ExplicitLeft = 272
    end
    inherited BitBtn6: TBitBtn
      ExplicitLeft = 568
      ExplicitTop = 5
    end
  end
  inherited PageControlCadastro: TPageControl
    Width = 858
    ExplicitWidth = 852
    ExplicitHeight = 402
    inherited TabPesquisa: TTabSheet
      ExplicitWidth = 850
      inherited DBGridCadastro: TDBGrid
        Width = 850
      end
    end
    inherited TabCadastro: TTabSheet
      ExplicitWidth = 850
    end
  end
end
