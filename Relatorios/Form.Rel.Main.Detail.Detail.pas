unit Form.Rel.Main.Detail.Detail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Data.Rel.Main.Detail.Detail, Vcl.StdCtrls;

type
  TfrmMainDetailDetail = class(TForm)
    PanelControles: TPanel;
    ButtonGerar: TButton;
    procedure ButtonGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainDetailDetail: TfrmMainDetailDetail;

implementation

{$R *.dfm}

procedure TfrmMainDetailDetail.ButtonGerarClick(Sender: TObject);
begin
  dmdRelMainDetailDetail.frxReportMainDetailDetail.ShowReport;
end;

end.
