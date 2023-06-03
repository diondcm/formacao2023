unit Form.ThreadExcept;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Generics.Collections;

type
  TfrmThreadsExcept = class(TForm)
    PanelControles: TPanel;
    ButtonException: TButton;
    ButtonExceptionThr: TButton;
    PanelTempoErro: TPanel;
    ButtonSemException: TButton;
    ButtonComException: TButton;
    procedure ButtonExceptionClick(Sender: TObject);
    procedure ButtonExceptionThrClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonComExceptionClick(Sender: TObject);
    procedure ButtonSemExceptionClick(Sender: TObject);
  private
    const
      MAX_LOOP = 10000000;
  private
    FListaErros: TDictionary<string, Integer>;
  public
    { Public declarations }
  end;

var
  frmThreadsExcept: TfrmThreadsExcept;

implementation

{$R *.dfm}

procedure TfrmThreadsExcept.ButtonSemExceptionClick(Sender: TObject);
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      TThread.NameThreadForDebugging('Thread-SemEx');
      try
        var iniTime: TDateTime := Now;
        var str: string := 'r';
        var intOut: Integer;
        for var j := 0 to MAX_LOOP -1 do
        begin
          try
            TryStrToInt(str, intOut);
          except
            // não usar
          end;
        end;

        TThread.Synchronize(nil,
          procedure
          begin
            ShowMessage('Com erro finalizado: ' + TimeToStr(Now - iniTime));
          end);
      except
        on E: Exception do
        begin
          TThread.Synchronize(nil,
            procedure
            begin
              if FListaErros.ContainsKey(E.Message) then
              begin
                FListaErros[E.Message] := FListaErros[E.Message] + 1;
              end else begin
                FListaErros.Add(E.Message, 1);
              end;
            end);
        end;
      end;
    end).Start;
end;

procedure TfrmThreadsExcept.ButtonComExceptionClick(Sender: TObject);
begin
//  for var i: integer := 0 to 0 do
  TThread.CreateAnonymousThread(
    procedure
    begin
      TThread.NameThreadForDebugging('Thread-ComEx');
      try
        var iniTime: TDateTime := Now;
        var str: string := 'r';
        var intOut: Integer;
        for var j := 0 to MAX_LOOP -1 do
        begin
          try
            StrToInt(str);
          except
            // não usar
            intOut := 0;
          end;
        end;

        TThread.Synchronize(nil,
          procedure
          begin
            ShowMessage('Com erro finalizado: ' + TimeToStr(Now - iniTime));
          end);
      except
        on E: Exception do
        begin
          TThread.Synchronize(nil,
            procedure
            begin
              if FListaErros.ContainsKey(E.Message) then
              begin
                FListaErros[E.Message] := FListaErros[E.Message] + 1;
              end else begin
                FListaErros.Add(E.Message, 1);
              end;
            end);
        end;
      end;
    end).Start;
end;

procedure TfrmThreadsExcept.ButtonExceptionClick(Sender: TObject);
var
  erroPair: TPair<string, Integer>;
begin
  raise Exception.Create('Error Message');
  for erroPair in FListaErros do
  begin
    ShowMessage(erroPair.Key + ': ' + IntToStr(erroPair.Value));
  end;
end;

procedure TfrmThreadsExcept.ButtonExceptionThrClick(Sender: TObject);
begin
  FListaErros.Clear;
  for var i: integer := 0 to 5 do
    TThread.CreateAnonymousThread(
      procedure
      begin
        TThread.NameThreadForDebugging('Thread-ex');
        try
          raise Exception.Create('Error Message');
        except
          on E: Exception do
          begin
            TThread.Synchronize(nil,
              procedure
              begin
                if FListaErros.ContainsKey(E.Message) then
                begin
                  FListaErros[E.Message] := FListaErros[E.Message] + 1;
                end else begin
                  FListaErros.Add(E.Message, 1);
                end;
//                ShowMessage('Erro na Thread: ' + E.Message);
              end);
          end;
        end;

//        var j: Integer := Random(1000);
//        j := j + 9;

      end).Start;
end;

procedure TfrmThreadsExcept.FormCreate(Sender: TObject);
begin
  TThread.NameThreadForDebugging('Main');
  FListaErros := TDictionary<string, Integer>.Create;
end;

procedure TfrmThreadsExcept.FormDestroy(Sender: TObject);
begin
  FListaErros.Free;
end;

end.
