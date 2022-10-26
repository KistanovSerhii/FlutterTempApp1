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

    ...
    в Application/home добавить: MultiProvider(
    providers: [ChangeNotifierProvider<HomeScreenState>(create: (_) => HomeModuleDependency.homeState()),]
    ,child: HomeScreen())
    
    ObjState добавить наследование extends ChangeNotifier и после КАЖДОГО изменения состояния вызвать notifyListeners();
    
    В view-screen классе объявить переменную стейт (HomeScreenState? _homeScreenState;),
    Инициализировать в BUILD _homeScreenState = Provider.of<HomeScreenState?>(context);
    Тогда обращение к значению так _homeScreenState!.someValue
    А методы вызывать только через остановку прослушивания Provider.of<HomeScreenState?>(context, listen: false)!.getSomeValue()
    
