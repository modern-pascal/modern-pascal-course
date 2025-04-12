{ Demo of enums and scopedenums in Pascal. }

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}
{$scopedenums on}

uses SysUtils;

type
  TOS = (Linux, Windows, macOS, Android, iOS);

var
  MyFavoriteOs: TOS;

  OrderedOsILike: array of TOS;
  // always integer, from 0

function DoILike(const OS: TOS): Boolean;
begin
  Result := OS = MyFavoriteOs;
end;

function HowMuchDoILike(const OS: TOS): Integer;
var
  I: Integer;
begin
  Result := -1; // if OS not found in the list
  for I := 0 to Length(OrderedOsILike) - 1 do
  begin
    if OrderedOsILike[I] = OS then
    begin
      Result := I;
      Break;
    end;
  end;
end;

begin
  SetLength(OrderedOsILike, 5);
  Writeln('how many OS on the list? ', Length(OrderedOsILike));

  // Length(...) = 5
  // Low(...) = 0
  // High(...) = 4 = Length(...) - 1
  OrderedOsILike[0] := TOS.Linux;
  OrderedOsILike[1] := TOS.Linux;
  OrderedOsILike[2] := TOS.Linux;
  OrderedOsILike[3] := TOS.Windows;
  OrderedOsILike[4] := TOS.Android;

  MyFavoriteOs := TOS.Linux;

  Writeln('Windows? ', HowMuchDoILike(TOS.Windows));
  Writeln('Linux? ', HowMuchDoILike(TOS.Linux));
  Readln;
end.
