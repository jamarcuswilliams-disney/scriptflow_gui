// TODO: create a row of texts and textfields for the script editor
// The script editor is a text editor that allows the user to write a script
// that will be executed when the user presses the "Run" button.
// When a user is typing in the script editor, the script is not executed.
// The script is only executed when the user presses the "Run" button.
// The script editor will consist of a growable list of rows of texts and textfields formatter as follows:
// 1      <enter script here>
// 2      <enter script here>
// 3      <enter script here>
//
// this text will parse into one script with every line separated by a newline character
// when the user presses the "Run" button, the script will be executed
// empty lines will be ignored
// numbers on each line will be ignored (not part of the script)
// lines that start with a # will be ignored
// lines that start with a #! will be ignored
// basically building an IDE for the user to write scripts
// The ScriptEditor class will be able to take in a script and parse it into formatted text and textfields
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextEditor extends StatefulWidget {
  const TextEditor({super.key});

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  final TextEditingController _controller =
      TextEditingController(text: '!#/bin/bash\n\n');

  // disable backspace if the cursor is on the initial shebang line
  void _onBackspace() {
    if (_controller.selection.baseOffset <= 12) {
      _controller.selection =
          TextSelection.fromPosition(const TextPosition(offset: 12));
    }

    if (_controller.text.isEmpty || _controller.selection.baseOffset == 0) {
      _controller.text = '!#/bin/bash\n\n';
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var availableWidth = screenSize.width - 500;
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(color: Color(0xFF0D0D0D)),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                width: 50,
                child: ListView.builder(
                  itemCount: _controller.text.split('\n').length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1.0),
                      child: Text(
                        '${index + 1}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color(0x90C1C1C1),
                            fontSize: 16.0,
                            fontFamily: 'Courier New'),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            width: availableWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                cursorOpacityAnimates: true,
                cursorColor: const Color(0x90C1C1C1),
                style: const TextStyle(
                  leadingDistribution: TextLeadingDistribution.even,
                    color: Color(0x90C1C1C1),
                    fontSize: 16.0,
                    fontFamily: 'Courier New'),
                controller: _controller,
                maxLines: null,
                minLines: null,
                expands: true,
                onChanged: (text) {
                  setState(() {
                    _onBackspace();
                    _controller.text =
                        text; // TODO: [riverpod] use state notifier for script editor
                  });
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      color: Color(0x90C1C1C1),
                      fontSize: 8.0,
                      fontFamily: 'Courier New'),
                ),
              ),
            ),
          ) // Left Context Menu
        ]);
  }
}
