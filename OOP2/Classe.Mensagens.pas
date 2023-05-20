unit Classe.Mensagens;

interface

uses
  Vcl.Dialogs, WinAPI.Windows, Winapi.Messages, Vcl.Forms;

type
  TMensagem = class
  public
    class procedure Exclamacao(texto: string);
    class procedure Aviso(texto: string);
    class procedure Erro(texto: string);
    class function Confirmacao(texto: string): Boolean;
  end;

implementation

{ TMensagem }

class procedure TMensagem.Aviso(texto: string);
begin
//  ShowMessage(texto);
  MessageBox(0, PChar(texto), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
end;

class function TMensagem.Confirmacao(texto: string): Boolean;
begin
  Result := MessageBox(0 {Application.Handle}, PChar(texto), 'Confirmação', MB_YESNO + MB_DEFBUTTON1 + MB_ICONQUESTION) = ID_YES;
end;

class procedure TMensagem.Erro(texto: string);
begin
//  ShowMessage(texto);
  MessageBox(0, PChar(texto), 'Erro!', MB_OK + MB_DEFBUTTON1 + MB_ICONWARNING);
  // Gravar log, Registrar em API
end;

class procedure TMensagem.Exclamacao(texto: string);
begin
  MessageBox(0, PChar(texto), 'Atenção!', MB_OK + MB_DEFBUTTON1 + MB_ICONEXCLAMATION);
end;

end.
