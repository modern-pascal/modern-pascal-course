unit UnitDataModule1;

interface

uses
  System.SysUtils, System.Classes, System.Bluetooth, System.Bluetooth.Components,
  Creature;

type
  TDataModule1 = class(TDataModule)
    Werewolf: TCreature;
    Vampyre: TCreature;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
