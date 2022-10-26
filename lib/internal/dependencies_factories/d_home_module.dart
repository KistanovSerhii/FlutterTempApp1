import 'package:smart_chess_board/domain/state/state_home_screen.dart';
import 'package:smart_chess_board/internal/dependencies_factories/d_repo_module.dart';

class HomeModuleDependency {
  // Экран Home
  static HomeScreenState homeState() {
    // Данные которые будут отображатся на экране Home
    return HomeScreenState(
      turnContracr: RepositoryModuleDependency.turnContracr(),
    );
  }
}
