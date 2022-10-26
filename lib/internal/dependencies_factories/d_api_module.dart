import 'package:smart_chess_board/data/api/a_underwaterchess.dart';
import 'package:smart_chess_board/data/api/services/s_underwaterchess.dart';

class ApiModuleDependency {
  static UnderwaterChessApi? _underwaterChessApi;

  static UnderwaterChessApi underwaterChessApi() {
    if (_underwaterChessApi == null) {
      _underwaterChessApi = UnderwaterChessApi(UnderwaterChessService());
    }
    return _underwaterChessApi!;
  }
}
