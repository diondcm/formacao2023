unit Form.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TForm)
    PanelLogo: TPanel;
    PanelImagem: TPanel;
    PanelDados: TPanel;
    PanelControles: TPanel;
    ButtonOk: TBitBtn;
    ButtonSair: TBitBtn;
    ImageLogin: TImage;
    EditUsuario: TEdit;
    EditSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure ButtonOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

//uses Form.Principal;
//
procedure TfrmLogin.ButtonOkClick(Sender: TObject);
begin
  if (EditUsuario.Text = 'admin') and (EditSenha.Text = 'aqua') then
  begin
//    Close;
//    frmPrincipal.Show;
  end else begin
    ShowMessage('Login inválido!');
  end;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
