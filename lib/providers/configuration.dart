import 'package:ScriptFlow/features/config_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final configurationProvider = FutureProvider<SFConfigManager>((ref) {
  final manager = SFConfigManager.loadConfiguration();
  return manager;
});
