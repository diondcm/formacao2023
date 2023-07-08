unit Form.Client.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  ClientModuleUnit, Vcl.ExtDlgs, Vcl.ComCtrls, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Classe.BlockChain, System.DateUtils,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TResult = class
  private
    FResult: TArray<UInt64>;
  public
    property Result: TArray<UInt64> read FResult write FResult;
  end;

  TResultStr = class
  private
    FResult: TArray<string>;
  public
    property Result: TArray<string> read FResult write FResult;
  end;

  TfrmClientPrincipal = class(TForm)
    OpenPictureDialog: TOpenPictureDialog;
    PageControlClient: TPageControl;
    TabImagem: TTabSheet;
    PanelControles: TPanel;
    ButtonGetFile: TButton;
    ButtonSetFile: TButton;
    ImagemLogo: TImage;
    TabBlockChain: TTabSheet;
    Panel1: TPanel;
    ButtonBlockChain: TButton;
    MemoBlockChain: TMemo;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    ButtonCriaClasses: TButton;
    TabProduto: TTabSheet;
    Button1: TButton;
    ButtonSessionID: TButton;
    Edit1: TEdit;
    ButtonTryConverDateTime: TButton;
    ButtonUnixDate: TButton;
    ButtonISO8601: TButton;
    IdHTTP1: TIdHTTP;
    TimerProducao: TTimer;
    CheckBoxProducao: TCheckBox;
    EditProduto: TEdit;
    LabelQtdExecutando: TLabel;
    LabelQtdErro: TLabel;
    LabelQtdConcluido: TLabel;
    TimerThreads: TTimer;
    procedure ButtonGetFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonSetFileClick(Sender: TObject);
    procedure ButtonBlockChainClick(Sender: TObject);
    procedure ButtonCriaClassesClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ButtonSessionIDClick(Sender: TObject);
    procedure ButtonTryConverDateTimeClick(Sender: TObject);
    procedure ButtonUnixDateClick(Sender: TObject);
    procedure ButtonISO8601Click(Sender: TObject);
    procedure CheckBoxProducaoClick(Sender: TObject);
    procedure TimerProducaoTimer(Sender: TObject);
    procedure TimerThreadsTimer(Sender: TObject);
  private
    { Private declarations }
    class var
      FQtdThreadsExecutando: Integer;
      FQtdThreadsErro: Integer;
      FQtdThreadsConcluido: Integer;
  public
    { Public declarations }
  end;

var
  frmClientPrincipal: TfrmClientPrincipal;

implementation

{$R *.dfm}

uses Vcl.Imaging.pngimage, System.JSON, Rest.Json;

procedure TfrmClientPrincipal.ButtonCriaClassesClick(Sender: TObject);
begin
  var block: string := ClientModule.SMBlockChainClient.GetBlockChainInfoDS;

  var bl: TBlock := Tjson.JsonToObject<TBlock>(block);
  MemoBlockChain.Text := block;

  MemoBlockChain.Lines.Insert(0, sLineBreak);
  MemoBlockChain.Lines.Insert(0, 'Prev Block: ' + bl.prev_block);
  MemoBlockChain.Lines.Insert(0, 'Next Block: ' + bl.next_block[0]);

  bl.Free;

end;

procedure TfrmClientPrincipal.Button1Click(Sender: TObject);
begin
  var qtdThreads: Integer := 100;

  FQtdThreadsExecutando := 0;
  FQtdThreadsErro := 0;
  FQtdThreadsConcluido := 0;

  TimerThreads.Enabled := True;

  for var i: Integer := 0 to qtdThreads -1 do
  begin
    TThread.CreateAnonymousThread(
      procedure
      begin
        InterlockedIncrement(FQtdThreadsExecutando);
        try
          Sleep(Random(500));
          var RESTClient: TRESTClient := TRESTClient.Create(nil);
          RESTClient.BaseURL := 'http://localhost:8080/datasnap/rest/TSMProduto/GetProdutos';

          var RESTResponse: TRESTResponse := TRESTResponse.Create(nil);

          var RESTRequest: TRESTRequest := TRESTRequest.Create(nil);

          try
            RESTRequest.Client := RESTClient;
            RESTRequest.Response := RESTResponse;

            RESTRequest.Execute;

            InterlockedIncrement(FQtdThreadsConcluido);

          except
            InterlockedIncrement(FQtdThreadsErro);
          end;

          RESTRequest.Free;
          RESTResponse.Free;
          RESTClient.Free;
        finally
          InterlockedDecrement(FQtdThreadsExecutando);
        end;
      end).Start;
  end;

end;

procedure TfrmClientPrincipal.ButtonSessionIDClick(Sender: TObject);
begin
  Caption := TimeToStr(ClientModule.SMGeralClient.GetDataAtual()) + ' - ' + ClientModule.SMGeralClient.GetVersaoServer().ToString;
end;

procedure TfrmClientPrincipal.ButtonTryConverDateTimeClick(Sender: TObject);
begin
   ShowMessage(DateTimeToStr(StrToDateTime(Edit1.Text)));
end;

procedure TfrmClientPrincipal.ButtonUnixDateClick(Sender: TObject);
begin
  var stm: TStringStream := TStringStream.Create;
  IdHTTP1.Get('http://localhost:8080/datasnap/rest/TSMGeral/GetDataAtualUnix', stm);

  var res: TResult := TJson.JsonToObject<TResult>(stm.DataString);
  ShowMessage(DateToStr(UnixToDateTime(res.Result[0])));

  res.Free;
  stm.Free;
end;

procedure TfrmClientPrincipal.CheckBoxProducaoClick(Sender: TObject);
begin
  TimerProducao.Enabled := CheckBoxProducao.Checked;
end;

procedure TfrmClientPrincipal.ButtonISO8601Click(Sender: TObject);
begin
  var stm: TStringStream := TStringStream.Create;
  IdHTTP1.Get('http://localhost:8080/datasnap/rest/TSMGeral/GetDataAtualISO8601', stm);

  var res: TResultStr := TJson.JsonToObject<TResultStr>(stm.DataString);
  ShowMessage(DateToStr(ISO8601ToDate(res.Result[0])));

  res.Free;
  stm.Free;
end;

procedure TfrmClientPrincipal.ButtonBlockChainClick(Sender: TObject);
begin
  RESTRequest1.Execute;
  MemoBlockChain.Text := RESTResponse1.Content;
end;

procedure TfrmClientPrincipal.ButtonGetFileClick(Sender: TObject);
begin
  var tamanho: Cardinal := 0;
  var stm: TBytesStream := ClientModule.SMFilesClient.GetFile('LOGO_CLIENTE', tamanho) as TBytesStream;
//  stm.SaveToFile('logo_cliente.png');

  var png: TPngImage := TPngImage.Create;
  png.LoadFromStream(stm);

  ImagemLogo.Stretch := True;
  ImagemLogo.Proportional := True;
  ImagemLogo.Picture.Assign(png);

  png.Free;
end;

procedure TfrmClientPrincipal.ButtonSetFileClick(Sender: TObject);
begin
  OpenPictureDialog.InitialDir := ExtractFilePath(ParamStr(0));
  if OpenPictureDialog.Execute then
  begin
    var strStm: TStringStream := TStringStream.Create;
    strStm.LoadFromFile(OpenPictureDialog.FileName);

    ClientModule.SMFilesClient.SetFile('LOGO_CLIENTE', strStm);
//    strStm.Free;
  end;
end;

procedure TfrmClientPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TfrmClientPrincipal.TimerProducaoTimer(Sender: TObject);
begin
  var stm: TStringStream := TStringStream.Create;
  IdHTTP1.Get('http://localhost:8080/datasnap/rest/TSMGeral/GetDataAtualUnix', stm);

  var res: TResult := TJson.JsonToObject<TResult>(stm.DataString);
  EditProduto.Text := res.Result[0].ToString;
  res.Free;
end;

procedure TfrmClientPrincipal.TimerThreadsTimer(Sender: TObject);
begin
  LabelQtdExecutando.Caption := 'Exec: ' + FormatFloat('0.,', FQtdThreadsExecutando);
  LabelQtdErro.Caption := 'Erro: ' + FormatFloat('0.,', FQtdThreadsErro);
  LabelQtdConcluido.Caption := 'Ok:' + FormatFloat('0.,', FQtdThreadsConcluido);

  TimerThreads.Enabled := FQtdThreadsExecutando > 0;
end;

end.
