unit Data.Pedido;

interface

uses
  System.SysUtils, System.Classes, Base.Data.Cadastro, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmdPedido = class(TdmdBaseCadastro)
    qryItens: TFDQuery;
    dtsPedido: TDataSource;
    qryDadosCODIGO: TIntegerField;
    qryDadosNOME: TWideStringField;
    qryDadosDATA_PEDIDO: TWideMemoField;
    qryDadosPRECO_TOTAL: TFloatField;
    qryDadosIDPEDIDO: TFDAutoIncField;
    qryItensPRODUTO: TWideStringField;
    qryItensDESCRICAO: TWideStringField;
    qryItensQTD: TIntegerField;
    qryItensPRECO_UNIT: TFloatField;
    qryItensPRECO_TOTAL: TFloatField;
    procedure qryDadosAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmdPedido.qryDadosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qryItens.Open;
end;

end.
