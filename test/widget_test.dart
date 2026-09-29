import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:friend3/main.dart';

void main() {
  testWidgets('Friend3 onboarding UI renders', (tester) async {
    await tester.pumpWidget(const Friend3App());
    expect(find.text('Friend3'), findsOneWidget);
    expect(find.text('开始使用'), findsOneWidget);
  });

  testWidgets('Friend3 auth flow opens home shell', (tester) async {
    await tester.pumpWidget(const Friend3App());
    await tester.tap(find.text('开始使用'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, '登录'));
    await tester.pumpAndSettle();
    expect(find.text('首页'), findsWidgets);
    expect(find.text('发现'), findsOneWidget);
    expect(find.text('我的'), findsOneWidget);
  });
}
