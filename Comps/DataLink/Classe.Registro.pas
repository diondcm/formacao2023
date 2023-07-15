unit Classe.Registro;

interface

uses System.SysUtils, System.Classes, Classe.CalendarPickerDB;

 procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('AquaComps', [TCalendarPickerDB]);
end;

end.
