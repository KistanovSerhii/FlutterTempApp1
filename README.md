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

	1. Contract.dart (Интерфейс-Контракт, имплеминтация методов без реализации)
	2. ObjApp.dart (Типизированный объект который будет наполнятся данными из сервиса)
	3.1 ObjService.dart (Объект копия ObjApp, но тип его свойств равен типам полученных данных из сервиса)
	3.2 ServiceParametrs.dart (Если сервис требует параметры (например get запрос http) тогда этот объект формирует это параметры)
	3.3 Service.dart (Описывает как подключиться к источнику и какие данные получить, по аналогии 1С - это объект "Запрос")
	3.4 TypeConverter.dart (Этот объект содержит статический метод который получив ObjService вернет ObjApp (типизированный обк))
	3.5 ServiceApi.dart (Выполняет метод сервиса, объединяет в себе Запрос, ПараметрыЗапроса, Типизация ObjService в ObjApp)
	3.6 ServiceRepository.dart (Реализует контракт-интерфейс созданный на шаге 1)
	4.1 FactoryApi.dart (Вернет существующий ServiceApi или создаст новый при первой инициализации)
	4.2 FactoryRepository.dart (Вернет существующий ServiceRepository или создаст новый при первой инициализации)
	(5. ObjState.dart) (Инициализирует все необходимые сервисы (ServiceRepository) и переменные - это состояние какого либо view-screen)
	6. FactoryState.dart (Вернет существующий ObjState или создаст новый при первой инициализации)
	7. Используем ObjState в каком либо view-screen экране.
