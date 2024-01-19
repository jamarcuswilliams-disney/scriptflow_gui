import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'initialize_app.dart';
import 'ui/main_ui.dart';

void main() async {
  await Bootstrapper.initialize();
  runApp(const ProviderScope(
    child: MaterialApp(
      title: 'ScriptFlow',
      home: ScriptFlowApp(),
    ),
  ));

  /// TODO List
  /// 1. Create Flow Manager
  /// 2. Create Script writing UI
  /// 3. Create Logger UI
  /// 4. List Flows in UI
}
