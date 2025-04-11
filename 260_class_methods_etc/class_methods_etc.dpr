program class_methods_etc;

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

uses
  SysUtils;

type
  TRocketTarget = (Moon, Mars, Sun);

  TRocket = class
  strict private
    class var
      FTarget: TRocketTarget;
  public
    // instance stuff
    var
      Launched: Boolean;
    procedure Launch;

    // class stuff
    class var
      LaunchCount: Cardinal;
      LaunchCountPerTarget: array [TRocketTarget] of Cardinal;
    class constructor Create;
    class destructor Destroy;
    // target for all future launches.
    class property Target: TRocketTarget read FTarget write FTarget;
  end;

{ TRocket }

class constructor TRocket.Create;
begin
  Writeln('Before first usage of TRocket');
end;

class destructor TRocket.Destroy;
begin
  Writeln('After last usage of TRocket');
end;

procedure TRocket.Launch;
begin
  if not Launched then
  begin
    Launched := true;
    Inc(LaunchCount);
    Inc(LaunchCountPerTarget[FTarget]);
  end;
end;

var
  R: TRocket;
begin
  try
    R := TRocket.Create; try R.Launch; finally FreeAndNil(R); end;
    R := TRocket.Create; try R.Launch; finally FreeAndNil(R); end;
    R := TRocket.Create; try R.Launch; finally FreeAndNil(R); end;

    TRocket.Target := Mars;

    R := TRocket.Create; try R.Launch; finally FreeAndNil(R); end;

    Writeln('Launched rockets: ', TRocket.LaunchCount);
    Writeln('  towards Moon: ', TRocket.LaunchCountPerTarget[Moon]);
    Writeln('  towards Mars: ', TRocket.LaunchCountPerTarget[Mars]);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.
