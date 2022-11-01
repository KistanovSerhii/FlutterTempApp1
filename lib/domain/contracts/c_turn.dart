import 'package:smart_chess_board/domain/models/m_turn.dart';

// "На рисунке это меню кухни (содержит исключительно то что способна приготовить кухня)"
abstract class ContracrTurn {
  Future<ModelTurn> getTurnFromAI({
    required String position,
    required String move,
    required String format,
  });

  Future<ModelTurn> getTurnFromBoard({
    required String position,
    required String move,
    required String format,
  });
}
