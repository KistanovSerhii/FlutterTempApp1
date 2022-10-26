# FlutterTempApp1
Example fluttr app with bluetooth, internet query, theme, language, provider

#ВАЖНО

В файлы (для Android):
android/app/src/debug/AndroidManifest.xml
android/app/src/main/AndroidManifest.xml
android/app/src/profile/AndroidManifest.xml

-Добавить разрешени:

<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.smart_chess_board">

    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />

	<uses-permission android:name="android.permission.BLUETOOTH" />  
	<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />  
	<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
  
  ...
  
В файл (для IOS)
-ios/Runner/info.plist

-Добавить разрешени:

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>

	<key>NSBluetoothAlwaysUsageDescription</key>  
	<string>Need BLE permission</string>  
	<key>NSBluetoothPeripheralUsageDescription</key>  
	<string>Need BLE permission</string>  
	<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>  
	<string>Need Location permission</string>  
	<key>NSLocationAlwaysUsageDescription</key>  
	<string>Need Location permission</string>  
	<key>NSLocationWhenInUseUsageDescription</key>  
	<string>Need Location permission</string>
  
  
# Clean Code

Создаем файлы:

1. Contract.dart
2. ObjApp.dart
_
3.1 ObjService.dart
3.2 ServiceParametrs.dart
3.3 Service.dart
3.4 TypeConverter.dart
3.5 ServiceApi.dart
!
3.6 Repository.dart
_
4.1 FactoryApi.dart
4.2 FactoryRepository.dart
(5. ObjState.dart)
6 FactoryState.dart
_
SomeView where initialize ObjState
