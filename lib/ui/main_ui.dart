import 'package:flutter/material.dart';
import 'package:scriptflow_gui/ui/script_editor/editor.dart';

class ScriptFlowApp extends StatefulWidget {
  const ScriptFlowApp({super.key});

  @override
  State<ScriptFlowApp> createState() => _ScriptFlowAppState();
}

class _ScriptFlowAppState extends State<ScriptFlowApp> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: Center(
          child: Row(
            children: [
              DecoratedBox(
                  decoration: const BoxDecoration(color: Color(0xFF0D0D0D)),
                  child: SizedBox(
                    width: 50,
                    height: screenSize.height,
                  )), // Left Context Menu
              DecoratedBox(
                  decoration: const BoxDecoration(color: Color(0xFF141414)),
                  child: SizedBox(
                    width: 400,
                    height: screenSize.height,
                  )), // List Menu (flows or logs)
              Column(
                children: [
                  DecoratedBox(
                      decoration: const BoxDecoration(color: Color(0xFF1E1E1E)),
                      child: SizedBox(
                        width: screenSize.width - 450,
                        height: screenSize.height * .78,
                        child: const TextEditor(),
                      )), // Script Editor
                  Column(
                    children: [
                      DecoratedBox(
                          decoration: const BoxDecoration(color: Color(0xFF0D0D0D)),
                          child: SizedBox(
                              width: screenSize.width - 450,
                              height: screenSize.height * .02)), // Logger Header
                      DecoratedBox(
                          decoration: const BoxDecoration(color: Color(0xFF141414)),
                          child: SizedBox(
                            width: screenSize.width - 450,
                            height: screenSize.height * .20,
                          )), // Logger
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
