# smart_chess_board

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



Создаем файлы:

    1. Contract.dart
    2. ObjApp.dart
    3.1 ObjService.dart
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
    
