unit Form.Principal.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Form.Controle.Patrimonio, Form.Visualiza.Patrimonio, Form.Testa.Comp;

type
  TfrmPrincipalCliente = class(TForm)
    FlowPanel1: TFlowPanel;
    ButtonConceitosOO: TBitBtn;
    ButtonVisualiza: TBitBtn;
    ButtonCompPanel: TBitBtn;
    procedure ButtonConceitosOOClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonVisualizaClick(Sender: TObject);

    procedure Button1Click(Sender: TObject);
    procedure ButtonCompPanelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipalCliente: TfrmPrincipalCliente;

implementation

{$R *.dfm}

procedure TfrmPrincipalCliente.ButtonCompPanelClick(Sender: TObject);
begin
  TfrmTestaComp.Create(Self).ShowModal;
end;

procedure TfrmPrincipalCliente.ButtonConceitosOOClick(Sender: TObject);
begin
  TfrmControlePatrimonio.Create(Self).ShowModal;
end;

procedure TfrmPrincipalCliente.ButtonVisualizaClick(Sender: TObject);
begin
  TfrmVisualizaPatrimonio.Create(Self).ShowModal;
end;

procedure TfrmPrincipalCliente.FormCreate(Sender: TObject);
begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
end;

procedure TfrmPrincipalCliente.Button1Click(Sender: TObject);
begin
  ShowMessage('Teste');
end;

end.
