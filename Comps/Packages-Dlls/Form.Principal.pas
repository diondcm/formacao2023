unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    PanelDLL: TPanel;
    PanelPackage: TPanel;
    LabelTotal: TLabel;
    Label1: TLabel;
    Button1: TButton;
    MemoLog: TMemo;
    EditValor: TEdit;
    ButtonGetValor: TButton;
    ButtonSetValor: TButton;
    ButtonLoad: TButton;
    ButtonFree: TButton;
    ButtonDobro: TButton;
    EditValorPkg: TEdit;
    ButtonGeraQuadrado: TButton;
    ButtonValMin: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ButtonSetValorClick(Sender: TObject);
    procedure ButtonGetValorClick(Sender: TObject);
    procedure ButtonLoadClick(Sender: TObject);
    procedure ButtonFreeClick(Sender: TObject);
    procedure ButtonDobroClick(Sender: TObject);
    procedure ButtonGeraQuadradoClick(Sender: TObject);
    procedure ButtonValMinClick(Sender: TObject);
  private
    { Private declarations }
    FhandleDLL: NativeUInt;
  public
    { Public declarations }
  end;


  procedure RetornaDobro(const valor: Integer; var dobro: Integer);

var
  Form1: TForm1;

implementation

{$R *.dfm}

   procedure RetornaDobro; external 'GeraToken.dll' delayed; // S� funciona pra 32 bits


procedure TForm1.Button1Click(Sender: TObject);
type
  TGeraTokenNumerico = function (p1: Integer): Integer; stdcall;
  TMaiorValor = function (Valor1, Valor2: Integer): Integer;
  TRetornaDobro = procedure (const valor: Integer; var dobro: Integer);
  TSetValor = procedure (val: Integer);
  TGetValor = function: Integer;
  TGeraToken = function(p1: Integer): Boolean;
  TGeraTokenStr = function(p1: PChar): Boolean;
  TExibeValor = function (valInt: Integer; ValVar: Variant; ValStr: string): Boolean;

begin
  /// Como fazer aqui o loading din�mico:
  var handleDLL: NativeUInt := LoadLibrary('GeraToken.dll');
  try
    if handleDLL = 0 then
    begin
      raise Exception.Create('DLL n�o carregada!');
    end;

    var getToken: TGeraTokenNumerico := GetProcAddress(handleDLL, 'GeraTokenNumerico');
    if not Assigned(getToken) then
    begin
      raise Exception.Create('M�todo: "GeraTokennumerico" n�o carregado');
    end;

    var maxVal: TMaiorValor := GetProcAddress(handleDLL, 'GetMaiorValor');
    if not Assigned(maxVal) then
    begin
      raise Exception.Create('M�todo: "GetMaiorValor" n�o carregado');
    end;

    var retDobro: TRetornaDobro := GetProcAddress(handleDLL, 'RetornaDobro');
    if not Assigned(retDobro) then
    begin
      raise Exception.Create('M�todo: "RetornaDobro" n�o carregado');
    end;

    var setVal: TSetValor := GetProcAddress(handleDLL, 'SetValor');
    if not Assigned(maxVal) then
    begin
      raise Exception.Create('M�todo: "SetValor" n�o carregado');
    end;

    var getVal: TGetValor := GetProcAddress(handleDLL, 'GetValor');
    if not Assigned(@@getVal) then
    begin
      raise Exception.Create('M�todo: "GetValor" n�o carregado');
    end;

    var geraToken: TGeraToken := GetProcAddress(handleDLL, 'GeraToken');
    if not Assigned(@@geraToken) then
    begin
      raise Exception.Create('M�todo: "GeraToken" n�o carregado');
    end;

    var geraTokenStr: TGeraTokenStr := GetProcAddress(handleDLL, 'GeraNovoTokenString');
    if not Assigned(@geraTokenStr) then
    begin
      raise Exception.Create('M�todo: "GeraNovoTokenString" n�o carregado');
    end;

    var exibeValor: TExibeValor := GetProcAddress(handleDLL, 'ExibeValor');
    if not Assigned(@@geraToken) then
    begin
      raise Exception.Create('M�todo: "ExibeValor" n�o carregado');
    end;

//    ExibeValor(123, '456', '789');
//    geraToken(Random(1000));
    var str: string := 'Teste: ' + TimeToStr(Now);
    geraTokenStr(PChar(str));

    // D7 - Ansi -> 1 byte por char
    // 2010 - Unicode -> 2 bytes por char

//    MemoLog.Lines.Insert(0, IntToStr(getToken(47398324)));
//    MemoLog.Lines.Insert(0, IntToStr(maxVal(Random(100), Random(10000))));

//    setVal(StrToIntDef(EditValor.Text, -1));
//    MemoLog.Lines.Insert(0, 'Val: ' + IntToStr(getVal()));

  finally
    FreeLibrary(handleDLL);
  end;
end;

procedure TForm1.ButtonDobroClick(Sender: TObject);
begin
  var valRetrno: Integer := 0;
  RetornaDobro(StrToIntDef(EditValor.Text, 1), valRetrno);
  MemoLog.Lines.Insert(0, IntToStr(valRetrno));
end;

procedure TForm1.ButtonFreeClick(Sender: TObject);
begin
  FreeLibrary(FHandleDLL);
end;

procedure TForm1.ButtonGeraQuadradoClick(Sender: TObject);
type
  TGeraQuadrado = procedure(valor: Integer; var quad: Integer);
  TGetValorMin = function(val1, val2: Integer): Integer;

begin
  /// Como fazer aqui o loading din�mico:
  var handleDLL: NativeUInt := LoadPackage('C:\Users\Public\Documents\Embarcadero\Studio\22.0\Bpl\pkgGeraToken.bpl');
  try
    if handleDLL = 0 then
    begin
      raise Exception.Create('Pkg n�o carregada!');
    end;

    var geraQuad: TGeraQuadrado := GetProcAddress(handleDLL, 'GeraQuadrado');
    if not Assigned(geraQuad) then
    begin
      raise Exception.Create('M�todo: "GeraQuadrado" n�o carregado');
    end;

    var getMin: TGetValorMin := GetProcAddress(handleDLL, 'GetValorMin');
    if not Assigned(getMin) then
    begin
      raise Exception.Create('M�todo: "GetValorMin" n�o carregado');
    end;

    var valorQuad: Integer;
    geraQuad(StrToIntDef(EditValorPkg.Text, -1), valorQuad);

    MemoLog.Lines.Insert(0, IntToStr(valorQuad));
    MemoLog.Lines.Insert(0, IntToStr(getMin(434, StrToIntDef(EditValorPkg.Text, -1))));

  finally
    UnloadPackage(handleDLL);
  end;
end;

procedure TForm1.ButtonGetValorClick(Sender: TObject);
type
  TGetValor = function: Integer;
//var
//  valorC: @PDouble;
begin
//  valorC^ := 10.6;

  var getVal: TGetValor := GetProcAddress(FHandleDLL, 'GetValor');
  if not Assigned(@@getVal) then
  begin
    raise Exception.Create('M�todo: "GetValor" n�o carregado');
  end;

  MemoLog.Lines.Insert(0, 'Val: ' + IntToStr(getVal()));
end;

procedure TForm1.ButtonLoadClick(Sender: TObject);
begin
  FHandleDLL:= LoadLibrary('GeraToken.dll');
end;

procedure TForm1.ButtonSetValorClick(Sender: TObject);
type
  TSetValor = procedure (val: Integer);

begin
  var setVal: TSetValor := GetProcAddress(FHandleDLL, 'SetValor');
  if not Assigned(setVal) then
  begin
    raise Exception.Create('M�todo: "SetValor" n�o carregado');
  end;

  setVal(StrToIntDef(EditValor.Text, -1));
end;

procedure TForm1.ButtonValMinClick(Sender: TObject);
type
  TGeraQuadrado = procedure(valor: Integer; var quad: Integer);
  TGetValorMin = function(val1, val2: Integer): Integer;

begin
  /// Como fazer aqui o loading din�mico:
  var handleDLL: NativeUInt := LoadPackage('C:\Users\Public\Documents\Embarcadero\Studio\22.0\Bpl\pkgGeraToken.bpl');
  try
    if handleDLL = 0 then
    begin
      raise Exception.Create('Pkg n�o carregada!');
    end;

    var geraQuad: TGeraQuadrado := GetProcAddress(handleDLL, 'GeraQuadrado');
    if not Assigned(geraQuad) then
    begin
      raise Exception.Create('M�todo: "GeraQuadrado" n�o carregado');
    end;

    var getMin: TGetValorMin := GetProcAddress(handleDLL, 'GetValorMin');
    if not Assigned(getMin) then
    begin
      raise Exception.Create('M�todo: "GetValorMin" n�o carregado');
    end;

    var valorQuad: Integer;
    geraQuad(StrToIntDef(EditValorPkg.Text, -1), valorQuad);

    MemoLog.Lines.Insert(0, IntToStr(valorQuad));
    MemoLog.Lines.Insert(0, IntToStr(getMin(434, StrToIntDef(EditValorPkg.Text, -1))));

  finally
    UnloadPackage(handleDLL);
  end;
end;

end.
