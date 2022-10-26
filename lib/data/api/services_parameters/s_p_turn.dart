class TurnParameters {
  final String position;
  final String move;
  final String format;

  TurnParameters({
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
