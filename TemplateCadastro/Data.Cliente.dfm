inherited dmdCliente: TdmdCliente
  PixelsPerInch = 120
  inherited qryDados: TFDQuery
    SQL.Strings = (
      'SELECT ID,'
      '       CODIGO,'
      '       NOME,'
      '       DATA_CADASTRO,'
      '       SALDO'
      '  FROM CLIENTE')
    Left = 440
  end
end
