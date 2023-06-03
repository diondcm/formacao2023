unit Form.TestHelper;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.Zip,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.StrUtils, System.Generics.Collections;

type
  TStringHelperLocal = record helper for string
  private
//    FID: Integer;
  public
    function Reverse: string;
    procedure Avisar;
  end;

  TGUIDHelperLocal = record helper for TGUID
  private
    class function NewGuidToString: string; static;
  end;

  TfrmTestHelper = class(TForm)
    MemoLog: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    ButtonUnZip: TButton;
    ButtonZip: TButton;
    ButtonAviso: TButton;
    Panel2: TPanel;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ButtonUnZipClick(Sender: TObject);
    procedure ButtonZipClick(Sender: TObject);
    procedure ButtonAvisoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTestHelper: TfrmTestHelper;

implementation

{$R *.dfm}

uses Classe.ZipHelper;

procedure TfrmTestHelper.Button1Click(Sender: TObject);
begin
  var str: string := 'Novo teste';
  MemoLog.Lines.Add(str.Reverse)// ReverseString(str))
end;

{ TStringHelperLocal }

procedure TStringHelperLocal.Avisar;
begin
  Application.MessageBox(PChar(Self), 'Aviso!', MB_DEFBUTTON1 + MB_OK + MB_ICONINFORMATION);
end;

function TStringHelperLocal.Reverse: string;
begin
  Result := ReverseString(Self);
end;

procedure TfrmTestHelper.ButtonZipClick(Sender: TObject);
begin
  var stl: TStringList := TStringList.Create;

  stl.Add('C:\Users\AQUASOFT\Documents\formacao2023\Helpers\Win32\Debug\Classe.ZipHelper.dcu');
  stl.Add('C:\Users\AQUASOFT\Documents\formacao2023\Helpers\Win32\Debug\Form.TestHelper.dcu');
  stl.Add('C:\Users\AQUASOFT\Documents\formacao2023\Helpers\Win32\Debug\TestHelper.exe');

  TZipFile.ZipparArquivos('Exe-Files.zip', stl.ToStringArray);

  stl.Free;
end;

procedure TfrmTestHelper.Button2Click(Sender: TObject);
begin
  MemoLog.Lines.Add(TGUID.NewGuidToString);
end;

procedure TfrmTestHelper.Button3Click(Sender: TObject);
begin
  {TODO -oDion -cTeste : Alteração necessária}

  var intList: TList<Integer> := TList<Integer>.Create;

  for var i: Integer := 0 to 10000 do
  begin
    Randomize;
    intList.Add(Random(10000)); // Integer.MaxValue
  end;

  MemoLog.Lines.BeginUpdate;
  try
    for var num: Integer in intList do
    begin
      if MemoLog.Lines.IndexOf(num.ToString) > -1 then
      begin
        ShowMessage('Duplicado');
      end;

      MemoLog.Lines.Add(num.ToString)
    end;
  finally
    MemoLog.Lines.EndUpdate;
  end;

  intList.Free;
end;

procedure TfrmTestHelper.ButtonAvisoClick(Sender: TObject);
begin
  'Este é um aviso!'.Avisar;
end;

procedure TfrmTestHelper.ButtonUnZipClick(Sender: TObject);
const
  ARQ = 'C:\Users\AQUASOFT\Documents\formacao2023\Helpers\Win32\Debug\LICENSE.zip';
//  ARQ = 'LICENSE.zip';
begin
//  var zip: TZipFile := TZipFile.Create;
//  try
//    zip.Open(ARQ, zmRead);
//    zip.ExtractAll('lic');
//  finally
//    zip.Free;
//  end;

  TZipFile.DesZippaArquivos(ARQ, 'lic');
end;

{ TGUIDHelperLocal }

class function TGUIDHelperLocal.NewGuidToString: string;
begin
  var guidTmp: TGuid;
  if CreateGUID(guidTmp) <> S_OK then
    RaiseLastOSError;

  Result := GuidToString(guidTmp);

  Result := StringReplace(Result, '-', '', [rfReplaceAll]);
  Result := StringReplace(Result, '{', '', [rfReplaceAll]);
  Result := StringReplace(Result, '}', '', [rfReplaceAll]);
end;

end.
