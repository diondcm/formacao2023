unit Server.Methods.Files;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, System.Generics.Collections, System.NetEncoding,
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, System.SyncObjs, Data.DBXPlatform;

type
  TSMFiles = class(TDSServerModule)
  private
    { Private declarations }
  class var
    FCriticalSection: TCriticalSection;
    FListaImagens: TObjectDictionary<string, TStream>;
  public
    class procedure AddImagemLista(arq: string; stm: TStream);
    class function GetListaImagens: TDictionary<string, TStream>;
    class constructor Create;
    class destructor Destroy;
  public
    function GetFile(arq: string; out Size: Cardinal) : TStream;
    function GetFileGeral(arq: string): Boolean;
    function SetFile(arq: string; arquivo: TStream): Int64;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TSMFiles }

class procedure TSMFiles.AddImagemLista(arq: string; stm: TStream);
begin
  FCriticalSection.Enter;
  try
    GetListaImagens.Add(arq, stm);
  finally
    FCriticalSection.Leave;
  end;
end;

class constructor TSMFiles.Create;
begin
  FCriticalSection := TCriticalSection.Create;
end;

class destructor TSMFiles.Destroy;
begin
  FListaImagens.Free;
  FCriticalSection.Free;
end;

function TSMFiles.GetFile(arq: string; out Size: Cardinal): TStream;
begin
  Result := nil;
  if arq = 'LOGO_CLIENTE' then
  begin
    if not GetListaImagens.ContainsKey(arq) then
    begin
      var stm: TStringStream := TStringStream.Create;
      (stm as TStringStream).LoadFromFile('FundoAqua.png');
//      GetListaImagens.Add(arq, stm);
      AddImagemLista(arq, stm);
    end;

    Result := TStringStream.Create;
    Result.CopyFrom(GetListaImagens[arq]);
    Size := Result.Size;
  end else begin
    Size := 0;
  end;
end;

function TSMFiles.GetFileGeral(arq: string): Boolean;
begin
  Result := True;

  if arq = 'LOGO_BMP' then
  begin
    if not GetListaImagens.ContainsKey(arq) then
    begin
      var stm: TStringStream := TStringStream.Create;
      (stm as TStringStream).LoadFromFile('logo_cliente.bmp');
    //      GetListaImagens.Add(arq, stm);
      AddImagemLista(arq, stm);
    end;

    GetInvocationMetadata().ResponseContentType := 'image/bmp'; // image/png';
    GetInvocationMetadata().ResponseContent := (GetListaImagens[arq] as TStringStream).DataString;
  end;

 if arq = 'EXE_SERVER' then
  begin
    var stm: TStringStream := TStringStream.Create;
    stm.LoadFromFile('server.zip');
    GetInvocationMetadata.ResponseContentType := 'application/zip';
    GetInvocationMetadata.ResponseContent := stm.DataString;
    stm.Free;
  end;

  if arq = 'EXE_SERVER_BASE64' then
  begin
    var stm: TStringStream := TStringStream.Create;
    stm.LoadFromFile('server.zip');
    GetInvocationMetadata.ResponseContentType := 'application/json';
    GetInvocationMetadata.ResponseContent := TNetEncoding.Base64String.Encode(stm.DataString);
    stm.Free;
  end;
end;

class function TSMFiles.GetListaImagens: TDictionary<string, TStream>;
begin
  if not Assigned(FListaImagens) then
  begin
    FListaImagens := TObjectDictionary<string, TStream>.Create([doOwnsValues]);
  end;

  Result := FListaImagens;
end;

function TSMFiles.SetFile(arq: string; arquivo: TStream): Int64;
begin
  Result := 0;
  if arq = 'LOGO_CLIENTE' then
  begin
    var strStm: TStringStream := TStringStream.Create;
    strStm.LoadFromStream(arquivo);
    Result := strStm.Size;
    if Result > 0 then
    begin
      strStm.SaveToFile('Logo_' + IntToStr(TThread.GetTickCount) + '.png');
    end;

    strStm.Free;
  end;
end;

end.

