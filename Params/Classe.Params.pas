unit Classe.Params;

interface

type
  TMeuObj = class
  private
    FID: Integer;
  public
    property ID: Integer read FID write FID;
  end;

  PMeuRec = ^TMeuRec;
  TMeuRec = record
    ID: Integer;
  end;

  TParametros = class
    class procedure ExecutaAlgo(pData: TDateTime; pFloat: Double; pInt: Integer; pBool: Boolean; pStr: string; pCh: Char; pRec: TMeuRec; pPoint: Pointer; pVariant: Variant);
    class procedure ExecutaAlgoConst(const pData: TDateTime; const pFloat: Double; const pInt: Integer; const pBool: Boolean; const pStr: string; const pCh: Char; const pRec: TMeuRec; const pPoint: Pointer; const pVariant: Variant);
    class procedure ExecutaAlgoVar(var pData: TDateTime; var pFloat: Double; var pInt: Integer; var pBool: Boolean; var pStr: string; var pCh: Char; var pRec: TMeuRec; var pPoint: Pointer; var pVariant: Variant);
    class procedure ExecutaAlgoOut(out pData: TDateTime; out pFloat: Double; out pInt: Integer; out pBool: Boolean; out pStr: string; out pCh: Char; out pRec: TMeuRec; out pPoint: Pointer; out pVariant: Variant);
  end;

implementation

uses
  System.SysUtils;

{ TParametros }
class procedure TParametros.ExecutaAlgo(pData: TDateTime; pFloat: Double;
  pInt: Integer; pBool: Boolean; pStr: string; pCh: Char; pRec: TMeuRec;
  pPoint: Pointer; pVariant: Variant);

  function GeraRec: TMeuRec;
  begin
    Result.ID := 534;
  end;

begin
//  pData := Now;
//  pFloat := 9;
//  pInt := $23;
//  pBool := False;
//  pStr := 'Teste';
//  pCh := '8';
  pRec.ID := 42;
  pPoint := Pointer($FFFF);
  pVariant := 9876;

  pRec := GeraRec;


//  Writeln(Format('  $%p pData: %n', [@pData, pData]));
//  Writeln(Format('  $%p pFloat: %n', [@pFloat, pFloat]));
//  Writeln(Format('  $%p pInt: %d', [@pInt, pInt]));
//  Writeln(Format('  $%p pBool: %s', [@pBool, BoolToStr(pBool, True)]));
//  Writeln(Format('  $%p pStr: %s', [@pStr, pStr]));
//  Writeln(Format('  $%p pCh: %s', [@pCh, pCh]));
  Writeln(Format('  $%p pRec: %d', [@pRec, pRec.ID]));
  Writeln(Format('  $%p pPoint: %p', [@pPoint, pPoint]));
  Writeln(Format('  $%p pVariant: %s', [@pVariant, pVariant]));
end;

class procedure TParametros.ExecutaAlgoConst(const pData: TDateTime;
  const pFloat: Double; const pInt: Integer; const pBool: Boolean;
  const pStr: string; const pCh: Char; const pRec: TMeuRec;
  const pPoint: Pointer; const pVariant: Variant);
begin
//  pData := Now;

//  Writeln(Format('  $%p pData: %n', [@pData, pData]));
//  Writeln(Format('  $%p pFloat: %n', [@pFloat, pFloat]));
//  Writeln(Format('  $%p pInt: %d', [@pInt, pInt]));
//  Writeln(Format('  $%p pBool: %s', [@pBool, BoolToStr(pBool, True)]));
//  Writeln(Format('  $%p pStr: %s', [@pStr, pStr]));
//  Writeln(Format('  $%p pCh: %s', [@pCh, pCh]));
  Writeln(Format('  $%p pRec: %d', [@pRec, pRec.ID]));
  Writeln(Format('  $%p pPoint: %p', [@pPoint, pPoint]));
  Writeln(Format('  $%p pVariant: %s', [@pVariant, pVariant]));
end;

class procedure TParametros.ExecutaAlgoOut(out pData: TDateTime;
  out pFloat: Double; out pInt: Integer; out pBool: Boolean; out pStr: string;
  out pCh: Char; out pRec: TMeuRec; out pPoint: Pointer; out pVariant: Variant);
begin
  /// é igual ao var!
end;

class procedure TParametros.ExecutaAlgoVar(var pData: TDateTime;
  var pFloat: Double; var pInt: Integer; var pBool: Boolean; var pStr: string;
  var pCh: Char; var pRec: TMeuRec; var pPoint: Pointer; var pVariant: Variant);

  function GeraRec: TMeuRec;
  begin
    Result.ID := 534;
  end;

begin
  pData := Now;
  pFloat := 100;
  pInt := 342;
  pBool := True;
  pStr := 'Alt';
  pCh := #9;
  pRec.ID := 32;
  pPoint := Pointer($3212);
  pVariant := 1234;
  pRec := GeraRec;

//  Writeln(Format('  $%p pData: %n', [@pData, pData]));
//  Writeln(Format('  $%p pFloat: %n', [@pFloat, pFloat]));
//  Writeln(Format('  $%p pInt: %d', [@pInt, pInt]));
//  Writeln(Format('  $%p pBool: %s', [@pBool, BoolToStr(pBool, True)]));
//  Writeln(Format('  $%p pStr: %s', [@pStr, pStr]));
//  Writeln(Format('  $%p pCh: %s', [@pCh, pCh]));
  Writeln(Format('  $%p pRec: %d', [@pRec, pRec.ID]));
  Writeln(Format('  $%p pPoint: %p', [@pPoint, pPoint]));
  Writeln(Format('  $%p pVariant: %s', [@pVariant, pVariant]));
end;

end.
