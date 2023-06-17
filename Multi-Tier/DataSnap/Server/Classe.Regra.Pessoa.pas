unit Classe.Regra.Pessoa;

interface

uses Classe.Pessoa;

type
  TRegra = class end;

  // Opção 1: Classe herdada:
  TPessoaRegra = class(TPessoa)
  private
    FDBArmazenamento: string;
  public
    function ValidaCamposObrigatorios: string;
    property DBArmazenamento: string read FDBArmazenamento write FDBArmazenamento;
  end;

  // Opção 2: Wrapper
  TPessoaRegra2 = class(TRegra)
  private
    FPessoa: TPessoa;
  public
    function ValidaCamposObrigatorios: string;
    property Pessoa: TPessoa read FPessoa write FPessoa;
  end;


implementation

{ TPessoaRegra }

function TPessoaRegra.ValidaCamposObrigatorios: string;
begin
  Result := '';

  if ID <= 0 then
  begin
    Result := Result + sLineBreak + 'Informe o "ID"';
  end;

  if Nome = '' then
  begin
    Result := Result + sLineBreak + 'Informe o "Nome"';
  end;

  if DataNascimento <= 0 then
  begin
    Result := Result + sLineBreak + 'Informe a Data de Nascimento';
  end;

  if Renda <= 0  then
  begin
    Result := Result + sLineBreak + 'Infore a Renda';
  end;
end;

{ TPessoaRegra2 }

function TPessoaRegra2.ValidaCamposObrigatorios: string;
begin
  Result := '';

  if FPessoa.ID <= 0 then
  begin
    Result := Result + sLineBreak + 'Informe o "ID"';
  end;

  if FPessoa.Nome = '' then
  begin
    Result := Result + sLineBreak + 'Informe o "Nome"';
  end;

  if FPessoa.DataNascimento <= 0 then
  begin
    Result := Result + sLineBreak + 'Informe a Data de Nascimento';
  end;

  if FPessoa.Renda <= 0  then
  begin
    Result := Result + sLineBreak + 'Infore a Renda';
  end;
end;

end.
