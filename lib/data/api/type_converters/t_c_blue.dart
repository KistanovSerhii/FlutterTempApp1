import 'package:smart_chess_board/domain/models/m_bluedevice.dart';
import 'package:smart_chess_board/data/api/service_models/s_m_bluedevice.dart';

// "На рисунке это инструмент приготовления (например блендер)"
class TypeConverterBlue {
  static List<ModelBlueDevice> fromApiList(List<ServiceModelBlueDevice> data) {
    return data
        .map((d) => ModelBlueDevice(name: d.ref.name, id: d.ref.id.toString()))
        .toList();
  }

  static ModelBlueDevice fromApi(ServiceModelBlueDevice data) {
    return ModelBlueDevice(name: data.ref.name, id: data.ref.id.toString());
  }
}
