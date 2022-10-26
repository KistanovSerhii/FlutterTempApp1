import 'package:smart_chess_board/domain/models/m_turn.dart';

class ChessBoardModel {
  Stream<bool>? isAvailable;

  String? positionFen;
  int fullmoveNumber = 0; // Ходов сделано
  String result = "*";
  bool isGameOver = false;
  bool isCheckmate = false;
  bool isStalemate = false;
  bool isInsufficientMaterial = false;
  bool isSeventyfiveMoves = false;
  bool isFivefoldRepetition = false;
  Map white = new Map();
  // white['hasKingsideCastlingRights'] = true;
  // white['hasQueensideCastlingRights'] = true;
  Map black = new Map();
  // black['hasKingsideCastlingRights'] = true;
  // black['hasQueensideCastlingRights'] = true;
  TurnModel? turn;
}
