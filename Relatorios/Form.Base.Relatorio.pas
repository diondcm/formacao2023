unit Form.Base.Relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frCoreClasses, frxClass;

type
  TfrmBaseRelatorio = class(TForm)
    frxReportRelatorio: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseRelatorio: TfrmBaseRelatorio;

implementation

{$R *.dfm}

end.
