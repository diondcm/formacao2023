unit Classe.Mamiferos;

interface

uses
  Vcl.Dialogs, System.SysUtils, Vcl.Forms, System.Classes,
  Winapi.Windows, Winapi.Messages, Classe.InfAnimal, System.UITypes,
  Classe.Mensagens;

type
  TMamiferoClass = class of TMamifero;

  TMamifero = class(TComponent, IInfAnimal)
  private
    FNumeroOlhos: Integer;
    FTempoIncubacao: Integer;
  protected
    FDNA: string;
  public
    { IInfAnimal }
    function GetDNA: string;
    procedure SetDNA(const Value: string);

    procedure Correr;
    procedure Alimentar;
    procedure Respirar; overload;

    property DNA: string read GetDNA write SetDNA;
    { /IInfAnimal }

    procedure Respirar(formaRespirar: string); overload;
    property NumeroOlhos: Integer read FNumeroOlhos write FNumeroOlhos;
    property TempoIncubacao: Integer read FTempoIncubacao write FTempoIncubacao;
  end;

  TBaleia = class(TMamifero)
  private
    FTempoSubmerso: Integer;
  public
    procedure Respirar(Tempo: Integer);
    property TempoSubmerso: Integer read FTempoSubmerso write FTempoSubmerso;
  end;

  TCachorro = class(TMamifero)
  private
    FCaminhadaDia: Integer;
  public
    destructor Destroy; override;

    property CaminhadaDia: Integer read FCaminhadaDia write FCaminhadaDia;
  end;

  TMorcego = class(TMamifero)
  private
    FAltitudeVoo: Integer;
  public
    property AltitudeVoo: Integer read FAltitudeVoo write FAltitudeVoo;
  end;


implementation

{ TBaleia }

procedure TBaleia.Respirar(Tempo: Integer);
begin
  inherited Respirar('Respirar: ' + Tempo.ToString() + ' ms');
end;

{ TMamifero }

procedure TMamifero.Alimentar;
begin
  Beep(100, 500);
end;

procedure TMamifero.Correr;
begin
//  MessageDlg('Mamífero correndo!', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
  TMensagem.Aviso('Mamífero correndo!');
end;

function TMamifero.GetDNA: string;
begin
  Result := FDNA;
end;

procedure TMamifero.Respirar;
begin
  Respirar('');
end;

procedure TMamifero.Respirar(formaRespirar: string);
begin
  if formaRespirar = '' then
    formaRespirar := 'Respirar';

//  ShowMessage(Self.ClassName + ': ' + formaRespirar);
//  Application.MessageBox(PChar(Self.ClassName + ': ' + formaRespirar), 'Mamífero', MB_OK + MB_DEFBUTTON1 + MB_ICONEXCLAMATION);
  TMensagem.Exclamacao(Self.ClassName + ': ' + formaRespirar);
end;

procedure TMamifero.SetDNA(const Value: string);
begin
  FDNA := Value;
end;

{ TCachorro }

destructor TCachorro.Destroy;
begin
//  ShowMessage(Self.ClassName + '.Free');
  TMensagem.Aviso(Self.ClassName + '.Free');
  inherited;
end;

end.
