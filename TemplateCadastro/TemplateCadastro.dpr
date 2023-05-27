program TemplateCadastro;

uses
  Vcl.Forms,
  Form.Principal in 'Form.Principal.pas' {frmPrincipal},
  Data.Imagens in 'Data.Imagens.pas' {dmdImages: TDataModule},
  Data.Conexao in 'Data.Conexao.pas' {dmdConexao: TDataModule},
  Base.Data.Cadastro in 'Base.Data.Cadastro.pas' {dmdBaseCadastro: TDataModule},
  Base.Form.Cadastro in 'Base.Form.Cadastro.pas' {frmBaseCadastro},
  Data.Cliente in 'Data.Cliente.pas' {dmdCliente: TDataModule},
  Form.Cadastro.Cliente in 'Form.Cadastro.Cliente.pas' {frmCadCliente},
  Data.Produto in 'Data.Produto.pas' {dmdProduto: TDataModule},
  Form.Cadastro.Produto in 'Form.Cadastro.Produto.pas' {frmCadProduto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmdImages, dmdImages);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmdConexao, dmdConexao);
  Application.CreateForm(TdmdBaseCadastro, dmdBaseCadastro);
  Application.CreateForm(TfrmBaseCadastro, frmBaseCadastro);
  Application.CreateForm(TdmdCliente, dmdCliente);
  Application.CreateForm(TfrmCadCliente, frmCadCliente);
  Application.CreateForm(TdmdProduto, dmdProduto);
  Application.CreateForm(TfrmCadProduto, frmCadProduto);
  Application.Run;
end.
