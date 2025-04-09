program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UnitDataModule1 in 'UnitDataModule1.pas' {DataModule1: TDataModule},
  Creature in 'component\Creature.pas';

begin
  ReportMemoryLeaksOnShutdown := true;

  DataModule1 := TDataModule1.Create(nil);
  try
    Writeln(DataModule1.Werewolf.Name, ' ', DataModule1.Werewolf.HitPoints);
    Writeln(DataModule1.Vampyre.Name, ' ', DataModule1.Vampyre.HitPoints);
  finally
    FreeAndNil(DataModule1);
  end;

  Readln;
end.
