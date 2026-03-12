import 'package:flutter_test/flutter_test.dart';

import 'package:aminapp/main.dart';

void main() {
  testWidgets('App starts on name entry screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Hai! Siapa nama awak?'), findsOneWidget);
    expect(find.text('Mula'), findsOneWidget);
  });
}
