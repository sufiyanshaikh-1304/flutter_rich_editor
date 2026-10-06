import 'package:flutter_quill/flutter_quill.dart';

class RichEditorController {
  RichEditorController({
    QuillController? controller,
  }) : _controller = controller ?? QuillController.basic();

  final QuillController _controller;

  QuillController get quillController => _controller;

  String get plainText {
    return _controller.document.toPlainText().trimRight();
  }

  List<Map<String, dynamic>> get delta {
    return _controller.document.toDelta().toJson();
  }

  QuillController get controller => _controller;

  void dispose() {
    _controller.dispose();
  }
}