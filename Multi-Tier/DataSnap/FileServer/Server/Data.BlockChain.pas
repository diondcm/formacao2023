unit Data.BlockChain;

interface

uses
  System.SysUtils, System.Classes, REST.Types, REST.Client, System.Generics.Collections,
  Data.Bind.Components, Data.Bind.ObjectScope, System.SyncObjs, System.Hash;

type
  TdmBlockChain = class(TDataModule)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
  private
  class var
    FCriticalSection: TCriticalSection;
    FBlockData: TDictionary<string, string>;
  public
    class function GetBlockData: TDictionary<string, string>;
    class procedure AddBlockData(data: string);
    class constructor Create;
    class destructor Destroy;
  public
    function GetBlockChainInfos: string;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmBlockChain }

class procedure TdmBlockChain.AddBlockData(data: string);
begin
  FCriticalSection.Enter;
  try
    GetBlockData.Add(THashSHA2.GetHashString(data), data);
  finally
    FCriticalSection.Leave;
  end;
end;

class constructor TdmBlockChain.Create;
begin
  FCriticalSection := TCriticalSection.Create;
end;

class destructor TdmBlockChain.Destroy;
begin
  FCriticalSection.Free;
  FBlockData.Free;
end;

function TdmBlockChain.GetBlockChainInfos: string;
begin
  if GetBlockData.Count = 0 then
  begin
    TThread.CreateAnonymousThread(
      procedure
      begin
        var Client: TRESTClient := TRESTClient.Create(nil);
        Client.BaseURL := 'https://blockchain.info/rawblock/0000000000000bae09a7a393a8acded75aa67e46cb81f7acaa5ad94f9eacd103';

        var Response: TRESTResponse := TRESTResponse.Create(nil);
        var Request: TRESTRequest := TRESTRequest.Create(nil);
        Request.Client := Client;
        Request.Response := Response;

        Request.Execute;
        AddBlockData(Response.Content);

        Client.Free;
        Response.Free;
        Request.Free;
      end).Start;

    Exit('');
  end;

  Result := GetBlockData.Values.ToArray[0];
end;

class function TdmBlockChain.GetBlockData: TDictionary<string, string>;
begin
  if not Assigned(FBlockData) then
  begin
    FBlockData := TDictionary<string, string>.Create;
  end;

  Result := FBlockData;
end;

end.
