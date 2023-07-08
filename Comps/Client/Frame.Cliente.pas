unit Frame.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfraCliente = class(TFrame)
    PanelHeaderCliente: TPanel;
    PanelDadosCliente: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    PanelAcoes: TPanel;
    ButtonImprimir: TButton;
    ButtonLigar: TButton;
    procedure ButtonImprimirClick(Sender: TObject);
    procedure ButtonLigarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfraCliente.ButtonImprimirClick(Sender: TObject);
begin
  ShowMessage('Imprimir!');
end;

procedure TfraCliente.ButtonLigarClick(Sender: TObject);
begin
  ShowMessage('Ligando...');
end;

end.
