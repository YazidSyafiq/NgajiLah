import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ngajilah/page/splash_page.dart';

void main() {
  testWidgets(
    'Menampilkan logo aplikasi',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: SplashPage(),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
    },
  );
}
