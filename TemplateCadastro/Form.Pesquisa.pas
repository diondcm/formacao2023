unit Form.Pesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPesquisa = class(TForm)
    PanelPesquisar: TPanel;
    EditPesquisar: TButtonedEdit;
    DBGridPesquisa: TDBGrid;
    PanelControles: TPanel;
    StatusBar1: TStatusBar;
    dtsPesquisa: TDataSource;
    ButtonCancelar: TBitBtn;
    ButtonSelecionar: TBitBtn;
    procedure dtsPesquisaStateChange(Sender: TObject);
    procedure EditPesquisarRightButtonClick(Sender: TObject);
    procedure EditPesquisarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonSelecionarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FQryPesquisa: TFDQuery;
    FTotalRegistros: Integer;
    FIDSelecionado: Integer;
    FOnLocaliza: TProc<Integer>;
    procedure AtualizaNumeroRegistros;
    procedure SetQryPesquisa(const Value: TFDQuery);
  public
    property QryPesquisa: TFDQuery read FQryPesquisa write SetQryPesquisa;
    property IDSelecionado: Integer read FIDSelecionado write FIDSelecionado;
    property OnLocaliza: TProc<Integer> read FOnLocaliza write FOnLocaliza;
    class procedure PesquisarRegistroPorID(qryBase: TFDQuery; AOnLocaliza: TProc<Integer>);
  end;

implementation

{$R *.dfm}

uses Data.Imagens, Classe.Textos;

{ TfrmPesquisa }

procedure TfrmPesquisa.AtualizaNumeroRegistros;
begin
  if dtsPesquisa.DataSet.IsEmpty then
  begin
    StatusBar1.Panels[2].Text := SEM_REGISTROS_STR;
  end else begin
    StatusBar1.Panels[2].Text := 'Totais: ' + FormatFloat('0.,', dtsPesquisa.DataSet.RecordCount) + ' registro(s)';
  end;
end;

procedure TfrmPesquisa.ButtonSelecionarClick(Sender: TObject);
begin
  if FQryPesquisa.IsEmpty then
  begin
    raise Exception.Create('Selecione um registro');
  end;

  FIDSelecionado := QryPesquisa.FieldByName('ID').AsInteger;
  QryPesquisa.First;

  if Assigned(FOnLocaliza) then
  begin
    FOnLocaliza(FIDSelecionado);
  end;
end;

procedure TfrmPesquisa.dtsPesquisaStateChange(Sender: TObject);
begin
  AtualizaNumeroRegistros;
end;

procedure TfrmPesquisa.EditPesquisarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    EditPesquisarRightButtonClick(Sender);
  end;
end;

procedure TfrmPesquisa.EditPesquisarRightButtonClick(Sender: TObject);
begin
//  QryPesquisa.Filtered := False;
//  QryPesquisa.Filter := 'UPPER(NOME) LIKE ' + QuotedStr('%' + UpperCase(EditPesquisar.Text) + '%'); // Lento
//  QryPesquisa.Filtered := True;

  var filtro: string := '';
  var pesquisar: string := UpperCase(EditPesquisar.Text);
  var pesquisarInt: Integer := StrToIntDef(EditPesquisar.Text, -1);

  for var i: Integer := 0 to QryPesquisa.FieldCount - 1 do
  begin
    if QryPesquisa.Fields[i].DataType in [ftString, ftWideString] then
    begin
      filtro := filtro + Format('(UPPER(%s) LIKE ''%%%s%%'') OR ', [QryPesquisa.Fields[i].FieldName, pesquisar]);
    end else begin
      if pesquisarInt = -1 then
        Continue;

      if QryPesquisa.Fields[i].DataType in [ftInteger, ftSmallint, ftWord, ftAutoInc, ftLargeint] then
      begin
        filtro := filtro + Format('(%s = %d) OR ', [QryPesquisa.Fields[i].FieldName, pesquisarInt]);
      end;

      if QryPesquisa.Fields[i].DataType in [ftFloat, ftCurrency, ftBCD] then
      begin
        filtro := filtro + Format('(%s = %d) OR ', [QryPesquisa.Fields[i].FieldName, pesquisarInt]);
      end;
    end;
  end;

  if filtro <> '' then
    SetLength(filtro, Length(filtro) - 4);

  QryPesquisa.Filtered := False;
  QryPesquisa.Filter := filtro; // Lento
  QryPesquisa.Filtered := True;

  if FTotalRegistros = QryPesquisa.RecordCount then
  begin
    StatusBar1.Panels[1].Text := '';
  end else begin
    if dtsPesquisa.DataSet.IsEmpty then
    begin
      StatusBar1.Panels[1].Text := SEM_REGISTROS_STR;
    end else begin
      StatusBar1.Panels[1].Text := 'Filtrados: ' + FormatFloat('0.,', dtsPesquisa.DataSet.RecordCount) + ' registro(s)';
    end;
  end;

//  QryPesquisa.Locate() // Mais lento

//  Para loops usar:
//  QryPesquisa.FindKey() // Mais rapido
//  QryPesquisa.SetRange[] // Mair rapido vários
end;

procedure TfrmPesquisa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FQryPesquisa.Filtered := False;
  FQryPesquisa.Filter := '';
end;

class procedure TfrmPesquisa.PesquisarRegistroPorID(qryBase: TFDQuery; AOnLocaliza: TProc<Integer>);
begin
  var pesq: TfrmPesquisa := TfrmPesquisa.Create(nil);
  try
    pesq.QryPesquisa := qryBase;
    pesq.OnLocaliza := AOnLocaliza;
    pesq.ShowModal;
  finally
    pesq.Free;
  end;
end;

procedure TfrmPesquisa.SetQryPesquisa(const Value: TFDQuery);
begin
  FQryPesquisa := Value;
  dtsPesquisa.DataSet := Value;
  FTotalRegistros := FQryPesquisa.RecordCount;
end;

end.
