import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../models/rich_editor_config.dart';
import 'rich_editor_controller.dart';
import 'rich_editor_toolbar.dart';

class RichEditor extends StatefulWidget {
  const RichEditor({
    super.key,
    this.controller,
    this.config = const RichEditorConfig(),
    this.onChanged,
  });

  final RichEditorController? controller;
  final RichEditorConfig config;
  final ValueChanged<RichEditorController>? onChanged;

  @override
  State<RichEditor> createState() => _RichEditorState();
}

class _RichEditorState extends State<RichEditor> {
  late final RichEditorController _internalController;
  late RichEditorController _controller;

  late final FocusNode _focusNode;
  late final ScrollController _scrollController;

  RichEditorController get controller => widget.controller ?? _controller;

  @override
  void initState() {
    super.initState();

    _internalController = RichEditorController();
    _controller = widget.controller ?? _internalController;

    _focusNode = FocusNode();
    _scrollController = ScrollController();

    _controller.controller.addListener(_handleChanged);
  }

  @override
  void didUpdateWidget(covariant RichEditor oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      _controller.controller.removeListener(_handleChanged);

      if (widget.controller != null) {
        _controller = widget.controller!;
      } else {
        _controller = _internalController;
      }

      _controller.controller.addListener(_handleChanged);
    }
  }

  void _handleChanged() {
    widget.onChanged?.call(controller);
  }

  @override
  Widget build(BuildContext context) {
    final config = widget.config;

    return Container(
      decoration: BoxDecoration(
        color: config.backgroundColor,
        borderRadius: BorderRadius.circular(config.borderRadius),
        border: Border.all(
          color: _focusNode.hasFocus
              ? config.focusedBorderColor
              : config.borderColor,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (config.showToolbar && !config.readOnly)
            RichEditorToolbar(
              controller: controller.controller,
              config: config,
            ),
          SizedBox(
            height: config.minHeight,
            child: Padding(
              padding: config.padding,
              child: QuillEditor.basic(
                controller: controller.controller,
                focusNode: _focusNode,
                scrollController: _scrollController,
                config: QuillEditorConfig(
                  placeholder: config.hintText,
                  padding: EdgeInsets.zero,
                  expands: false,
                  autoFocus: config.autofocus,
                  scrollable: true,
                  customStyles: DefaultStyles(
                    paragraph: DefaultTextBlockStyle(
                      TextStyle(
                        fontSize: config.fontSize,
                        color: config.textColor,
                        height: 1.5,
                      ),
                      const HorizontalSpacing(0, 0),
                      const VerticalSpacing(0, 0),
                      const VerticalSpacing(0, 0),
                      null,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.controller.removeListener(_handleChanged);

    if (widget.controller == null) {
      _internalController.dispose();
    }

    _focusNode.dispose();
    _scrollController.dispose();

    super.dispose();
  }
}