{ Simplest console application, the basis for our fun in this course.

  We deliberately start with console applications (though we will
  look at GUI applications later too, see "140_forms_etc") because
  it makes things easy to understand: we start with a clean slate,
  you don't need to understand concepts we will learn later (like classes)
  to understand how this program works. }

program Project1; // optional

{ The APPTYPE CONSOLE is relevant only on Windows + Delphi.
  Because:
  - Windows by default doesn't initialize stdin/stdout/stderr,
  - and Delphi applications are by default GUI applications.
    So Writeln would fail.
  This doesn't matter for FPC (where the default is CONSOLE)
  or other OSes (where the distinction doesn't exist, all programs have
  stdin/stdout/stderr). }
{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

begin
  Writeln('halo halo');

  // wait for user input, to not close the terminal started by F9 from Delphi IDE
  Readln;
end.
