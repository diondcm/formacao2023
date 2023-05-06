unit Form.Cadastro.Chuck;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.JSON, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TfrmCadastroChuck = class(TForm)
    DBGridChuck: TDBGrid;
    DataSourceChuck: TDataSource;
    memChuck: TFDMemTable;
    memChuckicon_url: TStringField;
    memChuckid: TStringField;
    memChuckurl: TStringField;
    memChuckvalue: TStringField;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    TimerOpen: TTimer;
    PanelControles: TPanel;
    ButtonBuscaFrase: TButton;
    procedure TimerOpenTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonBuscaFraseClick(Sender: TObject);
  private
    procedure CarregaFrase;
  public
    { Public declarations }
  end;

var
  frmCadastroChuck: TfrmCadastroChuck;

implementation

{$R *.dfm}

procedure TfrmCadastroChuck.ButtonBuscaFraseClick(Sender: TObject);
begin
  CarregaFrase;
end;

procedure TfrmCadastroChuck.CarregaFrase;
begin
/// Acessar API, buscar frase do chuck - Uma vez
//  var IdHTTP: TIdHTTP := TIdHTTP.Create(nil);
//  var stm: TStringStream := TStringStream.Create;
//  try
//    IdHTTP.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(IdHTTP);
//    (IdHTTP.IOHandler as TIdSSLIOHandlerSocketOpenSSL).SSLOptions.Method := sslvSSLv23;
//    (IdHTTP.IOHandler as TIdSSLIOHandlerSocketOpenSSL).SSLOptions.Mode := sslmBoth;
//    IdHTTP.Request.UserAgent := 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36';
//    IdHTTP.Get('https://api.chucknorris.io/jokes/random', stm);
//  finally
//    IdHTTP.Free;
//    stm.Free;
//  end;

  var strJSON: string;
  var stm: TStringStream := TStringStream.Create;
  try
    RESTRequest1.Execute;
    strJSON := RESTResponse1.Content;

  finally
    stm.Free;
  end;

/// Serealizar JSON - ler dados
  if strJSON = '' then
  begin
    ShowMessage('Sem dados');
    Exit;
  end;

/// Colocar dados no Dataset
  var objJSON: TJSONObject := TJSONObject.ParseJSONValue(strJSON) as TJSONObject;

  memChuck.Open;

  memChuck.Append; // .Insert
  memChuck.FieldByName('icon_url').AsString := objJSON.GetValue<string>('icon_url');
  memChuck.FieldByName('id').AsString := objJSON.GetValue<string>('id');
  memChuck.FieldByName('url').AsString := objJSON.GetValue<string>('url');
  memChuck.FieldByName('value').AsString := objJSON.GetValue<string>('value');

  memChuck.Post;

  objJSON.Free;
end;

procedure TfrmCadastroChuck.FormShow(Sender: TObject);
begin
  TimerOpen.Enabled := True;
end;

procedure TfrmCadastroChuck.TimerOpenTimer(Sender: TObject);
begin
  TimerOpen.Enabled := False;

  CarregaFrase;
end;

end.
