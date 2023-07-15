unit Form.Gera.Token;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmGeraToken = class(TForm)
    PanelControles: TPanel;
    ButtonToken: TButton;
    MemoLog: TMemo;
    procedure ButtonTokenClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    class function GeraToken(base: Integer): Boolean; overload; static;
    class function GeraToken(base: string): Boolean; overload; static;
  end;

implementation

{$R *.dfm}

uses System.Hash;

procedure TfrmGeraToken.ButtonTokenClick(Sender: TObject);
begin
  // Zip, Hash, JSON
  MemoLog.Lines.Add(THashSHA2.GetHashString(TimeToStr(Now)));
end;

procedure TfrmGeraToken.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Action := TCloseAction.caFree;
end;

class function TfrmGeraToken.GeraToken(base: string): Boolean;
begin
  var frm: TfrmGeraToken := TfrmGeraToken.Create(nil);
  try
//    frm.Show;
    frm.MemoLog.Text := base;
    Result := frm.ShowModal = mrOk;
    raise Exception.Create('Tem erro');
  finally
    frm.Free;
  end;
end;

class function TfrmGeraToken.GeraToken(base: Integer): Boolean;
begin
  var frm: TfrmGeraToken := TfrmGeraToken.Create(nil);
  try
//    frm.Show;
    Result := frm.ShowModal = mrOk;
  finally
    frm.Free;
  end;
end;

end.
