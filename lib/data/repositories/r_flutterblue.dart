import 'package:smart_chess_board/domain/models/m_bluedevice.dart';
import 'package:smart_chess_board/domain/contracts/c_blue.dart';
import 'package:smart_chess_board/data/api/a_flutterblue.dart';

// "На рисунке это кухня"
class RepositoryFlutterBlue extends ContracrBlue {
  final ApiWrapFlutterBlue _flutterBlueApi;

  RepositoryFlutterBlue(this._flutterBlueApi);

  @override
  Future<bool> tryToConnect({required String id, required String name}) {
    return _flutterBlueApi.tryToConnect(id: id, name: name);
  }

  @override
  Future<List<ModelBlueDevice>> getAvailableDevices({required int time}) {
    return _flutterBlueApi.getAvailableDevices(time: time);
  }
}
