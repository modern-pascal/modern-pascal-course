unit Creature;

interface

uses
  System.SysUtils, System.Classes;

type
  TCreature = class(TComponent)
  private
    FHitPoints: Integer;
    procedure SetHitPoints(const Value: Integer);
    { Private declarations }
  protected
    { Protected declarations }
  public
    function IsAlive: Boolean;
  published
    property HitPoints: Integer read FHitPoints write SetHitPoints;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TCreature]);
end;

{ TCreature }

function TCreature.IsAlive: Boolean;
begin
  Result := HitPoints > 0;
end;

procedure TCreature.SetHitPoints(const Value: Integer);
begin
  FHitPoints := Value;
end;

end.
