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
    Button1: TButton;
    Button2: TButton;
    procedure ButtonCloseClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAutoCreated: TFormAutoCreated;

implementation

uses UnitFormNotAutoCreated;

{$R *.fmx}

procedure TFormAutoCreated.Button1Click(Sender: TObject);
var
  MyNewForm: TFormAutoCreated;
begin
  MyNewForm := TFormAutoCreated.Create(Application);
  MyNewForm.Show;
end;

procedure TFormAutoCreated.Button2Click(Sender: TObject);
var
  MyNewForm: TFormNotAutoCreated;
begin
  MyNewForm := TFormNotAutoCreated.Create(Application);
  MyNewForm.Show;
end;

procedure TFormAutoCreated.ButtonCloseClick(Sender: TObject);
begin
  Close;
end;

end.
