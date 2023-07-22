unit Classe.Editor.Propriedade;

interface

uses
  DesignEditors, DesignIntf, Vcl.Dialogs;

type
  // Object Inspector
  TShowAbout = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;


  // Popup da IDE
  TEditorMenu = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;


implementation

{ TShowAbout }

procedure TShowAbout.Edit;
begin
  inherited;
  ShowMessage('Sobre o componente');
  // TODO: Formulário sobre
end;

function TShowAbout.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

{ TEditorMenu }

procedure TEditorMenu.ExecuteVerb(Index: Integer);
begin
  inherited;
  case Index of
    0:
    begin
      ShowMessage('Sobre o CardViewer');
      // TODO: Formulário sobre
    end;
  end;
end;

function TEditorMenu.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Sobre o CardViewer';
  end;
end;

function TEditorMenu.GetVerbCount: Integer;
begin
  Result := 1;
end;

end.
