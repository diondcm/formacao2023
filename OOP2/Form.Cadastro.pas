unit Form.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Classe.InfAnimal,
  Classe.Oviparos;

type
  TfrmCadastro = class(TForm)
    ButtonBaleia: TButton;
    ButtonCachorro: TButton;
    ButtonMorcego: TButton;
    ButtonGenerico: TButton;
    ButtonInterface: TButton;
    CheckBoxAddRef: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure ButtonBaleiaClick(Sender: TObject);
    procedure ButtonCachorroClick(Sender: TObject);
    procedure ButtonMorcegoClick(Sender: TObject);
    procedure ButtonGenericoClick(Sender: TObject);
    procedure ButtonInterfaceClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FInstanciaAnimal: IInfAnimal;
  public
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

uses Classe.Mamiferos, TypInfo;

procedure TfrmCadastro.ButtonGenericoClick(Sender: TObject);

  procedure Respira(classe: TMamiferoClass); // op: string: if classe = 'TCachorro'
  begin
    var obj: TMamifero := classe.Create(nil);
    obj.Respirar;
    obj.Free;
  end;

begin
  Respira(TCachorro);
  Respira(TBaleia);
  Respira(TMorcego);
end;

procedure TfrmCadastro.ButtonInterfaceClick(Sender: TObject);
begin
  var instanciaAnimal: IInfAnimal;

  instanciaAnimal := TCachorro.Create(nil);

  if instanciaAnimal is TCachorro then
  begin
    (instanciaAnimal as TCachorro).CaminhadaDia := 10;
  end;

  instanciaAnimal.Correr;

  if CheckBoxAddRef.Checked then
  begin
    FInstanciaAnimal := instanciaAnimal;
  end;

//  instanciaAnimal.free
end;

procedure TfrmCadastro.Button1Click(Sender: TObject);
begin
  FInstanciaAnimal := nil;
end;

procedure TfrmCadastro.Button2Click(Sender: TObject);
begin
//  var cachorro2: TCachorro := TCachorro.Create(Self);
  var cachorro: TCachorro := TCachorro.Create(nil);

  cachorro.Name := 'Teste';
//  cachorro2.Name := 'Teste';

  cachorro.Alimentar;

//  cachorro.Free;
//  cachorro := nil; 9
end;

type
  TComponentLocal = class(TComponent)
  end;

procedure TfrmCadastro.Button3Click(Sender: TObject);
begin
//  var obj: TComponent := TMorcego.Create(Self);
  var obj: TComponent := TForm.Create(Self);

  // IInfAnimal
//  if obj is TMamifero then // ClassName = 'fjsdhfkj'
//  if obj is TOviparo then
  var infAnimal: IInfAnimal;

  // Win32 - 32 bis
//  asm
//    MOV EAX, 8;
//
//  end;

//  ShowMessage(GuidToString(GetTypeData(TypeInfo(IInfAnimal))^.Guid));

  if TComponentLocal(obj).QueryInterface(GetTypeData(TypeInfo(IInfAnimal))^.Guid, infAnimal) = S_OK then // WN_SUCCESS { HRESULT = 0 } then
  begin
    infAnimal.Correr;
  end;// else HResult = Código de erro

  obj.Free;
end;

procedure TfrmCadastro.ButtonBaleiaClick(Sender: TObject);
const
  TEMPO_30_MIN = 1000 * 60 * 30; // 1000 = 1s * 60 m * 30 = 30 min
begin
  var baleia: TBaleia := TBaleia.Create(nil);
  baleia.Respirar(TEMPO_30_MIN);
  baleia.Free;
end;

procedure TfrmCadastro.ButtonCachorroClick(Sender: TObject);
begin
  var cachorro: TCachorro := TCachorro.Create(nil);
  cachorro.Respirar;

  cachorro.Alimentar;

  cachorro.Free;
end;

procedure TfrmCadastro.ButtonMorcegoClick(Sender: TObject);
begin
  var morcego: TMorcego := TMorcego.Create(nil);
  morcego.Respirar;
  morcego.Free;
end;

end.
