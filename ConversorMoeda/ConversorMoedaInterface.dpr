program ConversorMoedaInterface;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form.Corversor in 'Form.Corversor.pas' {frmConversorMoeda},
  Classe.Conversor.Moeda in 'Classe.Conversor.Moeda.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmConversorMoeda, frmConversorMoeda);
  Application.Run;
end.
