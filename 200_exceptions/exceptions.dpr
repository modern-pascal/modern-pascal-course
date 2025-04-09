program exceptions;

{$APPTYPE CONSOLE}

uses
  System.SysUtils;

type
  TCreature = class
    Name: String;
    procedure LoadMyData;
  end;

  ECreatureDataError = class(Exception)
    AdditionalInformation: String;
    SenderCreature: TCreature;
  end;

{ TCreature }

procedure TCreature.LoadMyData;
var
  E: ECreatureDataError;
begin
  // simple
  //raise Exception.Create('Error Message');

  // own exception class with extra info
  E := ECreatureDataError.Create('Error in creature data file');
  E.AdditionalInformation := 'Some extra info';
  E.SenderCreature := Self;
  raise E;
end;

var
  C: TCreature;
begin
  try
    try
      C := TCreature.Create;
      C.Name := 'Werewolf';
      C.LoadMyData;
    except
      on E: ECreatureDataError do
      begin
        Writeln(E.ClassName, ': ', E.Message);
        Writeln('Additional info: ', E.AdditionalInformation);
        Writeln('Creature ', E.SenderCreature.Name);
      end;
    end;
  finally
    FreeAndNil(C);
  end;

  Readln;
end.
