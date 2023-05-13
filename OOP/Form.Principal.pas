unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.DateUtils,
  Classe.Pessoa, Form.PessoaDB;

type
  TfrmPrincipal = class(TForm)
    PanelControles: TPanel;
    ButtonInstancia: TButton;
    MemoLog: TMemo;
    ButtonImpPessoa: TButton;
    ButtonNovaTela: TButton;
    ButtonVisualiza: TButton;
    ButtonEscopos: TButton;
    ButtonDB: TButton;
    procedure ButtonInstanciaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonImpPessoaClick(Sender: TObject);
    procedure ButtonNovaTelaClick(Sender: TObject);
    procedure ButtonVisualizaClick(Sender: TObject);
    procedure ButtonEscoposClick(Sender: TObject);
    procedure ButtonDBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  Form.Visualiza.Pessoa;

//type
//  MinhaPessoa = class(TPessoa);

procedure TfrmPrincipal.ButtonDBClick(Sender: TObject);
begin
  TfrmPessoaDB.Create(Application).Show;
end;

procedure TfrmPrincipal.ButtonEscoposClick(Sender: TObject);
begin
  var pes: TPessoa := TPessoaFisica.Create;

  pes.Codigo := 345;
//  MinhaPessoa(pes).FCodigo := -123;

  pes.Free;
end;

procedure TfrmPrincipal.ButtonImpPessoaClick(Sender: TObject);
  // nested function
//  procedure ImprimePessoa(var p: TPessoa);
//  begin
//    MemoLog.Lines.Add(format('End. mem: $%p', [@p])); // Igual: Pointer(Self)
//    MemoLog.Lines.Add('Nome: ' + p.Nome);
//    MemoLog.Lines.Add('Código: ' +  p.Codigo.ToString);
//    MemoLog.Lines.Add('');
//  end;

begin
  // Classe, Obj(Ins), Ref
  var pes1: TPessoa := nil;
  pes1:= TPessoa.Create;
//  pes1.Nome := 'Testes Primeiros';
  pes1.Codigo := 555;
  MemoLog.Lines.Add(pes1.ImprimePessoa(pes1));
  pes1.Free;

  var pes2: TPessoa := TPessoa.Create;
//  pes2.Nome := 'Alt - 2';
  pes2.Codigo := Random(1000);
  MemoLog.Lines.Add(pes2.ImprimePessoa(pes2));



  var obj: TObject := TPessoa.Create;
  var pes3: TPessoa := (obj as TPessoa); // Typecast Pascal Style
  MemoLog.Lines.Add(TPessoa(obj).ImprimePessoa(pes3)); // Typecast C-Style

//  (obj as TButton).Click;
//  TButton(obj).Click;

  obj.Free;

  pes2.Free;
end;

procedure TfrmPrincipal.ButtonInstanciaClick(Sender: TObject);
begin
  var labelTexto: TLabel := TLabel.Create(Self);
  labelTexto.Parent := PanelControles;
  labelTexto.Align := alBottom;
  labelTexto.Caption := TimeToStr(Now);

  // Classe, Obj(Ins), Ref
  var pes1: TPessoa := nil;
  var pes2: TPessoa := nil;
  MemoLog.Lines.Add(format('$%p', [@pes1]));
  MemoLog.Lines.Add(format('$%p', [@pes2]));
  pes1:= TPessoa.Create;
//  pes1.Nome := 'Testes Primeiros';
  pes1.Codigo := 555;

  // Cópia de referência, duas vars apontando para o mesmo obj
  pes2 := pes1;
  pes2.Codigo := 456;
  MemoLog.Lines.Add(pes1.Codigo.ToString);

  pes1.Free;

  pes2:= TPessoa.Create;
//  MemoLog.Lines.Add(format('$%p', [@pes2]));
//  MemoLog.Lines.Add(pes2.Nome);
  MemoLog.Lines.Add(pes2.Codigo.ToString);
//  pes2.Nome := 'Alt';
  pes2.Free;
end;

procedure TfrmPrincipal.ButtonNovaTelaClick(Sender: TObject);
begin
  var frm: TfrmPrincipal := TfrmPrincipal.Create(Application);
  frm.Show;
end;

procedure TfrmPrincipal.ButtonVisualizaClick(Sender: TObject);
begin
//  for var i: Integer := 0 to 4 do
//  begin
//    // mock
//    var pes1: TPessoaFisica := TPessoaFisica.Create;
//    TPessoaMock.GeraPessoaFisica(pes1);
//    frmVisualizaPessoa.VisualizaPessoa(pes1);
//  end;
//
//  for var i: Integer := 0 to 2 do
//  begin
//    // mock
//    var pes1: TPessoaJuridica := TPessoaJuridica.Create;
//    TPessoaMock.GeraPessoaJuridica(pes1);
//    frmVisualizaPessoa.VisualizaPessoa(pes1);
//  end;

  for var i: Integer := 0 to 9 do
  begin
    // mock
    var pes: TPessoa;

    if Random(10) div 2 = 0 then
    begin
      pes := TPessoaFisica.Create;
      TPessoaMock.GeraPessoaFisica(TPessoaFisica(pes));
    end else begin
      pes := TPessoaJuridica.Create;
      TPessoaMock.GeraPessoaJuridica(pes as TPessoaJuridica);
    end;

    frmVisualizaPessoa.VisualizaPessoa(pes);
  end;

  frmVisualizaPessoa.Show;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

end.
