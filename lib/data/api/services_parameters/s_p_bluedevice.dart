// "На рисунку это желание-заказ клиента (например: три порции яблочного сока)"
class ParametersFlutterBlueGetDevice {
  final String id;
  final String name;

  ParametersFlutterBlueGetDevice({required this.id, required this.name});
}

class ParametersFlutterBlueGetDevices {
  final Duration duration;

  ParametersFlutterBlueGetDevices({required time})
      : duration = Duration(seconds: time);
}
