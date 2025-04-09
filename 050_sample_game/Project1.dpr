program Project1;

{ Note: Encoding of this file is Windows 1250, to make the ouput "just work"
  on Polish Windows.
  This is just a demo for fun -- for serious development,
  I advise UTF-8 for all files (source code, data files) and proper conversions
  to whatever output expects. }

{$APPTYPE CONSOLE}

uses
  System.SysUtils;

procedure Jaskinia; forward;
procedure Las; forward;
procedure Zamek; forward;

procedure Jaskinia;
var
  C: Char;
begin
  Writeln('Widzisz smoka. Walczysz?');

  Readln(C);

  case C of
    't':Writeln('Przegra³eœ.');
    'n':begin
          Writeln('Uciek³eœ.');
          Las;
        end;
    else
        begin
          Writeln('Nieprawid³owa odpowiedŸ, jeszcze raz');
          Jaskinia;
        end;
  end;
end;

procedure Las;
var
  C: Char;
begin
  Writeln('Jesteœ w lesie');
  Writeln('l - idê w lewo');
  Writeln('p - idê w prawo');

  Readln(C);

  case C of
    'l': Zamek;
    'p': Jaskinia;
    else
        begin
          Writeln('Nieprawid³owa odpowiedŸ, jeszcze raz');
          Las;
        end;
  end;
end;

procedure Zamek;
var
  C: Char;
begin
  Writeln('Jesteœ w zamku');
  Writeln('w - wróc do lasu');
  Writeln('z - zostañ');

  Readln(C);

  case C of
    'w':Las;
    'z':begin
          Writeln('Pos³ubi³eœ ksiê¿niczkê!');
        end;
    else
        begin
          Writeln('Nieprawid³owa odpowiedŸ, jeszcze raz');
          Las;
        end;
  end;
end;

begin
  Las;
  Writeln('Koniec');
  Readln;
end.
