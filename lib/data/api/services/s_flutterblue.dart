import 'package:flutter_blue/flutter_blue.dart';
import 'package:smart_chess_board/data/api/services_parameters/s_p_bluedevice.dart';
import 'package:smart_chess_board/data/api/service_models/s_m_bluedevice.dart';

// "На рисунку это поставщик ингридиентов (товаров)"
class ServiceFlutterBlue {
  static final FlutterBlue _flutterBlueApi = FlutterBlue.instance;

  Future<List<ServiceModelBlueDevice>> getAvailableDevices(
      ParametersFlutterBlueGetDevices body) async {
    List<ServiceModelBlueDevice> devicelist = [];

    List<ScanResult> result =
        await _flutterBlueApi.scan(timeout: body.duration).toList();

    _flutterBlueApi.stopScan();

    for (int i = 0; i < result.length; i++) {
      var found =
          devicelist.where((element) => element.ref == result[i].device);
      if (found.isEmpty) {
        devicelist
            .add(ServiceModelBlueDevice.fromApi(device: result[i].device));
      }
    }

    return devicelist;
  }

  Future<ServiceModelBlueDevice> getPaired(
      ParametersFlutterBlueGetDevice body) async {
    ServiceModelBlueDevice? serviceModel;
    BluetoothDevice? device;
    List<BluetoothDevice> connectedList =
        await _flutterBlueApi.connectedDevices;

    for (int i = 0; i < connectedList.length; i++) {
      if (i == 0) {
        device = connectedList[i];
        continue;
      }
      connectedList[i].disconnect();
    }

    serviceModel = ServiceModelBlueDevice.fromApi(device: device!);

    return serviceModel;
  }

  Future<bool> tryToConnect(ParametersFlutterBlueGetDevice body) async {
    BluetoothDevice? device;

    List<ScanResult> result = await _flutterBlueApi
        .scan(timeout: const Duration(seconds: 3))
        .toList();

    _flutterBlueApi.stopScan();

    for (int i = 0; i < result.length; i++) {
      if (result[i].device.id.toString() == body.id &&
          result[i].device.name == body.name) {
        device = result[i].device;
        break;
      }
    }

    try {
      await device!.connect();
      return true;
    } catch (e) {
      return false;
    }
  }
}
