program generic_lists;

{$APPTYPE CONSOLE}

uses SysUtils, Generics.Collections;

type
  TCreature = class
    HitPoints: Integer;
  end;
var
  Creaturess: TObjectList<TCreature>;
  I: Integer;
begin
  Creaturess := TObjectList<TCreature>.Create(true);

  Creaturess.Add(TCreature.Create);
  Creaturess.Add(TCreature.Create);
  Creaturess.Add(TCreature.Create);
  //Creaturess.Add(TObject.Create); // impossible to compile

  for I := 0 to Creaturess.Count - 1 do
  begin
    Creaturess[I].HitPoints := Creaturess[I].HitPoints + 100;
    // not need for typecasts
  end;

  FreeAndNil(Creaturess);

  Readln;
end.
