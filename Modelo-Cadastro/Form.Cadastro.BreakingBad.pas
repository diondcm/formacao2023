unit Form.Cadastro.BreakingBad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmBreakingBad = class(TForm)
    RESTRequest1: TRESTRequest;
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
    PanelControles: TPanel;
    GridPanelFrases: TGridPanel;
    memoFrases: TMemo;
    EditFrases: TEdit;
    memFrases: TFDMemTable;
    memFrasesJSON: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    StaticTextFrases: TStaticText;
    LinkPropertyToFieldCaption: TLinkPropertyToField;
    procedure EditFrasesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBreakingBad: TfrmBreakingBad;

implementation

{$R *.dfm}

procedure TfrmBreakingBad.EditFrasesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    var strJSON: string;
    var stm: TStringStream := TStringStream.Create;
    try
      RESTClient1.BaseURL := 'https://api.breakingbadquotes.xyz/v1/quotes/' + EditFrases.Text;
      RESTRequest1.Execute;
      strJSON := RESTResponse1.Content;

    finally
      stm.Free;
    end;

    /// Serealizar JSON - ler dados
    if strJSON = '' then
    begin
      ShowMessage('Sem dados');
      Exit;
    end;

    /// Colocar dados no Dataset

    memFrases.Open;

    memFrases.Append;
    memFrases.FieldByName('JSON').AsString := strJSON;
    memFrases.Post;
  end;
end;

end.
