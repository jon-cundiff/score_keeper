import 'package:flutter/material.dart';

class PlayerNameItem extends StatelessWidget {
  final String name;
  final String numString;

  const PlayerNameItem({Key? key, required this.name, required this.numString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 40),
      child: Text('$numString - $name',
          style: const TextStyle(fontSize: 20, height: 3)),
    );
  }
}
