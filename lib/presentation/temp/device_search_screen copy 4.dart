import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:smart_chess_board/domain/state/devicemodules/bluetooth.dart';

import 'package:localization/localization.dart';

import 'package:smart_chess_board/presentation/elements/e_collaps_row_in_list_for_blue_device.dart';
import 'package:smart_chess_board/presentation/temp/bluetooth_device_propertise.dart';

// Экран поиска bluetooth устройств (список найденых и кнопка "найти")
class DeviceSearchScreen extends StatelessWidget {
  DeviceSearchScreen({super.key});

  List<String> pairedDeviceIDstrList = [];
  List<String> availableDeviceIDstrList = [];

  List<ECollapsRowInListForBlueDevice> pairedDeviceList = [];
  List<ECollapsRowInListForBlueDevice> availableDeviceList = [];

  FlutterBlue flutterBlue = FlutterBlue.instance;
  int scanTime = 3;
  bool screenIsBlock = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("blueSearcher-title".i18n()),
// *******Командная панель текущей формы******* +
// ******************Start and Stop searshing BUTTON****************** +
          actions: <Widget>[
            StreamBuilder<bool>(
              stream: flutterBlue.isScanning,
              initialData: false,
              builder: (c, snapshot) {
                VoidCallback? onPressedSearchBtn;
                Text blueScanerBtn;

                if (snapshot.data!) {
                  onPressedSearchBtn = () {
                    flutterBlue.stopScan();
                  };
                  blueScanerBtn = Text("blueScanerBtnOff".i18n());
                } else {
                  onPressedSearchBtn = () {
                    flutterBlue.startScan(timeout: Duration(seconds: scanTime));
                  };
                  blueScanerBtn = Text("blueScanerBtnOn".i18n());
                }

                return TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                  onPressed: onPressedSearchBtn,
                  child: blueScanerBtn,
                );
              },
            )
          ],
// ******************Start and Stop searshing BUTTON****************** -
// *******Командная панель текущей формы******* -
        ),
        body: RefreshIndicator(
            onRefresh: () =>
                flutterBlue.startScan(timeout: Duration(seconds: scanTime)),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Text("1/3 Подключенные устройства (только имя==Chess)",
                    style: TextStyle(color: Theme.of(context).primaryColor)),
// ****************** Список подключенных устройств/List of paired devices ****************** +
                StreamBuilder<List<BluetoothDevice>>(
                    stream: Stream.periodic(Duration(seconds: scanTime))
                        .asyncMap((_) => flutterBlue.connectedDevices),
                    initialData: const [],
                    builder: (c, snapshot) => Column(
                          children: getPairedDevices(context, snapshot.data),
                        )),
// ****************** Список подключенных устройств/List of paired devices ****************** -
                Text("2/3 Сохраненные устройства (только имя==Chess)",
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                Text("1/3 Найденные устройства (только имя==Chess)",
                    style: TextStyle(color: Theme.of(context).primaryColor)),
// ****************** Список найденных (еще не подключенных) устройств/List of found devices ****************** +
                StreamBuilder<List<ScanResult>>(
                    stream: flutterBlue.scanResults,
                    initialData: const [],
                    builder: (c, snapshot) => Column(
                          children: getAvailableDevices(c, snapshot.data),
                        )),
// ****************** Список найденных (еще не подключенных) устройств/List of found devices ****************** -
              ]),
            )));
  }

  List<Widget> getPairedDevices(context, r) {
    bool needRefresh = false;

    for (int i = 0; i < r!.length; i++) {
      BluetoothDevice currentDevice = r[i];

      String deviceIdstr = currentDevice.id.toString();
      if (pairedDeviceIDstrList.contains(deviceIdstr)) continue;

      if (availableDeviceIDstrList.contains(deviceIdstr)) {
        pairedDeviceIDstrList.add(deviceIdstr);
        availableDeviceIDstrList.remove(deviceIdstr);
        availableDeviceList.removeWhere(
            (element) => deviceIdstr == element.device.id.toString());
        needRefresh = true;
      }

      pairedDeviceList.add(ECollapsRowInListForBlueDevice(
          device: currentDevice,
          btnTitle: 'buttonDisconnect-title'.i18n(),
          onTap: () {
            currentDevice.disconnect();
            // remove
            availableDeviceIDstrList.add(deviceIdstr);
            pairedDeviceIDstrList.remove(deviceIdstr);
            ECollapsRowInListForBlueDevice? removingElement;

            for (int i = 0; i < pairedDeviceList.length; i++) {
              if (deviceIdstr == pairedDeviceList[i].device.id.toString()) {
                removingElement = pairedDeviceList[i];
                break;
              }
            }

            pairedDeviceList.remove(removingElement);
            //removingElement!.btnTitle = 'buttonConnect-title'.i18n();
            availableDeviceList.add(removingElement!);

            flutterBlue.startScan(timeout: const Duration(seconds: 1));
          }));
    }

    if (needRefresh) {
      flutterBlue.startScan(timeout: const Duration(seconds: 1));
      screenIsBlock = false;
    }

    return pairedDeviceList;
  }

  List<Widget> getAvailableDevices(context, r) {
    for (int i = 0; i < r.length; i++) {
      String deviceIdstr = r[i].device.id.toString();
      if (availableDeviceIDstrList.contains(deviceIdstr) ||
          pairedDeviceIDstrList.contains(deviceIdstr)) continue;

      BluetoothDevice currentDevice = r[i].device;

      availableDeviceIDstrList.add(deviceIdstr);
      availableDeviceList.add(ECollapsRowInListForBlueDevice(
          device: r[i].device,
          btnTitle: 'buttonConnect-title'.i18n(),
          // Подключиться к выбранному устройству и открыть форму свойств
          onTap: () {
            currentDevice.connect();
            // В этом разделе Необходимо блокировать экран!
            screenIsBlock = true;
          }
          /*
          => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          currentDevice.connect();
          return DevicePropertiesScreen(device: currentDevice);
        }
        ))*/
          ));
    }
    return availableDeviceList;
  }
}

/*StreamBuilder<List<BluetoothDevice>>(
                  stream: Stream.periodic(Duration(seconds: scanTime))
                      .asyncMap((_) => flutterBlue.connectedDevices),
                  initialData: const [],
                  builder: (c, snapshot) => Column(
                    children: snapshot.data!
                        .map((d) => ListTile(
                              title: Text(d.name),
                              subtitle: Text(d.id.toString()),
                              trailing: StreamBuilder<BluetoothDeviceState>(
                                stream: d.state,
                                initialData: BluetoothDeviceState.disconnected,
                                builder: (c, snapshot) {
                                  if (snapshot.data ==
                                      BluetoothDeviceState.connected) {
                                    return ElevatedButton(
                                      child: Text("buttonOpen-title".i18n()),
                                      onPressed: () => Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  DevicePropertiesScreen(
                                                      device: d))),
                                    );
                                  }
                                  return Text(snapshot.data.toString());
                                },
                              ),
                            ))
                        .toList(),
                  ),
                ),*/