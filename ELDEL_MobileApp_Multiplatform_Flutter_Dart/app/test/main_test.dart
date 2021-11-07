// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter_test/flutter_test.dart';

import 'package:app/main.dart';
import 'package:app/shared/constants/label.dart';


void main() {
  group('The main Eldel App', () {
    testWidgets('displays bottom nav bar with text labels', (WidgetTester tester) async {
      // Arrange
      const eldelMainApp = EldelApp();
      await tester.pumpWidget(eldelMainApp);

      // Act
      final favouritesTextWidget = find.text(favouritesLabel);
      final chargePointsTextWidget = find.text(chargePointsLabel);
      final messagesTextWidget = find.text(messagesLabel);
      final myAccountTextWidget = find.text(myAccountLabel);
      
      // Assert
      expect(favouritesTextWidget, findsOneWidget);
      expect(chargePointsTextWidget, findsNWidgets(2)); // By default, charge points tab is displayed - the AppBar displays the same label.
      expect(messagesTextWidget, findsOneWidget);
      expect(myAccountTextWidget, findsOneWidget);
    });
  });
}
