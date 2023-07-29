unit Data.Relatorios.Simples;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass, frxDBSet, Datasnap.DBClient, frCoreClasses;

type
  TdmdRelatoriosSimples = class(TDataModule)
    frxReportExemplo: TfrxReport;
    frxReportListaSimples: TfrxReport;
    frxReportMainDetail: TfrxReport;
    frxDBDatasetCustomer: TfrxDBDataset;
    memCustomer: TFDMemTable;
    memCustomerCustNo: TFloatField;
    memCustomerCompany: TStringField;
    memCustomerAddr1: TStringField;
    memCustomerAddr2: TStringField;
    memCustomerCity: TStringField;
    memCustomerState: TStringField;
    memCustomerZip: TStringField;
    memCustomerCountry: TStringField;
    memCustomerPhone: TStringField;
    memCustomerFAX: TStringField;
    memCustomerTaxRate: TFloatField;
    memCustomerContact: TStringField;
    memCustomerLastInvoiceDate: TDateTimeField;
    memCountry: TFDMemTable;
    frxDBDatasetCountry: TfrxDBDataset;
    memCliente: TFDMemTable;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    FloatField2: TFloatField;
    StringField10: TStringField;
    DateTimeField1: TDateTimeField;
    dtsMasterCustormer: TDataSource;
    memPedido: TFDMemTable;
    memPedidoOrderNo: TFloatField;
    memPedidoCustNo: TFloatField;
    memPedidoSaleDate: TDateTimeField;
    memPedidoShipDate: TDateTimeField;
    memPedidoEmpNo: TIntegerField;
    memPedidoShipToContact: TStringField;
    memPedidoShipToAddr1: TStringField;
    memPedidoShipToAddr2: TStringField;
    memPedidoShipToCity: TStringField;
    memPedidoShipToState: TStringField;
    memPedidoShipToZip: TStringField;
    memPedidoShipToCountry: TStringField;
    memPedidoShipToPhone: TStringField;
    memPedidoShipVIA: TStringField;
    memPedidoPO: TStringField;
    memPedidoTerms: TStringField;
    memPedidoPaymentMethod: TStringField;
    memPedidoItemsTotal: TCurrencyField;
    memPedidoTaxRate: TFloatField;
    memPedidoFreight: TCurrencyField;
    memPedidoAmountPaid: TCurrencyField;
    dtsCountry: TDataSource;
    frxReportPedidosPorCliente: TfrxReport;
    frxDBDatasetCliente: TfrxDBDataset;
    frxDBDataset1: TfrxDBDataset;
    frxReportModeloBase: TfrxReport;
    memCliComImg: TFDMemTable;
    frxDBDatasetCliComImg: TfrxDBDataset;
    frxReport1: TfrxReport;
    memBioLife: TFDMemTable;
    frxDBDatasetBioLife: TfrxDBDataset;
    memOrderIndexado: TFDMemTable;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    IntegerField1: TIntegerField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    CurrencyField1: TCurrencyField;
    FloatField5: TFloatField;
    CurrencyField2: TCurrencyField;
    CurrencyField3: TCurrencyField;
    frxDBOrderIndex: TfrxDBDataset;
    frxReportGroupUm: TfrxReport;
    frxReport2: TfrxReport;
    memImg2: TFDMemTable;
    frxDBDatasetImg2: TfrxDBDataset;
    frxReportBase: TfrxReport;
    frxReportFilho: TfrxReport;
    procedure frxReportGroupUmBeforePrint(Sender: TfrxReportComponent);
  private
    FExecutouAjuste: Boolean;
    FTituloGroupUm: string;
  public
    procedure AjustaDados;
    procedure ExibeRelatorioGroupUm(titulo: string);
  end;

var
  dmdRelatoriosSimples: TdmdRelatoriosSimples;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdRelatoriosSimples }

procedure TdmdRelatoriosSimples.AjustaDados;
begin
  if FExecutouAjuste then Exit;

  memCustomer.IndexFieldNames := '';
  memCustomer.First;
  while not memCustomer.Eof do
  begin
    memCustomer.Edit;
    if memCustomerCountry.AsString = 'US' then
    begin
      memCustomerCountry.AsString := 'United States of America';
    end;

    if memCustomerCountry.AsString = 'US Virgin Islands' then
    begin
      memCustomerCountry.AsString := 'Mexico';
    end;

    if memCustomerCountry.AsString = 'West Indies' then
    begin
      memCustomerCountry.AsString := 'Brazil';
    end;

    if memCustomerCountry.AsString = 'Bahamas' then
    begin
      memCustomerCountry.AsString := 'Brazil';
    end;

    if memCustomerCountry.AsString = 'Fiji' then
    begin
      memCustomerCountry.AsString := 'Jamaica';
    end;

    memCustomer.Post;

    memCustomer.Next;
  end;

  memCustomer.First;
  memCustomer.IndexFieldNames := 'Country';
  FExecutouAjuste := True;
end;

procedure TdmdRelatoriosSimples.ExibeRelatorioGroupUm(titulo: string);
begin
  FTituloGroupUm := titulo;
  frxReportGroupUm.Variables['VersaoSistema'] := QuotedStr('v1.1.5.0');
  frxReportGroupUm.ShowReport;
end;

procedure TdmdRelatoriosSimples.frxReportGroupUmBeforePrint(
  Sender: TfrxReportComponent);
begin
  if (Sender is TfrxMemoView) then
  begin
    if UpperCase(TfrxMemoView(Sender).Name) = UpperCase('MemoTitulo') then
    begin
      TfrxMemoView(Sender).Text := FTituloGroupUm;
    end;
  end;
end;

end.
