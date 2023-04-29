unit Form.Corversor;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts;

type
  TfrmConversorMoeda = class(TForm)
    Layout1: TLayout;
    Label1: TLabel;
    Layout2: TLayout;
    Layout3: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    EditReal: TEdit;
    EditDolar: TEdit;
    procedure EditRealKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure EditDolarKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConversorMoeda: TfrmConversorMoeda;

implementation

{$R *.fmx}

uses Classe.Conversor.Moeda;

procedure TfrmConversorMoeda.EditDolarKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
  begin
    EditReal.Text := TConversorMoeda.DolarParaReal(EditDolar.Text);
  end;
end;

procedure TfrmConversorMoeda.EditRealKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = vkReturn then
  begin
//  EditDolar.Text := FloatToStr(StrToFloat(EditReal.Text) / 5);
//  EditDolar.Text := FloatToStr(TConversorMoeda.RealParaDolar(StrToFloat(EditReal.Text)));
    EditDolar.Text := TConversorMoeda.RealParaDolar(EditReal.Text);
  end;
end;

end.
