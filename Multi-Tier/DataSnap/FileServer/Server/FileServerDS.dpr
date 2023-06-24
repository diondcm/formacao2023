program FileServerDS;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Form.Server.Principal in 'Form.Server.Principal.pas' {frmServerPincipal},
  Server.Methods.Geral in 'Server.Methods.Geral.pas' {SMGeral: TDSServerModule},
  WebModuleUnit in 'WebModuleUnit.pas' {WebModule1: TWebModule},
  Server.Methods.Files in 'Server.Methods.Files.pas' {SMFiles: TDSServerModule},
  Server.Methods.BlockChain in 'Server.Methods.BlockChain.pas' {SMBlockChain: TDSServerModule},
  Data.BlockChain in 'Data.BlockChain.pas' {dmBlockChain: TDataModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmServerPincipal, frmServerPincipal);
  Application.Run;
end.
