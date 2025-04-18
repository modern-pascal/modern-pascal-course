{ See https://en.wikipedia.org/wiki/Fibonacci_sequence .
  This is naive (slow for large numbers) recursive implementation. }

program functions_etc;

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

function Fibonacci(const N: Integer): Integer;
begin
  Writeln('calculating for ', N);
  case N of
    0: Result := 0;
    1: Result := 1;
    else Result := Fibonacci(N - 1) + Fibonacci(N - 2);
  end;
end;

var
  I: Integer;
begin
  for I := 0 to 10 do
    Writeln(Fibonacci(I));
  Readln;
end.
