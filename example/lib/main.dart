import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_rich_editor/flutter_rich_editor.dart';

void main() {
  runApp(const RichEditorExampleApp());
}

class RichEditorExampleApp extends StatelessWidget {
  const RichEditorExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Rich Editor',
      localizationsDelegates: const [
        FlutterQuillLocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
      ),
      home: const RichEditorDemoPage(),
    );
  }
}

class RichEditorDemoPage extends StatefulWidget {
  const RichEditorDemoPage({super.key});

  @override
  State<RichEditorDemoPage> createState() => _RichEditorDemoPageState();
}

class _RichEditorDemoPageState extends State<RichEditorDemoPage> {
  late final RichEditorController _editorController;

  String _plainText = '';

  @override
  void initState() {
    super.initState();
    _editorController = RichEditorController();
  }

  void _showContent() {
    setState(() {
      _plainText = _editorController.plainText;
    });

    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Editor Content',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    maxHeight: 300,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F7FB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      _plainText.isEmpty
                          ? 'No content entered yet.'
                          : _plainText,
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        titleSpacing: 16,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rich Editor',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Flutter Rich Text Editor',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderCard(),

              const SizedBox(height: 24),

              const Text(
                'Editor',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 10),

              RichEditor(
                controller: _editorController,
                config: const RichEditorConfig(
                  hintText: 'Start writing your content here...',
                  minHeight: 300,
                  borderRadius: 16,
                  fontSize: 16,
                ),
                onChanged: (controller) {
                  _plainText = controller.plainText;
                },
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton.icon(
                  onPressed: _showContent,
                  icon: const Icon(
                    Icons.visibility_rounded,
                  ),
                  label: const Text(
                    'Preview Content',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                'Features',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 12),

              const Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _FeatureChip(
                    icon: Icons.format_bold,
                    label: 'Bold',
                  ),
                  _FeatureChip(
                    icon: Icons.format_italic,
                    label: 'Italic',
                  ),
                  _FeatureChip(
                    icon: Icons.format_underlined,
                    label: 'Underline',
                  ),
                  _FeatureChip(
                    icon: Icons.format_list_bulleted,
                    label: 'Lists',
                  ),
                  _FeatureChip(
                    icon: Icons.format_align_center,
                    label: 'Alignment',
                  ),
                  _FeatureChip(
                    icon: Icons.palette_outlined,
                    label: 'Colors',
                  ),
                  _FeatureChip(
                    icon: Icons.link,
                    label: 'Links',
                  ),
                  _FeatureChip(
                    icon: Icons.undo,
                    label: 'Undo / Redo',
                  ),
                ],
              ),

              const SizedBox(height: 24),

              _buildInfoCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2563EB),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A2563EB),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.edit_note_rounded,
            color: Colors.white,
            size: 36,
          ),
          SizedBox(height: 12),
          Text(
            'Write something amazing',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Format your content using the rich text toolbar.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE1E4E8),
        ),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline_rounded,
            color: Color(0xFF2563EB),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Use the toolbar to format text with bold, italic, '
                  'underline, lists, alignment, colors, links and more.',
              style: TextStyle(
                fontSize: 13,
                height: 1.5,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _editorController.dispose();
    super.dispose();
  }
}

class _FeatureChip extends StatelessWidget {
  const _FeatureChip({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE1E4E8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 17,
            color: const Color(0xFF2563EB),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}