// "На рисунку это желание-заказ клиента (например: три порции яблочного сока)"
class ParametersTurn {
  final String position;
  final String move;
  final String format;

  ParametersTurn({
    required this.position,
    required this.move,
    required this.format,
  });

  Map<String, dynamic> toApi() {
    return {
      'fen': position,
      'move': move,
      'format': format,
      'formatted': 0,
    };
  }
}
