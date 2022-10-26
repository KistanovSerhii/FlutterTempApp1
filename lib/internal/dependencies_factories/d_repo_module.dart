import 'package:smart_chess_board/internal/dependencies_factories/d_api_module.dart';
import 'package:smart_chess_board/data/repositories/r_turn.dart';
import 'package:smart_chess_board/domain/contracts/c_turn.dart';

class RepositoryModuleDependency {
  static TurnContracr? _turnContracr;

  static TurnContracr turnContracr() {
    if (_turnContracr == null) {
      _turnContracr = TurnRepository(
        ApiModuleDependency.underwaterChessApi(),
      );
    }
    return _turnContracr!;
  }
}
