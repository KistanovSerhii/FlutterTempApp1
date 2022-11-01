import 'package:smart_chess_board/data/api/services_parameters/s_p_bluedevice.dart';
import 'package:smart_chess_board/domain/models/m_bluedevice.dart';
import 'package:smart_chess_board/data/api/services/s_flutterblue.dart';
import 'package:smart_chess_board/data/api/type_converters/t_c_blue.dart';

// "На рисунке это шеф-повар"
class ApiWrapFlutterBlue {
  final ServiceFlutterBlue _flutterBLueService;

  ApiWrapFlutterBlue(this._flutterBLueService);

  Future<bool> tryToConnect({required String id, required String name}) async {
    final parameters = ParametersFlutterBlueGetDevice(id: id, name: name);
    final result = await _flutterBLueService.tryToConnect(parameters);
    return result;
  }

  Future<List<ModelBlueDevice>> getAvailableDevices({required int time}) async {
    final parameters = ParametersFlutterBlueGetDevices(time: time);
    final result = await _flutterBLueService.getAvailableDevices(parameters);
    return TypeConverterBlue.fromApiList(result);
  }
}
