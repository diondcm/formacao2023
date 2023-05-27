unit Base.Form.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.Imagens,
  System.Actions, Vcl.ActnList, Vcl.DBActns, Base.Data.Cadastro;

type
  TfrmBaseCadastro = class(TForm)
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
    BitBtn1: TBitBtn;
    ShapeSeparador: TShape;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure FormShow(Sender: TObject);
  private
    FDmdBase: TdmdBaseCadastro;
    function GetDmdBase: TdmdBaseCadastro;
  public
    property DmdBase: TdmdBaseCadastro read GetDmdBase write FDmdBase;
  end;

var
  frmBaseCadastro: TfrmBaseCadastro;

implementation

{$R *.dfm}

procedure TfrmBaseCadastro.FormShow(Sender: TObject);
begin
  DmdBase.qryDados.Open;
  dtsDados.DataSet := DmdBase.qryDados;
end;

function TfrmBaseCadastro.GetDmdBase: TdmdBaseCadastro;
begin
  Result := FDmdBase;

  if not Assigned(Result) then
  begin
    raise Exception.Create('Data module não preenchido');
  end;
end;

end.
