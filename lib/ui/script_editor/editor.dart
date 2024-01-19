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
import 'package:flutter/material.dart';

class TextEditor extends StatefulWidget {
  TextEditor({super.key});

  final TextEditingController controller =
      TextEditingController(text: '!#/bin/bash\n\n');

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(color: Color(0xFF0D0D0D)),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                width: screenSize.width * .02,
                height: screenSize.height,
                child: ListView.builder(
                  itemCount: widget.controller.text.split('\n').length,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.0),
                      child: Text(
                        '-',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
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
            width: screenSize.width * .68,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                cursorOpacityAnimates: true,
                cursorColor: const Color(0x90C1C1C1),
                style: const TextStyle(
                    leadingDistribution: TextLeadingDistribution.even,
                    color: Colors.white,
                    fontSize: 16.0,
                    fontFamily: 'Courier New'),
                controller: widget.controller,
                maxLines: null,
                minLines: null,
                expands: true,
                onChanged: (text) {
                  setState(() {
                    widget.controller.text =
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
