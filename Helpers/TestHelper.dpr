program TestHelper;

uses
  Vcl.Forms,
  Form.TestHelper in 'Form.TestHelper.pas' {frmTestHelper},
  Classe.ZipHelper in 'Classe.ZipHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTestHelper, frmTestHelper);
  Application.Run;
end.
