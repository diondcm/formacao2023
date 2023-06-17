program ClientDataSnap;

uses
  Vcl.Forms,
  Form.Principal.Client in 'Form.Principal.Client.pas' {frmPrincipalClient},
  Classe.Pessoa in '..\Shared\Classe.Pessoa.pas',
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule},
  Classe.Regra.Pessoa in '..\Server\Classe.Regra.Pessoa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalClient, frmPrincipalClient);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.Run;
end.
