import 'package:flutter/material.dart';

import 'package:localization/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:smart_chess_board/theme.dart';

import 'package:smart_chess_board/presentation/home_screen.dart';

import 'package:provider/provider.dart';
import 'package:smart_chess_board/domain/models/test_provider.dart';
import 'package:smart_chess_board/domain/state/state_home_screen.dart';

class Application extends StatefulWidget {
  Application({Key? key, required AdaptiveThemeMode? this.savedThemeMode})
      : super(key: key);
  // This widget is the root of your application.
  final AdaptiveThemeMode? savedThemeMode;

  @override
  ApplicationState createState() => ApplicationState(this.savedThemeMode);
}

class ApplicationState extends State<Application> {
  ApplicationState(this.savedThemeMode);

  Locale? _locale;
  final AdaptiveThemeMode? savedThemeMode;

  changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];
//*********************Theme********************* +
    return AdaptiveTheme(
        light: kLightTheme,
        dark: kDarkTheme,
        initial: savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (theme, darkTheme) =>
//*********************Theme********************* -
            MaterialApp(
//*********************language********************* +
                locale: _locale,
                localeResolutionCallback: (locale, supportedLocales) {
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
                home:
                    // HomeScreen()
                    MultiProvider(
                  providers: [
                    ChangeNotifierProvider<MyModelProviderTest>(
                        create: (_) => MyModelProviderTest("Hello!")),
                    // Provider<Something>(create: (_) => Something()),
                    // Provider<SomethingElse>(create: (_) => SomethingElse()),
                    // Provider<AnotherThing>(create: (_) => AnotherThing()),
                  ],
                  child: HomeScreen(),
                )));
  }
}
