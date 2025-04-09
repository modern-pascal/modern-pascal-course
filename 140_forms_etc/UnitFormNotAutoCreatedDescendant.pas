unit UnitFormNotAutoCreatedDescendant;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  UnitFormNotAutoCreated, FMX.Controls.Presentation;

type
  TFormNotAutoCreatedDescendant = class(TFormNotAutoCreated)
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNotAutoCreatedDescendant: TFormNotAutoCreatedDescendant;

implementation

{$R *.fmx}

end.
