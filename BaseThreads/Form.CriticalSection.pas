unit Form.CriticalSection;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.SyncObjs,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Generics.Collections;

type
  TfrmCriticalSection = class(TForm)
    Panel1: TPanel;
    ButtonPrimos: TButton;
    MemoPrimos: TMemo;
    TimerListaNumeros: TTimer;
    procedure ButtonPrimosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TimerListaNumerosTimer(Sender: TObject);
  private
    class var
      FPrimeNumbers: TList<Integer>;
    class function GetPrimeNumbers: TList<Integer>; static;
    class procedure SetPrimeNumbers(const Value: TList<Integer>); static;
  private
    FCriticalSection: TCriticalSection;
  public
    class property PrimeNumbers: TList<Integer> read GetPrimeNumbers write SetPrimeNumbers;
  end;

  TPrimeNumberThread = class(TThread)
  private
    FStart, FEnd: Integer;
    FProcAddSync: TProc<Integer>;
//    FPrimeNumbers: TList<Integer>;
    procedure GeneratePrimeNumbers;
  protected
    procedure Execute; override;
  public
    constructor Create(Start, End_: Integer; procAddSync: TProc<Integer>);
    destructor Destroy; override;
//    property PrimeNumbers: TList<Integer> read FPrimeNumbers;
  end;

var
  frmCriticalSection: TfrmCriticalSection;

implementation

{$R *.dfm}

{ TPrimeNumberThread }

constructor TPrimeNumberThread.Create(Start, End_: Integer; procAddSync: TProc<Integer>);
begin
  inherited Create(False);
  FStart := Start;
  FEnd := End_;
  FProcAddSync := procAddSync;
//  FPrimeNumbers := TList<Integer>.Create;
end;

destructor TPrimeNumberThread.Destroy;
begin
//  FPrimeNumbers.Free;
  inherited;
end;

procedure TPrimeNumberThread.Execute;
begin
  GeneratePrimeNumbers;
end;

procedure TPrimeNumberThread.GeneratePrimeNumbers;
var
  I, J: Integer;
  IsPrime: Boolean;
begin
  for I := FStart to FEnd do
  begin
    IsPrime := True;
    Sleep(10);
    for J := 2 to I - 1 do
    begin
      if I mod J = 0 then
      begin
        IsPrime := False;
        Break;
      end;
    end;
    if IsPrime then
    begin
      if Assigned(FProcAddSync) then
      begin
        FProcAddSync(I);
      end;

      // potecial AV
//      TfrmCriticalSection.PrimeNumbers.Add(I)
    end;
//      FPrimeNumbers.Add(I);
  end;
end;

procedure TfrmCriticalSection.ButtonPrimosClick(Sender: TObject);
var
  procAdd: TProc<Integer>;
begin
  procAdd := 
    procedure(NumPrimo: Integer)
    begin
      FCriticalSection.Acquire;
      try
        { Região safe, sem conflito das threads }
        PrimeNumbers.Add(NumPrimo);
        //Sleep(10000);
      finally
        FCriticalSection.Leave;
      end;
    end;

  TPrimeNumberThread.Create(1, 100, procAdd);
  TPrimeNumberThread.Create(101, 200, procAdd);
  TPrimeNumberThread.Create(201, 300, procAdd);
  TPrimeNumberThread.Create(301, 400, procAdd);
  TPrimeNumberThread.Create(401, 500, procAdd);
  TPrimeNumberThread.Create(501, 600, procAdd);
  TPrimeNumberThread.Create(601, 700, procAdd);
  TPrimeNumberThread.Create(701, 1000, procAdd);
end;

procedure TfrmCriticalSection.FormCreate(Sender: TObject);
begin
  FCriticalSection := TCriticalSection.Create;
end;

procedure TfrmCriticalSection.FormDestroy(Sender: TObject);
begin
  FCriticalSection.Free;
end;

class function TfrmCriticalSection.GetPrimeNumbers: TList<Integer>;
begin
  // Singleton design pattern
  if not Assigned(FPrimeNumbers) then
    FPrimeNumbers := TList<Integer>.Create;
  
  Result := FPrimeNumbers;
end;

class procedure TfrmCriticalSection.SetPrimeNumbers(const Value: TList<Integer>);
begin

end;

procedure TfrmCriticalSection.TimerListaNumerosTimer(Sender: TObject);
var
  num: Integer;
begin
  if MemoPrimos.Lines.Count <> PrimeNumbers.Count then
  begin
    MemoPrimos.Clear;
    for num in PrimeNumbers do
    begin
     MemoPrimos.Lines.Add(num.ToString); 
    end;
  end;
end;

end.
