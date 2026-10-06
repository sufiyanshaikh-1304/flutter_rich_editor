import 'package:flutter/material.dart';

@immutable
class RichEditorConfig {
  const RichEditorConfig({
    this.hintText = 'Start writing...',
    this.minHeight = 260,
    this.backgroundColor = Colors.white,
    this.toolbarBackgroundColor = const Color(0xFFF7F8FA),
    this.borderColor = const Color(0xFFE1E4E8),
    this.focusedBorderColor = const Color(0xFF2563EB),
    this.textColor = const Color(0xFF1F2937),
    this.fontSize = 16,
    this.borderRadius = 14,
    this.padding = const EdgeInsets.all(16),
    this.readOnly = false,
    this.autofocus = false,
    this.showToolbar = true,
    this.showFontFamily = true,
    this.showFontSize = true,
    this.showBold = true,
    this.showItalic = true,
    this.showUnderline = true,
    this.showStrikeThrough = true,
    this.showTextColor = true,
    this.showHighlightColor = true,
    this.showAlignment = true,
    this.showLists = true,
    this.showLink = true,
    this.showUndoRedo = true,
    this.showClearFormat = true,
  }) : assert(minHeight >= 0),
        assert(fontSize > 0),
        assert(borderRadius >= 0);

  final String hintText;
  final double minHeight;

  final Color backgroundColor;
  final Color toolbarBackgroundColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color textColor;

  final double fontSize;
  final double borderRadius;
  final EdgeInsetsGeometry padding;

  final bool readOnly;
  final bool autofocus;

  final bool showToolbar;

  final bool showFontFamily;
  final bool showFontSize;
  final bool showBold;
  final bool showItalic;
  final bool showUnderline;
  final bool showStrikeThrough;
  final bool showTextColor;
  final bool showHighlightColor;
  final bool showAlignment;
  final bool showLists;
  final bool showLink;
  final bool showUndoRedo;
  final bool showClearFormat;
}