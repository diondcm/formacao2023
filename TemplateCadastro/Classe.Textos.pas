unit Classe.Textos;

interface

type
  TTextosSistema = class
  public
    const
      CONFIRMA_DELECAO = 'Confirma exclusão do registro?';
      CONFIRMA_SAIDA_CAD = 'Cadastro em edição. Sair cancelará as alterações' + sLineBreak + 'Sair mesmo assim?';
  end;

resourcestring
  CONFIRMA_DELECAO_STR = 'Confirma exclusão do registro?';
  SEM_REGISTROS_STR = 'sem registros para exibir';


implementation

end.
