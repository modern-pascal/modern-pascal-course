unit UnitFormUsingFrames;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  UnitFrameUsingFrames;

type
  TFormUsingFrames = class(TForm)
    FrameUsingFrames1: TFrameUsingFrames;
    FrameUsingFrames2: TFrameUsingFrames;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUsingFrames: TFormUsingFrames;

implementation

{$R *.fmx}

end.
