unit Classe.Gera.Token;

interface

uses
  Form.Gera.Token;


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

  function GeraToken(base: Integer): Boolean;
  function GeraTokenStr(base: PChar): Boolean;

  function ExibeValor(valInt: Integer; ValVar: Variant; ValStr: string): Boolean;

exports
  GeraTokenNumerico,
  GetMaiorValor,
  RetornaDobro,
  SetValor,
  GetValor,
  GeraToken,
  GeraTokenStr name 'GeraNovoTokenString',
  ExibeValor;

implementation

uses
  Winapi.Windows, System.SysUtils, System.Math, Vcl.Dialogs;

function ExibeValor(valInt: Integer; ValVar: Variant; ValStr: string): Boolean;
begin
  Result := True;
  ShowMessage('Valores: ' + IntToStr(valInt) + ' - ' + ValStr + ' - ' + ValVar);
end;

function GeraToken(base: Integer): Boolean;
begin
  Result := TfrmGeraToken.GeraToken(base);
end;

function GeraTokenStr(base: PChar): Boolean;
begin
  Result := TfrmGeraToken.GeraToken(base);
end;

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
