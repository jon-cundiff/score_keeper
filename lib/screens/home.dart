import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../providers/players_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var players = context.read<PlayersModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Five Crowns Score Keeper'),
      ),
      body: Container(
        width: 390,
        margin: const EdgeInsets.all(30),
        child: ElevatedButton(
            key: const Key("newGame"),
            child: const Text('New Game'),
            onPressed: () {
              players.resetPlayers();
              Navigator.pushNamed(context, '/new');
            }),
      ),
    );
  }
}
