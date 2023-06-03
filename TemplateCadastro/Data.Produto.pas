unit Data.Produto;

interface

uses
  System.SysUtils, System.Classes, Base.Data.Cadastro, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmdProduto = class(TdmdBaseCadastro)
    qryDadosID: TFDAutoIncField;
    qryDadosNOME: TWideStringField;
    qryDadosDESCRICAO: TWideStringField;
    qryDadosPRECO: TFloatField;
    qryDadosESTOQUE: TIntegerField;
    qryDadosCATEGORIA: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdProduto: TdmdProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
