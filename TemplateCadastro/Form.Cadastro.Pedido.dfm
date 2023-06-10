inherited frmCadPedido: TfrmCadPedido
  Caption = 'Pedidos'
  ClientHeight = 502
  ClientWidth = 1233
  OnCreate = FormCreate
  TextHeight = 15
  inherited StatusBar1: TStatusBar
    Top = 483
    Width = 1233
  end
  inherited PanelControles: TPanel
    Width = 1227
  end
  inherited PageControlCadastro: TPageControl
    Width = 1233
    Height = 432
    inherited TabPesquisa: TTabSheet
      object Label1: TLabel [0]
        Left = 0
        Top = 0
        Width = 1225
        Height = 31
        Align = alTop
        Caption = 'Pedidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 84
      end
      object Splitter1: TSplitter [1]
        Left = 0
        Top = 140
        Width = 1225
        Height = 3
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 31
        ExplicitWidth = 194
      end
      inherited DBGridCadastro: TDBGrid
        Top = 31
        Height = 109
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 280
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_PEDIDO'
            Width = 98
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_TOTAL'
            Width = 93
            Visible = True
          end>
      end
      object PanelDetalhes: TPanel
        Left = 0
        Top = 143
        Width = 1225
        Height = 259
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitTop = 224
        ExplicitWidth = 1233
        object Label2: TLabel
          Left = 0
          Top = 0
          Width = 1225
          Height = 31
          Align = alTop
          Caption = 'Items'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -23
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitWidth = 59
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 31
          Width = 1225
          Height = 228
          Align = alClient
          DataSource = dtsItens
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          PopupMenu = PopupMenuNavegacao
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnTitleClick = DBGrid1TitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'PRODUTO'
              Width = 173
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Width = 248
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO_UNIT'
              Width = 97
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO_TOTAL'
              Width = 186
              Visible = True
            end>
        end
      end
    end
  end
  inherited ActionListCadastro: TActionList
    Left = 560
    Top = 296
  end
  object dtsItens: TDataSource
    Left = 392
    Top = 304
  end
end
