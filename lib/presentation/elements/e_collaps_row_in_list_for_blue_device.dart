import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:smart_chess_board/common/constants.dart';
import 'package:smart_chess_board/domain/state/devicemodules/bluetooth.dart';
import 'package:smart_chess_board/presentation/elements/e_value_with_title_in_line.dart';
import 'package:smart_chess_board/presentation/elements/e_blue_properties_in_one_line.dart';

import 'package:localization/localization.dart';

class ECollapsRowInListForBlueDevice extends StatelessWidget {
  const ECollapsRowInListForBlueDevice(
      {Key? key, required this.device, required this.btnTitle, this.onTap})
      : super(key: key);

  final BluetoothDevice device;
  final String btnTitle;
  final VoidCallback? onTap; // событие кнопки заголовка

  @override
  Widget build(BuildContext context) {
    // Сворачиваемый заголовок (свернуть/развернуть при нажатии на строку)
    return ExpansionTile(
      title: EBlueDevicePropertiesInOneLine(device: device, key: key),
      leading: Text(
          device.name.toUpperCase().contains(Constants.arduinoModuleName)
              ? "*"
              : "",
          style:
              TextStyle(color: Theme.of(context).primaryColor)), // First column
      // Любой Widget в заголовке (в нашем случаи Кнопка подключения/отключения)
      trailing: ElevatedButton(
        child: Text(btnTitle,
            style: TextStyle(color: Theme.of(context).primaryColor)),
        onPressed: onTap,
      ),
      // Содержимое при разворачивании заголовка
      children: <Widget>[
        eValueWithTitleInOneLine(context, 'blueName-lable'.i18n(), device.name),
      ],
    );
  }
}
