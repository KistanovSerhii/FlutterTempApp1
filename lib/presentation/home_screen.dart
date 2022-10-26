import 'package:flutter/material.dart';

import 'package:smart_chess_board/presentation/device_search_screen.dart';
import 'package:smart_chess_board/presentation/bluetooth_moduleoff_screen.dart';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:provider/provider.dart';
import 'package:smart_chess_board/domain/models/test_provider.dart';

import 'package:smart_chess_board/internal/dependencies_factories/d_home_module.dart';
import 'package:smart_chess_board/domain/state/state_home_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BluetoothState? _blueState;

  HomeScreenState? _homeScreenState;

  String position = "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";

  @override
  void initState() {
    super.initState();
    _homeScreenState = HomeModuleDependency.homeState();
  }

  void setBlueState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _homeScreenState!
        .getTurnFromAI(position: position, move: "e2e4", format: "json");

//*********************Provider********************* +
    final modelProviderTest =
        Provider.of<MyModelProviderTest>(context, listen: false);
//*********************Provider********************* -

//*********************Bluetooth********************* +
    return StreamBuilder<BluetoothState>(
        stream: FlutterBlue.instance.state,
        initialData: BluetoothState.unknown,
        builder: (c, snapshot) {
          _blueState = snapshot.data;
//*********************Bluetooth********************* -
          Widget bluetoothScreen = (_blueState == BluetoothState.on)
              ? DeviceSearchScreen()
              : BluetoothModuleOffScreen(state: _blueState);

          Icon blueStateIcon = (_blueState == BluetoothState.on)
              ? const Icon(Icons.leak_add)
              : const Icon(Icons.leak_remove);

          return Scaffold(
            appBar: AppBar(
              title: const Text("Main menu"),
// *******Командная панель текущей формы******* +
              actions: <Widget>[
                IconButton(
                    icon: blueStateIcon,
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => bluetoothScreen))),
                IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () => setBlueState()),
              ],
// *******Командная панель текущей формы******* -
            ),
            body: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Container(
                  child: Column(
                children: [
                  Text(modelProviderTest.foo,
                      style: TextStyle(color: Theme.of(context).primaryColor)),

// *******Try clean code******* +
                  Text(
                      'Восход: ${_homeScreenState!.turn == null ? "*" : _homeScreenState!.turn!.bestMove}',
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  Builder(builder: (BuildContext context) {
                    if (_homeScreenState!.isLoading)
                      return Center(child: CircularProgressIndicator());
                    if (_homeScreenState!.turn == null) return Container();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Лучший ход: ${_homeScreenState!.turn!.bestMove}',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)),
                      ],
                    );
                  }),
// *******Try clean code******* -
                ],
              )),
            ),
          );
        });
  }
}
