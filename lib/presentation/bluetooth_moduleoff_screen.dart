import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'package:localization/localization.dart';
import 'package:smart_chess_board/theme.dart';

// Screen when device bluetooth is off

class BluetoothModuleOffScreen extends StatelessWidget {
  const BluetoothModuleOffScreen({Key? key, this.state}) : super(key: key);

  final BluetoothState? state;

  @override
  Widget build(BuildContext context) {
    Color errorTextColor = (Theme.of(context) == Brightness.dark)
        ? OwnDarkTheme.errorTextColor
        : OwnDarkTheme.errorTextColor;

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.bluetooth_disabled,
              size: 200.0,
              color: Colors.white54,
            ),
            Text(
              state != null
                  ? 'blueState-message'.i18n([state.toString().substring(15)])
                  : 'blueNotAvailable-message'.i18n(),
              style: Theme.of(context)
                  .primaryTextTheme
                  .subtitle1
                  ?.copyWith(color: errorTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
