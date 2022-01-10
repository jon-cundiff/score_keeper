import "package:flutter/material.dart";

import '../models/player.dart';
import './get_score.dart';

class PlayerRoundDisplay extends StatelessWidget {
  final Player player;
  final Function addPlayerScore;
  final int index;
  final int round;
  final BuildContext context;

  const PlayerRoundDisplay(
      {Key? key,
      required this.player,
      required this.addPlayerScore,
      required this.index,
      required this.round,
      required this.context})
      : super(key: key);

  void _getPlayerScore(BuildContext context) async {
    int? score;
    TextEditingController controller = TextEditingController();

    score = await showDialog(
        context: context,
        builder: (context) {
          return GetScore(controller: controller, round: round, player: player);
        });

    addPlayerScore(context, index, score);
  }

  String makeButtonText() {
    return player.isCurrentRoundEntered(round) ? 'Edit Score' : 'Add Score';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(3)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            player.isCurrentRoundEntered(round)
                ? '${player.name} (${player.scores[player.scores.length - 1]})'
                : player.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          OutlinedButton(
              onPressed: () => _getPlayerScore(context),
              child: Text(
                makeButtonText(),
              ))
        ],
      ),
    );
  }
}
