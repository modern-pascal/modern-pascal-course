program array_properties;

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

uses SysUtils;

type
  TChildCreature = class
    Name: String;
  end;

  TCreature = class
  strict private
    FMyChildren: array[1..10] of TChildCreature;
    FVoices: array[1..10] of String;
    function GetChildren(const Index: Integer): TChildCreature;
    function GetVoices(const Index: Integer): String;
  public
    Name: String;
    constructor Create;
    destructor Destroy; override;
    property Children[const Index: Integer]: TChildCreature read GetChildren; default;
    property Voices[const Index: Integer]: String read GetVoices;
  end;

{ TCreature }

constructor TCreature.Create;
var
  I: Integer;
begin
  inherited;
  for I := 1 to 10 do
  begin
    FMyChildren[I] := TChildCreature.Create;
    FMyChildren[I].Name := 'Child' + IntToStr(I);
    FVoices[I] := 'Voice' + IntToStr(I);
  end;
end;

destructor TCreature.Destroy;
var
  I: Integer;
begin
  for I := 1 to 10 do
    FreeAndNil(FMyChildren[I]);
  inherited;
end;

function TCreature.GetChildren(const Index: Integer): TChildCreature;
begin
  Result := FMyChildren[Index];
end;

function TCreature.GetVoices(const Index: Integer): String;
begin
  Result := FVoices[Index];
end;

var
  Werewolf: TCreature;
  I: Integer;
begin
  Werewolf := TCreature.Create;
  try
    for I := 1 to 10 do
    begin
      Writeln(Werewolf.Voices[I]);
      Writeln(Werewolf.Children[I].Name);
      Writeln(Werewolf[I].Name);
    end;
  finally
    FreeAndNil(Werewolf);
  end;
  Readln;
end.
