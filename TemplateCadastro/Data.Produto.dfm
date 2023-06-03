inherited dmdProduto: TdmdProduto
  Height = 605
  Width = 818
  PixelsPerInch = 120
  inherited qryDados: TFDQuery
    SQL.Strings = (
      'SELECT ID,'
      '       NOME,'
      '       DESCRICAO,'
      '       PRECO,'
      '       ESTOQUE,'
      '       CATEGORIA'
      '  FROM PRODUTO')
    Left = 376
    Top = 232
    object qryDadosID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      Visible = False
    end
    object qryDadosNOME: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 20
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 150
    end
    object qryDadosDESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 20
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 150
    end
    object qryDadosPRECO: TFloatField
      DisplayLabel = 'Pre'#231'o'
      DisplayWidth = 8
      FieldName = 'PRECO'
      Origin = 'PRECO'
      DisplayFormat = 'R$ 0.,00'
    end
    object qryDadosESTOQUE: TIntegerField
      DisplayLabel = 'Estoque'
      DisplayWidth = 8
      FieldName = 'ESTOQUE'
      Origin = 'ESTOQUE'
      DisplayFormat = '0.,'
    end
    object qryDadosCATEGORIA: TWideStringField
      DisplayLabel = 'Categoria'
      DisplayWidth = 20
      FieldName = 'CATEGORIA'
      Origin = 'CATEGORIA'
      Size = 150
    end
  end
end
