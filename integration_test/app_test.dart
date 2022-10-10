import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_hello_world/main.dart' as app;

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets('Navigation Test', (widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle();
      final emailField = find.byKey(const Key('email'));
      final passwordField = find.byKey(const Key('password'));
      final confirmPasswordField = find.byKey(const Key('confirmPassword'));
      final button = find.byKey(const Key('button'));
      final gender = find.byKey(const Key('gender'));


      await widgetTester.enterText(emailField, 's@g.com');
      await widgetTester.enterText(passwordField, '1234567a');
      await widgetTester.enterText(confirmPasswordField, '1234567');
      await widgetTester.tap(button);
      await Future.delayed(const Duration(seconds: 5));

      await widgetTester.enterText(confirmPasswordField, '1234567a');
      await widgetTester.tap(gender);
      await widgetTester.pumpAndSettle();
      final dropdownItem = find.text('Female').last;
      await widgetTester.tap(dropdownItem);
      await widgetTester.pumpAndSettle();
      await widgetTester.pumpAndSettle();
      await widgetTester.pumpAndSettle();
      await widgetTester.tap(button);
      await Future.delayed(const Duration(seconds: 5));
      await widgetTester.pumpAndSettle();
    });
  });
}
