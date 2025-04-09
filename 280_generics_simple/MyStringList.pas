unit MyStringList;

interface

uses SysUtils;

type
  { List of strings, each string has a potential associated value of T. }
  TMyStringList<T> = class
  strict private
    type
      TOneItem = record
        S: String;
        HasAssociated: Boolean;
        // only meaningful when HasAssociated
        Associated: T;
      end;
    var
      FItems: array of TOneItem;
    function GetAssociated(const Index: Integer): T;
    function GetHasAssociated(const Index: Integer): Boolean;
    function GetItems(const Index: Integer): String;
  public
    procedure Add(const S: String); overload;
    procedure Add(const S: String; const Associated: T); overload;
    procedure Clear;
    function Count: Integer;
    property Items[const Index: Integer]: String read GetItems; default;
    property HasAssociated[const Index: Integer]: Boolean read GetHasAssociated;
    { Read only when HasAssociated[Index]. }
    property Associated[const Index: Integer]: T read GetAssociated;
  end;

implementation

{ TMyStringList<T> }

procedure TMyStringList<T>.Add(const S: String);
var
  NewItem: TOneItem;
  L: Integer;
begin
  NewItem.S := S;
  NewItem.Associated := Default(T);
  NewItem.HasAssociated := false;

  L := Length(FItems);
  SetLength(FItems, L + 1);
  FItems[L] := NewItem;
end;

procedure TMyStringList<T>.Add(const S: String; const Associated: T);
var
  NewItem: TOneItem;
  L: Integer;
begin
  NewItem.S := S;
  NewItem.Associated := Associated;
  NewItem.HasAssociated := true;

  L := Length(FItems);
  SetLength(FItems, L + 1);
  FItems[L] := NewItem;
end;

procedure TMyStringList<T>.Clear;
begin
  SetLength(FItems, 0);
end;

function TMyStringList<T>.Count: Integer;
begin
  Result := Length(FItems);
end;

function TMyStringList<T>.GetAssociated(const Index: Integer): T;
begin
  if not FItems[Index].HasAssociated then
    raise Exception.Create('No associated value');
  Result := FItems[Index].Associated;
end;

function TMyStringList<T>.GetHasAssociated(const Index: Integer): Boolean;
begin
  Result := FItems[Index].HasAssociated;
end;

function TMyStringList<T>.GetItems(const Index: Integer): String;
begin
  Result := FItems[Index].S;
end;

end.
