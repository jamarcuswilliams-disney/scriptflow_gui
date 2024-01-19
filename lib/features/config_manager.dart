import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

import '../models/sf_config.dart';

class SFConfigManager {
  SFConfigManager._({required SFConfig config});

  static SFConfig _config = SFConfig.defaultConfig;

  /// load Configuration from lib/config/config.json
  static Future<SFConfigManager> loadConfiguration() async {
    final config = await rootBundle.loadString('config/config.json');
    final json = jsonDecode(config);
    _config = SFConfig.fromJson(json);
    return SFConfigManager._(config: _config);
  }

  /// get Configuration from _config
  SFConfig getConfiguration() => _config;

  Future<void> resetConfiguration() async {
    final config = SFConfig.defaultConfig;
    _config = config;
    await saveConfiguration(config);
  }

  /// save Configuration to lib/config/config.json
  Future<void> saveConfiguration(SFConfig config) async {
    final json = jsonEncode(config);
    final File file = File('config/config.json');
    await file.writeAsString(json);
  }
}
