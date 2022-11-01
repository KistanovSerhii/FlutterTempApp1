import 'package:flutter/material.dart';

import 'package:smart_chess_board/presentation/blue_screen.dart';
import 'package:smart_chess_board/presentation/blue_off_screen.dart';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart';
import 'package:smart_chess_board/domain/state/state_home_screen.dart';
import 'package:smart_chess_board/domain/state/state_blue_screen.dart';

import 'package:localization/localization.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BluetoothState? _blueState;
  StateHomeScreen? _homeScreenState;
  String position = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _homeScreenState = Provider.of<StateHomeScreen?>(context);
//*********************Bluetooth********************* +
    return StreamBuilder<BluetoothState>(
        stream: FlutterBlue.instance.state,
        initialData: BluetoothState.unknown,
        builder: (c, snapshot) {
          _blueState = snapshot.data;
//*********************Bluetooth********************* -
          Widget bluetoothScreen = (_blueState == BluetoothState.on)
              ? BlueScreen(blueContext: Provider.of<StateBlueScreen>(context))
              : BlueOffScreen(state: _blueState);

          Icon blueStateIcon = (_blueState == BluetoothState.on)
              ? const Icon(Icons.leak_add)
              : const Icon(Icons.leak_remove);

          return Scaffold(
            appBar: AppBar(
              title: Text('app-bar'.i18n(),
                  style: TextStyle(color: Theme.of(context).primaryColor)),
// *******Командная панель текущей формы******* +
              actions: <Widget>[
                IconButton(
                    icon: blueStateIcon,
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => bluetoothScreen))),
                IconButton(
                    icon: const Icon(Icons.settings), onPressed: () => {}),
              ],
// *******Командная панель текущей формы******* -
            ),
            body: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  children: [
// *******Provider******* +
                    Builder(builder: (BuildContext context) {
                      if (_homeScreenState!.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (_homeScreenState!.turn == null) {
                        return Container();
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                              'Лучший ход: ${_homeScreenState!.turn!.bestMove}',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor)),
                        ],
                      );
                    }),
// *******Provider******* -
// *******Test get bluetooth data by wrapper******* +
                    Builder(builder: (BuildContext context) {
                      if (_homeScreenState!.blueDevices == null) {
                        return Container();
                      }
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: _homeScreenState!.blueDevices!
                              .map((d) => Text(
                                  'rssi ${d.id.toString()} name ${d.name}',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor)))
                              .toList());
                    }),
// *******Test get bluetooth data by wrapper******* -
                    ElevatedButton(
                        onPressed: () {
                          _homeScreenState!.getAvailableDevices(2);
                          Provider.of<StateHomeScreen?>(context, listen: false)!
                              .getTurnFromAI(
                                  position: position,
                                  move: "e2e4",
                                  format: "json");
                        },
                        child: Text("Get data",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)))
                  ],
                )),
          );
        });
  }
}
