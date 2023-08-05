unit Form.Relatorio.Simples;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.Relatorios.Simples, Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.Rel.CodBarra, Data.Rel.Imagens;

type
  TfrmRelatoriosSimples = class(TForm)
    Panel2: TPanel;
    ButtonExemplo: TButton;
    ButtonListaSimples: TButton;
    ButtonMainDetail: TButton;
    Panel1: TPanel;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    dtsCountry: TDataSource;
    dtsCustomer: TDataSource;
    Button1: TButton;
    ButtonCodBarra: TButton;
    ButtonLoadReport: TButton;
    procedure ButtonExemploClick(Sender: TObject);
    procedure ButtonListaSimplesClick(Sender: TObject);
    procedure ButtonMainDetailClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ButtonCodBarraClick(Sender: TObject);
    procedure ButtonLoadReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatoriosSimples: TfrmRelatoriosSimples;

implementation

{$R *.dfm}

procedure TfrmRelatoriosSimples.Button1Click(Sender: TObject);
begin
//  dmdGrupoSimples.Titulo := EditRelSimplesCaption.Text;

//  dmdRelatoriosSimples.frxReportGroupUm.Variables['Titulo'] := QuotedStr('Teste Título');
//  dmdRelatoriosSimples.frxReportGroupUm.Variables['VersaoSistema'] := QuotedStr('v1.1.5.0');
//  dmdRelatoriosSimples.frxReportGroupUm.ShowReport;

  dmdRelatoriosSimples.ExibeRelatorioGroupUm('Teste Titulo');
end;

procedure TfrmRelatoriosSimples.ButtonCodBarraClick(Sender: TObject);
begin
  dmdRelCodBarra.frxReportCodBarra.ShowReport;
end;

procedure TfrmRelatoriosSimples.ButtonExemploClick(Sender: TObject);
begin
  dmdRelatoriosSimples.frxReportExemplo.ShowReport;
end;

procedure TfrmRelatoriosSimples.ButtonListaSimplesClick(Sender: TObject);
begin
  dmdRelatoriosSimples.frxReportListaSimples.ShowReport;
end;

procedure TfrmRelatoriosSimples.ButtonLoadReportClick(Sender: TObject);
begin
  if not Assigned(dmdRelImagens) then
    Application.CreateForm(TdmdRelImagens, dmdRelImagens);

  dmdRelImagens.frxReportImagens.LoadFromFile('C:\Users\AQUASOFT\Documents\formacao2023\Relatorios\Win32\Debug\RelImagens.fr3');
  dmdRelImagens.frxReportImagens.ShowReport;
end;

procedure TfrmRelatoriosSimples.ButtonMainDetailClick(Sender: TObject);
begin
  dmdRelatoriosSimples.AjustaDados;
  dmdRelatoriosSimples.frxReportMainDetail.ShowReport;
end;

end.
