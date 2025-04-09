unit MyCreatures;

interface

type
  TCreature = class
  public
    Name: String;
    HitPoints: Integer;
  end;

  TWerewolf = class(TCreature)
  public
  end;

  TVampyre = class(TCreature)
  public
    FangsPoisonous: Boolean;
  end;

implementation

end.