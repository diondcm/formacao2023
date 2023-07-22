unit Classe.Card.Viewer;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls, Vcl.Graphics, Vcl.Dialogs, System.IOUtils, System.Types,
  Classe.OpenAI.Image, System.JSON, REST.Json, System.NetEncoding, REST.Types, REST.Client,
  REST.Authenticator.OAuth.WebForm.Win, REST.Authenticator.OAuth,
  Form.Visualiza.Card;

type
  TCardViewer = class(TCustomPanel)
  private
    FSobre: string;
    FIndiceAtual: Integer;
    FListaImagens: TStringList;
    FImagemPrincipal: TImage;
    FStretch: Boolean;
    FProportional: Boolean;
    FMargemHorizontal: Integer;
    FMargemPorporcaoVertical: Integer;
    FImagemEsquerda: TImage;
    FImagemDireita: TImage;
    FMargemVertical: Integer;
    FPastaImagens: string;
    FProximaImagemDireita: TPicture;
    FProximaImagemEsquerda: TPicture;
    procedure DefineMargens;
    procedure SetProportional(const Value: Boolean);
    procedure SetStretch(const Value: Boolean);
    procedure SetPastaImagens(const Value: string);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure Resize; override;
    procedure CarregaImagemGenerica(CaminhoImagem: string; pic: TPicture);
    procedure DoImageClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SelecionaImagemEsquerda;
    procedure SelecionaImagemDireita;
    procedure ExibeImagem(imgJSON: string);
    procedure ExecutaCallAPI(prompt: string);
    procedure DoPrincipalDblClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure CarregaImagemPrincipal(CaminhoImagem: string);
    procedure CarregaImagemEsquerda(CaminhoImagem: string);
    procedure CarregaImagemDireita(CaminhoImagem: string);

    procedure GeraImagemAI(prompt: string);
  public const
    MARGEM_DEFAULT = 20;
    PROPORCAO_IMAGEM_PADRAO = 8;

  published
    property Align;
    property Stretch: Boolean read FStretch write SetStretch default True;
    property Proportional: Boolean read FProportional write SetProportional default True;
    property MargemHorizontal: Integer read FMargemHorizontal write FMargemHorizontal default MARGEM_DEFAULT;
    property MargemVertical: Integer read FMargemVertical write FMargemVertical default MARGEM_DEFAULT;
    property MargemPorporcaoVertical: Integer read FMargemPorporcaoVertical write FMargemPorporcaoVertical default 8;
    property ImagemPrincipal: TImage read FImagemPrincipal write FImagemPrincipal;
    property ImagemEsquerda: TImage read FImagemEsquerda write FImagemEsquerda;
    property ImagemDireita: TImage read FImagemDireita write FImagemDireita;
    property PastaImagens: string read FPastaImagens write SetPastaImagens;
    property Sobre: string read FSobre;
  end;

implementation

uses
  Vcl.Imaging.GIFImg, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

{ TCardViewer }

procedure TCardViewer.CarregaImagemDireita(CaminhoImagem: string);
begin
  CarregaImagemGenerica(CaminhoImagem, FImagemDireita.Picture);
end;

procedure TCardViewer.CarregaImagemEsquerda(CaminhoImagem: string);
begin
  CarregaImagemGenerica(CaminhoImagem, FImagemEsquerda.Picture);
end;

procedure TCardViewer.CarregaImagemGenerica(CaminhoImagem: string; pic: TPicture);
var
  Header: array[0..7] of Byte;
begin
  if not TFile.Exists(CaminhoImagem) then
    raise Exception.Create('Arquivo não encontrado: ' + CaminhoImagem);

  var Graphic: TGraphic;
  var stmFS: TFileStream := TFileStream.Create(CaminhoImagem, fmOpenRead);
  try
    stmFS.Read(Header, SizeOf(Header));

    if (Header[0] = $47) and (Header[1] = $49) and (Header[2] = $46) then // GIF
      Graphic := TGIFImage.Create
    else if (Header[0] = $FF) and (Header[1] = $D8) then // JPEG
      Graphic := TJPEGImage.Create
    else if (Header[0] = $89) and (Header[1] = $50) and (Header[2] = $4E) and
            (Header[3] = $47) and (Header[4] = $0D) and (Header[5] = $0A) and
            (Header[6] = $1A) and (Header[7] = $0A) then // PNG
      Graphic := TPNGImage.Create
    else if (Header[0] = $42) and (Header[1] = $4D) then // BMP
      Graphic := TBitmap.Create
    else
      raise Exception.Create('Formato "' + LowerCase(ExtractFileExt(CaminhoImagem)) + '" de imagem não suportado.');

    try
      stmFS.Position := 0;
      Graphic.LoadFromStream(stmFS);
      pic.Assign(Graphic);
    finally
      Graphic.Free;
    end;
  finally
    stmFS.Free;
  end;

//  var Extension: string := LowerCase(ExtractFileExt(CaminhoImagem));
//  if Extension = '.bmp' then
//    Graphic := TBitmap.Create
//  else if (Extension = '.jpg') or (Extension = '.jpeg') then
//    Graphic := TJPEGImage.Create
//  else if Extension = '.png' then
//    Graphic := TPNGImage.Create
//  else if Extension = '.gif' then
//    Graphic := TGIFImage.Create
//  else
//    raise Exception.Create('Formato "' + Extension + '" de imagem não suportado.');
end;

procedure TCardViewer.CarregaImagemPrincipal(CaminhoImagem: string);
begin
  CarregaImagemGenerica(CaminhoImagem, FImagemPrincipal.Picture);
end;

constructor TCardViewer.Create(AOwner: TComponent);
begin
  inherited;
  FStretch := True;
  FProportional := True;
  FIndiceAtual := 0;
  FListaImagens := TStringList.Create;
  FProximaImagemDireita := TPicture.Create;
  FProximaImagemEsquerda := TPicture.Create;

  FMargemHorizontal := MARGEM_DEFAULT;
  FMargemVertical := MARGEM_DEFAULT;
  FMargemPorporcaoVertical := PROPORCAO_IMAGEM_PADRAO;

  FImagemPrincipal := TImage.Create(Self);
  FImagemPrincipal.Parent := Self;
  FImagemPrincipal.Align := alClient;
  FImagemPrincipal.AlignWithMargins := True;
  FImagemPrincipal.Proportional := FProportional;
  FImagemPrincipal.Stretch := FStretch;
  FImagemPrincipal.Cursor := crDefault;
  FImagemPrincipal.OnDblClick := DoPrincipalDblClick;

  if csDesigning in Self.ComponentState then
  begin
    if TFile.Exists('C:\Users\AQUASOFT\Pictures\wallpapers\FundoAqua.png') then
    begin
      FImagemPrincipal.Picture.LoadFromFile('C:\Users\AQUASOFT\Pictures\wallpapers\FundoAqua.png');
    end;
  end;

  FImagemEsquerda := TImage.Create(Self);
  FImagemEsquerda.Parent := Self;
  FImagemEsquerda.Anchors := [akLeft, akTop, akBottom];
  FImagemEsquerda.Proportional := FProportional;
  FImagemEsquerda.Stretch := FStretch;
  FImagemEsquerda.Cursor := crHandPoint;
  FImagemEsquerda.OnMouseDown := DoImageClick;

  if csDesigning in Self.ComponentState then
  begin
    if TFile.Exists('C:\Users\AQUASOFT\Pictures\wallpapers\FundoAqua 2.jpeg') then
    begin
      FImagemEsquerda.Picture.LoadFromFile('C:\Users\AQUASOFT\Pictures\wallpapers\FundoAqua 2.jpeg');
    end;
  end;

  FImagemDireita := TImage.Create(Self);
  FImagemDireita.Parent := Self;
  FImagemDireita.Proportional := FProportional;
  FImagemDireita.Stretch := FStretch;
  FImagemDireita.Cursor := crHandPoint;
  FImagemDireita.OnMouseDown := DoImageClick;

  if csDesigning in Self.ComponentState then
  begin
    if TFile.Exists('C:\Users\AQUASOFT\Pictures\wallpapers\fundo3.jpg') then
    begin
      FImagemDireita.Picture.LoadFromFile('C:\Users\AQUASOFT\Pictures\wallpapers\fundo3.jpg');
    end;
  end;

  DefineMargens;
end;

procedure TCardViewer.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Caption := '';
  ShowCaption := False;
end;

procedure TCardViewer.DefineMargens;
begin
  FImagemPrincipal.Margins.Left := (Self.Width div FMargemPorporcaoVertical);
  FImagemPrincipal.Margins.Right := (Self.Width div FMargemPorporcaoVertical);
  FImagemPrincipal.Margins.Top := FMargemHorizontal;
  FImagemPrincipal.Margins.Bottom := FMargemHorizontal;

  FImagemEsquerda.Left := FMargemVertical;
  FImagemEsquerda.Top := FImagemPrincipal.Top + (FMargemHorizontal * 2);
  FImagemEsquerda.Width := FImagemPrincipal.Width - MargemVertical;
  FImagemEsquerda.Height := FImagemPrincipal.Height - (FMargemHorizontal * 4);

  FImagemDireita.Left := (Self.Width div FMargemPorporcaoVertical) * 2;
  FImagemDireita.Top := ImagemEsquerda.Top;
  FImagemDireita.Width := ImagemEsquerda.Width;
  FImagemDireita.Height := ImagemEsquerda.Height;
end;

destructor TCardViewer.Destroy;
begin
  FListaImagens.Free;
  FProximaImagemDireita.Free;
  FProximaImagemEsquerda.Free;
  inherited;
end;

procedure TCardViewer.DoImageClick(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Sender = FImagemEsquerda then
  begin
    SelecionaImagemEsquerda;
  end;

  if Sender = FImagemDireita then
  begin
    SelecionaImagemDireita;
  end;
end;

procedure TCardViewer.DoPrincipalDblClick(Sender: TObject);
begin
  if ImagemPrincipal.Picture.Height = 0 then
    Exit;

  TfrmVisualizaCard.VisualizaPic(ImagemPrincipal.Picture);
end;

procedure TCardViewer.ExecutaCallAPI(prompt: string);
var
  RESTClient: TRESTClient;
  RESTRequest: TRESTRequest;
  RESTResponse: TRESTResponse;
  JSONBody: TJSONObject;
  OAuth2Authenticator1: TOAuth2Authenticator;
begin
  JSONBody := TJSONObject.Create;
  RESTClient := TRESTClient.Create('https://api.edenai.run/v2/image/generation');
  RESTRequest := TRESTRequest.Create(nil);
  RESTResponse := TRESTResponse.Create(nil);
  OAuth2Authenticator1 := TOAuth2Authenticator.Create(nil);
  try
    RESTRequest.Client := RESTClient;
    RESTRequest.Response := RESTResponse;
    RESTRequest.Method := TRESTRequestMethod.rmPOST;

    OAuth2Authenticator1.TokenType := TOAuth2TokenType.ttBEARER;
    var stl: TStringList := TStringList.Create;
    stl.LoadFromFile('C:\Users\AQUASOFT\Desktop\Test-Token.txt');
    OAuth2Authenticator1.AccessToken := stl.Text;
    stl.Free;

    RESTClient.Authenticator := OAuth2Authenticator1;

    JSONBody.AddPair('providers', 'openai');// deepai
    JSONBody.AddPair('resolution', '256x256');
    JSONBody.AddPair('text', prompt);
    JSONBody.AddPair('response_as_dict', TJSONBool.Create(True));
    JSONBody.AddPair('attributes_as_list', TJSONBool.Create(False));
    JSONBody.AddPair('show_original_response', TJSONBool.Create(False));
    JSONBody.AddPair('num_images', TJSONNumber.Create(3));

    RESTRequest.AddBody(JSONBody.ToString, TRESTContentType.ctAPPLICATION_JSON);

    RESTRequest.Execute;

    ExibeImagem(RESTResponse.Content);
  finally
    JSONBody.Free;
    RESTResponse.Free;
    RESTRequest.Free;
    RESTClient.Free;
    OAuth2Authenticator1.Free;
  end;
end;

procedure TCardViewer.ExibeImagem(imgJSON: string);

  procedure LoadImage(imageStr: string; pic: TPicture);
  begin
    var stmImgCode: TStringStream := TStringStream.Create(imageStr);
    var stmImgDecode: TStringStream := TStringStream.Create;
    try
      TNetEncoding.Base64.Decode(stmImgCode, stmImgDecode);
      var pngImg: TPngImage := TPngImage.Create;
      try
        stmImgDecode.Position := 0;
        pngImg.LoadFromStream(stmImgDecode);
        pic.Assign(pngImg);
      finally
        pngImg.Free;
      end;
    finally
      stmImgCode.Free;
      stmImgDecode.Free;
    end;
  end;

begin
  var op: TOpenAIRoot := TJson.JsonToObject<TOpenAIRoot>(imgJSON);
  try
    LoadImage(op.openai.Items[0].Image, ImagemPrincipal.Picture);
    LoadImage(op.openai.Items[1].Image, ImagemEsquerda.Picture);
    LoadImage(op.openai.Items[2].Image, ImagemDireita.Picture);
  finally
    op.Free;
  end;
end;

procedure TCardViewer.GeraImagemAI(prompt: string);
begin
  ExecutaCallAPI(prompt);
end;

procedure TCardViewer.Resize;
begin
  inherited;
  DefineMargens;

  FImagemPrincipal.BringToFront;
end;

procedure TCardViewer.SelecionaImagemDireita;
begin
  if FImagemDireita.Picture.Height = 0 then
  begin
    Exit;
  end;

  FProximaImagemEsquerda.Assign(FImagemEsquerda.Picture);
  FImagemEsquerda.Picture.Assign(ImagemPrincipal.Picture);
  FImagemPrincipal.Picture.Assign(ImagemDireita.Picture);
  FImagemDireita.Picture.Assign(FProximaImagemDireita);

  Inc(FIndiceAtual);
  if (FIndiceAtual < FListaImagens.Count) and
    ((FIndiceAtual + 3) < FListaImagens.Count) then
  begin
    var indice: Integer := 1;
    while not TFile.Exists(FListaImagens[FIndiceAtual - indice]) do
    begin
      FListaImagens.Delete(FIndiceAtual - indice);
      Inc(indice);
      if FListaImagens.Count = 0 then
        Exit;
    end;

    if TFile.Exists(FListaImagens[FIndiceAtual -1]) then
    begin
      CarregaImagemGenerica(FListaImagens[FIndiceAtual -1], FProximaImagemEsquerda);
    end;

    CarregaImagemGenerica(FListaImagens[FIndiceAtual + 3], FProximaImagemDireita);
  end else begin
    FProximaImagemDireita.Assign(nil);
  end;
end;

procedure TCardViewer.SelecionaImagemEsquerda;
begin
  if FImagemEsquerda.Picture.Height = 0 then
  begin
    Exit;
  end;

  FProximaImagemDireita.Assign(FImagemDireita.Picture);
  FImagemDireita.Picture.Assign(ImagemPrincipal.Picture);
  FImagemPrincipal.Picture.Assign(ImagemEsquerda.Picture);
  FImagemEsquerda.Picture.Assign(FProximaImagemEsquerda);

  Dec(FIndiceAtual);
  if (FIndiceAtual > 0) then
  begin
    var indice: Integer := 1;
    while not TFile.Exists(FListaImagens[FIndiceAtual - indice]) do
    begin
      FListaImagens.Delete(FIndiceAtual - indice);
      Dec(indice);
      if FListaImagens.Count = 0 then
        Exit;
    end;

    if TFile.Exists(FListaImagens[FIndiceAtual -1]) then
    begin
      CarregaImagemGenerica(FListaImagens[FIndiceAtual -1], FProximaImagemEsquerda);
    end;
  end else begin
    FProximaImagemEsquerda.Assign(nil);
  end;
end;

procedure TCardViewer.SetPastaImagens(const Value: string);
begin
  if FPastaImagens = Value then
  begin
    Exit;
  end;

  FPastaImagens := Value;
  if not TDirectory.Exists(FPastaImagens) then
  begin
    Exit;
  end;

  FIndiceAtual := 0;
  FListaImagens.Clear;

  //https://docwiki.embarcadero.com/CodeExamples/Sydney/en/FindFirst_(Delphi)
//  var listaImgs: TStringDynArray := TDirectory.GetFiles(FPastaImagens, '*.bmp, *.jpg, *.jpeg, *.png, *.gif');
  var listaImgs: TStringDynArray := TDirectory.GetFiles(FPastaImagens, '*.jpg');
  for var str: string in listaImgs do
  begin
    FListaImagens.Add(str);
  end;

//  FListaImagens.AddStrings(TDirectory.GetFiles(FPastaImagens, '*.jpg OR *.png', TSearchOption.soTopDirectoryOnly));
  if FListaImagens.Count = 0 then
    Exit;

  var i: Integer := 0;
  while i < 4 do
  begin
    if i > FListaImagens.Count then
    begin
      Break;
    end;

    case i of
      0: CarregaImagemEsquerda(FListaImagens[i]);
      1: CarregaImagemPrincipal(FListaImagens[i]);
      2: CarregaImagemDireita(FListaImagens[i]);
      3: CarregaImagemGenerica(FListaImagens[i], FProximaImagemDireita);
    end;

    Inc(i);
  end;
end;

procedure TCardViewer.SetProportional(const Value: Boolean);
begin
  FProportional := Value;
  FImagemPrincipal.Proportional := FProportional;
  FImagemEsquerda.Proportional := FProportional;
  FImagemDireita.Proportional := FProportional;
end;

procedure TCardViewer.SetStretch(const Value: Boolean);
begin
  FStretch := Value;
  FImagemPrincipal.Stretch := FStretch;
  FImagemEsquerda.Stretch := FStretch;
  FImagemDireita.Stretch := FStretch;
end;

end.
