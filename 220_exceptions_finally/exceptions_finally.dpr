program exceptions_finally;

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

uses
  System.SysUtils;

type
  TCreature = class
    Name: String;
    HitPoints: Integer;
  end;

function RaiseException: Integer;
begin
  raise Exception.Create('No more integers for you');
end;

function CreatureFactory: TCreature;
begin
  // note: creation outside try guarantees this is correct:
  Result := TCreature.Create;
  try
    Result.Name := 'Werewolf';
    Result.HitPoints := RaiseException;
  except
    FreeAndNil(Result);
    raise; // reraise
  end;

  // WRONG! Exception inside try.. now causes free on dangling pointer!
  {
  try
    RaiseException;
    Result := TCreature.Create;
    Result.Name := 'Werewolf';
    Result.HitPoints := RaiseException;
  except
    FreeAndNil(Result);
    raise; // reraise
  end;
  }
end;

var
  C: TCreature;
begin
  {$ifndef FPC} ReportMemoryLeaksOnShutdown := true; {$endif}

  try
    C := CreatureFactory;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.
