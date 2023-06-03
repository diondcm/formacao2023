unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus,
  Data.Imagens, Form.Cadastro.Cliente, Form.Cadastro.Produto, Base.Form,
  Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TfrmBase)
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
    TimerLogin: TTimer;
    procedure ActionClienteExecute(Sender: TObject);
    procedure ActionProdutoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerLoginTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
//    function Login: Boolean;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Form.Login;

procedure TfrmPrincipal.ActionClienteExecute(Sender: TObject);
begin
  TfrmCadCliente.Create(Application).Show;
end;

procedure TfrmPrincipal.ActionProdutoExecute(Sender: TObject);
begin
  TfrmCadProduto.Create(Application).Show;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  {$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

//  var frm: TfrmLogin := TfrmLogin.Create(Self);
//  if frm.ShowModal <> mrOk then
//  begin
//    Application.Terminate;
////    Self.Close;
//  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  inherited;
  TimerLogin.Enabled := True;

//  var frm: TfrmLogin := TfrmLogin.Create(Self);
//  if frm.ShowModal <> mrOk then
//  begin
//    Application.Terminate;
////    Self.Close;
//  end;
end;

//function TfrmPrincipal.Login: Boolean;
//begin
//  Result := False;
//  var frm: TfrmLogin := TfrmLogin.Create(Self);
//  if frm.ShowModal <> mrOk then
//  begin
//    Result := True;
////    Application.Terminate;
//////    Self.Close;
//  end;
//end;

procedure TfrmPrincipal.TimerLoginTimer(Sender: TObject);
begin
  TimerLogin.Enabled := False;

  {$IFNDEF DEBUG}
  var frm: TfrmLogin := TfrmLogin.Create(nil);
  if frm.ShowModal <> mrOk then
  begin
    Self.Close;
  end;

  frm.Free;
  {$ENDIF}



//    Result := True;
//    Application.Terminate;
//////    Self.Close;
//  end;
end;

end.
