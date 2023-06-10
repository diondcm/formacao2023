unit Classe.Grid.Helper;

interface

uses
  Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.DB;

type
  TDBGridHelper = class helper for TDBGrid
    procedure IndexaPorField(column: TColumn);
  end;

implementation

{ TDBGridHelper }

procedure TDBGridHelper.IndexaPorField(column: TColumn);
begin
  if not (Assigned(column) and Assigned(column.Field) and Assigned(column.Field.DataSet)) then
  begin
    Exit;
  end;

  if column.Field.FieldKind <> fkData then
  begin
    Exit;
  end;

  if not (column.Field.DataSet is TFDQuery) then
  begin
    Exit;
  end;

  var qry: TFDQuery := TFDQuery(column.Field.DataSet);
  if (qry.IndexFieldNames = '') or (qry.IndexFieldNames <> column.FieldName) then
  begin
    qry.IndexFieldNames := column.FieldName;
  end else begin
    var idx: TFDIndex := qry.Indexes.Add;
    idx.Name := column.FieldName + 'FieldDesc';
    idx.Fields := column.FieldName;
    idx.Options := [soDescending];
    idx.Active := True;

    qry.IndexFieldNames := '';
    qry.IndexName := idx.Name;
  end;
end;

end.
