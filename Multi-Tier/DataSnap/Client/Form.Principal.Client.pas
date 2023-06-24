unit Form.Principal.Client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, System.JSON, REST.Json,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, Vcl.DBCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON, System.Hash, System.NetEncoding,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfrmPrincipalClient = class(TForm)
    PageControlGeral: TPageControl;
    TabJSON: TTabSheet;
    PanelControlesJSON: TPanel;
    ButtonSerealizar: TButton;
    ButtonDesserealizar: TButton;
    MemoJSON: TMemo;
    TabDataSnap: TTabSheet;
    PanelDataSnapNativo: TPanel;
    Splitter1: TSplitter;
    PanelDataSnapTJson: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    ButtonDataSnapNativoEnvia: TButton;
    MemoDataSnapNativoEnvia: TMemo;
    Panel2: TPanel;
    ButtonDataSnapNativoRecebe: TButton;
    MemoDataSnapNativoRecebe: TMemo;
    Panel3: TPanel;
    ButtonDSNaoNativoEnvia: TButton;
    MemoDSNaoNativoEnvia: TMemo;
    Panel4: TPanel;
    ButtonDSNaoNativoRecebe: TButton;
    MemoDSNaoNativoRecebe: TMemo;
    TabThreads: TTabSheet;
    Panel5: TPanel;
    ButtonCurrentThreadID: TButton;
    MemoThreads: TMemo;
    ButtonGetThreadID: TButton;
    ButtonMetodoDemorado: TButton;
    ButtonGetLog: TButton;
    TabDataSet: TTabSheet;
    memPessoa: TFDMemTable;
    Panel6: TPanel;
    DBNavigator1: TDBNavigator;
    dtsPessoa: TDataSource;
    memPessoaID: TIntegerField;
    memPessoaNome: TStringField;
    memPessoaDataNascimento: TDateTimeField;
    memPessoaRenda: TCurrencyField;
    memPessoaAtivo: TBooleanField;
    DBGrid1: TDBGrid;
    Panel7: TPanel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Panel8: TPanel;
    Label4: TLabel;
    DBGrid2: TDBGrid;
    memDelta: TFDMemTable;
    dtsDelta: TDataSource;
    Button3: TButton;
    Panel9: TPanel;
    Panel10: TPanel;
    Label5: TLabel;
    Panel11: TPanel;
    Label6: TLabel;
    Panel12: TPanel;
    Label7: TLabel;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    dtsDeletados: TDataSource;
    memDeletados: TFDMemTable;
    dtsIncluidos: TDataSource;
    memIncluidos: TFDMemTable;
    dtsAlterados: TDataSource;
    memAlterados: TFDMemTable;
    Button4: TButton;
    Button5: TButton;
    TabHash: TTabSheet;
    PanelHash: TPanel;
    MemoDados: TMemo;
    Splitter2: TSplitter;
    MemoHash: TMemo;
    Panel13: TPanel;
    Splitter3: TSplitter;
    EditSenha: TEdit;
    Button6: TButton;
    MemoRespostaHash: TMemo;
    TabListas: TTabSheet;
    MemoRetornoListas: TMemo;
    Panel14: TPanel;
    ButtonRetornoResponse: TButton;
    ButtonListaString: TButton;
    ButtonListaDataSnap: TButton;
    EditQtdPessoa: TEdit;
    IdHTTP1: TIdHTTP;
    procedure ButtonSerealizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonDesserealizarClick(Sender: TObject);
    procedure ButtonDataSnapNativoRecebeClick(Sender: TObject);
    procedure ButtonDataSnapNativoEnviaClick(Sender: TObject);
    procedure ButtonDSNaoNativoEnviaClick(Sender: TObject);
    procedure ButtonDSNaoNativoRecebeClick(Sender: TObject);
    procedure ButtonCurrentThreadIDClick(Sender: TObject);
    procedure ButtonGetThreadIDClick(Sender: TObject);
    procedure ButtonMetodoDemoradoClick(Sender: TObject);
    procedure ButtonGetLogClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure MemoDadosChange(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure ButtonListaDataSnapClick(Sender: TObject);
    procedure ButtonListaStringClick(Sender: TObject);
    procedure ButtonRetornoResponseClick(Sender: TObject);
  private
    const
      DB_PESSOA = 'DB-Pessoa.json';
  public
    { Public declarations }
  end;

var
  frmPrincipalClient: TfrmPrincipalClient;

implementation

{$R *.dfm}

uses Classe.Pessoa, ClientModuleUnit1, System.StrUtils;

procedure TfrmPrincipalClient.ButtonDataSnapNativoRecebeClick(Sender: TObject);
begin
  var pes: TPessoa := ClientModule1.ServerMethods1Client.GetPessoaNativo;

  MemoDataSnapNativoRecebe.Text := pes.ToString;

//  pes.Free; Quem Libera é o DS
end;

procedure TfrmPrincipalClient.ButtonMetodoDemoradoClick(Sender: TObject);
begin
  ClientModule1.ServerMethods1Client.GetMetodoDemorado(10000);
end;

procedure TfrmPrincipalClient.ButtonRetornoResponseClick(Sender: TObject);
begin
//  MemoRetornoListas.Text := ClientModule1.ServerMethods1Client.GetListaPessoaGeral2(StrToIntDef(EditQtdPessoa.Text, 0));
  var strStm: TStringStream := TStringStream.Create;
  try
    IdHTTP1.Get('http://192.168.15.9:8080/datasnap/rest/TServerMethods1/GetListaPessoaGeral2/' + IfThen(EditQtdPessoa.Text = '', '0', EditQtdPessoa.Text) , strStm);
    MemoRetornoListas.Text := strStm.DataString;
  finally
    strStm.Free;
  end;
end;

procedure TfrmPrincipalClient.Button1Click(Sender: TObject);
begin
  memPessoa.EmptyDataSet;
  if FileExists(DB_PESSOA) then
  begin
    memPessoa.LoadFromFile(DB_PESSOA, sfJSON);
  end;
end;

procedure TfrmPrincipalClient.Button2Click(Sender: TObject);
begin
  memPessoa.SaveToFile(DB_PESSOA, sfJSON);
end;

procedure TfrmPrincipalClient.Button3Click(Sender: TObject);
begin
  memDelta.Close;
  memDeletados.Close;
  memAlterados.Close;
  memIncluidos.Close;

  memDelta.Data := memPessoa.Delta;
  memDeletados.Data := memPessoa.Delta;
  memAlterados.Data := memPessoa.Delta;
  memIncluidos.Data := memPessoa.Delta;

  memDelta.StatusFilter := [rtModified, rtInserted, rtDeleted,
    rtUnmodified, rtHasErrors];
  memDeletados.StatusFilter := [rtDeleted];

  memAlterados.StatusFilter := [rtModified];

  memIncluidos.StatusFilter := [rtInserted];
end;

procedure TfrmPrincipalClient.Button4Click(Sender: TObject);
begin
  var strStm: TStringStream := TStringStream.Create(ClientModule1.ServerMethods1Client.GetPessoasDB);
  memPessoa.LoadFromStream(strStm, sfJSON);
  strStm.Free;
end;

procedure TfrmPrincipalClient.Button5Click(Sender: TObject);
begin
  var strStm: TStringStream := TStringStream.Create;
  memPessoa.SaveToStream(strStm, sfJSON);
  ClientModule1.ServerMethods1Client.SetPessoasDB(strStm.DataString);
  strStm.Free;
end;

procedure TfrmPrincipalClient.Button6Click(Sender: TObject);
begin
  MemoRespostaHash.Lines.Insert(0, ClientModule1.ServerMethods1Client.AutenticaUsuario(THashSHA2.GetHashString(EditSenha.Text + 'Aula 2020')));
end;

procedure TfrmPrincipalClient.ButtonCurrentThreadIDClick(Sender: TObject);
begin
  MemoThreads.Lines.Add('Current Thread ID: ' + IntToStr(GetCurrentThreadId));
end;

procedure TfrmPrincipalClient.ButtonDataSnapNativoEnviaClick(Sender: TObject);
begin
  var pessoa: TPessoa := TJson.JsonToObject<TPessoa>(MemoDataSnapNativoEnvia.Text);
  ClientModule1.ServerMethods1Client.SetPessoaNativo(pessoa);
//  pessoa.Free; Quem Libera é o DS
end;

procedure TfrmPrincipalClient.ButtonDesserealizarClick(Sender: TObject);
begin
  var pessoa: TPessoa := TJson.JsonToObject<TPessoa>(MemoJSON.Text);
  MemoJSON.Lines.Add('Pessoa');
  MemoJSON.Lines.Add('Nome: ' + pessoa.Nome);
  MemoJSON.Lines.Add('ID: ' + IntToStr(pessoa.ID));
  MemoJSON.Lines.Add('Data de Nascimento: ' + DateToStr(pessoa.DataNascimento));
  MemoJSON.Lines.Add('Renda: ' + FloatToStr(pessoa.Renda));

//  Exemplo de desserealização: (Não usar)
//  pessoa.Nome := Copy(MemoJSON.Lines[0], 10, 50);
  pessoa.Free;
end;

procedure TfrmPrincipalClient.ButtonDSNaoNativoEnviaClick(Sender: TObject);
begin
  var pes: TPessoa := TJson.JsonToObject<TPessoa>(MemoDSNaoNativoEnvia.Text);

  ClientModule1.ServerMethods1Client.SetPessoaNaoNativo(TJson.ObjectToJsonString(pes));

  pes.Free;
end;

procedure TfrmPrincipalClient.ButtonDSNaoNativoRecebeClick(Sender: TObject);
begin
  var pes: TPessoa := TJson.JsonToObject<TPessoa>(ClientModule1.ServerMethods1Client.GetPessoaNaoNativo);

  MemoDSNaoNativoRecebe.Text := pes.ToString;

  pes.Free;
end;

procedure TfrmPrincipalClient.ButtonGetLogClick(Sender: TObject);
begin
  MemoThreads.Text := ClientModule1.ServerMethods1Client.GetLog;
end;

procedure TfrmPrincipalClient.ButtonGetThreadIDClick(Sender: TObject);
begin
  MemoThreads.Lines.Insert(0, IntToStr(ClientModule1.ServerMethods1Client.GetThreadID));
end;

procedure TfrmPrincipalClient.ButtonListaDataSnapClick(Sender: TObject);
begin
  var lstPes: TListaPessoa := ClientModule1.ServerMethods1Client.GetListaPessoa(StrToIntDef(EditQtdPessoa.Text, 0));
  MemoRetornoListas.Text := TJson.ObjectToJsonString(lstPes);
end;

procedure TfrmPrincipalClient.ButtonListaStringClick(Sender: TObject);
begin
  MemoRetornoListas.Text := ClientModule1.ServerMethods1Client.GetListaPessoaGeral(StrToIntDef(EditQtdPessoa.Text, 0));
end;

procedure TfrmPrincipalClient.ButtonSerealizarClick(Sender: TObject);
begin
  var pessoa: TPessoa := TPessoa.Create;

  pessoa.ID := 23123;
  pessoa.Nome := 'Teste';
  pessoa.DataNascimento := (Now - 20);
  pessoa.Renda := 43254.90;

  //System.JSON, REST.Json
  var jsonStr: string := TJson.ObjectToJsonString(pessoa);

  MemoJSON.Lines.Add(jsonStr);

//  Exemplo de serealização:
//  MemoJSON.Lines.Add('Nome: ' + pessoa.Nome);
//  MemoJSON.Lines.Add('ID: ' + IntToStr(pessoa.ID));
//  MemoJSON.Lines.Add('Data de Nascimento: ' + DateToStr(pessoa.DataNascimento));
//  MemoJSON.Lines.Add('Renda: ' + FloatToStr(pessoa.Renda));

  pessoa.Free;
end;

procedure TfrmPrincipalClient.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;

  memPessoa.CachedUpdates := True;
  memPessoa.Open;
end;

procedure TfrmPrincipalClient.MemoDadosChange(Sender: TObject);
begin // System.Hash, System.NetEncoding
  MemoHash.Lines.Add(THashSHA2.GetHashString(MemoDados.Text));

end;

end.
