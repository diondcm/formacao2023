unit Form.QrCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmQrCode = class(TForm)
    PanelControles: TPanel;
    EditDados: TEdit;
    ButtonGerarQrCode: TButton;
    ImageQrCode: TImage;
    procedure ButtonGerarQrCodeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQrCode: TfrmQrCode;

implementation

{$R *.dfm}

uses Classe.QrCode, Vcl.Imaging.pngimage;

procedure TfrmQrCode.ButtonGerarQrCodeClick(Sender: TObject);
begin
  var stm: TMemoryStream := TMemoryStream.Create;
  TQrCode.Gerar(EditDados.Text, stm);

  if stm.Size > 0 then
  begin
    var Png: TPngImage := TPngImage.Create;
    stm.Position := 0;
    Png.LoadFromStream(stm);
    ImageQrCode.Picture.Assign(png);

    Png.Free;
  end;

  stm.Free;
end;

end.
