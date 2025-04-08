unit UnitDM;

interface

uses
  System.SysUtils, System.Classes;

type
  TDM = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
