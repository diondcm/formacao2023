unit Form.Params.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  PMeuRec = ^TMeuRec;
  TMeuRec = record
    ID: Integer;
  end;

  TfrmParamsPrincipal = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamsPrincipal: TfrmParamsPrincipal;

implementation

{$R *.dfm}

procedure TfrmParamsPrincipal.Button1Click(Sender: TObject);

  function GeraRec: TMeuRec;
  begin
    Result.ID := 534;
  end;

begin
  var prec: PMeuRec;
  prec := @GeraRec;

  var mr: TMeuRec;
  prec := @mr;
end;

procedure TfrmParamsPrincipal.Button2Click(Sender: TObject);
begin
  var prec: PMeuRec;
  New(prec);
  Dispose(prec); // Sem Dispose -> Gera leak!
end;

procedure TfrmParamsPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
