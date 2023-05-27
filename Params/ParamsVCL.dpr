program ParamsVCL;

uses
  Vcl.Forms,
  Form.Params.Principal in 'Form.Params.Principal.pas' {frmParamsPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmParamsPrincipal, frmParamsPrincipal);
  Application.Run;
end.
