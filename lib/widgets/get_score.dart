import 'package:flutter/material.dart';

import '../models/player.dart';

class GetScore extends StatelessWidget {
  final TextEditingController controller;
  final int round;
  final Player player;

  const GetScore(
      {Key? key,
      required this.controller,
      required this.round,
      required this.player})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SimpleDialog(
            contentPadding: const EdgeInsets.all(20),
            title: Text('Enter Round $round score for ${player.name}'),
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(labelText: 'Enter score:'),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, int.tryParse(controller.text));
                  },
                  child: const Text("Submit Score"))
            ],
          ),
        ),
      ],
    );
  }
}
