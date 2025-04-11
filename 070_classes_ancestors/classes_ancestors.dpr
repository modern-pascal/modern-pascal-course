{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

uses SysUtils;

type
  TPlayer = class
    Poisoned: Boolean;
    HitPoints: Integer;
  end;

  TCreature = class
    // fields
    Name: String;
    HitPoints: Integer;
    procedure Attack(const Player: TPlayer); virtual;
  end;

  TVampyre = class(TCreature)
    // fields
    FangsPoisonous: Boolean;
    procedure Attack(const Player: TPlayer); override;
  end;

  TRobot = class(TCreature)
    Cpu: String;
  end;

  TApple = class

  end;

procedure TCreature.Attack(const Player: TPlayer);
begin
  Player.HitPoints := Player.HitPoints - 1;
end;

procedure TVampyre.Attack(const Player: TPlayer);
begin
  inherited;
  if FangsPoisonous then
    Player.Poisoned := true;
end;

var
  //Vlad, Dracula: TVampyre;
  Vlad: TVampyre;
  Dracula: TVampyre;
  C: array [0..1] of TCreature;
  Player: TPlayer;
begin
  {$ifndef FPC} ReportMemoryLeaksOnShutdown := true; {$endif}

  Vlad := TVampyre.Create;
  Vlad.Name := 'Vlad';
  Vlad.FangsPoisonous := False;

  Dracula := TVampyre.Create;
  Dracula.Name := 'Dracula';
  Dracula.FangsPoisonous := True;

  Player := TPlayer.Create;
  Player.HitPoints := 100;

  WriteLn('Vlad: ', Vlad.Name, ' ', Vlad.HitPoints, ', FangsPoisonous? ', Vlad.FangsPoisonous);
  WriteLn('Dracula: ', Dracula.Name, ' ', Dracula.HitPoints, ', FangsPoisonous? ', Dracula.FangsPoisonous);

  C[0] := Vlad;
  C[1] := Dracula;

  // This works, whether Attack is virtual or not.
  // Because at compile-time the compiler knows this is TVampyre.Attack.
  // Vlad.Attack(Player);
  // Vlad.Attack(Player);
  // Vlad.Attack(Player);
  // Dracula.Attack(Player);

  // This works, just like above, but only when the Attack is virtual.
  // At compile-time (if Attack is not virtual) the compiler could only
  // determine to call TCreature.Attack.
  C[0].Attack(Player);
  C[0].Attack(Player);
  C[0].Attack(Player);
  C[1].Attack(Player);

  Writeln('Player: ', Player.HitPoints, ', Poisoned? ', Player.Poisoned);

  Writeln('C[0] is TCreature: ', C[0] is TCreature);
  Writeln('C[0] is TVampyre: ', C[0] is TVampyre);
  Writeln('C[0] is TRobot: ', C[0] is TRobot);
  // This check makes no sense, because TApple is not a descendant of TCreature.
  // It would always be false, compiler assumes it's just an error in your thinking.
  // Writeln(C[0] is TApple);

  FreeAndNil(Vlad);
  FreeAndNil(Dracula);
  FreeAndNil(Player);

  Readln;
end.

