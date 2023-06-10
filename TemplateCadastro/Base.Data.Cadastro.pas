unit Base.Data.Cadastro;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Conexao;

//DB Express de exemplo no repo bqse Git
type
  TdmdBaseCadastro = class(TDataModule)
    qryDados: TFDQuery;
  private
    { Private declarations }
  public
    constructor Create(AOwner: TComponent; Conn: TFDConnection); reintroduce; overload;
    procedure PreencheConection(conn: TFDConnection);
  end;

//var
//  dmdBaseCadastro: TdmdBaseCadastro;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmdBaseCadastro }

constructor TdmdBaseCadastro.Create(AOwner: TComponent; Conn: TFDConnection);
begin
  inherited Create(AOwner);
  PreencheConection(Conn);
end;

procedure TdmdBaseCadastro.PreencheConection(conn: TFDConnection);
begin
  for var i: Integer := 0 to Self.ComponentCount -1 do
  begin
    if Self.Components[i] is TFDQuery then
    begin
      TFDQuery(Self.Components[i]).Connection := conn;
    end;
  end;
end;

end.
