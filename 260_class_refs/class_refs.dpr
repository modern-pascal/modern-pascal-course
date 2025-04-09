program class_refs;

{$APPTYPE CONSOLE}

uses SysUtils;

type
  TCreature = class abstract
    Name: String;
    HitPoints: Integer;
    constructor Create; virtual;
    class function HasHair: Boolean; virtual; abstract;
  end;

  TWerewolf = class(TCreature)
    constructor Create; override;
    class function HasHair: Boolean; override;
  end;

  TVampyre = class(TCreature)
    constructor Create; override;
    class function HasHair: Boolean; override;
  end;

  TRobot = class(TCreature)
    constructor Create; override;
    class function HasHair: Boolean; override;
  end;

  TCreatureClass = class of TCreature;

{ TCreature }

constructor TCreature.Create;
begin
  inherited;
  // nothing to do here
end;

{ TWerewolf }

constructor TWerewolf.Create;
begin
  inherited Create;
  HitPoints := 100;
  case Random(4) of
    0: Name := 'Wolfie';
    1: Name := 'Fang';
    2: Name := 'Howler';
    3: Name := 'Snarler';
  end;
end;

class function TWerewolf.HasHair: Boolean;
begin
  Result := True;
end;

{ TVampyre }

constructor TVampyre.Create;
begin
  inherited Create;
  HitPoints := 50;
  case Random(4) of
    0: Name := 'Dracula';
    1: Name := 'Nosferatu';
    2: Name := 'Count Chocula';
    3: Name := 'Vlad the Impaler';
  end;
end;

class function TVampyre.HasHair: Boolean;
begin
  Result := True;
end;

{ TRobot }

constructor TRobot.Create;
begin
  inherited Create;
  HitPoints := 200;
  case Random(4) of
    0: Name := 'R2D2';
    1: Name := 'C3PO';
    2: Name := 'Bender';
    3: Name := 'Optimus Prime';
  end;
end;

class function TRobot.HasHair: Boolean;
begin
  Result := false;
end;

procedure MakeRandomCreature;
var
  MyCreatureClass: TCreatureClass;
  C: TCreature;
begin
  case Random(3) of
    0: MyCreatureClass := TWerewolf;
    1: MyCreatureClass := TVampyre;
    2: MyCreatureClass := TRobot;
  end;

  Writeln('Creating a ', MyCreatureClass.ClassName, '...');
  Writeln('  it will have hair? ', MyCreatureClass.HasHair);

  C := MyCreatureClass.Create;
  Writeln('  it has name: ', C.Name);
  Writeln('  it has hit points: ', C.HitPoints);
  FreeAndNil(C);
end;

begin
  try
    Randomize;
    MakeRandomCreature;
    MakeRandomCreature;
    MakeRandomCreature;
    MakeRandomCreature;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.
