import 'package:smart_chess_board/domain/models/m_turn.dart';

class ChessBoardServiceModel {
  Stream<bool>? isAvailable;

  String? positionFen;
  String fullmoveNumber; // Ходов сделано
  String result = "*";
  String isGameOver;
  String isCheckmate;
  String isStalemate;
  String isInsufficientMaterial;
  String isSeventyfiveMoves;
  String isFivefoldRepetition;
  String white;
  // white['hasKingsideCastlingRights'] = true;
  // white['hasQueensideCastlingRights'] = true;
  String black;
  // black['hasKingsideCastlingRights'] = true;
  // black['hasQueensideCastlingRights'] = true;
  String turn;

  ChessBoardServiceModel.fromApi(Map<String, dynamic> map)
      : isAvailable = map['results']['isAvailable'],
        fullmoveNumber = map['results']['fullmoveNumber'],
        result = map['results']['result'],
        isGameOver = map['results']['isGameOver'],
        isCheckmate = map['results']['isCheckmate'],
        isStalemate = map['results']['isStalemate'],
        isInsufficientMaterial = map['results']['isInsufficientMaterial'],
        isSeventyfiveMoves = map['results']['isSeventyfiveMoves'],
        isFivefoldRepetition = map['results']['isFivefoldRepetition'],
        white = map['results']['white'],
        black = map['results']['black'],
        turn = map['results']['turn'];
}
