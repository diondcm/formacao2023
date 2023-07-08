unit Server.Methods.BlockChain;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Data.DBXPlatform,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, REST.Types, System.NetEncoding,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Data.BlockChain;

type
  TSMBlockChain = class(TDSServerModule)
    procedure DSServerModuleCreate(Sender: TObject);
  private
    FDMBlockChain: TdmBlockChain;
    procedure Teste;
    { Private declarations }
  public
    function GetBlockChainInfo: Boolean;
    function GetBlockChainInfoDS: string;
    function GetBlockChainInfoDSBase64: string;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TSMBlockChain.DSServerModuleCreate(Sender: TObject);
begin
  FDMBlockChain := TdmBlockChain.Create(Self);
end;

function TSMBlockChain.GetBlockChainInfo: Boolean;
begin
  Result := True;
  GetInvocationMetadata.ResponseContentType := 'application/json';
  GetInvocationMetadata.ResponseContent := FDMBlockChain.GetBlockChainInfos;
end;

function TSMBlockChain.GetBlockChainInfoDS: string;
begin
  Result := FDMBlockChain.GetBlockChainInfos;
end;

function TSMBlockChain.GetBlockChainInfoDSBase64: string;
begin
  Result := '';
  GetInvocationMetadata.ResponseContentType := 'application/json';
  GetInvocationMetadata.ResponseContent := TNetEncoding.Base64.Encode(FDMBlockChain.GetBlockChainInfos);
end;

procedure TSMBlockChain.Teste;
begin

end;

end.

