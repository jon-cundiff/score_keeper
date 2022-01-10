import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../providers/players_model.dart';
import 'package:score_keeper/util/make_wild_text.dart';
import './sized_cell.dart';

class ScoreList extends StatelessWidget {
  const ScoreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var players = context.watch<PlayersModel>();
    List<TableRow> rows = [];
    var totals = List<int>.generate(
        players.players.length, (index) => players.players[index].getTotal());

    for (var index = 0; index < players.round - 1; index++) {
      var bgColor = index % 2 == 1
          ? const Color.fromARGB(255, 220, 220, 250)
          : Colors.white70;

      var wildsText = makeWildText(index + 1);
      rows.add(
        TableRow(children: [
          SizedCell('${index + 1} ($wildsText)',
              bgColor: bgColor, fw: FontWeight.bold),
          ...players.players.map(
            (player) {
              var cellText = index < player.scores.length
                  ? '${player.scores[index]}'
                  : '-';
              return SizedCell(
                cellText,
                bgColor: bgColor,
              );
            },
          ).toList()
        ]),
      );
    }

    rows.add(
      TableRow(children: [
        const SizedCell('Total', bgColor: Colors.cyan, fw: FontWeight.bold),
        ...totals
            .map(
              (total) => SizedCell(
                '$total',
                bgColor: Colors.cyan,
              ),
            )
            .toList()
      ]),
    );

    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Table(
          border: TableBorder.all(),
          defaultColumnWidth: const FixedColumnWidth(110),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(// Header
                children: [
              const SizedCell("Round", fw: FontWeight.bold),
              ...players.players
                  .map((player) => SizedCell(player.name, fw: FontWeight.bold))
                  .toList(),
            ]),
            ...rows
          ],
        )
      ],
    );
  }
}
