import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/players_model.dart';
import './screens/home.dart';
import './screens/players_builder.dart';
import './screens/game_screen.dart';
import './screens/current_score_screen.dart';
import './screens/final_score_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => PlayersModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Score Keeper',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
        routes: {
          '/new': (context) => PlayersBuilder(key: UniqueKey()),
          '/game': (context) => const GameScreen(),
          '/score': (context) => const CurrentScoreScreen(),
          '/final': (context) => const FinalScoreScreen()
        });
  }
}
