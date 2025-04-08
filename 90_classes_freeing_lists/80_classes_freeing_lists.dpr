{$apptype CONSOLE}

uses SysUtils, Generics.Collections;

type
  TCreature = class
    Name: String;
    HitPoints: Integer;
  end;

  TLocation = class
    Creatures: TObjectList<TCreature>;
    constructor Create;
    destructor Destroy; override;
  end;

constructor TLocation.Create;
begin
  inherited;
  Creatures := TObjectList<TCreature>.Create(true);
end;

destructor TLocation.Destroy;
begin
  FreeAndNil(Creatures);
  inherited;
end;

var
  MyLocation: TLocation;
  Werewolf: TCreature;
  Vampyre: TCreature;
begin
  ReportMemoryLeaksOnShutdown  := true;
  MyLocation := TLocation.Create;
  try
    Werewolf := TCreature.Create;
    Werewolf.Name := 'Werewolf';
    Werewolf.HitPoints := 100;
    MyLocation.Creatures.Add(Werewolf);

    Vampyre := TCreature.Create;
    Vampyre.Name := 'Vampyre';
    Vampyre.HitPoints := 50;
    MyLocation.Creatures.Add(Vampyre);

    Writeln('Location has creatures: ', MyLocation.Creatures.Count);
  finally
    FreeAndNil(MyLocation);
  end;

  Readln;
end.

