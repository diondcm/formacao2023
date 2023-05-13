unit Form.Visualiza.Pessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Classe.Pessoa, System.Generics.Collections;

type
  TfrmVisualizaPessoa = class(TForm)
    ListBoxPessoas: TListBox;
    MemoPessoa: TMemo;
    procedure ListBoxPessoasClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    FPessoas: TDictionary<string, TPessoa>;
  public
    procedure VisualizaPessoa(pes: TPessoa);
  end;

var
  frmVisualizaPessoa: TfrmVisualizaPessoa;

implementation

{$R *.dfm}

{ TfrmVisualizaPessoa }

procedure TfrmVisualizaPessoa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  for var i: Integer := 0 to ListBoxPessoas.Items.Count -1 do
//  begin
//    ListBoxPessoas.Items.Objects[i].Free;
////    if Assigned(ListBoxPessoas.Items.Objects[i]) then
//    begin
////      ListBoxPessoas.Items.Objects[i].Free;
////      ListBoxPessoas.Items.Objects[i] := nil;
//
////      FreeAndNil(ListBoxPessoas.Items.Objects[i]);
//    end;
//  end;
//  ListBoxPessoas.Items.Clear;
end;

procedure TfrmVisualizaPessoa.FormCreate(Sender: TObject);
begin
  FPessoas := TDictionary<string, TPessoa>.Create;
end;

procedure TfrmVisualizaPessoa.FormDestroy(Sender: TObject);
begin
  for var pes: TPessoa in FPessoas.Values do
  begin
    pes.Free;
  end;

  FPessoas.Free;

//  for var i: Integer := 0 to ListBoxPessoas.Items.Count -1 do
//  begin
//    ListBoxPessoas.Items.Objects[i].Free;
//  end;
end;

procedure TfrmVisualizaPessoa.ListBoxPessoasClick(Sender: TObject);
begin
  MemoPessoa.Clear;
  if ListBoxPessoas.ItemIndex <> -1 { Não Selecionado } then
  begin
    var pes: TPessoa := FPessoas[ListBoxPessoas.Items[ListBoxPessoas.ItemIndex]];
    MemoPessoa.Lines.Add(pes.ClassName);
    MemoPessoa.Lines.Add(pes.ToString);

//    var pes: TPessoa := ListBoxPessoas.Items.Objects[ListBoxPessoas.ItemIndex] as TPessoa;
//    MemoPessoa.Lines.Add(pes.ImprimePessoa(pes));

//    ShowMessage('Pessoa: ' + ListBoxPessoas.Items[ListBoxPessoas.ItemIndex]);
  end;
end;

procedure TfrmVisualizaPessoa.VisualizaPessoa(pes: TPessoa);
begin
  if not FPessoas.ContainsKey(pes.Codigo.ToString) then
  begin
    FPessoas.Add(pes.Codigo.ToString, pes);
    ListBoxPessoas.Items.Add(pes.Codigo.ToString);
  end;

  MemoPessoa.Lines.Add(pes.ClassName);
  MemoPessoa.Lines.Add(pes.ToString);

//  ListBoxPessoas.Items.AddObject(pes.Nome, pes);
//  MemoPessoa.Lines.Add(pes.ImprimePessoa(pes));
end;

end.
