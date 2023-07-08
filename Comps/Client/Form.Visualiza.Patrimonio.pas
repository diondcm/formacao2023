unit Form.Visualiza.Patrimonio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frame.Cliente, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TfrmVisualizaPatrimonio = class(TForm)
    fraCliente1: TfraCliente;
    LabelTotal: TLabel;
    procedure fraCliente1ButtonLigarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

    procedure Button3Click(Sender: TObject);

    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

procedure TfrmVisualizaPatrimonio.Button1Click(Sender: TObject);
begin
  ShowMessage('Teste');
end;

procedure TfrmVisualizaPatrimonio.fraCliente1ButtonLigarClick(Sender: TObject);
begin
  fraCliente1.ButtonLigarClick(Sender);
  Caption := TimeToStr(Now);
end;

procedure TfrmVisualizaPatrimonio.Button3Click(Sender: TObject);
begin
  ShowMessage('Teste');
end;

procedure TfrmVisualizaPatrimonio.Button4Click(Sender: TObject);
begin
  ShowMessage('Teste');
end;

end.
