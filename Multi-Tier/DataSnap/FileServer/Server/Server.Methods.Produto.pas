unit Server.Methods.Produto;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, System.NetEncoding,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Classe.Produtos, Data.DBXPlatform, System.JSON, REST.Json;

type
  TSMProduto = class(TDSServerModule)
    FDConnection: TFDConnection;
    qryProduto: TFDQuery;
  private
    { Private declarations }
  public
    function GetProdutosDelphi: TListaProdutos;
    function GetProdutos: Boolean;
    function GetProdutosBase64: Boolean;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TSMProduto }

function TSMProduto.GetProdutos: Boolean;
begin
  Result := True;
  var lst: TListaProdutos := GetProdutosDelphi;

  GetInvocationMetadata.ResponseContentType := 'application/json';
  GetInvocationMetadata.ResponseContent := TJson.ObjectToJsonString(lst);

  lst.Free;
end;

function TSMProduto.GetProdutosBase64: Boolean;
begin
  Result := True;
  var lst: TListaProdutos := GetProdutosDelphi;

  var str: string := TJson.ObjectToJsonString(lst);
//  TEncoding.UTF8.GetBytes(str)

  GetInvocationMetadata.ResponseContentType := 'application/json';
  GetInvocationMetadata.ResponseContent := TEncoding.ANSI.GetString(TNetEncoding.Base64.Encode(TEncoding.ANSI.GetBytes(Ansistring(str))));
  // TNetEncoding.Base64.Encode(TJson.ObjectToJsonString(lst));

  lst.Free;
end;

function TSMProduto.GetProdutosDelphi: TListaProdutos;
begin
  Result := TListaProdutos.Create;
  // ORM
  qryProduto.Close;
  qryProduto.Open;
  qryProduto.FetchAll;

  qryProduto.IndexFieldNames := 'NOME';

  while not qryProduto.Eof do
  begin
    var prod: TProduto := TProduto.Create;
    prod.ID := qryProduto.FieldByName('ID').AsInteger;
    prod.Nome := qryProduto.FieldByName('NOME').AsString;
    prod.Descricao := qryProduto.FieldByName('DESCRICAO').AsString;
    prod.Preco := qryProduto.FieldByName('PRECO').AsCurrency;
    prod.Estoque := qryProduto.FieldByName('ESTOQUE').AsInteger;
    prod.Categoria := qryProduto.FieldByName('CATEGORIA').AsString;

    Result.Add(prod);
    qryProduto.Next;
  end;
end;

end.

