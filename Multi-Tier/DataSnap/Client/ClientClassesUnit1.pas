//
// Created by the DataSnap proxy generator.
// 17/06/2023 16:36:06
//

unit ClientClassesUnit1;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Classe.Pessoa, Data.DBXJSONReflect;

type

  IDSRestCachedTPessoa = interface;

  TServerMethods1Client = class(TDSAdminRestClient)
  private
    FDSServerModuleCreateCommand: TDSRestCommand;
    FDSServerModuleDestroyCommand: TDSRestCommand;
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
    FGetPessoaNativoCommand: TDSRestCommand;
    FGetPessoaNativoCommand_Cache: TDSRestCommand;
    FSetPessoaNativoCommand: TDSRestCommand;
    FGetPessoaNaoNativoCommand: TDSRestCommand;
    FSetPessoaNaoNativoCommand: TDSRestCommand;
    FGetThreadIDCommand: TDSRestCommand;
    FGetQtdThreadsAtivasCommand: TDSRestCommand;
    FGetQtdMaxThreadsCommand: TDSRestCommand;
    FGetMetodoDemoradoCommand: TDSRestCommand;
    FGetLogCommand: TDSRestCommand;
    FGetPessoasDBCommand: TDSRestCommand;
    FSetPessoasDBCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
    function GetPessoaNativo(const ARequestFilter: string = ''): TPessoa;
    function GetPessoaNativo_Cache(const ARequestFilter: string = ''): IDSRestCachedTPessoa;
    function SetPessoaNativo(pes: TPessoa; const ARequestFilter: string = ''): Boolean;
    function GetPessoaNaoNativo(const ARequestFilter: string = ''): string;
    function SetPessoaNaoNativo(pessoa: string; const ARequestFilter: string = ''): Boolean;
    function GetThreadID(const ARequestFilter: string = ''): Cardinal;
    function GetQtdThreadsAtivas(const ARequestFilter: string = ''): Integer;
    function GetQtdMaxThreads(const ARequestFilter: string = ''): Integer;
    function GetMetodoDemorado(tempoemMS: Integer; const ARequestFilter: string = ''): Boolean;
    function GetLog(const ARequestFilter: string = ''): string;
    function GetPessoasDB(const ARequestFilter: string = ''): string;
    function SetPessoasDB(dbPessoas: string; const ARequestFilter: string = ''): Boolean;
  end;

  IDSRestCachedTPessoa = interface(IDSRestCachedObject<TPessoa>)
  end;

  TDSRestCachedTPessoa = class(TDSRestCachedObject<TPessoa>, IDSRestCachedTPessoa, IDSRestCachedCommand)
  end;

const
  TServerMethods1_DSServerModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TServerMethods1_DSServerModuleDestroy: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TServerMethods1_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_GetPessoaNativo: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TPessoa')
  );

  TServerMethods1_GetPessoaNativo_Cache: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethods1_SetPessoaNativo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pes'; Direction: 1; DBXType: 37; TypeName: 'TPessoa'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods1_GetPessoaNaoNativo: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_SetPessoaNaoNativo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pessoa'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods1_GetThreadID: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 13; TypeName: 'Cardinal')
  );

  TServerMethods1_GetQtdThreadsAtivas: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods1_GetQtdMaxThreads: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TServerMethods1_GetMetodoDemorado: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'tempoemMS'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TServerMethods1_GetLog: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_GetPessoasDB: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TServerMethods1_SetPessoasDB: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'dbPessoas'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

implementation

procedure TServerMethods1Client.DSServerModuleCreate(Sender: TObject);
begin
  if FDSServerModuleCreateCommand = nil then
  begin
    FDSServerModuleCreateCommand := FConnection.CreateCommand;
    FDSServerModuleCreateCommand.RequestType := 'POST';
    FDSServerModuleCreateCommand.Text := 'TServerMethods1."DSServerModuleCreate"';
    FDSServerModuleCreateCommand.Prepare(TServerMethods1_DSServerModuleCreate);
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

procedure TServerMethods1Client.DSServerModuleDestroy(Sender: TObject);
begin
  if FDSServerModuleDestroyCommand = nil then
  begin
    FDSServerModuleDestroyCommand := FConnection.CreateCommand;
    FDSServerModuleDestroyCommand.RequestType := 'POST';
    FDSServerModuleDestroyCommand.Text := 'TServerMethods1."DSServerModuleDestroy"';
    FDSServerModuleDestroyCommand.Prepare(TServerMethods1_DSServerModuleDestroy);
  end;
  if not Assigned(Sender) then
    FDSServerModuleDestroyCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDSServerModuleDestroyCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDSServerModuleDestroyCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDSServerModuleDestroyCommand.Execute;
end;

function TServerMethods1Client.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare(TServerMethods1_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare(TServerMethods1_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.GetPessoaNativo(const ARequestFilter: string): TPessoa;
begin
  if FGetPessoaNativoCommand = nil then
  begin
    FGetPessoaNativoCommand := FConnection.CreateCommand;
    FGetPessoaNativoCommand.RequestType := 'GET';
    FGetPessoaNativoCommand.Text := 'TServerMethods1.GetPessoaNativo';
    FGetPessoaNativoCommand.Prepare(TServerMethods1_GetPessoaNativo);
  end;
  FGetPessoaNativoCommand.Execute(ARequestFilter);
  if not FGetPessoaNativoCommand.Parameters[0].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetPessoaNativoCommand.Parameters[0].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TPessoa(FUnMarshal.UnMarshal(FGetPessoaNativoCommand.Parameters[0].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetPessoaNativoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethods1Client.GetPessoaNativo_Cache(const ARequestFilter: string): IDSRestCachedTPessoa;
begin
  if FGetPessoaNativoCommand_Cache = nil then
  begin
    FGetPessoaNativoCommand_Cache := FConnection.CreateCommand;
    FGetPessoaNativoCommand_Cache.RequestType := 'GET';
    FGetPessoaNativoCommand_Cache.Text := 'TServerMethods1.GetPessoaNativo';
    FGetPessoaNativoCommand_Cache.Prepare(TServerMethods1_GetPessoaNativo_Cache);
  end;
  FGetPessoaNativoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTPessoa.Create(FGetPessoaNativoCommand_Cache.Parameters[0].Value.GetString);
end;

function TServerMethods1Client.SetPessoaNativo(pes: TPessoa; const ARequestFilter: string): Boolean;
begin
  if FSetPessoaNativoCommand = nil then
  begin
    FSetPessoaNativoCommand := FConnection.CreateCommand;
    FSetPessoaNativoCommand.RequestType := 'POST';
    FSetPessoaNativoCommand.Text := 'TServerMethods1."SetPessoaNativo"';
    FSetPessoaNativoCommand.Prepare(TServerMethods1_SetPessoaNativo);
  end;
  if not Assigned(pes) then
    FSetPessoaNativoCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FSetPessoaNativoCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FSetPessoaNativoCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(pes), True);
      if FInstanceOwner then
        pes.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FSetPessoaNativoCommand.Execute(ARequestFilter);
  Result := FSetPessoaNativoCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.GetPessoaNaoNativo(const ARequestFilter: string): string;
begin
  if FGetPessoaNaoNativoCommand = nil then
  begin
    FGetPessoaNaoNativoCommand := FConnection.CreateCommand;
    FGetPessoaNaoNativoCommand.RequestType := 'GET';
    FGetPessoaNaoNativoCommand.Text := 'TServerMethods1.GetPessoaNaoNativo';
    FGetPessoaNaoNativoCommand.Prepare(TServerMethods1_GetPessoaNaoNativo);
  end;
  FGetPessoaNaoNativoCommand.Execute(ARequestFilter);
  Result := FGetPessoaNaoNativoCommand.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.SetPessoaNaoNativo(pessoa: string; const ARequestFilter: string): Boolean;
begin
  if FSetPessoaNaoNativoCommand = nil then
  begin
    FSetPessoaNaoNativoCommand := FConnection.CreateCommand;
    FSetPessoaNaoNativoCommand.RequestType := 'GET';
    FSetPessoaNaoNativoCommand.Text := 'TServerMethods1.SetPessoaNaoNativo';
    FSetPessoaNaoNativoCommand.Prepare(TServerMethods1_SetPessoaNaoNativo);
  end;
  FSetPessoaNaoNativoCommand.Parameters[0].Value.SetWideString(pessoa);
  FSetPessoaNaoNativoCommand.Execute(ARequestFilter);
  Result := FSetPessoaNaoNativoCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.GetThreadID(const ARequestFilter: string): Cardinal;
begin
  if FGetThreadIDCommand = nil then
  begin
    FGetThreadIDCommand := FConnection.CreateCommand;
    FGetThreadIDCommand.RequestType := 'GET';
    FGetThreadIDCommand.Text := 'TServerMethods1.GetThreadID';
    FGetThreadIDCommand.Prepare(TServerMethods1_GetThreadID);
  end;
  FGetThreadIDCommand.Execute(ARequestFilter);
  Result := FGetThreadIDCommand.Parameters[0].Value.GetInt64;
end;

function TServerMethods1Client.GetQtdThreadsAtivas(const ARequestFilter: string): Integer;
begin
  if FGetQtdThreadsAtivasCommand = nil then
  begin
    FGetQtdThreadsAtivasCommand := FConnection.CreateCommand;
    FGetQtdThreadsAtivasCommand.RequestType := 'GET';
    FGetQtdThreadsAtivasCommand.Text := 'TServerMethods1.GetQtdThreadsAtivas';
    FGetQtdThreadsAtivasCommand.Prepare(TServerMethods1_GetQtdThreadsAtivas);
  end;
  FGetQtdThreadsAtivasCommand.Execute(ARequestFilter);
  Result := FGetQtdThreadsAtivasCommand.Parameters[0].Value.GetInt32;
end;

function TServerMethods1Client.GetQtdMaxThreads(const ARequestFilter: string): Integer;
begin
  if FGetQtdMaxThreadsCommand = nil then
  begin
    FGetQtdMaxThreadsCommand := FConnection.CreateCommand;
    FGetQtdMaxThreadsCommand.RequestType := 'GET';
    FGetQtdMaxThreadsCommand.Text := 'TServerMethods1.GetQtdMaxThreads';
    FGetQtdMaxThreadsCommand.Prepare(TServerMethods1_GetQtdMaxThreads);
  end;
  FGetQtdMaxThreadsCommand.Execute(ARequestFilter);
  Result := FGetQtdMaxThreadsCommand.Parameters[0].Value.GetInt32;
end;

function TServerMethods1Client.GetMetodoDemorado(tempoemMS: Integer; const ARequestFilter: string): Boolean;
begin
  if FGetMetodoDemoradoCommand = nil then
  begin
    FGetMetodoDemoradoCommand := FConnection.CreateCommand;
    FGetMetodoDemoradoCommand.RequestType := 'GET';
    FGetMetodoDemoradoCommand.Text := 'TServerMethods1.GetMetodoDemorado';
    FGetMetodoDemoradoCommand.Prepare(TServerMethods1_GetMetodoDemorado);
  end;
  FGetMetodoDemoradoCommand.Parameters[0].Value.SetInt32(tempoemMS);
  FGetMetodoDemoradoCommand.Execute(ARequestFilter);
  Result := FGetMetodoDemoradoCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.GetLog(const ARequestFilter: string): string;
begin
  if FGetLogCommand = nil then
  begin
    FGetLogCommand := FConnection.CreateCommand;
    FGetLogCommand.RequestType := 'GET';
    FGetLogCommand.Text := 'TServerMethods1.GetLog';
    FGetLogCommand.Prepare(TServerMethods1_GetLog);
  end;
  FGetLogCommand.Execute(ARequestFilter);
  Result := FGetLogCommand.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.GetPessoasDB(const ARequestFilter: string): string;
begin
  if FGetPessoasDBCommand = nil then
  begin
    FGetPessoasDBCommand := FConnection.CreateCommand;
    FGetPessoasDBCommand.RequestType := 'GET';
    FGetPessoasDBCommand.Text := 'TServerMethods1.GetPessoasDB';
    FGetPessoasDBCommand.Prepare(TServerMethods1_GetPessoasDB);
  end;
  FGetPessoasDBCommand.Execute(ARequestFilter);
  Result := FGetPessoasDBCommand.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.SetPessoasDB(dbPessoas: string; const ARequestFilter: string): Boolean;
begin
  if FSetPessoasDBCommand = nil then
  begin
    FSetPessoasDBCommand := FConnection.CreateCommand;
    FSetPessoasDBCommand.RequestType := 'GET';
    FSetPessoasDBCommand.Text := 'TServerMethods1.SetPessoasDB';
    FSetPessoasDBCommand.Prepare(TServerMethods1_SetPessoasDB);
  end;
  FSetPessoasDBCommand.Parameters[0].Value.SetWideString(dbPessoas);
  FSetPessoasDBCommand.Execute(ARequestFilter);
  Result := FSetPessoasDBCommand.Parameters[1].Value.GetBoolean;
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethods1Client.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FDSServerModuleCreateCommand.DisposeOf;
  FDSServerModuleDestroyCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FGetPessoaNativoCommand.DisposeOf;
  FGetPessoaNativoCommand_Cache.DisposeOf;
  FSetPessoaNativoCommand.DisposeOf;
  FGetPessoaNaoNativoCommand.DisposeOf;
  FSetPessoaNaoNativoCommand.DisposeOf;
  FGetThreadIDCommand.DisposeOf;
  FGetQtdThreadsAtivasCommand.DisposeOf;
  FGetQtdMaxThreadsCommand.DisposeOf;
  FGetMetodoDemoradoCommand.DisposeOf;
  FGetLogCommand.DisposeOf;
  FGetPessoasDBCommand.DisposeOf;
  FSetPessoasDBCommand.DisposeOf;
  inherited;
end;

end.

