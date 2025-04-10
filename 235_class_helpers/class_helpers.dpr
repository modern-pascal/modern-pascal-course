program class_helpers;

{$APPTYPE CONSOLE}

uses System.SysUtils, MyCreatures;

type
  TWeapon = class
    Damage: Integer;
  end;

  TCreatureHelper = class helper for TCreature
  public
    function Alive: Boolean;
    procedure Hurt(const Weapon: TWeapon);
  end;

function TCreatureHelper.Alive: Boolean;
begin
  Result := HitPoints > 0;
end;

procedure TCreatureHelper.Hurt(const Weapon: TWeapon);
begin
  HitPoints := HitPoints - Weapon.Damage;
end;

(*
// This would also be reasonable solution.
// Class helpers are just syntactic sugar.
procedure WeaponHurt(const C: TCreature; const Weapon: TWeapon);
begin
  C.HitPoints := C.HitPoints - Weapon.Damage;
end;
*)

var
  Sword: TWeapon;
  Werewolf: TWerewolf;
begin
  try
    Sword := TWeapon.Create;
    Sword.Damage := 40;

    Werewolf := TWerewolf.Create;
    Werewolf.Name := 'Wolfie';
    Werewolf.HitPoints := 100;

    Werewolf.Hurt(Sword);
    Writeln(Werewolf.Name, ' has ', Werewolf.HitPoints, ' hit points left, alive: ', Werewolf.Alive);
    Werewolf.Hurt(Sword);
    Writeln(Werewolf.Name, ' has ', Werewolf.HitPoints, ' hit points left, alive: ', Werewolf.Alive);
    Werewolf.Hurt(Sword);
    Writeln(Werewolf.Name, ' has ', Werewolf.HitPoints, ' hit points left, alive: ', Werewolf.Alive);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.

