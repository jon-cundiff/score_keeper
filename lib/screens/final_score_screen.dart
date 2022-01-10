import 'package:flutter/material.dart';

import '../widgets/score_list.dart';

class FinalScoreScreen extends StatelessWidget {
  const FinalScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Final Scores"),
        ),
        body: Container(
            padding: const EdgeInsets.all(20), child: const ScoreList()));
  }
}
