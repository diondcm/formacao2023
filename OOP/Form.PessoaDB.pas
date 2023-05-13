unit Form.PessoaDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Vcl.ExtCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCGrids, Vcl.StdCtrls, Classe.Pessoa,
  Vcl.Samples.Spin, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls;

type
  TfrmPessoaDB = class(TForm)
    DBCtrlGrid1: TDBCtrlGrid;
    memPessoa: TFDMemTable;
    dtsPessoa: TDataSource;
    PanelControles: TPanel;
    ButtonCriaPessoa: TButton;
    SpinEditPessoa: TSpinEdit;
    memPessoaCodigo: TIntegerField;
    memPessoaSaldo: TCurrencyField;
    memPessoaDataNascimento: TDateField;
    memPessoaNome: TStringField;
    memPessoaDocumento: TStringField;
    memPessoaTipoPessoa: TStringField;
    DBText1: TDBText;
    DBEdit1: TDBEdit;
    DBText2: TDBText;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    StatusBar1: TStatusBar;
    procedure ButtonCriaPessoaClick(Sender: TObject);
    procedure dtsPessoaStateChange(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaStatus;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfrmPessoaDB.AtualizaStatus;
begin
  StatusBar1.Panels[1].Text := 'Qtd Regs: ' + FormatFloat('0.,', memPessoa.RecordCount);
end;

procedure TfrmPessoaDB.ButtonCriaPessoaClick(Sender: TObject);
begin
  memPessoa.Open;
  memPessoa.EmptyDataSet;

  memPessoa.DisableControls;
  try
    for var i: Integer := 0 to SpinEditPessoa.Value -1 do
    begin
      var pes: TPessoa;

      if Random(10) div 2 = 0 then
      begin
        pes := TPessoaFisica.Create;
        TPessoaMock.GeraPessoaFisica(TPessoaFisica(pes));
      end else begin
        pes := TPessoaJuridica.Create;
        TPessoaMock.GeraPessoaJuridica(pes as TPessoaJuridica);
      end;

      // ORM - Object Relational Mapping - MOR
      memPessoa.Append;
      memPessoaCodigo.AsInteger := pes.Codigo;
  //    memPessoa.FieldByName('Codigo').AsInteger := pes.Codigo;
      memPessoaSaldo.AsCurrency := pes.Saldo;
      memPessoaDataNascimento.AsDateTime := pes.DataNascimento;

      // pes.ClassName = 'TPessoaFisica' = Não
      // pes.ClassName = TPessoaFisica.ClassName = Não
      if (pes is TPessoaFisica) then
      begin
        memPessoaNome.AsString := (pes as TPessoaFisica).Nome;
        memPessoaDocumento.AsString := (pes as TPessoaFisica).CPF;
        memPessoaTipoPessoa.AsString := 'Física';
      end else if (pes is TPessoaJuridica) then
      begin
        memPessoaNome.AsString := TPessoaJuridica(pes).NomeFantasia;
        memPessoaDocumento.AsString := TPessoaJuridica(pes).CNPJ;
        memPessoaTipoPessoa.AsString := 'Jurídica';
      end;

      memPessoa.Post;

      pes.Free;
    end;

    memPessoa.First;

    AtualizaStatus;
  finally
    memPessoa.EnableControls;
  end;
end;

procedure TfrmPessoaDB.dtsPessoaStateChange(Sender: TObject);
begin
  AtualizaStatus;
end;

end.
