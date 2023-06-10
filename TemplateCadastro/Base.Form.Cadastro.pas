unit Base.Form.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.Imagens,
  System.Actions, Vcl.ActnList, Vcl.DBActns, Base.Data.Cadastro,
  Classe.Mensagens, Classe.Textos, Base.Form, Vcl.Menus, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmBaseCadastro = class(TfrmBase)
    PanelControles: TPanel;
    PageControlCadastro: TPageControl;
    TabPesquisa: TTabSheet;
    TabCadastro: TTabSheet;
    DBGridCadastro: TDBGrid;
    dtsDados: TDataSource;
    ActionListCadastro: TActionList;
    DatasetFirst1: TDataSetFirst;
    DatasetPrior1: TDataSetPrior;
    DatasetNext1: TDataSetNext;
    DatasetLast1: TDataSetLast;
    DatasetInsert1: TDataSetInsert;
    DatasetDelete1: TDataSetDelete;
    DatasetEdit1: TDataSetEdit;
    DatasetPost1: TDataSetPost;
    DatasetCancel1: TDataSetCancel;
    DatasetRefresh1: TDataSetRefresh;
    ButtonUltimo: TBitBtn;
    ShapeSeparador: TShape;
    ButtonInserir: TBitBtn;
    ButtonSalvar: TBitBtn;
    ButtonPrimeiro: TBitBtn;
    ButtonAnterior: TBitBtn;
    ButtonProximo: TBitBtn;
    ButtonCancelar: TBitBtn;
    ButtonEditar: TBitBtn;
    ButtonDeltar: TBitBtn;
    TimerOpen: TTimer;
    PopupMenuNavegacao: TPopupMenu;
    Inserir1: TMenuItem;
    Editar1: TMenuItem;
    N1: TMenuItem;
    Primeiro1: TMenuItem;
    ltimo1: TMenuItem;
    N2: TMenuItem;
    Deletar1: TMenuItem;
    ActionPesquisar: TAction;
    N3: TMenuItem;
    Pesquisar1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure DatasetDelete1Execute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerOpenTimer(Sender: TObject);
    procedure dtsDadosStateChange(Sender: TObject);
    procedure DBGridCadastroDblClick(Sender: TObject);
    procedure DBGridCadastroTitleClick(Column: TColumn);
    procedure ActionPesquisarExecute(Sender: TObject);
  private
    FDmdBase: TdmdBaseCadastro;
    function GetDmdBase: TdmdBaseCadastro;
    procedure AtualizaNumeroRegistros;
  public
    property DmdBase: TdmdBaseCadastro read GetDmdBase write FDmdBase;
  end;

//var
//  frmBaseCadastro: TfrmBaseCadastro;

implementation

{$R *.dfm}

uses Classe.Grid.Helper, Form.Pesquisa;

procedure TfrmBaseCadastro.ActionPesquisarExecute(Sender: TObject);
begin
  TfrmPesquisa.PesquisarRegistroPorID(DmdBase.qryDados,
    procedure(ID: Integer)
    begin
      var qry: TFDQuery := TFDQuery(dtsDados.DataSet);
      qry.Locate('ID', ID);
    end);
end;

procedure TfrmBaseCadastro.AtualizaNumeroRegistros;
begin
  if dtsDados.DataSet.IsEmpty then
  begin
    StatusBar1.Panels[2].Text := SEM_REGISTROS_STR;
  end else begin
    StatusBar1.Panels[2].Text := FormatFloat('0.,', dtsDados.DataSet.RecordCount) + ' registro(s)';
  end;
end;

procedure TfrmBaseCadastro.DatasetDelete1Execute(Sender: TObject);
begin
  if TMensagem.Confirmacao(CONFIRMA_DELECAO_STR) then
  begin
    dtsDados.DataSet.Delete;
  end;
end;

procedure TfrmBaseCadastro.DBGridCadastroDblClick(Sender: TObject);
begin
  if not dtsDados.DataSet.IsEmpty then
  begin
    DatasetEdit1.Execute;
  end;
end;

procedure TfrmBaseCadastro.DBGridCadastroTitleClick(Column: TColumn);
begin
  inherited;
  DBGridCadastro.IndexaPorField(Column);
end;

procedure TfrmBaseCadastro.dtsDadosStateChange(Sender: TObject);
begin
  AtualizaNumeroRegistros;
  case dtsDados.DataSet.State of
    dsBrowse: PageControlCadastro.ActivePage := TabPesquisa;
    dsEdit,
    dsInsert,
    dsSetKey: PageControlCadastro.ActivePage := TabCadastro;
  end;
end;

procedure TfrmBaseCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TfrmBaseCadastro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if dtsDados.DataSet.State in dsEditModes then // [dsEdit, dsInsert]
  begin
    CanClose := TMensagem.Confirmacao(TTextosSistema.CONFIRMA_SAIDA_CAD);
    if CanClose then
    begin
      dtsDados.DataSet.Cancel;
    end;
  end;
end;

procedure TfrmBaseCadastro.FormShow(Sender: TObject);
begin
  dtsDados.DataSet := DmdBase.qryDados;

  PageControlCadastro.ActivePage := TabPesquisa;

  TimerOpen.Enabled := True;
end;

function TfrmBaseCadastro.GetDmdBase: TdmdBaseCadastro;
begin
  Result := FDmdBase;
  if not Assigned(Result) then
  begin
    raise Exception.Create('Data module não preenchido');
  end;
end;

procedure TfrmBaseCadastro.TimerOpenTimer(Sender: TObject);
begin
  TimerOpen.Enabled := False;

  DmdBase.qryDados.Close;
  DmdBase.qryDados.Open;
  AtualizaNumeroRegistros;
end;

end.
