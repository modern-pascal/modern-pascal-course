program memory_garbage_free;

{ THIS IS WRONG APPLICATION,
  ONLY TO SHOW THE PROBLEM WITH FREEING MEMORY GARBAGE. }

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

uses SysUtils, Generics.Collections;

procedure Foo;
var
  O: TObject; // memory garbage
begin
  O := nil;
  try
    raise Exception.Create('Error Message');
    O := TObject.Create;
    Writeln(O.ClassName);
  finally
    FreeAndNil(O);
  end;
end;

begin
  Foo;
  Readln;
end.

