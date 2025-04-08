unit UnitDataModule1;

interface

uses
  System.SysUtils, System.Classes, System.Bluetooth, System.Bluetooth.Components;

type
  TDataModule1 = class(TDataModule)
    Bluetooth1: TBluetooth;
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
