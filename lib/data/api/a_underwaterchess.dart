import 'package:smart_chess_board/domain/models/m_turn.dart';
import 'package:smart_chess_board/data/api/services/s_underwaterchess.dart';
import 'package:smart_chess_board/data/api/services_parameters/s_p_turn.dart';
import 'package:smart_chess_board/data/api/type_converters/t_c_turn.dart';

class UnderwaterChessApi {
  final UnderwaterChessService _underwaterChessService;

  UnderwaterChessApi(this._underwaterChessService);

  Future<TurnModel> getTurnFromAI({
    required String position,
    required String move,
    required String format,
  }) async {
    final parameters =
        TurnParameters(position: position, move: move, format: format);
    final result = await _underwaterChessService.getTurnFromAI(parameters);
    return TurnTypeConverter.fromApi(result);
  }
}
