unit Classe.Pessoa;

interface

uses
  System.SysUtils, System.DateUtils;

type
  TPessoaFisica = class;
  TPessoaJuridica = class;

  TPessoa = class // Scopo padrão/Default: public até TComponent >> Published
  strict private
    FSaldo: Currency;
    FDataNascimento: TDate;
    procedure SetCodigo(const Value: Integer);
  strict protected
    FCodigo: Integer;
  public
    function ImprimePessoa(var p: TPessoa): string;
    function ToString: string; override;

    property Codigo: Integer read FCodigo write SetCodigo;
    property Saldo: Currency read FSaldo write FSaldo;
    property DataNascimento: TDate read FDataNascimento write FDataNascimento;
  end;

  TPessoaMock = class
    class procedure GeraPessoa(p: TPessoa);
    class procedure GeraPessoaFisica(p: TPessoaFisica);
    class procedure GeraPessoaJuridica(p: TPessoaJuridica);
  end;

  TPessoaFisica = class(TPessoa)
  private
    FNome: string;
    FCPF: string;
  public
    function ToString: string; override;

    property Nome: string read FNome write FNome;
    property CPF: string read FCPF write FCPF;
  end;

  TPessoaJuridica = class(TPessoa)
  private
    FCNPJ: string;
    FNomeFantasia: string;
    FRazaoSocial: string;
  public
    function ToString: string; override;
    property CNPJ: string read FCNPJ write FCNPJ;
    property NomeFantasia: string read FNomeFantasia write FNomeFantasia;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
  end;


implementation

{ TPessoa }

function TPessoa.ImprimePessoa(var p: TPessoa): string;
begin
  Result :=  format('End. mem: $%p', [Pointer(p)]) + sLineBreak + p.ToString;
end;

procedure TPessoa.SetCodigo(const Value: Integer);
begin
  if Value <= 0 then
  begin
    raise Exception.Create('Código não pode ser inferior ou igual a zero.');
  end;

  FCodigo := Value;
end;

function TPessoa.ToString: string;
begin
  Result :=
    'Código: ' + Codigo.ToString + sLineBreak +
    'Data Nascimento: ' + DateToStr(DataNascimento) + sLineBreak +
    'Saldo: ' + FormatFloat('R$ 0.,00', Saldo) + sLineBreak;
end;

{ TPessoaMock }

class procedure TPessoaMock.GeraPessoa(p: TPessoa);
begin
  p.Codigo := Random(9999) + 1;
  p.Saldo := Random(99999)  + 100 + (Random(99)/100);
  p.DataNascimento := IncMonth(IncYear(Now, - Random(45)), - Random(12));
end;

class procedure TPessoaMock.GeraPessoaFisica(p: TPessoaFisica);

  function GenerateRandomCPF: string;
  var
    i, Sum, Digit: Integer;
    FirstDigit, SecondDigit: Integer;
    CPF: string;
  begin
    Randomize;
    CPF := '';
    for i := 1 to 9 do
      CPF := CPF + IntToStr(Random(9));
    Sum := 0;
    for i := 1 to 9 do
      Sum := Sum + StrToInt(CPF[i]) * (11 - i);
    Digit := 11 - (Sum mod 11);
    if Digit >= 10 then
      Digit := 0;
    FirstDigit := Digit;
    CPF := CPF + IntToStr(FirstDigit);
    Sum := 0;
    for i := 1 to 10 do
      Sum := Sum + StrToInt(CPF[i]) * (12 - i);
    Digit := 11 - (Sum mod 11);
    if Digit >= 10 then
      Digit := 0;
    SecondDigit := Digit;
    CPF := CPF + IntToStr(SecondDigit);
    Result := Format('%s.%s.%s-%s', [Copy(CPF, 1, 3), Copy(CPF, 4, 3), Copy(CPF, 7, 3), Copy(CPF, 10, 2)]);
  end;

begin
  GeraPessoa(p);
  p.Nome := 'Testes Primeiros ' + IntToStr(Random(1000));
  p.CPF := GenerateRandomCPF;
end;

class procedure TPessoaMock.GeraPessoaJuridica(p: TPessoaJuridica);
begin
  GeraPessoa(p);
  p.CNPJ := Random(99999999).ToString;
  p.NomeFantasia := 'Nomes Primeiros ' + IntToStr(Random(1000));
  p.RazaoSocial := 'Razao Sociais ' + IntToStr(Random(1000));
end;

{ TPessoaFisica }

function TPessoaFisica.ToString: string;
begin
  FCodigo := -5000;

  Result :=
    'Nome: ' + Nome + sLineBreak +
    'CPF: ' + CPF + sLineBreak +
     inherited ToString;
end;

{ TPessoaJuridica }

function TPessoaJuridica.ToString: string;
begin
  Result :=
    'Nome Fantasia: ' + NomeFantasia + sLineBreak +
    'Razão Social: ' + RazaoSocial + sLineBreak +
    'CNPJ: ' + CNPJ + sLineBreak +
     inherited ToString;
end;

end.
