import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../models/player.dart';
import '../widgets/player_name_item.dart';
import '../providers/players_model.dart';

class PlayersBuilder extends StatefulWidget {
  const PlayersBuilder({Key? key}) : super(key: key);

  @override
  _PlayersBuilderState createState() => _PlayersBuilderState();
}

class _PlayersBuilderState extends State<PlayersBuilder> {
  late TextEditingController _controller;

  void _addPlayer(BuildContext context) {
    var name = _controller.text;
    var players = context.read<PlayersModel>();
    if (name.isNotEmpty && players.players.length < 8) {
      _controller.text = '';
      var newPlayer = Player(name: name);
      players.addPlayer(newPlayer);
    }
  }

  void _startGame(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/game');
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var players = context.watch<PlayersModel>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Game Setup'),
        ),
        body: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: const Text('Start Game'),
                onPressed: players.players.length < 2
                    ? null
                    : () => _startGame(context),
              ),
              TextField(
                controller: _controller,
              ),
              ElevatedButton(
                child: const Text('Add Player'),
                onPressed: () => _addPlayer(context),
              ),
              Visibility(
                child: const Text(
                  'No players added yet',
                  style: TextStyle(color: Colors.red),
                ),
                visible: players.players.isEmpty,
              ),
              ...players.players
                  .asMap()
                  .entries
                  .map((entry) => PlayerNameItem(
                      name: entry.value.name, numString: '${entry.key + 1}'))
                  .toList(),
            ],
          ),
        ));
  }
}
