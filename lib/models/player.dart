class Player {
  final String name;
  List<int> scores = [];

  Player({required this.name});

  void addScore(int score) {
    scores.add(score);
  }

  void editScore(int score) {
    scores[scores.length - 1] = score;
  }

  int getTotal() {
    var total = 0;
    for (var score in scores) {
      total += score;
    }
    return total;
  }

  bool isCurrentRoundEntered(int roundNumber) {
    return roundNumber == scores.length;
  }
}
