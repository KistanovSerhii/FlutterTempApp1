import 'package:smart_chess_board/domain/models/m_bluedevice.dart';

// "На рисунке это меню кухни (содержит исключительно то что способна приготовить кухня)"
abstract class ContracrBlue {
  Future<bool> tryToConnect({required String id, required String name});
  Future<List<ModelBlueDevice>> getAvailableDevices({required int time});
}
