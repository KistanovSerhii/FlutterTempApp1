import 'package:smart_chess_board/domain/models/m_turn.dart';
import 'package:smart_chess_board/domain/contracts/c_turn.dart';
import 'package:smart_chess_board/data/api/a_underwaterchess.dart';

class TurnRepository extends TurnContracr {
  final UnderwaterChessApi _underwaterChessApi;
  // для getBoardTurn необходимо создать своё Api
  // и инициализировать его тут присвоив переменной
  // final ArduinoBluetoothApi _arduinoBluetoothApi;

  TurnRepository(this._underwaterChessApi);

  @override
  Future<TurnModel> getTurnFromAI(
      {required String position,
      required String move,
      required String format}) {
    return _underwaterChessApi.getTurnFromAI(
        position: position, move: move, format: format);
  }

  @override
  Future<TurnModel> getTurnFromBoard(
      {required String position,
      required String move,
      required String format}) {
    // return _arduinoBluetoothApi.getTurnFromBoard(move: move, format: format);
    return _underwaterChessApi.getTurnFromAI(
        position: position, move: move, format: format);
  }
}
