unit Data.Rel.Main.Detail.Detail;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frCoreClasses, frxClass, frxDBSet;

type
  TdmdRelMainDetailDetail = class(TDataModule)
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
    frxReportMainDetailDetail: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdRelMainDetailDetail: TdmdRelMainDetailDetail;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
