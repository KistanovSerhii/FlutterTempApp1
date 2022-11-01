import 'package:smart_chess_board/domain/models/m_turn.dart';
import 'package:smart_chess_board/domain/contracts/c_turn.dart';
import 'package:smart_chess_board/data/api/a_underwaterchess.dart';

// "На рисунке это кухня"
class RepositoryTurn extends ContracrTurn {
  final ApiUnderwaterChess _underwaterChessApi;

  RepositoryTurn(this._underwaterChessApi);

  @override
  Future<ModelTurn> getTurnFromAI(
      {required String position,
      required String move,
      required String format}) {
    return _underwaterChessApi.getTurnFromAI(
        position: position, move: move, format: format);
  }

  @override
  Future<ModelTurn> getTurnFromBoard(
      {required String position,
      required String move,
      required String format}) {
    return _underwaterChessApi.getTurnFromAI(
        position: position, move: move, format: format);
  }
}
