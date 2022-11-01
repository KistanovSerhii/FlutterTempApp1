import 'dart:async';

import 'package:flutter/material.dart';

import 'package:localization/localization.dart';
import 'package:smart_chess_board/internal/dependencies/d_state_module.dart';

import 'package:provider/provider.dart';
import 'package:smart_chess_board/domain/state/state_blue_screen.dart';

// Экран поиска bluetooth устройств (список найденых и кнопка "найти")
class BlueScreen extends StatefulWidget {
  final BuildContext ctx;
  const BlueScreen({Key? key, required this.ctx}) : super(key: key);

  @override
  _BlueScreenState createState() => _BlueScreenState();
}

class _BlueScreenState extends State<BlueScreen> {
  StateBlueScreen? _blueState;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _blueState = widget.ctx.watch<StateBlueScreen>();
    return Provider<StateBlueScreen>(
        create: (_) => DependencyModuleState.blueState(),
        child: Scaffold(
            appBar: AppBar(
              title: Text("blueSearcher-title".i18n()),
// *******Командная панель текущей формы******* +
// ******************Start and Stop searshing BUTTON****************** +
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: scanBtn,
                  child: Text("blueScanerBtnOn".i18n()),
                ),
              ],
// ******************Start and Stop searshing BUTTON****************** -
// *******Командная панель текущей формы******* -
            ),
            body: RefreshIndicator(
                onRefresh: scanBtn,
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Text("1/3 Подключенные устройства (только имя==Chess)",
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
// ****************** Список подключенных устройств/List of paired devices ****************** +
// ****************** Список подключенных устройств/List of paired devices ****************** -
                    Text("2/3 Сохраненные устройства (только имя==Chess)",
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                    Text("1/3 Найденные устройства (только имя==Chess)",
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
// ****************** Список найденных (еще не подключенных) устройств/List of found devices ****************** +
// *******Test get bluetooth data by wrapper******* +
                    Builder(builder: (BuildContext context) {
                      if (_blueState!.blueDevices == null) {
                        return Container();
                      }
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: _blueState!.blueDevices!
                              .map((d) => Text(
                                  'rssi ${d.id.toString()} name ${d.name}',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor)))
                              .toList());
                    }),
// *******Test get bluetooth data by wrapper******* -
// ****************** Список найденных (еще не подключенных) устройств/List of found devices ****************** -
                  ]),
                ))));
  }

  Future<void> scanBtn() async {
    _blueState!.isSearching = true;
    Provider.of<StateBlueScreen?>(context, listen: false)!
        .getAvailableDevices();
  }
}
