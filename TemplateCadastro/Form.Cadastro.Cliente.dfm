inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Cliente'
  ClientWidth = 1201
  OnCreate = FormCreate
  ExplicitWidth = 1213
  TextHeight = 15
  inherited PanelControles: TPanel
    Width = 1195
    ExplicitWidth = 846
    inherited ShapeSeparador: TShape
      ExplicitLeft = 210
      ExplicitTop = -15
    end
    inherited ButtonUltimo: TBitBtn
      ExplicitLeft = 1058
    end
    inherited ButtonSalvar: TBitBtn
      ExplicitLeft = 397
    end
    inherited ButtonPrimeiro: TBitBtn
      ExplicitLeft = 665
    end
    inherited ButtonAnterior: TBitBtn
      ExplicitLeft = 796
    end
    inherited ButtonProximo: TBitBtn
      ExplicitLeft = 927
    end
    inherited ButtonCancelar: TBitBtn
      ExplicitLeft = 266
    end
    inherited ButtonDeltar: TBitBtn
      ExplicitLeft = 528
      ExplicitTop = 4
    end
  end
  inherited PageControlCadastro: TPageControl
    Width = 1201
    ExplicitWidth = 852
    ExplicitHeight = 442
    inherited TabPesquisa: TTabSheet
      ExplicitWidth = 1193
      inherited DBGridCadastro: TDBGrid
        Width = 1193
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Width = 121
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 432
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_CADASTRO'
            Width = 97
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALDO'
            Width = 88
            Visible = True
          end>
      end
    end
    inherited TabCadastro: TTabSheet
      ExplicitWidth = 1193
      object Label2: TLabel
        Left = 48
        Top = 32
        Width = 39
        Height = 15
        Caption = 'C'#243'digo'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 48
        Top = 80
        Width = 33
        Height = 15
        Caption = 'Nome'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 48
        Top = 128
        Width = 47
        Height = 15
        Caption = 'Cadastro'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 48
        Top = 176
        Width = 29
        Height = 15
        Caption = 'Saldo'
        FocusControl = DBEdit5
      end
      object DBEdit2: TDBEdit
        Left = 48
        Top = 48
        Width = 124
        Height = 23
        DataField = 'CODIGO'
        DataSource = dtsDados
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 48
        Top = 96
        Width = 304
        Height = 23
        DataField = 'NOME'
        DataSource = dtsDados
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 48
        Top = 144
        Width = 124
        Height = 23
        DataField = 'DATA_CADASTRO'
        DataSource = dtsDados
        TabOrder = 2
      end
      object DBEdit5: TDBEdit
        Left = 48
        Top = 192
        Width = 124
        Height = 23
        DataField = 'SALDO'
        DataSource = dtsDados
        TabOrder = 3
      end
    end
  end
  inherited dtsDados: TDataSource
    Left = 440
    Top = 112
  end
  inherited ActionListCadastro: TActionList
    Left = 544
    Top = 120
  end
  inherited TimerOpen: TTimer
    Left = 660
    Top = 117
  end
end
