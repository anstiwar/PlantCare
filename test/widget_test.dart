import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plant_care/main.dart';

void main() {
  testWidgets('App renders PlantCare on startup', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: PlantCareApp()));

    // Verify that our Splash screen is shown.
    expect(find.text('PlantCare'), findsOneWidget);

    // Advance the virtual clock by 2.5s to trigger the redirect and clear pending timers
    await tester.pumpAndSettle(const Duration(milliseconds: 2500));
  });
}
