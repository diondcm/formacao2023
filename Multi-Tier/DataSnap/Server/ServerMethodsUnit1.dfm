object ServerMethods1: TServerMethods1
  OnCreate = DSServerModuleCreate
  OnDestroy = DSServerModuleDestroy
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object memPessoa: TFDMemTable
    FieldDefs = <>
    CachedUpdates = True
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 376
    Top = 104
    object memPessoaID: TIntegerField
      FieldName = 'ID'
    end
    object memPessoaNome: TStringField
      FieldName = 'Nome'
      Size = 300
    end
    object memPessoaDataNascimento: TDateTimeField
      FieldName = 'DataNascimento'
    end
    object memPessoaRenda: TCurrencyField
      FieldName = 'Renda'
    end
    object memPessoaAtivo: TBooleanField
      FieldName = 'Ativo'
    end
  end
end
