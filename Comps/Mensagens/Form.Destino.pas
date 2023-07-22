unit Form.Destino;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  TfrmDestino = class(TForm)
    PanelMov: TPanel;
    PanelSize: TPanel;
    procedure PanelMovMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PanelSizeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDestino: TfrmDestino;

implementation

{$R *.dfm}

procedure TfrmDestino.PanelSizeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(PanelSize.Handle, WM_SYSCOMMAND, $F001, 0);
end;

procedure TfrmDestino.PanelMovMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  PostMessage(PanelMov.Handle, WM_SYSCOMMAND, $F012, 0);
end;

end.
