unit Form.Cadastro.Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Cadastro, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.DBActns, System.Actions, Vcl.ActnList, Data.Cliente, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, Vcl.Menus;

type
  TfrmCadCliente = class(TfrmBaseCadastro)
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure dtsDadosStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

uses Data.Conexao;

// Original, agora movido para tela base
//procedure TfrmCadCliente.ActionPesquisarExecute(Sender: TObject);
//begin
////  var pesq: TfrmPesquisa := TfrmPesquisa.Create(Self);
////  pesq.QryPesquisa := DmdBase.qryDados;
////  pesq.OnLocaliza :=
////    procedure
////    begin
////      var qry: TFDQuery := TFDQuery(dtsDados.DataSet);
////      qry.Locate('ID', pesq.IDSelecionado);
////    end;
////  if pesq.ShowModal = mrOk then
////  begin
////  end;
////  pesq.Free;
//end;


procedure TfrmCadCliente.dtsDadosStateChange(Sender: TObject);
begin
  inherited;
  // Regra no Data Module
end;

//procedure TfrmCadCliente.ButtonSalvarClick(Sender: TObject);
//begin
//  inherited;
//  // Regra de negócio - Centralizada no DataModule
//
////  var valor: Double := 0;// Editar1.text;
////  if valor < 0 then
////    raise Exception.Create('O saldo não pode ser menor que zero.')
////  else if valor < 200 then
////    raise Exception.Create('Na inclusão, o saldo deve ser maior que R$ 200,00.')
////  else if valor > 20000 then
////    raise Exception.Create('O saldo não pode ser maior que R$ 20.000,00.');
//end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  DmdBase := TdmdCliente.Create(Self, dmdConexao.FDConnection);
//  DmdBase.PreencheConection();

  (DmdBase as TdmdCliente).OnDeletaCliente :=
    procedure
    begin
      TimerOpen.Enabled := True;
    end;
end;

end.
