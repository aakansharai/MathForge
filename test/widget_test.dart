import 'package:flutter_test/flutter_test.dart';
import 'package:math/app.dart';

void main() {
  testWidgets('App splash to home navigation test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Advance 5 seconds past splash
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();

    expect(find.text('MATHFORGE'), findsOneWidget);
    expect(find.text('THEME'), findsOneWidget);
    expect(find.text('SETTING'), findsOneWidget);
  });
}
