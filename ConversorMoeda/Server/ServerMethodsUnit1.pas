unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth;

type
  TServerMethods1 = class(TDSServerModule)
  private
    { Private declarations }
  public
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function ConverteRealParaDolar(ValorEmReal: string): string;
    function ConverteDolarParaReal(ValorEmDOlar: string): string;
  end;

implementation


{$R *.dfm}


uses System.StrUtils, Classe.Conversor.Moeda;

function TServerMethods1.ConverteDolarParaReal(ValorEmDOlar: string): string;
begin
  Result := TConversorMoeda.DolarParaReal(ValorEmDolar);
end;

function TServerMethods1.ConverteRealParaDolar(ValorEmReal: string): string;
begin
  Result := TConversorMoeda.RealParaDolar(ValorEmReal);
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

