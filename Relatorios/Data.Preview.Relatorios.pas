unit Data.Preview.Relatorios;

interface

uses
  System.SysUtils, System.Classes, frCoreClasses, frxClass, frxDesgn,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, frxDBSet, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TdmdRelatorio = class(TDataModule)
    frxReportPreview: TfrxReport;
    frxDesigner: TfrxDesigner;
    memCustomer: TFDMemTable;
    dtsCustomer: TDataSource;
    memOrder: TFDMemTable;
    dtsOrder: TDataSource;
    memItems: TFDMemTable;
    dtsItems: TDataSource;
    memParts: TFDMemTable;
    dtsParts: TDataSource;
    memVendors: TFDMemTable;
    dtsVendors: TDataSource;
    frxDBCustomer: TfrxDBDataset;
    frxDBOrder: TfrxDBDataset;
    frxDBItems: TfrxDBDataset;
    frxDBParts: TfrxDBDataset;
    frxDBVendors: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdRelatorio: TdmdRelatorio;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
