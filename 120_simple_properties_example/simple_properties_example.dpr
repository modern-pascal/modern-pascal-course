program simple_properties_example;

uses SysUtils;

{$APPTYPE CONSOLE}

type
  TCreature = class
  strict private
    FHitPoints: Integer;
    procedure SetHitPoints(const Value: Integer);
  public
    const
      DefaultHitPoints = 100;
    constructor Create;
  published
    property HitPoints: Integer read FHitPoints write SetHitPoints
      default DefaultHitPoints;
  end;

{ TCreature }

constructor TCreature.Create;
begin
  inherited;
  FHitPoints := DefaultHitPoints;
end;

procedure TCreature.SetHitPoints(const Value: Integer);
begin
  if FHitPoints <> Value then
  begin
    if (FHitPoints > 0) and (Value <= 0) then
      Writeln('Creature dying!');
    if (FHitPoints <= 0) and (Value > 0) then
      raise Exception.Create('Not allowed to resurrect the creature');
    FHitPoints := Value;
  end;
end;

var
  Werewolf: TCreature;
  I: Integer;
begin
  Werewolf := TCreature.Create;
  try
    for I := 1 to 20 do
    begin
      Werewolf.HitPoints := Werewolf.HitPoints - 10;
      Writeln('Damaged by 10, now hp ', Werewolf.HitPoints);
    end;
  finally
    FreeAndNil(Werewolf);
  end;
  Readln;
end.
