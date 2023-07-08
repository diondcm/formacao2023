unit Componente.Panel.Obrigatorio;

interface

uses
  Vcl.ExtCtrls, System.SysUtils, System.Classes, Vcl.Controls, Data.DB, Vcl.DBCtrls,
  System.Generics.Collections, Vcl.Graphics;

type
  TEditConfig = class(TComponent)
  private
    FBevelInner: TBevelCut;
    FBevelOuter: TBevelCut;
    FBevelKind: TBevelKind;
    FBevelWidth: TBevelWidth;
    FColor: TColor;
  protected
    procedure PreencheProps(bevelInner: TBevelCut; bevelOuter: TBevelCut; bevelKind: TBevelKind; bevelWidth: TBevelWidth; color: TColor); virtual;
  public
    constructor Create(AOwner: TDBEdit); reintroduce; overload;
  published
    property BevelInner: TBevelCut read FBevelInner write FBevelInner;
    property BevelOuter: TBevelCut read FBevelOuter write FBevelOuter;
    property BevelKind: TBevelKind read FBevelKind write FBevelKind;
    property BevelWidth: TBevelWidth read FBevelWidth write FBevelWidth;
    property Color: TColor read FColor write FColor;
  end;

  TPanelObrigatorio = class(TCustomPanel)
  const
    CAMPO_OBRIGATORIO = 'Campo %s é obrigatório';
  private
    FListaComps: TDictionary<TControl, TEditConfig>;
    FAtivo: Boolean;
    FDesenhaObrigatorios: Boolean;
    FMensagem: string;
    FDataSource: TDataSource;
    FConfigEditObrigatorio: TEditConfig;
    FOldBeforPost: TDataSetNotifyEvent;
    procedure SetDataSource(const Value: TDataSource);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    function GetMensagem: string;
    procedure OnBeforePostDts(DataSet: TDataSet);
  public
    function ValidaObrigatorios: string;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Caption;
    property Align;
    property Ativo: Boolean read FAtivo write FAtivo default True;
    property DesenhaObrigatorios: Boolean read FDesenhaObrigatorios write FDesenhaObrigatorios default True;
    property ConfigEditObrigatorio: TEditConfig read FConfigEditObrigatorio write FConfigEditObrigatorio;
    property Mensagem: string read FMensagem write FMensagem;
    property DataSource: TDataSource read FDataSource write SetDataSource;
  end;

  procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('AquaComps', [TPanelObrigatorio]);
end;

{ TPanelObrigatorio }

constructor TPanelObrigatorio.Create(AOwner: TComponent);
begin
  inherited;
//  Caption := ''; Não vai funcionar pois o caption é alimentado depois da criação...
  FListaComps := TDictionary<TControl, TEditConfig>.Create;
  FAtivo := True;
  FDesenhaObrigatorios := True;

  FConfigEditObrigatorio := TEditConfig.Create(Self);
  FConfigEditObrigatorio.BevelInner := bvSpace;
  FConfigEditObrigatorio.BevelOuter := bvRaised;
  FConfigEditObrigatorio.BevelKind := bkTile;
  FConfigEditObrigatorio.BevelWidth := 2;
  FConfigEditObrigatorio.Color := clRed;
end;

procedure TPanelObrigatorio.CreateParams(var Params: TCreateParams);
begin
  inherited;
//  Caption := '';
  ShowCaption := False;
  BevelOuter := bvNone;
  AlignWithMargins := True;

  if Assigned(FDataSource) then
  begin
    var dts: TDataSource := FDataSource;
    SetDataSource(nil);
    SetDataSource(dts);
  end;
end;

destructor TPanelObrigatorio.Destroy;
begin
  FListaComps.Free;
  inherited;
end;

function TPanelObrigatorio.GetMensagem: string;
begin
  Result := FMensagem;
  if Result = '' then
  begin
    Result := CAMPO_OBRIGATORIO;
  end;
end;

procedure TPanelObrigatorio.OnBeforePostDts(DataSet: TDataSet);
begin
  if not FAtivo then
  begin
    if Assigned(FOldBeforPost) then
    begin
      FOldBeforPost(DataSet);
    end;

    Exit;
  end;

  var msgObrig: string := ValidaObrigatorios;
  var campoOk: Boolean := msgObrig = '';

  if campoOk then
  begin
    if Assigned(FOldBeforPost) then
    begin
      FOldBeforPost(DataSet);
    end;
  end else begin
    raise Exception.Create(msgObrig);
//    Abort;
  end;
end;

procedure TPanelObrigatorio.SetDataSource(const Value: TDataSource);
begin
  if FDataSource = Value then
  begin
    Exit;
  end;

  if Assigned(FOldBeforPost) then
  begin
    FDataSource.DataSet.BeforePost := FOldBeforPost;
    FOldBeforPost := nil;
  end;

  FDataSource := Value;

  if not (Assigned(FDataSource) and Assigned(FDataSource.DataSet)) then
  begin
    Exit;
  end;

  if not(csDesigning in ComponentState) then
  begin
    if Assigned(FDataSource.DataSet.BeforePost) then
    begin
      FOldBeforPost := FDataSource.DataSet.BeforePost;
    end;

    FDataSource.DataSet.BeforePost := OnBeforePostDts;
  end;
end;

function TPanelObrigatorio.ValidaObrigatorios: string;
begin
  Result := '';
  if not Assigned(FDataSource) then
  begin
    Exit('DataSource não informado!');
  end;

  if not Assigned(FDataSource.DataSet) then
  begin
    Exit('DataSet não informado no DataSource');
  end;

  if FDataSource.DataSet.FieldCount <= 0 then
  begin
    Exit('DataSet sem fields informados');
  end;

  if not FDesenhaObrigatorios then
  begin
    Exit('Desativado o controle de Campos obrigatórios');
  end;

  for var i: Integer := 0 to Self.ControlCount -1 do
  begin
    if not(Self.Controls[i] is TDBEdit) then
    begin
      Continue;
    end;

    if not Assigned(TDBEdit(Self.Controls[i]).Field) then
    begin
      Continue;
    end;

    var dbE: TDBEdit := Self.Controls[i] as TDBEdit;

    if Self.Controls[i].GetTextLen = 0 then
    begin
      if dbE.Field.Required then
      begin
        if not FListaComps.ContainsKey(dbE) then
        begin
          FListaComps.Add(dbE, TEditConfig.Create(dbE));
        end;

        dbE.BevelInner := FConfigEditObrigatorio.BevelInner;
        dbE.BevelOuter := FConfigEditObrigatorio.BevelOuter;
        dbE.BevelKind := FConfigEditObrigatorio.BevelKind;
        dbE.BevelWidth := FConfigEditObrigatorio.BevelWidth;
        dbE.Color := FConfigEditObrigatorio.Color;
        Result := Result + sLineBreak + Format(GetMensagem, [dbE.Field.DisplayName]);
      end;
    end else begin
      dbE.BevelInner := FListaComps[dbE].BevelInner;
      dbE.BevelOuter := FListaComps[dbE].BevelOuter;
      dbE.BevelKind := FListaComps[dbE].BevelKind;
      dbE.BevelWidth := FListaComps[dbE].BevelWidth;
      dbE.Color := FListaComps[dbE].Color;
    end;
  end;
end;

{ TEditConfig }

constructor TEditConfig.Create(AOwner: TDBEdit);
begin
  inherited Create(AOwner);
  PreencheProps(AOwner.BevelInner, AOwner.BevelOuter, AOwner.BevelKind, AOwner.BevelWidth, AOwner.Color);
end;

procedure TEditConfig.PreencheProps(bevelInner, bevelOuter: TBevelCut;
  bevelKind: TBevelKind; bevelWidth: TBevelWidth; color: TColor);
begin
  FBevelInner := bevelInner;
  FBevelOuter := bevelOuter;
  FBevelKind := bevelKind;
  FBevelWidth := bevelWidth;
  FColor := color;
end;

end.
