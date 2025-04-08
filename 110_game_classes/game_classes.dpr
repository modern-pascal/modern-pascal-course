program game_classes;

{$APPTYPE CONSOLE}

uses SysUtils, Generics.Collections;

var
  HasKey: Boolean;
  GameOver: Boolean;

//type
//  TCreature = class
//    HitPoints: Integer;
//    Name: String;
//  end;

{ TLocation ------------------------------------------------------------------ }

type
  TLocation = class
    //Creatures: TObjectList<TCreature>;
    constructor Create;
    destructor Destroy; override;
    function BeforeVisit: Boolean; virtual;
    procedure CoreVisit; virtual;
  end;

var
  CurrentLocation: TLocation;
  NewLocation: TLocation;
  Zamek, Las, Jaskinia: TLocation;
  AllLocations: TObjectList<TLocation>;

constructor TLocation.Create;
begin
  inherited;
  //Creatures := TObjectList<TCreature>.Create(true);
end;

destructor TLocation.Destroy;
begin
  //FreeAndNil(Creatures);
  inherited;
end;

procedure TLocation.CoreVisit;
begin

end;

function TLocation.BeforeVisit: Boolean;
begin
  Result := true;
end;

{ TZamek --------------------------------------------------------------------- }

type
  TZamek = class(TLocation)
    function BeforeVisit: Boolean; override;
    procedure CoreVisit; override;
  end;

function TZamek.BeforeVisit: Boolean;
begin
  Result := HasKey;
  if not Result then
    Writeln('Nie masz klucza aby wejœæ do zamku!');
end;

procedure TZamek.CoreVisit;
var
  C: Char;
begin
  inherited;

  Writeln('Jesteœ w zamku');
  Writeln('w - wróc do lasu');
  Writeln('z - zostañ');

  Readln(C);

  case C of
    'w':NewLocation := Las;
    'z':begin
          Writeln('Pos³ubi³eœ ksiê¿niczkê!');
          GameOver := true;
        end;
    else
        begin
          Writeln('Nieprawid³owa odpowiedŸ, jeszcze raz');
          CoreVisit;
        end;
  end;
end;

{ TJaskinia --------------------------------------------------------------------- }

type
  TJaskinia = class(TLocation)
    HasSmok: Boolean;
    KeyInLocation: Boolean;
    constructor Create;
    function BeforeVisit: Boolean; override;
    procedure CoreVisit; override;
  end;

constructor TJaskinia.Create;
//var
//  Smok: TCreature;
begin
  inherited;
//  Smok := TCreature.Create;
//  Smok.HitPoints := 100;
//  Smok.Name := 'Smok';
//  Creatures.Add(Smok);
  HasSmok := true;
  KeyInLocation := true;
end;

function TJaskinia.BeforeVisit: Boolean;
begin
  if HasSmok then
  begin
    Writeln('Smok jest w jaskinii, musisz go najpierw pokonaæ');
    if Random(4) = 0 then
    begin
      HasSmok := false;
      Writeln('Smok pokonany');
      Result := true;
    end else
    begin
      Writeln('Smok niepokonany, pozostaje w jaskinii, uciekasz');
      Result := false;
    end;
  end else
    Result := inherited;
end;

procedure TJaskinia.CoreVisit;
var
  C: Char;
begin
  inherited;

  Writeln('Widzisz skrzyniê w jaskinii. Otwierasz (o), czy wychodzisz (w)?');

  Readln(C);

  case C of
    'o':begin
          if KeyInLocation then
          begin
            Writeln('Zdoby³eœ klucz');
            HasKey := true;
            KeyInLocation := false;
          end else
            Writeln('Skrzynia jest pusta');
        end;
    'w':begin
          NewLocation := Las;
        end;
    else
        begin
          Writeln('Nieprawid³owa odpowiedŸ, jeszcze raz');
          CoreVisit;
        end;
  end;
end;

{ TLas ---------------------------------------------------------------------- }

type
  TLas = class(TLocation)
    procedure CoreVisit; override;
  end;

procedure TLas.CoreVisit;
var
  C: Char;
begin
  Writeln('Jesteœ w lesie');
  Writeln('l - idê w lewo');
  Writeln('p - idê w prawo');

  Readln(C);

  case C of
    'l': NewLocation := Zamek;
    'p': NewLocation := Jaskinia;
    else
        begin
          Writeln('Nieprawid³owa odpowiedŸ, jeszcze raz');
          CoreVisit;
        end;
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := true;
  Randomize;

  AllLocations := TObjectList<TLocation>.Create(true);

  Jaskinia := TJaskinia.Create;
  AllLocations.Add(Jaskinia);

  Las := TLas.Create;
  AllLocations.Add(Las);

  Zamek := TZamek.Create;
  AllLocations.Add(Zamek);

  CurrentLocation := Las; // start

  repeat
    if NewLocation <> nil then
    begin
      if NewLocation.BeforeVisit then
        CurrentLocation := NewLocation;
      NewLocation := nil;
    end;
    CurrentLocation.CoreVisit;
  until GameOver;

  FreeAndNil(AllLocations);

  Readln;
end.
