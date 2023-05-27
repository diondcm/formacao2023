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
    Left = 88
    Top = 48
  end
end
