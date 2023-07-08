program TestaComps;

uses
  Vcl.Forms,
  Form.Testa.Componentes in 'Form.Testa.Componentes.pas' {frmTestaComps},
  Componente.Panel.Obrigatorio in '..\PanelObrigatorio\Componente.Panel.Obrigatorio.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTestaComps, frmTestaComps);
  Application.Run;
end.
