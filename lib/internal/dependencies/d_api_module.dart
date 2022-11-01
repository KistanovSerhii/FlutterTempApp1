import 'package:smart_chess_board/data/api/a_underwaterchess.dart';
import 'package:smart_chess_board/data/api/services/s_underwaterchess.dart';
import 'package:smart_chess_board/data/api/services/s_flutterblue.dart';

import 'package:smart_chess_board/data/api/a_flutterblue.dart';

// "На рисунке это набор разных шеф-поваров, но каждый шеф требуют дать ему поставщика ингридиентов"
// (например "ServiceUnderwaterChess" - на рисунку это поставщик ингридиентов)
class DependencyModuleApi {
  static ApiUnderwaterChess? _underwaterChessApi;
  static ApiWrapFlutterBlue? _wrapFlutterBlueApi;

  static ApiUnderwaterChess underwaterChess() {
    // if ref == null return new or current ref
    return _underwaterChessApi ??= ApiUnderwaterChess(ServiceUnderwaterChess());
  }

  static ApiWrapFlutterBlue libFlutterBlue() {
    // if ref == null return new or current ref
    return _wrapFlutterBlueApi ??= ApiWrapFlutterBlue(ServiceFlutterBlue());
  }
}
