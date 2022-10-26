import 'package:flutter/material.dart';
import 'package:smart_chess_board/domain/models/m_turn.dart';
import 'package:smart_chess_board/domain/state/devicemodules/bluetooth.dart';

// Интерфейс-Контракт
abstract class ChessBoardContracr {
  // Методы который обязаны быть реализованы!
  Future<TurnModel> getChessBoard({@required BlueDevice device});
}
