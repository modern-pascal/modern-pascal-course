unit UnitFormNotAutoCreated;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TFormNotAutoCreated = class(TForm)
    Label1: TLabel;
    ButtonClose: TButton;
    procedure ButtonCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNotAutoCreated: TFormNotAutoCreated;

implementation

{$R *.fmx}

procedure TFormNotAutoCreated.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

end.
