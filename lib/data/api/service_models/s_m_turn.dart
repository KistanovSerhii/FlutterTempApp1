// Для инициализации требует параметры &move=e2e3&format=json

class TurnServiceModel {
  late Map<String, dynamic> boardState;
  String color;
  bool isInCheck;
  String bestMove;
  List<dynamic> legalMoves;
  bool canClaimDraw;
  bool canClaimFiftyMoves;
  bool canClaimThreefoldRepetition;

  TurnServiceModel.fromApi(Map<String, dynamic> map)
      : boardState = {
          'position': map['fen'],
          'fullmoveNumber': map['fullmoveNumber'],
          'result': map['result'],
          'isGameOver': map['isGameOver'],
          'isCheckmate': map['isCheckmate'],
          'isStalemate': map['isStalemate'],
          'isInsufficientMaterial': map['isInsufficientMaterial'],
          'isSeventyfiveMoves': map['isSeventyfiveMoves'],
          'isFivefoldRepetition': map['isFivefoldRepetition'],
          'white': map['white'],
          'black': map['black']
        },
        color = map['turn']['color'],
        isInCheck = map['turn']['isInCheck'],
        bestMove = map['turn']['bestMove'],
        legalMoves = map['turn']['legalMoves'],
        canClaimDraw = map['turn']['canClaimDraw'],
        canClaimFiftyMoves = map['turn']['canClaimFiftyMoves'],
        canClaimThreefoldRepetition =
            map['turn']['canClaimThreefoldRepetition'];
}

// https://fast-citadel-36391.herokuapp.com/
// Fen: 1 - Это результат хода
// Apply Move: 2 - это лог хода