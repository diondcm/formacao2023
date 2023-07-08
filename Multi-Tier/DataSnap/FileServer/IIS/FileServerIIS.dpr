library FileServerIIS;

{$R *.dres}

uses
  Winapi.ActiveX,
  System.Win.ComObj,
  Web.WebBroker,
  Web.Win.ISAPIApp,
  Web.Win.ISAPIThreadPool,
  Data.DBXCommon,
  Datasnap.DSSession,
  Classe.Produtos in '..\Server\Classe.Produtos.pas',
  Data.BlockChain in '..\Server\Data.BlockChain.pas' {dmBlockChain: TDataModule},
  Data.Conexao in '..\Server\Data.Conexao.pas' {dmdConexao: TDataModule},
  Server.Methods.BlockChain in '..\Server\Server.Methods.BlockChain.pas' {SMBlockChain: TDSServerModule},
  Server.Methods.Files in '..\Server\Server.Methods.Files.pas' {SMFiles: TDSServerModule},
  Server.Methods.Geral in '..\Server\Server.Methods.Geral.pas' {SMGeral: TDSServerModule},
  Server.Methods.Produto in '..\Server\Server.Methods.Produto.pas' {SMProduto: TDSServerModule},
  WebModuleUnit in '..\Server\WebModuleUnit.pas' {WebModule1: TWebModule};

{$R *.res}

exports
  GetExtensionVersion,
  HttpExtensionProc,
  TerminateExtension;

procedure TerminateThreads;
begin
  TDSSessionManager.Instance.Free;
  Data.DBXCommon.TDBXScheduler.Instance.Free;
end;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  TISAPIApplication(Application).OnTerminate := TerminateThreads;
  Application.CreateForm(TdmdConexao, dmdConexao);
  Application.Run;
end.
