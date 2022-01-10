import 'dart:collection';

import 'package:flutter/material.dart';

import '../models/player.dart';

class PlayersModel extends ChangeNotifier {
  List<Player> _players = [];
  var round = 1;
  var completedCount = 0;

  UnmodifiableListView<Player> get players => UnmodifiableListView(_players);

  void resetPlayers() {
    _players = [];
    round = 1;
    completedCount = 0;

    notifyListeners();
  }

  void addPlayer(Player player) {
    _players.add(player);
    notifyListeners();
  }

  void addScore(int index, int score) {
    if (_players[index].isCurrentRoundEntered(round)) {
      _players[index].editScore(score);
    } else {
      _players[index].addScore(score);
      completedCount++;
      if (completedCount == _players.length) {
        completedCount = 0;
        round++;
      }
    }
    notifyListeners();
  }
}
