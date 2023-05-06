program ModeloCadastro;

uses
  Vcl.Forms,
  Form.Menu.Cadastro in 'Form.Menu.Cadastro.pas' {frmMenuCadastros},
  Form.Cadastro.Chuck in 'Form.Cadastro.Chuck.pas' {frmCadastroChuck},
  Form.Cadastro.BreakingBad in 'Form.Cadastro.BreakingBad.pas' {frmBreakingBad},
  Form.Cadastro.Pais in 'Form.Cadastro.Pais.pas' {frmCadastroPais},
  Pkg.Json.DTO in 'Pkg.Json.DTO.pas',
  Classe.Pais in 'Classe.Pais.pas',
  Vcl.Themes,
  Vcl.Styles,
  Form.QrCode in 'Form.QrCode.pas' {frmQrCode},
  Classe.QrCode in 'Classe.QrCode.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Carbon');
  Application.CreateForm(TfrmMenuCadastros, frmMenuCadastros);
  Application.CreateForm(TfrmCadastroPais, frmCadastroPais);
  Application.CreateForm(TfrmQrCode, frmQrCode);
  Application.Run;
end.
