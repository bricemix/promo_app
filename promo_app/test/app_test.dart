import 'package:flutter_test/flutter_test.dart';
import 'package:promo_app/main.dart';
import 'package:promo_app/screens/loading_screen.dart';

void main() {
  testWidgets('Shows login screen after loading', (tester) async {
    await tester.pumpWidget(const MyApp());
    // first frame is loading
    expect(find.byType(LoadingScreen), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Login'), findsOneWidget);
  });
}
