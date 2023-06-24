unit ClientModuleUnit;

interface

uses
  System.SysUtils, System.Classes, ClientClassesUnit1, Datasnap.DSClientRest;

type
  TClientModule = class(TDataModule)
    DSRestConnection1: TDSRestConnection;
  private
    FInstanceOwner: Boolean;
    FSMGeralClient: TSMGeralClient;
    FSMFilesClient: TSMFilesClient;
    FSMBlockChainClient: TSMBlockChainClient;
    function GetSMGeralClient: TSMGeralClient;
    function GetSMFilesClient: TSMFilesClient;
    function GetSMBlockChainClient: TSMBlockChainClient;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property SMGeralClient: TSMGeralClient read GetSMGeralClient write FSMGeralClient;
    property SMFilesClient: TSMFilesClient read GetSMFilesClient write FSMFilesClient;
    property SMBlockChainClient: TSMBlockChainClient read GetSMBlockChainClient write FSMBlockChainClient;

end;

var
  ClientModule: TClientModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TClientModule.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModule.Destroy;
begin
  FSMGeralClient.Free;
  FSMFilesClient.Free;
  FSMBlockChainClient.Free;
  inherited;
end;

function TClientModule.GetSMGeralClient: TSMGeralClient;
begin
  if FSMGeralClient = nil then
    FSMGeralClient:= TSMGeralClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSMGeralClient;
end;
function TClientModule.GetSMFilesClient: TSMFilesClient;
begin
  if FSMFilesClient = nil then
    FSMFilesClient:= TSMFilesClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSMFilesClient;
end;
function TClientModule.GetSMBlockChainClient: TSMBlockChainClient;
begin
  if FSMBlockChainClient = nil then
    FSMBlockChainClient:= TSMBlockChainClient.Create(DSRestConnection1, FInstanceOwner);
  Result := FSMBlockChainClient;
end;

end.
