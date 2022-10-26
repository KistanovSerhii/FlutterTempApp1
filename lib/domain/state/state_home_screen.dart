import 'package:flutter/material.dart';
import 'package:smart_chess_board/domain/models/m_turn.dart';
import 'package:smart_chess_board/domain/contracts/c_turn.dart';

class HomeScreenState with ChangeNotifier {
  HomeScreenState({required this.turnContracr});

  final TurnContracr turnContracr;

  TurnModel? turn;
  bool isLoading = false;

  Future<void> getTurnFromAI({
    required String position,
    required String move,
    required String format,
  }) async {
    isLoading = true;
    final data = await turnContracr.getTurnFromAI(
        position: position, move: move, format: format);
    turn = data;
    isLoading = false;
    notifyListeners();
  }

  Future<void> getTurnBoard({
    required String position,
    required String move,
    required String format,
  }) async {
    isLoading = true;
    final data = await turnContracr.getTurnFromAI(
        position: position, move: move, format: format);
    turn = data;
    isLoading = false;
    notifyListeners();
  }
}
