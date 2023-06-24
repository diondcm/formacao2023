unit Classe.Pessoa;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  TPessoa = class;

  TListaPessoa = class(TObjectList<TPessoa>)
  end;

  // "Classe de transporte": Leva infos de Cliet -> Server e vice-versa
  TPessoa = class
  private
    FID: Integer;
    FNome: string;
    FDataNascimento: TDateTime;
    FRenda: Currency;
    FAtivo: Boolean;
  public
    function ToString: string; override;
//    function  ValidaCamposObrigatorios: string; // Sem regra de negócio

    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property DataNascimento: TDateTime read FDataNascimento write FDataNascimento;
    property Renda: Currency read FRenda write FRenda;
    property Ativo: Boolean read FAtivo write FAtivo;
  end;

implementation

{ TPessoa }

function TPessoa.ToString: string;
begin
  Result := 'Renda: ' + FloatToStr(Renda) + sLineBreak + Result;
  Result := 'Data de Nascimento: ' + DateToStr(DataNascimento) + sLineBreak + Result;
  Result := 'Nome: ' + Nome + sLineBreak + Result;
  Result := 'ID: ' + IntToStr(ID) + sLineBreak + Result;
end;

end.
