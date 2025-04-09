program forms_etc;

uses
  System.StartUpCopy,
  FMX.Forms,
  UnitFormAutoCreated in 'UnitFormAutoCreated.pas' {FormAutoCreated},
  UnitDM in 'UnitDM.pas' {DM: TDataModule},
  UnitFormNotAutoCreated in 'UnitFormNotAutoCreated.pas' {FormNotAutoCreated},
  UnitFormNotAutoCreatedDescendant in 'UnitFormNotAutoCreatedDescendant.pas' {FormNotAutoCreatedDescendant},
  UnitFrame in 'UnitFrame.pas' {MyFrame: TFrame},
  UnitFrameUsingFrames in 'UnitFrameUsingFrames.pas' {FrameUsingFrames: TFrame},
  UnitFormUsingFrames in 'UnitFormUsingFrames.pas' {FormUsingFrames};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFormAutoCreated, FormAutoCreated);
  Application.CreateForm(TFormNotAutoCreatedDescendant, FormNotAutoCreatedDescendant);
  Application.CreateForm(TFormUsingFrames, FormUsingFrames);
  Application.Run;
end.
