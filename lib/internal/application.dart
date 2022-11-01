import 'package:flutter/material.dart';

import 'package:localization/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:smart_chess_board/common/theme.dart';

import 'package:smart_chess_board/presentation/home_screen.dart';

import 'package:provider/provider.dart';

import 'package:smart_chess_board/internal/dependencies/d_state_module.dart';

import 'package:smart_chess_board/domain/state/state_home_screen.dart';
import 'package:smart_chess_board/domain/state/state_blue_screen.dart';

import 'package:permission_handler/permission_handler.dart';

// "Так как в данном обк инициализируем state - на рисунке это столик клиента"

class Application extends StatefulWidget {
  const Application({Key? key, required AdaptiveThemeMode? this.savedThemeMode})
      : super(key: key);
  // This widget is the root of your application.
  final AdaptiveThemeMode? savedThemeMode;

  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends State<Application> {
  Locale? _locale;
  AdaptiveThemeMode? savedThemeMode;
  late Future<bool> permissions;

  @override
  void initState() {
    super.initState();
    savedThemeMode = widget.savedThemeMode;
    permissions = requestPermissions();
  }

  changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];
    return
//*********************MultiProvider********************* +
        MultiProvider(
            providers: [
          ChangeNotifierProvider<StateHomeScreen>(
              create: (_) => DependencyModuleState.homeState()),
          ChangeNotifierProvider<StateBlueScreen>(
              create: (_) => DependencyModuleState.blueState()),
          // Provider<Something>(create: (_) => Something()),
          // Provider<SomethingElse>(create: (_) => SomethingElse()),
          // Provider<AnotherThing>(create: (_) => AnotherThing()),
        ],
            child:
//*********************MultiProvider********************* -
//*********************Theme********************* +
                AdaptiveTheme(
                    light: kLightTheme,
                    dark: kDarkTheme,
                    initial: savedThemeMode ?? AdaptiveThemeMode.light,
                    builder: (theme, darkTheme) =>
//*********************Theme********************* -
                        MaterialApp(
//*********************language********************* +
                            locale: _locale,
                            localeResolutionCallback:
                                (locale, supportedLocales) {
                              if (supportedLocales.contains(locale)) {
                                return locale;
                              }

                              if (locale?.languageCode == 'en') {
                                return const Locale('en', 'US');
                              }
                              return const Locale('ru', 'RU');
                            },
                            localizationsDelegates: [
                              // delegate from flutter_localization
                              GlobalMaterialLocalizations.delegate,
                              GlobalWidgetsLocalizations.delegate,
                              GlobalCupertinoLocalizations.delegate,
                              // delegate from localization package.
                              LocalJsonLocalization.delegate,
                            ],
                            supportedLocales: const [
                              Locale('en', 'US'),
                              Locale('ru', 'RU'),
                            ],
//*********************language********************* -
                            color: Theme.of(context).scaffoldBackgroundColor,
                            theme: theme,
                            darkTheme: darkTheme,
                            debugShowCheckedModeBanner: false,
                            home: const HomeScreen())));
  }
}

//*********************request permissions********************* +
Future<bool> requestPermissions() async {
  List<Permission> permissions = [
    Permission.location,
    Permission.bluetooth,
    Permission.bluetoothConnect,
    Permission.bluetoothAdvertise,
    Permission.bluetoothScan,
  ];
  bool isAllAllowed = true;
  Map<Permission, PermissionStatus> statuses = await permissions.request();

  for (int i = 0; i < permissions.length; i++) {
    if (statuses[permissions[i]] != PermissionStatus.granted) {
      isAllAllowed = false;
      return isAllAllowed;
    }
  }

  return isAllAllowed;
//*********************request permissions********************* -
}
