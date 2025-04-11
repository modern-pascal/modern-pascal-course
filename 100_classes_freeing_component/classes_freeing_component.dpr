{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

uses SysUtils, Classes;

type
  TCreature = class(TComponent)
  public
    Name: String;
    HitPoints: Integer;
  end;

  TLocation = class(TComponent)
  end;

var
  MyLocation: TLocation;
  Werewolf: TCreature;
  Vampyre: TCreature;
begin
  {$ifndef FPC} ReportMemoryLeaksOnShutdown := true; {$endif}
  MyLocation := TLocation.Create(nil);
  try
    Werewolf := TCreature.Create(MyLocation);
    Werewolf.Name := 'Werewolf';
    Werewolf.HitPoints := 100;

    Vampyre := TCreature.Create(MyLocation);
    Vampyre.Name := 'Vampyre';
    Vampyre.HitPoints := 50;
  finally
    FreeAndNil(MyLocation);
  end;

  Readln;
end.

