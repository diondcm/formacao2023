unit Form.Testa.Componentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Componente.Panel.Obrigatorio, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.WinXCalendars, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Data.Bind.Components, Data.Bind.DBScope, Classe.CalendarPickerDB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmTestaComps = class(TForm)
    memPessoa: TFDMemTable;
    memPessoaID: TIntegerField;
    memPessoaNome: TStringField;
    memPessoaDataCadastro: TDateField;
    memPessoaSaldo: TCurrencyField;
    memPessoaCPF: TStringField;
    memPessoaRG: TStringField;
    dtsPessoa: TDataSource;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    Button1: TButton;
    PanelObrigatorio1: TPanelObrigatorio;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    DBGrid1: TDBGrid;
    CalendarPickerDB1: TCalendarPickerDB;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure memPessoaBeforePost(DataSet: TDataSet);
    procedure memPessoaNewRecord(DataSet: TDataSet);
    procedure CalendarPickerDB1ChageDate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTestaComps: TfrmTestaComps;

implementation

{$R *.dfm}

procedure TfrmTestaComps.Button1Click(Sender: TObject);
begin
  PanelObrigatorio1.ValidaObrigatorios;
end;

procedure TfrmTestaComps.CalendarPickerDB1ChageDate(Sender: TObject);
begin
//  ShowMessage('Data alterada');
end;

procedure TfrmTestaComps.FormCreate(Sender: TObject);
begin
  memPessoa.Open;
end;

procedure TfrmTestaComps.memPessoaBeforePost(DataSet: TDataSet);
begin
  Caption := TimeToStr(Now);
end;

procedure TfrmTestaComps.memPessoaNewRecord(DataSet: TDataSet);
begin
  memPessoaID.AsInteger := GetTickCount;
  memPessoaDataCadastro.AsDateTime := Now;
end;

end.
