unit Form.TesteArray;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Generics.Collections;

type
  TfrmTesteArray = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure ProcQueRequerArrayCom3Strings(lista: array of string);
  public
    { Public declarations }
  end;

var
  frmTesteArray: TfrmTesteArray;

implementation

{$R *.dfm}

procedure TfrmTesteArray.Button1Click(Sender: TObject);
type
  TArrayLocal = array [0..2] of Integer;

var
  arr: array [0..2] of string;
  arrInt: array [0..2] of Integer;

  arrIntForm: array [0..(1+(2+1+(5-5)))] of Integer;

  arrDyn: array of Boolean;

  arrDyn2: array [0..0] of TDate;

  arrMul: array of array of Integer;
  arrMulMul: array of array of array of array of Integer;

  function GetArray: TArrayLocal;
  begin

  end;

begin

  var localArray: TArrayLocal;
  localArray[0] := 54894;

//  var arr: array [0..2] of string;

  // 'Val1', 'Val2', 'Val3'
  arr[0] := 'Val1'; // ...

  arrInt[0] := 4323;
  arrIntForm[0] := 343;

//  arrIntForm[5]

//  var i: Integer := 5;
//  arr[i] := '';
  SetLength(arrDyn, 4);
  arrDyn[0] := False;

  arrDyn2[0] := Now;
  Caption := IntToStr(Length(arrDyn2));

//  SetLength(arrDyn2, 2); // Retorno de function
//  arrDyn2[0] := Now;

  SetLength(arrMul, 2);
  SetLength(arrMul[0], 2);
  SetLength(arrMul[1], 2);

  SetLength(arrMulMul, 2);
end;

type
  TArrDyn<T> = array of array of T;

procedure TfrmTesteArray.Button2Click(Sender: TObject);
var
  arrString: TArray<string>;
//  arrInt: TArrDyn<Integer>;
  listaString: TList<string>;
begin
  SetLength(arrString, 3);
  arrString[0] := Self.Caption;
  arrString[1] := 'fwrw';
  arrString[2] := Self.Name;


  for var i: Integer := 0 to Length(arrString) -1 do
  begin
//    SetLength(arrString)
  end;

   arrString[2]


  listaString := TList<string>.Create();
  listaString.Add(Self.Caption);
  listaString.Add('fwrw');
  listaString.Add(Self.Name);
//  listaString.Remove(Self.Caption);

  for var linha: string in listaString do
  begin
    //
  end;

  ProcQueRequerArrayCom3Strings(arrString);
  ProcQueRequerArrayCom3Strings(listaString.ToArray);

  listaString.Free;
end;

procedure TfrmTesteArray.ProcQueRequerArrayCom3Strings(lista: array of string);
begin

end;

end.
