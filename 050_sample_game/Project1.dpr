program Project1;

{ Note: Encoding of this file is Windows 1250, to make the ouput "just work"
  on Polish Windows.
  This is just a demo for fun -- for serious development,
  I advise UTF-8 for all files (source code, data files) and proper conversions
  to whatever output expects. }

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

uses
  SysUtils;

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
    't':Writeln('Przegra�e�.');
    'n':begin
          Writeln('Uciek�e�.');
          Las;
        end;
    else
        begin
          Writeln('Nieprawid�owa odpowied�, jeszcze raz');
          Jaskinia;
        end;
  end;
end;

procedure Las;
var
  C: Char;
begin
  Writeln('Jeste� w lesie');
  Writeln('l - id� w lewo');
  Writeln('p - id� w prawo');

  Readln(C);

  case C of
    'l': Zamek;
    'p': Jaskinia;
    else
        begin
          Writeln('Nieprawid�owa odpowied�, jeszcze raz');
          Las;
        end;
  end;
end;

procedure Zamek;
var
  C: Char;
begin
  Writeln('Jeste� w zamku');
  Writeln('w - wr�c do lasu');
  Writeln('z - zosta�');

  Readln(C);

  case C of
    'w':Las;
    'z':begin
          Writeln('Pos�ubi�e� ksi�niczk�!');
        end;
    else
        begin
          Writeln('Nieprawid�owa odpowied�, jeszcze raz');
          Las;
        end;
  end;
end;

begin
  Las;
  Writeln('Koniec');
  Readln;
end.
