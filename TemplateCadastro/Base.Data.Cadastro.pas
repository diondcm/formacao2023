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
    { Public declarations }
  end;

//var
//  dmdBaseCadastro: TdmdBaseCadastro;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
