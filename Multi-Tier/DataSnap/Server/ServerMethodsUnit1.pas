unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json, REST.Json,
    DataSnap.DSProviderDataModuleAdapter, System.DateUtils, System.SyncObjs,
    Datasnap.DSServer, Datasnap.DSAuth, Classe.Pessoa, Classe.Regra.Pessoa,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageJSON,
  FireDAC.Stan.StorageBin;

type
  TPessoaArray = TArray<TPessoa>;

  TServerMethods1 = class(TDSServerModule)
    memPessoa: TFDMemTable;
    memPessoaID: TIntegerField;
    memPessoaNome: TStringField;
    memPessoaDataNascimento: TDateTimeField;
    memPessoaRenda: TCurrencyField;
    memPessoaAtivo: TBooleanField;
    procedure DSServerModuleCreate(Sender: TObject);
    procedure DSServerModuleDestroy(Sender: TObject);
  private
    class var
      FQtdThreadsAtivas: Integer;
      FQtdMaxThreads: Integer;
      FLogStr: string;
      FCriticalSection: TCriticalSection;
    class procedure GravaLog(texto: string);
  public
    class constructor Create;
    class destructor Destroy;
    const
      DB_PESSOA = 'DB-Pessoa.json';
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetPessoaNativo: TPessoa;
    function SetPessoaNativo(pes: TPessoa): Boolean;
    function GetPessoaNaoNativo: string;
    function SetPessoaNaoNativo(pessoa: string): Boolean;

    function GetListaPessoaArray(Count: Integer): TArray<TPessoa>;
    function GetListaPessoaArray2(Count: Integer): TPessoaArray;

    function GetListaPessoa(Count: Integer): TListaPessoa;
    function GetListaPessoaGeral(Count: Integer): string;
    function GetListaPessoaGeral2(Count: Integer): string;

    {Threads no server}
    function GetThreadID: Cardinal;
    function GetQtdThreadsAtivas: Integer;
    function GetQtdMaxThreads: Integer;

    function GetMetodoDemorado(tempoemMS: Integer): Boolean;
    function GetLog: string;

    { DB }
    function GetPessoasDB: string;
    function SetPessoasDB(dbPessoas: string): Boolean;

    { Hash }
    function AutenticaUsuario(senha: string): string;
  end;

implementation


{$R *.dfm}


uses System.StrUtils, Winapi.Windows, System.Hash, Data.DBXPlatform;

function TServerMethods1.AutenticaUsuario(senha: string): string;
const
  SENHA_ESTATICA = '�jrlt345' + 'Aula 2020';
begin
  // Buscar a informa��o de um banco de dados poderia validar numa chave de registro
//  if senha = SENHA_ESTATICA then

  if CompareStr(senha, THashSHA2.GetHashString(SENHA_ESTATICA)) = 0 then
  begin
    Result := 'OK';
  end else begin
    Result := 'Erro: senha inv�lida';
  end;
end;

class constructor TServerMethods1.Create;
begin
  FCriticalSection := TCriticalSection.Create;
end;

class destructor TServerMethods1.Destroy;
begin
  FCriticalSection.Free;
end;

procedure TServerMethods1.DSServerModuleCreate(Sender: TObject);
begin
  InterlockedIncrement(FQtdThreadsAtivas); // � Thread Safe
  InterlockedIncrement(FQtdMaxThreads);

  GravaLog('Cria Server Methods');

// N�o � thread safe:  FQtdThreadsAtivas := FQtdThreadsAtivas + 1;
//  FQtdMaxThreads := FQtdMaxThreads + 1;
end;

procedure TServerMethods1.DSServerModuleDestroy(Sender: TObject);
begin
//  FQtdThreadsAtivas := FQtdThreadsAtivas - 1;
  InterlockedDecrement(FQtdThreadsAtivas);
  GravaLog('Free Server Methods');
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.GetListaPessoa(Count: Integer): TListaPessoa;
begin
  Result := TListaPessoa.Create(True);
  Result.AddRange(GetListaPessoaArray(Count));// Para liberar colocar como rei de dentro da lista
end;

function TServerMethods1.GetListaPessoaArray(Count: Integer): TArray<TPessoa>;
begin
  /// N�o pode ter retorno diarrei a gente tem
  /// que sintetizar em outra classe para poder retornar

  if Count = 0 then
   Count := 10;

  for var i: Integer := 0 to Count -1 do
  begin
    var pes: TPessoa := TPessoa.Create;
    pes.ID := GetTickCount;
    pes.Nome := 'Teste ' + IntToStr(pes.ID);
    pes.DataNascimento := Now - Random(10000);
    pes.Renda := Random(10000);

    SetLength(Result, Length(Result) + 1);
    Result[Length(Result) - 1] := pes;
  end;
end;

function TServerMethods1.GetListaPessoaArray2(Count: Integer): TPessoaArray;
begin
  Result := GetListaPessoaArray(Count);
end;

function TServerMethods1.GetListaPessoaGeral(Count: Integer): string;
begin
  var lstPes: TListaPessoa := GetListaPessoa(Count);
  Result := TJson.ObjectToJsonString(lstPes);
  lstPes.Free;
end;

function TServerMethods1.GetListaPessoaGeral2(Count: Integer): string;
begin
  // Data.DBXPlatform
  GetInvocationMetadata().ResponseContentType := 'application/json';
  GetInvocationMetadata().ResponseContent := GetListaPessoaGeral(Count);
end;

function TServerMethods1.GetLog: string;
begin
  Result := FLogStr;
end;

function TServerMethods1.GetMetodoDemorado(tempoemMS: Integer): Boolean;
begin
  GravaLog('INI: M�todo demorado');
  Sleep(tempoemMS);
  Result := True;
  GravaLog('FIM: M�todo demorado');
end;

function TServerMethods1.GetPessoaNaoNativo: string;
begin
  var pes: TPessoa := TPessoa.Create;

  pes.ID := 32423;
  pes.Nome := 'Server Pessoa N�o Nativa';
  pes.DataNascimento := IncYear(Now, -22);
  pes.Renda := 809.4;
  pes.Ativo := False;

  Result := TJson.ObjectToJsonString(pes);

  pes.Free;
end;

function TServerMethods1.GetPessoaNativo: TPessoa;
begin
  Result := TPessoa.Create;
  Result.ID := 32423;
  Result.Nome := 'Server Pessoa';
  Result.DataNascimento := IncYear(Now, -34);
  Result.Renda := 500.7;
  Result.Ativo := True;
end;

function TServerMethods1.GetPessoasDB: string;
begin
  if FileExists(DB_PESSOA) then
  begin
    memPessoa.LoadFromFile(DB_PESSOA, sfJSON);
  end;

  var strStm: TStringStream := TStringStream.Create;
  memPessoa.SaveToStream(strStm, sfJSON);
  Result := strStm.DataString;
  strStm.Free;
end;

function TServerMethods1.GetQtdMaxThreads: Integer;
begin
  Result := FQtdMaxThreads;
  GravaLog('Max Threads');
end;

function TServerMethods1.GetQtdThreadsAtivas: Integer;
begin
  Result := FQtdThreadsAtivas;
end;

function TServerMethods1.GetThreadID: Cardinal;
begin
  Result := GetCurrentThreadId;
end;

class procedure TServerMethods1.GravaLog(texto: string);
begin
  FCriticalSection.Acquire;
  try
    FLogStr := FLogStr + TimeToStr(Now) + ' - ' + IntToStr(GetCurrentThreadId) + ' - ' + texto + sLineBreak;
  finally
    FCriticalSection.Leave;
  end;

//  TThread.Synchronize(nil,
//    procedure
//    begin
//      FLogStr := FLogStr + TimeToStr(Now) + ' - ' + IntToStr(GetCurrentThreadId) + ' - ' + texto + sLineBreak;
//    end);
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.SetPessoaNaoNativo(pessoa: string): Boolean;
begin
  var pes: TPessoa := TJson.JsonToObject<TPessoa>(pessoa);

  var jsonObj: string := TJson.ObjectToJsonString(pes);

  // Op��o 1: Classe pessoa herdada
  var pesRegra1: TPessoaRegra := TJson.JsonToObject<TPessoaRegra>(pessoa);
  var validacaoPessoa: string := pesRegra1.ValidaCamposObrigatorios;
  if validacaoPessoa <> '' then
  begin
    // Evitar raise no server
    raise Exception.Create('Erro ao salvar pessoa: ' + validacaoPessoa);
  end;

  // Op��o 2: Com wrapper
  var pesRegra2: TPessoaRegra2 := TPessoaRegra2.Create;
  pesRegra2.Pessoa := TJson.JsonToObject<TPessoa>(pessoa);

  var validacaoPessoa2: string := pesRegra2.ValidaCamposObrigatorios();
  if validacaoPessoa2 <> '' then
  begin
    // Evitar raise no server
    raise Exception.Create('Erro ao salvar pessoa: ' + validacaoPessoa);
  end;

  var stl: TStringList := TStringList.Create;
  stl.Add(jsonObj);
  stl.SaveToFile('log-pessoa.json');
  stl.Free;

  Result := True;
end;

function TServerMethods1.SetPessoaNativo(pes: TPessoa): Boolean;
begin
  var jsonObj: string := TJson.ObjectToJsonString(pes);

  var stl: TStringList := TStringList.Create;
  stl.Add(jsonObj);
  stl.SaveToFile('log-pessoa.json');
  stl.Free;

  Result := True;
end;

function TServerMethods1.SetPessoasDB(dbPessoas: string): Boolean;
begin
  var strStm: TStringStream := TStringStream.Create(dbPessoas);
  memPessoa.LoadFromStream(strStm, sfJSON);
  // merge manual das infos do client e server para validar a regra de neg�cio

  // N�o deve ser enviadas grades quantidades de dados nos m�todos GET
  memPessoa.SaveToFile(DB_PESSOA, sfJSON);
  memPessoa.Close;
  strStm.Free;

  Result := True;
end;

end.
