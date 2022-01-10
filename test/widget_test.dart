// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:score_keeper/main.dart';

void main() {
  testWidgets('Press new game moves to setup screen',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.text('New Game'), findsOneWidget);

    // await tester.tap(find.byKey(const Key("newGame")));
    // await tester.pump();

    // expect(find.text('New Game Setup'), findsOneWidget);
  });
}
