program TestRTTI;

uses
  Vcl.Forms,
  Form.RTTI in 'Form.RTTI.pas' {frmTestRTTI};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTestRTTI, frmTestRTTI);
  Application.Run;
end.
