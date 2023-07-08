unit Classe.Imovel;

interface

uses
  Classe.Base, Classe.Patrimonio, System.DateUtils;

type
  TImovel = class(TClasseBase, IPatrimonio)
  private
    FDataCompra: TDateTime;
    FValorCompra: Currency;
    FNumMesesDepreciacao: Integer;
  public
    { IPatrimonio }
    function GetDataCompra: TDateTime;
    function GetDataDepreciacao: TDateTime;
    function GetValorCompra: Currency;
    procedure SetDataCompra(Value: TDateTime);
    procedure SetValorCompra(Value: Currency);
    function GetTipo: string;

    property ValorCompra: Currency read GetValorCompra write SetValorCompra;
    property DataCompra: TDateTime read GetDataCompra write SetDataCompra;
    property DataDepreciacao: TDateTime read GetDataDepreciacao;
    property NumMesesDepreciacao: Integer write FNumMesesDepreciacao;
    property Tipo: string read GetTipo;
  end;

  TCasa = class(TImovel)

  end;

  TApartamento = class(TImovel)

  end;

  TSalaComercial = class(TImovel)

  end;

implementation

{ TImovel }

function TImovel.GetDataCompra: TDateTime;
begin
  Result := FDataCompra;
end;

function TImovel.GetDataDepreciacao: TDateTime;
begin
  Result := IncDay(FDataCompra, FNumMesesDepreciacao * 30);
end;

function TImovel.GetTipo: string;
begin
  Result := Self.ClassName;
end;

function TImovel.GetValorCompra: Currency;
begin
  Result := FValorCompra;
end;

procedure TImovel.SetDataCompra(Value: TDateTime);
begin
  FDataCompra := Value;
end;

procedure TImovel.SetValorCompra(Value: Currency);
begin
  FValorCompra := Value;
end;

end.
