import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:localization/localization.dart';

class Blue {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  StreamSubscription? scanSubscription;
  List<BlueDevice> deviceList = [];

  List<BlueDevice> getConnectedDevices() {
    deviceList.clear();

    StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 2))
            .asyncMap((_) => flutterBlue.connectedDevices),
        initialData: const [],
        builder: (c, snapshot) {
          deviceList = snapshot.data!.map((d) => BlueDevice(d: d)).toList();
          return ListView(
            children: deviceList,
          );
          deviceList;
        });

    return deviceList;
  }
}

class BlueDevice extends StatefulWidget {
  BlueDevice({Key? key, required BluetoothDevice this.d}) : super(key: key);

  BluetoothDevice d;

  @override
  State<BlueDevice> createState() => _BlueDeviceState(this.d);
}

class _BlueDeviceState extends State<BlueDevice> {
  _BlueDeviceState(this._d);

  BluetoothDevice _d;

  @override
  void initState() {
    _d = widget.d;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Device name: ${_d.name} ${_d.id} ",
          style: TextStyle(color: Theme.of(context).primaryColor)),
    );
  }
}
