unit Classe.Calcula;

interface

  procedure GeraQuadrado(valor: Integer; var quad: Integer);

  function GetValorMin(val1, val2: Integer): Integer;

exports
  GeraQuadrado,
  GetValorMin;

implementation

uses System.Math;

procedure GeraQuadrado(valor: Integer; var quad: Integer);
begin
  quad := valor * valor;
end;

function GetValorMin(val1, val2: Integer): Integer;
begin
  Result := Min(val1, val2);
end;

end.
