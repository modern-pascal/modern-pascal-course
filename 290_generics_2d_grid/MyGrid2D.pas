unit MyGrid2D;

interface

uses SysUtils;

type
  TGrid2D<T> = class
  strict private
    type
      TOneItem = record
        IsValue: Boolean;
        Value: T;
      end;
    var
      FItems: array of array of TOneItem;
      FWidth, FHeight: Integer;
  private
    function GetHasItems(const X, Y: Integer): Boolean;
    function GetItems(const X, Y: Integer): T;
    procedure SetHasItems(const X, Y: Integer; const Value: Boolean);
    procedure SetItems(const X, Y: Integer; const Value: T);
  public
    constructor Create(const AWidth, AHeight: Cardinal);
    property Width: Integer read FWidth;
    property Height: Integer read FHeight;
    property Items[const X, Y: Integer]: T
      read GetItems write SetItems; default;
    property HasItems[const X, Y: Integer]: Boolean
      read GetHasItems;
    procedure ClearItem(const X, Y: Integer);
  end;

implementation


{ TGrid2D<T> }

procedure TGrid2D<T>.ClearItem(const X, Y: Integer);
begin

end;

constructor TGrid2D<T>.Create(const AWidth, AHeight: Cardinal);
begin
  inherited Create;
  FWidth := AWidth;
  FHeight := AHeight;
  SetLength(FItems, AWidth, AHeight);
end;

function TGrid2D<T>.GetHasItems(const X, Y: Integer): Boolean;
begin
  Result := FItems[X, Y].IsValue;
end;

function TGrid2D<T>.GetItems(const X, Y: Integer): T;
begin
  if not HasItems[X, Y] then
    raise Exception.CreateFmt('No item at %d, %d', [X, Y]);

  Result := FItems[X, Y].Value;
end;

procedure TGrid2D<T>.SetHasItems(const X, Y: Integer; const Value: Boolean);
begin
  FItems[X, Y].IsValue := false;
end;

procedure TGrid2D<T>.SetItems(const X, Y: Integer; const Value: T);
begin
  FItems[X, Y].IsValue := true;
  FItems[X, Y].Value := Value;
end;

end.
