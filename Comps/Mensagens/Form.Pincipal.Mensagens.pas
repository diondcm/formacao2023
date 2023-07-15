unit Form.Pincipal.Mensagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, System.Generics.Collections,
  Form.Destino;

const
  WM_MYMESSAGE = WM_APP + WM_USER + 1;

type
  TfrmPrincipalMensagens = class(TForm)
    PanelControles: TPanel;
    ButtonProcessamento: TButton;
    EditAviso: TEdit;
    PanelMessage: TPanel;
    Button1: TButton;
    Label1: TLabel;
    EditW: TEdit;
    Label2: TLabel;
    EditL: TEdit;
    MemoLog: TMemo;
    EditHWND: TEdit;
    EditHandleDestino: TEdit;
    Label3: TLabel;
    EditMsg: TEdit;
    Panel1: TPanel;
    ListBoxHandles: TListBox;
    Panel2: TPanel;
    CheckBoxAtivar: TCheckBox;
    TimerBusca: TTimer;
    Splitter1: TSplitter;
    Panel3: TPanel;
    ButtonClick: TButton;
    ButtonSetText: TButton;
    EditTexto: TEdit;
    ButtonClose: TButton;
    ButtonShake: TButton;
    ButtonSetParent: TButton;
    ButtonFormWin: TButton;
    Button2: TButton;
    procedure ButtonProcessamentoClick(Sender: TObject);
    procedure EditAvisoChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerBuscaTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CheckBoxAtivarClick(Sender: TObject);
    procedure ButtonClickClick(Sender: TObject);
    procedure ListBoxHandlesClick(Sender: TObject);
    procedure ButtonSetTextClick(Sender: TObject);
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonShakeClick(Sender: TObject);
    procedure ButtonSetParentClick(Sender: TObject);
    procedure ButtonFormWinClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FListaWnds: TDictionary<string, THandle>;
    procedure WmMyMessage(var Msg: TMessage); message WM_MYMESSAGE;
  public
    { Public declarations }
  end;

var
  frmPrincipalMensagens: TfrmPrincipalMensagens;
  NovaClasse: TWndClass;
  lFormWin: HWND;
  lEdtHandle: HWND;
  lBtnHandle: NativeInt;

  OldWndProc: TFarProc;
//  NewWndProc: TFarProc;

implementation

{$R *.dfm}

procedure ClickButtonWin;
var
  lText: array [0..255] of Char;
begin
  GetWindowText(lEdtHandle, lText, Length(lText));
  MessageBox(lFormWin, PChar('Você digitou: "' + lText + '"'), 'Info', MB_APPLMODAL or MB_ICONINFORMATION + MB_OK);
end;

function HookWndProc(pHandle: HWND; uMsg: UINT; pWParam: WPARAM; pLParam: LPARAM): LRESULT; stdcall;
begin
  if uMsg = WM_KEYDOWN then
  begin
    SetWindowText(frmPrincipalMensagens.Handle, PChar('Tecla: ' + Chr(pWParam)));

//    SetWindowText(StrToInt(frmPrincipalMensagens.EditHandleDestino.Text), PChar('Tecla: ' + Chr(pWParam)));
//  end else begin
//    SetWindowText(StrToInt(frmPrincipalMensagens.EditHandleDestino.Text), PChar(TimeToStr(Now)));
  end;
  Result := CallWindowProc(OldWndProc, pHandle, uMsg, pwParam, plParam);
end;

function NossaWndProc(pHandle: HWND; uMsg: UINT; pWParam: WPARAM; pLParam: LPARAM): LRESULT; stdcall;
begin
  Result := 0;
  case uMsg of
    WM_DESTROY: PostQuitMessage(0);
    WM_ACTIVATE: Winapi.Windows.SetFocus(lEdtHandle);
    WM_COMMAND:
      begin
        if pLParam = lBtnHandle then
        begin
          case pWParam of
            BN_CLICKED: ClickButtonWin;
          else
            Result := DefWindowProc(pHandle, uMsg, pWParam, pLParam);
          end;
        end;
      end
    else
      Result := DefWindowProc(pHandle, uMsg, pWParam, pLParam);
    end;
end;

procedure CriaControlesWin;
begin
  lEdtHandle := CreateWindowEx(WS_EX_CLIENTEDGE,
    'EDIT',
    '',
    WS_CHILD OR WS_VISIBLE OR ES_AUTOVSCROLL OR ES_NOHIDESEL,
    8, 16, 160, 21,
    lFormWin,
    0,
    HInstance,
    nil);

  lBtnHandle := CreateWindow(
    'BUTTON',
    'Exibe Texto',
    WS_CHILD OR WS_VISIBLE OR BS_PUSHBUTTON OR BS_TEXT,
    8, 40, 96, 25,
    lFormWin,
    0,
    HInstance,
    nil);
end;

procedure TfrmPrincipalMensagens.Button1Click(Sender: TObject);
begin
  PostMessage(StrToIntDef(EditHandleDestino.Text, Handle), StrToIntDef(EditMsg.Text, WM_MYMESSAGE), StrToIntDef(EditW.Text, 0), StrToIntDef(EditL.Text, 0));
end;

procedure TfrmPrincipalMensagens.Button2Click(Sender: TObject);
begin
  OldWndProc := TFarProc(GetWindowLongPtr(StrToInt(EditHandleDestino.Text), GWL_WNDPROC));
//  NewWndProc := MakeObjectInstance(HookWndProc);
  SetWindowLongPtr(StrToInt(EditHandleDestino.Text), GWL_WNDPROC, LongInt(@HookWndProc));
  Caption := 'Ok - ' + TimeToStr(Now);
end;

procedure TfrmPrincipalMensagens.ButtonClickClick(Sender: TObject);
begin
  SendMessage( StrToInt(EditHandleDestino.Text) , WM_LBUTTONDOWN, 0, 0);
  Sleep(100);
  SendMessage( StrToInt(EditHandleDestino.Text) , WM_LBUTTONUP, 0, 0);
end;

procedure TfrmPrincipalMensagens.ButtonCloseClick(Sender: TObject);
begin
  SendMessage( StrToInt(EditHandleDestino.Text) , WM_CLOSE, 0, 0);
end;

procedure TfrmPrincipalMensagens.ButtonFormWinClick(Sender: TObject);
begin
  NovaClasse.style := 0;
  NovaClasse.lpfnWndProc := @NossaWndProc;//DefWindowProc;
  NovaClasse.cbClsExtra := 0;
  NovaClasse.cbWndExtra := 0;
  NovaClasse.hInstance := HInstance;
  NovaClasse.hIcon := 0;
  NovaClasse.hCursor := LoadCursor(0, IDC_ARROW);
  NovaClasse.hbrBackground := COLOR_WINDOW;
  NovaClasse.lpszMenuName := nil;
  NovaClasse.lpszClassName := 'TMainForm';

  Winapi.Windows.RegisterClass(NovaClasse);

  lFormWin := CreateWindow('TMainForm',
    'Criação Componentes',
    WS_OVERLAPPEDWINDOW,
    Integer(CW_USEDEFAULT),
    Integer(CW_USEDEFAULT),
    320, 200,
    0,
    0,
    hInstance,
    nil);

  CriaControlesWin;

  ShowWindow(lFormWin, SW_SHOWNORMAL);
end;

procedure TfrmPrincipalMensagens.ButtonProcessamentoClick(Sender: TObject);
begin
//  while True do
//  begin
//    Caption := EditAviso.Text;
//    Sleep(10);
//    Application.ProcessMessages;
//  end;
end;

procedure TfrmPrincipalMensagens.ButtonSetParentClick(Sender: TObject);
begin
  if not Assigned(frmDestino) then
    frmDestino := TfrmDestino.Create(Self);

  frmDestino.Show;

  WinApi.Windows.SetParent(StrToInt(EditHandleDestino.Text), frmDestino.Handle);
end;

procedure TfrmPrincipalMensagens.ButtonSetTextClick(Sender: TObject);
begin
  SetWindowText(StrToInt(EditHandleDestino.Text), PChar(EditTexto.Text));
end;

procedure TfrmPrincipalMensagens.ButtonShakeClick(Sender: TObject);

  procedure WindowShake(wHandle: THandle);
  const
    MAXDELTA = 4;
    SHAKETIMES = 500;
  var
    oRect, wRect :TRect;
    deltax: integer;
    deltay: integer;
    cnt: integer;
    dx, dy: integer;
  begin
    //lembre da posição original
    GetWindowRect(wHandle,wRect);
    oRect := wRect;
    Randomize;
    for cnt := 0 to SHAKETIMES do
    begin
      deltax := Round(Random(MAXDELTA));
      deltay := Round(Random(MAXDELTA));
      dx := Round(1 + Random(2));
      if dx = 2 then
        dx := -1;
        dy := Round(1 + Random(2));
        if dy = 2 then
          dy := -1;
          OffsetRect(wRect,dx * deltax, dy * deltay);
          MoveWindow(wHandle, wRect.Left,wRect.Top,wRect.Right -
          wRect.Left,wRect.Bottom - wRect.Top,true);
    end;
    //returna à posição de início
    MoveWindow(wHandle, oRect.Left,oRect.Top,oRect.Right -
    oRect.Left,oRect.Bottom - oRect.Top,true);
  end;

begin
  WindowShake(StrToInt(EditHandleDestino.Text));
end;

procedure TfrmPrincipalMensagens.CheckBoxAtivarClick(Sender: TObject);
begin
  TimerBusca.Enabled := CheckBoxAtivar.Checked;
end;

procedure TfrmPrincipalMensagens.EditAvisoChange(Sender: TObject);
begin
  Caption := EditAviso.Text;
end;

procedure TfrmPrincipalMensagens.FormCreate(Sender: TObject);
begin
  EditHWND.Text := IntToStr(Self.Handle);
  EditMsg.Text := IntToStr(WM_MYMESSAGE);
  FListaWnds := TDictionary<string, THandle>.Create;

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}
end;

procedure TfrmPrincipalMensagens.FormDestroy(Sender: TObject);
begin
  FListaWnds.Free;
end;

procedure TfrmPrincipalMensagens.ListBoxHandlesClick(Sender: TObject);
begin
  if ((FListaWnds.Count > 0) and (FListaWnds.ContainsKey(ListBoxHandles.Items[ListBoxHandles.ItemIndex]))) then
  begin
    EditHandleDestino.Text := IntToStr(FListaWnds[ListBoxHandles.Items[ListBoxHandles.ItemIndex]]);
  end;
end;

procedure TfrmPrincipalMensagens.TimerBuscaTimer(Sender: TObject);
var
  lPoint: TPoint;
  lHandle: HWND;
  lArrCaption: array [0..255] of Char;
  lCaption: string;
  lClassName: string;
begin
  GetCursorPos(lPoint);
  lHandle := WindowFromPoint(lPoint);

  GetWindowText(lHandle, @lArrCaption, Length(lArrCaption));
  lCaption := string(lArrCaption);

  WinApi.Windows.GetClassName(lHandle, @lArrCaption, Length(lArrCaption));
  lClassName := string(lArrCaption);

  if not FListaWnds.ContainsKey(lCaption + ' - ' + lClassName) then
  begin
    if not FListaWnds.ContainsKey(lClassName) then
    begin
      if not FListaWnds.ContainsKey(IntToStr(lHandle)) then
      begin
        if lCaption <> '' then
        begin
          ListBoxHandles.Items.Add(lCaption + ' - ' + lClassName);
          FListaWnds.Add(lCaption + ' - ' + lClassName, lHandle);
        end else if lClassName <> '' then
        begin
          ListBoxHandles.Items.Add(lClassName);
          FListaWnds.Add(lClassName, lHandle);
        end else begin
          ListBoxHandles.Items.Add(IntToStr(lHandle));
          FListaWnds.Add(IntToStr(lHandle), lHandle);
        end;
      end else begin
        ListBoxHandles.ItemIndex := ListBoxHandles.Items.IndexOf(IntToStr(lHandle));
      end;
    end else begin
      ListBoxHandles.ItemIndex := ListBoxHandles.Items.IndexOf(lClassName);
    end;
  end else begin
    ListBoxHandles.ItemIndex := ListBoxHandles.Items.IndexOf(lCaption + ' - ' + lClassName);
  end;
end;

procedure TfrmPrincipalMensagens.WmMyMessage(var Msg: TMessage);
begin
//  ShowMessage(msg.Msg.ToString + sLineBreak + 'W: ' + Msg.WParam.ToString + sLineBreak + 'L: ' + Msg.LParam.ToString);
  MemoLog.Lines.Insert(0, msg.Msg.ToString +  ' W: ' + Msg.WParam.ToString + ' L: ' + Msg.LParam.ToString);
end;

end.
