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
    object qryDadosID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      Visible = False
    end
    object qryDadosCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 8
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
    object qryDadosDATA_CADASTRO: TDateTimeField
      DisplayLabel = 'Cadastro'
      DisplayWidth = 8
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object qryDadosSALDO: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 8
      FieldName = 'SALDO'
      Origin = 'SALDO'
      DisplayFormat = 'R$ 0.,00'
    end
  end
end
