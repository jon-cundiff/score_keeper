import "package:flutter/material.dart";
import "package:provider/provider.dart";

import '../providers/players_model.dart';
import '../widgets/player_round_display.dart';
import '../widgets/round_display.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  void _addPlayerScore(BuildContext context, int index, int? score) {
    var players = context.read<PlayersModel>();
    if (score != null) {
      players.addScore(index, score);
      players = context.read<PlayersModel>();
      if (players.round > 11) {
        Navigator.pushReplacementNamed(context, '/final');
      }
    }
  }

  void _viewScores(BuildContext context) {
    Navigator.pushNamed(context, '/score');
  }

  @override
  Widget build(BuildContext context) {
    var players = context.watch<PlayersModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Current Game')),
      body: Column(
        children: [
          RoundDisplay(round: players.round),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(15),
              childAspectRatio: 1.4,
              crossAxisCount: 2,
              children: [
                ...players.players.asMap().entries.map((player) =>
                    PlayerRoundDisplay(
                        player: player.value,
                        round: players.round,
                        addPlayerScore: _addPlayerScore,
                        index: player.key,
                        context: context))
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _viewScores(context),
        child: const Icon(Icons.arrow_drop_up),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
