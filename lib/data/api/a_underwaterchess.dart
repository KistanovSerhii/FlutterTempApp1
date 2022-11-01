import 'package:smart_chess_board/domain/models/m_turn.dart';
import 'package:smart_chess_board/data/api/services/s_underwaterchess.dart';
import 'package:smart_chess_board/data/api/services_parameters/s_p_turn.dart';
import 'package:smart_chess_board/data/api/type_converters/t_c_turn.dart';

// "На рисунке это шеф-повар"
class ApiUnderwaterChess {
  final ServiceUnderwaterChess _underwaterChessService;

  ApiUnderwaterChess(this._underwaterChessService);

  Future<ModelTurn> getTurnFromAI({
    required String position,
    required String move,
    required String format,
  }) async {
    // ВАЖНО проверять наличие интернета иначе валит ошибку в которой пользователю не разобраться!
    final parameters =
        ParametersTurn(position: position, move: move, format: format);
    final result = await _underwaterChessService.getTurnFromAI(parameters);

    return TypeConverterTurn.fromApi(result);
  }
}
