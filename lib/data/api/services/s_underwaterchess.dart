import 'package:dio/dio.dart';
import 'package:smart_chess_board/data/api/services_parameters/s_p_turn.dart';
import 'package:smart_chess_board/data/api/service_models/s_m_turn.dart';

// "На рисунку это поставщик ингридиентов (товаров)"
class ServiceUnderwaterChess {
  static const baseurlUnderwaterChessService =
      'https://fast-citadel-36391.herokuapp.com/game?';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: baseurlUnderwaterChessService),
  );

  Future<ServiceModelTurn> getTurnFromAI(ParametersTurn body) async {
    final response = await _dio.get(
      '/',
      queryParameters: body.toApi(),
    );

    return ServiceModelTurn.fromApi(response.data);
  }
}
