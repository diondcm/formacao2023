program TesteMensagens;

uses
  Vcl.Forms,
  Form.Pincipal.Mensagens in 'Form.Pincipal.Mensagens.pas' {frmPrincipalMensagens},
  Form.Destino in 'Form.Destino.pas' {frmDestino};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipalMensagens, frmPrincipalMensagens);
  Application.CreateForm(TfrmDestino, frmDestino);
  Application.Run;
end.
