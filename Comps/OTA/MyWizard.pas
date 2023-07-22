unit MyWizard;

interface

uses
  ToolsAPI, Vcl.Menus;

type
  TMyOTAWizard = class(TNotifierObject, IOTAWizard)
  private
    FMenuItem: TMenuItem;
    procedure MenuItemClick(Sender: TObject);
  public
    constructor Create;
    destructor Destroy; override;
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
  end;

implementation

uses
  SysUtils, vcl.Dialogs;

{ TMyOTAWizard }

constructor TMyOTAWizard.Create;
var
  MainMenu: TMainMenu;
  ToolsMenuItem: TMenuItem;
begin
  inherited Create;

  MainMenu := (BorlandIDEServices as INTAServices).MainMenu;
  ToolsMenuItem := MainMenu.Items.Find('Tools');
  if Assigned(ToolsMenuItem) then
  begin
    FMenuItem := TMenuItem.Create(nil);
    FMenuItem.Caption := 'Aqua OTA Wizard';
    FMenuItem.OnClick := MenuItemClick;
    ToolsMenuItem.Add(FMenuItem);
  end;
end;

destructor TMyOTAWizard.Destroy;
begin
  FMenuItem.Free;
  inherited Destroy;
end;

procedure TMyOTAWizard.Execute;
begin
  ShowMessage('Wizard da melhor turma de criação de componentes do ano!');
end;

function TMyOTAWizard.GetIDString: string;
begin
  Result := 'AquaOTA.MyOTAWizard';
end;

function TMyOTAWizard.GetName: string;
begin
  Result := 'Aqua OTA Wizard';
end;

function TMyOTAWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure TMyOTAWizard.MenuItemClick(Sender: TObject);
begin
  ShowMessage('Wizard da melhor turma de criação de componentes do ano!');
end;

initialization
  RegisterPackageWizard(TMyOTAWizard.Create);

end.
