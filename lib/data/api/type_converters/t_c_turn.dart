import 'package:smart_chess_board/domain/models/m_turn.dart';
import 'package:smart_chess_board/data/api/service_models/s_m_turn.dart';

// "На рисунке это инструмент приготовления (например блендер)"
class TypeConverterTurn {
  static ModelTurn fromApi(ServiceModelTurn turn) {
    return ModelTurn(
        boardState: turn.boardState,
        color: turn.toString(),
        isInCheck: turn.isInCheck,
        bestMove: turn.bestMove.toString(),
        legalMoves: turn.legalMoves,
        canClaimDraw: turn.canClaimDraw,
        canClaimFiftyMoves: turn.canClaimFiftyMoves,
        canClaimThreefoldRepetition: turn.canClaimThreefoldRepetition);
  }
}
