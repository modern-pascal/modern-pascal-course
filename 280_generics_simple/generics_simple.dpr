program generics_simple;

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

uses
  SysUtils,
  MyStringList in 'MyStringList.pas';

type
  TMessageType = (mtError, mrWarning, mtInfo);
const
  MsgTypeNames: array [TMessageType] of String = (
    'error',
    'warning',
    'info'
  );

var
  Messages: TMyStringList<TMessageType>;
  I: Integer;
begin
  try
    Messages := TMyStringList<TMessageType>.Create;
    try
      Messages.Add('Sample message');
      Messages.Add('Sample error message', mtError);
      Messages.Add('Sample warning message', mrWarning);
      Messages.Add('Sample info message', mtInfo);
      Writeln('Messages count: ', Messages.Count);

      for I := 0 to Messages.Count - 1 do
      begin
        Writeln(Messages[I]);
        if Messages.HasAssociated[I] then
          Writeln('  Associated value: ',
            MsgTypeNames[Messages.Associated[I]]);
      end;
    finally
      FreeAndNil(Messages);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.
