import 'package:ScriptFlow/models/sf_config.dart';
import 'package:ScriptFlow/providers/configuration.dart';
import 'package:ScriptFlow/ui/script_editor/editor.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScriptFlowApp extends ConsumerStatefulWidget {
  const ScriptFlowApp({super.key});

  @override
  ConsumerState createState() => _ScriptFlowAppState();
}

class _ScriptFlowAppState extends ConsumerState<ScriptFlowApp> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController scriptController = TextEditingController();
  final mat.ExpansionTileController loggerController =
      mat.ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    final config = ref.watch(configurationProvider);
    var screenSize = MediaQuery.of(context).size;

    var leftContextMenuWidth = screenSize.width * 0.05;
    var listMenuWidth = screenSize.width * .25;
    var scriptHeaderWidth = screenSize.width * .7;
    var actionPathBarWidth = screenSize.width * .7;
    var scriptSpace = Size(screenSize.width * .7, screenSize.height * .88);
    var loggerSpace = Size(screenSize.width * .7, screenSize.height * .05);

    return mat.Scaffold(
        body: Center(
      child: Row(
        children: [
          DecoratedBox(
              decoration: const BoxDecoration(color: Color(0xFF0D0D0D)),
              child: SizedBox(
                width: leftContextMenuWidth,
                height: screenSize.height,
              )), // Left Context Menu
          DecoratedBox(
              decoration: const BoxDecoration(color: Color(0xFF141414)),
              child: SizedBox(
                width: listMenuWidth,
                height: screenSize.height,
              )), // List Menu (flows or logs)
          Column(
            children: [
              DecoratedBox(
                decoration: const BoxDecoration(color: Color(0xFF1E1E1E)),
                child: SizedBox(
                  width: scriptHeaderWidth,
                  height: screenSize.height * .05,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: mat.TextField(
                      controller: titleController,
                      textAlignVertical: TextAlignVertical.top,
                      cursorOpacityAnimates: true,
                      cursorColor: const Color(0x90C1C1C1),
                      style: const TextStyle(
                          leadingDistribution: TextLeadingDistribution.even,
                          color: Color(0x90C1C1C1),
                          fontSize: 24.0,
                          fontFamily: 'Courier New'),
                      maxLines: 1,
                    ),
                  ),
                ),
              ), // Script Header TODO: Add script name
              DecoratedBox(
                  decoration: const BoxDecoration(color: Color(0xFF141414)),
                  child: SizedBox(
                      width: actionPathBarWidth,
                      height: screenSize.height *
                          .02)), // Script Action Path TODO: Add script name
              DecoratedBox(
                  decoration: const BoxDecoration(color: Color(0xFF1E1E1E)),
                  child: SizedBox(
                    height: scriptSpace.height,
                    width: scriptSpace.width,
                    child: Stack(alignment: Alignment.bottomRight, children: [
                      TextEditor(),
                      DecoratedBox(
                        decoration:
                            const BoxDecoration(color: Color(0xFF0D0D0D)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 2.0),
                          child: Text(
                            // config.value != null
                            //     ? config.value!.getConfiguration().terminalProfile
                            //     :
                            SFConfig.defaultConfig.terminalProfile,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ]),
                  )), // Script Editor
              SizedBox(
                width: loggerSpace.width,
                height: loggerSpace.height,
                child: mat.ExpansionTile(
                  title: const Text('Logger'),
                  backgroundColor: const Color(0xFF0D0D0D),
                  collapsedBackgroundColor: const Color(0xFF141414),
                  textColor: Colors.white,
                  collapsedTextColor: Colors.white,
                  leading: const mat.Icon(
                    FluentIcons.script,
                    color: Color(0xFF466131),
                    size: 15.0,
                  ),
                  children: const [Text('Hello World')],
                  onExpansionChanged: (isExpanded) {
                    setState(() {
                      if (isExpanded) {
                        scriptSpace = screenSize * .7;
                        loggerSpace = Size(
                            screenSize.width * .7, screenSize.height * .28);
                      } else {
                        scriptSpace = Size(
                            screenSize.width * .7, screenSize.height * .88);
                        loggerSpace = Size(
                            screenSize.width * .7, screenSize.height * .05);
                      }
                    });
                  },
                ),
              ) // Logger
            ],
          ),
        ],
      ),
    ));
  }
}
