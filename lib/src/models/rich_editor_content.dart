import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';

class RichEditorContent {
  const RichEditorContent({
    required this.delta,
    required this.plainText,
  });

  final List<Map<String, dynamic>> delta;
  final String plainText;

  String get json => jsonEncode(delta);

  factory RichEditorContent.fromController(QuillController controller) {
    final document = controller.document;

    return RichEditorContent(
      delta: document.toDelta().toJson(),
      plainText: document.toPlainText().trimRight(),
    );
  }

  factory RichEditorContent.empty() {
    return const RichEditorContent(
      delta: [
        {'insert': '\n'}
      ],
      plainText: '',
    );
  }
}