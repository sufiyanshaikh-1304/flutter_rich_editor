# Flutter Rich Editor

A powerful, customizable, and easy-to-use **Rich Text Editor** for Flutter applications, built on top of `flutter_quill`.

Create beautifully formatted content with support for **bold, italic, underline, colors, alignment, lists, links, undo/redo, text formatting, and more** — all inside a clean and customizable editor widget.

## Demo
<p align="center">
  <img src="example/assets/rich_editor.gif" width="200" alt="Flutter Rich Editor Demo">
</p>

## ✨ Features

* 📝 Rich text editing
* 🎨 Text and highlight colors
* **Bold**, *Italic*, and Underline formatting
* ~~Strikethrough~~ support
* 🔤 Font family and font size selection
* 📐 Text alignment
* 🔢 Numbered lists
* • Bulleted lists
* ☑️ Checklist support
* 🔗 Link insertion
* ↩️ Undo and redo
* 🧹 Clear formatting
* 📋 Delta data access
* 📄 Plain text extraction
* 🧩 Customizable editor configuration
* 🎯 Read-only mode
* ⚡ Autofocus support
* 🎨 Custom colors, borders, radius, padding, and typography
* 📱 Responsive Flutter UI
* 🧪 Widget-test friendly
* 🏗️ Clean package architecture

## 📦 Installation

Add `flutter_rich_editor` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_rich_editor: ^1.0.0
```

Then run:

```bash
flutter pub get
```

Or install it using:

```bash
flutter pub add flutter_rich_editor
```

## 🚀 Getting Started

Import the package:

```dart
import 'package:flutter_rich_editor/flutter_rich_editor.dart';
```

Create a `RichEditorController`:

```dart
final editorController = RichEditorController();
```

Add the editor:

```dart
RichEditor(
  controller: editorController,
)
```

### Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_rich_editor/flutter_rich_editor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        FlutterQuillLocalizations.delegate,
      ],
      home: const EditorPage(),
    );
  }
}

class EditorPage extends StatefulWidget {
  const EditorPage({super.key});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  late final RichEditorController editorController;

  @override
  void initState() {
    super.initState();
    editorController = RichEditorController();
  }

  @override
  void dispose() {
    editorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rich Editor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: RichEditor(
          controller: editorController,
          config: const RichEditorConfig(
            hintText: 'Start writing...',
            minHeight: 300,
          ),
        ),
      ),
    );
  }
}
```

## 🎨 Customization

`RichEditorConfig` provides several options for customizing the editor.

```dart
RichEditor(
  controller: editorController,
  config: const RichEditorConfig(
    hintText: 'Write your content here...',
    minHeight: 300,
    fontSize: 16,
    borderRadius: 16,
    backgroundColor: Colors.white,
    toolbarBackgroundColor: Color(0xFFF7F8FA),
    borderColor: Color(0xFFE1E4E8),
    focusedBorderColor: Color(0xFF2563EB),
    textColor: Color(0xFF1F2937),
    padding: EdgeInsets.all(16),
  ),
)
```

## 🛠️ Toolbar Configuration

Individual toolbar features can be enabled or disabled.

```dart
RichEditor(
  controller: editorController,
  config: const RichEditorConfig(
    showToolbar: true,
    showFontFamily: true,
    showFontSize: true,
    showBold: true,
    showItalic: true,
    showUnderline: true,
    showStrikeThrough: true,
    showTextColor: true,
    showHighlightColor: true,
    showAlignment: true,
    showLists: true,
    showLink: true,
    showUndoRedo: true,
    showClearFormat: true,
  ),
)
```

For example, to create a minimal editor:

```dart
RichEditor(
  controller: editorController,
  config: const RichEditorConfig(
    showFontFamily: false,
    showFontSize: false,
    showTextColor: false,
    showHighlightColor: false,
    showAlignment: false,
    showLists: false,
    showLink: false,
  ),
)
```

## 🔒 Read-Only Mode

The editor can be displayed without the editing toolbar.

```dart
RichEditor(
  controller: editorController,
  config: const RichEditorConfig(
    readOnly: true,
    showToolbar: false,
  ),
)
```

This is useful for displaying previously created rich text content.

## 🎯 Autofocus

Enable autofocus when the editor should receive focus automatically.

```dart
RichEditor(
  controller: editorController,
  config: const RichEditorConfig(
    autofocus: true,
  ),
)
```

## 📄 Get Plain Text

Retrieve the plain text entered by the user:

```dart
final text = editorController.plainText;

print(text);
```

## 📋 Get Delta Data

Retrieve the editor's structured Delta representation:

```dart
final delta = editorController.delta;

print(delta);
```

The Delta can be stored in a database or used for further processing.

## 🧰 RichEditorUtils

The package also provides utility methods for working with the editor.

```dart
import 'package:flutter_rich_editor/flutter_rich_editor.dart';
```

### Get Content

```dart
final content = RichEditorUtils.getContent(
  editorController.controller,
);

print(content.plainText);
print(content.delta);
```

### Get Plain Text

```dart
final text = RichEditorUtils.getPlainText(
  editorController.controller,
);
```

### Get JSON

```dart
final json = RichEditorUtils.getJson(
  editorController.controller,
);
```

### Get Delta

```dart
final delta = RichEditorUtils.getDelta(
  editorController.controller,
);
```

### Check Empty Content

```dart
final isEmpty = RichEditorUtils.isEmpty(
  editorController.controller,
);
```

## 📦 RichEditorContent

`RichEditorContent` provides both plain text and structured Delta data.

```dart
final content = RichEditorContent.fromController(
  editorController.controller,
);

print(content.plainText);
print(content.delta);
print(content.json);
```

### Empty Content

```dart
final emptyContent = RichEditorContent.empty();
```

## 🧩 Controller

`RichEditorController` provides access to the editor state.

```dart
final controller = RichEditorController();
```

Available properties:

```dart
controller.controller
controller.plainText
controller.delta
```

Always dispose the controller when it is no longer required:

```dart
@override
void dispose() {
  controller.dispose();
  super.dispose();
}
```

## 🏗️ Package Structure

```text
flutter_rich_editor/
│
├── example/
│   ├── assets/
│   │   └── rich_editor.gif
│   ├── lib/
│   │   └── main.dart
│   ├── test/
│   │   └── widget_test.dart
│   └── pubspec.yaml
│
├── lib/
│   ├── flutter_rich_editor.dart
│   │
│   └── src/
│       ├── models/
│       │   ├── rich_editor_config.dart
│       │   └── rich_editor_content.dart
│       │
│       ├── utils/
│       │   └── rich_editor_utils.dart
│       │
│       └── widgets/
│           ├── rich_editor.dart
│           ├── rich_editor_controller.dart
│           └── rich_editor_toolbar.dart
│
├── test/
├── assets/
├── CHANGELOG.md
├── LICENSE
├── README.md
└── pubspec.yaml
```

## 🔧 Requirements

| Requirement   | Version          |
| ------------- | ---------------- |
| Flutter       | `>=3.0.0`        |
| Dart          | `>=3.0.0 <4.0.0` |
| flutter_quill | `11.5.0`         |

The package is designed for modern Flutter applications and uses `flutter_quill` internally for rich text editing.

## 🧪 Testing

Run static analysis:

```bash
flutter analyze
```

Run package tests:

```bash
flutter test
```

Run the example application:

```bash
cd example
flutter run
```

## 📱 Example App

The repository contains a complete example application demonstrating:

* Rich text editing
* Toolbar formatting
* Text styling
* Lists
* Alignment
* Colors
* Links
* Undo/redo
* Content preview
* Controller usage
* Custom editor configuration

The demo GIF is available at:

```text
example/assets/rich_editor.gif
```

## ⚡ Performance

`flutter_rich_editor` is designed to remain lightweight at the package level while delegating rich text rendering and document management to `flutter_quill`.

For best performance:

* Reuse a `RichEditorController`
* Dispose controllers when no longer needed
* Avoid unnecessarily rebuilding the editor
* Use read-only mode when editing is not required

## 🔐 Data Handling

The package does not automatically upload or store your editor content.

You are responsible for deciding how the following data should be stored:

* Plain text
* Delta data
* JSON representation

For example:

```dart
final json = editorController.delta;
```

You can serialize the data and store it in your preferred backend or local database.

## 🤝 Contributing

Contributions are welcome.

### 1. Fork the repository

Create your own fork of the project.

### 2. Clone the repository

```bash
git clone https://github.com/sufiyanshaikh-1304/flutter_rich_editor.git
```

### 3. Enter the project

```bash
cd flutter_rich_editor
```

### 4. Get dependencies

```bash
flutter pub get
```

### 5. Run tests

```bash
flutter test
```

### 6. Run analysis

```bash
flutter analyze
```

### 7. Create a pull request

Create a feature branch, commit your changes, push the branch, and open a pull request.

## 📄 License

This project is licensed under the MIT License.

MIT License
 
Copyright (c) 2026 Excelsior Technologies
 
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
 
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE. 

## 👨‍💻 Author

Developed as a Flutter package for modern mobile application development.

**Flutter Rich Editor**
Built with Flutter and Dart.
