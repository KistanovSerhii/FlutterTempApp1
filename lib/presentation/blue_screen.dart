import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:localization/localization.dart';
import 'package:smart_chess_board/presentation/elements/e_collaps_row_in_list_for_blue_device.dart';

import 'package:provider/provider.dart';
import 'package:smart_chess_board/domain/state/state_blue_screen.dart';

// Экран поиска bluetooth устройств (список найденых и кнопка "найти")
class BlueScreen extends StatefulWidget {
  const BlueScreen({Key? key, required this.blueContext}) : super(key: key);

  final StateBlueScreen blueContext;

  @override
  _BlueScreenState createState() => _BlueScreenState();
}

class _BlueScreenState extends State<BlueScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style: TextStyle(color: Theme.of(context).primaryColor)),
// ****************** Список подключенных устройств/List of paired devices ****************** +
// ****************** Список подключенных устройств/List of paired devices ****************** -
                Text("2/3 Сохраненные устройства (только имя==Chess)",
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                Text("1/3 Найденные устройства (только имя==Chess)",
                    style: TextStyle(color: Theme.of(context).primaryColor)),
// ****************** Список найденных (еще не подключенных) устройств/List of found devices ****************** +
                Consumer<StateBlueScreen>(
                    builder: (context, blueStateData, child) {
                  if (blueStateData.isSearching) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (blueStateData.blueDevices == null) {
                    return Container();
                  }

                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: blueStateData.blueDevices!
                          .map((d) => Text(
                              'id ${d.id.toString()} , name ${d.name}',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor)))
                          .toList());
                }),
// ****************** Список найденных (еще не подключенных) устройств/List of found devices ****************** -
              ]),
            )));
  }

  Future<void> scanBtn() async {
    Provider.of<StateBlueScreen>(context, listen: false).getAvailableDevices();
    // widget.blueContext.isSearching = true;
    // widget.blueContext.getAvailableDevices();
    print("Searching...");
  }
}
