import 'package:flutter/foundation.dart';
import 'package:smart_chess_board/domain/models/m_bluedevice.dart';
import 'package:smart_chess_board/domain/models/m_turn.dart';
import 'package:smart_chess_board/domain/contracts/c_turn.dart';
import 'package:smart_chess_board/domain/contracts/c_blue.dart';

// "На рисунке это официант"
// notifyListeners() - вызывает обновление view (на рисунке - обслужить столик)
class StateHomeScreen extends ChangeNotifier {
  StateHomeScreen({required this.turnContracr, required this.blueContracr});

  final ContracrTurn turnContracr;
  final ContracrBlue blueContracr;

  ModelTurn? turn;
  bool? hasPaired;
  List<ModelBlueDevice>? blueDevices;
  bool isLoading = false;

  Future<void> getTurnFromAI({
    required String position,
    required String move,
    required String format,
  }) async {
    notifyListeners();
    isLoading = true;
    final data = await turnContracr.getTurnFromAI(
        position: position, move: move, format: format);
    turn = data;
    isLoading = false;
    notifyListeners();
  }

  Future<void> getDeviceBy({required String id, required String name}) async {
    notifyListeners();
    final data = await blueContracr.tryToConnect(id: id, name: name);
    hasPaired = data;
    notifyListeners();
  }

  Future<void> getAvailableDevices([int time = 1]) async {
    notifyListeners();
    final data = await blueContracr.getAvailableDevices(time: time);
    blueDevices = data;
    notifyListeners();
  }
}
