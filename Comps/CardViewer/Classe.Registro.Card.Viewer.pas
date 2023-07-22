unit Classe.Registro.Card.Viewer;

interface

uses System.SysUtils, System.Classes, Classe.Card.Viewer,
  Classe.Editor.Propriedade, DesignIntf;

 procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('AquaComps', [TCardViewer]);
  RegisterComponentEditor(TCardViewer, TEditorMenu);
  RegisterPropertyEditor(TypeInfo(string), TCardViewer, 'Sobre', TShowAbout);
end;

end.
