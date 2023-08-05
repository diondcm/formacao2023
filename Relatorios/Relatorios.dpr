program Relatorios;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Data.Relatorios.Simples in 'Data.Relatorios.Simples.pas' {dmdRelatoriosSimples: TDataModule},
  Form.Relatorio.Simples in 'Form.Relatorio.Simples.pas' {frmRelatoriosSimples},
  Vcl.Themes,
  Vcl.Styles,
  Form.Base.Relatorio in 'Form.Base.Relatorio.pas' {frmBaseRelatorio},
  Form.Relatorio.Herdado in 'Form.Relatorio.Herdado.pas' {frmRelHerdado},
  Data.Rel.CodBarra in 'Data.Rel.CodBarra.pas' {dmdRelCodBarra: TDataModule},
  Data.Rel.Imagens in 'Data.Rel.Imagens.pas' {dmdRelImagens: TDataModule},
  Form.Rel.Main.Detail.Detail in 'Form.Rel.Main.Detail.Detail.pas' {frmMainDetailDetail},
  Data.Rel.Main.Detail.Detail in 'Data.Rel.Main.Detail.Detail.pas' {dmdRelMainDetailDetail: TDataModule},
  Data.Preview.Relatorios in 'Data.Preview.Relatorios.pas' {dmdRelatorio: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmdRelCodBarra, dmdRelCodBarra);
  Application.CreateForm(TfrmMainDetailDetail, frmMainDetailDetail);
  Application.CreateForm(TdmdRelMainDetailDetail, dmdRelMainDetailDetail);
  Application.CreateForm(TdmdRelatorio, dmdRelatorio);
  //  Application.CreateForm(TdmdRelImagens, dmdRelImagens);
  Application.CreateForm(TfrmRelatoriosSimples, frmRelatoriosSimples);
  Application.CreateForm(TfrmBaseRelatorio, frmBaseRelatorio);
  Application.CreateForm(TfrmRelHerdado, frmRelHerdado);
  Application.Run;
end.
