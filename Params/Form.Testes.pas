unit Form.Testes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMeuNumInteger = class
  private
    FCod: Integer;
    procedure SetCod(const Value: Integer);
  public

    property Cod: Integer read FCod write SetCod;
  end;

  TfrmTestes = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function MaxValorInterno(val1, val2: Integer): Integer;
    procedure TesteButton(s: TObject);
  public
    { Public declarations }
  end;

var
  frmTestes: TfrmTestes = nil;

implementation

{$R *.dfm}

//procedure Procedural;
//begin
//  Self
//end;


procedure TfrmTestes.Button1Click(Sender: TObject);
begin
//  Self.Caption

  var  i: Integer;
  var  str: string;
  var meuInt: TMeuNumInteger := TMeuNumInteger.Create;

//  meuInt.Cod := i;

  Caption := str + ' - ' + meuInt.Cod.ToString;  //+ i.ToString;

  meuInt.Free;



  Button2.OnClick := TesteButton;
//    procedure(Sender: TObject)
//    begin
//      ShowMessage('Teste Button');
//    end;
end;

procedure TfrmTestes.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

function TfrmTestes.MaxValorInterno(val1, val2: Integer): Integer;
begin
//  MaxValorInterno := 10;

end;

procedure TfrmTestes.TesteButton(s: TObject);
begin

end;

{ TMeuNumInteger }

procedure TMeuNumInteger.SetCod(const Value: Integer {Self: TMeuNumInteger});
begin
  FCod := Value;
end;

end.
