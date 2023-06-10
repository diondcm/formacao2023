unit Classe.Remote.Debug;

interface

uses
  System.SysUtils, System.Classes, System.Types,
  Winapi.ShellAPI, System.IOUtils, Winapi.Windows,
  Winapi.TlHelp32;

{$R RemoteDebugRes.dres}

type
  TRemoteDebug = class
  const
    BRCIDE = 'brcide';
    COMP32X = 'comp32x';
    DCC32280 = 'dcc32280';
    BORDBK280 = 'bordbk280';
    BORDBK280N = 'bordbk280N';
    RMTDBG280 = 'rmtdbg280';
  public
    class procedure Extrair;
    class procedure Finalizar;
    class procedure KillTask(nomeProcesso: string);
  end;

implementation

{ TRemoteDebug }

class procedure TRemoteDebug.Extrair;

  procedure ExtrairResource(fileName, extension: string);
  begin
    var arqLocal: string := fileName + '.' + extension;
    if not TFile.Exists(arqLocal) then
    begin
      var res: TResourceStream := TResourceStream.Create(HInstance, fileName, System.Types.RT_RCDATA);
      try
        res.Position := 0;
        res.SaveToFile(arqLocal);
      finally
        res.Free;
      end;
    end;
  end;

begin
  ExtrairResource(COMP32X, 'dll');
  ExtrairResource(BORDBK280, 'dll');
  ExtrairResource(BORDBK280N, 'dll');
  ExtrairResource(BRCIDE, 'dll');
  ExtrairResource(DCC32280, 'dll');
  ExtrairResource(RMTDBG280, 'exe');

  ShellExecute(0, nil, RMTDBG280 + '.exe', nil, nil, SW_SHOWNORMAL); // SW_HIDE
end;

class procedure TRemoteDebug.Finalizar;
begin
  KillTask(RMTDBG280 + '.exe');

  DeleteFile(COMP32X + '.dll');
  DeleteFile(BORDBK280 + '.dll');
  DeleteFile(BORDBK280N + '.dll');
  DeleteFile(BRCIDE + '.dll');
  DeleteFile(DCC32280 + '.dll');
  DeleteFile(RMTDBG280 + '.exe');
end;

class procedure TRemoteDebug.KillTask(nomeProcesso: string);
type
  TFuncProcess = reference to function(PID: Cardinal): Boolean; // TFunc<Cardinal, Boolean>

var
 closeProc: Boolean;

 procedure LoopProcess(funcValidacao: TFuncProcess);
 begin
   var snapShot: Cardinal := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
   try
     closeProc := True;
     var countLoop: Integer := 0;
     var processEntry: TProcessEntry32;
     processEntry.dwSize := SizeOf(processEntry);
     var continueLoop: Boolean := Process32First(snapShot, processEntry);
     while (continueLoop and closeProc and (countLoop < 100010)) do
     begin
       Inc(countLoop);

       if (CompareStr(UpperCase(ExtractFileName(processEntry.szExeFile)), UpperCase(nomeProcesso)) = 0) or
         (CompareStr(UpperCase(processEntry.szExeFile), UpperCase(nomeProcesso)) = 0) then
       begin
         closeProc := funcValidacao(processEntry.th32ProcessID);
       end;

       continueLoop := Process32Next(snapShot, processEntry);
     end;

     if countLoop > 100000 then
     begin
       raise Exception.Create('Count Loop excedido');
     end;
   finally
     CloseHandle(snapShot);
   end;
 end;

 procedure WaitProcessTerminate;
 begin
   var counterLoop: Integer := 0;
   var found: Boolean := False;
   var funcLocal: TFuncProcess :=
     function (PID: Cardinal): Boolean
     begin
       found := True;
       Result := True;
     end;

   repeat
     Inc(counterLoop);
     Sleep(50); // 50 * 40 >> 2000 ms >> 2 s

     LoopProcess(funcLocal);

   until ((not found) and (counterLoop < 40));
 end;

begin
  try
    var fnc: TFuncProcess :=
      function(PID: Cardinal): Boolean
      begin
        Result := TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), PID), 0);
      end;

    closeProc := False;
    LoopProcess(fnc);

    if closeProc then
    begin
      WaitProcessTerminate;
    end;
  except
    // somente para devs, tiramos as excepts
  end;
end;

initialization
  TRemoteDebug.Extrair;

finalization
  TRemoteDebug.Finalizar;

end.
