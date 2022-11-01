// "На рисунке это блюдо предоставленного меню (сок яблочный - 100 руб.)"
class ModelTurn {
  late Map<String, dynamic> boardState;
  String color;
  bool isInCheck;
  String bestMove;
  List<dynamic> legalMoves;
  bool canClaimDraw;
  bool canClaimFiftyMoves;
  bool canClaimThreefoldRepetition;

  ModelTurn(
      {required this.boardState,
      required this.color,
      required this.isInCheck,
      required this.bestMove,
      required this.legalMoves,
      required this.canClaimDraw,
      required this.canClaimFiftyMoves,
      required this.canClaimThreefoldRepetition});
}

// https://fast-citadel-36391.herokuapp.com/
// Fen: 1 - Это результат хода
// Apply Move: 2 - это лог хода (какой ход привел к результату Fen)