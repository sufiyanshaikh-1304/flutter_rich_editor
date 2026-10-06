import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_rich_editor/flutter_rich_editor.dart';

void main() {
  test('RichEditorController works correctly', () {
    final controller = RichEditorController();

    expect(controller.plainText, isEmpty);
    expect(controller.delta, isNotEmpty);

    controller.dispose();
  });
}