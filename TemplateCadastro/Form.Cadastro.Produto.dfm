inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro de Produto'
  ClientWidth = 1200
  OnCreate = FormCreate
  ExplicitWidth = 1212
  TextHeight = 15
  inherited StatusBar1: TStatusBar
    Width = 1200
    ExplicitLeft = 0
    ExplicitTop = 474
    ExplicitWidth = 1194
  end
  inherited PanelControles: TPanel
    Width = 1194
    ExplicitWidth = 1188
    inherited ShapeSeparador: TShape
      ExplicitLeft = 254
      ExplicitTop = 4
    end
  end
  inherited PageControlCadastro: TPageControl
    Width = 1200
    ActivePage = TabPesquisa
    ExplicitWidth = 1194
    inherited TabPesquisa: TTabSheet
      ExplicitWidth = 1192
      inherited DBGridCadastro: TDBGrid
        Width = 1192
        Columns = <
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 138
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 249
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTOQUE'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CATEGORIA'
            Width = 93
            Visible = True
          end>
      end
    end
    inherited TabCadastro: TTabSheet
      ExplicitWidth = 1192
      object Label1: TLabel
        Left = 80
        Top = 40
        Width = 33
        Height = 15
        Caption = 'Nome'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 80
        Top = 88
        Width = 51
        Height = 15
        Caption = 'Descri'#231#227'o'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 80
        Top = 136
        Width = 30
        Height = 15
        Caption = 'Pre'#231'o'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 80
        Top = 184
        Width = 42
        Height = 15
        Caption = 'Estoque'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 80
        Top = 232
        Width = 51
        Height = 15
        Caption = 'Categoria'
        FocusControl = DBEdit5
      end
      object DBEdit1: TDBEdit
        Left = 80
        Top = 56
        Width = 304
        Height = 23
        DataField = 'NOME'
        DataSource = dtsDados
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 80
        Top = 104
        Width = 304
        Height = 23
        DataField = 'DESCRICAO'
        DataSource = dtsDados
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 80
        Top = 152
        Width = 124
        Height = 23
        DataField = 'PRECO'
        DataSource = dtsDados
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 80
        Top = 200
        Width = 124
        Height = 23
        DataField = 'ESTOQUE'
        DataSource = dtsDados
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 80
        Top = 248
        Width = 304
        Height = 23
        DataField = 'CATEGORIA'
        DataSource = dtsDados
        TabOrder = 4
      end
    end
  end
end
