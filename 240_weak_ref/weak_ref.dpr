program weak_ref;

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

uses SysUtils, Classes;

type
  TCreature = class(TComponent)
  public
    Name: String;
    procedure Attack; // no need for virtual now
  end;

  TMyCreatureManager = class(TComponent)
  strict private
    FMostFearsome: TCreature;
    procedure SetMostFearsome(const Value: TCreature);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    destructor Destroy; override;
    property MostFearsome: TCreature read FMostFearsome write SetMostFearsome;
    procedure AttackWithMostFearsome;
  end;

{ TCreature }

procedure TCreature.Attack;
begin
  Writeln(Name, ' attacks!');
end;

{ TMyCreatureManager }

procedure TMyCreatureManager.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (AComponent = FMostFearsome) then
    { set to nil by SetMostFearsome to clean nicely }
    MostFearsome := nil;
end;

procedure TMyCreatureManager.SetMostFearsome(const Value: TCreature);
begin
  if FMostFearsome <> Value then
  begin
    if FMostFearsome <> nil then
      FMostFearsome.RemoveFreeNotification(Self);
    FMostFearsome := Value;
    if FMostFearsome <> nil then
      FMostFearsome.FreeNotification(Self);
  end;
end;

destructor TMyCreatureManager.Destroy;
begin
  { set to nil by SetMostFearsome, to detach free notification }
  MostFearsome := nil;
  inherited;
end;

procedure TMyCreatureManager.AttackWithMostFearsome;
begin
  if MostFearsome <> nil then
    MostFearsome.Attack
  else
    Writeln('No creature with which to attack!');
end;

{ Main program }

var
  MyCreatureManager: TMyCreatureManager;
  Werewolf: TCreature;
  Vampyre: TCreature;
begin
  {$ifndef FPC} ReportMemoryLeaksOnShutdown := true; {$endif}

  try
    try
      Werewolf := TCreature.Create(nil);
      Werewolf.Name := 'Wolfie';

      Vampyre := TCreature.Create(nil);
      Vampyre.Name := 'Dracula';

      MyCreatureManager := TMyCreatureManager.Create(nil);
      MyCreatureManager.MostFearsome := Werewolf;
      MyCreatureManager.AttackWithMostFearsome;

      FreeAndNil(Werewolf);
      Assert(MyCreatureManager.MostFearsome = nil);
      // would crash without FreeNotification
      MyCreatureManager.AttackWithMostFearsome;

      MyCreatureManager.MostFearsome := Vampyre;
      MyCreatureManager.AttackWithMostFearsome;
    finally
      FreeAndNil(Werewolf);
      FreeAndNil(Vampyre);
      FreeAndNil(MyCreatureManager);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.
