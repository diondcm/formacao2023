unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus,
  Data.Imagens, Form.Cadastro.Cliente, Form.Cadastro.Produto;

type
  TfrmPrincipal = class(TForm)
    MainMenuPrincipal: TMainMenu;
    ActionListPrincipal: TActionList;
    ToolBar1: TToolBar;
    ToolButtonCliente: TToolButton;
    ActionCliente: TAction;
    Arquivo1: TMenuItem;
    Cliente1: TMenuItem;
    ActionProduto: TAction;
    ActionPedido: TAction;
    ToolButtonProduto: TToolButton;
    Produto1: TMenuItem;
    procedure ActionClienteExecute(Sender: TObject);
    procedure ActionProdutoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ActionClienteExecute(Sender: TObject);
begin
  TfrmCadCliente.Create(Application).Show;
end;

procedure TfrmPrincipal.ActionProdutoExecute(Sender: TObject);
begin
  TfrmCadProduto.Create(Application).Show;
end;

end.
