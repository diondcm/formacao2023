unit Classe.Cliente;

interface

type
  TCliente = class
  public const
      MENOR_SALDO_CLIENTE = 200;
      MAIOR_SALDO_CLIENTE = 20000;
  public
    class procedure ValidaSaldo(saldo: Currency; inclusao: Boolean);
  end;

implementation

uses System.SysUtils;

{ TCliente }

class procedure TCliente.ValidaSaldo(saldo: Currency; inclusao: Boolean);
begin
  if (saldo < 0) then
    raise Exception.Create('O saldo não pode ser menor que zero.')
  else if (saldo < MENOR_SALDO_CLIENTE) and (inclusao) then
    raise Exception.Create('Na inclusão, o saldo deve ser maior que R$ ' + FormatFloat('0.,00', MENOR_SALDO_CLIENTE) + '.')
  else if saldo > MAIOR_SALDO_CLIENTE then
    raise Exception.Create('O saldo não pode ser maior que R$ ' + FormatFloat('0.,00', MAIOR_SALDO_CLIENTE) + '.');
end;

end.
