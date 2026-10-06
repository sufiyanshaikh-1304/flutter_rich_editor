import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_rich_editor/flutter_rich_editor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Rich editor renders correctly',
        (WidgetTester tester) async {
      final controller = RichEditorController();

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: const [
            FlutterQuillLocalizations.delegate,
          ],
          home: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: RichEditor(
                controller: controller,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(RichEditor), findsOneWidget);

      controller.dispose();
    },
  );
}