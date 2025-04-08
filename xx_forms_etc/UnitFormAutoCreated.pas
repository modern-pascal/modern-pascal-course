unit UnitFormAutoCreated;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFormAutoCreated = class(TForm)
    Label1: TLabel;
    ButtonClose: TButton;
    procedure ButtonCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAutoCreated: TFormAutoCreated;

implementation

{$R *.fmx}

procedure TFormAutoCreated.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

end.
