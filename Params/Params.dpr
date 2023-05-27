program Params;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Classe.Params in 'Classe.Params.pas';


  function GeraRec: TMeuRec;
  begin
    Result.ID := 534;
  end;

begin
  try
    begin
      var obj: TMeuObj := TMeuObj.Create;

      obj.ID.ToString; // call @43423 -> MOV....

      if obj.ID > 1000 then
      begin
        Writeln('ID maior que mil');
      end else begin
        Writeln('ID menor que mil');
      end;

      obj.Free;
    end;

    // record
    begin
      var mr: TMeuRec; // stack
      if mr.ID > 1000 then
      begin

      end;

      Writeln('Rec.ID: ' + IntToStr(mr.ID));
    end;

    var num: Integer; // Byte
      var b: Byte;
      var c: Cardinal;
      var boo: Boolean;
    var str: string;
    var ch: char;
    var fl: Double;
    var dt: TDateTime;
    var superVar: Variant;
    var p: Pointer;
    var meuObj: TMeuObj;

    var prec: PMeuRec;

    prec := @GeraRec;
    Writeln('PRec: ' + Format('%p', [prec]));

    var mr: TMeuRec;
    prec := @mr;
    Writeln('PRec: ' + Format('%p', [prec]));

    New(prec);
    Writeln('PRec: ' + Format('%p', [prec]));
    Dispose(prec);

    // Sistema com XXXX atual de hits/warnings -> nenhum a mais

    if num < 10 then
    begin
      //
    end;

    Writeln('Num: ' + IntToStr(num) + ' str: ' + str + ' Float: ' + FloatToStr(fl) + ' ch: ' + ch + ' Dt: ' + DateToStr(dt));
    Writeln('Byte: ' + IntToStr(b) + ' Cardina: ' + IntToStr(c) + ' Boo: ' + BoolToStr(boo, True));
    Writeln('@P: ' + Format('%p', [p]) + ' Variant: ' + superVar + ' Obj: ' + Format('%p', [@meuObj]));

    Writeln('Data 0: ' + DateTimeToStr(dt));

    // meuObj.ID := 534534; // >> Gera AV

    Writeln;
    Writeln;
    Writeln;

    Writeln('Normal');
//    Write(Format('$%p pData: %n', [@dt, dt]));
//    Write(Format('$%p pFloat: %n', [@fl, fl]));
//    Write(Format('$%p pInt: %d', [@num, num]));
//    Write(Format('$%p pBool: %s', [@boo, BoolToStr(boo, True)]));
//    Write(Format('$%p pStr: %s', [@str, str]));
//    Write(Format('$%p pCh: %s', [@ch, ch]));
    Write(Format('$%p pRec: %d', [@mr, mr.ID]));
    Write(Format('$%p pPoint: %p', [@p, p]));
    Write(Format('$%p pVariant: %s', [@superVar, superVar]));
    Writeln;

    TParametros.ExecutaAlgo(dt, fl, num, boo, str, ch, mr, p, superVar);

    Writeln('Const');
//    Write(Format('$%p pData: %n', [@dt, dt]));
//    Write(Format('$%p pFloat: %n', [@fl, fl]));
//    Write(Format('$%p pInt: %d', [@num, num]));
//    Write(Format('$%p pBool: %s', [@boo, BoolToStr(boo, True)]));
//    Write(Format('$%p pStr: %s', [@str, str]));
//    Write(Format('$%p pCh: %s', [@ch, ch]));
    Write(Format('$%p pRec: %d', [@mr, mr.ID]));
    Write(Format('$%p pPoint: %p', [@p, p]));
    Write(Format('$%p pVariant: %s', [@superVar, superVar]));
    Writeln;
    TParametros.ExecutaAlgoConst(dt, fl, num, boo, str, ch, mr, p, superVar);

    Writeln('Var');
//    Write(Format('$%p pData: %n', [@dt, dt]));
//    Write(Format('$%p pFloat: %n', [@fl, fl]));
//    Write(Format('$%p pInt: %d', [@num, num]));
//    Write(Format('$%p pBool: %s', [@boo, BoolToStr(boo, True)]));
//    Write(Format('$%p pStr: %s', [@str, str]));
//    Write(Format('$%p pCh: %s', [@ch, ch]));
    Write(Format('$%p pRec: %d', [@mr, mr.ID]));
    Write(Format('$%p pPoint: %p', [@p, p]));
    Write(Format('$%p pVariant: %s', [@superVar, superVar]));
    Writeln;
    TParametros.ExecutaAlgoVar(dt, fl, num, boo, str, ch, mr, p, superVar);
//    Write(Format('$%p pData: %n', [@dt, dt]));
//    Write(Format('$%p pFloat: %n', [@fl, fl]));
//    Write(Format('$%p pInt: %d', [@num, num]));
//    Write(Format('$%p pBool: %s', [@boo, BoolToStr(boo, True)]));
//    Write(Format('$%p pStr: %s', [@str, str]));
//    Write(Format('$%p pCh: %s', [@ch, ch]));
    Write(Format('$%p pRec: %d', [@mr, mr.ID]));
    Write(Format('$%p pPoint: %p', [@p, p]));
    Write(Format('$%p pVariant: %s', [@superVar, superVar]));
    Writeln;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  Readln;
end.
