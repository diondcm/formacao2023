program ClienteTeste;

uses
  Vcl.Forms,
  Form.Principal.Cliente in 'Form.Principal.Cliente.pas' {frmPrincipalCliente},
  Form.Controle.Patrimonio in 'Form.Controle.Patrimonio.pas' {frmControlePatrimonio},
  Classe.Base in 'Classe.Base.pas',
  Classe.Patrimonio in 'Classe.Patrimonio.pas',
  Classe.Veiculos in 'Classe.Veiculos.pas',
  Classe.Imovel in 'Classe.Imovel.pas',
  Classe.Pessoas in 'Classe.Pessoas.pas',
  Frame.Cliente in 'Frame.Cliente.pas' {fraCliente: TFrame},
  Form.Visualiza.Patrimonio in 'Form.Visualiza.Patrimonio.pas' {frmVisualizaPatrimonio},
  Form.Testa.Comp in 'Form.Testa.Comp.pas' {frmTestaComp};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalCliente, frmPrincipalCliente);
  Application.Run;
end.
