program callbacks_events;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
  TMyFunction = function (const X, Y: Integer): Integer;

  TMyEvent = function (const X, Y: Integer): Integer of object;

  TMyReference = reference to function (const X, Y: Integer): Integer;

  TMyClass = class
    function Add(const X, Y: Integer): Integer;
    function Multiply(const X, Y: Integer): Integer;
  end;

{ TMyClass }

function TMyClass.Add(const X, Y: Integer): Integer;
begin
  Result := X + Y;
end;

function TMyClass.Multiply(const X, Y: Integer): Integer;
begin
  Result := X * Y;
end;

{ Compare methods comparing both instance and code pointer. }
function SameMethods(const AMethod1, AMethod2: TMethod): Boolean;
begin
  Result :=
    (AMethod1.Code = AMethod2.Code) and
    (AMethod1.Data = AMethod2.Data);
end;

function AddGlobal(const X, Y: Integer): Integer;
begin
  Result := X + Y;
end;

var
  C1, C2: TMyClass;
  E1, E2: TMyEvent;
  R: TMyReference;
begin
  try
    try
      C1 := TMyClass.Create;
      C2 := TMyClass.Create;

      E1 := C1.Add;
      E2 := C1.Multiply;
      Writeln('C1.Add = C1.Multiply? ', @E1 = @E2);
      Writeln('C1.Add = C1.Multiply, using SameMethods? ', SameMethods(TMethod(E1), TMethod(E2)));

      Writeln(E1(12, 34));
      Writeln(E2(12, 34));

      E1 := C1.Add;
      E2 := C2.Add;
      Writeln('C1.Add = C2.Add? ', @E1 = @E2);
      Writeln('C1.Add = C2.Add, using SameMethods? ', SameMethods(TMethod(E1), TMethod(E2)));

      R := C1.Add;
      Writeln(R(123, 567));
      R := AddGlobal;
      Writeln(R(123, 567));
    finally
      FreeAndNil(C1);
      FreeAndNil(C2);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.
