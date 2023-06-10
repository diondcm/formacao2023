unit Data.Cliente;

interface

uses
  System.SysUtils, System.Classes, Base.Data.Cadastro, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

const
  MENOR_SALDO_CLIENTE = 200;
  MAIOR_SALDO_CLIENTE = 20000;

type
  TdmdCliente = class(TdmdBaseCadastro)
    qryDadosID: TFDAutoIncField;
    qryDadosCODIGO: TIntegerField;
    qryDadosNOME: TWideStringField;
    qryDadosDATA_CADASTRO: TDateTimeField;
    qryDadosSALDO: TFloatField;
    qryExcluiCliente: TFDQuery;
    procedure qryDadosBeforePost(DataSet: TDataSet);
    procedure qryDadosAfterInsert(DataSet: TDataSet);
    procedure qryDadosNewRecord(DataSet: TDataSet);
    procedure qryDadosBeforeDelete(DataSet: TDataSet);
  private
    FOnDeletaCliente: TProc;
  public
    procedure ValidaSaldoCliente(saldo: Currency; inclusao: Boolean);
    property OnDeletaCliente: TProc read FOnDeletaCliente write FOnDeletaCliente;
  end;

//var
//  dmdCliente: TdmdCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Classe.Cliente;

{$R *.dfm}

procedure TdmdCliente.qryDadosAfterInsert(DataSet: TDataSet);
begin
  inherited;
  // Prefiro o OnNewRecord
end;

procedure TdmdCliente.qryDadosBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  qryExcluiCliente.ParamByName('ID').AsInteger := qryDadosID.AsInteger;
  qryExcluiCliente.ExecSQL;

  if Assigned(FOnDeletaCliente) then
  begin
    FOnDeletaCliente();
  end;

  Abort;
//  raise Exception.Create('Não será executado');
end;

procedure TdmdCliente.qryDadosBeforePost(DataSet: TDataSet);
begin
  inherited;

  var inclusao: Boolean := qryDados.State = dsInsert;

  ValidaSaldoCliente(DataSet.FieldByName('SALDO').AsCurrency, inclusao);
end;

procedure TdmdCliente.qryDadosNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryDadosSALDO.AsFloat := TCliente.MENOR_SALDO_CLIENTE;
end;

procedure TdmdCliente.ValidaSaldoCliente(saldo: Currency; inclusao: Boolean);
begin
  // A melhor opção
  TCliente.ValidaSaldo(saldo, inclusao);

  // A segunda melhor opção
//  if saldo < 0 then
//    raise Exception.Create('O saldo não pode ser menor que zero.')
//  else if saldo < MENOR_SALDO_CLIENTE then
//    raise Exception.Create('Na inclusão, o saldo deve ser maior que R$ ' + FormatFloat('0.,00', MENOR_SALDO_CLIENTE) + '.')
//  else if saldo > MAIOR_SALDO_CLIENTE then
//    raise Exception.Create('O saldo não pode ser maior que R$ ' + FormatFloat('0.,00', MAIOR_SALDO_CLIENTE) + '.');
end;

end.
