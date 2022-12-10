// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_widget_test/main.dart';

void main() {
  group('ログインフォームテスト', () {
    testWidgets('正常系テスト', (WidgetTester tester) async {
      // setup
      await tester.pumpWidget(const MyApp());

      const email = 'tester@torico-tokyo.com';
      const password = 'password';
      final inputEmailFinder = find.byKey(const Key('email'));
      final inputPasswordFinder = find.byKey(const Key('password'));
      final submitButtonFinder = find.byKey(const Key('submit'));

      expect(inputEmailFinder, findsOneWidget);
      expect(inputPasswordFinder, findsOneWidget);
      expect(submitButtonFinder, findsOneWidget);

      await tester.enterText(inputEmailFinder, email);
      await tester.pump();

      await tester.enterText(inputPasswordFinder, password);
      await tester.pump();

      expect(find.text(email), findsOneWidget);
      expect(find.text(password), findsOneWidget);

      await tester.tap(submitButtonFinder);
      await tester.pump();
      expect(find.text('success'), findsOneWidget);
    });

    testWidgets('パスワード未入力', (WidgetTester tester) async {
      // setup
      await tester.pumpWidget(const MyApp());

      const email = 'tester@torico-tokyo.com';
      const password = '';
      final inputEmailFinder = find.byKey(const Key('email'));
      final inputPasswordFinder = find.byKey(const Key('password'));
      final submitButtonFinder = find.byKey(const Key('submit'));

      expect(inputEmailFinder, findsOneWidget);
      expect(inputPasswordFinder, findsOneWidget);
      expect(submitButtonFinder, findsOneWidget);

      await tester.enterText(inputEmailFinder, email);
      await tester.pump();

      await tester.enterText(inputPasswordFinder, password);
      await tester.pump();

      await tester.tap(submitButtonFinder);
      await tester.pump();
      expect(find.text('パスワードを入力してください'), findsOneWidget);
    });

    testWidgets('未入力', (WidgetTester tester) async {
      // setup
      await tester.pumpWidget(const MyApp());

      const email = '';
      const password = '';
      final inputEmailFinder = find.byKey(const Key('email'));
      final inputPasswordFinder = find.byKey(const Key('password'));
      final submitButtonFinder = find.byKey(const Key('submit'));

      expect(inputEmailFinder, findsOneWidget);
      expect(inputPasswordFinder, findsOneWidget);
      expect(submitButtonFinder, findsOneWidget);

      await tester.enterText(inputEmailFinder, email);
      await tester.pump();

      await tester.enterText(inputPasswordFinder, password);
      await tester.pump();

      await tester.tap(submitButtonFinder);
      await tester.pump();
      expect(
        find.text('メールアドレスを入力してください\nパスワードを入力してください'),
        findsOneWidget,
      );
    });
  });
}
