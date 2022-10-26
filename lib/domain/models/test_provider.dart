import 'package:flutter/material.dart';

/*class Translations {
  const Translations(this._value);

  final int _value;

  String get title => 'You clicked $_value times';
}*/

class MyModelProviderTest with ChangeNotifier {
  MyModelProviderTest(this._foo);

  String _foo;
  String get foo => _foo;

  void set foo(String value) {
    _foo = value;
    notifyListeners();
  }
}
