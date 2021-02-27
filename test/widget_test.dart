import 'package:flutter_test/flutter_test.dart';
import 'package:foody/main.dart';

void main() {
  testWidgets('finds a Text widget', (WidgetTester tester) async {
    await tester.pumpWidget(FoodyApp());
    expect(find.text('TODO: Make a cool foody app'), findsOneWidget);
  });
}
