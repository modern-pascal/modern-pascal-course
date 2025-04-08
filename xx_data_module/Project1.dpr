program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UnitDataModule1 in 'UnitDataModule1.pas' {DataModule1: TDataModule};

begin
  Writeln(DataModule1.Bluetooth1.Name);
end.
