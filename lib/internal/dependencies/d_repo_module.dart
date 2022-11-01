import 'package:smart_chess_board/internal/dependencies/d_api_module.dart';

import 'package:smart_chess_board/domain/contracts/c_turn.dart';
import 'package:smart_chess_board/domain/contracts/c_blue.dart';

import 'package:smart_chess_board/data/repositories/r_turn.dart';
import 'package:smart_chess_board/data/repositories/r_flutterblue.dart';

// "На рисунке это набор разных кухонь и меню к ним"
class DependencyModuleRepository {
  // "конкретные кухни (и их меню) куда официанты передают заказы"
  static ContracrTurn? _turnRepository;
  static ContracrBlue? _libFlutterBlueRepository;

  static ContracrTurn turn() {
    // if ref == null return new or current ref
    return _turnRepository ??=
        RepositoryTurn(DependencyModuleApi.underwaterChess());
  }

  static ContracrBlue libFlutterBlue() {
    // if ref == null return new or current ref
    return _libFlutterBlueRepository ??=
        RepositoryFlutterBlue(DependencyModuleApi.libFlutterBlue());
  }
}
