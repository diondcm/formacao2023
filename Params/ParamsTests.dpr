program ParamsTests;

uses
  Vcl.Forms,
  Form.Testes in 'Form.Testes.pas' {frmTestes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTestes, frmTestes);
  Application.Run;
end.
