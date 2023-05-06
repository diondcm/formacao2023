unit Form.Menu.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, System.ImageList,
  Vcl.ImgList;

type
  TfrmMenuCadastros = class(TForm)
    MainMenu: TMainMenu;
    FlowPanelMenu: TFlowPanel;
    ActionList: TActionList;
    ActionCadastroChuck: TAction;
    Cadastros1: TMenuItem;
    CadastroChuck1: TMenuItem;
    BitBtnCadastroChuck: TBitBtn;
    ImageList: TImageList;
    ActionCadastroBB: TAction;
    BreakingBad1: TMenuItem;
    BitBtnBreakingBad: TBitBtn;
    BitBtn1: TBitBtn;
    ActionCadastroPais: TAction;
    CadastroPases1: TMenuItem;
    BitBtnGeraQrCode: TBitBtn;
    ActionGeraQrCode: TAction;
    GeraQrCode1: TMenuItem;
    procedure ActionCadastroChuckExecute(Sender: TObject);
    procedure ActionCadastroBBExecute(Sender: TObject);
    procedure ActionCadastroPaisExecute(Sender: TObject);
    procedure ActionGeraQrCodeExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenuCadastros: TfrmMenuCadastros;

implementation

{$R *.dfm}

uses Form.Cadastro.Chuck, Form.Cadastro.BreakingBad, Form.Cadastro.Pais,
  Form.QrCode;

procedure TfrmMenuCadastros.ActionCadastroBBExecute(Sender: TObject);
begin
  var frm : TfrmBreakingBad := TfrmBreakingBad.Create(Application);

  frm.ShowModal;

  frm.Free;
end;

procedure TfrmMenuCadastros.ActionCadastroChuckExecute(Sender: TObject);
begin
  frmCadastroChuck := TfrmCadastroChuck.Create(Self);

  frmCadastroChuck.ShowModal;

  frmCadastroChuck.Free;
end;

procedure TfrmMenuCadastros.ActionCadastroPaisExecute(Sender: TObject);
begin
  var frm : TfrmCadastroPais := TfrmCadastroPais.Create(Application);

  frm.ShowModal;

  frm.Free;
end;

procedure TfrmMenuCadastros.ActionGeraQrCodeExecute(Sender: TObject);
begin
  var frm : TfrmQrCode := TfrmQrCode.Create(Application);

  frm.ShowModal;

  frm.Free;
end;

end.
