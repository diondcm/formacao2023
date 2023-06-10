inherited dmdPedido: TdmdPedido
  PixelsPerInch = 120
  inherited qryDados: TFDQuery
    AfterOpen = qryDadosAfterOpen
    SQL.Strings = (
      
        'SELECT C.CODIGO, C.NOME, P.DATA_PEDIDO, P.PRECO_TOTAL, P.ID IDPE' +
        'DIDO'
      'FROM PEDIDOS P'
      'INNER JOIN CLIENTE C '
      'ON P.IDCLIENTE = C.ID '
      'AND C.EXCLUIDO = False'
      'order by C.Nome')
    object qryDadosCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 6
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
    end
    object qryDadosNOME: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 20
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 300
    end
    object qryDadosDATA_PEDIDO: TWideMemoField
      DisplayLabel = 'Data'
      DisplayWidth = 6
      FieldName = 'DATA_PEDIDO'
      Origin = 'DATA_PEDIDO'
      Required = True
      BlobType = ftWideMemo
    end
    object qryDadosPRECO_TOTAL: TFloatField
      DisplayLabel = 'Total'
      DisplayWidth = 6
      FieldName = 'PRECO_TOTAL'
      Origin = 'PRECO_TOTAL'
      Required = True
      DisplayFormat = 'R$ 0.,00'
    end
    object qryDadosIDPEDIDO: TFDAutoIncField
      FieldName = 'IDPEDIDO'
      Origin = 'IDPEDIDO'
      ProviderFlags = [pfInWhere, pfInKey]
      Visible = False
    end
  end
  object qryItens: TFDQuery
    MasterSource = dtsPedido
    MasterFields = 'IDPEDIDO'
    Connection = dmdConexao.FDConnection
    SQL.Strings = (
      
        'SELECT P.NOME PRODUTO, P.DESCRICAO, PI.QTD, PI.PRECO_UNIT, PI.PR' +
        'ECO_TOTAL'
      'FROM PEDIDO_ITEMS PI'
      'INNER JOIN PRODUTO P'
      'ON PI.IDPRODUTO = P.ID'
      'WHERE PI.IDPEDIDO = :IDPEDIDO'
      'ORDER BY P.NOME')
    Left = 568
    Top = 408
    ParamData = <
      item
        Name = 'IDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryItensPRODUTO: TWideStringField
      DisplayLabel = 'Produto'
      DisplayWidth = 20
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Size = 150
    end
    object qryItensDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 20
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 150
    end
    object qryItensQTD: TIntegerField
      DisplayLabel = 'Qtd'
      DisplayWidth = 6
      FieldName = 'QTD'
      Origin = 'QTD'
      Required = True
      DisplayFormat = '0.,'
    end
    object qryItensPRECO_UNIT: TFloatField
      DisplayLabel = 'Pre'#231'o Unit.'
      DisplayWidth = 6
      FieldName = 'PRECO_UNIT'
      Origin = 'PRECO_UNIT'
      Required = True
      DisplayFormat = 'R$ 0.,00'
    end
    object qryItensPRECO_TOTAL: TFloatField
      DisplayLabel = 'Pre'#231'o Total'
      DisplayWidth = 8
      FieldName = 'PRECO_TOTAL'
      Origin = 'PRECO_TOTAL'
      Required = True
      DisplayFormat = 'R$ 0.,00'
    end
  end
  object dtsPedido: TDataSource
    DataSet = qryDados
    Left = 456
    Top = 408
  end
end
