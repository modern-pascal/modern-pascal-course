program array_properties;

{$APPTYPE CONSOLE}

uses
  SysUtils, UnitCreature, UnitCreatureChild;

var
  Werewolf: TCreature;
  I: Integer;
begin
  Werewolf := TCreature.Create;
  try
  finally
    FreeAndNil(Werewolf);
  end;

  Werewolf := TCreature.Create;
  try
    //Werewolf.MyProtectedField := 12; // not possible
  finally
    FreeAndNil(Werewolf);
  end;

  Werewolf := TCreature.Create;
  try
  finally
    FreeAndNil(Werewolf);
  end;

  Readln;
end.
