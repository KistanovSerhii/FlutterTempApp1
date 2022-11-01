# Простой пример использования http, bluetooth, provider, stateManager (by provider), clean code.

#ВАЖНО

В файлы (для Android):

    android/app/src/debug/AndroidManifest.xml
    android/app/src/main/AndroidManifest.xml
    android/app/src/profile/AndroidManifest.xml

Добавить разрешени:

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

Добавить разрешени:

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

    1.  ModelApp.dart
    2.  Contract.dart
    3.1 ModelService.dart
    3.2 ServiceParametrs.dart
    3.3 Service.dart
    3.4 TypeConverter.dart
    3.5 ServiceApi.dart
    3.6 Repository.dart
    4.1 FactoryApi.dart
    4.2 FactoryRepository.dart
    (5. ObjState.dart)
    6 FactoryState.dart
    
    7. в Application/home добавить: MultiProvider(
    providers: [ChangeNotifierProvider<HomeScreenState>(create: (_) => HomeModuleDependency.homeState()),]
    ,child: HomeScreen())
    
    8. ObjState добавить наследование extends ChangeNotifier и после КАЖДОГО изменения состояния вызвать notifyListeners();
    
    9. В view-screen классе объявить переменную стейт (HomeScreenState? _homeScreenState;),
    Инициализировать в BUILD _homeScreenState = Provider.of<HomeScreenState?>(context);
    Тогда обращение к значению так _homeScreenState!.someValue
    А методы вызывать только через остановку прослушивания Provider.of<HomeScreenState?>(context, listen: false)!.getSomeValue()
    

# For permission

	В файл "android/app/build.gradle" необходимо установить версию 33:
	android {
    		compileSdkVersion 33 // по умолчанию там скорей всего установлено - compileSdkVersion flutter.compileSdkVersion (меняем на 33)
		
# Provider
	
	Инициализируем provider сразу в методе build корневого виджета, а в child провайдера инициализируем все остальное (тема, язык и т.д.)
