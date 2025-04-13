program adv_rec;

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

type
  TVector3 = record
    function Len: Single;
    class operator Initialize({$ifdef FPC}var{$else}out{$endif} V: TVector3);
    class operator Finalize(var V: TVector3);
    case Integer of
      0: (X, Y, Z: Single);
      1: (Data: array [0..2] of Single);
  end;

var
  VectorsNum: Cardinal;

class operator TVector3.Initialize({$ifdef FPC}var{$else}out{$endif} V: TVector3);
begin
  Inc(VectorsNum);
  Writeln('TVector3.Initialize, now count: ', VectorsNum);
end;

class operator TVector3.Finalize(var V: TVector3);
begin
  Dec(VectorsNum);
  Writeln('TVector3.Finalize, now count: ', VectorsNum);
end;

function TVector3.Len: Single;
begin
  Result := Sqrt(Sqr(X) + Sqr(Y) + Sqr(Z));
end;

procedure Foo;
var
  V: TVector3;
  VA: array [0..9] of TVector3;
begin
  { We need to *use* the V and VA, otherwise optimizer (FPC 3.3.1)
    could detect they are unused and not call TVector3.Initialize,
    TVector3.Finalize. }
  V.X := 1.23;
  VA[0].X := 4.56;
end;

begin
  Foo;
  Readln;
end.
