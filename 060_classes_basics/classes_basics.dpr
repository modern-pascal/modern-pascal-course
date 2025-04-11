program classes_basics;

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

uses SysUtils;

type
  TCreature = class
    // fields
    Name: String;
    HitPoints: Integer;
    // methods
    function WillSurviveAttack(AttackDamage: Integer): Boolean;
  end;

function TCreature.WillSurviveAttack(AttackDamage: Integer): Boolean;
begin
  Result := HitPoints > AttackDamage;
end;

var
  // 2 instances of class TCreature
  Werewolf: TCreature;
  Vampire: TCreature;
begin
  Werewolf := TCreature.Create;
  Werewolf.Name := 'Werewolf';
  Werewolf.HitPoints := 100;

  Vampire := TCreature.Create;
  Vampire.Name := 'Vampire';
  Vampire.HitPoints := 50;

  if Werewolf.WillSurviveAttack(20) then
    Writeln(Werewolf.Name, ' survived the attack!')
  else
    Writeln(Werewolf.Name, ' did not survive the attack!');

  if Vampire.WillSurviveAttack(60) then
    Writeln(Vampire.Name, ' survived the attack!')
  else
    Writeln(Vampire.Name, ' did not survive the attack!');

  Werewolf.HitPoints := Werewolf.HitPoints - 20;
  Vampire.HitPoints := Vampire.HitPoints - 60;

  if Werewolf.WillSurviveAttack(20) then
    Writeln(Werewolf.Name, ' survived the attack!')
  else
    Writeln(Werewolf.Name, ' did not survive the attack!');
  Werewolf.HitPoints := Werewolf.HitPoints - 20;

  if Werewolf.WillSurviveAttack(20) then
    Writeln(Werewolf.Name, ' survived the attack!')
  else
    Writeln(Werewolf.Name, ' did not survive the attack!');
  Werewolf.HitPoints := Werewolf.HitPoints - 20;
  if Werewolf.WillSurviveAttack(20) then
    Writeln(Werewolf.Name, ' survived the attack!')
  else
    Writeln(Werewolf.Name, ' did not survive the attack!');
  Werewolf.HitPoints := Werewolf.HitPoints - 20;
  if Werewolf.WillSurviveAttack(20) then
    Writeln(Werewolf.Name, ' survived the attack!')
  else
    Writeln(Werewolf.Name, ' did not survive the attack!');
  Werewolf.HitPoints := Werewolf.HitPoints - 20;
  if Werewolf.WillSurviveAttack(20) then
    Writeln(Werewolf.Name, ' survived the attack!')
  else
    Writeln(Werewolf.Name, ' did not survive the attack!');
  Werewolf.HitPoints := Werewolf.HitPoints - 20;
  if Werewolf.WillSurviveAttack(20) then
    Writeln(Werewolf.Name, ' survived the attack!')
  else
    Writeln(Werewolf.Name, ' did not survive the attack!');
  Werewolf.HitPoints := Werewolf.HitPoints - 20;
  if Werewolf.WillSurviveAttack(20) then
    Writeln(Werewolf.Name, ' survived the attack!')
  else
    Writeln(Werewolf.Name, ' did not survive the attack!');
  Werewolf.HitPoints := Werewolf.HitPoints - 20;
  if Werewolf.WillSurviveAttack(20) then
    Writeln(Werewolf.Name, ' survived the attack!')
  else
    Writeln(Werewolf.Name, ' did not survive the attack!');
  Werewolf.HitPoints := Werewolf.HitPoints - 20;
  if Werewolf.WillSurviveAttack(20) then
    Writeln(Werewolf.Name, ' survived the attack!')
  else
    Writeln(Werewolf.Name, ' did not survive the attack!');
  Werewolf.HitPoints := Werewolf.HitPoints - 20;

  Writeln('at the end, hit points of werewolf: ', Werewolf.HitPoints);
  Writeln('at the end, hit points of vampire: ', Vampire.HitPoints);

  if Vampire = nil then
    Writeln('Vampire is nil')
  else
    Writeln('Vampire is not nil');

  // Free memory
  // Werewolf.Free;
  // Vampire.Free;
  // even better to use FreeAndNil
  FreeAndNil(Werewolf);
  FreeAndNil(Vampire);

  if Vampire = nil then
    Writeln('Vampire is nil')
  else
    Writeln('Vampire is not nil');

  Readln;
end.
