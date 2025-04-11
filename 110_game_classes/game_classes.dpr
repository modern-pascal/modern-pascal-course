program game_classes;

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

uses SysUtils, Generics.Collections;

var
  HasKey: Boolean;
  GameOver: Boolean;

//type
//  TCreature = class
//    HitPoints: Integer;
//    Name: String;
//  end;

{ TLocation ------------------------------------------------------------------ }

type
  TLocation = class
    //Creatures: TObjectList<TCreature>;
    constructor Create;
    destructor Destroy; override;
    function BeforeVisit: Boolean; virtual;
    procedure CoreVisit; virtual;
  end;

var
  CurrentLocation: TLocation;
  NewLocation: TLocation;
  Castle, Forest, Cave: TLocation;
  AllLocations: TObjectList<TLocation>;

constructor TLocation.Create;
begin
  inherited;
  //Creatures := TObjectList<TCreature>.Create(true);
end;

destructor TLocation.Destroy;
begin
  //FreeAndNil(Creatures);
  inherited;
end;

procedure TLocation.CoreVisit;
begin

end;

function TLocation.BeforeVisit: Boolean;
begin
  Result := true;
end;

{ TCastle --------------------------------------------------------------------- }

type
  TCastle = class(TLocation)
    function BeforeVisit: Boolean; override;
    procedure CoreVisit; override;
  end;

function TCastle.BeforeVisit: Boolean;
begin
  Result := HasKey;
  if not Result then
    Writeln('You don''t have the key to enter the castle!');
end;

procedure TCastle.CoreVisit;
var
  C: Char;
begin
  inherited;

  Writeln('You are in the castle');
  Writeln('b - go back to the forest');
  Writeln('s - stay');

  Readln(C);

  case C of
    'b': NewLocation := Forest;
    's': begin
          Writeln('You married the princess!');
          GameOver := true;
        end;
    else
        begin
          Writeln('Invalid response, try again');
          CoreVisit;
        end;
  end;
end;

{ TCave --------------------------------------------------------------------- }

type
  TCave = class(TLocation)
    HasDragon: Boolean;
    KeyInLocation: Boolean;
    constructor Create;
    function BeforeVisit: Boolean; override;
    procedure CoreVisit; override;
  end;

constructor TCave.Create;
//var
//  Smok: TCreature;
begin
  inherited;
//  Smok := TCreature.Create;
//  Smok.HitPoints := 100;
//  Smok.Name := 'Smok';
//  Creatures.Add(Smok);
  HasDragon := true;
  KeyInLocation := true;
end;

function TCave.BeforeVisit: Boolean;
begin
  if HasDragon then
  begin
    Writeln('There is a dragon in the cave, you must defeat it first');
    if Random(4) = 0 then
    begin
      HasDragon := false;
      Writeln('The dragon has been defeated');
      Result := true;
    end else
    begin
      Writeln('The dragon is undefeated, it remains in the cave, you flee');
      Result := false;
    end;
  end else
    Result := inherited;
end;

procedure TCave.CoreVisit;
var
  C: Char;
begin
  inherited;

  Writeln('You see a chest in the cave. Do you open it (o) or leave (l)?');

  Readln(C);

  case C of
    'o': begin
          if KeyInLocation then
          begin
            Writeln('You found the key');
            HasKey := true;
            KeyInLocation := false;
          end else
            Writeln('The chest is empty');
        end;
    'l': begin
          NewLocation := Forest;
        end;
    else
        begin
          Writeln('Invalid response, try again');
          CoreVisit;
        end;
  end;
end;

{ TForest ---------------------------------------------------------------------- }

type
  TForest = class(TLocation)
    procedure CoreVisit; override;
  end;

procedure TForest.CoreVisit;
var
  C: Char;
begin
  Writeln('You are in the forest');
  Writeln('l - go left');
  Writeln('r - go right');

  Readln(C);

  case C of
    'l': NewLocation := Castle;
    'r': NewLocation := Cave;
    else
        begin
          Writeln('Invalid response, try again');
          CoreVisit;
        end;
  end;
end;

begin
  {$ifndef FPC} ReportMemoryLeaksOnShutdown := true; {$endif}
  Randomize;

  AllLocations := TObjectList<TLocation>.Create(true);

  Cave := TCave.Create;
  AllLocations.Add(Cave);

  Forest := TForest.Create;
  AllLocations.Add(Forest);

  Castle := TCastle.Create;
  AllLocations.Add(Castle);

  CurrentLocation := Forest; // start

  repeat
    if NewLocation <> nil then
    begin
      if NewLocation.BeforeVisit then
        CurrentLocation := NewLocation;
      NewLocation := nil;
    end;
    CurrentLocation.CoreVisit;
  until GameOver;

  FreeAndNil(AllLocations);

  Readln;
end.
