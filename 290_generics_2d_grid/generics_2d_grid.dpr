program generics_2d_grid;

{$ifdef MSWINDOWS} {$apptype CONSOLE} {$endif}

uses
  SysUtils,
  MyGrid2D in 'MyGrid2D.pas';

type
  TChessPieceType = (Rook, Knight, Bishop, King, Queen, Pawn);
  TChessPiece = record
    PieceType: TChessPieceType;
    IsWhite: Boolean;
  end;
  TChessBoard = TGrid2D<TChessPiece>;

  TCheckersPiece = Boolean; // is white
  TCheckersBoard = TGrid2D<TCheckersPiece>;

  TShip = (ShipHit, ShipHealthy);
  TShips = TGrid2D<TShip>;

const
  ChessPieceChar: array [TChessPieceType] of Char =
  ('R', 'k', 'B', 'K', 'Q', 'P');

function ChessPiece(const PieceType: TChessPieceType;
  const IsWhite: Boolean): TChessPiece;
begin
  Result.PieceType := PieceType;
  Result.IsWhite := IsWhite;
end;

var
  ChessBoard: TChessBoard;
  X, Y: Integer;
begin
  try
    ChessBoard := TChessBoard.Create(8, 8);
    try
      ChessBoard[0, 0] := ChessPiece(Rook, true);
      ChessBoard[1, 0] := ChessPiece(Knight, true);
      ChessBoard[2, 0] := ChessPiece(Bishop, true);
      ChessBoard[0, 7] := ChessPiece(Rook, false);
      ChessBoard[1, 7] := ChessPiece(Knight, false);
      ChessBoard[2, 7] := ChessPiece(Bishop, false);
      for Y := 0 to ChessBoard.Height - 1 do
      begin
        for X := 0 to ChessBoard.Width - 1 do
        begin
          if ChessBoard.HasItems[X, Y] then
          begin
            Write(ChessPieceChar[ChessBoard.Items[X, Y].PieceType]);
            if ChessBoard.Items[X, Y].IsWhite then
              Write('_')
            else
              Write('^');
          end else
            Write('  ');
        end;
        Writeln;
      end;
    finally
      FreeAndNil(ChessBoard);
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

  Readln;
end.
