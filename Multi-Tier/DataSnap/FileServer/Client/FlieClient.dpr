program FlieClient;

uses
  Vcl.Forms,
  Form.Client.Principal in 'Form.Client.Principal.pas' {frmClientPrincipal},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit in 'ClientModuleUnit.pas' {ClientModule: TDataModule},
  Classe.BlockChain in 'Classe.BlockChain.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmClientPrincipal, frmClientPrincipal);
  Application.CreateForm(TClientModule, ClientModule);
  Application.Run;
end.
