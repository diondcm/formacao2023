object SMProduto: TSMProduto
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\AQUASOFT\Documents\formacao2023\db\cadastroTem' +
        'plate.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 480
    Top = 360
  end
  object qryProduto: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'select'
      '    ID,'
      '    NOME,'
      '    DESCRICAO,'
      '    PRECO,'
      '    ESTOQUE,'
      '    CATEGORIA '
      'from PRODUTO'
      'order by NOME'
      'LIMIT 3')
    Left = 480
    Top = 448
  end
end
