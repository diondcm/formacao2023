unit Classe.InfAnimal;

interface

type
  IInfAnimal = interface
    ['{CD3BAF7E-D08C-40A8-9EE2-E055CFDEA41F}'] // Shift + Ctrl + G
    function GetDNA: string;
    procedure SetDNA(const Value: string);

    procedure Correr;
    procedure Alimentar;
    procedure Respirar;

    property DNA: string read GetDNA write SetDNA;
  end;

implementation

end.
