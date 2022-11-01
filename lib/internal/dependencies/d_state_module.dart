import 'package:smart_chess_board/internal/dependencies/d_repo_module.dart';

import 'package:smart_chess_board/domain/state/state_home_screen.dart';
import 'package:smart_chess_board/domain/state/state_blue_screen.dart';

// "На рисунке это администратор назначающий столикам официантов"
class DependencyModuleState {
  static StateHomeScreen homeState() {
    // "назначение официанта по имени "StateHomeScreen""
    return StateHomeScreen(
      turnContracr: DependencyModuleRepository.turn(),
      blueContracr: DependencyModuleRepository.libFlutterBlue(),
    );
  }

  static StateBlueScreen blueState() {
    // "назначение официанта по имени "StateHomeScreen""
    return StateBlueScreen(
      blueContracr: DependencyModuleRepository.libFlutterBlue(),
    );
  }
}
