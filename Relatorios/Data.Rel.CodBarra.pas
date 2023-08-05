unit Data.Rel.CodBarra;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, frxClass, frCoreClasses, frxDBSet,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmdRelCodBarra = class(TDataModule)
    memItens: TFDMemTable;
    frxDBDataset2: TfrxDBDataset;
    frxReportCodBarra: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdRelCodBarra: TdmdRelCodBarra;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
