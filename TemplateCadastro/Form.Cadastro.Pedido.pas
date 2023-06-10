unit Form.Cadastro.Pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Base.Form.Cadastro, Data.DB, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.DBActns, System.Actions, Vcl.ActnList, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmCadPedido = class(TfrmBaseCadastro)
    Label1: TLabel;
    Splitter1: TSplitter;
    PanelDetalhes: TPanel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    dtsItens: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses Data.Pedido, Data.Conexao, Classe.Grid.Helper;

procedure TfrmCadPedido.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  DBGrid1.IndexaPorField(Column);
end;

procedure TfrmCadPedido.FormCreate(Sender: TObject);
begin
  inherited;
  DmdBase := TdmdPedido.Create(Self, dmdConexao.FDConnection);
  dtsItens.DataSet := (DmdBase as TdmdPedido).qryItens;
end;

end.
