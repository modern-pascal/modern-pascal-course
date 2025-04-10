{ Example of Map, ForEach methods and processing list with anonymous functions. }

{$apptype CONSOLE}

uses SysUtils, Generics.Collections;

type
  TIntMapFunc =
    reference to function(const Index, Item: Integer): Integer;
  TIntMapProc =
    reference to procedure(const Index, Item: Integer);

  TMyInts = class({$ifdef FPC}specialize{$endif} TList<Integer>)
    { Change every item in the list using AFunc. }
    procedure Map(const AFunc: TIntMapFunc);
    { Call AProc for every item in the list. }
    procedure ForEach(const AProc: TIntMapProc);
  end;

procedure TMyInts.Map(const AFunc: TIntMapFunc);
var
  Index: Integer;
begin
  for Index := 0 to Count - 1 do
    Items[Index] := AFunc(Index, Items[Index]);
end;

procedure TMyInts.ForEach(const AProc: TIntMapProc);
var
  Index: Integer;
begin
  for Index := 0 to Count - 1 do
    AProc(Index, Items[Index]);
end;

var
  MyList: TMyInts;
  I: Integer;
  F: TIntMapFunc;
begin
  MyList := TMyInts.Create;
  try
    for I := 0 to 10 do
      MyList.Add(I);

    F := function(const Index, Item: Integer): Integer
      begin
        Result := Item + 1;
      end;
    // effectively this increases all numbers on the list by 3
    MyList.Map(F);
    MyList.Map(F);
    MyList.Map(F);

    // change all items to their squares
    MyList.Map(function(const Index, Item: Integer): Integer
      begin
        Result := Item * Item;
      end);

    // print all items
    MyList.ForEach(procedure(const Index, Item: Integer)
      begin
        WriteLn('Index: ', Index, ', Item: ', Item);
        WriteLn('  If we would proces it by F: ', F(Index, Item));
      end);
  finally FreeAndNil(MyList) end;

  Readln;
end.
