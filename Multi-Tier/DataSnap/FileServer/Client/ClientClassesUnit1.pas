//
// Created by the DataSnap proxy generator.
// 24/06/2023 17:06:13
//

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, System.Generics.Collections, Data.DBXJSONReflect;

type

  TSMGeralClient = class(TDSAdminRestClient)
  private
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
  end;

  TSMFilesClient = class(TDSAdminRestClient)
  private
    FAddImagemListaCommand: TDSRestCommand;
    FGetListaImagensCommand: TDSRestCommand;
    FGetListaImagensCommand_Cache: TDSRestCommand;
    FGetFileCommand: TDSRestCommand;
    FGetFileCommand_Cache: TDSRestCommand;
    FGetFileGeralCommand: TDSRestCommand;
    FSetFileCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure AddImagemLista(arq: string; stm: TStream);
    function GetListaImagens(const ARequestFilter: string = ''): TDictionary<System.string,System.Classes.TStream>;
    function GetFile(arq: string; out Size: Cardinal; const ARequestFilter: string = ''): TStream;
    function GetFile_Cache(arq: string; out Size: Cardinal; const ARequestFilter: string = ''): IDSRestCachedStream;
    function GetFileGeral(arq: string; const ARequestFilter: string = ''): Boolean;
    function SetFile(arq: string; arquivo: TStream; const ARequestFilter: string = ''): Int64;
  end;

  TSMBlockChainClient = class(TDSAdminRestClient)
  private
    FDSServerModuleCreateCommand: TDSRestCommand;
    FGetBlockChainInfoCommand: TDSRestCommand;
    FGetBlockChainInfoDSCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    function GetBlockChainInfo(const ARequestFilter: string = ''): Boolean;
    function GetBlockChainInfoDS(const ARequestFilter: string = ''): string;
  end;


const
  TSMGeral_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMGeral_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSMFiles_AddImagemLista: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'arq'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'stm'; Direction: 1; DBXType: 33; TypeName: 'TStream')
  );

  TSMFiles_GetListaImagens: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TDictionary<System.string,System.Classes.TStream>')
  );

  TSMFiles_GetListaImagens_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSMFiles_GetFile: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'arq'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Size'; Direction: 2; DBXType: 13; TypeName: 'Cardinal'),
    (Name: ''; Direction: 4; DBXType: 33; TypeName: 'TStream')
  );

  TSMFiles_GetFile_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'arq'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'Size'; Direction: 2; DBXType: 13; TypeName: 'Cardinal'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSMFiles_GetFileGeral: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'arq'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSMFiles_SetFile: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'arq'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'arquivo'; Direction: 1; DBXType: 33; TypeName: 'TStream'),
    (Name: ''; Direction: 4; DBXType: 18; TypeName: 'Int64')
  );

  TSMBlockChain_DSServerModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TSMBlockChain_GetBlockChainInfo: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSMBlockChain_GetBlockChainInfoDS: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

implementation

function TSMGeralClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TSMGeral.EchoString';
    FEchoStringCommand.Prepare(TSMGeral_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TSMGeralClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TSMGeral.ReverseString';
    FReverseStringCommand.Prepare(TSMGeral_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

constructor TSMGeralClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSMGeralClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSMGeralClient.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  inherited;
end;

procedure TSMFilesClient.AddImagemLista(arq: string; stm: TStream);
begin
  if FAddImagemListaCommand = nil then
  begin
    FAddImagemListaCommand := FConnection.CreateCommand;
    FAddImagemListaCommand.RequestType := 'POST';
    FAddImagemListaCommand.Text := 'TSMFiles."AddImagemLista"';
    FAddImagemListaCommand.Prepare(TSMFiles_AddImagemLista);
  end;
  FAddImagemListaCommand.Parameters[0].Value.SetWideString(arq);
  FAddImagemListaCommand.Parameters[1].Value.SetStream(stm, FInstanceOwner);
  FAddImagemListaCommand.Execute;
end;

function TSMFilesClient.GetListaImagens(const ARequestFilter: string): TDictionary<System.string,System.Classes.TStream>;
begin
  if FGetListaImagensCommand = nil then
  begin
    FGetListaImagensCommand := FConnection.CreateCommand;
    FGetListaImagensCommand.RequestType := 'GET';
    FGetListaImagensCommand.Text := 'TSMFiles.GetListaImagens';
    FGetListaImagensCommand.Prepare(TSMFiles_GetListaImagens);
  end;
  FGetListaImagensCommand.Execute(ARequestFilter);
  if not FGetListaImagensCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetListaImagensCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TDictionary<System.string,System.Classes.TStream>(FUnMarshal.UnMarshal(FGetListaImagensCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetListaImagensCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMFilesClient.GetFile(arq: string; out Size: Cardinal; const ARequestFilter: string): TStream;
begin
  if FGetFileCommand = nil then
  begin
    FGetFileCommand := FConnection.CreateCommand;
    FGetFileCommand.RequestType := 'GET';
    FGetFileCommand.Text := 'TSMFiles.GetFile';
    FGetFileCommand.Prepare(TSMFiles_GetFile);
  end;
  FGetFileCommand.Parameters[0].Value.SetWideString(arq);
  FGetFileCommand.Execute(ARequestFilter);
  Size := FGetFileCommand.Parameters[1].Value.GetInt64;
  Result := FGetFileCommand.Parameters[2].Value.GetStream(FInstanceOwner);
end;

function TSMFilesClient.GetFile_Cache(arq: string; out Size: Cardinal; const ARequestFilter: string): IDSRestCachedStream;
begin
  if FGetFileCommand_Cache = nil then
  begin
    FGetFileCommand_Cache := FConnection.CreateCommand;
    FGetFileCommand_Cache.RequestType := 'GET';
    FGetFileCommand_Cache.Text := 'TSMFiles.GetFile';
    FGetFileCommand_Cache.Prepare(TSMFiles_GetFile_Cache);
  end;
  FGetFileCommand_Cache.Parameters[0].Value.SetWideString(arq);
  FGetFileCommand_Cache.ExecuteCache(ARequestFilter);
  Size := FGetFileCommand_Cache.Parameters[1].Value.GetInt64;
  Result := TDSRestCachedStream.Create(FGetFileCommand_Cache.Parameters[2].Value.GetString);
end;

function TSMFilesClient.GetFileGeral(arq: string; const ARequestFilter: string): Boolean;
begin
  if FGetFileGeralCommand = nil then
  begin
    FGetFileGeralCommand := FConnection.CreateCommand;
    FGetFileGeralCommand.RequestType := 'GET';
    FGetFileGeralCommand.Text := 'TSMFiles.GetFileGeral';
    FGetFileGeralCommand.Prepare(TSMFiles_GetFileGeral);
  end;
  FGetFileGeralCommand.Parameters[0].Value.SetWideString(arq);
  FGetFileGeralCommand.Execute(ARequestFilter);
  Result := FGetFileGeralCommand.Parameters[1].Value.GetBoolean;
end;

function TSMFilesClient.SetFile(arq: string; arquivo: TStream; const ARequestFilter: string): Int64;
begin
  if FSetFileCommand = nil then
  begin
    FSetFileCommand := FConnection.CreateCommand;
    FSetFileCommand.RequestType := 'POST';
    FSetFileCommand.Text := 'TSMFiles."SetFile"';
    FSetFileCommand.Prepare(TSMFiles_SetFile);
  end;
  FSetFileCommand.Parameters[0].Value.SetWideString(arq);
  FSetFileCommand.Parameters[1].Value.SetStream(arquivo, FInstanceOwner);
  FSetFileCommand.Execute(ARequestFilter);
  Result := FSetFileCommand.Parameters[2].Value.GetInt64;
end;

constructor TSMFilesClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSMFilesClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSMFilesClient.Destroy;
begin
  FAddImagemListaCommand.DisposeOf;
  FGetListaImagensCommand.DisposeOf;
  FGetListaImagensCommand_Cache.DisposeOf;
  FGetFileCommand.DisposeOf;
  FGetFileCommand_Cache.DisposeOf;
  FGetFileGeralCommand.DisposeOf;
  FSetFileCommand.DisposeOf;
  inherited;
end;

procedure TSMBlockChainClient.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FConnection.CreateCommand;
    FDSServerModuleCreateCommand.RequestType := 'POST';
    FDSServerModuleCreateCommand.Text := 'TSMBlockChain."DSServerModuleCreate"';
    FDSServerModuleCreateCommand.Prepare(TSMBlockChain_DSServerModuleCreate);
  end;
  if not Assigned(Sender) then
    FDSServerModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDSServerModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleCreateCommand.Execute;
end;

function TSMBlockChainClient.GetBlockChainInfo(const ARequestFilter: string): Boolean;
begin
  if FGetBlockChainInfoCommand = nil then
  begin
    FGetBlockChainInfoCommand := FConnection.CreateCommand;
    FGetBlockChainInfoCommand.RequestType := 'GET';
    FGetBlockChainInfoCommand.Text := 'TSMBlockChain.GetBlockChainInfo';
    FGetBlockChainInfoCommand.Prepare(TSMBlockChain_GetBlockChainInfo);
  end;
  FGetBlockChainInfoCommand.Execute(ARequestFilter);
  Result := FGetBlockChainInfoCommand.Parameters[0].Value.GetBoolean;
end;

function TSMBlockChainClient.GetBlockChainInfoDS(const ARequestFilter: string): string;
begin
  if FGetBlockChainInfoDSCommand = nil then
  begin
    FGetBlockChainInfoDSCommand := FConnection.CreateCommand;
    FGetBlockChainInfoDSCommand.RequestType := 'GET';
    FGetBlockChainInfoDSCommand.Text := 'TSMBlockChain.GetBlockChainInfoDS';
    FGetBlockChainInfoDSCommand.Prepare(TSMBlockChain_GetBlockChainInfoDS);
  end;
  FGetBlockChainInfoDSCommand.Execute(ARequestFilter);
  Result := FGetBlockChainInfoDSCommand.Parameters[0].Value.GetWideString;
end;

constructor TSMBlockChainClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSMBlockChainClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSMBlockChainClient.Destroy;
begin
  FDSServerModuleCreateCommand.DisposeOf;
  FGetBlockChainInfoCommand.DisposeOf;
  FGetBlockChainInfoDSCommand.DisposeOf;
  inherited;
end;

end.

