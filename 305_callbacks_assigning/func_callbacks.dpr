program func_callbacks;

uses SysUtils;

{$APPTYPE CONSOLE}

type
  TMyFunction = function(const X, Y: Integer): Integer;
  // SizeOf(Pointer)

  TMyEvent = function(const X, Y: Integer): Integer of object;
  // 2 * SizeOf(Pointer);

  TMyReference = reference to function(const X, Y: Integer): Integer;

function Add(const X, Y: Integer): Integer;
begin
  Result := X + Y;
end;

function Multiple(const X, Y: Integer): Integer;
begin
  Result := X * Y;
end;

type
  TMyCalculator = class
    Name: String;
    function Add(const X, Y: Integer): Integer;
    function Multiple(const X, Y: Integer): Integer;
  end;

function TMyCalculator.Add(const X, Y: Integer): Integer;
begin
  Writeln('my calculator with name ', Name);
  Result := X + Y;
end;

function TMyCalculator.Multiple(const X, Y: Integer): Integer;
begin
  Result := X * Y;
end;

var
  F: TMyReference;
  X, Y: Integer;
  C: Char;
  MC: TMyCalculator;
begin
  MC := TMyCalculator.Create;
  try
    MC.Name := 'Good Calculator';

    Writeln('give X');
    Readln(X);

    Writeln('give Y');
    Readln(Y);

    Writeln('give operation (+, *)');
    Readln(C);
    case C of
      '+': F := MC.Add; // Add
      '*': F := MC.Multiple;
      else raise Exception.Create('Invalid input');
    end;

    Writeln(F(X, Y));
  finally
    FreeAndNil(MC);
  end;

  Readln;
end.
