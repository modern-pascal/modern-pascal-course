{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  TMyClass = class
  strict private
    FMyInt: Integer; // F like "field"
    // Ctrl + Shift + C ("c" like "completion")
    function GetMyInt: Integer;
    procedure SetMyInt(const Value: Integer);
  public
    procedure Attack;
    { Setting limits the value to 0..1000 * 1000 }
    property MyInt: Integer read GetMyInt write SetMyInt;
  end;

procedure TMyClass.Attack;
begin
  FMyInt := FMyInt + 1;
end;

// getter
function TMyClass.GetMyInt: Integer;
begin
  Result := FMyInt;
end;

// setter
procedure TMyClass.SetMyInt(const Value: Integer);
begin
  FMyInt := Value;
  if FMyInt < 0 then
    FMyInt := 0;
  if FMyInt > 1000 * 1000 then
    FMyInt := 1000 * 1000;
end;

var
  C: TMyClass;
begin
  C := TMyClass.Create;
  Writeln(C.MyInt); // guaranteed 0
  C.MyInt := 123;
  Writeln(C.MyInt);
  C.MyInt := -1;
  Writeln(C.MyInt);
  FreeAndNil(C);

  Readln;
end.
