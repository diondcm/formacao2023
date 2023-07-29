unit Form.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frCoreClasses, frxClass, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, Data.DB, frxDBSet, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxADOComponents, frxDBXComponents,
  Vcl.ExtCtrls, Vcl.DBCtrls, frxGradient, Form.Relatorio.Simples,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  Vcl.CategoryButtons, Vcl.WinXCtrls, Vcl.ComCtrls, Vcl.Imaging.pngimage;

type
  TfrmPrincipal = class(TForm)
    pnlToolbar: TPanel;
    imgMenu: TImage;
    lblTitle: TLabel;
    SV: TSplitView;
    catMenuItems: TCategoryButtons;
    imlIcons: TImageList;
    ActionListRel: TActionList;
    ActionSimples: TAction;
    actLayout: TAction;
    actPower: TAction;
    PageControlTabs: TPageControl;
    TabLayout: TTabSheet;
    pnlSettings: TPanel;
    lblLog: TLabel;
    lblVclStyle: TLabel;
    grpDisplayMode: TRadioGroup;
    grpPlacement: TRadioGroup;
    grpCloseStyle: TRadioGroup;
    lstLog: TListBox;
    grpAnimation: TGroupBox;
    lblAnimationDelay: TLabel;
    lblAnimationStep: TLabel;
    chkUseAnimation: TCheckBox;
    trkAnimationDelay: TTrackBar;
    trkAnimationStep: TTrackBar;
    chkCloseOnMenuClick: TCheckBox;
    cbxVclStyles: TComboBox;
    TabConversao: TTabSheet;
    Memo1: TMemo;
    ActionConversao: TAction;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionSimplesExecute(Sender: TObject);
    procedure actLayoutExecute(Sender: TObject);
    procedure actPowerExecute(Sender: TObject);
    procedure catMenuItemsCategoryCollapase(Sender: TObject;
      const Category: TButtonCategory);
    procedure cbxVclStylesChange(Sender: TObject);
    procedure chkUseAnimationClick(Sender: TObject);
    procedure grpCloseStyleClick(Sender: TObject);
    procedure grpDisplayModeClick(Sender: TObject);
    procedure grpPlacementClick(Sender: TObject);
    procedure imgMenuClick(Sender: TObject);
    procedure Log(const Msg: string);
    procedure SVClosed(Sender: TObject);
    procedure SVClosing(Sender: TObject);
    procedure SVOpened(Sender: TObject);
    procedure SVOpening(Sender: TObject);
    procedure trkAnimationDelayChange(Sender: TObject);
    procedure trkAnimationStepChange(Sender: TObject);
    procedure ActionConversaoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  public
    { Public declarations }
    procedure ExibeAba(tab: TTabSheet);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Vcl.Themes;

{$R *.dfm}


procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  frmRelatoriosSimples.Show;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  StyleName: string;
begin
  for StyleName in TStyleManager.StyleNames do
    cbxVclStyles.Items.Add(StyleName);

  cbxVclStyles.ItemIndex := cbxVclStyles.Items.IndexOf(TStyleManager.ActiveStyle.Name);
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  ExibeAba(TabLayout);
end;

procedure TfrmPrincipal.cbxVclStylesChange(Sender: TObject);
begin
  TStyleManager.SetStyle(cbxVclStyles.Text);
end;

procedure TfrmPrincipal.imgMenuClick(Sender: TObject);
begin
  if SV.Opened then
    SV.Close
  else
    SV.Open;
end;

procedure TfrmPrincipal.grpDisplayModeClick(Sender: TObject);
begin
  SV.DisplayMode := TSplitViewDisplayMode(grpDisplayMode.ItemIndex);
end;

procedure TfrmPrincipal.grpCloseStyleClick(Sender: TObject);
begin
  SV.CloseStyle := TSplitViewCloseStyle(grpCloseStyle.ItemIndex);
end;

procedure TfrmPrincipal.grpPlacementClick(Sender: TObject);
begin
  SV.Placement := TSplitViewPlacement(grpPlacement.ItemIndex);
end;

procedure TfrmPrincipal.SVClosed(Sender: TObject);
begin
  // When TSplitView is closed, adjust ButtonOptions and Width
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions - [boShowCaptions];
  if SV.CloseStyle = svcCompact then
    catMenuItems.Width := SV.CompactWidth;
end;

procedure TfrmPrincipal.SVClosing(Sender: TObject);
begin
//
end;

procedure TfrmPrincipal.SVOpened(Sender: TObject);
begin
  // When not animating, change size of catMenuItems when TSplitView is opened
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions + [boShowCaptions];
  catMenuItems.Width := SV.OpenedWidth;
end;

procedure TfrmPrincipal.SVOpening(Sender: TObject);
begin
  // When animating, change size of catMenuItems at the beginning of open
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions + [boShowCaptions];
  catMenuItems.Width := SV.OpenedWidth;
end;

procedure TfrmPrincipal.chkUseAnimationClick(Sender: TObject);
begin
  SV.UseAnimation := chkUseAnimation.Checked;
  lblAnimationDelay.Enabled := SV.UseAnimation;
  trkAnimationDelay.Enabled := SV.UseAnimation;
  lblAnimationStep.Enabled := SV.UseAnimation;
  trkAnimationStep.Enabled := SV.UseAnimation;
end;

procedure TfrmPrincipal.ExibeAba(tab: TTabSheet);
begin
  for var i: Integer := 0 to PageControlTabs.PageCount - 1 do
    PageControlTabs.Pages[i].TabVisible := False;
  tab.Visible := True;
  PageControlTabs.ActivePage := tab;
end;

procedure TfrmPrincipal.trkAnimationDelayChange(Sender: TObject);
begin
  SV.AnimationDelay := trkAnimationDelay.Position * 5;
  lblAnimationDelay.Caption := 'Animation Delay (' + IntToStr(SV.AnimationDelay) + ')';
end;

procedure TfrmPrincipal.trkAnimationStepChange(Sender: TObject);
begin
  SV.AnimationStep := trkAnimationStep.Position * 5;
  lblAnimationStep.Caption := 'Animation Step (' + IntToStr(SV.AnimationStep) + ')';
end;

procedure TfrmPrincipal.ActionConversaoExecute(Sender: TObject);
begin
  ExibeAba(TabConversao);
end;

procedure TfrmPrincipal.ActionSimplesExecute(Sender: TObject);
begin
  if SV.Opened and chkCloseOnMenuClick.Checked then
    SV.Close;

  frmRelatoriosSimples.Show;


end;

procedure TfrmPrincipal.actLayoutExecute(Sender: TObject);
begin
//  Log(actLayout.Caption + ' Clicked');
  if SV.Opened and chkCloseOnMenuClick.Checked then
    SV.Close;

  ExibeAba(TabLayout);
end;

procedure TfrmPrincipal.actPowerExecute(Sender: TObject);
begin
  Log(actPower.Caption + ' Clicked');
  if SV.Opened and chkCloseOnMenuClick.Checked then
    SV.Close;
end;

procedure TfrmPrincipal.catMenuItemsCategoryCollapase(Sender: TObject; const Category: TButtonCategory);
begin
  // Prevent the catMenuItems Category group from being collapsed
  catMenuItems.Categories[0].Collapsed := False;
end;

procedure TfrmPrincipal.Log(const Msg: string);
var
  Idx: Integer;
begin
  Idx := lstLog.Items.Add(Msg);
  lstLog.TopIndex := Idx;
end;



end.
