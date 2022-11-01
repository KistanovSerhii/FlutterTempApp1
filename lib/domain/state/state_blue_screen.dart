import 'package:flutter/foundation.dart';
import 'package:smart_chess_board/domain/models/m_bluedevice.dart';

import 'package:smart_chess_board/domain/contracts/c_blue.dart';

// "На рисунке это официант"
// notifyListeners() - вызывает обновление view (на рисунке - обслужить столик)
class StateBlueScreen extends ChangeNotifier {
  StateBlueScreen({required this.blueContracr});

  final ContracrBlue blueContracr;

  List<ModelBlueDevice>? blueDevices;
  bool hasPaired = false;
  bool isSearching = false;

  Future<void> getDeviceBy({required String id, required String name}) async {
    isSearching = true;
    final data = await blueContracr.tryToConnect(id: id, name: name);
    hasPaired = data;
    isSearching = false;
    notifyListeners();
  }

  Future<void> getAvailableDevices([int time = 1]) async {
    isSearching = true;
    final data = await blueContracr.getAvailableDevices(time: time);
    blueDevices = data;
    isSearching = false;
    notifyListeners();
  }
}
