program forms_etc;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitFormAutoCreated in 'UnitFormAutoCreated.pas' {FormAutoCreated},
  UnitDM in 'UnitDM.pas' {DM: TDataModule},
  UnitFormNotAutoCreated in 'UnitFormNotAutoCreated.pas' {FormNotAutoCreated};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormAutoCreated, FormAutoCreated);
  Application.Run;
end.
