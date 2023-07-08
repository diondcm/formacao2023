unit Classe.Patrimonio;

interface

uses
  System.Generics.Collections;

type
  IPatrimonio = interface(IInterface)
  ['{33F9D6A4-DD48-43F4-AC16-DC18F9924F72}']
    function GetValorCompra: Currency;
    function GetDataCompra: TDateTime;
    procedure SetDataCompra(Value: TDateTime);
    procedure SetValorCompra(Value: Currency);
    function GetDataDepreciacao: TDateTime;
    function GetTipo: string;

    property ValorCompra: Currency read GetValorCompra write SetValorCompra;
    property DataCompra: TDateTime read GetDataCompra write SetDataCompra;
    property DataDepreciacao: TDateTime read GetDataDepreciacao;
    property Tipo: string read GetTipo;
  end;

  TListaPatrimonio = class(TList<IPatrimonio>)
    function GetValorTotal: Currency;
  end;

implementation

{ TListaPatrimonio }

function TListaPatrimonio.GetValorTotal: Currency;
begin
  Result := 0;
  for var pat: IPatrimonio in Self do
  begin
    Result := Result + pat.ValorCompra;
  end;
end;

end.
