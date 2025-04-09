{$apptype CONSOLE}

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

//  Vlad.Attack(Player);
//  Vlad.Attack(Player);
//  Vlad.Attack(Player);
//  Dracula.Attack(Player);

  // equivalent, because Attack is virtual
  C[0].Attack(Player);
  C[0].Attack(Player);
  C[0].Attack(Player);
  C[1].Attack(Player);

  Writeln('Player: ', Player.HitPoints, ', Poisoned? ', Player.Poisoned);

  FreeAndNil(Vlad);
  FreeAndNil(Dracula);

  Readln;
end.

