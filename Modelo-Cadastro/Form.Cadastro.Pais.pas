unit Form.Cadastro.Pais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, REST.Types, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin;

type
  TfrmCadastroPais = class(TForm)
    PanelControles: TPanel;
    EditSigla: TEdit;
    ButtonPais: TButton;
    PanelGrid: TPanel;
    PanelImagem: TPanel;
    DBGridDados: TDBGrid;
    ImagemPais: TImage;
    RESTRequest1: TRESTRequest;
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
    memPais: TFDMemTable;
    DataSourcePais: TDataSource;
    memPaisName: TStringField;
    memPaisCca2: TStringField;
    memPaisPopulation: TLargeintField;
    memPaisFlag: TStringField;
    Splitter1: TSplitter;
    TimerOpen: TTimer;
    procedure ButtonPaisClick(Sender: TObject);
    procedure DataSourcePaisDataChange(Sender: TObject; Field: TField);
    procedure TimerOpenTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    const
      ARQ_DB = 'paises.dbs';
  private
    FUrlBandeiraCarregada: string;
    procedure CarregaImagemBandeira(url: string);
  public
    { Public declarations }
  end;

var
  frmCadastroPais: TfrmCadastroPais;

implementation

{$R *.dfm}

uses Classe.Pais, System.JSON, REST.Json, System.NetConsts, Vcl.Imaging.pngimage;

procedure TfrmCadastroPais.ButtonPaisClick(Sender: TObject);
begin
  var strJSON: string;

  RESTClient1.BaseURL := 'https://restcountries.com/v3.1/alpha/' + EditSigla.Text;
  RESTRequest1.Execute;
  strJSON := RESTResponse1.Content;

  if strJSON = '' then
  begin
    ShowMessage('Sem dados');
    Exit;
  end;

//  Delete(strJSON, 1, 1);
//  Delete(strJSON, strJSON.Length - 1, 1);
  var pais: TPais := TJson.JsonToObject<TPais>('{ "Items": ' + strJSON + '}');

  memPais.Open;

  memPais.Append;
  memPaisName.AsString := pais.Items.First.Name.Common;
  memPaisCca2.AsString := pais.Items.First.cca2;
  memPaisPopulation.AsLargeInt := pais.Items.First.population;
  memPaisFlag.AsString := pais.Items.First.Flags.Png;
  memPais.Post;
end;

//var
//  Não_USAR_VAR_GLOBAL: string;

procedure TfrmCadastroPais.CarregaImagemBandeira(url: string);
begin
//  URL := 'https://flagcdn.com/w320/br.png';

  if FUrlBandeiraCarregada = url then
  begin
    Exit;
  end;

  if url = '' then
  begin
//    ImagemPais.Picture.Assign(nil);
    ImagemPais.Picture.Bitmap.FreeImage;
    FUrlBandeiraCarregada := url;
    Exit;
  end;

  var HttpClient: TNetHTTPClient := TNetHTTPClient.Create(nil);
  var Stream: TMemoryStream:= TMemoryStream.Create;
  var PNGImage: TPngImage := TPngImage.Create;
  var Response: IHTTPResponse;
  try
    Response := HttpClient.Get(URL, Stream);
    if Response.StatusCode = 200 then
    begin
      Stream.Position := 0;
      PNGImage.LoadFromStream(Stream);
      ImagemPais.Picture.Assign(PNGImage);
      ImagemPais.Stretch := True;
      ImagemPais.Proportional := True;
      FUrlBandeiraCarregada := url;
    end else begin
      raise Exception.Create(Response.StatusCode.ToString + ' - ' + Response.StatusText);
    end;
  finally
    PNGImage.Free;
    Stream.Free;
    HttpClient.Free;
  end;
end;

procedure TfrmCadastroPais.DataSourcePaisDataChange(Sender: TObject;
  Field: TField);
begin
  CarregaImagemBandeira(memPaisFlag.AsString);
end;

procedure TfrmCadastroPais.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if memPais.IsEmpty then
  begin
    Exit;
  end;

  memPais.SaveToFile(ARQ_DB, sfJSON);
end;

procedure TfrmCadastroPais.FormShow(Sender: TObject);
begin
  TimerOpen.Enabled := True;
end;

procedure TfrmCadastroPais.TimerOpenTimer(Sender: TObject);
begin
  TimerOpen.Enabled := False;

  if FileExists(ARQ_DB) then
  begin
    memPais.LoadFromFile(ARQ_DB, sfJSON);
  end;
end;

end.
