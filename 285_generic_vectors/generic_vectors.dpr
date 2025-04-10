program generic_vectors;

{$APPTYPE CONSOLE}

type
  TVector3<T> = class
    X, Y, Z: T;
  end;

  TVector2<T> = class
    X, Y: T;
    class function Zero: TVector2<T>;
    function To3D(const Z: T): TVector3<T>;
    // unfortunately, not possible
    //function Add(const Second: TVector2<T>): TVector2<T>;
    // unfortunately, not possible
    //function Max(const Second: TVector2<T>): TVector2<T>;
  end;

  TVector2Integer = TVector2<Integer>;
  TVector2Single = TVector2<Single>;

{ TVector2<T> }

(*
function TVector2<T>.Max(const Second: TVector2<T>): TVector2<T>;
begin
  Result := TVector2<T>.Create;

  if X > Second.X then
    Result.X := X
  else
    Result.X := Second.X;

  if Y > Second.Y then
    Result.Y := Y
  else
    Result.Y := Second.Y;
end;

function TVector2<T>.Add(const Second: TVector2<T>): TVector2<T>;
begin
  Result := TVector2<T>.Create;
  Result.X := X + Second.X;
  Result.Y := Y + Second.Y;
end;
*)

function TVector2<T>.To3D(const Z: T): TVector3<T>;
begin
  Result := TVector3<T>.Create;
  Result.X := X; // field
  Result.Y := Y; // field
  Result.Z := Z; // argument
end;

class function TVector2<T>.Zero: TVector2<T>;
begin
  Result := TVector2<T>.Create;
  Result.X := Default(T);
  Result.Y := Default(T);
end;

begin
end.
