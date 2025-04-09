program classes_inside;

{$APPTYPE CONSOLE}

uses
  System.SysUtils;

type
  TCreature = class
    Name: String;
    procedure Attack; virtual;
  end;

  TMyCreatureFactory = class
  strict private
    type
      TVampyre = class(TCreature)
        procedure Attack; override;
      end;
      TWerewolf = class(TCreature)
        procedure Attack; override;
      end;
    var
      FMyWerewolf: TWerewolf;
      FMyVampyre: TVampyre;
  public
    constructor Create;
    destructor Destroy; override;
    function MostFearsome: TCreature;
  end;

{ TCreature }

procedure TCreature.Attack;
begin
  Writeln(Name, ' attacks!');
end;

{ TMyCreatureFactory.TVampyre }

procedure TMyCreatureFactory.TVampyre.Attack;
begin
  Writeln(Name, ' bites!');
end;

{ TMyCreatureFactory.TWerewolf }

procedure TMyCreatureFactory.TWerewolf.Attack;
begin
  Writeln(Name, ' howls!');
end;

{ TMyCreatureFactory }

constructor TMyCreatureFactory.Create;
begin
  FMyWerewolf := TWerewolf.Create;
  FMyWerewolf.Name := 'Wolfie';
  FMyVampyre := TVampyre.Create;
  FMyVampyre.Name := 'Dracula';
end;

destructor TMyCreatureFactory.Destroy;
begin
  FreeAndNil(FMyWerewolf);
  FreeAndNil(FMyVampyre);
  inherited;
end;

function TMyCreatureFactory.MostFearsome: TCreature;
begin
  // Return the most fearsome creature
  Result := FMyVampyre;
end;

{ Main program }

var
  MyCreatureFactory: TMyCreatureFactory;
begin
  try
    MyCreatureFactory := TMyCreatureFactory.Create;
    try
      MyCreatureFactory.MostFearsome.Attack;
    finally
      FreeAndNil(MyCreatureFactory);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.
