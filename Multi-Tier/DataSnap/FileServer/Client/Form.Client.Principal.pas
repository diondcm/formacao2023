unit Form.Client.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  ClientModuleUnit, Vcl.ExtDlgs, Vcl.ComCtrls, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Classe.BlockChain;

type
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
    procedure ButtonGetFileClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonSetFileClick(Sender: TObject);
    procedure ButtonBlockChainClick(Sender: TObject);
    procedure ButtonCriaClassesClick(Sender: TObject);
  private
    { Private declarations }
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

end.
