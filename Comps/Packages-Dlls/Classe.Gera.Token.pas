unit Classe.Gera.Token;

interface


type
  TOperacoesMath = class
  protected
    class var
      FValorTeste: Integer;

  public
    class procedure RetornoDobro(const valor: Integer; var dobro: Integer);
  end;

  function GeraTokenNumerico(seed: Integer): Integer; stdcall;

  function GetMaiorValor(Valor1, Valor2: Integer): Integer;

  procedure RetornaDobro(const valor: Integer; var dobro: Integer);

  procedure SetValor(val: Integer);

  function GetValor: Integer;


exports
  GeraTokenNumerico,
  GetMaiorValor,
  RetornaDobro,
  SetValor,
  GetValor;

implementation

uses
  Winapi.Windows, System.SysUtils, System.Math;

procedure SetValor(val: Integer);
begin
  TOperacoesMath.FValorTeste := val;
end;

function GetValor: Integer;
begin
  Result := TOperacoesMath.FValorTeste;
end;

procedure RetornaDobro(const valor: Integer; var dobro: Integer);
begin
  TOperacoesMath.RetornoDobro(valor, dobro);
end;

function GeraTokenNumerico(seed: Integer): Integer;
begin
  Result := GetTickCount;
end;

function GetMaiorValor(Valor1, Valor2: Integer): Integer;
begin
  Result := Max(Valor1, Valor2);
end;

{ TOperacoesMath }

class procedure TOperacoesMath.RetornoDobro(const valor: Integer;
  var dobro: Integer);
begin
  dobro := valor * 2;
end;

end.
