unit Classe.Oviparos;

interface

uses
  Vcl.Dialogs, Classe.InfAnimal;

type
  TOviparo = class(TInterfacedObject, IInfAnimal)
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
    procedure Respirar;

    property DNA: string read GetDNA write SetDNA;
    { /IInfAnimal }

    property NumeroOlhos: Integer read FNumeroOlhos write FNumeroOlhos;
    property TempoIncubacao: Integer read FTempoIncubacao write FTempoIncubacao;
  end;

  TGalinha = class(TOviparo)

  end;

implementation

{ TOviparo }

procedure TOviparo.Alimentar;
begin
  ShowMessage('Alimentando');
end;

procedure TOviparo.Correr;
begin
  ShowMessage('Oviparo correndo');
end;

function TOviparo.GetDNA: string;
begin
  Result := FDNA;
end;

procedure TOviparo.Respirar;
begin
  ShowMessage('Respirar');
end;

procedure TOviparo.SetDNA(const Value: string);
begin
  FDNA := Value;
end;

end.
