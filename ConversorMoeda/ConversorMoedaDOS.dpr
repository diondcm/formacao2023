program ConversorMoedaDOS;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Classe.Conversor.Moeda in 'Classe.Conversor.Moeda.pas';

//var
//  valorIniReal: Double;
//  valorFimDolar: Double;
//  texto: string;
begin
  var texto: string;
  try
    // FormatSettings.DecimalSeparator := ','; // último recurso, por ser global

    Writeln('Informe um valor em Reais a ser convertido:');
    Readln(texto);
    Writeln('Valor convertido: ');
    Writeln(TConversorMoeda.RealParaDolar(texto));

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln(texto);
end.
