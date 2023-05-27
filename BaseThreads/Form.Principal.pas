unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Samples.Gauges;

type
  TMathOperation = reference to function(a, b: Integer): Integer;

  TfrmPrincipal = class(TForm)
    Panel2: TPanel;
    MemoLog: TMemo;
    PanelControles: TPanel;
    ButtonAnnonimous: TButton;
    CheckBoxSel: TCheckBox;
    ButtonMath: TButton;
    Panel1: TPanel;
    EditA: TEdit;
    EditB: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    ButtonFor: TButton;
    Gauge1: TGauge;
    Gauge2: TGauge;
    Gauge3: TGauge;
    Gauge4: TGauge;
    Gauge5: TGauge;
    Gauge6: TGauge;
    Splitter1: TSplitter;
    procedure ButtonAnnonimousClick(Sender: TObject);
    procedure ButtonMathClick(Sender: TObject);
    procedure ButtonForClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExecutaAlgoPorParametro(proc: TProc);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ButtonAnnonimousClick(Sender: TObject);
var
  localProc: TProc;
begin
  localProc :=
    procedure
    begin
      ShowMessage('Teste anônimo');
    end;

  if CheckBoxSel.Checked then
  begin
    localProc :=
      procedure
      begin
        Caption := TimeToStr(Now);
      end
  end;

//  localProc;
  ExecutaAlgoPorParametro(localProc);
end;

procedure TfrmPrincipal.ButtonForClick(Sender: TObject);
const
  MAX_VAL = 800;

  function GetProcth(gauge: TGauge; rotina: TProc): TProc;
  begin
    gauge.MinValue := 0;
    gauge.MaxValue := MAX_VAL;

    Result :=
      procedure
      begin
        for var i: Integer := 0 to MAX_VAL do
        begin
          ExecutaAlgoPorParametro(rotina);

          if (i mod 7 = 0) then
          begin
            TThread.Synchronize(nil,
              procedure
              begin
                gauge.Progress := i;
              end);
          end;
        end;
      end;
  end;

begin
  // Processo pesado

//  var localProc: TProc :=
//    procedure
//    begin
//      var a, b: Integer;
//      a := 10;
//      b:= 20;
//      a := a+b;
//    end;

    var localProc: TProc :=
      procedure
      begin
        Sleep(1);
      end;

  TThread.CreateAnonymousThread(GetProcth(Gauge1, localProc)).Start;
  TThread.CreateAnonymousThread(GetProcth(Gauge2, localProc)).Start;
  TThread.CreateAnonymousThread(GetProcth(Gauge3, localProc)).Start;
  TThread.CreateAnonymousThread(GetProcth(Gauge4, localProc)).Start;
  TThread.CreateAnonymousThread(GetProcth(Gauge5, localProc)).Start;
  TThread.CreateAnonymousThread(GetProcth(Gauge6, localProc)).Start;

//    TThread.CreateAnonymousThread(
//      procedure
//      begin
//        Gauge1.MinValue := 0;
//        Gauge1.MaxValue := MAX_VAL;
//
//        for var i: Integer := 0 to MAX_VAL do
//        begin
//          ExecutaAlgoPorParametro(localProc);
//
//          if (i mod 7 = 0) then
//          begin
//            TThread.Synchronize(nil,
//              procedure
//              begin
//                Gauge1.Progress := i;
//              end);
//          end;
//        end;
//      end).Start;

//  ShowMessage('Terminou');
end;

procedure TfrmPrincipal.ButtonMathClick(Sender: TObject);

  function ExecutaOperacao(a, b: Integer; operation: TMathOperation): Integer;
  begin
    Result := operation(a, b);
  end;

var
  a, b, result: Integer;
begin
  a := StrToIntDef(EditA.Text, 0);
  b := StrToIntDef(EditB.Text, 0);

  // SOMA
  result := ExecutaOperacao(a, b,
    function(x, y: Integer): Integer
    begin
      Result := x + y;
    end
  );
  MemoLog.Lines.Add('Addition Result: ' + result.ToString);

  // Multiplicação
  result := ExecutaOperacao(a, b,
    function(x, y: Integer): Integer
    begin
      Result := x * y;
    end
  );
  MemoLog.Lines.Add('Multiplication Result: ' + result.ToString);

  // Custom
  result := ExecutaOperacao(a, b,
    function(x, y: Integer): Integer
    begin
      Result := (x * x) + (y * y);
    end
  );
  MemoLog.Lines.Add('Custom Result: ' + result.ToString);
end;

procedure TfrmPrincipal.ExecutaAlgoPorParametro(proc: TProc);
begin
  proc;
end;

end.
