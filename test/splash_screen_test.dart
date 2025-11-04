import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:hp_api_fetch/screens/splash_screen.dart';
import 'package:hp_api_fetch/utils/constants.dart';

void main() {
  // Helper function to create widget under test
  Widget createWidgetUnderTest() {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }

  group('SplashScreen Widget', () {
    testWidgets('contains FadeTransition and SlideTransition for Text', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Verify FadeTransition
      expect(find.byType(FadeTransition), findsOneWidget);
      expect(find.descendant(of: find.byType(FadeTransition), matching: find.text(Constants.appName)), findsOneWidget);

      // Verify SlideTransition
      expect(find.byType(SlideTransition), findsOneWidget);
      expect(find.descendant(of: find.byType(SlideTransition), matching: find.text(Constants.appName)), findsOneWidget);
    });
  });
}
