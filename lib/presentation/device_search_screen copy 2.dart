import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:smart_chess_board/domain/state/devicemodules/bluetooth.dart';

import 'package:localization/localization.dart';

import 'package:smart_chess_board/presentation/elements/e_collaps_row_in_list_for_blue_device.dart';
import 'package:smart_chess_board/presentation/bluetooth_device_propertise.dart';
/*
// Экран поиска bluetooth устройств (список найденых и кнопка "найти")
class DeviceSearchScreen extends StatelessWidget {
  DeviceSearchScreen({Key? key}) : super(key: key);

  List<String> pairedDeviceIDstrList = [];
  List<String> availableDeviceIDstrList = [];

  List<Widget> pairedDeviceList = [];
  List<Widget> availableDeviceList = [];

  int scanTime = 3;
  StreamSubscription<List<ScanResult>>? subscriptionScanResults;

  FlutterBlue flutterBlue = FlutterBlue.instance;
  StreamSubscription? scanSubscription;
  BluetoothDevice? device;

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
            onRefresh: () => FlutterBlue.instance
                .startScan(timeout: const Duration(seconds: 4)),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                Text("1/3 Подключенные устройства (только имя==Chess)",
                    style: TextStyle(color: Theme.of(context).primaryColor)),
// ****************** Список подключенных устройств/List of paired devices ****************** +
                StreamBuilder<List<BluetoothDevice>>(
                    stream: Stream.periodic(const Duration(seconds: 2))
                        .asyncMap((_) => FlutterBlue.instance.connectedDevices),
                    initialData: const [],
                    builder: (c, snapshot) => Column(
                          children: getPairedDevices(context, snapshot.data, c),
                        )),
                /*StreamBuilder<List<BluetoothDevice>>(
                  stream: Stream.periodic(const Duration(seconds: 2))
                      .asyncMap((_) => FlutterBlue.instance.connectedDevices),
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
                /*
                StreamBuilder<List<BluetoothDevice>>(
                    stream: Stream.periodic(const Duration(seconds: 2))
                        .asyncMap((_) => FlutterBlue.instance.connectedDevices),
                    initialData: const [],
                    builder: (c, snapshot) => Column(
                        children: getPairedDevices(context, snapshot.data, c))),
                        */
// ****************** Список подключенных устройств/List of paired devices ****************** -
                Text("2/3 Сохраненные устройства (только имя==Chess)",
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                Text("1/3 Найденные устройства (только имя==Chess)",
                    style: TextStyle(color: Theme.of(context).primaryColor)),
// ****************** Список найденных (еще не подключенных) устройств/List of found devices ****************** +
                StreamBuilder<List<ScanResult>>(
                    stream: FlutterBlue.instance.scanResults,
                    initialData: const [],
                    builder: (c, snapshot) => Column(
                          children: getAvailableDevices(c, snapshot.data),
                        )),
// ****************** Список найденных (еще не подключенных) устройств/List of found devices ****************** -
              ]),
            )));
  }

  List<Widget> getPairedDevices(context, r, c) {
    //pairedDeviceList.add(Text("123"));
    //return pairedDeviceList;

    for (int i = 0; i < r!.length; i++) {
      BluetoothDevice currentDevice = r[i];
      String deviceIdstr = currentDevice.id.toString();

      if (pairedDeviceIDstrList.contains(deviceIdstr)) continue;

      pairedDeviceIDstrList.add(deviceIdstr);
      pairedDeviceList.add(
        Text("buttonOpen-title".i18n(),
            style: TextStyle(color: Theme.of(context).primaryColor)),

        /*
        ListTile(
        title: Text(currentDevice.name),
        subtitle: Text(currentDevice.id.toString()),
        trailing: StreamBuilder<BluetoothDeviceState>(
          stream: currentDevice.state,
          initialData: BluetoothDeviceState.disconnected,
          builder: (c, snapshot) {
            if (r == BluetoothDeviceState.connected) {
              return ElevatedButton(
                child: Text("buttonOpen-title".i18n()),
                onPressed: null,
                /*
                    () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        DevicePropertiesScreen(device: currentDevice))
                        
                        ),*/
              );
            }
            return Text(r.toString());
          },
        ),
      )
      */
      );
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
          result: r[i],
          // Подключиться к выбранному устройству и открыть форму свойств
          onTap: () {
            currentDevice.connect();
            pairedDeviceIDstrList.add(deviceIdstr);
            availableDeviceIDstrList.remove(deviceIdstr);
            // SetState((){});
          }
          /*
          => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          currentDevice.connect();
          return DevicePropertiesScreen(device: currentDevice);
        }
        )),image.png*/
          ));
    }
    return availableDeviceList;
  }
}
*/