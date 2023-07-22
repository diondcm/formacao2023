unit Form.Testa.Componentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Componente.Panel.Obrigatorio, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.WinXCalendars, Data.Bind.EngExt, Vcl.Bind.DBEngExt,
  Data.Bind.Components, Data.Bind.DBScope, Classe.CalendarPickerDB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Classe.Card.Viewer, vcl.Imaging.jpeg, vcl.Imaging.pngimage;

type
  TfrmTestaComps = class(TForm)
    memPessoa: TFDMemTable;
    memPessoaID: TIntegerField;
    memPessoaNome: TStringField;
    memPessoaDataCadastro: TDateField;
    memPessoaSaldo: TCurrencyField;
    memPessoaCPF: TStringField;
    memPessoaRG: TStringField;
    dtsPessoa: TDataSource;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    PageControl1: TPageControl;
    TabPanelObrigatorio: TTabSheet;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    Button1: TButton;
    PanelObrigatorio1: TPanelObrigatorio;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    TabCardViewer: TTabSheet;
    EditPrompt: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure memPessoaBeforePost(DataSet: TDataSet);
    procedure memPessoaNewRecord(DataSet: TDataSet);
    procedure CalendarPickerDB1ChageDate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditPromptKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FCardViewerTest: TCardViewer;
  public
    { Public declarations }
  end;

var
  frmTestaComps: TfrmTestaComps;

implementation

{$R *.dfm}

procedure TfrmTestaComps.Button1Click(Sender: TObject);
begin
  PanelObrigatorio1.ValidaObrigatorios;
end;

procedure TfrmTestaComps.CalendarPickerDB1ChageDate(Sender: TObject);
begin
//  ShowMessage('Data alterada');
end;

procedure TfrmTestaComps.EditPromptKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    FCardViewerTest.GeraImagemAI(EditPrompt.Text);
  end;
end;

procedure TfrmTestaComps.FormCreate(Sender: TObject);
begin
  memPessoa.Open;
end;

procedure TfrmTestaComps.FormShow(Sender: TObject);
begin
  FCardViewerTest := TCardViewer.Create(Self);
  FCardViewerTest.Parent := TabCardViewer;

  FCardViewerTest.Proportional := False;
  FCardViewerTest.Align := alClient;

//  FCardViewerTest.GeraImagemAI('Generate an image of a robot playing a guitar while riding a skateboard on the moon');

//  FCardViewerTest.PastaImagens := 'C:\Users\AQUASOFT\Pictures\wallpapers\';


//  FCardViewerTest.CarregaImagemPrincipal('C:\Users\AQUASOFT\Pictures\wallpapers\fundo1.jpg');
//  FCardViewerTest.CarregaImagemEsquerda('C:\Users\AQUASOFT\Pictures\wallpapers\fundo3.jpg');
//  FCardViewerTest.CarregaImagemDireita('C:\Users\AQUASOFT\Pictures\wallpapers\fundo4.jpg');

//  FCardViewerTest.CarregaImagemPrincipal('C:\Users\AQUASOFT\Pictures\fundo1.jpg');
//  FCardViewerTest.CarregaImagemPrincipal('C:\Users\AQUASOFT\Pictures\FundoAqua 2.jpeg');

//  var jpeg: TJPEGImage := TJPEGImage.Create;
//  jpeg.LoadFromFile('C:\Users\AQUASOFT\Pictures\fundo3.jpg');
//  FCardViewerTest.ImagemEsquerda.Picture.Assign(jpeg);
//
//
//  jpeg.LoadFromFile('C:\Users\AQUASOFT\Pictures\fundo4.jpg');
//  FCardViewerTest.ImagemDireita.Picture.Assign(jpeg);

//  png.Free;
//  jpeg.Free;
end;

procedure TfrmTestaComps.memPessoaBeforePost(DataSet: TDataSet);
begin
  Caption := TimeToStr(Now);
end;

procedure TfrmTestaComps.memPessoaNewRecord(DataSet: TDataSet);
begin
  memPessoaID.AsInteger := GetTickCount;
  memPessoaDataCadastro.AsDateTime := Now;
end;

end.
