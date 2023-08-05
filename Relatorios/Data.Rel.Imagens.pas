unit Data.Rel.Imagens;

interface

uses
  System.SysUtils, System.Classes, frCoreClasses, frxClass, frxExportImage,
  frxExportDOCX, frxExportBaseDialog, frxExportPDF;

type
  TdmdRelImagens = class(TDataModule)
    frxReportImagens: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDOCXExport1: TfrxDOCXExport;
    frxJPEGExport1: TfrxJPEGExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmdRelImagens: TdmdRelImagens;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
