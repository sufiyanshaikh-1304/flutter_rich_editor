import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';

import '../models/rich_editor_content.dart';

class RichEditorUtils {
  const RichEditorUtils._();

  static RichEditorContent getContent(QuillController controller) {
    return RichEditorContent.fromController(controller);
  }

  static String getPlainText(QuillController controller) {
    return controller.document.toPlainText().trimRight();
  }

  static String getJson(QuillController controller) {
    return jsonEncode(controller.document.toDelta().toJson());
  }

  static List<Map<String, dynamic>> getDelta(QuillController controller) {
    return controller.document.toDelta().toJson();
  }

  static bool isEmpty(QuillController controller) {
    return getPlainText(controller).isEmpty;
  }
}