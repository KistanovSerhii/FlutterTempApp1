import 'package:dio/dio.dart';
import 'package:smart_chess_board/data/api/services_parameters/s_p_turn.dart';
import 'package:smart_chess_board/data/api/service_models/s_m_turn.dart';

// ВАЖНО проверять наличие интернета иначе валит ошибку в которой не разобраться!

class UnderwaterChessService {
  static const _BASE_URL = 'https://fast-citadel-36391.herokuapp.com/game?';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<TurnServiceModel> getTurnFromAI(TurnParameters body) async {
    final response = await _dio.get(
      '/',
      queryParameters: body.toApi(),
    );

    return TurnServiceModel.fromApi(response.data);
  }
}
