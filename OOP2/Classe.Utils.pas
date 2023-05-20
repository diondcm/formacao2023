unit Classe.Utils;

interface

uses
  Vcl.Dialogs;

type
  TAviso = class
  private class var
    FIdioma: string;
  public
    class procedure Avisa(texto: string);

    procedure AvisaDeInstancia(texto: string);
    class property Idioma: string read FIdioma write FIdioma;
  end;

  procedure Aviso(texto: string);

///  ATENÇÃO!!
///  Esta unit não deve conter TUDO do projeto

  function InDebug: Boolean;

implementation

function InDebug: Boolean;
begin
  {$WARN SYMBOL_PLATFORM OFF}
  Result := DebugHook > 0;
  {$WARN SYMBOL_PLATFORM ON}
end;

procedure Aviso(texto: string);
begin
  ShowMessage(texto);
end;

{ TAviso }

class procedure TAviso.Avisa(texto: string);
begin
  ShowMessage(FIdioma + ': ' + texto);
end;

procedure TAviso.AvisaDeInstancia(texto: string);
begin
  ShowMessage(FIdioma + ': ' + texto);
end;

end.
