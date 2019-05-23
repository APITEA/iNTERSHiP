// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:spikey/main.dart';
import 'package:spikey/model/application.dart';

void main() {

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
  }

  testWidgets('Testing DetailView', (WidgetTester tester) async {

    var app = Application(name: 'name', url: 'www.google.com', pic: '');
    await tester.pumpWidget(buildTestableWidget(DetailView(app: app)));

    var nameFinder = find.text('name');
    var urlFinder = find.text('www.google.com');

    expect(nameFinder, findsOneWidget);
    expect(urlFinder, findsNothing);
  });
}
