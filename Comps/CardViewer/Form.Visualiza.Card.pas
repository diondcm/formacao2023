unit Form.Visualiza.Card;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmVisualizaCard = class(TForm)
    ImagePreview: TImage;
    PanelControles: TPanel;
    CheckBoxProportional: TCheckBox;
    CheckBoxStretch: TCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CheckBoxProportionalClick(Sender: TObject);
    procedure CheckBoxStretchClick(Sender: TObject);
  private
    { Private declarations }
  public
    class procedure VisualizaPic(pic: TPicture);
  end;

implementation

{$R *.dfm}

procedure TfrmVisualizaCard.CheckBoxProportionalClick(Sender: TObject);
begin
  ImagePreview.Proportional := CheckBoxProportional.Checked;
end;

procedure TfrmVisualizaCard.CheckBoxStretchClick(Sender: TObject);
begin
  ImagePreview.Stretch := CheckBoxStretch.Checked;
end;

procedure TfrmVisualizaCard.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Close;
  end;
end;

class procedure TfrmVisualizaCard.VisualizaPic(pic: TPicture);
begin
  var frm: TfrmVisualizaCard := TfrmVisualizaCard.Create(nil);
  try
    frm.ImagePreview.Proportional := frm.CheckBoxProportional.Checked;
    frm.ImagePreview.Stretch := frm.CheckBoxStretch.Checked;
    frm.ImagePreview.Picture.Assign(pic);
    frm.ShowModal;
  finally
    frm.Free;
  end;
end;

end.
