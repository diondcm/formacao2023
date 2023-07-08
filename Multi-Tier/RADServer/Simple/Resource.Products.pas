unit Resource.Products;

// EMS Resource Module

interface

uses
  System.SysUtils, System.Classes, System.JSON,
  EMS.Services, EMS.ResourceAPI, EMS.ResourceTypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.ConsoleUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, EMS.DataSetResource, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  [ResourceName('Produtos')]
  TProdutosResource1 = class(TDataModule)
    FDConnection1: TFDConnection;
    qryProducts: TFDQuery;
    [ResourceSuffix('ListProducts')]
    dsrProducts: TEMSDataSetResource;

  published

    [EndPointRequestSummary('Tests', 'ListItems', 'Retrieves list of items', 'application/json', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spObject, TAPIDoc.TPrimitiveFormat.None, '', '')]
    procedure Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);

    [EndPointRequestSummary('Tests', 'GetItem', 'Retrieves item with specified ID', 'application/json', '')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Path, 'item', 'A item ID', true, TAPIDoc.TPrimitiveType.spString,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spString, '', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spObject, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [EndPointResponseDetails(404, 'Not Found', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [ResourceSuffix('{item}')]
    procedure GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);

    [EndPointRequestSummary('Tests', 'PostItem', 'Creates new item', '', 'application/json')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Body, 'body', 'A new item content', true, TAPIDoc.TPrimitiveType.spObject,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spObject, '', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [EndPointResponseDetails(409, 'Item Exist', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    procedure Post(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);

    [EndPointRequestSummary('Tests', 'PutItem', 'Updates item with specified ID', '', 'application/json')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Path, 'item', 'A item ID', true, TAPIDoc.TPrimitiveType.spString,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spString, '', '')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Body, 'body', 'A item changes', true, TAPIDoc.TPrimitiveType.spObject,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spObject, '', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [EndPointResponseDetails(404, 'Not Found', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [ResourceSuffix('{item}')]
    procedure PutItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);

    [EndPointRequestSummary('Tests', 'DeleteItem', 'Deletes item with specified ID', '', '')]
    [EndPointRequestParameter(TAPIDocParameter.TParameterIn.Path, 'item', 'A item ID', true, TAPIDoc.TPrimitiveType.spString,
      TAPIDoc.TPrimitiveFormat.None, TAPIDoc.TPrimitiveType.spString, '', '')]
    [EndPointResponseDetails(200, 'Ok', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [EndPointResponseDetails(404, 'Not Found', TAPIDoc.TPrimitiveType.spNull, TAPIDoc.TPrimitiveFormat.None, '', '')]
    [ResourceSuffix('{item}')]
    procedure DeleteItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TProdutosResource1.Get(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
begin
  // Sample code
  AResponse.Body.SetValue(TJSONString.Create('Produtos'), True);
end;

procedure TProdutosResource1.GetItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LItem: string;
begin
  LItem := ARequest.Params.Values['item'];
  AResponse.Body.SetValue(TJSONString.Create('Produtos ' + LItem), True);
end;

procedure TProdutosResource1.Post(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
begin
  AResponse.Body.SetValue(TJSONString.Create('Post Produtos'), True);
end;

procedure TProdutosResource1.PutItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LItem: string;
begin
  LItem := ARequest.Params.Values['item'];
  AResponse.Body.SetValue(TJSONString.Create('Put Produtos'), True);
end;

procedure TProdutosResource1.DeleteItem(const AContext: TEndpointContext; const ARequest: TEndpointRequest; const AResponse: TEndpointResponse);
var
  LItem: string;
begin
  LItem := ARequest.Params.Values['item'];
  AResponse.Body.SetValue(TJSONString.Create('Delete Produtos'), True);
end;

procedure Register;
begin
  RegisterResource(TypeInfo(TProdutosResource1));
end;

initialization
  Register;
end.


