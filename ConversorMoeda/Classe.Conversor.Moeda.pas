unit Classe.Conversor.Moeda;

interface

uses WinAPI.Windows, System.SysUtils;

type
  TConversorMoeda = class
    const
      COTACAO_DOLAR = 4.5; // 1 dolar = 5 reais

    class function RealParaDolar(valorReal: string): string; overload;
    class function RealParaDolar(valorReal: Double): Double; overload;
    class function DolarParaReal(valorDolar: Double): Double; overload;
    class function DolarParaReal(valorDolar: string): string; overload;
  end;


//  Procedural
//  function ConverteRealParaDolar(): Double;

implementation

//function ConverteRealParaDolar(): Double;
//begin
//
//end;

{ TConversorMoeda }

class function TConversorMoeda.DolarParaReal(valorDolar: Double): Double;
begin
  Result := valorDolar * COTACAO_DOLAR;
end;

class function TConversorMoeda.DolarParaReal(valorDolar: string): string;
begin
  var valorIniDolar: Double := 0;

  if valorDolar = '' then
  begin
    Exit('Valor não informado');
  end;

  var qtdPts: Integer := 0;
  for var i := 0 to valorDolar.Length -1 do // valorDolar.Length -1 ou um outro pred(valorDolar.Length)
  begin
    if (valorDolar[i] = '.') or (valorDolar[i] = ',') then
    begin
      Inc(qtdPts);// qtdPts := qtdPts + 1;
    end;
  end;

  if qtdPts > 1 then
  begin
    Exit('NÃO pode colocar "." e ",", use apenas a separação de decimais');
  end;

  valorDolar := StringReplace(valorDolar, '.', ',', []);

  if not TryStrToFloat(valorDolar, valorIniDolar) then
  begin
    Result := 'Valor inválido';
  end else begin
    Result := FormatFloat('R$ 0.,00', DolarParaReal(valorIniDolar));
  end;
end;

class function TConversorMoeda.RealParaDolar(valorReal: Double): Double;
begin
  Result := valorReal / COTACAO_DOLAR; // ou * 0.2
end;

class function TConversorMoeda.RealParaDolar(valorReal: string): string;
begin
  var valorIniReal: Double := 0;

  if valorReal = '' then
  begin
    Exit('Valor não informado');
  end;

  var qtdPts: Integer := 0;
  for var i := 0 to valorReal.Length -1 do // valorReal.Length -1 ou um outro pred(valorReal.Length)
  begin
    if (valorReal[i] = '.') or (valorReal[i] = ',') then
    begin
      Inc(qtdPts);// qtdPts := qtdPts + 1;
    end;
  end;

  if qtdPts > 1 then
  begin
    Exit('NÃO pode colocar "." e ",", use apenas a separação de decimais');
  end;

  valorReal := StringReplace(valorReal, '.', ',', []);

  if not TryStrToFloat(valorReal, valorIniReal) then
  begin
    Result := 'Valor inválido';
  end else begin
    Result := FormatFloat('US$ 0.,00', RealParaDolar(valorIniReal));
  end;
end;

end.
