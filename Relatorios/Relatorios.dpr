program Relatorios;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Data.Relatorios.Simples in 'Data.Relatorios.Simples.pas' {dmdRelatoriosSimples: TDataModule},
  Form.Relatorio.Simples in 'Form.Relatorio.Simples.pas' {frmRelatoriosSimples},
  Vcl.Themes,
  Vcl.Styles,
  Form.Base.Relatorio in 'Form.Base.Relatorio.pas' {frmBaseRelatorio},
  Form.Relatorio.Herdado in 'Form.Relatorio.Herdado.pas' {frmRelHerdado};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
//  Application.CreateForm(TdmdRelatoriosSimples, dmdRelatoriosSimples);
  Application.CreateForm(TfrmRelatoriosSimples, frmRelatoriosSimples);
  Application.CreateForm(TfrmBaseRelatorio, frmBaseRelatorio);
  Application.CreateForm(TfrmRelHerdado, frmRelHerdado);
  Application.Run;
end.
