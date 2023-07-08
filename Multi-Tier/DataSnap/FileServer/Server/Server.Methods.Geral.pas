unit Server.Methods.Geral;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, System.DateUtils;

type
  TSMGeral = class(TDSServerModule)
    procedure DSServerModuleCreate(Sender: TObject);
  private
    FTickAtual: UInt64;
    { Private declarations }
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetVersaoServer: UInt64;
    function GetTickAtual: UInt64;

    function GetDataAtual: TDateTime;
    function GetDataAtualUnix: UInt64;
    function GetDataatualISO8601: string;
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

procedure TSMGeral.DSServerModuleCreate(Sender: TObject);
begin
  FTickAtual := TThread.GetTickCount64;
end;

function TSMGeral.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TSMGeral.GetDataAtual: TDateTime;
begin
  Result := Now;
end;

function TSMGeral.GetDataatualISO8601: string;
begin
  Result := DateToISO8601(Now);
end;

function TSMGeral.GetDataAtualUnix: UInt64;
begin
  Result := DateTimeToUnix(Now);
end;

function TSMGeral.GetTickAtual: UInt64;
begin
  Result := TThread.GetTickCount64;
end;

function TSMGeral.GetVersaoServer: UInt64;
begin
  Result := FTickAtual;
end;

function TSMGeral.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

