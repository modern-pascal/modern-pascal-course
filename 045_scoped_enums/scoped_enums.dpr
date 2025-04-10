{$APPTYPE CONSOLE}

uses SysUtils;

{$scopedenums on}

type
  TOS = (Linux, Windows, macOS, Android, iOS);

var
  MojUlubiony: TOS;

  WszystkieOSWgJakBardzoJeLubie: array of TOS;
  // always integer, from 0

function CzyLubie(const OS: TOS): Boolean;
begin
  Result := OS = MojUlubiony;
end;

function JakBardzoLubie(const OS: TOS): Integer;
var
  I: Integer;
begin
  for I := 0 to Length(WszystkieOSWgJakBardzoJeLubie) - 1 do
  begin
    if WszystkieOSWgJakBardzoJeLubie[I] = OS then
    begin
      Result := I;
      Break;
    end;
  end;
end;

begin
  SetLength(WszystkieOSWgJakBardzoJeLubie, 5);
  Writeln('how many OS on the list? ', Length(WszystkieOSWgJakBardzoJeLubie));

  // Length(...) = 5
  // Low(...) = 0
  // High(...) = 4 = Length(...) - 1
  WszystkieOSWgJakBardzoJeLubie[0] := TOS.Linux;
  WszystkieOSWgJakBardzoJeLubie[1] := TOS.Linux;
  WszystkieOSWgJakBardzoJeLubie[2] := TOS.Linux;
  WszystkieOSWgJakBardzoJeLubie[3] := TOS.Windows;
  WszystkieOSWgJakBardzoJeLubie[4] := TOS.Android;

  MojUlubiony := TOS.Linux;

  Writeln('win? ',JakBardzoLubie(TOS.Windows));
  Writeln('linux? ',JakBardzoLubie(TOS.Linux));
  Readln;
end.
