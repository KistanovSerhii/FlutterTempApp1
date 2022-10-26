import 'package:smart_chess_board/domain/models/m_turn.dart';

// Интерфейс-Контракт
abstract class TurnContracr {
  // Методы который обязаны быть реализованы!
  // &move=e2e3&format=json
  Future<TurnModel> getTurnFromAI({
    required String position,
    required String move,
    required String format,
  });

  Future<TurnModel> getTurnFromBoard({
    required String position,
    required String move,
    required String format,
  });
}
