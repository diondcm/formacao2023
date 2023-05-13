program OOP;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.Visualiza.Pessoa in 'Form.Visualiza.Pessoa.pas' {frmVisualizaPessoa},
  Classe.Pessoa in 'Classe.Pessoa.pas',
  Form.PessoaDB in 'Form.PessoaDB.pas' {frmPessoaDB};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmVisualizaPessoa, frmVisualizaPessoa);
  Application.Run;
end.
