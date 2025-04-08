{$apptype CONSOLE}

uses SysUtils, Generics.Collections;

type
  TCreature = class
    Name: String;
    HitPoints: Integer;
  end;

  TLocation = class
    Creature1, Creature2: TCreature;
    constructor Create;
    destructor Destroy; override;
  end;

constructor TLocation.Create;
begin
  inherited;
  Creature1 := TCreature.Create;
  Creature2 := TCreature.Create;
end;

destructor TLocation.Destroy;
begin
  FreeAndNil(Creature1);
  FreeAndNil(Creature2);
  inherited;
end;

var
  MyLocation: TLocation;
begin
  ReportMemoryLeaksOnShutdown  := true;
  MyLocation := TLocation.Create;
  try

  finally
    FreeAndNil(MyLocation);
  end;
  Readln;
end.
