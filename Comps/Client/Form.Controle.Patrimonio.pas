unit Form.Controle.Patrimonio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Classe.Patrimonio, Classe.Imovel, Classe.Veiculos, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart, Frame.Cliente;

type
  TfrmControlePatrimonio = class(TForm)
    PanelBasePatrimonio: TPanel;
    Label1: TLabel;
    PanelAddPatrimonio: TPanel;
    ButtonCriaPatrimonio: TButton;
    LabelTotal: TLabel;
    ScrollBox1: TScrollBox;
    FlowPanelListaPatrimonio: TFlowPanel;
    PanelCardPatrimonio: TPanel;
    LabelCardTipo: TLabel;
    LabelCardValor: TLabel;
    LabelCardDataCompra: TLabel;
    LabelCardDeprec: TLabel;
    Panel1: TPanel;
    fraCliente1: TfraCliente;
    procedure ButtonCriaPatrimonioClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure PopulaPatrimonio;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

type
  TCustomButton2 = class {sealed} (TCustomButton)
    FChart: TChart;
  end;

procedure TfrmControlePatrimonio.Button1Click(Sender: TObject);
begin
//  TCustomButton2(Button1).UpdateImage

  var veic: TVeiculo := TCarro.Create;

  veic.RegistraLog :=
    procedure(log: string)
    begin
      // Memo.Text := Log
    end;

//  veic2.RegistraLog :=
//    procedure(log: string)
//    begin
//      // Memo2.Text := Log
//    end
  veic.Free;
end;

procedure TfrmControlePatrimonio.ButtonCriaPatrimonioClick(Sender: TObject);
begin
  PopulaPatrimonio;
end;

procedure TfrmControlePatrimonio.PopulaPatrimonio;
begin
  var lstPat: TListaPatrimonio := TListaPatrimonio.Create;
  var veic: TVeiculo;

  veic := TCarro.Create;
  veic.DataCompra := IncMonth(Now, - (Random(60) + 1));
  veic.ValorCompra := 18976.29 * Random(10) + 18976.29;
  veic.NumMesesDepreciacao := Random(55) + 5;
  lstPat.Add(veic);

  veic := TNavio.Create;
  veic.DataCompra := IncMonth(Now, - (Random(60) + 1));
  veic.ValorCompra := 18976.29 * Random(10) + 18976.29;
  veic.NumMesesDepreciacao := Random(55) + 5;
  lstPat.Add(veic);

  veic := TAviao.Create;
  veic.DataCompra := IncMonth(Now, - (Random(60) + 1));
  veic.ValorCompra := 18976.29 * Random(10) + 18976.29;
  veic.NumMesesDepreciacao := Random(55) + 5;
  lstPat.Add(veic);

  var imv: TImovel;
  imv := TCasa.Create;
  imv.DataCompra := IncMonth(Now, - (Random(60) + 1));
  imv.ValorCompra := 18976.29 * Random(10) + 18976.29;
  imv.NumMesesDepreciacao := Random(55) + 5;
  lstPat.Add(imv);

  imv := TApartamento.Create;
  imv.DataCompra := IncMonth(Now, - (Random(60) + 1));
  imv.ValorCompra := 18976.29 * Random(10) + 18976.29;
  imv.NumMesesDepreciacao := Random(55) + 5;
  lstPat.Add(imv);

  imv := TSalaComercial.Create;
  imv.DataCompra := IncMonth(Now, - (Random(60) + 1));
  imv.ValorCompra := 18976.29 * Random(10) + 18976.29;
  imv.NumMesesDepreciacao := Random(55) + 5;
  lstPat.Add(imv);

  for var pat: IPatrimonio in lstPat do
  begin
    var panelCard: TPanel := TPanel.Create(Self);
    panelCard.Parent := FlowPanelListaPatrimonio;
    panelCard.AlignWithMargins := True;
    panelCard.Width := PanelCardPatrimonio.Width;
    panelCard.Height := PanelCardPatrimonio.Height;

    var labelValor: TLabel := TLabel.Create(Self);
    labelValor.Parent := panelCard;
    labelValor.Align := alTop;
    labelValor.Caption := 'Valor: ' + FormatFloat('R$ 0.,00', pat.ValorCompra);

    var labelDataCompra: TLabel := TLabel.Create(Self);
    labelDataCompra.Parent := panelCard;
    labelDataCompra.Align := alTop;
    labelDataCompra.Caption := 'Data Compra: ' + DateToStr(pat.DataCompra);

    var labelDeprec: TLabel := TLabel.Create(Self);
    labelDeprec.Parent := panelCard;
    labelDeprec.Align := alTop;
    labelDeprec.Caption := 'Depreciação: ' + DateToStr(pat.DataDepreciacao);

    var labelTipo: TLabel := TLabel.Create(Self);
    labelTipo.Parent := panelCard;
    labelTipo.Align := alTop;
    labelTipo.Caption := 'Tipo: ' + pat.Tipo; // pat is TCarro => (pat as TCarro).
    labelTipo.Font.Style := [fsBold];
  end;

  LabelTotal.Caption := 'Total: ' + FormatFloat('R$ 0.,00', lstPat.GetValorTotal);
  lstPat.Free;
end;

end.
