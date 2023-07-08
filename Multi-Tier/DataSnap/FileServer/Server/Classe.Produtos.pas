unit Classe.Produtos;

interface

uses
  System.Generics.Collections;

type
  TProduto = class;
  TListaProdutos = class(TObjectList<TProduto>)
  end;

  TProduto = class
  private
    FID: Integer;
    FNome: string;
    FDescricao: string;
    FPreco: Real;
    FEstoque: Integer;
    FCategoria: string;
  public
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property Descricao: string read FDescricao write FDescricao;
    property Preco: Real read FPreco write FPreco;
    property Estoque: Integer read FEstoque write FEstoque;
    property Categoria: string read FCategoria write FCategoria;
  end;


implementation

end.
