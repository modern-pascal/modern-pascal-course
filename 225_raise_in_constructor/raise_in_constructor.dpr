program raise_in_constructor;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  TMyObject = class
    MyInt1, MyInt2: Integer;
    constructor Create;
    destructor Destroy; override;
  end;

{ TMyObject }

constructor TMyObject.Create;
begin
  inherited;
  MyInt1 := 111;
  raise Exception.Create('Error Message');
  MyInt2 := 222;
end;

destructor TMyObject.Destroy;
begin
  Writeln('destruktor ', MyInt1, ' ', MyInt2);
  inherited;
end;

begin
//  try
    {O := }TMyObject.Create;
//  except
//    on E: Exception do
//      Writeln(E.ClassName, ': ', E.Message);
//  end;

  Readln;
end.
