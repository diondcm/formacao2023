unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Generics.Collections,
  Form.TesteArray;

type
//  TColorPar = class
//  private
//    FNome: string;
//    FCor: TColor;
//  public
//    constructor Create(ANome: string; ACor: TColor);
//    property Nome: string read FNome write FNome;
//    property Cor: TColor read FCor write FCor;
//  end;

  TfrmPrincipal = class(TForm)
    PanelControles: TPanel;
    PanelCor: TPanel;
    ListBoxCores: TListBox;
    ColorBoxSel: TColorBox;
    ButtonAdd: TButton;
    Splitter1: TSplitter;
    EditNome: TEdit;
    ButtonArray: TButton;
    procedure ButtonAddClick(Sender: TObject);
    procedure ListBoxCoresClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EditNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButtonArrayClick(Sender: TObject);
  private
    FListaCores: TDictionary<string, TColor>;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.ButtonAddClick(Sender: TObject);
begin
  if EditNome.Text = '' then
  begin
    raise Exception.Create('Informe o nome');
  end;

  if ColorBoxSel.Selected = clDefault then
  begin
    raise Exception.Create('Informe uma cor');
  end;

  if FListaCores.ContainsKey(EditNome.Text) then
  begin
    raise Exception.Create('Nome já informado');
  end;

  if FListaCores.ContainsValue(ColorBoxSel.Selected) then
  begin
    raise Exception.Create('Cor já informada');
  end;

  ListBoxCores.Items.Add(EditNome.Text);
  PanelCor.Color := ColorBoxSel.Selected;
  FListaCores.Add(EditNome.Text, ColorBoxSel.Selected);

//  ListBoxCores.Items.AddObject(EditNome.Text, TColorPar.Create(EditNome.Text, ColorBoxSel.Selected));
//  PanelCor.Color := ColorBoxSel.Selected;

//  var stl: TStringList := TStringList.Create;
//  stl.Add(IntToStr(ColorBoxSel.Selected));
//  StrToInt(stl[ListBoxCores.ItemIndex])

  // ListBoxCores.Items.Add(IntToStr(ColorBoxSel.Selected)); Usuário não lembra
  // ListBoxCores.Items.Add(EditNome.Text + '-' + IntToStr(ColorBoxSel.Selected)); //
end;

{ TColorPar }

//constructor TColorPar.Create(ANome: string; ACor: TColor);
//begin
//  FNome := ANome;
//  FCor := ACor;
//end;

procedure TfrmPrincipal.ButtonArrayClick(Sender: TObject);
begin
  TfrmTesteArray.Create(Application).Show;
end;

procedure TfrmPrincipal.EditNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    ButtonAdd.Click;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  FListaCores := TDictionary<string, TColor>.Create;
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FListaCores.Free;

//  for var i: Integer := 0 to ListBoxCores.Items.Count -1 do
//  begin
//    ListBoxCores.Items.Objects[i].Free;
//  end;
end;

procedure TfrmPrincipal.ListBoxCoresClick(Sender: TObject);
begin
  if ListBoxCores.ItemIndex > -1 then
  begin
    PanelCor.Color := FListaCores[ListBoxCores.Items[ListBoxCores.ItemIndex]];
//    PanelCor.Color := TColorPar(ListBoxCores.Items.Objects[ListBoxCores.ItemIndex]).Cor;
  end;
end;

end.
