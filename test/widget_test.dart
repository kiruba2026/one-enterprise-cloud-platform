import 'package:flutter_test/flutter_test.dart';

import 'package:login_page/main.dart';

void main() {
  testWidgets('OneCloud application loads successfully', (
    WidgetTester tester,
  ) async {
    // Build the OneCloud application.
    await tester.pumpWidget(const OneEnterpriseCloudPlatformApp());

    // Wait for the initial route and widgets to settle.
    await tester.pumpAndSettle();

    // Verify that the login page is displayed.
    expect(find.text('Welcome Back!'), findsOneWidget);
  });
}
