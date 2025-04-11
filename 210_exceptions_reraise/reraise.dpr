program exceptions;

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

uses SysUtils, Generics.Collections;

type
  TCreature = class
    Name: String;
    procedure LoadMyData;
  end;

{ TCreature }

procedure TCreature.LoadMyData;
begin
  // dummy test, always fail for Werewolf
  if Name = 'Werewolf' then
    raise Exception.Create('Error Message');
end;

procedure LoadData(const Creatures: TObjectList<TCreature>);
var
  C: TCreature;
begin
  for C in Creatures do
  begin
    try
      C.LoadMyData;
    except
      on E: Exception do
      begin
        E.Message := E.Message + ' (on creature ' + C.Name + ')';
        raise;
      end;
    end;
  end;
end;

var
  Creatures: TObjectList<TCreature>;
  C: TCreature;
begin
  Creatures := TObjectList<TCreature>.Create(true);
  try
    try
      C := TCreature.Create;
      C.Name := 'Vampyre';
      Creatures.Add(C);

      C := TCreature.Create;
      C.Name := 'Werewolf';
      Creatures.Add(C);

      LoadData(Creatures);
    except
      on E: Exception do
        Writeln(E.ClassName, ': ', E.Message);
    end;
  finally
    FreeAndNil(Creatures);
  end;

  Readln;
end.

