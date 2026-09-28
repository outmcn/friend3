import 'package:flutter_test/flutter_test.dart';
import 'package:friend3/main.dart';

void main() {
  testWidgets('Socialne demo UI renders', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    expect(find.text('Socialne'), findsOneWidget);
  });
}
