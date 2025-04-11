program Project1;

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

uses
  SysUtils;

procedure Cave; forward;
procedure Forest; forward;
procedure Castle; forward;

procedure Cave;
var
  C: Char;
begin
  Writeln('You see a dragon. Do you fight? (y / n)');

  Readln(C);

  case C of
    'y':Writeln('You lost.');
    'n':begin
          Writeln('You ran away.');
          Forest;
        end;
    else
        begin
          Writeln('Invalid response, try again');
          Cave;
        end;
  end;
end;

procedure Forest;
var
  C: Char;
begin
  Writeln('You are in the forest');
  Writeln('l - go left');
  Writeln('r - go right');

  Readln(C);

  case C of
    'l': Castle;
    'r': Cave;
    else
        begin
          Writeln('Invalid response, try again');
          Forest;
        end;
  end;
end;

procedure Castle;
var
  C: Char;
begin
  Writeln('You are in the castle');
  Writeln('b - go back to the forest');
  Writeln('s - stay');

  Readln(C);

  case C of
    'b':Forest;
    's':begin
          Writeln('You married the princess!');
        end;
    else
        begin
          Writeln('Invalid response, try again');
          Forest;
        end;
  end;
end;

begin
  Forest;
  Writeln('The End');
  Readln;
end.
