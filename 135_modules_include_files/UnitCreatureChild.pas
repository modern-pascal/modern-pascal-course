unit UnitCreatureChild;

interface

uses Classes;

type
  TMyCreatureType = (
    One,
    Two
    // rather weird usage of include file, but possible
    {$include myxxx.inc}
  );

type
  TChildCreature = class(TComponent)
  public
    MyType: TMyCreatureType;
    Name: String;
    Parent: TObject; //< Always must be TCreature
    function ParentName: String;
  end;

implementation

uses UnitCreature;

function TChildCreature.ParentName: String;
begin
  Result := (Parent as TCreature).Name;
end;

{ TWerewolf }

type
  TWerewolf = class(TCreature)
    procedure Howl;
  end;

procedure TWerewolf.Howl;
begin
  // accessing protected is OK
  Writeln(MyProtectedField);
end;

end.
