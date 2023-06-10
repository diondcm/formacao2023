inherited dmdCliente: TdmdCliente
  PixelsPerInch = 120
  inherited qryDados: TFDQuery
    AfterInsert = qryDadosAfterInsert
    BeforePost = qryDadosBeforePost
    BeforeDelete = qryDadosBeforeDelete
    OnNewRecord = qryDadosNewRecord
    SQL.Strings = (
      'SELECT ID,'
      '       CODIGO,'
      '       NOME,'
      '       DATA_CADASTRO,'
      '       SALDO'
      '  FROM CLIENTE'
      '  WHERE EXCLUIDO = False')
    Left = 440
    object qryDadosID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
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
  object qryExcluiCliente: TFDQuery
    SQL.Strings = (
      'UPDATE CLIENTE SET EXCLUIDO = True '
      'WHERE ID = :ID')
    Left = 616
    Top = 312
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
end
