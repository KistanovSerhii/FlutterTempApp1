import 'package:flutter_blue/flutter_blue.dart';

// "На рисунку это товар поставщика из которого шеф-повар приготовит какое либо блюдо"
class ServiceModelBlueDevice {
  final BluetoothDevice ref;
  final dynamic id;

  ServiceModelBlueDevice.fromApi({required device})
      : ref = device,
        id = device.id;
}
