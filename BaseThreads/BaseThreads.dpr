program BaseThreads;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Form.ThreadExcept in 'Form.ThreadExcept.pas' {frmThreadsExcept},
  Form.CriticalSection in 'Form.CriticalSection.pas' {frmCriticalSection};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCriticalSection, frmCriticalSection);
  Application.CreateForm(TfrmThreadsExcept, frmThreadsExcept);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
