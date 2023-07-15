unit Form.RTTI;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TAtributoTabela = class(TCustomAttribute)
  private
    FTabela: string;
  public
    constructor Create(const ATabela: string);
    property Tabela: string read FTabela;
  end;

  TAtributoColuna = class(TCustomAttribute)
  private
    FColuna: string;
    FTipo: string;
  public
    constructor Create(const AColuna, ATipo: string);
    property Coluna: string read FColuna;
    property Tipo: string read FTipo write FTipo;
  end;

  [TAtributoTabela('SAP_CUSTOMER')]
  TPessoa = class
  private
    FNome: string;
    FIdade: Integer;
    FCPF: string;
  public
    constructor Create;
    procedure PrimeiraProc(p1: Boolean);
    function GetBool: Integer;
    [TAtributoColuna('NOME_PESSOA', 'VARCHAR2')]
    property Nome: string read FNome;
    [TAtributoColuna('IDADE', 'NUMBER')]
    property Idade: Integer read FIdade;
    [TAtributoColuna('CPF', 'VARCHAR2')]
    property CPF: string read FCPF write FCPF;
  end;

  TfrmTestRTTI = class(TForm)
    MemoLog: TMemo;
    procedure FormShow(Sender: TObject);
  private
    procedure ListaClasse;
    procedure GeraSQL;
  public
    { Public declarations }
  end;

var
  frmTestRTTI: TfrmTestRTTI;

implementation

{$R *.dfm}

uses
  System.TypInfo, System.Rtti;

{ TfrmTestRTTI }

procedure TfrmTestRTTI.FormShow(Sender: TObject);
begin
  ListaClasse;
  GeraSQL;
end;

procedure TfrmTestRTTI.GeraSQL;
begin
  var RttiContext: TRttiContext := TRttiContext.Create;
  var pes: TPessoa := TPessoa.Create;
  var tabela, colunas: string;
  try
    var RttiType: TRttiType := RttiContext.GetType(pes.ClassType);
    for var RttiAtr: TCustomAttribute in RttiType.GetAttributes do
    begin
      if RttiAtr is TAtributoTabela then
      begin
        tabela := (RttiAtr as TAtributoTabela).Tabela;
      end;
    end;

    for var RttiProperty: TRttiProperty in RttiType.GetProperties do
    begin
      for var RttiAtr: TCustomAttribute in RttiProperty.GetAttributes do
      begin
        if RttiAtr is TAtributoColuna then
        begin
          if colunas = '' then
          begin
            colunas := '  ' + (RttiAtr as TAtributoColuna).Coluna;
          end else begin
            colunas :=  colunas + ',' + sLineBreak + '  ' + (RttiAtr as TAtributoColuna).Coluna;
          end;
        end;
      end;
    end;
  finally
    RttiContext.Free;
  end;

  MemoLog.Lines.Add('SELECT');
  MemoLog.Lines.Add(colunas);
  MemoLog.Lines.Add('FROM ' + tabela);
end;

procedure TfrmTestRTTI.ListaClasse;
begin
  MemoLog.Lines.Add(TPessoa.ClassName);
//  MemoLog.Lines.Add('Nome: String');
//  MemoLog.Lines.Add('Idade: Integer');

  var RttiContext: TRttiContext := TRttiContext.Create;
  var pes: TPessoa := TPessoa.Create;
  try
    var RttiType: TRttiType := RttiContext.GetType(pes.ClassType);

    for var RttiProperty: TRttiProperty in RttiType.GetProperties do
    begin
      MemoLog.Lines.Add(Format('Property: %s, Type: %s, Value: %s', [RttiProperty.Name, RttiProperty.PropertyType.Name, RttiProperty.GetValue(pes).ToString]));
    end;

    for var RttiMethod: TRttiMethod in RttiType.GetDeclaredMethods do
    begin
      MemoLog.Lines.Add(Format('Method: %s, Type: %s, Qtd params: %s', [RttiMethod.Name, GetEnumName(TypeInfo(TMethodKind), Ord(RttiMethod.MethodKind)), IntToStr(Length(RttiMethod.GetParameters))]));
    end;

  finally
    RttiContext.Free;
  end;
end;

{ TPessoa }

constructor TPessoa.Create;
begin
  //
end;

function TPessoa.GetBool: Integer;
begin
  Result := 0;
end;

procedure TPessoa.PrimeiraProc(p1: Boolean);
begin

end;

{ TAtributoTabela }

constructor TAtributoTabela.Create(const ATabela: string);
begin
  FTabela := ATabela;
end;

{ TAtributoColuna }

constructor TAtributoColuna.Create(const AColuna, ATipo: string);
begin
  FColuna := AColuna;
  FTipo := ATipo;
end;

end.
