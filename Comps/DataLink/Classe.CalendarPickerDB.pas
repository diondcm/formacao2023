unit Classe.CalendarPickerDB;

interface

uses
  System.SysUtils, System.Classes, System.DateUtils, Vcl.Controls, Vcl.WinXCalendars, Data.DB,  Vcl.DBCtrls, System.Variants;

type
  TCustomCalendarPickerDB = class(TCustomCalendarPicker)
  private
    FDataLink: TFieldDataLink;
    FOnChageDate: TNotifyEvent;
    FDataPassado: Boolean;
    function GetDataField: string;
    function GetDataSource: TDataSource;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(const Value: TDataSource);
  protected
    procedure DoDataChange(Sender: TObject);
    procedure DoUpdateData(Sender: TObject);
    procedure DoOnChange(Sender: TObject);
    procedure DoChangeDate(Sender: TObject);
    function IsValidDataLink: Boolean; virtual;

    property DataPassado: Boolean read FDataPassado write FDataPassado;
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property OnChageDate: TNotifyEvent read FOnChageDate write FOnChageDate;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TCalendarPickerDB = class(TCustomCalendarPickerDB)
  published
    property DataField;
    property DataSource;
    property OnChageDate;
    property Date;
    property DataPassado default False;
  end;

implementation

{ TCustomCalendarPickerDB }

constructor TCustomCalendarPickerDB.Create(AOwner: TComponent);
begin
  inherited;
  FDataLink := TFieldDataLink.Create;
  FDataLink.OnDataChange := DoDataChange;
  FDataLink.OnUpdateData := DoUpdateData;

  OnChange := DoOnChange;
end;

destructor TCustomCalendarPickerDB.Destroy;
begin
  FDataLink.Free;
  inherited;
end;

procedure TCustomCalendarPickerDB.DoChangeDate(Sender: TObject);
begin
  if Assigned(FOnChageDate) then
    FOnChageDate(Sender);
end;

procedure TCustomCalendarPickerDB.DoDataChange(Sender: TObject);
begin
  if IsValidDataLink then
  begin
    if (FDataLink.Field.IsNull or VarIsEmpty(FDataLink.Field.Value)) then
    begin
      IsEmpty := True;
    end else begin
      if DateOf(Date) <> DateOf(FDataLink.Field.AsDateTime) then
      begin
        if not FDataLink.Editing then
        begin
          Date := FDataLink.Field.AsDateTime;
        end;
      end;
    end;
  end;
end;

procedure TCustomCalendarPickerDB.DoOnChange(Sender: TObject);
begin
  if FDataPassado then
  begin
    if DateOf(Date) >= DateOf(Now) then
    begin
      raise Exception.Create('Data deve ser anterior a data atual');
    end;
  end;

  if IsValidDataLink then
  begin
    if DateOf(Date) <> DateOf(FDataLink.Field.AsDateTime) then
    begin
      if not FDataLink.Editing then
      begin
        FDataLink.Edit;
      end;

      FDataLink.Modified;
      FDataLink.UpdateRecord;
    end;
  end;
  DoChangeDate(Sender);
end;

procedure TCustomCalendarPickerDB.DoUpdateData(Sender: TObject);
begin
  if IsValidDataLink then
  begin
    FDataLink.Field.AsDateTime := Date;
  end;
end;

function TCustomCalendarPickerDB.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TCustomCalendarPickerDB.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TCustomCalendarPickerDB.IsValidDataLink: Boolean;
begin
  Result := Assigned(FDataLink.DataSource) and Assigned(FDataLink.Field);
end;

procedure TCustomCalendarPickerDB.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TCustomCalendarPickerDB.SetDataSource(const Value: TDataSource);
begin
  FDataLink.DataSource := Value;

  if ((csReading in ComponentState) or (csLoading in ComponentState) or (csDesigning in ComponentState)) then
  begin
    Exit;
  end;

  if Assigned(FDataLink.DataSource) then
  begin
    if Assigned(FDataLink.DataSource.DataSet) then
    begin
      if not FDataLink.DataSource.DataSet.Active then
      begin
        raise Exception.Create('DataSet inativo');
      end;
    end;
  end;
end;

end.
