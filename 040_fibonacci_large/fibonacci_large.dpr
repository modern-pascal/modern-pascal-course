{ Fast Fibonacci implementation using 64-bit numbers,
  and assertion to gracefully exit when 64-bit range is not enough. }

program fibonacci_large;

uses SysUtils;

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}
{$assertions on}

var
  FiboValues: array [0..1000] of UInt64;
  I: Integer;
begin
  FiboValues[0] := 0;
  FiboValues[1] := 1;
  for I := 2 to 92 do
  begin
    Assert(Int64(FiboValues[I - 1]) + Int64(FiboValues[I - 2]) < Int64(High(Int64)));
    FiboValues[I] := FiboValues[I - 1] + FiboValues[I - 2];
    Writeln('Fibonacci(', I, ') = ', FiboValues[I]);
  end;
  Readln;
end.
