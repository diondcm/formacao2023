inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Cliente'
  ClientHeight = 493
  ClientWidth = 1201
  OnCreate = FormCreate
  ExplicitWidth = 1213
  TextHeight = 15
  inherited StatusBar1: TStatusBar
    Top = 474
    Width = 1201
    ExplicitWidth = 1195
  end
  inherited PanelControles: TPanel
    Width = 1195
    ExplicitWidth = 1189
    inherited ShapeSeparador: TShape
      ExplicitLeft = 210
      ExplicitTop = -15
    end
  end
  inherited PageControlCadastro: TPageControl
    Width = 1201
    Height = 423
    ExplicitWidth = 1195
    inherited TabPesquisa: TTabSheet
      ExplicitWidth = 1193
      ExplicitHeight = 393
      inherited DBGridCadastro: TDBGrid
        Width = 1193
        Height = 393
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
      ExplicitHeight = 393
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
