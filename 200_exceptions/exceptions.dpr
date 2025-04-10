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


(*
// Simplifying, this is Exception class:
type
  Exception = class(TObject)
    property Message: String read .. .wrote ...;
    constructor Create(const AMessage: String);
    constructor CreateFmt(const AMessageFormat: String; const Args: array of const);
  end;

constructor Exception.Create(const AMessage: String);
begin
  Message := AMessage;
end;

// Simplifying, this is what Assert does
// (only if $assertions on, otherwise don't even calculate Condition):
procedure Assert(const Condition: Boolean; const Msg: String);
begin
  //
  if not Condition then
    raise EAssertionFailed.Create('Assertion failed' + Msg);
end;
*)

{ TCreature }

procedure TCreature.LoadMyData;
var
  E: ECreatureDataError;
begin
  // simple
  //raise Exception.Create('Error Message');

  // also possible with format string
  //raise Exception.CreateFmt('Error Message with integer %d', [MyInt]);

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
