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
  Form.Cadastro.Produto in 'Form.Cadastro.Produto.pas' {frmCadProduto},
  Classe.Mensagens in 'Classe.Mensagens.pas',
  Classe.Textos in 'Classe.Textos.pas',
  Base.Form in 'Base.Form.pas' {frmBase},
  Form.Login in 'Form.Login.pas' {frmLogin},
  Classe.Cliente in 'Classe.Cliente.pas',
  Classe.Grid.Helper in 'Classe.Grid.Helper.pas',
  Form.Pesquisa in 'Form.Pesquisa.pas' {frmPesquisa},
  Data.Pedido in 'Data.Pedido.pas' {dmdPedido: TDataModule},
  Form.Cadastro.Pedido in 'Form.Cadastro.Pedido.pas' {frmCadPedido};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmdImages, dmdImages);
  //  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmdConexao, dmdConexao);
  Application.CreateForm(TfrmBase, frmBase);
  Application.Run;

//  if not frmPrincipal.Login then
//  begin
//    Application.Terminate;
//  end else begin
//  end;
end.
