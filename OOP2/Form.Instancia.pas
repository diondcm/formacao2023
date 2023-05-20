unit Form.Instancia;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Classe.Utils, Vcl.StdCtrls,
  Classe.Mensagens;

type
  TfrmInstancia = class(TForm)
    Button1: TButton;
    ButtonAviso: TButton;
    ButtonErro: TButton;
    ButtonConfirmacao: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ButtonAvisoClick(Sender: TObject);
    procedure ButtonErroClick(Sender: TObject);
    procedure ButtonConfirmacaoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmInstancia: TfrmInstancia;

implementation

{$R *.dfm}

procedure TfrmInstancia.Button1Click(Sender: TObject);
begin
  TAviso.Avisa('Teste');

  var avisoBR: TAviso := TAviso.Create;
  var avisoUS: TAviso := TAviso.Create;

  avisoBR.Idioma := 'BR';
  avisoUS.Idioma := 'US';
  TAviso.Idioma := 'Teste';

  avisoBR.AvisaDeInstancia('Teste');
  avisoUS.AvisaDeInstancia('Teste');


  avisoBR.Free;
  avisoUS.Free;

//  Aviso('Novo teste');
end;

procedure TfrmInstancia.Button2Click(Sender: TObject);
begin
  MessageDlg('Mamífero correndo!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0);

end;

procedure TfrmInstancia.ButtonAvisoClick(Sender: TObject);
begin
  TMensagem.Aviso('Este é um aviso');
end;

procedure TfrmInstancia.ButtonConfirmacaoClick(Sender: TObject);
begin
  if TMensagem.Confirmacao('Comfirma?') then
  begin
    Caption := 'Confirma: Sim';
  end else begin
    Caption := 'Confirma: Não';
  end;
end;

procedure TfrmInstancia.ButtonErroClick(Sender: TObject);
begin
  TMensagem.Erro('Este é um Erro!');
end;

end.
