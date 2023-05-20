unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Form.Instancia;

type
  TfrmPrincipal = class(TForm)
    FlowPanelControles: TFlowPanel;
    ButtonCadastro: TBitBtn;
    ButtonInstancia: TBitBtn;
    procedure ButtonCadastroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonInstanciaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Form.Cadastro, Classe.Utils;

procedure TfrmPrincipal.ButtonCadastroClick(Sender: TObject);
begin
  frmCadastro := TfrmCadastro.Create(Application);
  frmCadastro.Show;
end;

procedure TfrmPrincipal.ButtonInstanciaClick(Sender: TObject);
begin
//  var frm: TfrmInstancia := TfrmInstancia.Create(Application);
//  frm.Show;

  TfrmInstancia.Create(Application).Show;

//  Application.CreateForm(TfrmInstancia, frmInstancia);
//  frmInstancia.Show;


//  if not Assigned(frmInstancia) then
//  begin
//    ShowMessage('Está nil');
//    {frmInstancia} frm.Caption := 'Teste';
//    {frmInstancia} frm.Repaint;
//  end;

//  frmInstancia := TfrmInstancia.Create(Application);
//  frmInstancia.Show;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

//  if InDebug then
//  begin
//    ReportMemoryLeaksOnShutdown := True;
//  end;

  {$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
end;

end.
