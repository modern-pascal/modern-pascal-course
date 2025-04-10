unit UnitCreature;

interface

uses Classes, UnitCreatureChild;

type
  TCreature = class
  private
    FMyChildren: array[1..10] of TChildCreature;
    //FVoices: array[1..10] of String;
    function GetChildren(const Index: Integer): TChildCreature;
    function GetVoices(const Index: Integer): String;
  protected
    MyProtectedField: Integer;
  public
    Name: String;
    constructor Create;
    destructor Destroy; override;
    property Children[const Index: Integer]: TChildCreature read GetChildren; default;
    property Voices[const Index: Integer]: String read GetVoices;
  end;

implementation

uses SysUtils;

var
  ChildrenCounter: Integer;

{ TCreature }

constructor TCreature.Create;
var
  I: Integer;
begin
  inherited;
  Name := 'My Creature';
  for I := 1 to 10 do
  begin
    Inc(ChildrenCounter);
    FMyChildren[I] := TChildCreature.Create(nil);
    FMyChildren[I].Parent := Self;
    FMyChildren[I].Name := 'Child' + IntToStr(I);
    //FVoices[I] := 'Voice' + IntToStr(I);
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
  Result := 'VoiceName' + IntToStr(Index);
  //FVoices[Index];
end;

initialization
finalization
  Writeln('Creature children created: ', ChildrenCounter);
end.
