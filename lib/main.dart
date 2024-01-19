import 'package:flutter/material.dart';
import 'package:scriptflow_gui/initialize_app.dart';

import 'ui/main_ui.dart';

void main() async {
  await Bootstrapper.initialize();
  runApp(const MaterialApp(
    title: 'ScriptFlow',
    home: ScriptFlowApp(),
  ));
  /// TODO List
  /// 1. Create Flow Manager
  /// 2. Create Script writing UI
  /// 3. Create Logger UI
  /// 4. List Flows in UI
}