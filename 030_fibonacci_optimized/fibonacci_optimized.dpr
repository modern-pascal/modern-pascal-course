{ Fast Fibonacci implementation (but using 32-bit numbers,
  so will fail before 50th Fibonacci number). }

program fibonacci_optimized;

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

var
  FiboValues: array [0..1000] of Integer;
  I: Integer;
begin
  FiboValues[0] := 0;
  FiboValues[1] := 1;
  for I := 2 to 40 do
  begin
    FiboValues[I] := FiboValues[I - 1] + FiboValues[I - 2];
    Writeln('Fibonacci(', I, ') = ', FiboValues[I]);
  end;
  Readln;
end.
