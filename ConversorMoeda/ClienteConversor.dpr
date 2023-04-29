program ClienteConversor;

uses
  Vcl.Forms,
  Form.Cliente.Conversor in 'Form.Cliente.Conversor.pas' {frmClienteConversor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmClienteConversor, frmClienteConversor);
  Application.Run;
end.
