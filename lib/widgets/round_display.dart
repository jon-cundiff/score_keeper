import "package:flutter/material.dart";

import "../util/make_wild_text.dart";

class RoundDisplay extends StatelessWidget {
  final int round;

  const RoundDisplay({Key? key, required this.round}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Text(
            'Current Round: $round',
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 20),
            child: Text(
              'Cards: ${round + 2}',
              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
            ),
          ),
          Text(
            'Wilds: ${makeWildText(round)}',
            style: const TextStyle(color: Colors.blueAccent, fontSize: 20),
          )
        ],
      ),
    );
  }
}
