unit Form.Cliente.Conversor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Vcl.StdCtrls;

type
  TfrmClienteConversor = class(TForm)
    IdHTTP1: TIdHTTP;
    PanelTitulo: TPanel;
    PanelValorEmReal: TPanel;
    EditValorEmReal: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    EditValorEmDolar: TEdit;
    procedure EditValorEmDolarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditValorEmRealKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClienteConversor: TfrmClienteConversor;

implementation

{$R *.dfm}

procedure TfrmClienteConversor.EditValorEmDolarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    var resp: TStringStream := TStringStream.Create;
    IdHTTP1.Get('http://127.0.0.1:8080/datasnap/rest/TServerMethods1/ConverteDolarParaReal/' + EditValorEmDolar.Text, resp);
    EditValorEmReal.Text := StringReplace(StringReplace(resp.DataString, '{"result":["', '', [rfIgnoreCase]), '"]}', '', []);
    resp.Free;
  end;
end;

procedure TfrmClienteConversor.EditValorEmRealKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    var resp: TStringStream := TStringStream.Create;
    IdHTTP1.Get('http://127.0.0.1:8080/datasnap/rest/TServerMethods1/ConverteRealParaDolar/' + EditValorEmReal.Text, resp);
    EditValorEmDolar.Text := StringReplace(StringReplace(resp.DataString, '{"result":["', '', [rfIgnoreCase]), '"]}', '', []);
    resp.Free;
  end;
end;

end.
