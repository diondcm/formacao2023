program OOP2;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Cadastro in 'Form.Cadastro.pas' {frmCadastro},
  Classe.Utils in 'Classe.Utils.pas',
  Classe.Mamiferos in 'Classe.Mamiferos.pas',
  Classe.Oviparos in 'Classe.Oviparos.pas',
  Classe.InfAnimal in 'Classe.InfAnimal.pas',
  Form.Instancia in 'Form.Instancia.pas' {frmInstancia},
  Classe.Mensagens in 'Classe.Mensagens.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
