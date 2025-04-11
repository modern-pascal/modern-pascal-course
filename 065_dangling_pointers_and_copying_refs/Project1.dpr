program Project1;

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

uses SysUtils;

type
  TCreature = class
    // fields
    Name: String;
    HitPoints: Integer;
    // methods
    constructor Create;
    function WillSurviveAttack(const Damage: Integer): Boolean;
    procedure ZawyjDoKsiezyca;
  end;

  TVampyre = class(TCreature)
    // fields
    FangsPoisonous: Boolean;
  end;

  TLocation = class
    // fields
    Name: String; // ''
    Dangerous: Boolean; // false
    HasDragon: Boolean;
    Creature: TCreature; // nil
    I: Integer; // 0
    S: Single; // 0.0
    // methods
    procedure Visit;
  end;

{ TLocation }

procedure TLocation.Visit;
begin
  Writeln('Odwiedzasz: ', Name);
end;

{ TCreature }

constructor TCreature.Create;
begin
  // inherited;
  HitPoints := 100;
end;

function TCreature.WillSurviveAttack(const Damage: Integer): Boolean;
begin
  Result := Damage < HitPoints;
end;

procedure TCreature.ZawyjDoKsiezyca;
var
  I: Integer;
begin
  I := 12; // I, local variable, would be undefined if not initialized!
  Writeln('Value of local variable is: ', I);

  // this does not access any field, so would work even when called with Self=nil
  Writeln('Awwwwwwwwwwwooooooooooooooooo');
end;

{
procedure TObject.Free;
begin
  if Self <> nil then
    Destroy;
end;

// the truth:
procedure FreeAndNil(var A: TObject);
var
  Tmp: TObject;
begin
  Tmp := A;
  A := nil;
  Tmp.Free;
end;

// simplification of truth:
procedure FreeAndNil(var A: TObject);
begin
  A.Free;
  A := nil;
end;
}

procedure Foo(const C: TCreature);
begin
  // C := nil; // this will not compile, cannot change C

  // this will compile, and change C contents, it's OK -- "const" only guards the pointer
  C.HitPoints := C.HitPoints - 1;
  C.HitPoints := C.HitPoints - 1;
  C.HitPoints := C.HitPoints - 1;
  C.HitPoints := C.HitPoints - 1;
end;

var
  WerewolfAdditionalReference, Werewolf: TCreature;
  Vampyre: TCreature;
begin
  // Werewolf.ZawyjDoKsiezyca; // would work, even when Werewolf = nil, but don't call things from nil

  // Werewolf.Free; // would work, even when Werewolf = nil,

  Werewolf := TCreature.Create;
  Werewolf.Name := 'Werewolf';
  Werewolf.HitPoints := 100;
  Werewolf.ZawyjDoKsiezyca;

  Assert(Werewolf  <> nil);

  // this would make a "deep copy", not only copy the pointer
  //  WerewolfAdditionalReference := TCreature.Create;
  //  WerewolfAdditionalReference.Name := Werewolf.Name;
  //  WerewolfAdditionalReference.HitPoints := Werewolf.HitPoints;

  // copies the pointer only
  WerewolfAdditionalReference := Werewolf;

  WerewolfAdditionalReference.Name := 'New Wolfie';
  WerewolfAdditionalReference.HitPoints := WerewolfAdditionalReference.HitPoints - 1;
  WerewolfAdditionalReference.HitPoints := WerewolfAdditionalReference.HitPoints - 1;
  WerewolfAdditionalReference.HitPoints := WerewolfAdditionalReference.HitPoints - 1;
  WerewolfAdditionalReference.HitPoints := WerewolfAdditionalReference.HitPoints - 1;

  Werewolf.HitPoints := Werewolf.HitPoints - 1;
  Werewolf.HitPoints := Werewolf.HitPoints - 1;
  Werewolf.HitPoints := Werewolf.HitPoints - 1;
  Werewolf.HitPoints := Werewolf.HitPoints - 1;

  Foo(Werewolf);

  Writeln(Werewolf.Name, ' ',Werewolf.HitPoints);

  // not recommended:
  //Werewolf.Destroy;
  // not recommended:
  //Werewolf.Free;
  // recommended:
  FreeAndNil(Werewolf);
  Assert(Werewolf = nil);

  // this is safe
  FreeAndNil(Werewolf);
  FreeAndNil(Werewolf);
  FreeAndNil(Werewolf);
  FreeAndNil(Werewolf);
  FreeAndNil(Werewolf);

  Assert(Werewolf = nil);
  Assert(WerewolfAdditionalReference <> nil);

  // this would be wrong, WerewolfAdditionalReference is a dangling pointer now
  // FreeAndNil(WerewolfAdditionalReference);

  Readln;
end.
