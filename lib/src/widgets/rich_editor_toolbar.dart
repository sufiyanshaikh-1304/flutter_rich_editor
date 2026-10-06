import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../models/rich_editor_config.dart';

class RichEditorToolbar extends StatelessWidget {
  const RichEditorToolbar({
    super.key,
    required this.controller,
    required this.config,
  });

  final QuillController controller;
  final RichEditorConfig config;

  @override
  Widget build(BuildContext context) {
    if (!config.showToolbar || config.readOnly) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        color: config.toolbarBackgroundColor,
        border: Border(
          bottom: BorderSide(
            color: config.borderColor,
          ),
        ),
      ),
      child: QuillSimpleToolbar(
        controller: controller,
        config: QuillSimpleToolbarConfig(
          multiRowsDisplay: true,
          showDividers: true,
          showFontFamily: config.showFontFamily,
          showFontSize: config.showFontSize,
          showBoldButton: config.showBold,
          showItalicButton: config.showItalic,
          showUnderLineButton: config.showUnderline,
          showStrikeThrough: config.showStrikeThrough,
          showColorButton: config.showTextColor,
          showBackgroundColorButton: config.showHighlightColor,
          showClearFormat: config.showClearFormat,
          showAlignmentButtons: config.showAlignment,
          showLeftAlignment: config.showAlignment,
          showCenterAlignment: config.showAlignment,
          showRightAlignment: config.showAlignment,
          showJustifyAlignment: config.showAlignment,
          showHeaderStyle: true,
          showListNumbers: config.showLists,
          showListBullets: config.showLists,
          showListCheck: config.showLists,
          showIndent: config.showLists,
          showLink: config.showLink,
          showUndo: config.showUndoRedo,
          showRedo: config.showUndoRedo,
          showSearchButton: false,
          showQuote: true,
          showCodeBlock: false,
          showInlineCode: false,
          showSubscript: false,
          showSuperscript: false,
          decoration: const BoxDecoration(),
        ),
      ),
    );
  }
}